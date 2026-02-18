from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Any

from gsi_enterprise.db import execute, fetch_all, fetch_one

_ROOT_DIR = Path(__file__).resolve().parents[2]
_ADDONS_APPS_DIR = _ROOT_DIR / "apps"
_VALID_ID_RE = re.compile(r"^[a-z0-9][a-z0-9_-]{1,63}$")
_VALID_TYPES = {"network_drive_connect", "change_database_compatibility"}
_VALID_GROUP_RE = re.compile(r"^[a-z0-9][a-z0-9_-]{1,63}$")
_VALID_USER_RE = re.compile(r"^[A-Za-z0-9._\\\\-]{1,128}$")
_UNC_PATH_RE = re.compile(r"^\\\\[^\\\/:*?\"<>|]+\\[^\\\/:*?\"<>|]+(?:\\[^:*?\"<>|]+)*$")
_VALID_DB_NAME_RE = re.compile(r"^[A-Za-z0-9_ -]{1,128}$")


def _safe_resolve(path_text: str) -> Path | None:
    candidate = (_ROOT_DIR / path_text).resolve()
    if not candidate.exists() or not candidate.is_file():
        return None
    try:
        candidate.relative_to(_ROOT_DIR)
    except ValueError:
        return None
    return candidate


def _normalize_group_key(value: str) -> str:
    group = re.sub(r"[^a-z0-9_-]+", "_", value.strip().lower())
    group = group.strip("_-")
    if not group:
        return "extra_tools"
    if not _VALID_GROUP_RE.fullmatch(group):
        return "extra_tools"
    return group


def _humanize_group_key(group: str) -> str:
    return " ".join(chunk.capitalize() for chunk in group.replace("-", "_").split("_") if chunk) or "Extra Tools"


def _load_manifest(path: Path, default_group: str) -> dict[str, Any] | None:
    try:
        payload = json.loads(path.read_text(encoding="utf-8"))
    except Exception:
        return None

    addon_id = str(payload.get("id", "")).strip().lower()
    addon_type = str(payload.get("type", "")).strip().lower()
    if not _VALID_ID_RE.fullmatch(addon_id):
        return None
    if addon_type not in _VALID_TYPES:
        return None

    sql_disconnect_rel = str(payload.get("sql_disconnect", "")).strip()
    sql_disconnect = _safe_resolve(sql_disconnect_rel) if sql_disconnect_rel else None
    sql_connect = None
    sql_apply = None

    if addon_type == "network_drive_connect":
        sql_connect_rel = str(payload.get("sql_connect", "")).strip()
        if not sql_connect_rel:
            return None
        sql_connect = _safe_resolve(sql_connect_rel)
        if not sql_connect:
            return None
    elif addon_type == "change_database_compatibility":
        sql_apply_rel = str(payload.get("sql_apply", "")).strip()
        if not sql_apply_rel:
            return None
        sql_apply = _safe_resolve(sql_apply_rel)
        if not sql_apply:
            return None

    nav_group = _normalize_group_key(str(payload.get("nav_group", default_group or "extra_tools")))
    nav_group_label = str(payload.get("nav_group_label", "")).strip() or _humanize_group_key(nav_group)

    return {
        "id": addon_id,
        "title": str(payload.get("title", addon_id)).strip() or addon_id,
        "description": str(payload.get("description", "")).strip() or "Addon module",
        "type": addon_type,
        "module_key": str(payload.get("module_key", "setup_tools")).strip() or "setup_tools",
        "category": str(payload.get("category", "Infrastructure")).strip() or "Infrastructure",
        "sql_connect": (str(sql_connect.relative_to(_ROOT_DIR)) if sql_connect else ""),
        "sql_disconnect": (str(sql_disconnect.relative_to(_ROOT_DIR)) if sql_disconnect else ""),
        "sql_apply": (str(sql_apply.relative_to(_ROOT_DIR)) if sql_apply else ""),
        "nav_group": nav_group,
        "nav_group_label": nav_group_label,
        "network_label": str(payload.get("network_label", "Network Drive")).strip() or "Network Drive",
        "default_drive_letter": str(payload.get("default_drive_letter", "I")).strip()[:1].upper() or "I",
        "default_network_target": str(payload.get("default_network_target", r"\\pagrape\scanning")).strip() or r"\\pagrape\scanning",
    }


