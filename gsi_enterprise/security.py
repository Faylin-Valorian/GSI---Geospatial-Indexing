from __future__ import annotations

import secrets
import time
from datetime import timedelta

from flask import current_app, request, session


def get_csrf_token() -> str:
    token = session.get("_csrf_token")
    if not token:
        token = secrets.token_urlsafe(32)
        session["_csrf_token"] = token
    return token


def validate_csrf_for_request() -> bool:
    if request.method in ("GET", "HEAD", "OPTIONS"):
        return True

    if request.path.startswith("/static/"):
        return True

    session_token = session.get("_csrf_token")
    if not session_token:
        return False

    token = (
        request.headers.get("X-CSRF-Token")
        or request.form.get("csrf_token")
        or ""
    )
    return bool(token and token == session_token)


def enforce_session_activity_timeout() -> bool:
    now = int(time.time())
    timeout_minutes = int(current_app.config.get("SESSION_TIMEOUT_MINUTES", 480))
    max_idle = max(60, timeout_minutes * 60)
    last_activity = int(session.get("_last_activity_ts", now))

    expired = bool(session.get("user_id")) and (now - last_activity > max_idle)
    session["_last_activity_ts"] = now
    session.permanent = True
    current_app.permanent_session_lifetime = timedelta(minutes=timeout_minutes)
    return expired
