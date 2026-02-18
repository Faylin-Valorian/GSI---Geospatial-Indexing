from flask import Blueprint, current_app, jsonify, redirect, render_template, request, url_for

from gsi_enterprise.core.decorators import admin_required
from gsi_enterprise.db import execute, fetch_all, fetch_one
from gsi_enterprise.services.audit_service import log_audit_event
from gsi_enterprise.services.auth_service import set_user_password
from gsi_enterprise.services.geography_seed_service import ensure_states_seeded

admin_bp = Blueprint("admin", __name__, url_prefix="/admin")


def _json_payload() -> dict:
    return request.get_json(silent=True) or {}


def _bool_setting(key: str, default: bool = False) -> bool:
    row = fetch_one("SELECT value FROM app_settings WHERE [key] = ?", (key,))
    if not row:
        return default
    return str(row.get("value", "")).strip() == "1"


@admin_bp.get("")
@admin_required
def admin_dashboard():
    return redirect(url_for("main.dashboard", overlay="admin"))


@admin_bp.get("/legacy")
@admin_required
def admin_dashboard_legacy():
    return render_template("admin/dashboard.html")


@admin_bp.get("/api/users")
@admin_required
def api_users():
    rows = fetch_all(
        """
        SELECT id, username, email, role, is_active, is_verified
        FROM users
        ORDER BY id DESC
        """
    )
    return jsonify([
        {
            "id": r["id"],
            "username": r["username"],
            "email": r["email"],
            "role": r["role"],
            "is_active": bool(r["is_active"]),
            "is_verified": bool(r["is_verified"]),
        }
        for r in rows
    ])


@admin_bp.post("/api/users/<int:user_id>/role")
@admin_required
def api_set_user_role(user_id: int):
    payload = _json_payload()
    role = payload.get("role", "user")
    if role not in ("user", "admin"):
        return jsonify({"success": False, "message": "Invalid role."}), 400

    execute("UPDATE users SET role = ? WHERE id = ?", (role, user_id))
    log_audit_event("admin_set_user_role", target_type="user", target_id=str(user_id), details={"role": role})
    return jsonify({"success": True})


@admin_bp.post("/api/users/<int:user_id>/status")
@admin_required
def api_set_user_status(user_id: int):
    payload = _json_payload()
    is_active = bool(payload.get("is_active", True))
    execute("UPDATE users SET is_active = ? WHERE id = ?", (1 if is_active else 0, user_id))
    log_audit_event(
        "admin_set_user_status",
        target_type="user",
        target_id=str(user_id),
        details={"is_active": is_active},
    )
    return jsonify({"success": True})


@admin_bp.post("/api/users/<int:user_id>/verify")
@admin_required
def api_set_user_verify(user_id: int):
    payload = _json_payload()
    is_verified = bool(payload.get("is_verified", True))
    execute("UPDATE users SET is_verified = ? WHERE id = ?", (1 if is_verified else 0, user_id))
    log_audit_event(
        "admin_set_user_verify",
        target_type="user",
        target_id=str(user_id),
        details={"is_verified": is_verified},
    )
    return jsonify({"success": True})


@admin_bp.post("/api/users/<int:user_id>/reset-password")
@admin_required
def api_reset_password(user_id: int):
    payload = _json_payload()
    new_password = str(payload.get("new_password", "")).strip()
    if len(new_password) < 12:
        return jsonify({"success": False, "message": "Password must be at least 12 characters."}), 400

    updated = set_user_password(user_id, new_password)
    if updated <= 0:
        return jsonify({"success": False, "message": "User not found."}), 404

    log_audit_event("admin_reset_user_password", target_type="user", target_id=str(user_id))
    return jsonify({"success": True})


