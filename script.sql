USE [master]
GO
/****** Object:  Database [qlshopxe]    Script Date: 11/8/2022 11:34:59 AM ******/
CREATE DATABASE [qlshopxe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qlshopxe', FILENAME = N'O:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\qlshopxe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'qlshopxe_log', FILENAME = N'O:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\qlshopxe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [qlshopxe] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qlshopxe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qlshopxe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qlshopxe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qlshopxe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qlshopxe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qlshopxe] SET ARITHABORT OFF 
GO
ALTER DATABASE [qlshopxe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [qlshopxe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qlshopxe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qlshopxe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qlshopxe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qlshopxe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qlshopxe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qlshopxe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qlshopxe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qlshopxe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [qlshopxe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qlshopxe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qlshopxe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qlshopxe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qlshopxe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qlshopxe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qlshopxe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qlshopxe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [qlshopxe] SET  MULTI_USER 
GO
ALTER DATABASE [qlshopxe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qlshopxe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qlshopxe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qlshopxe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [qlshopxe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [qlshopxe] SET QUERY_STORE = OFF
GO
USE [qlshopxe]
GO
/****** Object:  User [qlshopxe]    Script Date: 11/8/2022 11:34:59 AM ******/
CREATE USER [qlshopxe] FOR LOGIN [qlshopxe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ad]    Script Date: 11/8/2022 11:34:59 AM ******/
CREATE USER [ad] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [qlshopxe]
GO
ALTER ROLE [db_owner] ADD MEMBER [ad]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [ad]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ad]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ad]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [ad]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ad]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ad]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [ad]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [ad]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/8/2022 11:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [varchar](250) NULL,
	[pass] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hang]    Script Date: 11/8/2022 11:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 11/8/2022 11:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 11/8/2022 11:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](250) NULL,
	[gia] [money] NULL,
	[loai] [int] NULL,
	[hang] [int] NULL,
	[imgurl_1] [nvarchar](250) NULL,
	[imgurl_2] [nvarchar](250) NULL,
	[imgurl_3] [nvarchar](250) NULL,
	[imgurl_4] [nvarchar](250) NULL,
	[imgurl_5] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [ten], [pass]) VALUES (1, N'adminduy', N'3568')
INSERT [dbo].[admin] ([id], [ten], [pass]) VALUES (2, N'adminbao', N'3568')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[hang] ON 

INSERT [dbo].[hang] ([id], [ten]) VALUES (1, N'Honda')
SET IDENTITY_INSERT [dbo].[hang] OFF
GO
SET IDENTITY_INSERT [dbo].[loai] ON 

INSERT [dbo].[loai] ([id], [ten]) VALUES (1, N'xe tay ga')
SET IDENTITY_INSERT [dbo].[loai] OFF
GO
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (24, N'Air Blade xám', NULL, 1, 1, N'/imgxe/chitiet_ab01.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (25, N'Air Blade 2022 xám đen ', NULL, 1, 1, N'/imgxe/chitiet_ab01_2022.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (26, N'Air Blade đen', NULL, 1, 1, N'/imgxe/chitiet_ab02.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (27, N'Air Blade 2022 trắng đỏ ', NULL, 1, 1, N'/imgxe/chitiet_ab02_2022.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (28, N'Air Blade đỏ', NULL, 1, 1, N'/imgxe/chitiet_ab03.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (29, N'Air Blade đen nhám', NULL, 1, 1, N'/imgxe/chitiet_ab04_a.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (30, N'Air Blade trắng đen', NULL, 1, 1, N'/imgxe/chitiet_ab05.jpg', N'/imgxe/chitiet_ab_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (31, N'Vision trắng', NULL, 1, 1, N'/imgxe/chitiet_vs01.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (32, N'Vision đen', NULL, 1, 1, N'/imgxe/chitiet_vs02.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (33, N'Vision trắng đỏ', NULL, 1, 1, N'/imgxe/chitiet_vs03.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (34, N'Vision đỏ', NULL, 1, 1, N'/imgxe/chitiet_vs04.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (35, N'Vision xanh nâu', NULL, 1, 1, N'/imgxe/chitiet_vs05.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [ten], [gia], [loai], [hang], [imgurl_1], [imgurl_2], [imgurl_3], [imgurl_4], [imgurl_5]) VALUES (36, N'Vision xanh đen', NULL, 1, 1, N'/imgxe/chitiet_vs06.jpg', N'/imgxe/chitiet_vs_chung.jpg', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[sanpham] OFF
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD FOREIGN KEY([hang])
REFERENCES [dbo].[hang] ([id])
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD FOREIGN KEY([loai])
REFERENCES [dbo].[loai] ([id])
GO
USE [master]
GO
ALTER DATABASE [qlshopxe] SET  READ_WRITE 
GO
