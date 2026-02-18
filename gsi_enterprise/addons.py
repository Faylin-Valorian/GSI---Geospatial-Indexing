from __future__ import annotations

import json
import re
import traceback

from flask import Blueprint, g, jsonify, request, session
from flask import current_app

from gsi_enterprise.core.decorators import login_required
from gsi_enterprise.db import execute, fetch_all, fetch_one
from gsi_enterprise.services.addon_registry_service import (
    discover_addon_apps,
    execute_change_database_compatibility,
    execute_network_drive_connect,
    execute_network_drive_disconnect,
    get_addon_app,
)
from gsi_enterprise.services.permission_service import has_module_access

addons_bp = Blueprint("addons", __name__)
_ODBC_DATABASE_RE = re.compile(r"(?:^|;)\s*Database\s*=\s*([^;]+)", re.IGNORECASE)
_VALID_GROUP_RE = re.compile(r"^[a-z0-9][a-z0-9_-]{1,63}$")
_COMPATIBILITY_OPTIONS = [
    {"level": 130, "sql_server_version": "SQL Server 2016"},
    {"level": 140, "sql_server_version": "SQL Server 2017"},
    {"level": 150, "sql_server_version": "SQL Server 2019"},
    {"level": 160, "sql_server_version": "SQL Server 2022"},
]


def _default_database_name() -> str:
    conn_str = str(current_app.config.get("MSSQL_CONNECTION_STRING", "")).strip()
    if not conn_str:
        return ""
    match = _ODBC_DATABASE_RE.search(conn_str)
    if not match:
        return ""
    return match.group(1).strip()


def _normalize_group(value: str) -> str:
    group = re.sub(r"[^a-z0-9_-]+", "_", str(value or "").strip().lower()).strip("_-")
    if not group:
        return "extra_tools"
    if not _VALID_GROUP_RE.fullmatch(group):
        return "extra_tools"
    return group


def _current_compatibility_level(database_name: str) -> int | None:
    db_name = str(database_name).strip()
    if not db_name:
        return None
    row = fetch_one(
        "SELECT TOP 1 compatibility_level FROM sys.databases WHERE name = ?",
        (db_name,),
    )
    if not row:
        return None
    value = row.get("compatibility_level")
    if value is None:
        return None
    try:
        return int(value)
    except Exception:
        return None


def _is_setting_enabled(key: str, default: bool = False) -> bool:
    row = fetch_one("SELECT value FROM app_settings WHERE [key] = ?", (key,))
    if not row:
        return default
    return str(row.get("value", "")).strip() == "1"


def _log_addon_operation_error(
    *,
    addon_id: str,
    operation: str,
    error_type: str,
    error_message: str,
    details: dict[str, object] | None = None,
) -> None:
    try:
        stack = json.dumps(details or {}, ensure_ascii=True)
        execute(
            """
            INSERT INTO app_error_logs (request_id, path, method, error_type, error_message, stack_trace, user_id, ip_address)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            """,
            (
                g.get("request_id", ""),
                request.path[:512],
                request.method[:16],
                f"Addon:{error_type}"[:200],
                f"[{addon_id}:{operation}] {error_message}",
                stack,
                session.get("user_id"),
                request.headers.get("X-Forwarded-For", request.remote_addr or "")[:64],
            ),
        )
    except Exception:
        current_app.logger.warning("Failed to write add-on operation error log for addon_id=%s", addon_id)


