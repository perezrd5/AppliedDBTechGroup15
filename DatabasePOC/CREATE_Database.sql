USE [master]
GO
/****** Object:  Database [Group15]    Script Date: 7/8/2023 7:10:08 AM ******/
CREATE DATABASE [Group15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Group15', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Group15.mdf' , SIZE = 3612672KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Group15_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Log\Group15_log.ldf' , SIZE = 8396800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Group15] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Group15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Group15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Group15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Group15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Group15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Group15] SET ARITHABORT OFF 
GO
ALTER DATABASE [Group15] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Group15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Group15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Group15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Group15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Group15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Group15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Group15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Group15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Group15] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Group15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Group15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Group15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Group15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Group15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Group15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Group15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Group15] SET RECOVERY FULL 
GO
ALTER DATABASE [Group15] SET  MULTI_USER 
GO
ALTER DATABASE [Group15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Group15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Group15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Group15] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Group15] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Group15] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Group15', N'ON'
GO
ALTER DATABASE [Group15] SET QUERY_STORE = ON
GO
ALTER DATABASE [Group15] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Group15]
GO
/****** Object:  Table [dbo].[State]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [varchar](2) NULL,
	[StateName] [varchar](100) NULL,
 CONSTRAINT [PK_State_StateID] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[AirportCode] [varchar](4) NULL,
	[City] [varchar](100) NULL,
	[StateID] [int] NULL,
 CONSTRAINT [PK_City_CityID] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airline]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline](
	[AirlineID] [int] IDENTITY(1,1) NOT NULL,
	[AirlineName] [varchar](1000) NULL,
 CONSTRAINT [PK_Airline_AirlineID] PRIMARY KEY CLUSTERED 
(
	[AirlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightResult]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightResult](
	[FlightResultID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[AirlineID] [int] NOT NULL,
	[FlightMonth] [int] NOT NULL,
	[FlightDayOfMonth] [int] NOT NULL,
	[PercentDelayed] [numeric](10, 3) NOT NULL,
	[PercentCancelled] [numeric](10, 3) NOT NULL,
 CONSTRAINT [PK_FlightResult_FlightResultID] PRIMARY KEY CLUSTERED 
(
	[FlightResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[getFlightResult]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[getFlightResult]
AS
SELECT
	 FlightMonth = CASE
		WHEN r.FlightMonth = 1 THEN 'January'
		WHEN r.FlightMonth = 2 THEN 'February'
		WHEN r.FlightMonth = 3 THEN 'March'
		WHEN r.FlightMonth = 4 THEN 'April'
		WHEN r.FlightMonth = 5 THEN 'May'
		WHEN r.FlightMonth = 6 THEN 'June'
		WHEN r.FlightMonth = 7 THEN 'July'
		WHEN r.FlightMonth = 8 THEN 'August'
		WHEN r.FlightMonth = 9 THEN 'September'
		WHEN r.FlightMonth = 10 THEN 'October'
		WHEN r.FlightMonth = 11 THEN 'November'
		WHEN r.FlightMonth = 12 THEN 'December'
		END
	,r.FlightDayOfMonth
	,a.AirlineName
	,c.AirportCode
	,c.City
	,s.StateName
	,r.PercentDelayed
	,r.PercentCancelled
FROM dbo.FlightResult r
JOIN dbo.Airline a
	ON r.AirlineID = a.AirlineID
JOIN dbo.City c
	ON r.CityID = c.CityID
JOIN dbo.[State] s
	ON c.StateID = s.StateID
GO
/****** Object:  Table [dbo].[Combined_Flights]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combined_Flights](
	[FlightDate] [datetime] NULL,
	[Airline] [varchar](20) NULL,
	[Origin] [varchar](3) NULL,
	[Dest] [varchar](3) NULL,
	[Cancelled] [bit] NULL,
	[Diverted] [bit] NULL,
	[DepDelayMinutes] [real] NULL,
	[Month] [smallint] NULL,
	[DayofMonth] [smallint] NULL,
	[Flight_Number_Operating_Airline] [smallint] NULL,
	[OriginCityName] [varchar](32) NULL,
	[OriginState] [varchar](4) NULL,
	[OriginStateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightRaw]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightRaw](
	[FlightID] [int] IDENTITY(1,1) NOT NULL,
	[AirlineID] [int] NULL,
	[DepartureCity] [int] NULL,
	[ArrivalCity] [int] NULL,
	[FlightNum] [int] NULL,
	[FlightDate] [datetime] NULL,
	[FlightMonth] [smallint] NULL,
	[DayofMonth] [smallint] NULL,
	[IsCancelled] [bit] NULL,
	[IsDiverted] [bit] NULL,
	[DepDelayMinutes] [real] NULL,
 CONSTRAINT [PK_FlightRaw_FlightID] PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[FlightRaw]  WITH CHECK ADD FOREIGN KEY([AirlineID])
REFERENCES [dbo].[Airline] ([AirlineID])
GO
ALTER TABLE [dbo].[FlightRaw]  WITH CHECK ADD FOREIGN KEY([ArrivalCity])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[FlightRaw]  WITH CHECK ADD FOREIGN KEY([DepartureCity])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[FlightResult]  WITH CHECK ADD FOREIGN KEY([AirlineID])
REFERENCES [dbo].[Airline] ([AirlineID])
GO
ALTER TABLE [dbo].[FlightResult]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
/****** Object:  StoredProcedure [dbo].[DeleteFlight]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteFlight] (
	 @AirlineID INT
	,@DepartureCity INT
	,@ArrivalCity INT
	,@FlightNum INT
	,@FlightMonth INT
	,@FlightDayOfMonth INT
	,@IsCancelled BIT
	,@IsDiverted BIT
	,@DepDelayMinutes INT
	)
AS
BEGIN
	DELETE r
	FROM dbo.FlightRaw r
	WHERE 
		r.AirlineID = @AirlineID
		AND r.DepartureCity = @DepartureCity
		AND r.FlightNum = @FlightNum
		AND r.FlightMonth = @FlightMonth
		AND r.[DayOfMonth] = @FlightDayOfMonth;

	DELETE r
	FROM dbo.FlightResult r
	WHERE
		r.AirlineID = @AirlineID
		AND r.CityID = @DepartureCity
		AND r.FlightMonth = @FlightMonth
		AND r.FlightDayOfMonth = @FlightDayOfMonth;

	DELETE r
	FROM dbo.FlightResult r
	WHERE
		r.AirlineID = @AirlineID
		AND r.CityID = @DepartureCity
		AND r.FlightMonth = @FlightMonth
		AND r.FlightDayOfMonth = @FlightDayOfMonth;

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
	LEFT JOIN FlightResult r
		ON f.DepartureCity = r.CityID
		AND f.AirlineID = r.AirlineID
		AND f.FlightMonth = r.FlightMonth
		AND f.[DayOfMonth] = r.FlightDayOfMonth
	WHERE r.CityID = @DepartureCity
	AND r.AirlineID = @AirlineID
	AND r.FlightMonth = @FlightMonth
	AND r.FlightDayOfMonth = @FlightDayOfMonth
	GROUP BY 
		 f.DepartureCity
		,f.AirlineID
		,f.FlightMonth
		,f.[DayOfMonth]
		END
;
GO
/****** Object:  StoredProcedure [dbo].[InsertFlight]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFlight] (
	 @AirlineID INT
	,@DepartureCity INT
	,@ArrivalCity INT
	,@FlightNum INT
	,@FlightMonth INT
	,@FlightDayOfMonth INT
	,@IsCancelled BIT
	,@IsDiverted BIT
	,@DepDelayMinutes INT
	)
AS
BEGIN
	INSERT dbo.FlightRaw
		(
		 AirlineID
		,DepartureCity
		,ArrivalCity
		,FlightNum
		,FlightMonth
		,[DayOfMonth]
		,IsCancelled
		,IsDiverted
		,DepDelayMinutes
		)
	VALUES
		(
		 @AirlineID
		,@DepartureCity
		,@ArrivalCity
		,@FlightNum
		,@FlightMonth
		,@FlightDayOfMonth
		,@IsCancelled
		,@IsDiverted
		,@DepDelayMinutes
		)
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
	LEFT JOIN FlightResult r
		ON f.DepartureCity = r.CityID
		AND f.AirlineID = r.AirlineID
		AND f.FlightMonth = r.FlightMonth
		AND f.[DayOfMonth] = r.FlightDayOfMonth
	WHERE r.CityID IS NULL
	GROUP BY 
		 f.DepartureCity
		,f.AirlineID
		,f.FlightMonth
		,f.[DayOfMonth]
		END
;
GO
/****** Object:  StoredProcedure [dbo].[UpdateFlight]    Script Date: 7/8/2023 7:10:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFlight] (
	 @AirlineID INT
	,@DepartureCity INT
	,@ArrivalCity INT
	,@FlightNum INT
	,@FlightMonth INT
	,@FlightDayOfMonth INT
	,@IsCancelled BIT
	,@IsDiverted BIT
	,@DepDelayMinutes INT
	)
AS
BEGIN
	UPDATE r
	SET 
		 AirlineID = @AirlineID
		,DepartureCity = @DepartureCity
		,ArrivalCity = @ArrivalCity
		,FlightNum = @FlightNum
		,FlightMonth = @FlightMonth
		,[DayOfMonth] = @FlightDayOfMonth
		,IsCancelled = @IsCancelled
		,IsDiverted = @IsDiverted
		,DepDelayMinutes = @DepDelayMinutes
	FROM dbo.FlightRaw r
	WHERE 
		r.AirlineID = @AirlineID
		AND r.DepartureCity = @DepartureCity
		AND r.FlightNum = @FlightNum
		AND r.FlightMonth = @FlightMonth
		AND r.[DayOfMonth] = @FlightDayOfMonth;

	DELETE r
	FROM dbo.FlightResult r
	WHERE
		r.AirlineID = @AirlineID
		AND r.CityID = @DepartureCity
		AND r.FlightMonth = @FlightMonth
		AND r.FlightDayOfMonth = @FlightDayOfMonth;

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
	LEFT JOIN FlightResult r
		ON f.DepartureCity = r.CityID
		AND f.AirlineID = r.AirlineID
		AND f.FlightMonth = r.FlightMonth
		AND f.[DayOfMonth] = r.FlightDayOfMonth
	WHERE r.CityID = @DepartureCity
	AND r.AirlineID = @AirlineID
	AND r.FlightMonth = @FlightMonth
	AND r.FlightDayOfMonth = @FlightDayOfMonth
	GROUP BY 
		 f.DepartureCity
		,f.AirlineID
		,f.FlightMonth
		,f.[DayOfMonth]
		END
;
GO
USE [master]
GO
ALTER DATABASE [Group15] SET  READ_WRITE 
GO
