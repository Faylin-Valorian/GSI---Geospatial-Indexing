/*
    County workflow core:
    - county_jobs (shared selectable job numbers)
    - county_work_items (per-county work state, notes, image, locking)
*/

IF OBJECT_ID('dbo.county_jobs', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.county_jobs (
        id INT IDENTITY(1,1) PRIMARY KEY,
        job_number NVARCHAR(80) NOT NULL,
        is_completed BIT NOT NULL CONSTRAINT DF_county_jobs_is_completed DEFAULT 0,
        completed_at DATETIMEOFFSET NULL,
        completed_by_admin_user_id INT NULL,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_county_jobs_created_at DEFAULT SYSDATETIMEOFFSET(),
        CONSTRAINT UQ_county_jobs_job_number UNIQUE (job_number),
        CONSTRAINT FK_county_jobs_completed_by_admin FOREIGN KEY (completed_by_admin_user_id) REFERENCES dbo.users(id)
    );
END
GO

IF OBJECT_ID('dbo.county_work_items', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.county_work_items (
        county_fips CHAR(5) NOT NULL PRIMARY KEY,
        notes NVARCHAR(MAX) NULL,
        image_name NVARCHAR(260) NULL,
        image_mime NVARCHAR(120) NULL,
        image_data VARBINARY(MAX) NULL,
        is_in_progress BIT NOT NULL CONSTRAINT DF_county_work_items_is_in_progress DEFAULT 0,
        is_working BIT NOT NULL CONSTRAINT DF_county_work_items_is_working DEFAULT 0,
        working_user_id INT NULL,
        is_split_job BIT NOT NULL CONSTRAINT DF_county_work_items_is_split_job DEFAULT 0,
        job_id INT NULL,
        locked_by_user_id INT NULL,
        locked_at DATETIMEOFFSET NULL,
        is_completed BIT NOT NULL CONSTRAINT DF_county_work_items_is_completed DEFAULT 0,
        completed_at DATETIMEOFFSET NULL,
        completed_by_admin_user_id INT NULL,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_county_work_items_created_at DEFAULT SYSDATETIMEOFFSET(),
        updated_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_county_work_items_updated_at DEFAULT SYSDATETIMEOFFSET(),
        CONSTRAINT FK_county_work_items_county FOREIGN KEY (county_fips) REFERENCES dbo.counties(county_fips),
        CONSTRAINT FK_county_work_items_working_user FOREIGN KEY (working_user_id) REFERENCES dbo.users(id),
        CONSTRAINT FK_county_work_items_job FOREIGN KEY (job_id) REFERENCES dbo.county_jobs(id),
        CONSTRAINT FK_county_work_items_locked_user FOREIGN KEY (locked_by_user_id) REFERENCES dbo.users(id),
        CONSTRAINT FK_county_work_items_completed_admin FOREIGN KEY (completed_by_admin_user_id) REFERENCES dbo.users(id)
    );
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_county_work_items_working_user'
      AND object_id = OBJECT_ID('dbo.county_work_items')
)
BEGIN
    CREATE INDEX IX_county_work_items_working_user ON dbo.county_work_items(working_user_id);
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_county_work_items_job_id'
      AND object_id = OBJECT_ID('dbo.county_work_items')
)
BEGIN
    CREATE INDEX IX_county_work_items_job_id ON dbo.county_work_items(job_id);
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_county_work_items_is_completed'
      AND object_id = OBJECT_ID('dbo.county_work_items')
)
BEGIN
    CREATE INDEX IX_county_work_items_is_completed ON dbo.county_work_items(is_completed);
END
GO