@admin_bp.get("/api/domains")
@admin_required
def api_list_domains():
    setting = fetch_one(
        "SELECT value FROM app_settings WHERE [key] = 'restrict_registration_domains'"
    )
    restrict_enabled = bool(setting and setting["value"] == "1")

    domains = fetch_all(
        "SELECT id, domain, is_enabled, created_at FROM domain_policies ORDER BY domain"
    )

    return jsonify(
        {
            "restrict_enabled": restrict_enabled,
            "domains": [
                {
                    "id": d["id"],
                    "domain": d["domain"],
                    "is_enabled": bool(d["is_enabled"]),
                    "created_at": str(d["created_at"]),
                }
                for d in domains
            ],
        }
    )


@admin_bp.post("/api/domains/restriction")
@admin_required
def api_toggle_domain_restriction():
    payload = _json_payload()
    enabled = bool(payload.get("enabled", False))
    execute(
        "UPDATE app_settings SET value = ? WHERE [key] = 'restrict_registration_domains'",
        ("1" if enabled else "0",),
    )
    log_audit_event(
        "admin_set_domain_restriction",
        target_type="app_setting",
        target_id="restrict_registration_domains",
        details={"enabled": enabled},
    )
    return jsonify({"success": True})


@admin_bp.post("/api/domains")
@admin_required
def api_add_domain():
    payload = _json_payload()
    domain = payload.get("domain", "").strip().lower()
    if not domain or "." not in domain:
        return jsonify({"success": False, "message": "Valid domain is required."}), 400

    exists = fetch_one("SELECT TOP 1 id FROM domain_policies WHERE domain = ?", (domain,))
    if exists:
        return jsonify({"success": False, "message": "Domain already exists."}), 409

    execute("INSERT INTO domain_policies (domain, is_enabled) VALUES (?, 1)", (domain,))
    log_audit_event("admin_add_domain_policy", target_type="domain_policy", target_id=domain)
    return jsonify({"success": True})


@admin_bp.post("/api/domains/<int:domain_id>/toggle")
@admin_required
def api_toggle_domain(domain_id: int):
    payload = _json_payload()
    enabled = bool(payload.get("is_enabled", True))
    execute(
        "UPDATE domain_policies SET is_enabled = ? WHERE id = ?",
        (1 if enabled else 0, domain_id),
    )
    log_audit_event(
        "admin_toggle_domain_policy",
        target_type="domain_policy",
        target_id=str(domain_id),
        details={"is_enabled": enabled},
    )
    return jsonify({"success": True})


@admin_bp.delete("/api/domains/<int:domain_id>")
@admin_required
def api_delete_domain(domain_id: int):
    execute("DELETE FROM domain_policies WHERE id = ?", (domain_id,))
    log_audit_event("admin_delete_domain_policy", target_type="domain_policy", target_id=str(domain_id))
    return jsonify({"success": True})


@admin_bp.get("/api/email-settings")
@admin_required
def api_email_settings():
    row = fetch_one(
        "SELECT value FROM app_settings WHERE [key] = 'verification_from_email'"
    )
    return jsonify({"verification_from_email": (row["value"] if row else "")})


@admin_bp.post("/api/email-settings")
@admin_required
def api_update_email_settings():
    payload = _json_payload()
    verification_from_email = payload.get("verification_from_email", "").strip().lower()

    if verification_from_email and ("@" not in verification_from_email or "." not in verification_from_email.split("@")[-1]):
        return jsonify({"success": False, "message": "A valid sender email address is required."}), 400

    execute(
        """
        IF EXISTS (SELECT 1 FROM app_settings WHERE [key] = 'verification_from_email')
            UPDATE app_settings SET value = ? WHERE [key] = 'verification_from_email'
        ELSE
            INSERT INTO app_settings ([key], value) VALUES ('verification_from_email', ?)
        """,
        (verification_from_email, verification_from_email),
    )
    log_audit_event(
        "admin_update_email_setting",
        target_type="app_setting",
        target_id="verification_from_email",
        details={"verification_from_email": verification_from_email},
    )
    return jsonify({"success": True})


