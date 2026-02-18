from __future__ import annotations

from flask import Blueprint, jsonify, request, session

from gsi_enterprise.core.decorators import login_required
from gsi_enterprise.services.addon_registry_service import (
    discover_addon_apps,
    execute_network_drive_connect,
    execute_network_drive_disconnect,
    get_addon_app,
)
from gsi_enterprise.services.permission_service import has_module_access

addons_bp = Blueprint("addons", __name__)


@addons_bp.get("/api/addons/apps")
@login_required
def api_list_addon_apps():
    user_id = session.get("user_id")
    role = session.get("role")
    apps = [
        app
        for app in discover_addon_apps()
        if has_module_access(user_id, role, app.get("module_key", ""))
    ]
    return jsonify({"success": True, "apps": apps, "count": len(apps)})


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
        return jsonify({"success": ok, "message": message}), (200 if ok else 400)
    except Exception as exc:
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
        return jsonify({"success": ok, "message": message}), (200 if ok else 400)
    except Exception as exc:
        return jsonify({"success": False, "message": f"Execution failed: {exc}"}), 500