def discover_addon_apps() -> list[dict[str, Any]]:
    if not _ADDONS_APPS_DIR.exists():
        return []

    addons: list[dict[str, Any]] = []
    for manifest_path in sorted(_ADDONS_APPS_DIR.rglob("addon.json")):
        try:
            rel_parent = manifest_path.parent.relative_to(_ADDONS_APPS_DIR)
            parts = list(rel_parent.parts)
            default_group = _normalize_group_key(parts[0]) if len(parts) > 1 else "extra_tools"
        except Exception:
            default_group = "extra_tools"

        loaded = _load_manifest(manifest_path, default_group=default_group)
        if loaded:
            addons.append(loaded)
    return addons


def get_addon_app(addon_id: str) -> dict[str, Any] | None:
    for addon in discover_addon_apps():
        if addon["id"] == addon_id:
            return addon
    return None


def _validate_user_input(username: str, password: str) -> tuple[bool, str]:
    if not _VALID_USER_RE.fullmatch(username):
        return False, "Username format is invalid. Use letters, numbers, dots, dashes, underscores, and backslashes."
    if not password:
        return False, "Password is required."
    if len(password) > 256:
        return False, "Password is too long."
    if any(ch in password for ch in ("\x00", "\r", "\n")):
        return False, "Password contains invalid characters."
    return True, ""


def _validate_drive_letter(value: str) -> tuple[bool, str]:
    v = value.strip().upper()
    if len(v) != 1 or not ("A" <= v <= "Z"):
        return False, "Drive letter must be a single letter A-Z."
    return True, v


def _validate_network_target(value: str) -> tuple[bool, str]:
    v = value.strip()
    if not _UNC_PATH_RE.fullmatch(v):
        return False, "Network target must be a valid UNC path like \\\\server\\share."
    return True, v


def _read_sql(relative_path: str) -> str:
    target = _safe_resolve(relative_path)
    if not target:
        raise RuntimeError("Configured SQL file is missing or invalid.")
    return target.read_text(encoding="utf-8").strip()


def _escape_bracket_identifier(value: str) -> str:
    return value.replace("]", "]]")


