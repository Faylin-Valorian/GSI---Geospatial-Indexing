from __future__ import annotations

import json
from typing import Any

from flask import request

from gsi_enterprise.db import execute, fetch_one


def client_ip() -> str:
    forwarded = request.headers.get("X-Forwarded-For", "")
    if forwarded:
        return forwarded.split(",")[0].strip()[:64]
    return (request.remote_addr or "")[:64]


def record_security_event(
    event_type: str,
    *,
    subject: str = "",
    user_id: int | None = None,
    details: dict[str, Any] | None = None,
) -> None:
    try:
        execute(
            """
            INSERT INTO security_events (event_type, subject, user_id, ip_address, details_json)
            VALUES (?, ?, ?, ?, ?)
            """,
            (
                event_type[:80],
                subject[:255],
                user_id,
                client_ip(),
                json.dumps(details or {}, ensure_ascii=True),
            ),
        )
    except Exception:
        return


def is_rate_limited(
    event_type: str,
    *,
    subject: str,
    max_attempts: int,
    window_seconds: int,
) -> bool:
    row = fetch_one(
        """
        SELECT COUNT(1) AS c
        FROM security_events
        WHERE event_type = ?
          AND subject = ?
          AND occurred_at >= DATEADD(second, ?, SYSDATETIMEOFFSET())
        """,
        (event_type[:80], subject[:255], -abs(window_seconds)),
    )
    count = int(row["c"]) if row else 0
    return count >= max_attempts