@admin_bp.get("/api/settings")
@admin_required
def api_admin_settings():
    return jsonify(
        {
            "show_admin_properties": _bool_setting("show_admin_properties", default=False),
            "debug_mode": _bool_setting("debug_mode", default=False),
        }
    )


@admin_bp.post("/api/settings")
@admin_required
def api_update_admin_settings():
    payload = _json_payload()
    show_admin_properties = bool(payload.get("show_admin_properties", False))
    debug_mode = bool(payload.get("debug_mode", False))

    execute(
        """
        IF EXISTS (SELECT 1 FROM app_settings WHERE [key] = 'show_admin_properties')
            UPDATE app_settings SET value = ? WHERE [key] = 'show_admin_properties'
        ELSE
            INSERT INTO app_settings ([key], value) VALUES ('show_admin_properties', ?)
        """,
        (
            "1" if show_admin_properties else "0",
            "1" if show_admin_properties else "0",
        ),
    )
    execute(
        """
        IF EXISTS (SELECT 1 FROM app_settings WHERE [key] = 'debug_mode')
            UPDATE app_settings SET value = ? WHERE [key] = 'debug_mode'
        ELSE
            INSERT INTO app_settings ([key], value) VALUES ('debug_mode', ?)
        """,
        (
            "1" if debug_mode else "0",
            "1" if debug_mode else "0",
        ),
    )
    log_audit_event(
        "admin_update_settings",
        target_type="app_setting",
        target_id="show_admin_properties,debug_mode",
        details={
            "show_admin_properties": show_admin_properties,
            "debug_mode": debug_mode,
        },
    )
    return jsonify({"success": True})


@admin_bp.get("/api/image-sources")
@admin_required
def api_image_sources():
    rows = fetch_all(
        "SELECT id, source_key, root_path, is_enabled, created_at FROM image_sources ORDER BY source_key"
    )
    return jsonify(
        [
            {
                "id": r["id"],
                "source_key": r["source_key"],
                "root_path": r["root_path"],
                "is_enabled": bool(r["is_enabled"]),
                "created_at": str(r["created_at"]),
            }
            for r in rows
        ]
    )


@admin_bp.post("/api/image-sources")
@admin_required
def api_add_image_source():
    payload = _json_payload()
    source_key = payload.get("source_key", "").strip().lower()
    root_path = payload.get("root_path", "").strip()

    if not source_key or not root_path:
        return jsonify({"success": False, "message": "Source key and root path are required."}), 400

    exists = fetch_one("SELECT TOP 1 id FROM image_sources WHERE source_key = ?", (source_key,))
    if exists:
        return jsonify({"success": False, "message": "Source key already exists."}), 409

    execute(
        "INSERT INTO image_sources (source_key, root_path, is_enabled) VALUES (?, ?, 1)",
        (source_key, root_path),
    )
    log_audit_event(
        "admin_add_image_source",
        target_type="image_source",
        target_id=source_key,
        details={"root_path": root_path},
    )
    return jsonify({"success": True})


@admin_bp.post("/api/image-sources/<int:source_id>/toggle")
@admin_required
def api_toggle_image_source(source_id: int):
    payload = _json_payload()
    enabled = bool(payload.get("is_enabled", True))
    execute(
        "UPDATE image_sources SET is_enabled = ? WHERE id = ?",
        (1 if enabled else 0, source_id),
    )
    log_audit_event(
        "admin_toggle_image_source",
        target_type="image_source",
        target_id=str(source_id),
        details={"is_enabled": enabled},
    )
    return jsonify({"success": True})


@admin_bp.delete("/api/image-sources/<int:source_id>")
@admin_required
def api_delete_image_source(source_id: int):
    execute("DELETE FROM image_sources WHERE id = ?", (source_id,))
    log_audit_event("admin_delete_image_source", target_type="image_source", target_id=str(source_id))
    return jsonify({"success": True})


