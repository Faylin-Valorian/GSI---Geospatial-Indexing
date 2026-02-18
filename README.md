# GSI - Geospatial Indexing (NEW APP)

## 1) Install dependencies

```bash
pip install -r requirements.txt
```

## 2) First run setup wizard

Start the app, then open:

- `http://127.0.0.1:5000/setup`

The wizard will:

- save your SQL Server connection into `.env`
- execute baseline SQL (`db/baseline/V0001__bootstrap_core.sql`, fallback `db/compat/mssql_schema.sql`)
- apply pending `db/migrations/V*.sql`
- seed core geography reference data (states + counties) via migrations
- create/update the initial admin account
- save optional SMTP settings

## 3) Configure environment

Copy `.env.example` values into your environment (or `.env` loader if you use one):

- `GSI_SECRET_KEY`
- `GSI_MSSQL_CONNECTION_STRING`
- SMTP values for verification emails

Example connection string:

`Driver={ODBC Driver 18 for SQL Server};Server=localhost;Database=GSIEnterprise;UID=sa;PWD=YourStrong!Passw0rd;Encrypt=no;TrustServerCertificate=yes;`

No manual SQL execution is required for initial setup.
You can still run `db/compat/mssql_schema.sql` manually in SSMS if desired.

## Database SQL structure

SQL is organized under `db/`:

- `db/baseline` for full bootstrap
- `db/migrations` for incremental versioned changes
- `db/modules` for module-owned SQL assets
- `db/seeds` for seed data
- `db/release` for release bundle scripts

See `db/README.md` for conventions.

## Security and operations defaults

- CSRF protection is enabled for state-changing requests.
- Session idle timeout is configurable (`GSI_SESSION_TIMEOUT_MINUTES`).
- Security/audit/application logs are written to MSSQL tables:
  - `audit_logs`
  - `security_events`
  - `app_error_logs`
- Health endpoints:
  - `GET /health/live`
  - `GET /health/ready`

## 4) Run app

```bash
python app.py
```

## Add-on Apps (folder modular)

- Add-on app manifests are discovered from `apps/**/addon.json` (grouped or flat).
- Recommended structure for tool-specific navigation:
  - `apps/<tool_group>/<app_folder>/addon.json`
- If an app folder is removed, it disappears from the UI.
- If an app folder is added, it appears after clicking Refresh in the Add-on Apps panel.
- Implemented apps:
  - `Connect to Network Drive` using `db/modules/network_drive_connect/queries/*`
  - `Change Database Compatibility` using `db/modules/database_compatibility/queries/AlterKRSCompatibilityLevel.sql`

## Secure image strategy

Images stay on internal/network storage and are not publicly hosted.

1. Add image source roots in Admin -> `Image Sources`.
2. Modules request images through:

`/api/images/stream?source=<source_key>&path=<relative_path>`

This endpoint:

- requires authenticated user session
- validates source key exists and is enabled
- blocks path traversal
- only serves image mime types
- logs each access in `image_access_logs`
