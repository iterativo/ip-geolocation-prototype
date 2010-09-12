-- Filter Small Cities
INSERT INTO FilteredSmallCities
           ([IpStart]
           ,[CountryCode]
           ,[CountryName]
           ,[RegionCode]
           ,[RegionName]
           ,[City]
           ,[ZipCode]
           ,[Latitude]
           ,[Longitude]
           ,[Metrocode])
Select s.IpStart, s.CountryCode, s.CountryName, s.RegionCode, s.RegionName, 
	s.City, s.ZipCode, s.Latitude, s.Longitude, s.Metrocode
		From SmallCity s
		Join CountriesInAmericanContinent c
		On s.CountryName = c.CountryName