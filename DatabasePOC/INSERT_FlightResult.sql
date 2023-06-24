USE [Group15]
GO

INSERT INTO [dbo].[FlightRaw]
           ([AirlineID]
           ,[DepartureCity]
           ,[ArrivalCity]
           ,[FlightNum]
           ,[FlightDate]
           ,[FlightMonth]
           ,[DayofMonth]
           ,[IsCancelled]
           ,[IsDiverted]
           ,[DepDelayMinutes])
SELECT
	 a.AirlineID
	,d.CityID
	,r.CityID
	,c.Flight_Number_Operating_Airline
	,c.FlightDate
	,c.[Month]
	,c.[DayOfMonth]
	,c.Cancelled
	,c.Diverted
	,c.DepDelayMinutes
FROM dbo.Combined_Flights_2018 c
JOIN dbo.City d
	ON c.Dest = d.AirportCode
JOIN dbo.City r
	ON c.Origin = r.AirportCode
JOIN dbo.Airline a
	ON c.Airline = a.AirlineName
GO