def _log_addon_metadata_strings(app: dict[str, object]) -> None:
    header_meta = (
        f"Group: {str(app.get('nav_group_label', ''))} "
        f"· App ID: {str(app.get('id', ''))} "
        f"· Module key: {str(app.get('module_key', ''))}"
    )
    button_meta = f"{str(app.get('category', ''))} · {str(app.get('type', ''))}"

    execute(
        """
        MERGE dbo.addon_app_ui_metadata_log AS target
        USING (
            SELECT
                ? AS app_id,
                ? AS app_title,
                ? AS nav_group,
                ? AS nav_group_label,
                ? AS module_key,
                ? AS app_type,
                ? AS category,
                ? AS header_meta_text,
                ? AS button_meta_text
        ) AS src
        ON target.app_id = src.app_id
        WHEN MATCHED THEN
            UPDATE SET
                app_title = src.app_title,
                nav_group = src.nav_group,
                nav_group_label = src.nav_group_label,
                module_key = src.module_key,
                app_type = src.app_type,
                category = src.category,
                header_meta_text = src.header_meta_text,
                button_meta_text = src.button_meta_text,
                updated_at = SYSDATETIMEOFFSET()
        WHEN NOT MATCHED THEN
            INSERT (
                app_id,
                app_title,
                nav_group,
                nav_group_label,
                module_key,
                app_type,
                category,
                header_meta_text,
                button_meta_text
            )
            VALUES (
                src.app_id,
                src.app_title,
                src.nav_group,
                src.nav_group_label,
                src.module_key,
                src.app_type,
                src.category,
                src.header_meta_text,
                src.button_meta_text
            );
        """,
        (
            str(app.get("id", "")),
            str(app.get("title", "")),
            str(app.get("nav_group", "")),
            str(app.get("nav_group_label", "")),
            str(app.get("module_key", "")),
            str(app.get("type", "")),
            str(app.get("category", "")),
            header_meta,
            button_meta,
        ),
    )


def _ensure_addon_order_rows(apps: list[dict[str, object]]) -> None:
    rows = fetch_all(
        """
        SELECT app_id, nav_group, sort_order
        FROM dbo.addon_app_ordering
        """
    )
    existing_ids = {str(row.get("app_id", "")) for row in rows}
    max_by_group: dict[str, int] = {}
    for row in rows:
        group = _normalize_group(str(row.get("nav_group", "")))
        try:
            sort_order = int(row.get("sort_order") or 0)
        except Exception:
            sort_order = 0
        max_by_group[group] = max(max_by_group.get(group, 0), sort_order)

    for app in apps:
        app_id = str(app.get("id", ""))
        if not app_id or app_id in existing_ids:
            continue
        group = _normalize_group(str(app.get("nav_group", "")))
        next_order = max_by_group.get(group, 0) + 1
        execute(
            """
            INSERT INTO dbo.addon_app_ordering (app_id, nav_group, sort_order)
            VALUES (?, ?, ?)
            """,
            (app_id, group, next_order),
        )
        existing_ids.add(app_id)
        max_by_group[group] = next_order


def _addon_order_map() -> dict[str, tuple[str, int]]:
    rows = fetch_all(
        """
        SELECT app_id, nav_group, sort_order
        FROM dbo.addon_app_ordering
        """
    )
    out: dict[str, tuple[str, int]] = {}
    for row in rows:
        app_id = str(row.get("app_id", "")).strip()
        group = _normalize_group(str(row.get("nav_group", "")))
        try:
            sort_order = int(row.get("sort_order") or 0)
        except Exception:
            sort_order = 0
        if app_id:
            out[app_id] = (group, sort_order)
    return out


