USE [master]
GO
/****** Object:  Database [PropertyRentalManagement]    Script Date: 12/7/2023 10:22:06 AM ******/
CREATE DATABASE [PropertyRentalManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyRentalManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019EXPRESS\MSSQL\DATA\PropertyRentalManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyRentalManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019EXPRESS\MSSQL\DATA\PropertyRentalManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PropertyRentalManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyRentalManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyRentalManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyRentalManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyRentalManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyRentalManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyRentalManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PropertyRentalManagement] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyRentalManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyRentalManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyRentalManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyRentalManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PropertyRentalManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PropertyRentalManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PropertyRentalManagement] SET QUERY_STORE = OFF
GO
USE [PropertyRentalManagement]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[ApartmentID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NULL,
	[StatusID] [int] NULL,
	[UnitNumber] [int] NULL,
	[Area] [float] NULL,
	[NumberOfRooms] [int] NULL,
	[Rent] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NULL,
	[ManagerID] [int] NULL,
	[AppointmentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](70) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](5) NULL,
	[ZipCode] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[ManagerID] [int] NULL,
	[TenantID] [int] NULL,
	[MessageBody] [varchar](200) NULL,
	[DateSent] [date] NULL,
	[Sender] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyManagers]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyManagers](
	[ManagerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BuildingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyOwners]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyOwners](
	[OwnerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BuildingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerID] [int] NULL,
	[ManagerID] [int] NULL,
	[ReportBody] [varchar](200) NULL,
	[DateSent] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[TenantID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[UserType] [int] NULL,
 CONSTRAINT [PK__Users__1788CCAC44E7B736] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/7/2023 10:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeDescription] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apartments] ON 

INSERT [dbo].[Apartments] ([ApartmentID], [BuildingID], [StatusID], [UnitNumber], [Area], [NumberOfRooms], [Rent]) VALUES (1, 1, 1, 902, 56, 1, 1200)
INSERT [dbo].[Apartments] ([ApartmentID], [BuildingID], [StatusID], [UnitNumber], [Area], [NumberOfRooms], [Rent]) VALUES (3, 2, 1, 612, 63, 3, 1800)
INSERT [dbo].[Apartments] ([ApartmentID], [BuildingID], [StatusID], [UnitNumber], [Area], [NumberOfRooms], [Rent]) VALUES (4, 4, 2, 212, 99, 4, 2150)
INSERT [dbo].[Apartments] ([ApartmentID], [BuildingID], [StatusID], [UnitNumber], [Area], [NumberOfRooms], [Rent]) VALUES (5, 3, 1, 2104, 42, 0, 975)
INSERT [dbo].[Apartments] ([ApartmentID], [BuildingID], [StatusID], [UnitNumber], [Area], [NumberOfRooms], [Rent]) VALUES (6, 2, 2, 502, 32, 0, 900)
SET IDENTITY_INSERT [dbo].[Apartments] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [TenantID], [ManagerID], [AppointmentDate]) VALUES (4, 3, 3, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [TenantID], [ManagerID], [AppointmentDate]) VALUES (5, 4, 4, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [TenantID], [ManagerID], [AppointmentDate]) VALUES (6, 5, 3, CAST(N'2023-12-05' AS Date))
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([BuildingID], [Address], [City], [State], [ZipCode]) VALUES (1, N'4530 Ch De La Côte-Des-Neiges', N'Montréal', N'QC', N'H3V1G1')
INSERT [dbo].[Buildings] ([BuildingID], [Address], [City], [State], [ZipCode]) VALUES (2, N'65 Sherbrooke East', N'Montréal', N'QC', N'H2X1C4')
INSERT [dbo].[Buildings] ([BuildingID], [Address], [City], [State], [ZipCode]) VALUES (3, N'3665 Porier Blvd', N'Montreal', N'QC', N'H1C2G4')
INSERT [dbo].[Buildings] ([BuildingID], [Address], [City], [State], [ZipCode]) VALUES (4, N'2000 St-Catherine East', N'Montreal', N'QC', N'H5T1A2')
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MessageID], [ManagerID], [TenantID], [MessageBody], [DateSent], [Sender]) VALUES (3, 3, 3, N'Hi How are you?', CAST(N'2023-12-04' AS Date), N'alinajafian@gmail.com')
INSERT [dbo].[Messages] ([MessageID], [ManagerID], [TenantID], [MessageBody], [DateSent], [Sender]) VALUES (4, 4, 4, N'Are you available today?', CAST(N'2023-12-04' AS Date), N'melikasr@gmail.com')
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyManagers] ON 

INSERT [dbo].[PropertyManagers] ([ManagerID], [UserID], [BuildingID]) VALUES (3, 2, 1)
INSERT [dbo].[PropertyManagers] ([ManagerID], [UserID], [BuildingID]) VALUES (4, 7, 3)
SET IDENTITY_INSERT [dbo].[PropertyManagers] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyOwners] ON 

INSERT [dbo].[PropertyOwners] ([OwnerID], [UserID], [BuildingID]) VALUES (2, 1, 1)
SET IDENTITY_INSERT [dbo].[PropertyOwners] OFF
GO
SET IDENTITY_INSERT [dbo].[Reports] ON 

