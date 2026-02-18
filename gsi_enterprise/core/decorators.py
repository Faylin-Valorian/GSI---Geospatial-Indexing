from functools import wraps
from typing import Callable

from flask import flash, redirect, session, url_for

from gsi_enterprise.services.permission_service import has_module_access


F = Callable[..., object]


def login_required(view: F) -> F:
    @wraps(view)
    def wrapped(*args, **kwargs):
        if not session.get("user_id"):
            flash("Please log in to continue.", "warning")
            return redirect(url_for("auth.login"))
        return view(*args, **kwargs)

    return wrapped  # type: ignore[return-value]


def admin_required(view: F) -> F:
    @wraps(view)
    def wrapped(*args, **kwargs):
        if not session.get("user_id"):
            flash("Please log in to continue.", "warning")
            return redirect(url_for("auth.login"))
        if session.get("role") != "admin":
            flash("Admin access is required.", "danger")
            return redirect(url_for("main.dashboard"))
        if not has_module_access(session.get("user_id"), session.get("role"), "admin_dashboard"):
            flash("You do not have access to Admin Dashboard.", "danger")
            return redirect(url_for("main.dashboard"))
        return view(*args, **kwargs)

    return wrapped  # type: ignore[return-value]


def module_access_required(module_key: str):
    def decorator(view: F) -> F:
        @wraps(view)
        def wrapped(*args, **kwargs):
            if not session.get("user_id"):
                flash("Please log in to continue.", "warning")
                return redirect(url_for("auth.login"))

            allowed = has_module_access(
                session.get("user_id"),
                session.get("role"),
                module_key,
            )
            if not allowed:
                flash("You do not have access to this module.", "danger")
                return redirect(url_for("auth.login"))
            return view(*args, **kwargs)

        return wrapped  # type: ignore[return-value]

    return decorator
