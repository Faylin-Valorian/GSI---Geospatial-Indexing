import traceback
import uuid
from threading import Thread

import pyodbc
from flask import Flask, Response, flash, g, jsonify, redirect, request, session, url_for
from werkzeug.exceptions import HTTPException

from gsi_enterprise.config import Config
from gsi_enterprise.db import close_db, execute, fetch_one
from gsi_enterprise.security import enforce_session_activity_timeout, get_csrf_token, validate_csrf_for_request
from gsi_enterprise.services.geography_seed_service import ensure_counties_seeded_from_csv, ensure_states_seeded
from gsi_enterprise.services.migration_service import apply_pending_migrations_on_startup
from gsi_enterprise.services.permission_service import has_module_access
from gsi_enterprise.setup_state import is_setup_locked, is_setup_ready


def _validate_runtime_config(app: Flask) -> None:
    timeout = int(app.config.get("SESSION_TIMEOUT_MINUTES", 0))
    if timeout <= 0:
        raise RuntimeError("GSI_SESSION_TIMEOUT_MINUTES must be greater than 0.")

    secret = str(app.config.get("SECRET_KEY", "")).strip()
    if not secret:
        raise RuntimeError("GSI_SECRET_KEY must be configured.")
    if secret == "dev-secret-change-me":
        app.logger.warning("Using default development secret key. Change GSI_SECRET_KEY for non-dev environments.")


def _run_startup_db_maintenance(app: Flask, conn_str: str) -> None:
    with app.app_context():
        try:
            ensure_states_seeded(conn_str)
            apply_pending_migrations_on_startup(conn_str)
            seeded_count = ensure_counties_seeded_from_csv(conn_str)
            if seeded_count > 0:
                app.logger.info("Seeded missing counties from CSV on startup: %s", seeded_count)
        except Exception:
            app.logger.exception("Failed applying startup DB migrations and geography seeding.")


def create_app() -> Flask:
    app = Flask(
        __name__,
        template_folder="../templates",
        static_folder="../static",
        instance_relative_config=True,
    )
    app.config.from_object(Config)
    _validate_runtime_config(app)

    @app.before_request
    def enforce_setup() -> object | None:
        path = request.path or "/"
        if request.args.get("__debugger__") == "yes":
            return None

        if path.startswith("/static/") or path.startswith("/health") or path == "/favicon.ico":
            return None

        setup_ready = is_setup_ready()
        setup_locked = is_setup_locked() if setup_ready else False

        if path.startswith("/setup"):
            if setup_ready and setup_locked:
                flash("Setup is locked after initialization.", "warning")
                return redirect(url_for("auth.login"))
            return None

        if not setup_ready:
            session.clear()
            return redirect(url_for("setup.setup_page"))

        return None

    @app.before_request
    def security_guards() -> object | None:
        path = request.path or "/"
        if path.startswith("/static/") or path.startswith("/health") or path == "/favicon.ico":
            return None

        g.request_id = str(uuid.uuid4())

        if enforce_session_activity_timeout():
            session.clear()
            flash("Session expired due to inactivity. Please sign in again.", "warning")
            return redirect(url_for("auth.login"))

        if not validate_csrf_for_request():
            if request.path.startswith("/api/") or request.path.startswith("/admin/api/"):
                return jsonify({"success": False, "message": "Invalid CSRF token."}), 400
            flash("Security token invalid or expired. Refresh and try again.", "danger")
            return redirect(request.referrer or url_for("auth.login"))
        return None

    @app.before_request
    def load_logged_in_user() -> None:
        user_id = session.get("user_id")
        g.current_user = None
        if not user_id:
            return

        try:
            row = fetch_one(
                "SELECT id, username, email, role, is_active, is_verified FROM users WHERE id = ?",
                (user_id,),
            )
            if row:
                g.current_user = {
                    "id": row["id"],
                    "username": row["username"],
                    "email": row["email"],
                    "role": row["role"],
                    "is_active": bool(row["is_active"]),
                    "is_verified": bool(row["is_verified"]),
                }
            else:
                session.clear()
        except (RuntimeError, pyodbc.Error):
            session.clear()
            g.current_user = None

    @app.context_processor
    def inject_user_context():
        def can_access(module_key: str) -> bool:
            user = g.get("current_user")
            if not user:
                return False
            return has_module_access(user.get("id"), user.get("role"), module_key)

        return {
            "current_user": g.get("current_user"),
            "csrf_token": get_csrf_token,
            "can_access": can_access,
        }

    @app.after_request
    def apply_security_headers(response: Response) -> Response:
        response.headers["X-Request-ID"] = g.get("request_id", "")
        if app.config.get("SECURITY_HEADERS_ENABLED", True):
            response.headers["X-Content-Type-Options"] = "nosniff"
            response.headers["X-Frame-Options"] = "DENY"
            response.headers["Referrer-Policy"] = "strict-origin-when-cross-origin"
            response.headers["Permissions-Policy"] = "geolocation=(), camera=(), microphone=()"
            response.headers["Cache-Control"] = "no-store"
        return response

    @app.errorhandler(Exception)
    def handle_unexpected_error(exc: Exception):
        if isinstance(exc, HTTPException):
            return exc

        try:
            execute(
                """
                INSERT INTO app_error_logs (request_id, path, method, error_type, error_message, stack_trace, user_id, ip_address)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """,
                (
                    g.get("request_id", ""),
                    request.path[:512],
                    request.method[:16],
                    exc.__class__.__name__[:200],
                    str(exc),
                    traceback.format_exc(),
                    session.get("user_id"),
                    request.headers.get("X-Forwarded-For", request.remote_addr or "")[:64],
                ),
            )
        except Exception:
            app.logger.exception("Unhandled exception (failed DB log)")

        app.logger.exception("Unhandled exception")
        return jsonify({"success": False, "message": "An internal error occurred."}), 500

    app.teardown_appcontext(close_db)

    from gsi_enterprise.routes import main_bp
    from gsi_enterprise.auth import auth_bp
    from gsi_enterprise.admin import admin_bp
    from gsi_enterprise.addons import addons_bp
    from gsi_enterprise.health import health_bp
    from gsi_enterprise.images import images_bp
    from gsi_enterprise.setup import setup_bp

    app.register_blueprint(main_bp)
    app.register_blueprint(auth_bp)
    app.register_blueprint(admin_bp)
    app.register_blueprint(addons_bp)
    app.register_blueprint(health_bp)
    app.register_blueprint(images_bp)
    app.register_blueprint(setup_bp)

    conn_str = str(app.config.get("MSSQL_CONNECTION_STRING", "")).strip()
    if conn_str and bool(app.config.get("STARTUP_DB_MAINTENANCE_ENABLED", True)):
        Thread(target=_run_startup_db_maintenance, args=(app, conn_str), daemon=True).start()

    return app
