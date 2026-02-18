/*
    Geography foundation:
    - states table (FIPS-linked, toggleable)
    - counties table (FIPS-linked to states, toggleable)
*/

IF OBJECT_ID('dbo.states', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.states (
        id INT IDENTITY(1,1) PRIMARY KEY,
        state_fips CHAR(2) NOT NULL,
        state_code CHAR(2) NOT NULL,
        state_name NVARCHAR(120) NOT NULL,
        is_active BIT NOT NULL CONSTRAINT DF_states_is_active DEFAULT 0,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_states_created_at DEFAULT SYSDATETIMEOFFSET(),
        CONSTRAINT UQ_states_fips UNIQUE (state_fips),
        CONSTRAINT UQ_states_code UNIQUE (state_code)
    );
END
GO

IF OBJECT_ID('dbo.counties', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.counties (
        id INT IDENTITY(1,1) PRIMARY KEY,
        county_fips CHAR(5) NOT NULL,
        state_fips CHAR(2) NOT NULL,
        county_name NVARCHAR(160) NOT NULL,
        is_active BIT NOT NULL CONSTRAINT DF_counties_is_active DEFAULT 0,
        created_at DATETIMEOFFSET NOT NULL CONSTRAINT DF_counties_created_at DEFAULT SYSDATETIMEOFFSET(),
        CONSTRAINT UQ_counties_fips UNIQUE (county_fips),
        CONSTRAINT FK_counties_states_fips FOREIGN KEY (state_fips) REFERENCES dbo.states(state_fips)
    );
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_counties_state_fips'
      AND object_id = OBJECT_ID('dbo.counties')
)
BEGIN
    CREATE INDEX IX_counties_state_fips ON dbo.counties(state_fips);
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_counties_is_active'
      AND object_id = OBJECT_ID('dbo.counties')
)
BEGIN
    CREATE INDEX IX_counties_is_active ON dbo.counties(is_active);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '01')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('01', 'AL', 'Alabama');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '02')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('02', 'AK', 'Alaska');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '04')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('04', 'AZ', 'Arizona');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '05')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('05', 'AR', 'Arkansas');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '06')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('06', 'CA', 'California');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '08')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('08', 'CO', 'Colorado');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '09')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('09', 'CT', 'Connecticut');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '10')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('10', 'DE', 'Delaware');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '11')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('11', 'DC', 'District of Columbia');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '12')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('12', 'FL', 'Florida');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '13')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('13', 'GA', 'Georgia');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '15')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('15', 'HI', 'Hawaii');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '16')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('16', 'ID', 'Idaho');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '17')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('17', 'IL', 'Illinois');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '18')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('18', 'IN', 'Indiana');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '19')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('19', 'IA', 'Iowa');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '20')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('20', 'KS', 'Kansas');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '21')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('21', 'KY', 'Kentucky');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '22')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('22', 'LA', 'Louisiana');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '23')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('23', 'ME', 'Maine');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '24')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('24', 'MD', 'Maryland');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '25')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('25', 'MA', 'Massachusetts');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '26')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('26', 'MI', 'Michigan');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '27')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('27', 'MN', 'Minnesota');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '28')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('28', 'MS', 'Mississippi');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '29')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('29', 'MO', 'Missouri');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '30')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('30', 'MT', 'Montana');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '31')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('31', 'NE', 'Nebraska');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '32')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('32', 'NV', 'Nevada');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '33')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('33', 'NH', 'New Hampshire');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '34')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('34', 'NJ', 'New Jersey');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '35')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('35', 'NM', 'New Mexico');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '36')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('36', 'NY', 'New York');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '37')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('37', 'NC', 'North Carolina');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '38')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('38', 'ND', 'North Dakota');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '39')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('39', 'OH', 'Ohio');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '40')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('40', 'OK', 'Oklahoma');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '41')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('41', 'OR', 'Oregon');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '42')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('42', 'PA', 'Pennsylvania');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '44')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('44', 'RI', 'Rhode Island');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '45')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('45', 'SC', 'South Carolina');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '46')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('46', 'SD', 'South Dakota');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '47')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('47', 'TN', 'Tennessee');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '48')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('48', 'TX', 'Texas');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '49')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('49', 'UT', 'Utah');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '50')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('50', 'VT', 'Vermont');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '51')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('51', 'VA', 'Virginia');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '53')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('53', 'WA', 'Washington');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '54')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('54', 'WV', 'West Virginia');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '55')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('55', 'WI', 'Wisconsin');
IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '56')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('56', 'WY', 'Wyoming');
GO
