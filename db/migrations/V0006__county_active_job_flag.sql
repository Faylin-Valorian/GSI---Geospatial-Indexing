/*
    Adds explicit county workflow stage for "active job but pending".
*/
IF OBJECT_ID('dbo.county_work_items', 'U') IS NOT NULL
BEGIN
    IF COL_LENGTH('dbo.county_work_items', 'is_active_job') IS NULL
    BEGIN
        ALTER TABLE dbo.county_work_items
        ADD is_active_job BIT NOT NULL
            CONSTRAINT DF_county_work_items_is_active_job DEFAULT 0;
    END
END

