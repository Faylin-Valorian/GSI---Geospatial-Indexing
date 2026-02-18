from __future__ import annotations

import pyodbc
from flask import current_app


def _has_required_schema(conn: pyodbc.Connection) -> bool:
    cur = conn.cursor()
    cur.execute("SELECT OBJECT_ID('dbo.users', 'U') AS users_id")
    row = cur.fetchone()
    return bool(row and row[0])


def is_setup_ready() -> bool:
    conn_str = current_app.config.get("MSSQL_CONNECTION_STRING", "").strip()
    if not conn_str:
        return False

    conn: pyodbc.Connection | None = None
    try:
        conn = pyodbc.connect(conn_str, timeout=3)
        return _has_required_schema(conn)
    except pyodbc.Error:
        return False
    finally:
        if conn is not None:
            conn.close()


def is_setup_locked() -> bool:
    conn_str = current_app.config.get("MSSQL_CONNECTION_STRING", "").strip()
    if not conn_str:
        return False

    conn: pyodbc.Connection | None = None
    try:
        conn = pyodbc.connect(conn_str, timeout=3)
        cur = conn.cursor()
        cur.execute(
            """
            SELECT TOP 1 value
            FROM app_settings
            WHERE [key] = 'setup_locked'
            """
        )
        row = cur.fetchone()
        if not row:
            return False
        value = str(row[0]).strip().lower()
        return value in ("1", "true", "yes")
    except pyodbc.Error:
        return False
    finally:
        if conn is not None:
            conn.close()