@admin_bp.get("/api/access-controls")
@admin_required
def api_access_controls():
    rows = fetch_all(
        """
        SELECT role, module_key, can_access
        FROM module_permissions
        ORDER BY role, module_key
        """
    )
    return jsonify([
        {
            "role": r["role"],
            "module_key": r["module_key"],
            "can_access": bool(r["can_access"]),
        }
        for r in rows
    ])


@admin_bp.post("/api/access-controls")
@admin_required
def api_update_access_control():
    payload = _json_payload()
    role = payload.get("role", "user")
    module_key = payload.get("module_key", "").strip()
    can_access = bool(payload.get("can_access", False))

    if role not in ("admin", "user") or not module_key:
        return jsonify({"success": False, "message": "Invalid payload."}), 400

    execute(
        """
        IF EXISTS (SELECT 1 FROM module_permissions WHERE role = ? AND module_key = ?)
            UPDATE module_permissions SET can_access = ? WHERE role = ? AND module_key = ?
        ELSE
            INSERT INTO module_permissions (role, module_key, can_access) VALUES (?, ?, ?)
        """,
        (
            role,
            module_key,
            1 if can_access else 0,
            role,
            module_key,
            role,
            module_key,
            1 if can_access else 0,
        ),
    )
    log_audit_event(
        "admin_update_module_permission",
        target_type="module_permission",
        target_id=f"{role}:{module_key}",
        details={"can_access": can_access},
    )
    return jsonify({"success": True})


@admin_bp.get("/api/user-access-overrides")
@admin_required
def api_user_access_overrides():
    rows = fetch_all(
        """
        SELECT up.user_id, u.username, u.email, up.module_key, up.can_access
        FROM user_permissions up
        JOIN users u ON u.id = up.user_id
        ORDER BY u.username, up.module_key
        """
    )
    return jsonify(
        [
            {
                "user_id": r["user_id"],
                "username": r["username"],
                "email": r["email"],
                "module_key": r["module_key"],
                "can_access": bool(r["can_access"]),
            }
            for r in rows
        ]
    )


@admin_bp.post("/api/user-access-overrides")
@admin_required
def api_set_user_access_override():
    payload = _json_payload()
    raw_user_id = payload.get("user_id", 0)
    try:
        user_id = int(raw_user_id or 0)
    except (TypeError, ValueError):
        return jsonify({"success": False, "message": "Invalid payload."}), 400

    module_key = payload.get("module_key", "").strip()
    can_access = bool(payload.get("can_access", False))
    if user_id <= 0 or not module_key:
        return jsonify({"success": False, "message": "Invalid payload."}), 400

    execute(
        """
        IF EXISTS (SELECT 1 FROM user_permissions WHERE user_id = ? AND module_key = ?)
            UPDATE user_permissions SET can_access = ? WHERE user_id = ? AND module_key = ?
        ELSE
            INSERT INTO user_permissions (user_id, module_key, can_access) VALUES (?, ?, ?)
        """,
        (
            user_id,
            module_key,
            1 if can_access else 0,
            user_id,
            module_key,
            user_id,
            module_key,
            1 if can_access else 0,
        ),
    )
    log_audit_event(
        "admin_set_user_permission_override",
        target_type="user_permission",
        target_id=f"{user_id}:{module_key}",
        details={"can_access": can_access},
    )
    return jsonify({"success": True})


@admin_bp.get("/api/geography/states")
@admin_required
def api_geography_states():
    try:
        ensure_states_seeded()
        rows = fetch_all(
            """
            SELECT state_fips, state_code, state_name, is_active
            FROM states
            ORDER BY state_name
            """
        )
        return jsonify(
            [
                {
                    "state_fips": r["state_fips"],
                    "state_code": r["state_code"],
                    "state_name": r["state_name"],
                    "is_active": bool(r["is_active"]),
                }
                for r in rows
            ]
        )
    except Exception:
        current_app.logger.exception("Failed loading geography states")
        return jsonify([])


