/*
    Purpose: Persist admin-defined ordering for add-on app buttons.
*/

IF OBJECT_ID('dbo.addon_app_ordering', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.addon_app_ordering (
        id INT IDENTITY(1,1) PRIMARY KEY,
        app_id NVARCHAR(64) NOT NULL UNIQUE,
        nav_group NVARCHAR(64) NOT NULL,
        sort_order INT NOT NULL,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_addon_app_ordering_created_at DEFAULT SYSDATETIMEOFFSET(),
        updated_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_addon_app_ordering_updated_at DEFAULT SYSDATETIMEOFFSET()
    );
END
