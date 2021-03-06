USE [master]
GO
/****** Object:  Database [DemoApp]    Script Date: 15-02-2022 22:15:48 ******/
CREATE DATABASE [DemoApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DemoApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoApp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DemoApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoApp] SET RECOVERY FULL 
GO
ALTER DATABASE [DemoApp] SET  MULTI_USER 
GO
ALTER DATABASE [DemoApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DemoApp', N'ON'
GO
ALTER DATABASE [DemoApp] SET QUERY_STORE = OFF
GO
USE [DemoApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15-02-2022 22:15:48 ******/
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
/****** Object:  Table [dbo].[Agreements]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agreements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[ProductGroupId] [int] NULL,
	[ProductId] [int] NULL,
	[EffectiveDate] [datetime2](7) NOT NULL,
	[ExpirationDate] [datetime2](7) NOT NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[NewPrice] [decimal](18, 2) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Agreements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroups]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupDescription] [nvarchar](max) NULL,
	[GroupCode] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15-02-2022 22:15:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductGroupId] [int] NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductNumber] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220215050731_initial-create', N'5.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220215052311_Add-SampleTables', N'5.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220215063939_Alter-User-Table', N'5.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220215093204_alter_column_name_in_ProductGroups', N'5.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220215131112_alter_column_name_in_Agreement', N'5.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220215140531_add_new_column_in_agreement', N'5.0.14')
GO
SET IDENTITY_INSERT [dbo].[Agreements] ON 

INSERT [dbo].[Agreements] ([Id], [UserId], [ProductGroupId], [ProductId], [EffectiveDate], [ExpirationDate], [ProductPrice], [NewPrice], [Active]) VALUES (3, N'c16cf4d1-1bab-4996-8639-04d3c41abba5', 4, 4, CAST(N'2022-02-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-27T00:00:00.0000000' AS DateTime2), CAST(1000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Agreements] ([Id], [UserId], [ProductGroupId], [ProductId], [EffectiveDate], [ExpirationDate], [ProductPrice], [NewPrice], [Active]) VALUES (5, N'c16cf4d1-1bab-4996-8639-04d3c41abba5', 1, 6, CAST(N'2022-02-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-26T00:00:00.0000000' AS DateTime2), CAST(600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Agreements] ([Id], [UserId], [ProductGroupId], [ProductId], [EffectiveDate], [ExpirationDate], [ProductPrice], [NewPrice], [Active]) VALUES (6, N'c16cf4d1-1bab-4996-8639-04d3c41abba5', 2, 3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Agreements] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Active]) VALUES (N'a4a9509b-5ad4-4d85-ab7c-8d73b0658286', N'John', N'Cross', N'jc@gmail.com', N'JC@GMAIL.COM', N'jc@gmail.com', N'JC@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDypNfDlUaVB8pheqZQIJuNb/9waZP25edaQnvfNkvVKG7ecmOz8JhucmvZIT+jqFg==', N'ZPHMILNCIKBMZ2EBFJRL6KGILKOJN54J', N'6d0ad28f-810f-455f-9281-dc2323d5d9eb', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Active]) VALUES (N'a5f262b9-f2d7-444c-8e6b-6eef59be3059', N'New', N'User', N'user@gmail.com', N'USER@GMAIL.COM', N'user@gmail.com', N'USER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHSlO0S6vUQqH/TD+oBJYG8trGjW8mwvzwuUfzQ5eHIPiYtidUrSmWCGuQYyBQYbVw==', N'KCVVODNC4J6UCXM3CUTKZGBJWPI2OAQS', N'a7ca8e22-ac6a-4856-aa8f-ecd9e40a941b', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Active]) VALUES (N'aee1cbbf-4233-4394-b649-a6779b164b14', N'Pawan', N'Kumar', N'pk@mailinator.com', N'PK@MAILINATOR.COM', N'pk@mailinator.com', N'PK@MAILINATOR.COM', 0, N'AQAAAAEAACcQAAAAEPz6wWRZMcv8fvncROymLTczhLR3izjY8s4XhATGhEObFnd+LdCSaMXLhLIX+tRq3Q==', N'HERFWTBQNJGN4K2KBJLTYSL6CKFMHUNN', N'f85b4586-3d62-4bd4-b6ba-342a80178f9a', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Active]) VALUES (N'b71a5929-4384-4fb8-aad4-ea324b800895', N'Shashi', N'Bhushan', N'sb@mailinator.com', N'SB@MAILINATOR.COM', N'sb@mailinator.com', N'SB@MAILINATOR.COM', 0, N'AQAAAAEAACcQAAAAEE1cA2Vzo4MepgwQ5UcqQqgmzWQ9p6Nps+zS7AROnRSLtYAPR9P6n1LKPRARMi9aZg==', N'H2DN4FDPGMWZYVU5W7LC24T4G4HLTZAI', N'97fed573-234c-4fe9-a602-4f4c8017c06b', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Active]) VALUES (N'bbfb5e79-f160-402d-9ab0-52ff6d083b2b', N'Shubham', N'Rana', N'srana@mailinator.com', N'SRANA@MAILINATOR.COM', N'srana@mailinator.com', N'SRANA@MAILINATOR.COM', 0, N'AQAAAAEAACcQAAAAEM6dqcDUpdlNg7e6pZgyXx6yQuWwoEGVM3HkrR2ycXLh+cPQnk+Hu4eL1vN9k+aX9w==', N'KOWVFBJYPQVC42WBKYMC5NVPGHFBAIPL', N'9fac7056-8b6d-4088-85c0-dc0904868bd5', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Active]) VALUES (N'c16cf4d1-1bab-4996-8639-04d3c41abba5', N'Admin', N'User', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDsGwKFoorgGdeWNt0DBMVH+Q5U1b/VidEi8WEUESb3GxWEabPfZqT3mwYxXJHZ9JQ==', N'NLBUCIYU7QYDYIK3FKSUFSIJJCYUN76U', N'f72c22eb-c40d-468d-88d5-2af1bf9b142e', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Active]) VALUES (N'e668d22a-f140-4797-9066-c320430667a9', N'Mr', N'X', N'x@mailinator.com', N'X@MAILINATOR.COM', N'x@mailinator.com', N'X@MAILINATOR.COM', 0, N'AQAAAAEAACcQAAAAEB5ftCv5aCiqmn96RprxzpfB3uwz5IlqiBNrb01VEsVRfsFmQEPA62ZuKoJ7aPgKEw==', N'B2BF3SJCBGS7KTOTSHXTJ7JUGD7PWXPN', N'6f02b36e-fe14-44fd-8edd-f706bdd016e8', NULL, 0, 0, NULL, 1, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[ProductGroups] ON 

INSERT [dbo].[ProductGroups] ([Id], [GroupDescription], [GroupCode], [Active]) VALUES (1, N'Group1', N'G1', 1)
INSERT [dbo].[ProductGroups] ([Id], [GroupDescription], [GroupCode], [Active]) VALUES (2, N'Group2', N'G2', 1)
INSERT [dbo].[ProductGroups] ([Id], [GroupDescription], [GroupCode], [Active]) VALUES (3, N'Group3', N'G3', 1)
INSERT [dbo].[ProductGroups] ([Id], [GroupDescription], [GroupCode], [Active]) VALUES (4, N'Group4', N'G4', 1)
SET IDENTITY_INSERT [dbo].[ProductGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductGroupId], [ProductDescription], [ProductNumber], [Price], [Active]) VALUES (1, 1, N'Product 1', N'P-1', CAST(100.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [ProductGroupId], [ProductDescription], [ProductNumber], [Price], [Active]) VALUES (2, 1, N'Product 2', N'P-2', CAST(300.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [ProductGroupId], [ProductDescription], [ProductNumber], [Price], [Active]) VALUES (3, 2, N'Product 3', N'P-3', CAST(400.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [ProductGroupId], [ProductDescription], [ProductNumber], [Price], [Active]) VALUES (4, 2, N'Product 4', N'P-4', CAST(500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [ProductGroupId], [ProductDescription], [ProductNumber], [Price], [Active]) VALUES (5, 3, N'Product 5', N'P-5', CAST(500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [ProductGroupId], [ProductDescription], [ProductNumber], [Price], [Active]) VALUES (6, 3, N'Product 6', N'P-6', CAST(700.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_Agreements_ProductGroupId]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [IX_Agreements_ProductGroupId] ON [dbo].[Agreements]
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Agreements_ProductId]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [IX_Agreements_ProductId] ON [dbo].[Agreements]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Agreements_UserId]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [IX_Agreements_UserId] ON [dbo].[Agreements]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 15-02-2022 22:15:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 15-02-2022 22:15:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductGroupId]    Script Date: 15-02-2022 22:15:49 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductGroupId] ON [dbo].[Products]
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Agreements] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Active]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Active]
GO
ALTER TABLE [dbo].[Agreements]  WITH CHECK ADD  CONSTRAINT [FK_Agreements_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Agreements] CHECK CONSTRAINT [FK_Agreements_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Agreements]  WITH CHECK ADD  CONSTRAINT [FK_Agreements_ProductGroups_ProductGroupId] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroups] ([Id])
GO
ALTER TABLE [dbo].[Agreements] CHECK CONSTRAINT [FK_Agreements_ProductGroups_ProductGroupId]
GO
ALTER TABLE [dbo].[Agreements]  WITH CHECK ADD  CONSTRAINT [FK_Agreements_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Agreements] CHECK CONSTRAINT [FK_Agreements_Products_ProductId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductGroups_ProductGroupId] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroups] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductGroups_ProductGroupId]
GO
USE [master]
GO
ALTER DATABASE [DemoApp] SET  READ_WRITE 
GO
