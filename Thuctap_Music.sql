USE [master]
GO
/****** Object:  Database [Thuctap_Music]    Script Date: 3/17/2018 9:27:04 PM ******/
CREATE DATABASE [Thuctap_Music]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Thuctap_Music', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Thuctap_Music.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Thuctap_Music_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Thuctap_Music_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Thuctap_Music] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Thuctap_Music].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Thuctap_Music] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Thuctap_Music] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Thuctap_Music] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Thuctap_Music] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Thuctap_Music] SET ARITHABORT OFF 
GO
ALTER DATABASE [Thuctap_Music] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Thuctap_Music] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Thuctap_Music] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Thuctap_Music] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Thuctap_Music] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Thuctap_Music] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Thuctap_Music] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Thuctap_Music] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Thuctap_Music] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Thuctap_Music] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Thuctap_Music] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Thuctap_Music] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Thuctap_Music] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Thuctap_Music] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Thuctap_Music] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Thuctap_Music] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Thuctap_Music] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Thuctap_Music] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Thuctap_Music] SET  MULTI_USER 
GO
ALTER DATABASE [Thuctap_Music] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Thuctap_Music] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Thuctap_Music] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Thuctap_Music] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Thuctap_Music] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Thuctap_Music]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 3/17/2018 9:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Price] [float] NULL,
	[AlbumUrl] [text] NULL,
	[Genre_ID] [int] NULL,
	[Artist_ID] [int] NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Artist]    Script Date: 3/17/2018 9:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 3/17/2018 9:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](150) NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdeDetal]    Script Date: 3/17/2018 9:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdeDetal](
	[OrderDetailIID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NULL,
	[Album_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Total_OD] [float] NULL,
 CONSTRAINT [PK_OrdeDetal] PRIMARY KEY CLUSTERED 
(
	[OrderDetailIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/17/2018 9:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 3/17/2018 9:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [text] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (1, N'Bertie Mellings', 100, NULL, 1, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (2, N'Kile Scrafton', 11, NULL, 8, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (3, N'Leopold Gramer', 22, NULL, 9, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (4, N'Reinaldos Griston', 55, NULL, 8, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (5, N'Glyn Shiliton', 66, NULL, 10, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (6, N'Quincy Gounard', 77, NULL, 3, 7)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (7, N'Fayre Arnke', 88, NULL, 9, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (8, N'Allix Pyke', 999, NULL, 2, 10)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (9, N'Penelope Teresa', 77, NULL, 9, 1)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (10, N'Rosene Rablen', 66, NULL, 6, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (11, N'Darlleen Haddington', 55, NULL, 4, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (12, N'Brendin Peascod', 44, NULL, 10, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (13, N'Asa Willoughby', 33, NULL, 4, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (14, N'Merrili Ciobutaro', 44, NULL, 9, 7)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (15, N'Trisha Orridge', 55, NULL, 8, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (16, N'Nollie Manolov', 66, NULL, 6, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (17, N'Ayn Vergine', 77, NULL, 3, 5)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (18, N'Gannie Belt', 88, NULL, 6, 1)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (19, N'Berkly Dunkirk', 88, NULL, 1, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (20, N'Mortie Frise', 100, NULL, 9, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (21, N'Crawford Andreia', 66, NULL, 5, 10)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (22, N'Ronalda Spuner', 44, NULL, 2, 10)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (23, N'Luis Buffery', 55, NULL, 3, 10)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (24, N'Tam Pietrasik', 6, NULL, 7, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (25, N'Jennica Schorah', 67, NULL, 3, 10)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (26, N'Catriona Fealey', 76, NULL, 7, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (27, N'Erek Styche', 44, NULL, 1, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (28, N'Barbara-anne Shuxsmith', 3, NULL, 4, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (29, N'Nikolaos Scougall', 23, NULL, 2, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (30, N'Marius Putley', 4, NULL, 4, 10)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (31, N'Xylia Parmby', 4, NULL, 5, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (32, N'Liva Lindmark', 676, NULL, 6, 7)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (33, N'Cindy Friedman', 7, NULL, 9, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (34, N'Adelbert Igonet', 7, NULL, 9, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (35, N'Erinna Lewin', 6, NULL, 1, 1)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (36, N'Vanya Brace', 65, NULL, 10, 1)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (37, N'Maxie Sandy', 4, NULL, 8, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (38, N'Gavra MacWilliam', 33, NULL, 7, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (39, N'Ashleigh Lassells', 1, NULL, 10, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (40, N'Halsy Mulrenan', 23, NULL, 2, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (41, N'Briney Finlay', 4, NULL, 10, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (42, N'Nappie Angeau', 5, NULL, 8, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (43, N'Gale Pitrasso', 67, NULL, 5, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (44, N'Mil Yarnton', 8, NULL, 7, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (45, N'Robena Chazette', 7, NULL, 5, 10)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (46, N'Indira Youde', 8, NULL, 2, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (47, N'Chloe Burgott', 8, NULL, 3, 5)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (48, N'Ricardo Davidovich', 100, NULL, 4, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (49, N'Everard Piscopo', 5, NULL, 2, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (50, N'Nanette Tolchar', 4, NULL, 3, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (51, N'Storm Morphey', 3232, NULL, 10, 5)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (52, N'Sheri Stolli', 100, NULL, 9, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (53, N'Merry Garment', 323, NULL, 4, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (54, N'Mureil Gowdy', 4, NULL, 1, 5)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (55, N'Evelin Cuseick', 5, NULL, 1, 7)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (56, N'Antin Ren', 57, NULL, 4, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (57, N'Barnard Biggadike', 8, NULL, 5, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (58, N'Bendite Birbeck', 99, NULL, 4, 7)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (59, N'Faydra Stirman', 7, NULL, 7, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (60, N'Fraser Heaseman', 4, NULL, 2, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (61, N'Bourke Edworthie', 6, NULL, 7, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (62, N'Frederigo Hickin', 100, NULL, 10, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (63, N'Lorin Janaway', 7, NULL, 8, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (64, N'Clarine Hayhoe', 89, NULL, 9, 10)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (65, N'Yasmeen Slark', 90, NULL, 1, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (66, N'Gweneth O''Docherty', 0, NULL, 8, 1)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (67, N'Fanchette Klejna', 8, NULL, 4, 7)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (68, N'Pincus Quadri', 9, NULL, 2, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (69, N'Levi Sivewright', 87, NULL, 2, 5)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (70, N'Betti Tomanek', 66, NULL, 10, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (71, N'Charleen Siene', 43, NULL, 4, 1)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (72, N'Flem Rustadge', 100, NULL, 7, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (73, N'Stephannie Stanislaw', 2, NULL, 8, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (74, N'Raine Rutland', 244, NULL, 3, 1)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (75, N'Kurt Petersen', 6, NULL, 8, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (76, N'Lenette Gussin', 7, NULL, 10, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (77, N'Guinna Gillbey', 77, NULL, 8, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (78, N'Franklin Leith-Harvey', 7, NULL, 6, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (79, N'Candace Flawith', 7, NULL, 7, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (80, N'Quinta Chartres', 7, NULL, 9, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (81, N'Joanna Hammant', 7, NULL, 1, 5)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (82, N'Ingmar Conduit', 77, NULL, 3, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (83, N'Johnath cornhill', 55, NULL, 8, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (84, N'Donella Noir', 5, NULL, 8, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (85, N'Marleah Trippick', 5, NULL, 6, 7)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (86, N'Broddy Ryder', 5, NULL, 3, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (87, N'Doro Molines', 88, NULL, 1, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (88, N'Douglass Leeves', 100, NULL, 8, 3)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (89, N'Mike Lantuffe', 99, NULL, 7, 7)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (90, N'Worthington Scalera', 888, NULL, 8, 6)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (91, N'Noby Jennison', 100, NULL, 7, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (92, N'Raye Francom', 8, NULL, 5, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (93, N'Christiana Perrott', 8, NULL, 8, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (94, N'Feliza De Hoogh', 100, NULL, 7, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (95, N'Marlow Keiling', 8, NULL, 2, 4)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (96, N'Duke Kliemann', 8, NULL, 9, 2)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (97, N'Hammad Speight', 89, NULL, 6, 8)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (98, N'Masha Dolman', 999, NULL, 3, 9)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (99, N'Cynthie Wesson', 10, NULL, 5, 8)
GO
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (100, N'Trumann Lamzed', 100, NULL, 7, 5)
INSERT [dbo].[Album] ([AlbumID], [Title], [Price], [AlbumUrl], [Genre_ID], [Artist_ID]) VALUES (101, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Album] OFF
SET IDENTITY_INSERT [dbo].[Artist] ON 

INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (1, N'Codi Donavan')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (2, N'Ephrayim Curgenven')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (3, N'Elaine Siggins')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (4, N'Osmund Bartolomeu')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (5, N'Teri Levermore')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (6, N'Nate Schooley')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (7, N'Benton Spillard')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (8, N'Jewelle Turbayne')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (9, N'Thorsten Ellcock')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (10, N'Roldan Mallinar')
SET IDENTITY_INSERT [dbo].[Artist] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (1, N'Comedy', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (2, N'Comedy', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (3, N'Comedy', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (4, N'Action|Comedy|Crime', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (5, N'Documentary', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (6, N'Comedy|Drama', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (7, N'Drama|Thriller', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (8, N'Western', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (9, N'Comedy|Fantasy', NULL)
INSERT [dbo].[Genre] ([GenreID], [GenreName], [Description]) VALUES (10, N'Documentary', NULL)
SET IDENTITY_INSERT [dbo].[Genre] OFF
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Artist] FOREIGN KEY([Artist_ID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Artist]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Genre] FOREIGN KEY([Genre_ID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Genre]
GO
ALTER TABLE [dbo].[OrdeDetal]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetal_Album] FOREIGN KEY([Album_ID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[OrdeDetal] CHECK CONSTRAINT [FK_OrdeDetal_Album]
GO
ALTER TABLE [dbo].[OrdeDetal]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetal_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrdeDetal] CHECK CONSTRAINT [FK_OrdeDetal_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
USE [master]
GO
ALTER DATABASE [Thuctap_Music] SET  READ_WRITE 
GO
