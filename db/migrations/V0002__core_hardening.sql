/*
    Core hardening migration:
    - audit logs
    - security events (rate limiting / brute-force telemetry)
    - app error logs
    - user-specific module permission overrides
    - setup/security app settings defaults
*/

IF OBJECT_ID('dbo.audit_logs', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.audit_logs (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        event_type NVARCHAR(120) NOT NULL,
        actor_user_id INT NULL,
        target_type NVARCHAR(120) NOT NULL CONSTRAINT DF_audit_logs_target_type DEFAULT '',
        target_id NVARCHAR(120) NOT NULL CONSTRAINT DF_audit_logs_target_id DEFAULT '',
        details_json NVARCHAR(MAX) NOT NULL CONSTRAINT DF_audit_logs_details_json DEFAULT '{}',
        ip_address NVARCHAR(64) NOT NULL CONSTRAINT DF_audit_logs_ip_address DEFAULT '',
        request_path NVARCHAR(512) NOT NULL CONSTRAINT DF_audit_logs_request_path DEFAULT '',
        request_method NVARCHAR(16) NOT NULL CONSTRAINT DF_audit_logs_request_method DEFAULT '',
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_audit_logs_created_at DEFAULT SYSDATETIMEOFFSET()
    );
END
GO

IF OBJECT_ID('dbo.security_events', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.security_events (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        event_type NVARCHAR(80) NOT NULL,
        subject NVARCHAR(255) NOT NULL CONSTRAINT DF_security_events_subject DEFAULT '',
        user_id INT NULL,
        ip_address NVARCHAR(64) NOT NULL CONSTRAINT DF_security_events_ip_address DEFAULT '',
        details_json NVARCHAR(MAX) NOT NULL CONSTRAINT DF_security_events_details_json DEFAULT '{}',
        occurred_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_security_events_occurred_at DEFAULT SYSDATETIMEOFFSET()
    );
END
GO

IF OBJECT_ID('dbo.app_error_logs', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.app_error_logs (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        request_id NVARCHAR(64) NOT NULL,
        path NVARCHAR(512) NOT NULL,
        method NVARCHAR(16) NOT NULL,
        error_type NVARCHAR(200) NOT NULL,
        error_message NVARCHAR(MAX) NOT NULL,
        stack_trace NVARCHAR(MAX) NOT NULL,
        user_id INT NULL,
        ip_address NVARCHAR(64) NOT NULL,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_app_error_logs_created_at DEFAULT SYSDATETIMEOFFSET()
    );
END
GO

IF OBJECT_ID('dbo.user_permissions', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.user_permissions (
        id INT IDENTITY(1,1) PRIMARY KEY,
        user_id INT NOT NULL,
        module_key NVARCHAR(120) NOT NULL,
        can_access BIT NOT NULL CONSTRAINT DF_user_permissions_can_access DEFAULT 1,
        CONSTRAINT UQ_user_permissions_user_module UNIQUE (user_id, module_key),
        CONSTRAINT FK_user_permissions_user FOREIGN KEY (user_id) REFERENCES dbo.users(id) ON DELETE CASCADE
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'setup_locked')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('setup_locked', '1');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'session_timeout_minutes')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('session_timeout_minutes', '480');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'login_max_attempts_window')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('login_max_attempts_window', '10');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'login_window_seconds')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('login_window_seconds', '900');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'verification_resend_max_attempts_window')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('verification_resend_max_attempts_window', '5');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'verification_resend_window_seconds')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('verification_resend_window_seconds', '1800');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'register_max_attempts_window')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('register_max_attempts_window', '8');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'register_window_seconds')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('register_window_seconds', '3600');
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_security_events_event_subject_occurred_at'
      AND object_id = OBJECT_ID('dbo.security_events')
)
BEGIN
    CREATE INDEX IX_security_events_event_subject_occurred_at
    ON dbo.security_events(event_type, subject, occurred_at);
END
GO
