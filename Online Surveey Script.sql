USE [master]
GO
/****** Object:  Database [OnlineSurvey]    Script Date: 21-07-2020 06:23:20 ******/
CREATE DATABASE [OnlineSurvey]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineSurvey', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineSurvey.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineSurvey_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineSurvey_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineSurvey] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineSurvey].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineSurvey] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineSurvey] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineSurvey] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineSurvey] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineSurvey] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineSurvey] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineSurvey] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineSurvey] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineSurvey] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineSurvey] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineSurvey] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineSurvey] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineSurvey] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineSurvey] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineSurvey] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineSurvey] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineSurvey] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineSurvey] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineSurvey] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineSurvey] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineSurvey] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineSurvey] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineSurvey] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineSurvey] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineSurvey] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineSurvey] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineSurvey] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineSurvey] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineSurvey] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineSurvey', N'ON'
GO
ALTER DATABASE [OnlineSurvey] SET QUERY_STORE = OFF
GO
USE [OnlineSurvey]
GO
/****** Object:  UserDefinedTableType [dbo].[TySurveyEducation]    Script Date: 21-07-2020 06:23:21 ******/
CREATE TYPE [dbo].[TySurveyEducation] AS TABLE(
	[EducationId] [int] NULL
)
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 21-07-2020 06:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEducation]    Script Date: 21-07-2020 06:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEducation](
	[EducationId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](30) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblEducation] PRIMARY KEY CLUSTERED 
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSurveyDetails]    Script Date: 21-07-2020 06:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSurveyDetails](
	[SurveyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Age] [int] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [nvarchar](250) NULL,
	[CityId] [int] NULL,
	[Resume] [nvarchar](250) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblSurveyDetails] PRIMARY KEY CLUSTERED 
(
	[SurveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSurveyEducation]    Script Date: 21-07-2020 06:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSurveyEducation](
	[SurveyId] [int] NULL,
	[EducationId] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCity] ON 
GO
INSERT [dbo].[tblCity] ([CityId], [CityName], [CreatedOn]) VALUES (1, N'Delhi', CAST(N'2020-07-21T16:43:14.990' AS DateTime))
GO
INSERT [dbo].[tblCity] ([CityId], [CityName], [CreatedOn]) VALUES (2, N'Gurgaon', CAST(N'2020-07-21T16:43:14.990' AS DateTime))
GO
INSERT [dbo].[tblCity] ([CityId], [CityName], [CreatedOn]) VALUES (3, N'Noida', CAST(N'2020-07-21T16:43:14.990' AS DateTime))
GO
INSERT [dbo].[tblCity] ([CityId], [CityName], [CreatedOn]) VALUES (4, N'Chandigarh', CAST(N'2020-07-21T16:43:14.990' AS DateTime))
GO
INSERT [dbo].[tblCity] ([CityId], [CityName], [CreatedOn]) VALUES (5, N'Punjab', CAST(N'2020-07-21T16:43:14.990' AS DateTime))
GO
INSERT [dbo].[tblCity] ([CityId], [CityName], [CreatedOn]) VALUES (6, N'Rajasthan', CAST(N'2020-07-21T16:43:14.990' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblCity] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEducation] ON 
GO
INSERT [dbo].[tblEducation] ([EducationId], [Title], [CreatedOn]) VALUES (1, N'10th', CAST(N'2020-07-21T16:05:03.173' AS DateTime))
GO
INSERT [dbo].[tblEducation] ([EducationId], [Title], [CreatedOn]) VALUES (2, N'12th', CAST(N'2020-07-21T16:05:03.173' AS DateTime))
GO
INSERT [dbo].[tblEducation] ([EducationId], [Title], [CreatedOn]) VALUES (3, N'Degree', CAST(N'2020-07-21T16:05:03.173' AS DateTime))
GO
INSERT [dbo].[tblEducation] ([EducationId], [Title], [CreatedOn]) VALUES (4, N'Masters', CAST(N'2020-07-21T16:05:03.173' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblEducation] OFF
GO
/****** Object:  StoredProcedure [dbo].[GetAllSurveys]    Script Date: 21-07-2020 06:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec GetAllSurveys
CREATE Proc [dbo].[GetAllSurveys]
as
begin
	select s.SurveyId, s.Name, s.Age, s.Gender, s.Email, isnull(c.CityName, 'Other') CityName, s.Resume, 
	ISNULL(STUFF((SELECT ', ' + Replace(ed.Title, ' ', '-')
	FROM tblSurveyEducation e left outer join tblEducation ed ON e.EducationId = ed.EducationId
	WHERE s.SurveyId = e.SurveyId
	FOR XML PATH('')
	), 1, 1, ''), 'Not Applied') AS Education, Convert(varchar, s.CreatedOn, 6) CreatedOn
	from tblSurveyDetails s left outer join tblCity c on s.CityId=c.CityId
end
GO
/****** Object:  StoredProcedure [dbo].[InsertSurveyDetails]    Script Date: 21-07-2020 06:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertSurveyDetails]
@Name varchar(150),
@Age int,
@Gender varchar(10),
@Email varchar(250),
@City int,
@Resume varchar(250),
@Education TySurveyEducation readonly
as
begin
	Declare @NewId int
	INSERT INTO [dbo].[tblSurveyDetails] ([Name],[Age],[Gender],[Email],[CityId],[Resume],[CreatedOn]) VALUES  
										(@Name,@Age,@Gender,@Email,@City,@Resume,GETDATE())
	set @NewId= SCOPE_IDENTITY()
	insert into tblSurveyEducation  select @NewId, EducationId from @Education
	select @NewId [NewId]
end
GO
USE [master]
GO
ALTER DATABASE [OnlineSurvey] SET  READ_WRITE 
GO