INSERT [dbo].[Reports] ([ReportID], [OwnerID], [ManagerID], [ReportBody], [DateSent]) VALUES (4, 2, 3, N'Pipe is broken', CAST(N'2023-12-03' AS Date))
INSERT [dbo].[Reports] ([ReportID], [OwnerID], [ManagerID], [ReportBody], [DateSent]) VALUES (5, 2, 4, N'Broken  fridge', CAST(N'2023-12-04' AS Date))
INSERT [dbo].[Reports] ([ReportID], [OwnerID], [ManagerID], [ReportBody], [DateSent]) VALUES (6, 2, 4, N'Painting the wall', CAST(N'2023-12-03' AS Date))
SET IDENTITY_INSERT [dbo].[Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([StatusID], [Description]) VALUES (1, N'Free')
INSERT [dbo].[Statuses] ([StatusID], [Description]) VALUES (2, N'Occupied')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Tenants] ON 

INSERT [dbo].[Tenants] ([TenantID], [UserID]) VALUES (3, 3)
INSERT [dbo].[Tenants] ([TenantID], [UserID]) VALUES (4, 6)
INSERT [dbo].[Tenants] ([TenantID], [UserID]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[Tenants] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [FirstName], [LastName], [Email], [UserType]) VALUES (1, N'owner', N'/3wfNbm2r/W5JgfYhsrxY2f+ZDtnZUpisu4jsgC/uEE=', N'Mohammad', N'Safaeirad', N'm.safaei81@hotmail.com', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FirstName], [LastName], [Email], [UserType]) VALUES (2, N'manager', N'k2bHU5z2oNhQ2adxKuwY1jo37Sv7OdpD1AJDRNk7PZc=', N'Ali', N'Najafian', N'alinajafian@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FirstName], [LastName], [Email], [UserType]) VALUES (3, N'tenant', N'9heLggJZo+pRoGpbKrkNp79i+pjsMG4d+17VEi1s+ck=', N'Arvin', N'Sahami', N'arvinsahami@gmail.com', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FirstName], [LastName], [Email], [UserType]) VALUES (5, N'testuser', N'3zefpF3DZlfc5tCJ1GlMw5wUT6QGuEIVsfoeUfHlBBg=', N'Ling', N'He', N'wei@gmail.com', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FirstName], [LastName], [Email], [UserType]) VALUES (6, N'melikasr', N'2EUkNcF1YJue6PgSWhnB+SsAZsmvqF/wZYmTRhUNjYg=', N'Melika', N'Safaeirad', N'melikasr@gmail.com', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FirstName], [LastName], [Email], [UserType]) VALUES (7, N'azitab', N'QtJeMeLN1CO1hINEqSz0LO/NldE9NF/PDvvOPGGFTTg=', N'Azita', N'Biabangard', N'azitab@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([UserTypeID], [UserTypeDescription]) VALUES (1, N'Owner')
INSERT [dbo].[UserTypes] ([UserTypeID], [UserTypeDescription]) VALUES (2, N'Manager')
INSERT [dbo].[UserTypes] ([UserTypeID], [UserTypeDescription]) VALUES (3, N'Tenant')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentBuilding] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([BuildingID])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_ApartmentBuilding]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_ApartmentStatus]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentManager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[PropertyManagers] ([ManagerID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_AppointmentManager]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentTenant] FOREIGN KEY([TenantID])
REFERENCES [dbo].[Tenants] ([TenantID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_AppointmentTenant]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_MessageManager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[PropertyManagers] ([ManagerID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_MessageManager]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_MessageTenant] FOREIGN KEY([TenantID])
REFERENCES [dbo].[Tenants] ([TenantID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_MessageTenant]
GO
ALTER TABLE [dbo].[PropertyManagers]  WITH CHECK ADD  CONSTRAINT [FK_ManagerBuilding] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([BuildingID])
GO
ALTER TABLE [dbo].[PropertyManagers] CHECK CONSTRAINT [FK_ManagerBuilding]
GO
ALTER TABLE [dbo].[PropertyManagers]  WITH CHECK ADD  CONSTRAINT [FK_ManagerUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropertyManagers] CHECK CONSTRAINT [FK_ManagerUser]
GO
ALTER TABLE [dbo].[PropertyOwners]  WITH CHECK ADD  CONSTRAINT [FK_OwnerBuilding] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([BuildingID])
GO
ALTER TABLE [dbo].[PropertyOwners] CHECK CONSTRAINT [FK_OwnerBuilding]
GO
ALTER TABLE [dbo].[PropertyOwners]  WITH CHECK ADD  CONSTRAINT [FK_OwnerUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropertyOwners] CHECK CONSTRAINT [FK_OwnerUser]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_ReportManager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[PropertyManagers] ([ManagerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_ReportManager]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_ReportOwner] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[PropertyOwners] ([OwnerID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_ReportOwner]
GO
ALTER TABLE [dbo].[Tenants]  WITH CHECK ADD  CONSTRAINT [FK_TenantUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tenants] CHECK CONSTRAINT [FK_TenantUser]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_UserType] FOREIGN KEY([UserType])
REFERENCES [dbo].[UserTypes] ([UserTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_UserType]
GO
USE [master]
GO
ALTER DATABASE [PropertyRentalManagement] SET  READ_WRITE 
GO
