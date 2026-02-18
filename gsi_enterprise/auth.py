from flask import Blueprint, flash, redirect, render_template, request, session, url_for

from gsi_enterprise.core.decorators import login_required
from gsi_enterprise.db import fetch_one
from gsi_enterprise.services.audit_service import log_audit_event
from gsi_enterprise.services.permission_service import has_module_access
from gsi_enterprise.services.security_service import client_ip, is_rate_limited, record_security_event
from gsi_enterprise.services.auth_service import (
    authenticate_user,
    create_user,
    generate_and_store_code,
    verify_code,
)
from gsi_enterprise.services.email_service import send_verification_code

auth_bp = Blueprint("auth", __name__, url_prefix="/auth")


def _redirect_if_active_session():
    user_id = session.get("user_id")
    if not user_id:
        return None
    if has_module_access(user_id, session.get("role"), "map_dashboard"):
        return redirect(url_for("main.dashboard"))
    session.clear()
    flash("Your account does not currently have dashboard access.", "warning")
    return None


@auth_bp.get("/register")
def register_page():
    maybe_redirect = _redirect_if_active_session()
    if maybe_redirect:
        return maybe_redirect
    return render_template("auth/register.html")


@auth_bp.post("/register")
def register_submit():
    username = request.form.get("username", "").strip()
    email = request.form.get("email", "").strip().lower()
    password = request.form.get("password", "")

    if not username or not email or not password:
        flash("All fields are required.", "danger")
        return redirect(url_for("auth.register_page"))

    register_subject = f"register:{client_ip()}"
    if is_rate_limited(
        "register_attempt",
        subject=register_subject,
        max_attempts=8,
        window_seconds=3600,
    ):
        flash("Too many registration attempts. Try again later.", "danger")
        return redirect(url_for("auth.register_page"))
    record_security_event("register_attempt", subject=register_subject, details={"email": email})

    ok, msg, user_id = create_user(username, email, password)
    if not ok or not user_id:
        record_security_event("register_failed", subject=register_subject, details={"message": msg})
        flash(msg, "danger")
        return redirect(url_for("auth.register_page"))

    code = generate_and_store_code(user_id)
    sent, send_msg = send_verification_code(email, username, code)

    if sent:
        log_audit_event(
            "user_registered",
            actor_user_id=user_id,
            target_type="user",
            target_id=str(user_id),
            details={"email": email},
        )
        flash("Registration successful. Check your email for verification code.", "success")
    else:
        flash(send_msg, "warning")

    return redirect(url_for("auth.verify_page", email=email))


@auth_bp.get("/verify")
def verify_page():
    maybe_redirect = _redirect_if_active_session()
    if maybe_redirect:
        return maybe_redirect
    prefill_email = request.args.get("email", "")
    return render_template("auth/verify.html", prefill_email=prefill_email)


@auth_bp.post("/verify")
def verify_submit():
    email = request.form.get("email", "").strip().lower()
    code = request.form.get("code", "").strip()

    ok, msg = verify_code(email, code)
    if ok:
        user = fetch_one("SELECT TOP 1 id FROM users WHERE email = ?", (email,))
        log_audit_event(
            "user_verified",
            actor_user_id=(user["id"] if user else None),
            target_type="user",
            target_id=(str(user["id"]) if user else ""),
            details={"email": email},
        )
    else:
        record_security_event("verify_failed", subject=f"verify:{email}")
    flash(msg, "success" if ok else "danger")
    if ok:
        return redirect(url_for("auth.login"))
    return redirect(url_for("auth.verify_page", email=email))


@auth_bp.post("/verify/resend")
def resend_code():
    email = request.form.get("email", "").strip().lower()
    user = fetch_one(
        "SELECT TOP 1 id, username, is_verified FROM users WHERE email = ?",
        (email,),
    )
    resend_subject = f"resend:{email}:{client_ip()}"
    if is_rate_limited(
        "verify_resend_attempt",
        subject=resend_subject,
        max_attempts=5,
        window_seconds=1800,
    ):
        flash("Too many resend attempts. Please wait and try again.", "danger")
        return redirect(url_for("auth.verify_page", email=email))
    record_security_event("verify_resend_attempt", subject=resend_subject, details={"email": email})

    if not user:
        record_security_event("verify_resend_failed", subject=resend_subject, details={"reason": "account_not_found"})
        flash("Account not found.", "danger")
        return redirect(url_for("auth.verify_page", email=email))

    if user["is_verified"]:
        flash("Account is already verified.", "info")
        return redirect(url_for("auth.login"))

    code = generate_and_store_code(user["id"])
    sent, msg = send_verification_code(email, user["username"], code)
    if sent:
        log_audit_event(
            "verification_code_resent",
            actor_user_id=user["id"],
            target_type="user",
            target_id=str(user["id"]),
            details={"email": email},
        )
    flash(msg if sent else msg, "success" if sent else "danger")
    return redirect(url_for("auth.verify_page", email=email))


@auth_bp.get("/login")
def login():
    maybe_redirect = _redirect_if_active_session()
    if maybe_redirect:
        return maybe_redirect
    return render_template("auth/login.html")


@auth_bp.post("/login")
def login_submit():
    identity = request.form.get("identity", "").strip()
    password = request.form.get("password", "")

    if not identity or not password:
        flash("Username/email and password are required.", "danger")
        return redirect(url_for("auth.login"))

    login_subject = f"login:{identity.lower()}:{client_ip()}"
    if is_rate_limited(
        "login_failed",
        subject=login_subject,
        max_attempts=10,
        window_seconds=900,
    ):
        flash("Too many failed login attempts. Please wait before trying again.", "danger")
        return redirect(url_for("auth.login"))

    user, msg = authenticate_user(identity, password)
    if not user:
        record_security_event("login_failed", subject=login_subject, details={"identity": identity})
        flash(msg, "danger")
        return redirect(url_for("auth.login"))

    record_security_event("login_success", subject=f"login:{identity.lower()}", user_id=user["id"])
    session.clear()
    session["user_id"] = user["id"]
    session["username"] = user["username"]
    session["email"] = user["email"]
    session["role"] = user["role"]
    session.permanent = True
    log_audit_event(
        "login_success",
        actor_user_id=user["id"],
        target_type="user",
        target_id=str(user["id"]),
    )

    flash("Welcome back.", "success")
    return redirect(url_for("main.dashboard"))


@auth_bp.post("/logout")
@login_required
def logout_submit():
    log_audit_event(
        "logout",
        actor_user_id=session.get("user_id"),
        target_type="user",
        target_id=str(session.get("user_id", "")),
    )
    session.clear()
    flash("You have been logged out.", "info")
    return redirect(url_for("auth.login"))
