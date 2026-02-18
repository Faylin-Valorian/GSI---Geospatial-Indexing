# Database SQL Organization (SQL-First)

This project uses SQL as the source of truth for MSSQL.

## Folder Layout

- `db/baseline/`
  - Full bootstrap SQL for new environments.
  - Example: `V0001__bootstrap_core.sql`
- `db/migrations/`
  - Incremental schema/data changes for deployments.
  - Naming: `V####__short_description.sql`
- `db/modules/`
  - Module-owned SQL assets.
  - Suggested subfolders per module:
    - `schema/`
    - `views/`
    - `procedures/`
    - `functions/`
    - `queries/`
- `db/seeds/`
  - Reference/config seed data scripts.
- `db/release/`
  - Optional release bundle scripts.
- `db/templates/`
  - Script templates and examples.

## Naming Rules

- Versioned files:
  - `V0001__bootstrap_core.sql`
  - `V0002__add_users_index.sql`
- Use lowercase snake_case after `__`.
- One logical change per migration file.

## Authoring Rules

- Prefer idempotent guards where possible (`IF EXISTS`, `IF NOT EXISTS`).
- Avoid destructive operations unless explicitly required.
- Keep `GO` batch separators only where needed.
- Add short header comments: purpose, dependencies, rollback notes.

## Runtime Use

- First-run setup executes baseline bootstrap.
- Ongoing changes should be added to `db/migrations/`.
- Applied migrations are tracked in `dbo.schema_migrations`.
- Core reference data (for example geography states/counties) should be seeded via versioned migrations so first initialization includes it automatically.
- Keep `db/compat/mssql_schema.sql` as compatibility entrypoint only.
