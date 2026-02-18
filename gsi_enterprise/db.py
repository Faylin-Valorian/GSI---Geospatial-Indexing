from __future__ import annotations

from typing import Any

import pyodbc
from flask import current_app, g


def get_db() -> pyodbc.Connection:
    if "db" not in g:
        conn_str = current_app.config.get("MSSQL_CONNECTION_STRING", "").strip()
        if not conn_str:
            raise RuntimeError(
                "GSI_MSSQL_CONNECTION_STRING is not configured. Please set it before running the app."
            )
        g.db = pyodbc.connect(conn_str)
    return g.db


def close_db(_: object = None) -> None:
    db = g.pop("db", None)
    if db is not None:
        db.close()


def _row_to_dict(cursor: pyodbc.Cursor, row: Any) -> dict[str, Any]:
    cols = [col[0] for col in cursor.description]
    return {cols[idx]: row[idx] for idx in range(len(cols))}


def fetch_one(query: str, params: tuple[Any, ...] = ()) -> dict[str, Any] | None:
    conn = get_db()
    cur = conn.cursor()
    try:
        cur.execute(query, params)
        row = cur.fetchone()
        if row is None:
            return None
        return _row_to_dict(cur, row)
    finally:
        try:
            cur.close()
        except Exception:
            pass


def fetch_all(query: str, params: tuple[Any, ...] = ()) -> list[dict[str, Any]]:
    conn = get_db()
    cur = conn.cursor()
    try:
        cur.execute(query, params)
        rows = cur.fetchall()
        if not rows:
            return []
        return [_row_to_dict(cur, row) for row in rows]
    finally:
        try:
            cur.close()
        except Exception:
            pass


def execute(query: str, params: tuple[Any, ...] = (), commit: bool = True) -> int:
    conn = get_db()
    cur = conn.cursor()
    try:
        cur.execute(query, params)
        affected = cur.rowcount
        if commit:
            conn.commit()
        return affected
    finally:
        try:
            cur.close()
        except Exception:
            pass
