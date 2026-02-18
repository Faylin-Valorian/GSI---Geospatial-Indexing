# Module SQL Assets

Store SQL by module so each module can be packaged independently.

Suggested pattern:

- `db/modules/<module_name>/schema/`
- `db/modules/<module_name>/views/`
- `db/modules/<module_name>/procedures/`
- `db/modules/<module_name>/functions/`
- `db/modules/<module_name>/queries/`

Example:
- `db/modules/processing_tools/procedures/sp_apply_corrections.sql`
