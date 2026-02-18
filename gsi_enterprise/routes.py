from __future__ import annotations

from io import BytesIO

from flask import Blueprint, current_app, jsonify, render_template, request, send_file, session

from gsi_enterprise.core.decorators import module_access_required
from gsi_enterprise.db import execute, fetch_all, fetch_one, get_db

main_bp = Blueprint("main", __name__)


@main_bp.get("/")
@module_access_required("map_dashboard")
def dashboard() -> str:
    open_overlay = request.args.get("overlay", "").strip().lower()
    return render_template(
        "dashboard.html",
        is_admin=session.get("role") == "admin",
        open_overlay=open_overlay,
    )


@main_bp.get("/api/map/overlays/active")
@module_access_required("map_dashboard")
def api_map_overlays_active():
    user_id = int(session.get("user_id") or 0)
    try:
        states = fetch_all(
            """
            SELECT state_fips
            FROM states
            WHERE is_active = 1
            ORDER BY state_fips
            """
        )
        counties = fetch_all(
            """
            SELECT
                RIGHT('00000' + LTRIM(RTRIM(c.county_fips)), 5) AS county_fips,
                c.is_active,
                COALESCE(cwi.is_active_job, 0) AS is_active_job,
                COALESCE(cwi.is_in_progress, 0) AS is_in_progress,
                COALESCE(cwi.is_working, 0) AS is_working,
                COALESCE(cwi.working_user_id, 0) AS working_user_id,
                COALESCE(cwi.is_completed, 0) AS is_completed
            FROM counties c
            JOIN states s ON s.state_fips = c.state_fips
            LEFT JOIN county_work_items cwi
                ON RIGHT('00000' + LTRIM(RTRIM(cwi.county_fips)), 5) = RIGHT('00000' + LTRIM(RTRIM(c.county_fips)), 5)
            WHERE s.is_active = 1
            ORDER BY county_fips
            """
        )
        county_statuses = []
        for row in counties:
            status = "inactive"
            if bool(row["is_completed"]):
                status = "completed"
            elif bool(row["is_working"]):
                status = "working_self" if int(row["working_user_id"] or 0) == user_id else "working_other"
            elif bool(row["is_in_progress"]):
                status = "in_progress"
            elif bool(row["is_active_job"]):
                status = "active_job"
            elif bool(row["is_active"]):
                status = "active"
            county_statuses.append({"county_fips": row["county_fips"], "status": status})
        return jsonify(
            {
                "active_state_fips": [r["state_fips"] for r in states],
                "county_statuses": county_statuses,
            }
        )
    except Exception:
        try:
            states = fetch_all(
                """
                SELECT state_fips
                FROM states
                WHERE is_active = 1
                ORDER BY state_fips
                """
            )
            counties = fetch_all(
                """
                SELECT RIGHT('00000' + LTRIM(RTRIM(c.county_fips)), 5) AS county_fips
                FROM counties c
                JOIN states s ON s.state_fips = c.state_fips
                WHERE s.is_active = 1
                  AND c.is_active = 1
                ORDER BY county_fips
                """
            )
            return jsonify(
                {
                    "active_state_fips": [r["state_fips"] for r in states],
                    "county_statuses": [{"county_fips": r["county_fips"], "status": "active"} for r in counties],
                }
            )
        except Exception:
            return jsonify({"active_state_fips": [], "county_statuses": []})


def _parse_bool(value: object, default: bool = False) -> bool:
    if value is None:
        return default
    if isinstance(value, bool):
        return value
    return str(value).strip().lower() in ("1", "true", "yes", "on")


def _normalize_fips_str(value: object, width: int) -> str:
    raw = str(value or "").strip()
    return raw.zfill(width)


def _resolve_county_fips(county_fips: str) -> str | None:
    row = fetch_one("SELECT TOP 1 county_fips FROM counties WHERE county_fips = ?", (county_fips,))
    if row:
        return str(row["county_fips"]).strip()
    rows = fetch_all("SELECT county_fips FROM counties")
    target = _normalize_fips_str(county_fips, 5)
    for item in rows:
        current = _normalize_fips_str(item.get("county_fips"), 5)
        if current == target:
            return str(item.get("county_fips", "")).strip()
    return None


def _basic_county_details(county_fips: str) -> dict | None:
    canonical = _resolve_county_fips(county_fips)
    if not canonical:
        return None
    county = fetch_one(
        """
        SELECT TOP 1 county_fips, county_name, is_active AS county_is_active, state_fips
        FROM counties
        WHERE county_fips = ?
        """,
        (canonical,),
    )
    if not county:
        return None
    state = fetch_one("SELECT TOP 1 state_name, is_active AS state_is_active FROM states WHERE state_fips = ?", (county["state_fips"],))
    return {
        "county_fips": _normalize_fips_str(county["county_fips"], 5),
        "county_name": county["county_name"],
        "county_is_active": bool(county["county_is_active"]),
        "state_fips": county["state_fips"],
        "state_name": (state["state_name"] if state else ""),
        "state_is_active": bool(state["state_is_active"]) if state else False,
    }