@admin_bp.post("/api/geography/states/<state_fips>/toggle")
@admin_required
def api_geography_toggle_state(state_fips: str):
    payload = _json_payload()
    value = str(state_fips).strip()
    if len(value) != 2 or not value.isdigit():
        return jsonify({"success": False, "message": "Invalid state FIPS."}), 400

    is_active = bool(payload.get("is_active", False))
    try:
        execute(
            """
            BEGIN TRANSACTION;
                UPDATE states SET is_active = ? WHERE state_fips = ?;
                IF (? = 0)
                BEGIN
                    UPDATE counties SET is_active = 0 WHERE state_fips = ?;
                    IF OBJECT_ID('dbo.county_work_items', 'U') IS NOT NULL
                    BEGIN
                        IF COL_LENGTH('dbo.county_work_items', 'is_active_job') IS NOT NULL
                        BEGIN
                            UPDATE cwi
                            SET
                                is_active_job = 0,
                                is_in_progress = 0,
                                is_working = 0,
                                working_user_id = NULL,
                                is_split_job = 0,
                                is_completed = 0,
                                completed_at = NULL,
                                completed_by_admin_user_id = NULL,
                                updated_at = SYSDATETIMEOFFSET()
                            FROM county_work_items cwi
                            JOIN counties c ON c.county_fips = cwi.county_fips
                            WHERE c.state_fips = ?;
                        END
                        ELSE
                        BEGIN
                            UPDATE cwi
                            SET
                                is_in_progress = 0,
                                is_working = 0,
                                working_user_id = NULL,
                                is_split_job = 0,
                                is_completed = 0,
                                completed_at = NULL,
                                completed_by_admin_user_id = NULL,
                                updated_at = SYSDATETIMEOFFSET()
                            FROM county_work_items cwi
                            JOIN counties c ON c.county_fips = cwi.county_fips
                            WHERE c.state_fips = ?;
                        END
                    END
                END
            COMMIT TRANSACTION;
            """,
            (1 if is_active else 0, value, 1 if is_active else 0, value, value, value),
        )
    except Exception:
        return jsonify({"success": False, "message": "Geography tables are not available yet."}), 400
    log_audit_event(
        "admin_toggle_state_active",
        target_type="state",
        target_id=value,
        details={"is_active": is_active},
    )
    return jsonify({"success": True})


@admin_bp.get("/api/geography/counties")
@admin_required
def api_geography_counties():
    state_fips = str(request.args.get("state_fips", "")).strip()
    query = """
        SELECT
            c.county_fips,
            c.state_fips,
            s.state_name,
            c.county_name,
            c.is_active,
            COALESCE(cwi.is_active_job, 0) AS is_active_job
        FROM counties c
        JOIN states s ON s.state_fips = c.state_fips
        LEFT JOIN county_work_items cwi ON cwi.county_fips = c.county_fips
        WHERE s.is_active = 1
          AND (? = '' OR c.state_fips = ?)
        ORDER BY s.state_name, c.county_name
    """
    try:
        rows = fetch_all(query, (state_fips, state_fips))
        return jsonify(
            [
                {
                    "county_fips": r["county_fips"],
                    "state_fips": r["state_fips"],
                    "state_name": r["state_name"],
                    "county_name": r["county_name"],
                    "is_active": bool(r["is_active"]),
                    "is_active_job": bool(r["is_active_job"]),
                }
                for r in rows
            ]
        )
    except Exception:
        try:
            fallback_rows = fetch_all(
                """
                SELECT c.county_fips, c.state_fips, s.state_name, c.county_name, c.is_active
                FROM counties c
                JOIN states s ON s.state_fips = c.state_fips
                WHERE s.is_active = 1
                  AND (? = '' OR c.state_fips = ?)
                ORDER BY s.state_name, c.county_name
                """,
                (state_fips, state_fips),
            )
            return jsonify(
                [
                    {
                        "county_fips": r["county_fips"],
                        "state_fips": r["state_fips"],
                        "state_name": r["state_name"],
                        "county_name": r["county_name"],
                        "is_active": bool(r["is_active"]),
                        "is_active_job": False,
                    }
                    for r in fallback_rows
                ]
            )
        except Exception:
            return jsonify([])


