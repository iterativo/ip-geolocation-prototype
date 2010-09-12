Create Table SmallCity(
	IpStart varchar(100),
	CountryCode varchar(100) not null,
	CountryName varchar(100),
	RegionCode varchar(100),
	RegionName varchar(100),
	City varchar(100),
	ZipCode varchar(100),
	Latitude varchar(100),
	Longitude varchar(100),
	Metrocode varchar(100)
)

--Delete from SmallCity

Create Table CountriesInAmericanContinent(
	CountryName varchar(25)
)

Alter Table CountriesInAmericanContinent
	Add Constraint CountryName_Unique Unique (CountryName)

Create Table FilteredSmallCities(
	IpStart varchar(100),
	CountryCode varchar(100) not null,
	CountryName varchar(100),
	RegionCode varchar(100),
	RegionName varchar(100),
	City varchar(100),
	ZipCode varchar(100),
	Latitude varchar(100),
	Longitude varchar(100),
	Metrocode varchar(100)
)

/* 
	Select Distinct CountryName From SmallCity
	Order By CountryName
*/

-- Populate Countries in American Continent
Insert Into CountriesInAmericanContinent(CountryName)
Values
	('Antigua and Barbuda'),
	('Bahamas'),
	('Barbados'),
	('Belize'),
	('Canada'),
	('Costa Rica'),
	('Cuba'),
	('Dominica'),
	('Dominican Republic'),
	('El Salvador'),
	('Grenada'),
	('Guatemala'),
	('Haiti'),
	('Honduras'),
	('Jamaica'),
	('Mexico'),
	('Nicaragua'),
	('Panama'),
	('Saint Kitts and Nevis'),
	('Saint Lucia'),
	('Saint Vincent and the Grenadines'),
	('Trinidad and Tobago'),
	('United States'),
	('Argentina'),
	('Bolivia'),
	('Brazil'),
	('Chile'),
	('Colombia'),
	('Ecuador'),
	('Guyana'),
	('Paraguay'),
	('Peru'),
	('Suriname'),
	('Uruguay'),
	('Venezuela')