def _ensure_county_work_item(county_fips: str) -> None:
    execute(
        """
        IF OBJECT_ID('dbo.county_work_items', 'U') IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM county_work_items WHERE county_fips = ?)
                INSERT INTO county_work_items (county_fips) VALUES (?)
        END
        """,
        (county_fips, county_fips),
    )


def _county_work_details(county_fips: str) -> dict | None:
    try:
        canonical = _resolve_county_fips(county_fips)
        if not canonical:
            return None
    except Exception:
        return None
    return fetch_one(
        """
        SELECT
            RIGHT('00000' + LTRIM(RTRIM(c.county_fips)), 5) AS county_fips,
            c.county_name,
            c.is_active AS county_is_active,
            c.state_fips,
            s.state_name,
            s.is_active AS state_is_active,
            COALESCE(cwi.notes, '') AS notes,
            COALESCE(cwi.is_active_job, 0) AS is_active_job,
            COALESCE(cwi.is_in_progress, 0) AS is_in_progress,
            COALESCE(cwi.is_working, 0) AS is_working,
            cwi.working_user_id,
            w.username AS working_username,
            COALESCE(cwi.is_split_job, 0) AS is_split_job,
            COALESCE(cwi.is_completed, 0) AS is_completed,
            CONVERT(NVARCHAR(40), cwi.completed_at, 127) AS completed_at,
            cwi.completed_by_admin_user_id,
            ca.username AS completed_by_admin_username,
            CASE WHEN cwi.image_data IS NULL THEN 0 ELSE 1 END AS has_image
        FROM counties c
        JOIN states s ON s.state_fips = c.state_fips
        LEFT JOIN county_work_items cwi ON cwi.county_fips = c.county_fips
        LEFT JOIN users w ON w.id = cwi.working_user_id
        LEFT JOIN users ca ON ca.id = cwi.completed_by_admin_user_id
        WHERE c.county_fips = ?
        """,
        (canonical,),
    )


@main_bp.get("/api/counties/<county_fips>/work")
@module_access_required("map_dashboard")
def api_county_work_details(county_fips: str):
    try:
        county_key = str(county_fips).strip()
        if len(county_key) != 5 or not county_key.isdigit():
            return jsonify({"success": False, "message": "Invalid county FIPS."}), 400
        canonical_fips = _resolve_county_fips(county_key)
        if not canonical_fips:
            return jsonify({"success": False, "message": "County not found."}), 404
        try:
            _ensure_county_work_item(canonical_fips)
            row = _county_work_details(county_key)
        except Exception:
            row = _basic_county_details(county_key)
            if not row:
                return jsonify({"success": False, "message": "County not found."}), 404
            return jsonify(
                {
                    "success": True,
                    "county": {
                        "county_fips": row["county_fips"],
                        "county_name": row["county_name"],
                        "state_fips": row["state_fips"],
                        "state_name": row["state_name"],
                        "state_is_active": bool(row["state_is_active"]),
                        "county_is_active": bool(row["county_is_active"]),
                        "is_active_job": False,
                        "is_in_progress": False,
                        "is_working": False,
                        "working_user_id": None,
                        "working_username": "",
                        "is_split_job": False,
                        "is_completed": False,
                        "completed_at": None,
                        "completed_by_admin_user_id": None,
                        "completed_by_admin_username": "",
                        "notes": "",
                        "has_image": False,
                        "image_url": "",
                    },
                    "is_admin": session.get("role") == "admin",
                    "current_user_id": session.get("user_id"),
                }
            )
        if not row:
            return jsonify({"success": False, "message": "County not found."}), 404

        return jsonify(
            {
                "success": True,
                "county": {
                    "county_fips": row["county_fips"],
                    "county_name": row["county_name"],
                    "state_fips": row["state_fips"],
                    "state_name": row["state_name"],
                    "state_is_active": bool(row["state_is_active"]),
                    "county_is_active": bool(row["county_is_active"]),
                    "is_active_job": bool(row["is_active_job"]),
                    "is_in_progress": bool(row["is_in_progress"]),
                    "is_working": bool(row["is_working"]),
                    "working_user_id": row["working_user_id"],
                    "working_username": row["working_username"],
                    "is_split_job": bool(row["is_split_job"]),
                    "is_completed": bool(row["is_completed"]),
                    "completed_at": (str(row["completed_at"]) if row["completed_at"] else None),
                    "completed_by_admin_user_id": row["completed_by_admin_user_id"],
                    "completed_by_admin_username": row["completed_by_admin_username"],
                    "notes": row["notes"],
                    "has_image": bool(row["has_image"]),
                    "image_url": f"/api/counties/{county_key}/image" if row["has_image"] else "",
                },
                "is_admin": session.get("role") == "admin",
                "current_user_id": session.get("user_id"),
            }
        )
    except Exception:
        current_app.logger.exception("County click/details endpoint failed for county_fips=%s", county_fips)
        row = _basic_county_details(str(county_fips).strip())
        if not row:
            return jsonify({"success": False, "message": "Failed to load county details."}), 500
        return jsonify(
            {
                "success": True,
                "county": {
                    "county_fips": row["county_fips"],
                    "county_name": row["county_name"],
                    "state_fips": row["state_fips"],
                    "state_name": row["state_name"],
                    "state_is_active": bool(row["state_is_active"]),
                    "county_is_active": bool(row["county_is_active"]),
                    "is_active_job": False,
                    "is_in_progress": False,
                    "is_working": False,
                    "working_user_id": None,
                    "working_username": "",
                    "is_split_job": False,
                    "is_completed": False,
                    "completed_at": None,
                    "completed_by_admin_user_id": None,
                    "completed_by_admin_username": "",
                    "notes": "",
                    "has_image": False,
                    "image_url": "",
                },
                "is_admin": session.get("role") == "admin",
                "current_user_id": session.get("user_id"),
            }
        )


