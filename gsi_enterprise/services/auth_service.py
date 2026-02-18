import random
from datetime import datetime, timedelta, timezone

from werkzeug.security import check_password_hash, generate_password_hash

from gsi_enterprise.db import execute, fetch_one


def _utcnow() -> datetime:
    return datetime.now(timezone.utc)


def _is_domain_allowed(email: str) -> tuple[bool, str]:
    setting = fetch_one(
        "SELECT value FROM app_settings WHERE [key] = 'restrict_registration_domains'"
    )
    restrict = setting and setting["value"] == "1"
    if not restrict:
        return True, ""

    domain = email.split("@")[-1].strip().lower()
    allowed = fetch_one(
        "SELECT TOP 1 1 AS ok FROM domain_policies WHERE domain = ? AND is_enabled = 1",
        (domain,),
    )
    if allowed:
        return True, ""
    return False, "Registration is restricted to approved email domains."


def create_user(username: str, email: str, password: str) -> tuple[bool, str, int | None]:
    allowed, msg = _is_domain_allowed(email)
    if not allowed:
        return False, msg, None

    exists = fetch_one(
        "SELECT TOP 1 id FROM users WHERE username = ? OR email = ?",
        (username.strip(), email.strip().lower()),
    )
    if exists:
        return False, "Username or email already exists.", None

    row = fetch_one(
        """
        INSERT INTO users (username, email, password_hash, role, is_active, is_verified)
        OUTPUT INSERTED.id AS id
        VALUES (?, ?, ?, 'user', 1, 0)
        """,
        (
            username.strip(),
            email.strip().lower(),
            generate_password_hash(password),
        ),
    )

    return True, "Account created. Verification is required.", (row["id"] if row else None)


def generate_and_store_code(user_id: int) -> str:
    code = f"{random.randint(0, 999999):06d}"
    expires_at = _utcnow() + timedelta(minutes=15)

    execute(
        "INSERT INTO verification_codes (user_id, code, expires_at, used_at) VALUES (?, ?, ?, NULL)",
        (user_id, code, expires_at),
    )
    return code


def verify_code(email: str, code: str) -> tuple[bool, str]:
    user = fetch_one(
        "SELECT TOP 1 id FROM users WHERE email = ?",
        (email.strip().lower(),),
    )
    if not user:
        return False, "Account not found."

    rec = fetch_one(
        """
        SELECT TOP 1 id, expires_at, used_at
        FROM verification_codes
        WHERE user_id = ? AND code = ?
        ORDER BY id DESC
        """,
        (user["id"], code.strip()),
    )

    if not rec:
        return False, "Invalid verification code."
    if rec["used_at"]:
        return False, "Code has already been used."

    expires_at = rec["expires_at"]
    if expires_at.tzinfo is None:
        expires_at = expires_at.replace(tzinfo=timezone.utc)

    if expires_at < _utcnow():
        return False, "Verification code has expired."

    now_dt = _utcnow()
    execute("UPDATE verification_codes SET used_at = ? WHERE id = ?", (now_dt, rec["id"]))
    execute("UPDATE users SET is_verified = 1 WHERE id = ?", (user["id"],))
    return True, "Account verified. You can now log in."


def authenticate_user(identity: str, password: str):
    user = fetch_one(
        """
        SELECT TOP 1 id, username, email, password_hash, role, is_active, is_verified
        FROM users
        WHERE username = ? OR email = ?
        """,
        (identity.strip(), identity.strip().lower()),
    )

    if not user:
        return None, "Invalid credentials."
    if not check_password_hash(user["password_hash"], password):
        return None, "Invalid credentials."
    if not user["is_active"]:
        return None, "Your account is inactive. Contact an administrator."
    if not user["is_verified"]:
        return None, "Please verify your email before logging in."

    return user, "Login successful."


def set_user_password(user_id: int, new_password: str) -> int:
    return execute(
        "UPDATE users SET password_hash = ? WHERE id = ?",
        (generate_password_hash(new_password), user_id),
    )
