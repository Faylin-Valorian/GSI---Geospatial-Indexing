from __future__ import annotations

import hashlib
import re
from pathlib import Path

import pyodbc
from flask import current_app

from gsi_enterprise.db import get_db

_GO_SPLIT_RE = re.compile(r"^\s*GO\s*$", flags=re.IGNORECASE | re.MULTILINE)


def _ensure_schema_migrations_table(cursor: pyodbc.Cursor) -> None:
    cursor.execute(
        """
        IF OBJECT_ID('dbo.schema_migrations', 'U') IS NULL
        BEGIN
            CREATE TABLE dbo.schema_migrations (
                id INT IDENTITY(1,1) PRIMARY KEY,
                script_name NVARCHAR(255) NOT NULL UNIQUE,
                checksum NVARCHAR(64) NOT NULL,
                applied_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_schema_migrations_applied_at DEFAULT SYSDATETIMEOFFSET()
            );
        END
        """
    )


def _execute_script_batches(cursor: pyodbc.Cursor, script_text: str) -> None:
    batches = [batch.strip() for batch in _GO_SPLIT_RE.split(script_text) if batch.strip()]
    for batch in batches:
        cursor.execute(batch)


def apply_pending_migrations(
    connection_string: str | None = None,
    *,
    checksum_policy: str = "strict",
) -> list[str]:
    root = Path(__file__).resolve().parents[2]
    migrations_dir = root / "db" / "migrations"
    files = sorted(migrations_dir.glob("V*.sql"))

    if not files:
        return []

    owns_connection = connection_string is not None
    conn = pyodbc.connect(connection_string, timeout=5) if connection_string else get_db()
    applied: list[str] = []

    try:
        cursor = conn.cursor()
        _ensure_schema_migrations_table(cursor)
        conn.commit()

        for path in files:
            script_name = path.name
            script_text = path.read_text(encoding="utf-8")
            checksum = hashlib.sha256(script_text.encode("utf-8")).hexdigest()

            cursor.execute(
                "SELECT TOP 1 checksum FROM schema_migrations WHERE script_name = ?",
                (script_name,),
            )
            row = cursor.fetchone()
            if row:
                if row[0] != checksum:
                    if checksum_policy == "repair":
                        cursor.execute(
                            "UPDATE schema_migrations SET checksum = ? WHERE script_name = ?",
                            (checksum, script_name),
                        )
                        conn.commit()
                        continue
                    raise RuntimeError(
                        f"Migration checksum mismatch for {script_name}. "
                        "Set GSI_MIGRATION_CHECKSUM_POLICY=repair for a one-time checksum repair, "
                        "then switch back to strict."
                    )
                continue

            _execute_script_batches(cursor, script_text)
            cursor.execute(
                "INSERT INTO schema_migrations (script_name, checksum) VALUES (?, ?)",
                (script_name, checksum),
            )
            conn.commit()
            applied.append(script_name)

        return applied
    finally:
        if owns_connection:
            conn.close()


def apply_pending_migrations_on_startup(connection_string: str | None = None) -> list[str]:
    policy = str(current_app.config.get("MIGRATION_CHECKSUM_POLICY", "strict")).strip().lower()
    if policy not in ("strict", "repair"):
        policy = "strict"
    applied = apply_pending_migrations(connection_string=connection_string, checksum_policy=policy)
    if applied:
        current_app.logger.info("Applied DB migrations: %s", ", ".join(applied))
    return applied
