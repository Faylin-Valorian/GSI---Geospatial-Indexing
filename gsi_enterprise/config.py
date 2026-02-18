import os


class Config:
    SECRET_KEY = os.getenv("GSI_SECRET_KEY", "dev-secret-change-me")

    # MSSQL (ODBC) connection string, e.g.
    # Driver={ODBC Driver 18 for SQL Server};Server=localhost;Database=GSIEnterprise;UID=sa;PWD=YourStrong!Passw0rd;Encrypt=no;TrustServerCertificate=yes;
    MSSQL_CONNECTION_STRING = os.getenv("GSI_MSSQL_CONNECTION_STRING", "")

    SMTP_HOST = os.getenv("GSI_SMTP_HOST", "")
    SMTP_PORT = int(os.getenv("GSI_SMTP_PORT", "587"))
    SMTP_USER = os.getenv("GSI_SMTP_USER", "")
    SMTP_PASS = os.getenv("GSI_SMTP_PASS", "")
    SMTP_FROM = os.getenv("GSI_SMTP_FROM", "")
    SMTP_USE_TLS = os.getenv("GSI_SMTP_USE_TLS", "1") == "1"

    SESSION_TIMEOUT_MINUTES = int(os.getenv("GSI_SESSION_TIMEOUT_MINUTES", "480"))
    SESSION_COOKIE_HTTPONLY = True
    SESSION_COOKIE_SAMESITE = os.getenv("GSI_SESSION_COOKIE_SAMESITE", "Lax")
    SESSION_COOKIE_SECURE = os.getenv("GSI_SESSION_COOKIE_SECURE", "0") == "1"

    SECURITY_HEADERS_ENABLED = os.getenv("GSI_SECURITY_HEADERS_ENABLED", "1") == "1"
    MIGRATION_CHECKSUM_POLICY = os.getenv("GSI_MIGRATION_CHECKSUM_POLICY", "strict").strip().lower()
    STARTUP_DB_MAINTENANCE_ENABLED = os.getenv("GSI_STARTUP_DB_MAINTENANCE_ENABLED", "1") == "1"
