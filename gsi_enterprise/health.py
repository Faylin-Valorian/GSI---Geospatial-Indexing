from __future__ import annotations

from flask import Blueprint, current_app, jsonify

from gsi_enterprise.db import fetch_one

health_bp = Blueprint("health", __name__, url_prefix="/health")


@health_bp.get("/live")
def live() -> tuple[object, int]:
    return jsonify({"status": "ok"}), 200


@health_bp.get("/ready")
def ready() -> tuple[object, int]:
    try:
        row = fetch_one("SELECT 1 AS ok")
        db_ok = bool(row and row["ok"] == 1)
    except Exception as exc:
        return jsonify({"status": "not_ready", "db": False, "error": str(exc)}), 503

    secret_ok = current_app.config.get("SECRET_KEY", "") != "dev-secret-change-me"
    return (
        jsonify({"status": "ready" if db_ok else "not_ready", "db": db_ok, "secret_key_configured": secret_ok}),
        (200 if db_ok else 503),
    )