@addons_bp.get("/api/addons/apps")
@login_required
def api_list_addon_apps():
    user_id = session.get("user_id")
    role = session.get("role")
    apps: list[dict[str, object]] = [
        app
        for app in discover_addon_apps()
        if has_module_access(user_id, role, app.get("module_key", ""))
    ]
    show_admin_properties = _is_setting_enabled("show_admin_properties", default=False)
    can_manage_order = (
        show_admin_properties
        and session.get("role") == "admin"
        and has_module_access(session.get("user_id"), session.get("role"), "admin_dashboard")
    )
    default_db = _default_database_name()
    current_compat = _current_compatibility_level(default_db)
    order_map: dict[str, tuple[str, int]] = {}
    try:
        _ensure_addon_order_rows(apps)
        order_map = _addon_order_map()
    except Exception:
        current_app.logger.warning("Unable to load add-on ordering metadata.")

    def sort_key(app: dict[str, object]) -> tuple[str, int, str]:
        app_id = str(app.get("id", ""))
        app_group = _normalize_group(str(app.get("nav_group", "")))
        row = order_map.get(app_id)
        if row and row[0] == app_group:
            return (app_group, int(row[1]), str(app.get("title", "")).lower())
        return (app_group, 1_000_000, str(app.get("title", "")).lower())

    apps.sort(key=sort_key)

    for app in apps:
        try:
            _log_addon_metadata_strings(app)
        except Exception:
            current_app.logger.warning("Unable to log add-on metadata for app_id=%s", app.get("id"))

        if app.get("type") == "change_database_compatibility":
            app["default_database_name"] = default_db
            app["current_compatibility_level"] = current_compat
            app["compatibility_options"] = list(_COMPATIBILITY_OPTIONS)
    return jsonify({"success": True, "apps": apps, "count": len(apps), "can_manage_order": can_manage_order})


@addons_bp.post("/api/addons/apps/order")
@login_required
def api_update_addon_order():
    is_admin = (
        session.get("role") == "admin"
        and has_module_access(session.get("user_id"), session.get("role"), "admin_dashboard")
    )
    if not is_admin:
        return jsonify({"success": False, "message": "Admin access is required."}), 403

    payload = request.get_json(silent=True) or {}
    group = _normalize_group(str(payload.get("group", "")))
    ordered_ids_raw = payload.get("app_ids")
    if not isinstance(ordered_ids_raw, list) or not ordered_ids_raw:
        return jsonify({"success": False, "message": "app_ids is required."}), 400

    ordered_ids = [str(item).strip().lower() for item in ordered_ids_raw if str(item).strip()]
    if len(ordered_ids) != len(set(ordered_ids)):
        return jsonify({"success": False, "message": "app_ids must be unique."}), 400

    group_apps = [
        app
        for app in discover_addon_apps()
        if _normalize_group(str(app.get("nav_group", ""))) == group
        and has_module_access(session.get("user_id"), session.get("role"), app.get("module_key", ""))
    ]
    known_ids = {str(app.get("id", "")) for app in group_apps}
    if set(ordered_ids) != known_ids:
        return jsonify({"success": False, "message": "app_ids must include every app in the selected group."}), 400

    for idx, app_id in enumerate(ordered_ids, start=1):
        execute(
            """
            MERGE dbo.addon_app_ordering AS target
            USING (SELECT ? AS app_id, ? AS nav_group, ? AS sort_order) AS src
            ON target.app_id = src.app_id
            WHEN MATCHED THEN
                UPDATE SET
                    nav_group = src.nav_group,
                    sort_order = src.sort_order,
                    updated_at = SYSDATETIMEOFFSET()
            WHEN NOT MATCHED THEN
                INSERT (app_id, nav_group, sort_order)
                VALUES (src.app_id, src.nav_group, src.sort_order);
            """,
            (app_id, group, idx),
        )

    return jsonify({"success": True, "message": "Add-on order updated."})


