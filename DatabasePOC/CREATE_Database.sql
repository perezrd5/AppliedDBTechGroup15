USE [master]
GO
/****** Object:  Database [Group15]    Script Date: 6/24/2023 9:38:59 AM ******/
CREATE DATABASE [Group15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Group15', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Group15.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Group15_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Log\Group15_log.ldf' , SIZE = 532480KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Airline]    Script Date: 6/24/2023 9:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline](
	[AirlineID] [int] IDENTITY(1,1) NOT NULL,
	[AirlineName] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 6/24/2023 9:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[AirportCode] [varchar](4) NULL,
	[City] [varchar](100) NULL,
	[StateID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combined_Flights_2018]    Script Date: 6/24/2023 9:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combined_Flights_2018](
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
/****** Object:  Table [dbo].[FlightRaw]    Script Date: 6/24/2023 9:38:59 AM ******/
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
	[DepDelayMinutes] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightResult]    Script Date: 6/24/2023 9:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightResult](
	[FlightResultID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NULL,
	[AirlineID] [int] NULL,
	[FlightMonth] [int] NULL,
	[FlightDayOfMonth] [int] NULL,
	[PercentDelayed] [numeric](10, 3) NULL,
	[PercentCancelled] [numeric](10, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 6/24/2023 9:38:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [varchar](2) NULL,
	[StateName] [varchar](100) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Group15] SET  READ_WRITE 
GO