@main_bp.post("/api/counties/<county_fips>/work")
@module_access_required("map_dashboard")
def api_county_work_update(county_fips: str):
    try:
        county_key = str(county_fips).strip()
        if len(county_key) != 5 or not county_key.isdigit():
            return jsonify({"success": False, "message": "Invalid county FIPS."}), 400
        canonical_fips = _resolve_county_fips(county_key)
        if not canonical_fips:
            return jsonify({"success": False, "message": "County not found."}), 404

        try:
            _ensure_county_work_item(canonical_fips)
            row = _county_work_details(county_key)
        except Exception:
            return jsonify({"success": False, "message": "County workflow tables are not available yet."}), 400
        if not row:
            return jsonify({"success": False, "message": "County not found."}), 404

        user_id = int(session.get("user_id") or 0)
        is_admin = session.get("role") == "admin"
        payload = request.get_json(silent=True) or {}

        if not bool(row["state_is_active"]) and not is_admin:
            return jsonify({"success": False, "message": "State is not active for this county."}), 400
        if bool(row["is_completed"]) and not is_admin:
            return jsonify({"success": False, "message": "County is completed and locked by admin."}), 400

        notes = str(payload.get("notes", row["notes"] or "")).strip()
        requested_working = _parse_bool(payload.get("is_working"), bool(row["is_working"]))
        requested_progress = _parse_bool(payload.get("is_in_progress"), bool(row["is_in_progress"]))
        requested_split = _parse_bool(payload.get("is_split_job"), bool(row["is_split_job"]))
        # In Progress takes precedence over Working On.
        if requested_progress:
            requested_working = False

        current_working_user = int(row["working_user_id"] or 0)
        worked_by_other = bool(row["is_working"]) and current_working_user > 0 and current_working_user != user_id

        if worked_by_other and requested_working:
            return jsonify({"success": False, "message": f"County is already being worked by {row['working_username'] or 'another user'}."}), 409
        if worked_by_other and not is_admin:
            return jsonify({"success": False, "message": f"County is locked by {row['working_username'] or 'another user'}."}), 409

        new_working_user_id = row["working_user_id"]
        if requested_working:
            new_working_user_id = user_id
            requested_progress = False
        else:
            new_working_user_id = None

        execute(
            """
            UPDATE county_work_items
            SET
                notes = ?,
                is_in_progress = ?,
                is_working = ?,
                working_user_id = ?,
                is_split_job = ?,
                is_active_job = CASE WHEN ? = 1 OR ? = 1 OR ? = 1 THEN 1 ELSE is_active_job END,
                updated_at = SYSDATETIMEOFFSET()
            WHERE county_fips = ?
            """,
            (
                notes,
                1 if requested_progress else 0,
                1 if requested_working else 0,
                new_working_user_id,
                1 if requested_split else 0,
                1 if requested_progress else 0,
                1 if requested_working else 0,
                1 if requested_split else 0,
                canonical_fips,
            ),
        )
        return jsonify({"success": True})
    except Exception as exc:
        current_app.logger.exception("County work save failed for county_fips=%s", county_fips)
        return jsonify(
            {
                "success": False,
                "message": f"Unable to save county workflow. Confirm migration V0005 is applied. ({exc})",
            }
        ), 400


