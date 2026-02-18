import smtplib
from email.message import EmailMessage
from flask import current_app

from gsi_enterprise.db import fetch_one


def _resolve_sender_email() -> str:
    row = fetch_one(
        "SELECT TOP 1 value FROM app_settings WHERE [key] = 'verification_from_email'"
    )

    configured = (row["value"] if row else "").strip()
    if configured:
        return configured

    return current_app.config.get("SMTP_FROM", "").strip()


def send_verification_code(email: str, username: str, code: str) -> tuple[bool, str]:
    cfg = current_app.config

    subject = "Your GSI - Geospatial Indexing verification code"
    body = (
        f"Hello {username},\n\n"
        f"Your verification code is: {code}\n"
        "This code expires in 15 minutes.\n\n"
        "If you did not request this, you can ignore this email."
    )

    sender_email = _resolve_sender_email()

    if not cfg.get("SMTP_HOST") or not sender_email:
        current_app.logger.warning(
            "SMTP not fully configured. Verification code for %s is %s", email, code
        )
        return True, "SMTP not fully configured. Code logged to server output for development."

    msg = EmailMessage()
    msg["Subject"] = subject
    msg["From"] = sender_email
    msg["To"] = email
    msg.set_content(body)

    try:
        with smtplib.SMTP(cfg["SMTP_HOST"], cfg["SMTP_PORT"], timeout=15) as server:
            if cfg.get("SMTP_USE_TLS", True):
                server.starttls()
            if cfg.get("SMTP_USER"):
                server.login(cfg["SMTP_USER"], cfg.get("SMTP_PASS", ""))
            server.send_message(msg)
        return True, "Verification code sent."
    except Exception as exc:  # pragma: no cover
        current_app.logger.error("Failed to send email: %s", exc)
        return False, f"Failed to send verification email: {exc}"
