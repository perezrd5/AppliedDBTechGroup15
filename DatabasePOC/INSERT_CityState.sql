
INSERT [State] (StateCode, StateName)
SELECT DISTINCT OriginState, OriginStateName
FROM Combined_Flights_2018

-- TRUNCATE TABLE City

INSERT City
	(
	 AirportCode
	,City
	,StateID
	)
SELECT DISTINCT
	 c.Origin
	,c.OriginCityName
	,s.StateID
FROM dbo.Combined_Flights_2018 c
JOIN [State] s
	ON c.OriginState = s.StateCode
	AND c.OriginStateName = s.StateName