@main_bp.post("/api/counties/<county_fips>/work/complete")
@module_access_required("map_dashboard")
def api_county_mark_complete(county_fips: str):
    county_key = str(county_fips).strip()
    if len(county_key) != 5 or not county_key.isdigit():
        return jsonify({"success": False, "message": "Invalid county FIPS."}), 400
    canonical_fips = _resolve_county_fips(county_key)
    if not canonical_fips:
        return jsonify({"success": False, "message": "County not found."}), 404

    try:
        _ensure_county_work_item(canonical_fips)
    except Exception:
        return jsonify({"success": False, "message": "County workflow tables are not available yet."}), 400
    payload = request.get_json(silent=True) or {}
    is_completed = _parse_bool(payload.get("is_completed"), True)
    if is_completed:
        execute(
            """
            UPDATE county_work_items
            SET
                is_completed = 1,
                completed_at = SYSDATETIMEOFFSET(),
                completed_by_admin_user_id = ?,
                is_working = 0,
                working_user_id = NULL,
                is_in_progress = 0,
                is_split_job = 0,
                is_active_job = 1,
                updated_at = SYSDATETIMEOFFSET()
            WHERE county_fips = ?
            """,
            (session.get("user_id"), canonical_fips),
        )
    else:
        execute(
            """
            UPDATE county_work_items
            SET
                is_completed = 0,
                completed_at = NULL,
                completed_by_admin_user_id = NULL,
                is_active_job = CASE WHEN is_in_progress = 1 OR is_working = 1 OR is_split_job = 1 THEN 1 ELSE is_active_job END,
                updated_at = SYSDATETIMEOFFSET()
            WHERE county_fips = ?
            """,
            (canonical_fips,),
        )
    return jsonify({"success": True})


@main_bp.post("/api/counties/<county_fips>/image")
@module_access_required("map_dashboard")
def api_county_image_upload(county_fips: str):
    county_key = str(county_fips).strip()
    if len(county_key) != 5 or not county_key.isdigit():
        return jsonify({"success": False, "message": "Invalid county FIPS."}), 400
    canonical_fips = _resolve_county_fips(county_key)
    if not canonical_fips:
        return jsonify({"success": False, "message": "County not found."}), 404

    try:
        _ensure_county_work_item(canonical_fips)
        row = _county_work_details(county_key)
    except Exception:
        return jsonify({"success": False, "message": "County workflow tables are not available yet."}), 400
    if not row:
        return jsonify({"success": False, "message": "County not found."}), 404

    user_id = int(session.get("user_id") or 0)
    is_admin = session.get("role") == "admin"
    if not is_admin and int(row.get("working_user_id") or 0) != user_id:
        return jsonify({"success": False, "message": "You can upload only for counties assigned to you."}), 403

    if "image" not in request.files:
        return jsonify({"success": False, "message": "No image file uploaded."}), 400
    file = request.files["image"]
    if not file or not file.filename:
        return jsonify({"success": False, "message": "No image file uploaded."}), 400

    mime = str(file.mimetype or "").lower()
    if not mime.startswith("image/"):
        return jsonify({"success": False, "message": "Only image uploads are supported."}), 400

    data = file.read()
    if not data:
        return jsonify({"success": False, "message": "Uploaded file was empty."}), 400
    if len(data) > 10 * 1024 * 1024:
        return jsonify({"success": False, "message": "Image exceeds 10MB limit."}), 400

    execute(
        """
        UPDATE county_work_items
        SET image_name = ?, image_mime = ?, image_data = ?, updated_at = SYSDATETIMEOFFSET()
        WHERE county_fips = ?
        """,
        (file.filename[:260], mime[:120], data, canonical_fips),
    )
    return jsonify({"success": True})


@main_bp.get("/api/counties/<county_fips>/image")
@module_access_required("map_dashboard")
def api_county_image_get(county_fips: str):
    county_key = str(county_fips).strip()
    if len(county_key) != 5 or not county_key.isdigit():
        return jsonify({"success": False, "message": "Invalid county FIPS."}), 400
    canonical_fips = _resolve_county_fips(county_key)
    if not canonical_fips:
        return jsonify({"success": False, "message": "County not found."}), 404
    try:
        conn = get_db()
        cur = conn.cursor()
        cur.execute(
            """
            SELECT TOP 1 image_name, image_mime, image_data
        FROM county_work_items
        WHERE county_fips = ?
        """,
            (canonical_fips,),
        )
        row = cur.fetchone()
    except Exception:
        return jsonify({"success": False, "message": "County workflow tables are not available yet."}), 400
    if not row or row[2] is None:
        return jsonify({"success": False, "message": "No image found."}), 404
    image_name = str(row[0] or f"{county_key}.png")
    image_mime = str(row[1] or "image/png")
    data = bytes(row[2])
    return send_file(
        BytesIO(data),
        mimetype=image_mime,
        as_attachment=False,
        download_name=image_name,
    )
