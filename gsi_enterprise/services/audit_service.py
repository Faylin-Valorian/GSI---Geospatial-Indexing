from __future__ import annotations

import json
from typing import Any

from flask import request, session

from gsi_enterprise.db import execute


def log_audit_event(
    event_type: str,
    *,
    actor_user_id: int | None = None,
    target_type: str | None = None,
    target_id: str | None = None,
    details: dict[str, Any] | None = None,
) -> None:
    try:
        actor = actor_user_id if actor_user_id is not None else session.get("user_id")
        execute(
            """
            INSERT INTO audit_logs (event_type, actor_user_id, target_type, target_id, details_json, ip_address, request_path, request_method)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            """,
            (
                event_type,
                actor,
                (target_type or ""),
                (target_id or ""),
                json.dumps(details or {}, ensure_ascii=True),
                request.headers.get("X-Forwarded-For", request.remote_addr or "")[:64],
                request.path[:512],
                request.method[:16],
            ),
        )
    except Exception:
        # Auditing must never break user flows.
        return
