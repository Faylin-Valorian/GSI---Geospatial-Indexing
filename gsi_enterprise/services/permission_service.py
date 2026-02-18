from __future__ import annotations

from gsi_enterprise.db import fetch_one


def has_module_access(user_id: int | None, role: str | None, module_key: str) -> bool:
    if not module_key:
        return False

    if user_id:
        override = fetch_one(
            """
            SELECT TOP 1 can_access
            FROM user_permissions
            WHERE user_id = ? AND module_key = ?
            """,
            (user_id, module_key),
        )
        if override is not None:
            return bool(override["can_access"])

    if not role:
        return False

    base = fetch_one(
        """
        SELECT TOP 1 can_access
        FROM module_permissions
        WHERE role = ? AND module_key = ?
        """,
        (role, module_key),
    )
    return bool(base and base["can_access"])
