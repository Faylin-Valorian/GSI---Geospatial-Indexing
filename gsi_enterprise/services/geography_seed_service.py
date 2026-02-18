from __future__ import annotations

import csv
from pathlib import Path

import pyodbc

from gsi_enterprise.db import get_db

STATE_SEED_ROWS: list[tuple[str, str, str]] = [
    ("01", "AL", "Alabama"), ("02", "AK", "Alaska"), ("04", "AZ", "Arizona"), ("05", "AR", "Arkansas"),
    ("06", "CA", "California"), ("08", "CO", "Colorado"), ("09", "CT", "Connecticut"), ("10", "DE", "Delaware"),
    ("11", "DC", "District of Columbia"), ("12", "FL", "Florida"), ("13", "GA", "Georgia"), ("15", "HI", "Hawaii"),
    ("16", "ID", "Idaho"), ("17", "IL", "Illinois"), ("18", "IN", "Indiana"), ("19", "IA", "Iowa"),
    ("20", "KS", "Kansas"), ("21", "KY", "Kentucky"), ("22", "LA", "Louisiana"), ("23", "ME", "Maine"),
    ("24", "MD", "Maryland"), ("25", "MA", "Massachusetts"), ("26", "MI", "Michigan"), ("27", "MN", "Minnesota"),
    ("28", "MS", "Mississippi"), ("29", "MO", "Missouri"), ("30", "MT", "Montana"), ("31", "NE", "Nebraska"),
    ("32", "NV", "Nevada"), ("33", "NH", "New Hampshire"), ("34", "NJ", "New Jersey"), ("35", "NM", "New Mexico"),
    ("36", "NY", "New York"), ("37", "NC", "North Carolina"), ("38", "ND", "North Dakota"), ("39", "OH", "Ohio"),
    ("40", "OK", "Oklahoma"), ("41", "OR", "Oregon"), ("42", "PA", "Pennsylvania"), ("44", "RI", "Rhode Island"),
    ("45", "SC", "South Carolina"), ("46", "SD", "South Dakota"), ("47", "TN", "Tennessee"), ("48", "TX", "Texas"),
    ("49", "UT", "Utah"), ("50", "VT", "Vermont"), ("51", "VA", "Virginia"), ("53", "WA", "Washington"),
    ("54", "WV", "West Virginia"), ("55", "WI", "Wisconsin"), ("56", "WY", "Wyoming"), ("72", "PR", "Puerto Rico"),
]


def ensure_states_seeded(connection_string: str | None = None) -> int:
    owns_connection = connection_string is not None
    conn = pyodbc.connect(connection_string, timeout=5) if connection_string else get_db()
    inserted = 0
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT OBJECT_ID('dbo.states', 'U')")
        row = cursor.fetchone()
        if not row or not row[0]:
            return 0

        for state_fips, state_code, state_name in STATE_SEED_ROWS:
            cursor.execute("SELECT TOP 1 1 FROM dbo.states WHERE state_fips = ?", (state_fips,))
            if cursor.fetchone():
                continue
            cursor.execute(
                "INSERT INTO dbo.states (state_fips, state_code, state_name, is_active) VALUES (?, ?, ?, 0)",
                (state_fips, state_code, state_name),
            )
            inserted += 1
        if inserted > 0:
            conn.commit()
        return inserted
    finally:
        if owns_connection:
            conn.close()


def ensure_counties_seeded_from_csv(connection_string: str | None = None) -> int:
    root = Path(__file__).resolve().parents[2]
    csv_path = root / "db" / "seeds" / "us_counties.csv"
    if not csv_path.exists():
        return 0

    ensure_states_seeded(connection_string)

    owns_connection = connection_string is not None
    conn = pyodbc.connect(connection_string, timeout=5) if connection_string else get_db()

    try:
        cursor = conn.cursor()
        cursor.execute(
            """
            SELECT
                OBJECT_ID('dbo.states', 'U') AS states_obj,
                OBJECT_ID('dbo.counties', 'U') AS counties_obj
            """
        )
        row = cursor.fetchone()
        if not row or not row[0] or not row[1]:
            return 0

        cursor.execute("SELECT county_fips FROM dbo.counties")
        existing = {str(r[0]).strip() for r in cursor.fetchall()}

        pending: list[tuple[str, str, str, int]] = []
        with csv_path.open(newline="", encoding="utf-8") as handle:
            reader = csv.DictReader(handle)
            for raw in reader:
                county_fips = str(raw.get("county_fips", "")).strip()
                state_fips = str(raw.get("state_fips", "")).strip()
                county_name = str(raw.get("county_name", "")).strip()
                if len(county_fips) != 5 or not county_fips.isdigit():
                    continue
                if len(state_fips) != 2 or not state_fips.isdigit():
                    continue
                if not county_name:
                    continue
                if county_fips in existing:
                    continue
                pending.append((county_fips, state_fips, county_name[:160], 0))

        if pending:
            cursor.executemany(
                """
                INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active)
                VALUES (?, ?, ?, ?)
                """,
                pending,
            )
        conn.commit()
        return len(pending)
    finally:
        if owns_connection:
            conn.close()