@admin_bp.post("/api/geography/counties")
@admin_required
def api_geography_upsert_county():
    payload = _json_payload()
    county_fips = str(payload.get("county_fips", "")).strip()
    state_fips = str(payload.get("state_fips", "")).strip()
    county_name = str(payload.get("county_name", "")).strip()

    if len(county_fips) != 5 or not county_fips.isdigit():
        return jsonify({"success": False, "message": "County FIPS must be 5 digits."}), 400
    if len(state_fips) != 2 or not state_fips.isdigit():
        return jsonify({"success": False, "message": "State FIPS must be 2 digits."}), 400
    if county_fips[:2] != state_fips:
        return jsonify({"success": False, "message": "County FIPS must begin with the selected state FIPS."}), 400
    if not county_name:
        return jsonify({"success": False, "message": "County name is required."}), 400

    try:
        state = fetch_one("SELECT TOP 1 state_fips FROM states WHERE state_fips = ?", (state_fips,))
    except Exception:
        return jsonify({"success": False, "message": "Geography tables are not available yet."}), 400
    if not state:
        return jsonify({"success": False, "message": "State FIPS not found."}), 404

    try:
        execute(
            """
            IF EXISTS (SELECT 1 FROM counties WHERE county_fips = ?)
                UPDATE counties SET state_fips = ?, county_name = ? WHERE county_fips = ?
            ELSE
                INSERT INTO counties (county_fips, state_fips, county_name, is_active) VALUES (?, ?, ?, 0)
            """,
            (
                county_fips,
                state_fips,
                county_name[:160],
                county_fips,
                county_fips,
                state_fips,
                county_name[:160],
            ),
        )
    except Exception:
        return jsonify({"success": False, "message": "Unable to save county."}), 400
    log_audit_event(
        "admin_upsert_county",
        target_type="county",
        target_id=county_fips,
        details={"state_fips": state_fips, "county_name": county_name[:160]},
    )
    return jsonify({"success": True})


@admin_bp.post("/api/geography/counties/<county_fips>/toggle")
@admin_required
def api_geography_toggle_county(county_fips: str):
    payload = _json_payload()
    value = str(county_fips).strip()
    if len(value) != 5 or not value.isdigit():
        return jsonify({"success": False, "message": "Invalid county FIPS."}), 400

    is_active = bool(payload.get("is_active", False))
    try:
        if is_active:
            parent_state = fetch_one(
                """
                SELECT TOP 1 s.state_fips
                FROM counties c
                JOIN states s ON s.state_fips = c.state_fips
                WHERE c.county_fips = ? AND s.is_active = 1
                """,
                (value,),
            )
            if not parent_state:
                return jsonify({"success": False, "message": "County can only be activated when its state is active."}), 400
        execute("UPDATE counties SET is_active = ? WHERE county_fips = ?", (1 if is_active else 0, value))
        if not is_active:
            execute(
                """
                IF OBJECT_ID('dbo.county_work_items', 'U') IS NOT NULL
                BEGIN
                    IF COL_LENGTH('dbo.county_work_items', 'is_active_job') IS NOT NULL
                    BEGIN
                        UPDATE county_work_items
                        SET
                            is_active_job = 0,
                            is_in_progress = 0,
                            is_working = 0,
                            working_user_id = NULL,
                            is_split_job = 0,
                            is_completed = 0,
                            completed_at = NULL,
                            completed_by_admin_user_id = NULL,
                            updated_at = SYSDATETIMEOFFSET()
                        WHERE county_fips = ?
                    END
                    ELSE
                    BEGIN
                        UPDATE county_work_items
                        SET
                            is_in_progress = 0,
                            is_working = 0,
                            working_user_id = NULL,
                            is_split_job = 0,
                            is_completed = 0,
                            completed_at = NULL,
                            completed_by_admin_user_id = NULL,
                            updated_at = SYSDATETIMEOFFSET()
                        WHERE county_fips = ?
                    END
                END
                """,
                (value, value),
            )
    except Exception:
        return jsonify({"success": False, "message": "Geography tables are not available yet."}), 400
    log_audit_event(
        "admin_toggle_county_active",
        target_type="county",
        target_id=value,
        details={"is_active": is_active},
    )
    return jsonify({"success": True})


