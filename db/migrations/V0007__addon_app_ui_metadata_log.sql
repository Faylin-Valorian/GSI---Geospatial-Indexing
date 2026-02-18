/*
    Purpose: Persist add-on UI metadata strings that are hidden from end users.
    Notes:
      - Stores prior UI text such as:
        - "Group: ... · App ID: ... · Module key: ..."
        - "<category> · <type>"
*/

IF OBJECT_ID('dbo.addon_app_ui_metadata_log', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.addon_app_ui_metadata_log (
        id INT IDENTITY(1,1) PRIMARY KEY,
        app_id NVARCHAR(64) NOT NULL UNIQUE,
        app_title NVARCHAR(255) NOT NULL,
        nav_group NVARCHAR(64) NOT NULL,
        nav_group_label NVARCHAR(128) NOT NULL,
        module_key NVARCHAR(128) NOT NULL,
        app_type NVARCHAR(64) NOT NULL,
        category NVARCHAR(128) NOT NULL,
        header_meta_text NVARCHAR(512) NOT NULL,
        button_meta_text NVARCHAR(255) NOT NULL,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_addon_app_ui_metadata_log_created_at DEFAULT SYSDATETIMEOFFSET(),
        updated_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_addon_app_ui_metadata_log_updated_at DEFAULT SYSDATETIMEOFFSET()
    );
END
