from __future__ import annotations

import os
from pathlib import Path


def _load_local_env_file() -> None:
    env_file = Path(__file__).resolve().parent / ".env"
    if not env_file.exists():
        return

    for raw_line in env_file.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue

        key, value = line.split("=", 1)
        key = key.strip()
        value = value.strip().strip('"').strip("'")
        if key:
            os.environ.setdefault(key, value)


_load_local_env_file()

from gsi_enterprise import create_app

app = create_app()

if __name__ == "__main__":
    app.run(debug=os.getenv("GSI_DEBUG", "0") == "1")
