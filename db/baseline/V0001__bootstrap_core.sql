/*
    GSI - Geospatial Indexing - SQL Server Bootstrap
    Run this script against your MSSQL instance/database.
*/

IF DB_ID('GSIEnterprise') IS NULL
BEGIN
    CREATE DATABASE GSIEnterprise;
END
GO

USE GSIEnterprise;
GO

IF OBJECT_ID('dbo.users', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.users (
        id INT IDENTITY(1,1) PRIMARY KEY,
        username NVARCHAR(100) NOT NULL UNIQUE,
        email NVARCHAR(255) NOT NULL UNIQUE,
        password_hash NVARCHAR(255) NOT NULL,
        role NVARCHAR(20) NOT NULL CONSTRAINT DF_users_role DEFAULT 'user',
        is_active BIT NOT NULL CONSTRAINT DF_users_is_active DEFAULT 1,
        is_verified BIT NOT NULL CONSTRAINT DF_users_is_verified DEFAULT 0,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_users_created_at DEFAULT SYSDATETIMEOFFSET()
    );
END
GO

IF OBJECT_ID('dbo.verification_codes', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.verification_codes (
        id INT IDENTITY(1,1) PRIMARY KEY,
        user_id INT NOT NULL,
        code NVARCHAR(10) NOT NULL,
        expires_at DATETIMEOFFSET NOT NULL,
        used_at DATETIMEOFFSET NULL,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_verification_codes_created_at DEFAULT SYSDATETIMEOFFSET(),
        CONSTRAINT FK_verification_codes_users FOREIGN KEY (user_id) REFERENCES dbo.users(id) ON DELETE CASCADE
    );
END
GO

IF OBJECT_ID('dbo.app_settings', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.app_settings (
        [key] NVARCHAR(120) PRIMARY KEY,
        value NVARCHAR(MAX) NOT NULL
    );
END
GO

IF OBJECT_ID('dbo.domain_policies', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.domain_policies (
        id INT IDENTITY(1,1) PRIMARY KEY,
        domain NVARCHAR(255) NOT NULL UNIQUE,
        is_enabled BIT NOT NULL CONSTRAINT DF_domain_policies_is_enabled DEFAULT 1,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_domain_policies_created_at DEFAULT SYSDATETIMEOFFSET()
    );
END
GO

IF OBJECT_ID('dbo.module_permissions', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.module_permissions (
        id INT IDENTITY(1,1) PRIMARY KEY,
        role NVARCHAR(20) NOT NULL,
        module_key NVARCHAR(120) NOT NULL,
        can_access BIT NOT NULL CONSTRAINT DF_module_permissions_can_access DEFAULT 1,
        CONSTRAINT UQ_module_permissions_role_module UNIQUE (role, module_key)
    );
END
GO

IF OBJECT_ID('dbo.image_sources', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.image_sources (
        id INT IDENTITY(1,1) PRIMARY KEY,
        source_key NVARCHAR(80) NOT NULL UNIQUE,
        root_path NVARCHAR(1024) NOT NULL,
        is_enabled BIT NOT NULL CONSTRAINT DF_image_sources_is_enabled DEFAULT 1,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_image_sources_created_at DEFAULT SYSDATETIMEOFFSET()
    );
END
GO

IF OBJECT_ID('dbo.image_access_logs', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.image_access_logs (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        user_id INT NULL,
        source_key NVARCHAR(80) NOT NULL,
        relative_path NVARCHAR(2048) NOT NULL,
        accessed_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_image_access_logs_accessed_at DEFAULT SYSDATETIMEOFFSET()
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'restrict_registration_domains')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('restrict_registration_domains', '0');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'verification_from_email')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('verification_from_email', '');
GO

/* Seed module permissions */
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='admin' AND module_key='map_dashboard')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('admin','map_dashboard',1);
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='admin' AND module_key='admin_dashboard')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('admin','admin_dashboard',1);
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='admin' AND module_key='setup_tools')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('admin','setup_tools',1);
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='admin' AND module_key='processing_tools')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('admin','processing_tools',1);
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='admin' AND module_key='reporting')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('admin','reporting',1);

IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='user' AND module_key='map_dashboard')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('user','map_dashboard',1);
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='user' AND module_key='admin_dashboard')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('user','admin_dashboard',0);
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='user' AND module_key='setup_tools')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('user','setup_tools',1);
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='user' AND module_key='processing_tools')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('user','processing_tools',1);
IF NOT EXISTS (SELECT 1 FROM dbo.module_permissions WHERE role='user' AND module_key='reporting')
    INSERT INTO dbo.module_permissions(role,module_key,can_access) VALUES ('user','reporting',1);
GO

/*
Optional: create first admin user manually after app setup.
The app does not auto-seed admin on MSSQL by design.
*/