def _get_current_compatibility_level(database_name: str) -> int | None:
    row = fetch_one(
        "SELECT TOP 1 compatibility_level FROM sys.databases WHERE name = ?",
        (database_name,),
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


def _run_xp_cmdshell(command: str) -> str:
    escaped = command.replace("'", "''")
    rows = fetch_all(f"EXEC xp_cmdshell '{escaped}'")
    if not rows:
        return ""
    first_key = next(iter(rows[0].keys()), "")
    parts = []
    for row in rows:
        value = row.get(first_key)
        if value is None:
            continue
        text = str(value).strip()
        if text:
            parts.append(text)
    return "\n".join(parts)


def _xp_cmdshell_sql_output(sql: str) -> str:
    rows = fetch_all(sql)
    if not rows:
        return ""
    first_key = next(iter(rows[0].keys()), "")
    parts = []
    for row in rows:
        value = row.get(first_key)
        if value is None:
            continue
        text = str(value).strip()
        if text:
            parts.append(text)
    return "\n".join(parts)


def _is_drive_mapped_to_target(drive_letter: str, network_target: str) -> tuple[bool, str]:
    output = _run_xp_cmdshell(f"net use {drive_letter}:")
    low = output.lower()
    if not output:
        return False, "No status output from net use."
    if "system error" in low:
        return False, output
    if "the network connection could not be found" in low:
        return False, output
    if drive_letter.lower() + ":" not in low:
        return False, output
    if network_target.strip().lower() not in low:
        return False, output
    return True, output


def _summarize_output(text: str, max_len: int = 280) -> str:
    compact = " ".join(str(text or "").split())
    if len(compact) <= max_len:
        return compact
    return compact[: max_len - 3] + "..."


def _friendly_connect_error(drive_letter: str, network_target: str, connect_output: str, verify_output: str) -> str:
    raw = f"{connect_output}\n{verify_output}".lower()
    prefix = f"Unable to connect {drive_letter}: to {network_target}."

    if "system error 86" in raw or "password is not correct" in raw or "logon failure" in raw:
        return f"{prefix} Username or password is incorrect."
    if "system error 1326" in raw or "user name or password is incorrect" in raw:
        return f"{prefix} Username or password is incorrect."
    if "system error 53" in raw or "network path was not found" in raw:
        return f"{prefix} Network path was not found. Verify server/share path and connectivity."
    if "system error 67" in raw or "network name cannot be found" in raw:
        return f"{prefix} Network share name was not found."
    if "system error 85" in raw or "local device name is already in use" in raw:
        return f"{prefix} Drive letter is already in use. Disconnect it first or choose a different drive letter."
    if "system error 1219" in raw or "multiple connections to a server" in raw:
        return f"{prefix} Windows already has a connection to this server with different credentials."
    if "system error 5" in raw or "access is denied" in raw:
        return f"{prefix} Access denied. Check account permissions for this share."
    if "the network connection could not be found" in raw:
        return f"{prefix} Connection was not established."

    detail = _summarize_output(connect_output or verify_output)
    return f"{prefix} Connection failed. Details: {detail or 'No error details were returned.'}"


def execute_network_drive_connect(
    addon: dict[str, Any], *, username: str, password: str, drive_letter: str, network_target: str
) -> tuple[bool, str]:
    ok, message = _validate_user_input(username.strip(), password)
    if not ok:
        return False, message

    ok_drive, drive_or_msg = _validate_drive_letter(drive_letter)
    if not ok_drive:
        return False, drive_or_msg

    ok_target, target_or_msg = _validate_network_target(network_target)
    if not ok_target:
        return False, target_or_msg

    drive = drive_or_msg
    target = target_or_msg

    sql_template = _read_sql(addon["sql_connect"])
    escaped_user = username.strip().replace("'", "''")
    escaped_pass = password.replace("'", "''")
    escaped_target = target.replace("'", "''")

    template_drive = str(addon.get("default_drive_letter", "I")).strip()[:1].upper() or "I"
    template_target = str(addon.get("default_network_target", r"\\pagrape\scanning")).strip() or r"\\pagrape\scanning"
    sql_template = re.sub(rf"(?i)\b{re.escape(template_drive)}:", f"{drive}:", sql_template)
    sql_template = sql_template.replace(template_target, escaped_target)

    try:
        final_sql = sql_template.format(escaped_user, escaped_pass)
    except Exception:
        return False, "SQL template is invalid for username/password placeholders."

    connect_output = _xp_cmdshell_sql_output(final_sql)
    is_connected, detail = _is_drive_mapped_to_target(drive, target)
    if not is_connected:
        return False, _friendly_connect_error(drive, target, connect_output, detail)
    return True, f"Connected {drive}: -> {target}."


def execute_network_drive_disconnect(addon: dict[str, Any], *, drive_letter: str) -> tuple[bool, str]:
    sql_disconnect = addon.get("sql_disconnect", "").strip()
    if not sql_disconnect:
        return False, "This addon does not define a disconnect SQL command."

    ok_drive, drive_or_msg = _validate_drive_letter(drive_letter)
    if not ok_drive:
        return False, drive_or_msg

    template_drive = str(addon.get("default_drive_letter", "I")).strip()[:1].upper() or "I"
    final_sql = _read_sql(sql_disconnect)
    final_sql = re.sub(rf"(?i)\b{re.escape(template_drive)}:", f"{drive_or_msg}:", final_sql)
    execute(final_sql)
    return True, "Network drive disconnect command executed."


def execute_change_database_compatibility(
    addon: dict[str, Any], *, database_name: str, compatibility_level: int
) -> tuple[bool, str]:
    db_name = database_name.strip()
    if not _VALID_DB_NAME_RE.fullmatch(db_name):
        return False, "Database name is invalid. Use letters, numbers, spaces, underscores, and dashes."

    try:
        compat = int(compatibility_level)
    except Exception:
        return False, "Compatibility level must be a number."

    if compat < 130:
        return False, "Compatibility level cannot be less than 130."
    if compat > 999:
        return False, "Compatibility level is out of range."

    current_compat = _get_current_compatibility_level(db_name)
    if current_compat is None:
        return False, f"Database not found or compatibility level unavailable: {db_name}."
    if compat < current_compat:
        return (
            False,
            f"Compatibility level cannot be set below current level ({current_compat}) for {db_name}.",
        )

    sql_template = _read_sql(addon.get("sql_apply", ""))
    final_sql = sql_template.format(
        database_name=_escape_bracket_identifier(db_name),
        compatibility_level=compat,
    )
    execute(final_sql)
    return True, f"Database compatibility level updated to {compat} for {db_name}."
