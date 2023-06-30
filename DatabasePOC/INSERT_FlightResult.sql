INSERT INTO [dbo].[FlightResult]
           ([CityID]
           ,[AirlineID]
           ,[FlightMonth]
           ,[FlightDayOfMonth]
           ,[PercentDelayed]
           ,[PercentCancelled])
SELECT
	 f.DepartureCity
	,f.AirlineID
	,f.FlightMonth
	,f.[DayOfMonth]
	,SUM((CASE WHEN IsCancelled = 1 THEN CAST(1 AS INT) ELSE CAST(0 AS INT) END) + (CASE WHEN IsDiverted = 1 THEN CAST(1 AS INT) ELSE CAST(0 AS INT) END))/CAST(COUNT(*) AS NUMERIC(10,3))
	,SUM(CASE WHEN DepDelayMinutes > 0 THEN 1 ELSE 0 END)/CAST(COUNT(*) AS NUMERIC(10,3))
FROM FlightRaw f
GROUP BY 
	 f.DepartureCity
	,f.AirlineID
	,f.FlightMonth
	,f.[DayOfMonth]
GO