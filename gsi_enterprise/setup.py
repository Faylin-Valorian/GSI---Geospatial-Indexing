from __future__ import annotations

import re
import secrets
from pathlib import Path

import pyodbc
from flask import Blueprint, current_app, flash, redirect, render_template, request, session, url_for
from werkzeug.security import generate_password_hash

from gsi_enterprise.services.audit_service import log_audit_event
from gsi_enterprise.services.geography_seed_service import ensure_counties_seeded_from_csv, ensure_states_seeded
from gsi_enterprise.services.migration_service import apply_pending_migrations
from gsi_enterprise.setup_state import is_setup_ready

setup_bp = Blueprint("setup", __name__, url_prefix="/setup")

_GO_SPLIT_RE = re.compile(r"^\s*GO\s*$", flags=re.IGNORECASE | re.MULTILINE)
_DB_NAME_RE = re.compile(r"^[A-Za-z0-9_]+$")


def _available_sqlserver_odbc_drivers() -> list[str]:
    return [
        driver
        for driver in pyodbc.drivers()
        if "sql server" in driver.lower()
    ]


def _default_odbc_driver() -> str:
    drivers = _available_sqlserver_odbc_drivers()
    preferred = [
        "ODBC Driver 18 for SQL Server",
        "ODBC Driver 17 for SQL Server",
        "SQL Server",
    ]
    for item in preferred:
        if item in drivers:
            return item
    return drivers[0] if drivers else "ODBC Driver 18 for SQL Server"


def _normalize_driver(driver: str) -> str:
    cleaned = driver.strip()
    if cleaned.startswith("{") and cleaned.endswith("}"):
        cleaned = cleaned[1:-1]
    return cleaned


def _build_connection_string(
    driver: str,
    server: str,
    database: str,
    username: str,
    password: str,
    encrypt: bool,
    trust_cert: bool,
) -> str:
    return (
        f"Driver={{{_normalize_driver(driver)}}};"
        f"Server={server.strip()};"
        f"Database={database.strip()};"
        f"UID={username.strip()};"
        f"PWD={password};"
        f"Encrypt={'yes' if encrypt else 'no'};"
        f"TrustServerCertificate={'yes' if trust_cert else 'no'};"
    )


def _write_env(values: dict[str, str]) -> None:
    env_path = Path(__file__).resolve().parents[1] / ".env"
    merged: dict[str, str] = {}

    if env_path.exists():
        for raw_line in env_path.read_text(encoding="utf-8").splitlines():
            line = raw_line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            key, value = line.split("=", 1)
            merged[key.strip()] = value.strip()

    merged.update(values)
    output = [f"{k}={v}" for k, v in sorted(merged.items())]
    env_path.write_text("\n".join(output) + "\n", encoding="utf-8")


def _run_schema_bootstrap(master_connection_string: str, database_name: str) -> None:
    project_root = Path(__file__).resolve().parents[1]
    preferred_path = project_root / "db" / "baseline" / "V0001__bootstrap_core.sql"
    fallback_path = project_root / "db" / "compat" / "mssql_schema.sql"
    schema_path = preferred_path if preferred_path.exists() else fallback_path
    script = schema_path.read_text(encoding="utf-8")
    script = script.replace("GSIEnterprise", database_name)

    batches = [batch.strip() for batch in _GO_SPLIT_RE.split(script) if batch.strip()]
    conn = pyodbc.connect(master_connection_string, autocommit=True)
    try:
        cursor = conn.cursor()
        for batch in batches:
            cursor.execute(batch)
    finally:
        conn.close()


def _seed_initial_admin(db_connection_string: str, username: str, email: str, password: str) -> None:
    conn = pyodbc.connect(db_connection_string)
    try:
        cursor = conn.cursor()
        cursor.execute(
            "SELECT TOP 1 id FROM users WHERE email = ? OR username = ?",
            (email.strip().lower(), username.strip()),
        )
        row = cursor.fetchone()
        hashed = generate_password_hash(password)

        if row:
            cursor.execute(
                """
                UPDATE users
                SET role = 'admin',
                    is_active = 1,
                    is_verified = 1,
                    password_hash = ?
                WHERE id = ?
                """,
                (hashed, row[0]),
            )
        else:
            cursor.execute(
                """
                INSERT INTO users (username, email, password_hash, role, is_active, is_verified)
                VALUES (?, ?, ?, 'admin', 1, 1)
                """,
                (username.strip(), email.strip().lower(), hashed),
            )

        conn.commit()
    finally:
        conn.close()


def _set_setup_locked(db_connection_string: str) -> None:
    conn = pyodbc.connect(db_connection_string)
    try:
        cursor = conn.cursor()
        cursor.execute(
            """
            IF EXISTS (SELECT 1 FROM app_settings WHERE [key] = 'setup_locked')
                UPDATE app_settings SET value = '1' WHERE [key] = 'setup_locked'
            ELSE
                INSERT INTO app_settings ([key], value) VALUES ('setup_locked', '1')
            """
        )
        conn.commit()
    finally:
        conn.close()