@addons_bp.post("/api/addons/apps/<addon_id>/connect")
@login_required
def api_connect_network_drive(addon_id: str):
    addon = get_addon_app(addon_id)
    if not addon:
        return jsonify({"success": False, "message": "Addon not found."}), 404

    if not has_module_access(session.get("user_id"), session.get("role"), addon.get("module_key", "")):
        return jsonify({"success": False, "message": "You do not have access to this add-on."}), 403

    if addon.get("type") != "network_drive_connect":
        return jsonify({"success": False, "message": "Unsupported addon type."}), 400

    payload = request.get_json(silent=True) or {}
    username = str(payload.get("username", "")).strip()
    password = str(payload.get("password", ""))
    drive_letter = str(payload.get("drive_letter", addon.get("default_drive_letter", "I"))).strip()
    network_target = str(payload.get("network_target", addon.get("default_network_target", r"\\pagrape\scanning"))).strip()

    try:
        ok, message = execute_network_drive_connect(
            addon,
            username=username,
            password=password,
            drive_letter=drive_letter,
            network_target=network_target,
        )
        if not ok:
            _log_addon_operation_error(
                addon_id=addon_id,
                operation="connect",
                error_type="ValidationError",
                error_message=message,
                details={
                    "drive_letter": drive_letter,
                    "network_target": network_target,
                },
            )
        return jsonify({"success": ok, "message": message}), (200 if ok else 400)
    except Exception as exc:
        _log_addon_operation_error(
            addon_id=addon_id,
            operation="connect",
            error_type=exc.__class__.__name__,
            error_message=str(exc),
            details={"traceback": traceback.format_exc()},
        )
        return jsonify({"success": False, "message": f"Execution failed: {exc}"}), 500


@addons_bp.post("/api/addons/apps/<addon_id>/disconnect")
@login_required
def api_disconnect_network_drive(addon_id: str):
    addon = get_addon_app(addon_id)
    if not addon:
        return jsonify({"success": False, "message": "Addon not found."}), 404

    if not has_module_access(session.get("user_id"), session.get("role"), addon.get("module_key", "")):
        return jsonify({"success": False, "message": "You do not have access to this add-on."}), 403

    if addon.get("type") != "network_drive_connect":
        return jsonify({"success": False, "message": "Unsupported addon type."}), 400

    payload = request.get_json(silent=True) or {}
    drive_letter = str(payload.get("drive_letter", addon.get("default_drive_letter", "I"))).strip()

    try:
        ok, message = execute_network_drive_disconnect(addon, drive_letter=drive_letter)
        if not ok:
            _log_addon_operation_error(
                addon_id=addon_id,
                operation="disconnect",
                error_type="ValidationError",
                error_message=message,
                details={"drive_letter": drive_letter},
            )
        return jsonify({"success": ok, "message": message}), (200 if ok else 400)
    except Exception as exc:
        _log_addon_operation_error(
            addon_id=addon_id,
            operation="disconnect",
            error_type=exc.__class__.__name__,
            error_message=str(exc),
            details={"traceback": traceback.format_exc()},
        )
        return jsonify({"success": False, "message": f"Execution failed: {exc}"}), 500


@addons_bp.post("/api/addons/apps/<addon_id>/change-compatibility")
@login_required
def api_change_database_compatibility(addon_id: str):
    addon = get_addon_app(addon_id)
    if not addon:
        return jsonify({"success": False, "message": "Addon not found."}), 404

    if not has_module_access(session.get("user_id"), session.get("role"), addon.get("module_key", "")):
        return jsonify({"success": False, "message": "You do not have access to this add-on."}), 403

    if addon.get("type") != "change_database_compatibility":
        return jsonify({"success": False, "message": "Unsupported addon type."}), 400

    payload = request.get_json(silent=True) or {}
    database_name = str(payload.get("database_name", _default_database_name())).strip()
    compatibility_level = payload.get("compatibility_level", 130)

    try:
        ok, message = execute_change_database_compatibility(
            addon,
            database_name=database_name,
            compatibility_level=int(compatibility_level),
        )
        if not ok:
            _log_addon_operation_error(
                addon_id=addon_id,
                operation="change_compatibility",
                error_type="ValidationError",
                error_message=message,
                details={
                    "database_name": database_name,
                    "compatibility_level": compatibility_level,
                },
            )
        return jsonify({"success": ok, "message": message}), (200 if ok else 400)
    except Exception as exc:
        _log_addon_operation_error(
            addon_id=addon_id,
            operation="change_compatibility",
            error_type=exc.__class__.__name__,
            error_message=str(exc),
            details={"traceback": traceback.format_exc()},
        )
        return jsonify({"success": False, "message": f"Execution failed: {exc}"}), 500