@admin_bp.post("/api/geography/counties/<county_fips>/active-job")
@admin_required
def api_geography_set_county_active_job(county_fips: str):
    payload = _json_payload()
    value = str(county_fips).strip()
    if len(value) != 5 or not value.isdigit():
        return jsonify({"success": False, "message": "Invalid county FIPS."}), 400

    is_active_job = bool(payload.get("is_active_job", False))
    try:
        col_check = fetch_one("SELECT COL_LENGTH('dbo.county_work_items', 'is_active_job') AS col_len")
        if not col_check or col_check.get("col_len") is None:
            return jsonify({"success": False, "message": "Migration V0006 is required before using active job controls."}), 400
        county = fetch_one(
            """
            SELECT TOP 1 c.county_fips, c.is_active, s.is_active AS state_is_active
            FROM counties c
            JOIN states s ON s.state_fips = c.state_fips
            WHERE c.county_fips = ?
            """,
            (value,),
        )
        if not county:
            return jsonify({"success": False, "message": "County not found."}), 404
        if is_active_job and (not bool(county["is_active"]) or not bool(county["state_is_active"])):
            return jsonify({"success": False, "message": "County must be active in an active state first."}), 400

        execute(
            """
            IF OBJECT_ID('dbo.county_work_items', 'U') IS NOT NULL
            BEGIN
                IF NOT EXISTS (SELECT 1 FROM county_work_items WHERE county_fips = ?)
                    INSERT INTO county_work_items (county_fips) VALUES (?);

                UPDATE county_work_items
                SET
                    is_active_job = ?,
                    is_in_progress = CASE WHEN ? = 0 THEN 0 ELSE is_in_progress END,
                    is_working = CASE WHEN ? = 0 THEN 0 ELSE is_working END,
                    working_user_id = CASE WHEN ? = 0 THEN NULL ELSE working_user_id END,
                    is_split_job = CASE WHEN ? = 0 THEN 0 ELSE is_split_job END,
                    is_completed = CASE WHEN ? = 0 THEN 0 ELSE is_completed END,
                    completed_at = CASE WHEN ? = 0 THEN NULL ELSE completed_at END,
                    completed_by_admin_user_id = CASE WHEN ? = 0 THEN NULL ELSE completed_by_admin_user_id END,
                    updated_at = SYSDATETIMEOFFSET()
                WHERE county_fips = ?
            END
            """,
            (
                value,
                value,
                1 if is_active_job else 0,
                1 if is_active_job else 0,
                1 if is_active_job else 0,
                1 if is_active_job else 0,
                1 if is_active_job else 0,
                1 if is_active_job else 0,
                1 if is_active_job else 0,
                1 if is_active_job else 0,
                value,
            ),
        )
    except Exception:
        return jsonify({"success": False, "message": "Unable to update county active-job status."}), 400

    log_audit_event(
        "admin_set_county_active_job",
        target_type="county",
        target_id=value,
        details={"is_active_job": is_active_job},
    )
    return jsonify({"success": True})
