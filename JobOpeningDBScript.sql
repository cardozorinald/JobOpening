USE [master]
GO
/****** Object:  Database [JobOpenings]    Script Date: 31-03-2023 02:04:52 ******/
CREATE DATABASE [JobOpenings]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobOpenings', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JobOpenings.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JobOpenings_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JobOpenings_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JobOpenings] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobOpenings].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobOpenings] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobOpenings] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobOpenings] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobOpenings] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobOpenings] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobOpenings] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [JobOpenings] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobOpenings] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobOpenings] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobOpenings] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobOpenings] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobOpenings] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobOpenings] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobOpenings] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobOpenings] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JobOpenings] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobOpenings] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobOpenings] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobOpenings] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobOpenings] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobOpenings] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [JobOpenings] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobOpenings] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JobOpenings] SET  MULTI_USER 
GO
ALTER DATABASE [JobOpenings] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobOpenings] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobOpenings] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobOpenings] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobOpenings] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JobOpenings] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [JobOpenings] SET QUERY_STORE = OFF
GO
USE [JobOpenings]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 31-03-2023 02:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 31-03-2023 02:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 31-03-2023 02:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PostedDate] [datetime2](7) NOT NULL,
	[ClosingDate] [datetime2](7) NOT NULL,
	[LocationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 31-03-2023 02:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230329185321_InitialCommit', N'7.0.4')
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Title]) VALUES (1, N'Software Development')
INSERT [dbo].[Departments] ([Id], [Title]) VALUES (2, N'Mobile Development')
INSERT [dbo].[Departments] ([Id], [Title]) VALUES (3, N'QA')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (2, N'QA', N'QA', CAST(N'2023-03-29T19:41:17.2020000' AS DateTime2), CAST(N'2023-03-29T19:41:17.2020000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (4, N'QA', N'QA', CAST(N'2023-03-30T14:10:40.2340000' AS DateTime2), CAST(N'2023-03-30T14:10:40.2340000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (6, N'QA', N'QA', CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (7, N'Software Developer', N'Software Developer', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-30T13:16:18.0050000' AS DateTime2), 1, 2)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (8, N'QA', N'QA', CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (9, N'QA', N'QA', CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (10, N'QA', N'QA', CAST(N'2023-03-30T15:45:36.7200000' AS DateTime2), CAST(N'2023-03-30T15:45:36.7200000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (11, N'QA', N'QA', CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (12, N'QA', N'QA', CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (13, N'QA', N'QA', CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), CAST(N'2023-03-30T14:23:38.0940000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (14, N'Software Developer', N'Software Developer', CAST(N'2023-03-30T17:59:22.7488386' AS DateTime2), CAST(N'2023-03-30T17:58:14.7090000' AS DateTime2), 2, 2)
INSERT [dbo].[Jobs] ([Id], [Title], [Description], [PostedDate], [ClosingDate], [LocationId], [DepartmentId]) VALUES (15, N'Software Developer', N'Software Developer', CAST(N'2023-03-30T19:16:02.3502458' AS DateTime2), CAST(N'2023-03-30T19:15:43.4850000' AS DateTime2), 2, 2)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [Title], [Country], [State], [City], [Zip]) VALUES (1, N'US Head Office', N'United States', N'MD', N'Baltimore', N'21202')
INSERT [dbo].[Locations] ([Id], [Title], [Country], [State], [City], [Zip]) VALUES (2, N'India Office', N'India', N'Goa', N'Verna', N'400200')
INSERT [dbo].[Locations] ([Id], [Title], [Country], [State], [City], [Zip]) VALUES (3, N'India Head Office', N'India', N'Goa', N'Margao', N'400222')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
/****** Object:  Index [IX_Jobs_DepartmentId]    Script Date: 31-03-2023 02:04:52 ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_DepartmentId] ON [dbo].[Jobs]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_LocationId]    Script Date: 31-03-2023 02:04:52 ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_LocationId] ON [dbo].[Jobs]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Locations_LocationId]
GO
USE [master]
GO
ALTER DATABASE [JobOpenings] SET  READ_WRITE 
GO
