/*
    Purpose: Add admin-controlled UI/debug settings.
*/

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'show_admin_properties')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('show_admin_properties', '0');
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_settings WHERE [key] = 'debug_mode')
    INSERT INTO dbo.app_settings ([key], value) VALUES ('debug_mode', '0');
GO