@setup_bp.get("")
def setup_page():
    if is_setup_ready():
        return redirect(url_for("auth.login"))
    drivers = _available_sqlserver_odbc_drivers()
    return render_template(
        "setup/initial_setup.html",
        odbc_drivers=drivers,
        default_odbc_driver=_default_odbc_driver(),
    )


@setup_bp.post("")
def setup_submit():
    if is_setup_ready():
        return redirect(url_for("auth.login"))

    driver = request.form.get("db_driver", _default_odbc_driver()).strip()
    server = request.form.get("db_server", "").strip()
    database = request.form.get("db_name", "GSIEnterprise").strip()
    username = request.form.get("db_user", "").strip()
    password = request.form.get("db_password", "")
    encrypt = request.form.get("db_encrypt") == "on"
    trust_cert = request.form.get("db_trust_cert") == "on"

    admin_username = request.form.get("admin_username", "").strip()
    admin_email = request.form.get("admin_email", "").strip().lower()
    admin_password = request.form.get("admin_password", "")

    smtp_host = request.form.get("smtp_host", "").strip()
    smtp_port = request.form.get("smtp_port", "587").strip() or "587"
    smtp_user = request.form.get("smtp_user", "").strip()
    smtp_pass = request.form.get("smtp_pass", "")
    smtp_from = request.form.get("smtp_from", "").strip()
    smtp_tls = "1" if request.form.get("smtp_tls") == "on" else "0"

    secret_key = request.form.get("secret_key", "").strip() or secrets.token_hex(32)

    if (
        not server
        or not username
        or not password
        or not admin_username
        or not admin_email
        or not admin_password
    ):
        flash("Database and initial admin fields are required.", "danger")
        return redirect(url_for("setup.setup_page"))

    if not _DB_NAME_RE.fullmatch(database):
        flash("Database name must use only letters, numbers, and underscores.", "danger")
        return redirect(url_for("setup.setup_page"))

    if "@" not in admin_email:
        flash("Admin email must be valid.", "danger")
        return redirect(url_for("setup.setup_page"))

    try:
        smtp_port_num = int(smtp_port)
    except ValueError:
        flash("SMTP port must be a valid number.", "danger")
        return redirect(url_for("setup.setup_page"))

    master_conn_str = _build_connection_string(
        driver=driver,
        server=server,
        database="master",
        username=username,
        password=password,
        encrypt=encrypt,
        trust_cert=trust_cert,
    )
    app_conn_str = _build_connection_string(
        driver=driver,
        server=server,
        database=database,
        username=username,
        password=password,
        encrypt=encrypt,
        trust_cert=trust_cert,
    )

    try:
        _run_schema_bootstrap(master_conn_str, database)
        apply_pending_migrations(app_conn_str)
        ensure_states_seeded(app_conn_str)
        ensure_counties_seeded_from_csv(app_conn_str)
        _seed_initial_admin(app_conn_str, admin_username, admin_email, admin_password)
        _set_setup_locked(app_conn_str)
    except pyodbc.Error as exc:
        err_text = str(exc)
        if "IM002" in err_text:
            installed = _available_sqlserver_odbc_drivers()
            if installed:
                flash(
                    "ODBC driver not found for the selected name. Installed SQL Server drivers: "
                    + ", ".join(installed),
                    "danger",
                )
            else:
                flash(
                    "No SQL Server ODBC driver is installed. Install Microsoft ODBC Driver 18 for SQL Server, then retry setup.",
                    "danger",
                )
        else:
            flash(f"Setup failed while connecting or initializing SQL Server: {exc}", "danger")
        return redirect(url_for("setup.setup_page"))

    _write_env(
        {
            "GSI_SECRET_KEY": secret_key,
            "GSI_MSSQL_CONNECTION_STRING": app_conn_str,
            "GSI_SMTP_HOST": smtp_host,
            "GSI_SMTP_PORT": smtp_port,
            "GSI_SMTP_USER": smtp_user,
            "GSI_SMTP_PASS": smtp_pass,
            "GSI_SMTP_FROM": smtp_from,
            "GSI_SMTP_USE_TLS": smtp_tls,
        }
    )

    current_app.config["SECRET_KEY"] = secret_key
    current_app.config["MSSQL_CONNECTION_STRING"] = app_conn_str
    current_app.config["SMTP_HOST"] = smtp_host
    current_app.config["SMTP_PORT"] = smtp_port_num
    current_app.config["SMTP_USER"] = smtp_user
    current_app.config["SMTP_PASS"] = smtp_pass
    current_app.config["SMTP_FROM"] = smtp_from
    current_app.config["SMTP_USE_TLS"] = smtp_tls == "1"

    session.clear()
    log_audit_event(
        "setup_completed",
        actor_user_id=None,
        target_type="system",
        target_id="initial_setup",
        details={"database": database, "server": server},
    )
    flash("Initial setup completed. You can now log in with your admin account.", "success")
    return redirect(url_for("auth.login"))
