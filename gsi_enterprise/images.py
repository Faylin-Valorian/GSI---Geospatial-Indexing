from __future__ import annotations

import mimetypes
from pathlib import Path

from flask import Blueprint, abort, request, send_file, session

from gsi_enterprise.core.decorators import login_required
from gsi_enterprise.db import execute, fetch_one

images_bp = Blueprint("images", __name__, url_prefix="/api/images")


@images_bp.get("/stream")
@login_required
def stream_image():
    source_key = request.args.get("source", "").strip().lower()
    relative_path = request.args.get("path", "").strip().replace("\\", "/")

    if not source_key or not relative_path:
        abort(400)

    source = fetch_one(
        "SELECT TOP 1 id, source_key, root_path, is_enabled FROM image_sources WHERE source_key = ?",
        (source_key,),
    )
    if not source or not source["is_enabled"]:
        abort(404)

    root = Path(source["root_path"]).expanduser().resolve()
    requested = Path(relative_path)

    if requested.is_absolute() or ".." in requested.parts:
        abort(400)

    absolute_path = (root / requested).resolve()

    # Prevent path traversal outside root.
    if root not in absolute_path.parents and absolute_path != root:
        abort(403)

    if not absolute_path.exists() or not absolute_path.is_file():
        abort(404)

    guessed, _ = mimetypes.guess_type(str(absolute_path))
    if not guessed or not guessed.startswith("image/"):
        abort(415)

    execute(
        """
        INSERT INTO image_access_logs (user_id, source_key, relative_path)
        VALUES (?, ?, ?)
        """,
        (
            session.get("user_id"),
            source_key,
            relative_path,
        ),
    )

    return send_file(
        absolute_path,
        mimetype=guessed,
        as_attachment=False,
        conditional=True,
        etag=True,
        max_age=0,
    )
