/*
    Seed all US counties into dbo.counties (idempotent).
    Source: db/seeds/us_counties.csv
*/

IF OBJECT_ID('dbo.counties', 'U') IS NULL
BEGIN
    THROW 50001, 'dbo.counties table does not exist. Apply geography table migration first.', 1;
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.states WHERE state_fips = '72')
    INSERT INTO dbo.states (state_fips, state_code, state_name) VALUES ('72', 'PR', 'Puerto Rico');
GO

BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01001', '01', N'Autauga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01003', '01', N'Baldwin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01005', '01', N'Barbour County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01007', '01', N'Bibb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01009', '01', N'Blount County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01011', '01', N'Bullock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01013', '01', N'Butler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01015', '01', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01017', '01', N'Chambers County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01019', '01', N'Cherokee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01021', '01', N'Chilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01023', '01', N'Choctaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01025', '01', N'Clarke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01027', '01', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01029', '01', N'Cleburne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01031', '01', N'Coffee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01033', '01', N'Colbert County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01035', '01', N'Conecuh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01037', '01', N'Coosa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01039', '01', N'Covington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01041', '01', N'Crenshaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01043', '01', N'Cullman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01045', '01', N'Dale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01047', '01', N'Dallas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01049', '01', N'DeKalb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01051', '01', N'Elmore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01053', '01', N'Escambia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01055', '01', N'Etowah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01057', '01', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01059', '01', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01061', '01', N'Geneva County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01063', '01', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01065', '01', N'Hale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01067', '01', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01069', '01', N'Houston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01071', '01', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01073', '01', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01075', '01', N'Lamar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01077', '01', N'Lauderdale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01079', '01', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01081', '01', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01083', '01', N'Limestone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01085', '01', N'Lowndes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01087', '01', N'Macon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01089', '01', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01091', '01', N'Marengo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01093', '01', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01095', '01', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01097', '01', N'Mobile County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01099', '01', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01101', '01', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01103', '01', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01105', '01', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01107', '01', N'Pickens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01109', '01', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01111', '01', N'Randolph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01113', '01', N'Russell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01115', '01', N'St. Clair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01117', '01', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01119', '01', N'Sumter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01121', '01', N'Talladega County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01123', '01', N'Tallapoosa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01125', '01', N'Tuscaloosa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01127', '01', N'Walker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01129', '01', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01131', '01', N'Wilcox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '01133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('01133', '01', N'Winston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02013', '02', N'Aleutians East Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02016')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02016', '02', N'Aleutians West Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02020')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02020', '02', N'Anchorage Municipality', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02050')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02050', '02', N'Bethel Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02060')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02060', '02', N'Bristol Bay Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02068')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02068', '02', N'Denali Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02070')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02070', '02', N'Dillingham Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02090')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02090', '02', N'Fairbanks North Star Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02100')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02100', '02', N'Haines Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02105', '02', N'Hoonah-Angoon Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02110')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02110', '02', N'Juneau City and Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02122')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02122', '02', N'Kenai Peninsula Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02130')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02130', '02', N'Ketchikan Gateway Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02150')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02150', '02', N'Kodiak Island Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02158')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02158', '02', N'Kusilvak Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02164')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02164', '02', N'Lake and Peninsula Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02170')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02170', '02', N'Matanuska-Susitna Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02180')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02180', '02', N'Nome Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02185', '02', N'North Slope Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02188')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02188', '02', N'Northwest Arctic Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02195', '02', N'Petersburg Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02198')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02198', '02', N'Prince of Wales-Hyder Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02220')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02220', '02', N'Sitka City and Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02230')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02230', '02', N'Skagway Municipality', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02240')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02240', '02', N'Southeast Fairbanks Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02261')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02261', '02', N'Valdez-Cordova Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02275')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02275', '02', N'Wrangell City and Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02282')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02282', '02', N'Yakutat City and Borough', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '02290')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('02290', '02', N'Yukon-Koyukuk Census Area', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04001', '04', N'Apache County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04003', '04', N'Cochise County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04005', '04', N'Coconino County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04007', '04', N'Gila County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04009', '04', N'Graham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04011', '04', N'Greenlee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04012')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04012', '04', N'La Paz County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04013', '04', N'Maricopa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04015', '04', N'Mohave County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04017', '04', N'Navajo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04019', '04', N'Pima County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04021', '04', N'Pinal County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04023', '04', N'Santa Cruz County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04025', '04', N'Yavapai County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '04027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('04027', '04', N'Yuma County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05001', '05', N'Arkansas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05003', '05', N'Ashley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05005', '05', N'Baxter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05007', '05', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05009', '05', N'Boone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05011', '05', N'Bradley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05013', '05', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05015', '05', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05017', '05', N'Chicot County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05019', '05', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05021', '05', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05023', '05', N'Cleburne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05025', '05', N'Cleveland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05027', '05', N'Columbia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05029', '05', N'Conway County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05031', '05', N'Craighead County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05033', '05', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05035', '05', N'Crittenden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05037', '05', N'Cross County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05039', '05', N'Dallas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05041', '05', N'Desha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05043', '05', N'Drew County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05045', '05', N'Faulkner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05047', '05', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05049', '05', N'Fulton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05051', '05', N'Garland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05053', '05', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05055', '05', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05057', '05', N'Hempstead County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05059', '05', N'Hot Spring County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05061', '05', N'Howard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05063', '05', N'Independence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05065', '05', N'Izard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05067', '05', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05069', '05', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05071', '05', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05073', '05', N'Lafayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05075', '05', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05077', '05', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05079', '05', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05081', '05', N'Little River County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05083', '05', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05085', '05', N'Lonoke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05087', '05', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05089', '05', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05091', '05', N'Miller County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05093', '05', N'Mississippi County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05095', '05', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05097', '05', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05099', '05', N'Nevada County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05101', '05', N'Newton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05103', '05', N'Ouachita County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05105', '05', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05107', '05', N'Phillips County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05109', '05', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05111', '05', N'Poinsett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05113', '05', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05115', '05', N'Pope County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05117', '05', N'Prairie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05119', '05', N'Pulaski County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05121', '05', N'Randolph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05123', '05', N'St. Francis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05125', '05', N'Saline County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05127', '05', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05129', '05', N'Searcy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05131', '05', N'Sebastian County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05133', '05', N'Sevier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05135', '05', N'Sharp County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05137', '05', N'Stone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05139', '05', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05141', '05', N'Van Buren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05143', '05', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05145', '05', N'White County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05147', '05', N'Woodruff County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '05149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('05149', '05', N'Yell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06001', '06', N'Alameda County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06003', '06', N'Alpine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06005', '06', N'Amador County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06007', '06', N'Butte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06009', '06', N'Calaveras County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06011', '06', N'Colusa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06013', '06', N'Contra Costa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06015', '06', N'Del Norte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06017', '06', N'El Dorado County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06019', '06', N'Fresno County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06021', '06', N'Glenn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06023', '06', N'Humboldt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06025', '06', N'Imperial County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06027', '06', N'Inyo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06029', '06', N'Kern County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06031', '06', N'Kings County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06033', '06', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06035', '06', N'Lassen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06037', '06', N'Los Angeles County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06039', '06', N'Madera County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06041', '06', N'Marin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06043', '06', N'Mariposa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06045', '06', N'Mendocino County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06047', '06', N'Merced County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06049', '06', N'Modoc County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06051', '06', N'Mono County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06053', '06', N'Monterey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06055', '06', N'Napa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06057', '06', N'Nevada County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06059', '06', N'Orange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06061', '06', N'Placer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06063', '06', N'Plumas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06065', '06', N'Riverside County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06067', '06', N'Sacramento County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06069', '06', N'San Benito County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06071', '06', N'San Bernardino County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06073', '06', N'San Diego County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06075', '06', N'San Francisco County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06077', '06', N'San Joaquin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06079', '06', N'San Luis Obispo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06081', '06', N'San Mateo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06083', '06', N'Santa Barbara County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06085', '06', N'Santa Clara County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06087', '06', N'Santa Cruz County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06089', '06', N'Shasta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06091', '06', N'Sierra County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06093', '06', N'Siskiyou County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06095', '06', N'Solano County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06097', '06', N'Sonoma County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06099', '06', N'Stanislaus County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06101', '06', N'Sutter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06103', '06', N'Tehama County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06105', '06', N'Trinity County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06107', '06', N'Tulare County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06109', '06', N'Tuolumne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06111', '06', N'Ventura County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06113', '06', N'Yolo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '06115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('06115', '06', N'Yuba County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08001', '08', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08003', '08', N'Alamosa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08005', '08', N'Arapahoe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08007', '08', N'Archuleta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08009', '08', N'Baca County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08011', '08', N'Bent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08013', '08', N'Boulder County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08014')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08014', '08', N'Broomfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08015', '08', N'Chaffee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08017', '08', N'Cheyenne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08019', '08', N'Clear Creek County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08021', '08', N'Conejos County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08023', '08', N'Costilla County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08025', '08', N'Crowley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08027', '08', N'Custer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08029', '08', N'Delta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08031', '08', N'Denver County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08033', '08', N'Dolores County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08035', '08', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08037', '08', N'Eagle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08039', '08', N'Elbert County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08041', '08', N'El Paso County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08043', '08', N'Fremont County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08045', '08', N'Garfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08047', '08', N'Gilpin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08049', '08', N'Grand County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08051', '08', N'Gunnison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08053', '08', N'Hinsdale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08055', '08', N'Huerfano County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08057', '08', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08059', '08', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08061', '08', N'Kiowa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08063', '08', N'Kit Carson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08065', '08', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08067', '08', N'La Plata County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08069', '08', N'Larimer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08071', '08', N'Las Animas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08073', '08', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08075', '08', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08077', '08', N'Mesa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08079', '08', N'Mineral County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08081', '08', N'Moffat County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08083', '08', N'Montezuma County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08085', '08', N'Montrose County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08087', '08', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08089', '08', N'Otero County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08091', '08', N'Ouray County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08093', '08', N'Park County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08095', '08', N'Phillips County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08097', '08', N'Pitkin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08099', '08', N'Prowers County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08101', '08', N'Pueblo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08103', '08', N'Rio Blanco County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08105', '08', N'Rio Grande County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08107', '08', N'Routt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08109', '08', N'Saguache County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08111', '08', N'San Juan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08113', '08', N'San Miguel County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08115', '08', N'Sedgwick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08117', '08', N'Summit County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08119', '08', N'Teller County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08121', '08', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08123', '08', N'Weld County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '08125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('08125', '08', N'Yuma County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '09001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('09001', '09', N'Fairfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '09003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('09003', '09', N'Hartford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '09005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('09005', '09', N'Litchfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '09007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('09007', '09', N'Middlesex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '09009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('09009', '09', N'New Haven County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '09011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('09011', '09', N'New London County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '09013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('09013', '09', N'Tolland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '09015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('09015', '09', N'Windham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '10001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('10001', '10', N'Kent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '10003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('10003', '10', N'New Castle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '10005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('10005', '10', N'Sussex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '11001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('11001', '11', N'District of Columbia', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12001', '12', N'Alachua County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12003', '12', N'Baker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12005', '12', N'Bay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12007', '12', N'Bradford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12009', '12', N'Brevard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12011', '12', N'Broward County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12013', '12', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12015', '12', N'Charlotte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12017', '12', N'Citrus County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12019', '12', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12021', '12', N'Collier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12023', '12', N'Columbia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12027', '12', N'DeSoto County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12029', '12', N'Dixie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12031', '12', N'Duval County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12033', '12', N'Escambia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12035', '12', N'Flagler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12037', '12', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12039', '12', N'Gadsden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12041', '12', N'Gilchrist County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12043', '12', N'Glades County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12045', '12', N'Gulf County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12047', '12', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12049', '12', N'Hardee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12051', '12', N'Hendry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12053', '12', N'Hernando County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12055', '12', N'Highlands County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12057', '12', N'Hillsborough County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12059', '12', N'Holmes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12061', '12', N'Indian River County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12063', '12', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12065', '12', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12067', '12', N'Lafayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12069', '12', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12071', '12', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12073', '12', N'Leon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12075', '12', N'Levy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12077', '12', N'Liberty County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12079', '12', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12081', '12', N'Manatee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12083', '12', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12085', '12', N'Martin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12086')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12086', '12', N'Miami-Dade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12087', '12', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12089', '12', N'Nassau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12091', '12', N'Okaloosa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12093', '12', N'Okeechobee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12095', '12', N'Orange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12097', '12', N'Osceola County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12099', '12', N'Palm Beach County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12101', '12', N'Pasco County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12103', '12', N'Pinellas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12105', '12', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12107', '12', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12109', '12', N'St. Johns County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12111', '12', N'St. Lucie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12113', '12', N'Santa Rosa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12115', '12', N'Sarasota County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12117', '12', N'Seminole County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12119', '12', N'Sumter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12121', '12', N'Suwannee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12123', '12', N'Taylor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12125', '12', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12127', '12', N'Volusia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12129', '12', N'Wakulla County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12131', '12', N'Walton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '12133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('12133', '12', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13001', '13', N'Appling County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13003', '13', N'Atkinson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13005', '13', N'Bacon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13007', '13', N'Baker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13009', '13', N'Baldwin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13011', '13', N'Banks County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13013', '13', N'Barrow County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13015', '13', N'Bartow County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13017', '13', N'Ben Hill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13019', '13', N'Berrien County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13021', '13', N'Bibb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13023', '13', N'Bleckley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13025', '13', N'Brantley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13027', '13', N'Brooks County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13029', '13', N'Bryan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13031', '13', N'Bulloch County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13033', '13', N'Burke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13035', '13', N'Butts County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13037', '13', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13039', '13', N'Camden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13043', '13', N'Candler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13045', '13', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13047', '13', N'Catoosa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13049', '13', N'Charlton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13051', '13', N'Chatham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13053', '13', N'Chattahoochee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13055', '13', N'Chattooga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13057', '13', N'Cherokee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13059', '13', N'Clarke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13061', '13', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13063', '13', N'Clayton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13065', '13', N'Clinch County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13067', '13', N'Cobb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13069', '13', N'Coffee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13071', '13', N'Colquitt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13073', '13', N'Columbia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13075', '13', N'Cook County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13077', '13', N'Coweta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13079', '13', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13081', '13', N'Crisp County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13083', '13', N'Dade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13085', '13', N'Dawson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13087', '13', N'Decatur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13089', '13', N'DeKalb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13091', '13', N'Dodge County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13093', '13', N'Dooly County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13095', '13', N'Dougherty County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13097', '13', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13099', '13', N'Early County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13101', '13', N'Echols County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13103', '13', N'Effingham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13105', '13', N'Elbert County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13107', '13', N'Emanuel County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13109', '13', N'Evans County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13111', '13', N'Fannin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13113', '13', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13115', '13', N'Floyd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13117', '13', N'Forsyth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13119', '13', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13121', '13', N'Fulton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13123', '13', N'Gilmer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13125', '13', N'Glascock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13127', '13', N'Glynn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13129', '13', N'Gordon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13131', '13', N'Grady County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13133', '13', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13135', '13', N'Gwinnett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13137', '13', N'Habersham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13139', '13', N'Hall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13141', '13', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13143', '13', N'Haralson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13145', '13', N'Harris County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13147', '13', N'Hart County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13149', '13', N'Heard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13151', '13', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13153', '13', N'Houston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13155', '13', N'Irwin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13157', '13', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13159', '13', N'Jasper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13161', '13', N'Jeff Davis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13163', '13', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13165', '13', N'Jenkins County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13167', '13', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13169', '13', N'Jones County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13171', '13', N'Lamar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13173', '13', N'Lanier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13175', '13', N'Laurens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13177', '13', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13179', '13', N'Liberty County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13181', '13', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13183', '13', N'Long County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13185', '13', N'Lowndes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13187', '13', N'Lumpkin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13189', '13', N'McDuffie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13191')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13191', '13', N'McIntosh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13193')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13193', '13', N'Macon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13195', '13', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13197', '13', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13199')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13199', '13', N'Meriwether County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13201')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13201', '13', N'Miller County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13205')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13205', '13', N'Mitchell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13207')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13207', '13', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13209')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13209', '13', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13211')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13211', '13', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13213')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13213', '13', N'Murray County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13215')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13215', '13', N'Muscogee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13217')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13217', '13', N'Newton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13219')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13219', '13', N'Oconee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13221')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13221', '13', N'Oglethorpe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13223')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13223', '13', N'Paulding County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13225')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13225', '13', N'Peach County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13227')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13227', '13', N'Pickens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13229')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13229', '13', N'Pierce County', 0);
COMMIT TRANSACTION;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13231')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13231', '13', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13233')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13233', '13', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13235')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13235', '13', N'Pulaski County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13237')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13237', '13', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13239')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13239', '13', N'Quitman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13241')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13241', '13', N'Rabun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13243')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13243', '13', N'Randolph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13245')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13245', '13', N'Richmond County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13247')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13247', '13', N'Rockdale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13249')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13249', '13', N'Schley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13251')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13251', '13', N'Screven County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13253')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13253', '13', N'Seminole County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13255')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13255', '13', N'Spalding County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13257')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13257', '13', N'Stephens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13259')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13259', '13', N'Stewart County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13261')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13261', '13', N'Sumter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13263')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13263', '13', N'Talbot County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13265')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13265', '13', N'Taliaferro County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13267')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13267', '13', N'Tattnall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13269')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13269', '13', N'Taylor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13271')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13271', '13', N'Telfair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13273')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13273', '13', N'Terrell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13275')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13275', '13', N'Thomas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13277')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13277', '13', N'Tift County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13279')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13279', '13', N'Toombs County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13281')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13281', '13', N'Towns County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13283')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13283', '13', N'Treutlen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13285')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13285', '13', N'Troup County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13287')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13287', '13', N'Turner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13289')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13289', '13', N'Twiggs County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13291')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13291', '13', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13293')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13293', '13', N'Upson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13295')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13295', '13', N'Walker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13297')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13297', '13', N'Walton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13299')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13299', '13', N'Ware County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13301')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13301', '13', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13303')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13303', '13', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13305')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13305', '13', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13307')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13307', '13', N'Webster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13309')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13309', '13', N'Wheeler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13311')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13311', '13', N'White County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13313')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13313', '13', N'Whitfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13315')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13315', '13', N'Wilcox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13317')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13317', '13', N'Wilkes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13319')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13319', '13', N'Wilkinson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '13321')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('13321', '13', N'Worth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '15001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('15001', '15', N'Hawaii County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '15003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('15003', '15', N'Honolulu County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '15005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('15005', '15', N'Kalawao County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '15007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('15007', '15', N'Kauai County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '15009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('15009', '15', N'Maui County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16001', '16', N'Ada County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16003', '16', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16005', '16', N'Bannock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16007', '16', N'Bear Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16009', '16', N'Benewah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16011', '16', N'Bingham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16013', '16', N'Blaine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16015', '16', N'Boise County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16017', '16', N'Bonner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16019', '16', N'Bonneville County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16021', '16', N'Boundary County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16023', '16', N'Butte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16025', '16', N'Camas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16027', '16', N'Canyon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16029', '16', N'Caribou County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16031', '16', N'Cassia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16033', '16', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16035', '16', N'Clearwater County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16037', '16', N'Custer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16039', '16', N'Elmore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16041', '16', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16043', '16', N'Fremont County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16045', '16', N'Gem County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16047', '16', N'Gooding County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16049', '16', N'Idaho County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16051', '16', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16053', '16', N'Jerome County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16055', '16', N'Kootenai County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16057', '16', N'Latah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16059', '16', N'Lemhi County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16061', '16', N'Lewis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16063', '16', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16065', '16', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16067', '16', N'Minidoka County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16069', '16', N'Nez Perce County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16071', '16', N'Oneida County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16073', '16', N'Owyhee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16075', '16', N'Payette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16077', '16', N'Power County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16079', '16', N'Shoshone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16081', '16', N'Teton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16083', '16', N'Twin Falls County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16085', '16', N'Valley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '16087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('16087', '16', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17001', '17', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17003', '17', N'Alexander County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17005', '17', N'Bond County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17007', '17', N'Boone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17009', '17', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17011', '17', N'Bureau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17013', '17', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17015', '17', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17017', '17', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17019', '17', N'Champaign County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17021', '17', N'Christian County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17023', '17', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17025', '17', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17027', '17', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17029', '17', N'Coles County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17031', '17', N'Cook County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17033', '17', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17035', '17', N'Cumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17037', '17', N'DeKalb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17039', '17', N'De Witt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17041', '17', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17043', '17', N'DuPage County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17045', '17', N'Edgar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17047', '17', N'Edwards County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17049', '17', N'Effingham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17051', '17', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17053', '17', N'Ford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17055', '17', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17057', '17', N'Fulton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17059', '17', N'Gallatin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17061', '17', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17063', '17', N'Grundy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17065', '17', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17067', '17', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17069', '17', N'Hardin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17071', '17', N'Henderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17073', '17', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17075', '17', N'Iroquois County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17077', '17', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17079', '17', N'Jasper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17081', '17', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17083', '17', N'Jersey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17085', '17', N'Jo Daviess County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17087', '17', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17089', '17', N'Kane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17091', '17', N'Kankakee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17093', '17', N'Kendall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17095', '17', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17097', '17', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17099', '17', N'LaSalle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17101', '17', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17103', '17', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17105', '17', N'Livingston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17107', '17', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17109', '17', N'McDonough County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17111', '17', N'McHenry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17113', '17', N'McLean County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17115', '17', N'Macon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17117', '17', N'Macoupin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17119', '17', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17121', '17', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17123', '17', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17125', '17', N'Mason County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17127', '17', N'Massac County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17129', '17', N'Menard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17131', '17', N'Mercer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17133', '17', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17135', '17', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17137', '17', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17139', '17', N'Moultrie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17141', '17', N'Ogle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17143', '17', N'Peoria County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17145', '17', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17147', '17', N'Piatt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17149', '17', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17151', '17', N'Pope County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17153', '17', N'Pulaski County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17155', '17', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17157', '17', N'Randolph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17159', '17', N'Richland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17161', '17', N'Rock Island County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17163', '17', N'St. Clair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17165', '17', N'Saline County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17167', '17', N'Sangamon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17169', '17', N'Schuyler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17171', '17', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17173', '17', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17175', '17', N'Stark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17177', '17', N'Stephenson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17179', '17', N'Tazewell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17181', '17', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17183', '17', N'Vermilion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17185', '17', N'Wabash County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17187', '17', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17189', '17', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17191')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17191', '17', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17193')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17193', '17', N'White County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17195', '17', N'Whiteside County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17197', '17', N'Will County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17199')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17199', '17', N'Williamson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17201')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17201', '17', N'Winnebago County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '17203')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('17203', '17', N'Woodford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18001', '18', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18003', '18', N'Allen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18005', '18', N'Bartholomew County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18007', '18', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18009', '18', N'Blackford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18011', '18', N'Boone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18013', '18', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18015', '18', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18017', '18', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18019', '18', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18021', '18', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18023', '18', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18025', '18', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18027', '18', N'Daviess County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18029', '18', N'Dearborn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18031', '18', N'Decatur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18033', '18', N'DeKalb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18035', '18', N'Delaware County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18037', '18', N'Dubois County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18039', '18', N'Elkhart County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18041', '18', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18043', '18', N'Floyd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18045', '18', N'Fountain County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18047', '18', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18049', '18', N'Fulton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18051', '18', N'Gibson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18053', '18', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18055', '18', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18057', '18', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18059', '18', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18061', '18', N'Harrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18063', '18', N'Hendricks County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18065', '18', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18067', '18', N'Howard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18069', '18', N'Huntington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18071', '18', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18073', '18', N'Jasper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18075', '18', N'Jay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18077', '18', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18079', '18', N'Jennings County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18081', '18', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18083', '18', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18085', '18', N'Kosciusko County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18087', '18', N'LaGrange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18089', '18', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18091', '18', N'LaPorte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18093', '18', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18095', '18', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18097', '18', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18099', '18', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18101', '18', N'Martin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18103', '18', N'Miami County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18105', '18', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18107', '18', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18109', '18', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18111', '18', N'Newton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18113', '18', N'Noble County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18115', '18', N'Ohio County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18117', '18', N'Orange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18119', '18', N'Owen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18121', '18', N'Parke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18123', '18', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18125', '18', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18127', '18', N'Porter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18129', '18', N'Posey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18131', '18', N'Pulaski County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18133', '18', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18135', '18', N'Randolph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18137', '18', N'Ripley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18139', '18', N'Rush County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18141', '18', N'St. Joseph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18143', '18', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18145', '18', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18147', '18', N'Spencer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18149', '18', N'Starke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18151', '18', N'Steuben County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18153', '18', N'Sullivan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18155', '18', N'Switzerland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18157', '18', N'Tippecanoe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18159', '18', N'Tipton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18161', '18', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18163', '18', N'Vanderburgh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18165', '18', N'Vermillion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18167', '18', N'Vigo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18169', '18', N'Wabash County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18171', '18', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18173', '18', N'Warrick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18175', '18', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18177', '18', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18179', '18', N'Wells County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18181', '18', N'White County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '18183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('18183', '18', N'Whitley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19001', '19', N'Adair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19003', '19', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19005', '19', N'Allamakee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19007', '19', N'Appanoose County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19009', '19', N'Audubon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19011', '19', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19013', '19', N'Black Hawk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19015', '19', N'Boone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19017', '19', N'Bremer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19019', '19', N'Buchanan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19021', '19', N'Buena Vista County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19023', '19', N'Butler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19025', '19', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19027', '19', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19029', '19', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19031', '19', N'Cedar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19033', '19', N'Cerro Gordo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19035', '19', N'Cherokee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19037', '19', N'Chickasaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19039', '19', N'Clarke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19041', '19', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19043', '19', N'Clayton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19045', '19', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19047', '19', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19049', '19', N'Dallas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19051', '19', N'Davis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19053', '19', N'Decatur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19055', '19', N'Delaware County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19057', '19', N'Des Moines County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19059', '19', N'Dickinson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19061', '19', N'Dubuque County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19063', '19', N'Emmet County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19065', '19', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19067', '19', N'Floyd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19069', '19', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19071', '19', N'Fremont County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19073', '19', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19075', '19', N'Grundy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19077', '19', N'Guthrie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19079', '19', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19081', '19', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19083', '19', N'Hardin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19085', '19', N'Harrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19087', '19', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19089', '19', N'Howard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19091', '19', N'Humboldt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19093', '19', N'Ida County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19095', '19', N'Iowa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19097', '19', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19099', '19', N'Jasper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19101', '19', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19103', '19', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19105', '19', N'Jones County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19107', '19', N'Keokuk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19109', '19', N'Kossuth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19111', '19', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19113', '19', N'Linn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19115', '19', N'Louisa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19117', '19', N'Lucas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19119', '19', N'Lyon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19121', '19', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19123', '19', N'Mahaska County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19125', '19', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19127', '19', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19129', '19', N'Mills County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19131', '19', N'Mitchell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19133', '19', N'Monona County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19135', '19', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19137', '19', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19139', '19', N'Muscatine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19141', '19', N'O''Brien County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19143', '19', N'Osceola County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19145', '19', N'Page County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19147', '19', N'Palo Alto County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19149', '19', N'Plymouth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19151', '19', N'Pocahontas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19153', '19', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19155', '19', N'Pottawattamie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19157', '19', N'Poweshiek County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19159', '19', N'Ringgold County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19161', '19', N'Sac County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19163', '19', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19165', '19', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19167', '19', N'Sioux County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19169', '19', N'Story County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19171', '19', N'Tama County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19173', '19', N'Taylor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19175', '19', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19177', '19', N'Van Buren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19179', '19', N'Wapello County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19181', '19', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19183', '19', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19185', '19', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19187', '19', N'Webster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19189', '19', N'Winnebago County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19191')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19191', '19', N'Winneshiek County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19193')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19193', '19', N'Woodbury County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19195', '19', N'Worth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '19197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('19197', '19', N'Wright County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20001', '20', N'Allen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20003', '20', N'Anderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20005', '20', N'Atchison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20007', '20', N'Barber County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20009', '20', N'Barton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20011', '20', N'Bourbon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20013', '20', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20015', '20', N'Butler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20017', '20', N'Chase County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20019', '20', N'Chautauqua County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20021', '20', N'Cherokee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20023', '20', N'Cheyenne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20025', '20', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20027', '20', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20029', '20', N'Cloud County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20031', '20', N'Coffey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20033', '20', N'Comanche County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20035', '20', N'Cowley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20037', '20', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20039', '20', N'Decatur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20041', '20', N'Dickinson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20043', '20', N'Doniphan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20045', '20', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20047', '20', N'Edwards County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20049', '20', N'Elk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20051', '20', N'Ellis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20053', '20', N'Ellsworth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20055', '20', N'Finney County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20057', '20', N'Ford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20059', '20', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20061', '20', N'Geary County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20063', '20', N'Gove County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20065', '20', N'Graham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20067', '20', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20069', '20', N'Gray County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20071', '20', N'Greeley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20073', '20', N'Greenwood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20075', '20', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20077', '20', N'Harper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20079', '20', N'Harvey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20081', '20', N'Haskell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20083', '20', N'Hodgeman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20085', '20', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20087', '20', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20089', '20', N'Jewell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20091', '20', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20093', '20', N'Kearny County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20095', '20', N'Kingman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20097', '20', N'Kiowa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20099', '20', N'Labette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20101', '20', N'Lane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20103', '20', N'Leavenworth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20105', '20', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20107', '20', N'Linn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20109', '20', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20111', '20', N'Lyon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20113', '20', N'McPherson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20115', '20', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20117', '20', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20119', '20', N'Meade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20121', '20', N'Miami County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20123', '20', N'Mitchell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20125', '20', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20127', '20', N'Morris County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20129', '20', N'Morton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20131', '20', N'Nemaha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20133', '20', N'Neosho County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20135', '20', N'Ness County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20137', '20', N'Norton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20139', '20', N'Osage County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20141', '20', N'Osborne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20143', '20', N'Ottawa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20145', '20', N'Pawnee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20147', '20', N'Phillips County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20149', '20', N'Pottawatomie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20151', '20', N'Pratt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20153', '20', N'Rawlins County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20155', '20', N'Reno County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20157', '20', N'Republic County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20159', '20', N'Rice County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20161', '20', N'Riley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20163', '20', N'Rooks County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20165', '20', N'Rush County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20167', '20', N'Russell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20169', '20', N'Saline County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20171', '20', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20173', '20', N'Sedgwick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20175', '20', N'Seward County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20177', '20', N'Shawnee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20179', '20', N'Sheridan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20181', '20', N'Sherman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20183', '20', N'Smith County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20185', '20', N'Stafford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20187', '20', N'Stanton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20189', '20', N'Stevens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20191')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20191', '20', N'Sumner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20193')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20193', '20', N'Thomas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20195', '20', N'Trego County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20197', '20', N'Wabaunsee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20199')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20199', '20', N'Wallace County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20201')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20201', '20', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20203')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20203', '20', N'Wichita County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20205')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20205', '20', N'Wilson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20207')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20207', '20', N'Woodson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '20209')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('20209', '20', N'Wyandotte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21001', '21', N'Adair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21003', '21', N'Allen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21005', '21', N'Anderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21007', '21', N'Ballard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21009', '21', N'Barren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21011', '21', N'Bath County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21013', '21', N'Bell County', 0);
COMMIT TRANSACTION;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21015', '21', N'Boone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21017', '21', N'Bourbon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21019', '21', N'Boyd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21021', '21', N'Boyle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21023', '21', N'Bracken County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21025', '21', N'Breathitt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21027', '21', N'Breckinridge County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21029', '21', N'Bullitt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21031', '21', N'Butler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21033', '21', N'Caldwell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21035', '21', N'Calloway County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21037', '21', N'Campbell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21039', '21', N'Carlisle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21041', '21', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21043', '21', N'Carter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21045', '21', N'Casey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21047', '21', N'Christian County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21049', '21', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21051', '21', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21053', '21', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21055', '21', N'Crittenden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21057', '21', N'Cumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21059', '21', N'Daviess County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21061', '21', N'Edmonson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21063', '21', N'Elliott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21065', '21', N'Estill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21067', '21', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21069', '21', N'Fleming County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21071', '21', N'Floyd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21073', '21', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21075', '21', N'Fulton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21077', '21', N'Gallatin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21079', '21', N'Garrard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21081', '21', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21083', '21', N'Graves County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21085', '21', N'Grayson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21087', '21', N'Green County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21089', '21', N'Greenup County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21091', '21', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21093', '21', N'Hardin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21095', '21', N'Harlan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21097', '21', N'Harrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21099', '21', N'Hart County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21101', '21', N'Henderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21103', '21', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21105', '21', N'Hickman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21107', '21', N'Hopkins County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21109', '21', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21111', '21', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21113', '21', N'Jessamine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21115', '21', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21117', '21', N'Kenton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21119', '21', N'Knott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21121', '21', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21123', '21', N'Larue County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21125', '21', N'Laurel County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21127', '21', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21129', '21', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21131', '21', N'Leslie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21133', '21', N'Letcher County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21135', '21', N'Lewis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21137', '21', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21139', '21', N'Livingston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21141', '21', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21143', '21', N'Lyon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21145', '21', N'McCracken County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21147', '21', N'McCreary County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21149', '21', N'McLean County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21151', '21', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21153', '21', N'Magoffin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21155', '21', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21157', '21', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21159', '21', N'Martin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21161', '21', N'Mason County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21163', '21', N'Meade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21165', '21', N'Menifee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21167', '21', N'Mercer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21169', '21', N'Metcalfe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21171', '21', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21173', '21', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21175', '21', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21177', '21', N'Muhlenberg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21179', '21', N'Nelson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21181', '21', N'Nicholas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21183', '21', N'Ohio County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21185', '21', N'Oldham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21187', '21', N'Owen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21189', '21', N'Owsley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21191')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21191', '21', N'Pendleton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21193')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21193', '21', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21195', '21', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21197', '21', N'Powell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21199')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21199', '21', N'Pulaski County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21201')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21201', '21', N'Robertson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21203')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21203', '21', N'Rockcastle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21205')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21205', '21', N'Rowan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21207')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21207', '21', N'Russell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21209')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21209', '21', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21211')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21211', '21', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21213')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21213', '21', N'Simpson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21215')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21215', '21', N'Spencer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21217')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21217', '21', N'Taylor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21219')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21219', '21', N'Todd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21221')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21221', '21', N'Trigg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21223')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21223', '21', N'Trimble County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21225')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21225', '21', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21227')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21227', '21', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21229')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21229', '21', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21231')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21231', '21', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21233')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21233', '21', N'Webster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21235')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21235', '21', N'Whitley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21237')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21237', '21', N'Wolfe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '21239')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('21239', '21', N'Woodford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22001', '22', N'Acadia Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22003', '22', N'Allen Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22005', '22', N'Ascension Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22007', '22', N'Assumption Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22009', '22', N'Avoyelles Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22011', '22', N'Beauregard Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22013', '22', N'Bienville Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22015', '22', N'Bossier Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22017', '22', N'Caddo Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22019', '22', N'Calcasieu Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22021', '22', N'Caldwell Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22023', '22', N'Cameron Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22025', '22', N'Catahoula Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22027', '22', N'Claiborne Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22029', '22', N'Concordia Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22031', '22', N'De Soto Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22033', '22', N'East Baton Rouge Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22035', '22', N'East Carroll Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22037', '22', N'East Feliciana Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22039', '22', N'Evangeline Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22041', '22', N'Franklin Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22043', '22', N'Grant Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22045', '22', N'Iberia Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22047', '22', N'Iberville Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22049', '22', N'Jackson Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22051', '22', N'Jefferson Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22053', '22', N'Jefferson Davis Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22055', '22', N'Lafayette Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22057', '22', N'Lafourche Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22059', '22', N'LaSalle Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22061', '22', N'Lincoln Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22063', '22', N'Livingston Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22065', '22', N'Madison Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22067', '22', N'Morehouse Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22069', '22', N'Natchitoches Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22071', '22', N'Orleans Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22073', '22', N'Ouachita Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22075', '22', N'Plaquemines Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22077', '22', N'Pointe Coupee Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22079', '22', N'Rapides Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22081', '22', N'Red River Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22083', '22', N'Richland Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22085', '22', N'Sabine Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22087', '22', N'St. Bernard Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22089', '22', N'St. Charles Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22091', '22', N'St. Helena Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22093', '22', N'St. James Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22095', '22', N'St. John the Baptist Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22097', '22', N'St. Landry Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22099', '22', N'St. Martin Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22101', '22', N'St. Mary Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22103', '22', N'St. Tammany Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22105', '22', N'Tangipahoa Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22107', '22', N'Tensas Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22109', '22', N'Terrebonne Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22111', '22', N'Union Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22113', '22', N'Vermilion Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22115', '22', N'Vernon Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22117', '22', N'Washington Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22119', '22', N'Webster Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22121', '22', N'West Baton Rouge Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22123', '22', N'West Carroll Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22125', '22', N'West Feliciana Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '22127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('22127', '22', N'Winn Parish', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23001', '23', N'Androscoggin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23003', '23', N'Aroostook County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23005', '23', N'Cumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23007', '23', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23009', '23', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23011', '23', N'Kennebec County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23013', '23', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23015', '23', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23017', '23', N'Oxford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23019', '23', N'Penobscot County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23021', '23', N'Piscataquis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23023', '23', N'Sagadahoc County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23025', '23', N'Somerset County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23027', '23', N'Waldo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23029', '23', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '23031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('23031', '23', N'York County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24001', '24', N'Allegany County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24003', '24', N'Anne Arundel County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24005', '24', N'Baltimore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24009', '24', N'Calvert County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24011', '24', N'Caroline County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24013', '24', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24015', '24', N'Cecil County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24017', '24', N'Charles County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24019', '24', N'Dorchester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24021', '24', N'Frederick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24023', '24', N'Garrett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24025', '24', N'Harford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24027', '24', N'Howard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24029', '24', N'Kent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24031', '24', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24033', '24', N'Prince George''s County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24035', '24', N'Queen Anne''s County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24037', '24', N'St. Mary''s County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24039', '24', N'Somerset County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24041', '24', N'Talbot County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24043', '24', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24045', '24', N'Wicomico County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24047', '24', N'Worcester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '24510')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('24510', '24', N'Baltimore city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25001', '25', N'Barnstable County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25003', '25', N'Berkshire County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25005', '25', N'Bristol County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25007', '25', N'Dukes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25009', '25', N'Essex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25011', '25', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25013', '25', N'Hampden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25015', '25', N'Hampshire County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25017', '25', N'Middlesex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25019', '25', N'Nantucket County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25021', '25', N'Norfolk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25023', '25', N'Plymouth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25025', '25', N'Suffolk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '25027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('25027', '25', N'Worcester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26001', '26', N'Alcona County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26003', '26', N'Alger County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26005', '26', N'Allegan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26007', '26', N'Alpena County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26009', '26', N'Antrim County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26011', '26', N'Arenac County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26013', '26', N'Baraga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26015', '26', N'Barry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26017', '26', N'Bay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26019', '26', N'Benzie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26021', '26', N'Berrien County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26023', '26', N'Branch County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26025', '26', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26027', '26', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26029', '26', N'Charlevoix County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26031', '26', N'Cheboygan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26033', '26', N'Chippewa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26035', '26', N'Clare County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26037', '26', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26039', '26', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26041', '26', N'Delta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26043', '26', N'Dickinson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26045', '26', N'Eaton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26047', '26', N'Emmet County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26049', '26', N'Genesee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26051', '26', N'Gladwin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26053', '26', N'Gogebic County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26055', '26', N'Grand Traverse County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26057', '26', N'Gratiot County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26059', '26', N'Hillsdale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26061', '26', N'Houghton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26063', '26', N'Huron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26065', '26', N'Ingham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26067', '26', N'Ionia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26069', '26', N'Iosco County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26071', '26', N'Iron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26073', '26', N'Isabella County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26075', '26', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26077', '26', N'Kalamazoo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26079', '26', N'Kalkaska County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26081', '26', N'Kent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26083', '26', N'Keweenaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26085', '26', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26087', '26', N'Lapeer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26089', '26', N'Leelanau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26091', '26', N'Lenawee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26093', '26', N'Livingston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26095', '26', N'Luce County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26097', '26', N'Mackinac County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26099', '26', N'Macomb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26101', '26', N'Manistee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26103', '26', N'Marquette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26105', '26', N'Mason County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26107', '26', N'Mecosta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26109', '26', N'Menominee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26111', '26', N'Midland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26113', '26', N'Missaukee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26115', '26', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26117', '26', N'Montcalm County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26119', '26', N'Montmorency County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26121', '26', N'Muskegon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26123', '26', N'Newaygo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26125', '26', N'Oakland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26127', '26', N'Oceana County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26129', '26', N'Ogemaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26131', '26', N'Ontonagon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26133', '26', N'Osceola County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26135', '26', N'Oscoda County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26137', '26', N'Otsego County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26139', '26', N'Ottawa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26141', '26', N'Presque Isle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26143', '26', N'Roscommon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26145', '26', N'Saginaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26147', '26', N'St. Clair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26149', '26', N'St. Joseph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26151', '26', N'Sanilac County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26153', '26', N'Schoolcraft County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26155', '26', N'Shiawassee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26157', '26', N'Tuscola County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26159', '26', N'Van Buren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26161', '26', N'Washtenaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26163', '26', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '26165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('26165', '26', N'Wexford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27001', '27', N'Aitkin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27003', '27', N'Anoka County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27005', '27', N'Becker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27007', '27', N'Beltrami County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27009', '27', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27011', '27', N'Big Stone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27013', '27', N'Blue Earth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27015', '27', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27017', '27', N'Carlton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27019', '27', N'Carver County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27021', '27', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27023', '27', N'Chippewa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27025', '27', N'Chisago County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27027', '27', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27029', '27', N'Clearwater County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27031', '27', N'Cook County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27033', '27', N'Cottonwood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27035', '27', N'Crow Wing County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27037', '27', N'Dakota County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27039', '27', N'Dodge County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27041', '27', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27043', '27', N'Faribault County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27045', '27', N'Fillmore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27047', '27', N'Freeborn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27049', '27', N'Goodhue County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27051', '27', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27053', '27', N'Hennepin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27055', '27', N'Houston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27057', '27', N'Hubbard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27059', '27', N'Isanti County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27061', '27', N'Itasca County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27063', '27', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27065', '27', N'Kanabec County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27067', '27', N'Kandiyohi County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27069', '27', N'Kittson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27071', '27', N'Koochiching County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27073', '27', N'Lac qui Parle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27075', '27', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27077', '27', N'Lake of the Woods County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27079', '27', N'Le Sueur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27081', '27', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27083', '27', N'Lyon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27085', '27', N'McLeod County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27087', '27', N'Mahnomen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27089', '27', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27091', '27', N'Martin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27093', '27', N'Meeker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27095', '27', N'Mille Lacs County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27097', '27', N'Morrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27099', '27', N'Mower County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27101', '27', N'Murray County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27103', '27', N'Nicollet County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27105', '27', N'Nobles County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27107', '27', N'Norman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27109', '27', N'Olmsted County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27111', '27', N'Otter Tail County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27113', '27', N'Pennington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27115', '27', N'Pine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27117', '27', N'Pipestone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27119', '27', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27121', '27', N'Pope County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27123', '27', N'Ramsey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27125', '27', N'Red Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27127', '27', N'Redwood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27129', '27', N'Renville County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27131', '27', N'Rice County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27133', '27', N'Rock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27135', '27', N'Roseau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27137', '27', N'St. Louis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27139', '27', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27141', '27', N'Sherburne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27143', '27', N'Sibley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27145', '27', N'Stearns County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27147', '27', N'Steele County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27149', '27', N'Stevens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27151', '27', N'Swift County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27153', '27', N'Todd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27155', '27', N'Traverse County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27157', '27', N'Wabasha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27159', '27', N'Wadena County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27161', '27', N'Waseca County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27163', '27', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27165', '27', N'Watonwan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27167', '27', N'Wilkin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27169', '27', N'Winona County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27171', '27', N'Wright County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '27173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('27173', '27', N'Yellow Medicine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28001', '28', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28003', '28', N'Alcorn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28005', '28', N'Amite County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28007', '28', N'Attala County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28009', '28', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28011', '28', N'Bolivar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28013', '28', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28015', '28', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28017', '28', N'Chickasaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28019', '28', N'Choctaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28021', '28', N'Claiborne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28023', '28', N'Clarke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28025', '28', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28027', '28', N'Coahoma County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28029', '28', N'Copiah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28031', '28', N'Covington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28033', '28', N'DeSoto County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28035', '28', N'Forrest County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28037', '28', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28039', '28', N'George County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28041', '28', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28043', '28', N'Grenada County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28045', '28', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28047', '28', N'Harrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28049', '28', N'Hinds County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28051', '28', N'Holmes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28053', '28', N'Humphreys County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28055', '28', N'Issaquena County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28057', '28', N'Itawamba County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28059', '28', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28061', '28', N'Jasper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28063', '28', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28065', '28', N'Jefferson Davis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28067', '28', N'Jones County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28069', '28', N'Kemper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28071', '28', N'Lafayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28073', '28', N'Lamar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28075', '28', N'Lauderdale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28077', '28', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28079', '28', N'Leake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28081', '28', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28083', '28', N'Leflore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28085', '28', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28087', '28', N'Lowndes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28089', '28', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28091', '28', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28093', '28', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28095', '28', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28097', '28', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28099', '28', N'Neshoba County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28101', '28', N'Newton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28103', '28', N'Noxubee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28105', '28', N'Oktibbeha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28107', '28', N'Panola County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28109', '28', N'Pearl River County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28111', '28', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28113', '28', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28115', '28', N'Pontotoc County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28117', '28', N'Prentiss County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28119', '28', N'Quitman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28121', '28', N'Rankin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28123', '28', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28125', '28', N'Sharkey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28127', '28', N'Simpson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28129', '28', N'Smith County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28131', '28', N'Stone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28133', '28', N'Sunflower County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28135', '28', N'Tallahatchie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28137', '28', N'Tate County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28139', '28', N'Tippah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28141', '28', N'Tishomingo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28143', '28', N'Tunica County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28145', '28', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28147', '28', N'Walthall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28149', '28', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28151', '28', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28153', '28', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28155', '28', N'Webster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28157', '28', N'Wilkinson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28159', '28', N'Winston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28161', '28', N'Yalobusha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '28163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('28163', '28', N'Yazoo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29001', '29', N'Adair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29003', '29', N'Andrew County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29005', '29', N'Atchison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29007', '29', N'Audrain County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29009', '29', N'Barry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29011', '29', N'Barton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29013', '29', N'Bates County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29015', '29', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29017', '29', N'Bollinger County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29019', '29', N'Boone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29021', '29', N'Buchanan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29023', '29', N'Butler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29025', '29', N'Caldwell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29027', '29', N'Callaway County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29029', '29', N'Camden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29031', '29', N'Cape Girardeau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29033', '29', N'Carroll County', 0);
COMMIT TRANSACTION;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29035', '29', N'Carter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29037', '29', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29039', '29', N'Cedar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29041', '29', N'Chariton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29043', '29', N'Christian County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29045', '29', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29047', '29', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29049', '29', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29051', '29', N'Cole County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29053', '29', N'Cooper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29055', '29', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29057', '29', N'Dade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29059', '29', N'Dallas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29061', '29', N'Daviess County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29063', '29', N'DeKalb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29065', '29', N'Dent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29067', '29', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29069', '29', N'Dunklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29071', '29', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29073', '29', N'Gasconade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29075', '29', N'Gentry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29077', '29', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29079', '29', N'Grundy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29081', '29', N'Harrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29083', '29', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29085', '29', N'Hickory County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29087', '29', N'Holt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29089', '29', N'Howard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29091', '29', N'Howell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29093', '29', N'Iron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29095', '29', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29097', '29', N'Jasper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29099', '29', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29101', '29', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29103', '29', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29105', '29', N'Laclede County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29107', '29', N'Lafayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29109', '29', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29111', '29', N'Lewis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29113', '29', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29115', '29', N'Linn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29117', '29', N'Livingston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29119', '29', N'McDonald County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29121', '29', N'Macon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29123', '29', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29125', '29', N'Maries County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29127', '29', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29129', '29', N'Mercer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29131', '29', N'Miller County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29133', '29', N'Mississippi County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29135', '29', N'Moniteau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29137', '29', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29139', '29', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29141', '29', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29143', '29', N'New Madrid County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29145', '29', N'Newton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29147', '29', N'Nodaway County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29149', '29', N'Oregon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29151', '29', N'Osage County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29153', '29', N'Ozark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29155', '29', N'Pemiscot County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29157', '29', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29159', '29', N'Pettis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29161', '29', N'Phelps County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29163', '29', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29165', '29', N'Platte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29167', '29', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29169', '29', N'Pulaski County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29171', '29', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29173', '29', N'Ralls County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29175', '29', N'Randolph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29177', '29', N'Ray County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29179', '29', N'Reynolds County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29181', '29', N'Ripley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29183', '29', N'St. Charles County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29185', '29', N'St. Clair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29186')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29186', '29', N'Ste. Genevieve County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29187', '29', N'St. Francois County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29189', '29', N'St. Louis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29195', '29', N'Saline County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29197', '29', N'Schuyler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29199')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29199', '29', N'Scotland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29201')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29201', '29', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29203')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29203', '29', N'Shannon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29205')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29205', '29', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29207')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29207', '29', N'Stoddard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29209')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29209', '29', N'Stone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29211')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29211', '29', N'Sullivan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29213')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29213', '29', N'Taney County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29215')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29215', '29', N'Texas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29217')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29217', '29', N'Vernon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29219')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29219', '29', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29221')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29221', '29', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29223')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29223', '29', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29225')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29225', '29', N'Webster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29227')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29227', '29', N'Worth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29229')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29229', '29', N'Wright County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '29510')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('29510', '29', N'St. Louis city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30001', '30', N'Beaverhead County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30003', '30', N'Big Horn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30005', '30', N'Blaine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30007', '30', N'Broadwater County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30009', '30', N'Carbon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30011', '30', N'Carter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30013', '30', N'Cascade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30015', '30', N'Chouteau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30017', '30', N'Custer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30019', '30', N'Daniels County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30021', '30', N'Dawson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30023', '30', N'Deer Lodge County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30025', '30', N'Fallon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30027', '30', N'Fergus County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30029', '30', N'Flathead County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30031', '30', N'Gallatin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30033', '30', N'Garfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30035', '30', N'Glacier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30037', '30', N'Golden Valley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30039', '30', N'Granite County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30041', '30', N'Hill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30043', '30', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30045', '30', N'Judith Basin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30047', '30', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30049', '30', N'Lewis and Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30051', '30', N'Liberty County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30053', '30', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30055', '30', N'McCone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30057', '30', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30059', '30', N'Meagher County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30061', '30', N'Mineral County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30063', '30', N'Missoula County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30065', '30', N'Musselshell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30067', '30', N'Park County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30069', '30', N'Petroleum County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30071', '30', N'Phillips County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30073', '30', N'Pondera County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30075', '30', N'Powder River County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30077', '30', N'Powell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30079', '30', N'Prairie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30081', '30', N'Ravalli County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30083', '30', N'Richland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30085', '30', N'Roosevelt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30087', '30', N'Rosebud County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30089', '30', N'Sanders County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30091', '30', N'Sheridan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30093', '30', N'Silver Bow County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30095', '30', N'Stillwater County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30097', '30', N'Sweet Grass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30099', '30', N'Teton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30101', '30', N'Toole County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30103', '30', N'Treasure County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30105', '30', N'Valley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30107', '30', N'Wheatland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30109', '30', N'Wibaux County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '30111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('30111', '30', N'Yellowstone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31001', '31', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31003', '31', N'Antelope County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31005', '31', N'Arthur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31007', '31', N'Banner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31009', '31', N'Blaine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31011', '31', N'Boone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31013', '31', N'Box Butte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31015', '31', N'Boyd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31017', '31', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31019', '31', N'Buffalo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31021', '31', N'Burt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31023', '31', N'Butler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31025', '31', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31027', '31', N'Cedar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31029', '31', N'Chase County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31031', '31', N'Cherry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31033', '31', N'Cheyenne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31035', '31', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31037', '31', N'Colfax County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31039', '31', N'Cuming County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31041', '31', N'Custer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31043', '31', N'Dakota County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31045', '31', N'Dawes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31047', '31', N'Dawson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31049', '31', N'Deuel County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31051', '31', N'Dixon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31053', '31', N'Dodge County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31055', '31', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31057', '31', N'Dundy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31059', '31', N'Fillmore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31061', '31', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31063', '31', N'Frontier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31065', '31', N'Furnas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31067', '31', N'Gage County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31069', '31', N'Garden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31071', '31', N'Garfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31073', '31', N'Gosper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31075', '31', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31077', '31', N'Greeley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31079', '31', N'Hall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31081', '31', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31083', '31', N'Harlan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31085', '31', N'Hayes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31087', '31', N'Hitchcock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31089', '31', N'Holt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31091', '31', N'Hooker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31093', '31', N'Howard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31095', '31', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31097', '31', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31099', '31', N'Kearney County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31101', '31', N'Keith County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31103', '31', N'Keya Paha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31105', '31', N'Kimball County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31107', '31', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31109', '31', N'Lancaster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31111', '31', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31113', '31', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31115', '31', N'Loup County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31117', '31', N'McPherson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31119', '31', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31121', '31', N'Merrick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31123', '31', N'Morrill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31125', '31', N'Nance County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31127', '31', N'Nemaha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31129', '31', N'Nuckolls County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31131', '31', N'Otoe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31133', '31', N'Pawnee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31135', '31', N'Perkins County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31137', '31', N'Phelps County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31139', '31', N'Pierce County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31141', '31', N'Platte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31143', '31', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31145', '31', N'Red Willow County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31147', '31', N'Richardson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31149', '31', N'Rock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31151', '31', N'Saline County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31153', '31', N'Sarpy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31155', '31', N'Saunders County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31157', '31', N'Scotts Bluff County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31159', '31', N'Seward County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31161', '31', N'Sheridan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31163', '31', N'Sherman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31165', '31', N'Sioux County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31167', '31', N'Stanton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31169', '31', N'Thayer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31171', '31', N'Thomas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31173', '31', N'Thurston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31175', '31', N'Valley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31177', '31', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31179', '31', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31181', '31', N'Webster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31183', '31', N'Wheeler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '31185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('31185', '31', N'York County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32001', '32', N'Churchill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32003', '32', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32005', '32', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32007', '32', N'Elko County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32009', '32', N'Esmeralda County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32011', '32', N'Eureka County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32013', '32', N'Humboldt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32015', '32', N'Lander County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32017', '32', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32019', '32', N'Lyon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32021', '32', N'Mineral County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32023', '32', N'Nye County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32027', '32', N'Pershing County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32029', '32', N'Storey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32031', '32', N'Washoe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32033', '32', N'White Pine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '32510')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('32510', '32', N'Carson City', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33001', '33', N'Belknap County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33003', '33', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33005', '33', N'Cheshire County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33007', '33', N'Coos County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33009', '33', N'Grafton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33011', '33', N'Hillsborough County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33013', '33', N'Merrimack County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33015', '33', N'Rockingham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33017', '33', N'Strafford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '33019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('33019', '33', N'Sullivan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34001', '34', N'Atlantic County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34003', '34', N'Bergen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34005', '34', N'Burlington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34007', '34', N'Camden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34009', '34', N'Cape May County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34011', '34', N'Cumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34013', '34', N'Essex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34015', '34', N'Gloucester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34017', '34', N'Hudson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34019', '34', N'Hunterdon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34021', '34', N'Mercer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34023', '34', N'Middlesex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34025', '34', N'Monmouth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34027', '34', N'Morris County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34029', '34', N'Ocean County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34031', '34', N'Passaic County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34033', '34', N'Salem County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34035', '34', N'Somerset County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34037', '34', N'Sussex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34039', '34', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '34041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('34041', '34', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35001', '35', N'Bernalillo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35003', '35', N'Catron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35005', '35', N'Chaves County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35006')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35006', '35', N'Cibola County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35007', '35', N'Colfax County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35009', '35', N'Curry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35011', '35', N'De Baca County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35013', '35', N'Doña Ana County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35015', '35', N'Eddy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35017', '35', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35019', '35', N'Guadalupe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35021', '35', N'Harding County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35023', '35', N'Hidalgo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35025', '35', N'Lea County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35027', '35', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35028')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35028', '35', N'Los Alamos County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35029', '35', N'Luna County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35031', '35', N'McKinley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35033', '35', N'Mora County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35035', '35', N'Otero County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35037', '35', N'Quay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35039', '35', N'Rio Arriba County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35041', '35', N'Roosevelt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35043', '35', N'Sandoval County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35045', '35', N'San Juan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35047', '35', N'San Miguel County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35049', '35', N'Santa Fe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35051', '35', N'Sierra County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35053', '35', N'Socorro County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35055', '35', N'Taos County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35057', '35', N'Torrance County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35059', '35', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '35061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('35061', '35', N'Valencia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36001', '36', N'Albany County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36003', '36', N'Allegany County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36005', '36', N'Bronx County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36007', '36', N'Broome County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36009', '36', N'Cattaraugus County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36011', '36', N'Cayuga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36013', '36', N'Chautauqua County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36015', '36', N'Chemung County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36017', '36', N'Chenango County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36019', '36', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36021', '36', N'Columbia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36023', '36', N'Cortland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36025', '36', N'Delaware County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36027', '36', N'Dutchess County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36029', '36', N'Erie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36031', '36', N'Essex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36033', '36', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36035', '36', N'Fulton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36037', '36', N'Genesee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36039', '36', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36041', '36', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36043', '36', N'Herkimer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36045', '36', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36047', '36', N'Kings County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36049', '36', N'Lewis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36051', '36', N'Livingston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36053', '36', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36055', '36', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36057', '36', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36059', '36', N'Nassau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36061', '36', N'New York County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36063', '36', N'Niagara County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36065', '36', N'Oneida County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36067', '36', N'Onondaga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36069', '36', N'Ontario County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36071', '36', N'Orange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36073', '36', N'Orleans County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36075', '36', N'Oswego County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36077', '36', N'Otsego County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36079', '36', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36081', '36', N'Queens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36083', '36', N'Rensselaer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36085', '36', N'Richmond County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36087', '36', N'Rockland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36089', '36', N'St. Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36091', '36', N'Saratoga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36093', '36', N'Schenectady County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36095', '36', N'Schoharie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36097', '36', N'Schuyler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36099', '36', N'Seneca County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36101', '36', N'Steuben County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36103', '36', N'Suffolk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36105', '36', N'Sullivan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36107', '36', N'Tioga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36109', '36', N'Tompkins County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36111', '36', N'Ulster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36113', '36', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36115', '36', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36117', '36', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36119', '36', N'Westchester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36121', '36', N'Wyoming County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '36123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('36123', '36', N'Yates County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37001', '37', N'Alamance County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37003', '37', N'Alexander County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37005', '37', N'Alleghany County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37007', '37', N'Anson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37009', '37', N'Ashe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37011', '37', N'Avery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37013', '37', N'Beaufort County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37015', '37', N'Bertie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37017', '37', N'Bladen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37019', '37', N'Brunswick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37021', '37', N'Buncombe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37023', '37', N'Burke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37025', '37', N'Cabarrus County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37027', '37', N'Caldwell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37029', '37', N'Camden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37031', '37', N'Carteret County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37033', '37', N'Caswell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37035', '37', N'Catawba County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37037', '37', N'Chatham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37039', '37', N'Cherokee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37041', '37', N'Chowan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37043', '37', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37045', '37', N'Cleveland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37047', '37', N'Columbus County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37049', '37', N'Craven County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37051', '37', N'Cumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37053', '37', N'Currituck County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37055', '37', N'Dare County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37057', '37', N'Davidson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37059', '37', N'Davie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37061', '37', N'Duplin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37063', '37', N'Durham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37065', '37', N'Edgecombe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37067', '37', N'Forsyth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37069', '37', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37071', '37', N'Gaston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37073', '37', N'Gates County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37075', '37', N'Graham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37077', '37', N'Granville County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37079', '37', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37081', '37', N'Guilford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37083', '37', N'Halifax County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37085', '37', N'Harnett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37087', '37', N'Haywood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37089', '37', N'Henderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37091', '37', N'Hertford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37093', '37', N'Hoke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37095', '37', N'Hyde County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37097', '37', N'Iredell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37099', '37', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37101', '37', N'Johnston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37103', '37', N'Jones County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37105', '37', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37107', '37', N'Lenoir County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37109', '37', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37111', '37', N'McDowell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37113', '37', N'Macon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37115', '37', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37117', '37', N'Martin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37119', '37', N'Mecklenburg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37121', '37', N'Mitchell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37123', '37', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37125', '37', N'Moore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37127', '37', N'Nash County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37129', '37', N'New Hanover County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37131', '37', N'Northampton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37133', '37', N'Onslow County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37135', '37', N'Orange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37137', '37', N'Pamlico County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37139', '37', N'Pasquotank County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37141', '37', N'Pender County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37143', '37', N'Perquimans County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37145', '37', N'Person County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37147', '37', N'Pitt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37149', '37', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37151', '37', N'Randolph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37153', '37', N'Richmond County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37155', '37', N'Robeson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37157', '37', N'Rockingham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37159', '37', N'Rowan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37161', '37', N'Rutherford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37163', '37', N'Sampson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37165', '37', N'Scotland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37167', '37', N'Stanly County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37169', '37', N'Stokes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37171', '37', N'Surry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37173', '37', N'Swain County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37175', '37', N'Transylvania County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37177', '37', N'Tyrrell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37179', '37', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37181', '37', N'Vance County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37183', '37', N'Wake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37185', '37', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37187', '37', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37189', '37', N'Watauga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37191')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37191', '37', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37193')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37193', '37', N'Wilkes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37195', '37', N'Wilson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37197', '37', N'Yadkin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '37199')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('37199', '37', N'Yancey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38001', '38', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38003', '38', N'Barnes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38005', '38', N'Benson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38007', '38', N'Billings County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38009', '38', N'Bottineau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38011', '38', N'Bowman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38013', '38', N'Burke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38015', '38', N'Burleigh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38017', '38', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38019', '38', N'Cavalier County', 0);
COMMIT TRANSACTION;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38021', '38', N'Dickey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38023', '38', N'Divide County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38025', '38', N'Dunn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38027', '38', N'Eddy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38029', '38', N'Emmons County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38031', '38', N'Foster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38033', '38', N'Golden Valley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38035', '38', N'Grand Forks County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38037', '38', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38039', '38', N'Griggs County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38041', '38', N'Hettinger County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38043', '38', N'Kidder County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38045', '38', N'LaMoure County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38047', '38', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38049', '38', N'McHenry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38051', '38', N'McIntosh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38053', '38', N'McKenzie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38055', '38', N'McLean County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38057', '38', N'Mercer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38059', '38', N'Morton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38061', '38', N'Mountrail County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38063', '38', N'Nelson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38065', '38', N'Oliver County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38067', '38', N'Pembina County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38069', '38', N'Pierce County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38071', '38', N'Ramsey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38073', '38', N'Ransom County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38075', '38', N'Renville County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38077', '38', N'Richland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38079', '38', N'Rolette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38081', '38', N'Sargent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38083', '38', N'Sheridan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38085', '38', N'Sioux County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38087', '38', N'Slope County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38089', '38', N'Stark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38091', '38', N'Steele County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38093', '38', N'Stutsman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38095', '38', N'Towner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38097', '38', N'Traill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38099', '38', N'Walsh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38101', '38', N'Ward County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38103', '38', N'Wells County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '38105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('38105', '38', N'Williams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39001', '39', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39003', '39', N'Allen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39005', '39', N'Ashland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39007', '39', N'Ashtabula County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39009', '39', N'Athens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39011', '39', N'Auglaize County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39013', '39', N'Belmont County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39015', '39', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39017', '39', N'Butler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39019', '39', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39021', '39', N'Champaign County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39023', '39', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39025', '39', N'Clermont County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39027', '39', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39029', '39', N'Columbiana County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39031', '39', N'Coshocton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39033', '39', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39035', '39', N'Cuyahoga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39037', '39', N'Darke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39039', '39', N'Defiance County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39041', '39', N'Delaware County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39043', '39', N'Erie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39045', '39', N'Fairfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39047', '39', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39049', '39', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39051', '39', N'Fulton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39053', '39', N'Gallia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39055', '39', N'Geauga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39057', '39', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39059', '39', N'Guernsey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39061', '39', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39063', '39', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39065', '39', N'Hardin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39067', '39', N'Harrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39069', '39', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39071', '39', N'Highland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39073', '39', N'Hocking County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39075', '39', N'Holmes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39077', '39', N'Huron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39079', '39', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39081', '39', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39083', '39', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39085', '39', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39087', '39', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39089', '39', N'Licking County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39091', '39', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39093', '39', N'Lorain County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39095', '39', N'Lucas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39097', '39', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39099', '39', N'Mahoning County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39101', '39', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39103', '39', N'Medina County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39105', '39', N'Meigs County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39107', '39', N'Mercer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39109', '39', N'Miami County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39111', '39', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39113', '39', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39115', '39', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39117', '39', N'Morrow County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39119', '39', N'Muskingum County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39121', '39', N'Noble County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39123', '39', N'Ottawa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39125', '39', N'Paulding County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39127', '39', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39129', '39', N'Pickaway County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39131', '39', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39133', '39', N'Portage County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39135', '39', N'Preble County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39137', '39', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39139', '39', N'Richland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39141', '39', N'Ross County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39143', '39', N'Sandusky County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39145', '39', N'Scioto County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39147', '39', N'Seneca County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39149', '39', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39151', '39', N'Stark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39153', '39', N'Summit County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39155', '39', N'Trumbull County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39157', '39', N'Tuscarawas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39159', '39', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39161', '39', N'Van Wert County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39163', '39', N'Vinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39165', '39', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39167', '39', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39169', '39', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39171', '39', N'Williams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39173', '39', N'Wood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '39175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('39175', '39', N'Wyandot County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40001', '40', N'Adair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40003', '40', N'Alfalfa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40005', '40', N'Atoka County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40007', '40', N'Beaver County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40009', '40', N'Beckham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40011', '40', N'Blaine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40013', '40', N'Bryan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40015', '40', N'Caddo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40017', '40', N'Canadian County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40019', '40', N'Carter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40021', '40', N'Cherokee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40023', '40', N'Choctaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40025', '40', N'Cimarron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40027', '40', N'Cleveland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40029', '40', N'Coal County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40031', '40', N'Comanche County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40033', '40', N'Cotton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40035', '40', N'Craig County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40037', '40', N'Creek County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40039', '40', N'Custer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40041', '40', N'Delaware County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40043', '40', N'Dewey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40045', '40', N'Ellis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40047', '40', N'Garfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40049', '40', N'Garvin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40051', '40', N'Grady County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40053', '40', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40055', '40', N'Greer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40057', '40', N'Harmon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40059', '40', N'Harper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40061', '40', N'Haskell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40063', '40', N'Hughes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40065', '40', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40067', '40', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40069', '40', N'Johnston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40071', '40', N'Kay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40073', '40', N'Kingfisher County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40075', '40', N'Kiowa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40077', '40', N'Latimer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40079', '40', N'Le Flore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40081', '40', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40083', '40', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40085', '40', N'Love County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40087', '40', N'McClain County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40089', '40', N'McCurtain County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40091', '40', N'McIntosh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40093', '40', N'Major County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40095', '40', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40097', '40', N'Mayes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40099', '40', N'Murray County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40101', '40', N'Muskogee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40103', '40', N'Noble County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40105', '40', N'Nowata County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40107', '40', N'Okfuskee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40109', '40', N'Oklahoma County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40111', '40', N'Okmulgee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40113', '40', N'Osage County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40115', '40', N'Ottawa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40117', '40', N'Pawnee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40119', '40', N'Payne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40121', '40', N'Pittsburg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40123', '40', N'Pontotoc County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40125', '40', N'Pottawatomie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40127', '40', N'Pushmataha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40129', '40', N'Roger Mills County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40131', '40', N'Rogers County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40133', '40', N'Seminole County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40135', '40', N'Sequoyah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40137', '40', N'Stephens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40139', '40', N'Texas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40141', '40', N'Tillman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40143', '40', N'Tulsa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40145', '40', N'Wagoner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40147', '40', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40149', '40', N'Washita County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40151', '40', N'Woods County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '40153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('40153', '40', N'Woodward County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41001', '41', N'Baker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41003', '41', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41005', '41', N'Clackamas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41007', '41', N'Clatsop County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41009', '41', N'Columbia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41011', '41', N'Coos County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41013', '41', N'Crook County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41015', '41', N'Curry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41017', '41', N'Deschutes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41019', '41', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41021', '41', N'Gilliam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41023', '41', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41025', '41', N'Harney County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41027', '41', N'Hood River County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41029', '41', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41031', '41', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41033', '41', N'Josephine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41035', '41', N'Klamath County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41037', '41', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41039', '41', N'Lane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41041', '41', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41043', '41', N'Linn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41045', '41', N'Malheur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41047', '41', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41049', '41', N'Morrow County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41051', '41', N'Multnomah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41053', '41', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41055', '41', N'Sherman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41057', '41', N'Tillamook County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41059', '41', N'Umatilla County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41061', '41', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41063', '41', N'Wallowa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41065', '41', N'Wasco County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41067', '41', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41069', '41', N'Wheeler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '41071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('41071', '41', N'Yamhill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42001', '42', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42003', '42', N'Allegheny County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42005', '42', N'Armstrong County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42007', '42', N'Beaver County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42009', '42', N'Bedford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42011', '42', N'Berks County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42013', '42', N'Blair County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42015', '42', N'Bradford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42017', '42', N'Bucks County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42019', '42', N'Butler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42021', '42', N'Cambria County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42023', '42', N'Cameron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42025', '42', N'Carbon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42027', '42', N'Centre County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42029', '42', N'Chester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42031', '42', N'Clarion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42033', '42', N'Clearfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42035', '42', N'Clinton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42037', '42', N'Columbia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42039', '42', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42041', '42', N'Cumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42043', '42', N'Dauphin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42045', '42', N'Delaware County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42047', '42', N'Elk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42049', '42', N'Erie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42051', '42', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42053', '42', N'Forest County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42055', '42', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42057', '42', N'Fulton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42059', '42', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42061', '42', N'Huntingdon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42063', '42', N'Indiana County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42065', '42', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42067', '42', N'Juniata County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42069', '42', N'Lackawanna County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42071', '42', N'Lancaster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42073', '42', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42075', '42', N'Lebanon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42077', '42', N'Lehigh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42079', '42', N'Luzerne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42081', '42', N'Lycoming County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42083', '42', N'McKean County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42085', '42', N'Mercer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42087', '42', N'Mifflin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42089', '42', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42091', '42', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42093', '42', N'Montour County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42095', '42', N'Northampton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42097', '42', N'Northumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42099', '42', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42101', '42', N'Philadelphia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42103', '42', N'Pike County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42105', '42', N'Potter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42107', '42', N'Schuylkill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42109', '42', N'Snyder County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42111', '42', N'Somerset County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42113', '42', N'Sullivan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42115', '42', N'Susquehanna County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42117', '42', N'Tioga County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42119', '42', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42121', '42', N'Venango County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42123', '42', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42125', '42', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42127', '42', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42129', '42', N'Westmoreland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42131', '42', N'Wyoming County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '42133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('42133', '42', N'York County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '44001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('44001', '44', N'Bristol County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '44003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('44003', '44', N'Kent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '44005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('44005', '44', N'Newport County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '44007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('44007', '44', N'Providence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '44009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('44009', '44', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45001', '45', N'Abbeville County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45003', '45', N'Aiken County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45005', '45', N'Allendale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45007', '45', N'Anderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45009', '45', N'Bamberg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45011', '45', N'Barnwell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45013', '45', N'Beaufort County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45015', '45', N'Berkeley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45017', '45', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45019', '45', N'Charleston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45021', '45', N'Cherokee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45023', '45', N'Chester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45025', '45', N'Chesterfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45027', '45', N'Clarendon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45029', '45', N'Colleton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45031', '45', N'Darlington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45033', '45', N'Dillon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45035', '45', N'Dorchester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45037', '45', N'Edgefield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45039', '45', N'Fairfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45041', '45', N'Florence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45043', '45', N'Georgetown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45045', '45', N'Greenville County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45047', '45', N'Greenwood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45049', '45', N'Hampton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45051', '45', N'Horry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45053', '45', N'Jasper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45055', '45', N'Kershaw County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45057', '45', N'Lancaster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45059', '45', N'Laurens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45061', '45', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45063', '45', N'Lexington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45065', '45', N'McCormick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45067', '45', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45069', '45', N'Marlboro County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45071', '45', N'Newberry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45073', '45', N'Oconee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45075', '45', N'Orangeburg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45077', '45', N'Pickens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45079', '45', N'Richland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45081', '45', N'Saluda County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45083', '45', N'Spartanburg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45085', '45', N'Sumter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45087', '45', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45089', '45', N'Williamsburg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '45091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('45091', '45', N'York County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46003', '46', N'Aurora County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46005', '46', N'Beadle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46007', '46', N'Bennett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46009', '46', N'Bon Homme County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46011', '46', N'Brookings County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46013', '46', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46015', '46', N'Brule County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46017', '46', N'Buffalo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46019', '46', N'Butte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46021', '46', N'Campbell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46023', '46', N'Charles Mix County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46025', '46', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46027', '46', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46029', '46', N'Codington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46031', '46', N'Corson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46033', '46', N'Custer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46035', '46', N'Davison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46037', '46', N'Day County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46039', '46', N'Deuel County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46041', '46', N'Dewey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46043', '46', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46045', '46', N'Edmunds County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46047', '46', N'Fall River County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46049', '46', N'Faulk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46051', '46', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46053', '46', N'Gregory County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46055', '46', N'Haakon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46057', '46', N'Hamlin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46059', '46', N'Hand County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46061', '46', N'Hanson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46063', '46', N'Harding County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46065', '46', N'Hughes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46067', '46', N'Hutchinson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46069', '46', N'Hyde County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46071', '46', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46073', '46', N'Jerauld County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46075', '46', N'Jones County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46077', '46', N'Kingsbury County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46079', '46', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46081', '46', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46083', '46', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46085', '46', N'Lyman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46087', '46', N'McCook County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46089', '46', N'McPherson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46091', '46', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46093', '46', N'Meade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46095', '46', N'Mellette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46097', '46', N'Miner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46099', '46', N'Minnehaha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46101', '46', N'Moody County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46102')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46102', '46', N'Oglala Lakota County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46103', '46', N'Pennington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46105', '46', N'Perkins County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46107', '46', N'Potter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46109', '46', N'Roberts County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46111', '46', N'Sanborn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46115', '46', N'Spink County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46117', '46', N'Stanley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46119', '46', N'Sully County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46121', '46', N'Todd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46123', '46', N'Tripp County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46125', '46', N'Turner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46127', '46', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46129', '46', N'Walworth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46135', '46', N'Yankton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '46137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('46137', '46', N'Ziebach County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47001', '47', N'Anderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47003', '47', N'Bedford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47005', '47', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47007', '47', N'Bledsoe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47009', '47', N'Blount County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47011', '47', N'Bradley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47013', '47', N'Campbell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47015', '47', N'Cannon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47017', '47', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47019', '47', N'Carter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47021', '47', N'Cheatham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47023', '47', N'Chester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47025', '47', N'Claiborne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47027', '47', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47029', '47', N'Cocke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47031', '47', N'Coffee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47033', '47', N'Crockett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47035', '47', N'Cumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47037', '47', N'Davidson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47039', '47', N'Decatur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47041', '47', N'DeKalb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47043', '47', N'Dickson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47045', '47', N'Dyer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47047', '47', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47049', '47', N'Fentress County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47051', '47', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47053', '47', N'Gibson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47055', '47', N'Giles County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47057', '47', N'Grainger County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47059', '47', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47061', '47', N'Grundy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47063', '47', N'Hamblen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47065', '47', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47067', '47', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47069', '47', N'Hardeman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47071', '47', N'Hardin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47073', '47', N'Hawkins County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47075', '47', N'Haywood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47077', '47', N'Henderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47079', '47', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47081', '47', N'Hickman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47083', '47', N'Houston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47085', '47', N'Humphreys County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47087', '47', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47089', '47', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47091', '47', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47093', '47', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47095', '47', N'Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47097', '47', N'Lauderdale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47099', '47', N'Lawrence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47101', '47', N'Lewis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47103', '47', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47105', '47', N'Loudon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47107', '47', N'McMinn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47109', '47', N'McNairy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47111', '47', N'Macon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47113', '47', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47115', '47', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47117', '47', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47119', '47', N'Maury County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47121', '47', N'Meigs County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47123', '47', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47125', '47', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47127', '47', N'Moore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47129', '47', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47131', '47', N'Obion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47133', '47', N'Overton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47135', '47', N'Perry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47137', '47', N'Pickett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47139', '47', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47141', '47', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47143', '47', N'Rhea County', 0);
COMMIT TRANSACTION;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47145', '47', N'Roane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47147', '47', N'Robertson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47149', '47', N'Rutherford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47151', '47', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47153', '47', N'Sequatchie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47155', '47', N'Sevier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47157', '47', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47159', '47', N'Smith County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47161', '47', N'Stewart County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47163', '47', N'Sullivan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47165', '47', N'Sumner County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47167', '47', N'Tipton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47169', '47', N'Trousdale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47171', '47', N'Unicoi County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47173', '47', N'Union County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47175', '47', N'Van Buren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47177', '47', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47179', '47', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47181', '47', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47183', '47', N'Weakley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47185', '47', N'White County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47187', '47', N'Williamson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '47189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('47189', '47', N'Wilson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48001', '48', N'Anderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48003', '48', N'Andrews County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48005', '48', N'Angelina County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48007', '48', N'Aransas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48009', '48', N'Archer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48011', '48', N'Armstrong County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48013', '48', N'Atascosa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48015', '48', N'Austin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48017', '48', N'Bailey County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48019', '48', N'Bandera County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48021', '48', N'Bastrop County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48023', '48', N'Baylor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48025', '48', N'Bee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48027', '48', N'Bell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48029', '48', N'Bexar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48031', '48', N'Blanco County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48033', '48', N'Borden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48035', '48', N'Bosque County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48037', '48', N'Bowie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48039', '48', N'Brazoria County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48041', '48', N'Brazos County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48043', '48', N'Brewster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48045', '48', N'Briscoe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48047', '48', N'Brooks County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48049', '48', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48051', '48', N'Burleson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48053', '48', N'Burnet County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48055', '48', N'Caldwell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48057', '48', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48059', '48', N'Callahan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48061', '48', N'Cameron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48063', '48', N'Camp County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48065', '48', N'Carson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48067', '48', N'Cass County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48069', '48', N'Castro County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48071', '48', N'Chambers County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48073', '48', N'Cherokee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48075', '48', N'Childress County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48077', '48', N'Clay County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48079', '48', N'Cochran County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48081', '48', N'Coke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48083', '48', N'Coleman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48085', '48', N'Collin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48087', '48', N'Collingsworth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48089', '48', N'Colorado County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48091', '48', N'Comal County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48093', '48', N'Comanche County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48095', '48', N'Concho County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48097', '48', N'Cooke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48099', '48', N'Coryell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48101', '48', N'Cottle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48103', '48', N'Crane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48105', '48', N'Crockett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48107', '48', N'Crosby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48109', '48', N'Culberson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48111', '48', N'Dallam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48113', '48', N'Dallas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48115', '48', N'Dawson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48117', '48', N'Deaf Smith County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48119', '48', N'Delta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48121', '48', N'Denton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48123', '48', N'DeWitt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48125', '48', N'Dickens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48127', '48', N'Dimmit County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48129', '48', N'Donley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48131', '48', N'Duval County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48133', '48', N'Eastland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48135', '48', N'Ector County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48137', '48', N'Edwards County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48139', '48', N'Ellis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48141', '48', N'El Paso County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48143', '48', N'Erath County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48145', '48', N'Falls County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48147', '48', N'Fannin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48149', '48', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48151', '48', N'Fisher County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48153', '48', N'Floyd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48155', '48', N'Foard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48157', '48', N'Fort Bend County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48159', '48', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48161', '48', N'Freestone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48163', '48', N'Frio County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48165', '48', N'Gaines County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48167', '48', N'Galveston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48169', '48', N'Garza County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48171', '48', N'Gillespie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48173', '48', N'Glasscock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48175', '48', N'Goliad County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48177', '48', N'Gonzales County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48179', '48', N'Gray County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48181', '48', N'Grayson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48183', '48', N'Gregg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48185', '48', N'Grimes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48187', '48', N'Guadalupe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48189')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48189', '48', N'Hale County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48191')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48191', '48', N'Hall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48193')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48193', '48', N'Hamilton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48195', '48', N'Hansford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48197', '48', N'Hardeman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48199')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48199', '48', N'Hardin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48201')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48201', '48', N'Harris County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48203')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48203', '48', N'Harrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48205')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48205', '48', N'Hartley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48207')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48207', '48', N'Haskell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48209')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48209', '48', N'Hays County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48211')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48211', '48', N'Hemphill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48213')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48213', '48', N'Henderson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48215')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48215', '48', N'Hidalgo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48217')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48217', '48', N'Hill County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48219')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48219', '48', N'Hockley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48221')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48221', '48', N'Hood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48223')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48223', '48', N'Hopkins County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48225')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48225', '48', N'Houston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48227')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48227', '48', N'Howard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48229')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48229', '48', N'Hudspeth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48231')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48231', '48', N'Hunt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48233')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48233', '48', N'Hutchinson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48235')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48235', '48', N'Irion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48237')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48237', '48', N'Jack County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48239')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48239', '48', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48241')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48241', '48', N'Jasper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48243')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48243', '48', N'Jeff Davis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48245')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48245', '48', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48247')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48247', '48', N'Jim Hogg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48249')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48249', '48', N'Jim Wells County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48251')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48251', '48', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48253')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48253', '48', N'Jones County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48255')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48255', '48', N'Karnes County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48257')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48257', '48', N'Kaufman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48259')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48259', '48', N'Kendall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48261')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48261', '48', N'Kenedy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48263')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48263', '48', N'Kent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48265')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48265', '48', N'Kerr County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48267')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48267', '48', N'Kimble County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48269')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48269', '48', N'King County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48271')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48271', '48', N'Kinney County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48273')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48273', '48', N'Kleberg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48275')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48275', '48', N'Knox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48277')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48277', '48', N'Lamar County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48279')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48279', '48', N'Lamb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48281')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48281', '48', N'Lampasas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48283')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48283', '48', N'La Salle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48285')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48285', '48', N'Lavaca County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48287')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48287', '48', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48289')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48289', '48', N'Leon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48291')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48291', '48', N'Liberty County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48293')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48293', '48', N'Limestone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48295')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48295', '48', N'Lipscomb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48297')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48297', '48', N'Live Oak County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48299')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48299', '48', N'Llano County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48301')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48301', '48', N'Loving County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48303')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48303', '48', N'Lubbock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48305')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48305', '48', N'Lynn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48307')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48307', '48', N'McCulloch County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48309')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48309', '48', N'McLennan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48311')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48311', '48', N'McMullen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48313')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48313', '48', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48315')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48315', '48', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48317')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48317', '48', N'Martin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48319')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48319', '48', N'Mason County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48321')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48321', '48', N'Matagorda County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48323')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48323', '48', N'Maverick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48325')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48325', '48', N'Medina County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48327')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48327', '48', N'Menard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48329')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48329', '48', N'Midland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48331')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48331', '48', N'Milam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48333')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48333', '48', N'Mills County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48335')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48335', '48', N'Mitchell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48337')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48337', '48', N'Montague County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48339')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48339', '48', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48341')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48341', '48', N'Moore County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48343')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48343', '48', N'Morris County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48345')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48345', '48', N'Motley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48347')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48347', '48', N'Nacogdoches County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48349')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48349', '48', N'Navarro County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48351')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48351', '48', N'Newton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48353')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48353', '48', N'Nolan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48355')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48355', '48', N'Nueces County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48357')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48357', '48', N'Ochiltree County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48359')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48359', '48', N'Oldham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48361')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48361', '48', N'Orange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48363')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48363', '48', N'Palo Pinto County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48365')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48365', '48', N'Panola County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48367')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48367', '48', N'Parker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48369')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48369', '48', N'Parmer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48371')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48371', '48', N'Pecos County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48373')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48373', '48', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48375')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48375', '48', N'Potter County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48377')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48377', '48', N'Presidio County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48379')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48379', '48', N'Rains County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48381')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48381', '48', N'Randall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48383')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48383', '48', N'Reagan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48385')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48385', '48', N'Real County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48387')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48387', '48', N'Red River County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48389')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48389', '48', N'Reeves County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48391')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48391', '48', N'Refugio County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48393')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48393', '48', N'Roberts County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48395')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48395', '48', N'Robertson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48397')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48397', '48', N'Rockwall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48399')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48399', '48', N'Runnels County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48401')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48401', '48', N'Rusk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48403')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48403', '48', N'Sabine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48405')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48405', '48', N'San Augustine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48407')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48407', '48', N'San Jacinto County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48409')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48409', '48', N'San Patricio County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48411')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48411', '48', N'San Saba County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48413')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48413', '48', N'Schleicher County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48415')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48415', '48', N'Scurry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48417')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48417', '48', N'Shackelford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48419')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48419', '48', N'Shelby County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48421')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48421', '48', N'Sherman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48423')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48423', '48', N'Smith County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48425')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48425', '48', N'Somervell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48427')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48427', '48', N'Starr County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48429')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48429', '48', N'Stephens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48431')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48431', '48', N'Sterling County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48433')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48433', '48', N'Stonewall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48435')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48435', '48', N'Sutton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48437')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48437', '48', N'Swisher County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48439')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48439', '48', N'Tarrant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48441')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48441', '48', N'Taylor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48443')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48443', '48', N'Terrell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48445')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48445', '48', N'Terry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48447')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48447', '48', N'Throckmorton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48449')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48449', '48', N'Titus County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48451')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48451', '48', N'Tom Green County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48453')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48453', '48', N'Travis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48455')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48455', '48', N'Trinity County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48457')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48457', '48', N'Tyler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48459')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48459', '48', N'Upshur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48461')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48461', '48', N'Upton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48463')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48463', '48', N'Uvalde County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48465')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48465', '48', N'Val Verde County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48467')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48467', '48', N'Van Zandt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48469')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48469', '48', N'Victoria County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48471')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48471', '48', N'Walker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48473')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48473', '48', N'Waller County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48475')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48475', '48', N'Ward County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48477')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48477', '48', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48479')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48479', '48', N'Webb County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48481')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48481', '48', N'Wharton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48483')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48483', '48', N'Wheeler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48485')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48485', '48', N'Wichita County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48487')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48487', '48', N'Wilbarger County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48489')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48489', '48', N'Willacy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48491')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48491', '48', N'Williamson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48493')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48493', '48', N'Wilson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48495')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48495', '48', N'Winkler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48497')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48497', '48', N'Wise County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48499')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48499', '48', N'Wood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48501')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48501', '48', N'Yoakum County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48503')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48503', '48', N'Young County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48505')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48505', '48', N'Zapata County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '48507')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('48507', '48', N'Zavala County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49001', '49', N'Beaver County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49003', '49', N'Box Elder County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49005', '49', N'Cache County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49007', '49', N'Carbon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49009', '49', N'Daggett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49011', '49', N'Davis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49013', '49', N'Duchesne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49015', '49', N'Emery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49017', '49', N'Garfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49019', '49', N'Grand County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49021', '49', N'Iron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49023', '49', N'Juab County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49025', '49', N'Kane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49027', '49', N'Millard County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49029', '49', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49031', '49', N'Piute County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49033', '49', N'Rich County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49035', '49', N'Salt Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49037', '49', N'San Juan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49039', '49', N'Sanpete County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49041', '49', N'Sevier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49043', '49', N'Summit County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49045', '49', N'Tooele County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49047', '49', N'Uintah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49049', '49', N'Utah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49051', '49', N'Wasatch County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49053', '49', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49055', '49', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '49057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('49057', '49', N'Weber County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50001', '50', N'Addison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50003', '50', N'Bennington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50005', '50', N'Caledonia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50007', '50', N'Chittenden County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50009', '50', N'Essex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50011', '50', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50013', '50', N'Grand Isle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50015', '50', N'Lamoille County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50017', '50', N'Orange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50019', '50', N'Orleans County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50021', '50', N'Rutland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50023', '50', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50025', '50', N'Windham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '50027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('50027', '50', N'Windsor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51001', '51', N'Accomack County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51003', '51', N'Albemarle County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51005', '51', N'Alleghany County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51007', '51', N'Amelia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51009', '51', N'Amherst County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51011', '51', N'Appomattox County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51013', '51', N'Arlington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51015', '51', N'Augusta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51017', '51', N'Bath County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51019', '51', N'Bedford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51021', '51', N'Bland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51023', '51', N'Botetourt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51025', '51', N'Brunswick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51027', '51', N'Buchanan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51029', '51', N'Buckingham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51031', '51', N'Campbell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51033', '51', N'Caroline County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51035', '51', N'Carroll County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51036')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51036', '51', N'Charles City County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51037', '51', N'Charlotte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51041', '51', N'Chesterfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51043', '51', N'Clarke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51045', '51', N'Craig County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51047', '51', N'Culpeper County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51049', '51', N'Cumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51051', '51', N'Dickenson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51053', '51', N'Dinwiddie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51057', '51', N'Essex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51059', '51', N'Fairfax County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51061', '51', N'Fauquier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51063', '51', N'Floyd County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51065', '51', N'Fluvanna County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51067', '51', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51069', '51', N'Frederick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51071', '51', N'Giles County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51073', '51', N'Gloucester County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51075', '51', N'Goochland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51077', '51', N'Grayson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51079', '51', N'Greene County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51081', '51', N'Greensville County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51083', '51', N'Halifax County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51085', '51', N'Hanover County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51087', '51', N'Henrico County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51089', '51', N'Henry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51091', '51', N'Highland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51093', '51', N'Isle of Wight County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51095', '51', N'James City County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51097', '51', N'King and Queen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51099', '51', N'King George County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51101', '51', N'King William County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51103', '51', N'Lancaster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51105', '51', N'Lee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51107', '51', N'Loudoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51109', '51', N'Louisa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51111', '51', N'Lunenburg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51113', '51', N'Madison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51115', '51', N'Mathews County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51117', '51', N'Mecklenburg County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51119', '51', N'Middlesex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51121', '51', N'Montgomery County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51125', '51', N'Nelson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51127', '51', N'New Kent County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51131', '51', N'Northampton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51133', '51', N'Northumberland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51135', '51', N'Nottoway County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51137', '51', N'Orange County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51139', '51', N'Page County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51141', '51', N'Patrick County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51143', '51', N'Pittsylvania County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51145', '51', N'Powhatan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51147', '51', N'Prince Edward County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51149', '51', N'Prince George County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51153', '51', N'Prince William County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51155')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51155', '51', N'Pulaski County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51157')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51157', '51', N'Rappahannock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51159')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51159', '51', N'Richmond County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51161')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51161', '51', N'Roanoke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51163')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51163', '51', N'Rockbridge County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51165')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51165', '51', N'Rockingham County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51167')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51167', '51', N'Russell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51169')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51169', '51', N'Scott County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51171')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51171', '51', N'Shenandoah County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51173')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51173', '51', N'Smyth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51175')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51175', '51', N'Southampton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51177')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51177', '51', N'Spotsylvania County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51179')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51179', '51', N'Stafford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51181')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51181', '51', N'Surry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51183')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51183', '51', N'Sussex County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51185')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51185', '51', N'Tazewell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51187')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51187', '51', N'Warren County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51191')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51191', '51', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51193')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51193', '51', N'Westmoreland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51195')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51195', '51', N'Wise County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51197')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51197', '51', N'Wythe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51199')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51199', '51', N'York County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51510')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51510', '51', N'Alexandria city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51520')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51520', '51', N'Bristol city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51530')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51530', '51', N'Buena Vista city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51540')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51540', '51', N'Charlottesville city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51550')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51550', '51', N'Chesapeake city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51570')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51570', '51', N'Colonial Heights city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51580')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51580', '51', N'Covington city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51590')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51590', '51', N'Danville city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51595')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51595', '51', N'Emporia city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51600')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51600', '51', N'Fairfax city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51610')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51610', '51', N'Falls Church city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51620')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51620', '51', N'Franklin city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51630')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51630', '51', N'Fredericksburg city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51640')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51640', '51', N'Galax city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51650')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51650', '51', N'Hampton city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51660')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51660', '51', N'Harrisonburg city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51670')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51670', '51', N'Hopewell city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51678')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51678', '51', N'Lexington city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51680')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51680', '51', N'Lynchburg city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51683')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51683', '51', N'Manassas city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51685')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51685', '51', N'Manassas Park city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51690')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51690', '51', N'Martinsville city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51700')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51700', '51', N'Newport News city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51710')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51710', '51', N'Norfolk city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51720')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51720', '51', N'Norton city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51730')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51730', '51', N'Petersburg city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51735')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51735', '51', N'Poquoson city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51740')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51740', '51', N'Portsmouth city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51750')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51750', '51', N'Radford city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51760')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51760', '51', N'Richmond city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51770')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51770', '51', N'Roanoke city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51775')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51775', '51', N'Salem city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51790')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51790', '51', N'Staunton city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51800')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51800', '51', N'Suffolk city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51810')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51810', '51', N'Virginia Beach city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51820')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51820', '51', N'Waynesboro city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51830')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51830', '51', N'Williamsburg city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '51840')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('51840', '51', N'Winchester city', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53001', '53', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53003', '53', N'Asotin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53005', '53', N'Benton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53007', '53', N'Chelan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53009', '53', N'Clallam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53011', '53', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53013', '53', N'Columbia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53015', '53', N'Cowlitz County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53017', '53', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53019', '53', N'Ferry County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53021', '53', N'Franklin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53023', '53', N'Garfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53025', '53', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53027', '53', N'Grays Harbor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53029', '53', N'Island County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53031', '53', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53033', '53', N'King County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53035', '53', N'Kitsap County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53037', '53', N'Kittitas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53039', '53', N'Klickitat County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53041', '53', N'Lewis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53043', '53', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53045', '53', N'Mason County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53047', '53', N'Okanogan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53049', '53', N'Pacific County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53051', '53', N'Pend Oreille County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53053', '53', N'Pierce County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53055', '53', N'San Juan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53057', '53', N'Skagit County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53059', '53', N'Skamania County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53061', '53', N'Snohomish County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53063', '53', N'Spokane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53065', '53', N'Stevens County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53067', '53', N'Thurston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53069', '53', N'Wahkiakum County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53071', '53', N'Walla Walla County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53073', '53', N'Whatcom County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53075', '53', N'Whitman County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '53077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('53077', '53', N'Yakima County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54001', '54', N'Barbour County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54003', '54', N'Berkeley County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54005', '54', N'Boone County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54007', '54', N'Braxton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54009', '54', N'Brooke County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54011', '54', N'Cabell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54013', '54', N'Calhoun County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54015', '54', N'Clay County', 0);
COMMIT TRANSACTION;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54017', '54', N'Doddridge County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54019', '54', N'Fayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54021', '54', N'Gilmer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54023', '54', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54025', '54', N'Greenbrier County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54027', '54', N'Hampshire County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54029', '54', N'Hancock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54031', '54', N'Hardy County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54033', '54', N'Harrison County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54035', '54', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54037', '54', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54039', '54', N'Kanawha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54041', '54', N'Lewis County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54043', '54', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54045', '54', N'Logan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54047', '54', N'McDowell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54049', '54', N'Marion County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54051', '54', N'Marshall County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54053', '54', N'Mason County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54055', '54', N'Mercer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54057', '54', N'Mineral County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54059', '54', N'Mingo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54061', '54', N'Monongalia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54063', '54', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54065', '54', N'Morgan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54067', '54', N'Nicholas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54069', '54', N'Ohio County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54071', '54', N'Pendleton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54073', '54', N'Pleasants County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54075', '54', N'Pocahontas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54077', '54', N'Preston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54079', '54', N'Putnam County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54081', '54', N'Raleigh County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54083', '54', N'Randolph County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54085', '54', N'Ritchie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54087', '54', N'Roane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54089', '54', N'Summers County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54091', '54', N'Taylor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54093', '54', N'Tucker County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54095', '54', N'Tyler County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54097', '54', N'Upshur County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54099', '54', N'Wayne County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54101', '54', N'Webster County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54103', '54', N'Wetzel County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54105', '54', N'Wirt County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54107', '54', N'Wood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '54109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('54109', '54', N'Wyoming County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55001', '55', N'Adams County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55003', '55', N'Ashland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55005', '55', N'Barron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55007', '55', N'Bayfield County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55009', '55', N'Brown County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55011', '55', N'Buffalo County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55013', '55', N'Burnett County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55015', '55', N'Calumet County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55017', '55', N'Chippewa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55019', '55', N'Clark County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55021', '55', N'Columbia County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55023', '55', N'Crawford County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55025', '55', N'Dane County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55027', '55', N'Dodge County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55029', '55', N'Door County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55031', '55', N'Douglas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55033', '55', N'Dunn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55035', '55', N'Eau Claire County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55037', '55', N'Florence County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55039', '55', N'Fond du Lac County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55041', '55', N'Forest County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55043', '55', N'Grant County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55045', '55', N'Green County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55047', '55', N'Green Lake County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55049', '55', N'Iowa County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55051', '55', N'Iron County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55053', '55', N'Jackson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55055', '55', N'Jefferson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55057', '55', N'Juneau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55059', '55', N'Kenosha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55061', '55', N'Kewaunee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55063', '55', N'La Crosse County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55065', '55', N'Lafayette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55067', '55', N'Langlade County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55069', '55', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55071', '55', N'Manitowoc County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55073', '55', N'Marathon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55075', '55', N'Marinette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55077', '55', N'Marquette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55078')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55078', '55', N'Menominee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55079', '55', N'Milwaukee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55081', '55', N'Monroe County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55083', '55', N'Oconto County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55085', '55', N'Oneida County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55087', '55', N'Outagamie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55089', '55', N'Ozaukee County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55091', '55', N'Pepin County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55093', '55', N'Pierce County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55095', '55', N'Polk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55097', '55', N'Portage County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55099', '55', N'Price County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55101', '55', N'Racine County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55103', '55', N'Richland County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55105', '55', N'Rock County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55107', '55', N'Rusk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55109', '55', N'St. Croix County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55111', '55', N'Sauk County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55113', '55', N'Sawyer County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55115', '55', N'Shawano County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55117', '55', N'Sheboygan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55119', '55', N'Taylor County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55121', '55', N'Trempealeau County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55123', '55', N'Vernon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55125', '55', N'Vilas County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55127', '55', N'Walworth County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55129', '55', N'Washburn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55131', '55', N'Washington County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55133', '55', N'Waukesha County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55135', '55', N'Waupaca County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55137', '55', N'Waushara County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55139', '55', N'Winnebago County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '55141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('55141', '55', N'Wood County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56001', '56', N'Albany County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56003', '56', N'Big Horn County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56005', '56', N'Campbell County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56007', '56', N'Carbon County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56009', '56', N'Converse County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56011', '56', N'Crook County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56013', '56', N'Fremont County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56015', '56', N'Goshen County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56017', '56', N'Hot Springs County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56019', '56', N'Johnson County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56021', '56', N'Laramie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56023', '56', N'Lincoln County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56025', '56', N'Natrona County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56027', '56', N'Niobrara County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56029', '56', N'Park County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56031', '56', N'Platte County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56033', '56', N'Sheridan County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56035', '56', N'Sublette County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56037', '56', N'Sweetwater County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56039', '56', N'Teton County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56041', '56', N'Uinta County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56043', '56', N'Washakie County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '56045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('56045', '56', N'Weston County', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72001')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72001', '72', N'Adjuntas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72003')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72003', '72', N'Aguada Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72005')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72005', '72', N'Aguadilla Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72007')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72007', '72', N'Aguas Buenas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72009')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72009', '72', N'Aibonito Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72011')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72011', '72', N'Añasco Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72013')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72013', '72', N'Arecibo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72015')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72015', '72', N'Arroyo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72017')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72017', '72', N'Barceloneta Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72019')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72019', '72', N'Barranquitas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72021')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72021', '72', N'Bayamón Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72023')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72023', '72', N'Cabo Rojo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72025')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72025', '72', N'Caguas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72027')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72027', '72', N'Camuy Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72029')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72029', '72', N'Canóvanas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72031')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72031', '72', N'Carolina Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72033')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72033', '72', N'Cataño Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72035')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72035', '72', N'Cayey Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72037')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72037', '72', N'Ceiba Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72039')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72039', '72', N'Ciales Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72041')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72041', '72', N'Cidra Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72043')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72043', '72', N'Coamo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72045')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72045', '72', N'Comerío Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72047')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72047', '72', N'Corozal Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72049')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72049', '72', N'Culebra Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72051')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72051', '72', N'Dorado Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72053')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72053', '72', N'Fajardo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72054')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72054', '72', N'Florida Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72055')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72055', '72', N'Guánica Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72057')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72057', '72', N'Guayama Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72059')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72059', '72', N'Guayanilla Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72061')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72061', '72', N'Guaynabo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72063')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72063', '72', N'Gurabo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72065')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72065', '72', N'Hatillo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72067')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72067', '72', N'Hormigueros Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72069')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72069', '72', N'Humacao Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72071')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72071', '72', N'Isabela Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72073')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72073', '72', N'Jayuya Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72075')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72075', '72', N'Juana Díaz Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72077')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72077', '72', N'Juncos Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72079')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72079', '72', N'Lajas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72081')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72081', '72', N'Lares Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72083')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72083', '72', N'Las Marías Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72085')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72085', '72', N'Las Piedras Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72087')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72087', '72', N'Loíza Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72089')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72089', '72', N'Luquillo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72091')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72091', '72', N'Manatí Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72093')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72093', '72', N'Maricao Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72095')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72095', '72', N'Maunabo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72097')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72097', '72', N'Mayagüez Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72099')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72099', '72', N'Moca Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72101')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72101', '72', N'Morovis Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72103')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72103', '72', N'Naguabo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72105')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72105', '72', N'Naranjito Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72107')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72107', '72', N'Orocovis Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72109')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72109', '72', N'Patillas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72111')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72111', '72', N'Peñuelas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72113')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72113', '72', N'Ponce Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72115')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72115', '72', N'Quebradillas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72117')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72117', '72', N'Rincón Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72119')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72119', '72', N'Río Grande Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72121')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72121', '72', N'Sabana Grande Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72123')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72123', '72', N'Salinas Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72125')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72125', '72', N'San Germán Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72127')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72127', '72', N'San Juan Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72129')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72129', '72', N'San Lorenzo Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72131')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72131', '72', N'San Sebastián Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72133')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72133', '72', N'Santa Isabel Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72135')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72135', '72', N'Toa Alta Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72137')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72137', '72', N'Toa Baja Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72139')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72139', '72', N'Trujillo Alto Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72141')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72141', '72', N'Utuado Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72143')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72143', '72', N'Vega Alta Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72145')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72145', '72', N'Vega Baja Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72147')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72147', '72', N'Vieques Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72149')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72149', '72', N'Villalba Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72151')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72151', '72', N'Yabucoa Municipio', 0);
IF NOT EXISTS (SELECT 1 FROM dbo.counties WHERE county_fips = '72153')
    INSERT INTO dbo.counties (county_fips, state_fips, county_name, is_active) VALUES ('72153', '72', N'Yauco Municipio', 0);
COMMIT TRANSACTION;
GO
