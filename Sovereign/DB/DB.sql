USE [master]
GO
/****** Object:  Database [Sovereign]    Script Date: 6/15/2023 12:42:45 PM ******/
CREATE DATABASE [Sovereign]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sovereign', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sovereign.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sovereign_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sovereign_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Sovereign] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sovereign].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sovereign] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sovereign] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sovereign] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sovereign] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sovereign] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sovereign] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Sovereign] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sovereign] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sovereign] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sovereign] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sovereign] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sovereign] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sovereign] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sovereign] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sovereign] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sovereign] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sovereign] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sovereign] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sovereign] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sovereign] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sovereign] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sovereign] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sovereign] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sovereign] SET  MULTI_USER 
GO
ALTER DATABASE [Sovereign] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sovereign] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sovereign] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sovereign] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sovereign] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sovereign] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Sovereign] SET QUERY_STORE = ON
GO
ALTER DATABASE [Sovereign] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Sovereign]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [varchar](10) NOT NULL,
	[Category_Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[UserName] [varchar](15) NOT NULL,
	[User_Password] [varchar](15) NOT NULL,
	[User_Image] [nvarchar](50) NULL,
	[User_First_Name] [nvarchar](50) NULL,
	[User_Last_Name] [nvarchar](100) NULL,
	[Gender] [nvarchar](3) NULL,
	[Phone_Number] [varchar](10) NULL,
	[User_Email] [varchar](30) NULL,
	[Create_at] [datetime] NULL,
	[isAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Address]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Address](
	[Address_Id] [varchar](15) NOT NULL,
	[City_Province] [nvarchar](100) NULL,
	[District_Town] [nvarchar](100) NULL,
	[Street_Village] [nvarchar](100) NULL,
	[Address_Line] [nvarchar](150) NULL,
	[UserName] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Address_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Payment]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Payment](
	[Payment_Id] [varchar](15) NOT NULL,
	[Payment_Type] [nvarchar](100) NULL,
	[Payment_Provider] [nvarchar](100) NULL,
	[Account_No] [varchar](15) NULL,
	[UserName] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Product]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Product](
	[UserName] [varchar](15) NOT NULL,
	[Product_Id] [varchar](10) NOT NULL,
	[Customer_Product_Quantity] [int] NULL,
	[Create_at] [datetime] NULL,
 CONSTRAINT [pk_Customer_Product] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTb]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTb](
	[Order_Id] [varchar](10) NOT NULL,
	[Oder_Date] [datetime] NULL,
	[Order_Total] [decimal](18, 0) NULL,
	[Order_Decription] [nvarchar](1000) NULL,
	[UserName] [varchar](15) NULL,
	[Payment_Id] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTb_Product]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTb_Product](
	[Order_Id] [varchar](10) NOT NULL,
	[Product_Id] [varchar](10) NOT NULL,
	[OrderTb_Product_Quantity] [int] NULL,
	[Create_at] [datetime] NULL,
 CONSTRAINT [pk_OrderTb_Product] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC,
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_Id] [varchar](15) NOT NULL,
	[Payment_Date] [datetime] NULL,
	[Payment_Type] [nvarchar](100) NULL,
	[Payment_Provider] [nvarchar](100) NULL,
	[Payment_Amount] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/15/2023 12:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Id] [varchar](10) NOT NULL,
	[Product_Num] [varchar](10) NULL,
	[Product_Image] [nvarchar](500) NULL,
	[Product_Name] [nvarchar](100) NULL,
	[Product_Price] [decimal](18, 0) NULL,
	[Size] [varchar](4) NULL,
	[Color] [nvarchar](20) NULL,
	[Amount] [int] NULL,
	[Product_Decription] [nvarchar](max) NULL,
	[Create_at] [datetime] NULL,
	[Category_Id] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Category_Id], [Category_Name]) VALUES (N'L1', N'Áo Thun Tay Ngắn')
INSERT [dbo].[Category] ([Category_Id], [Category_Name]) VALUES (N'L2', N'Áo Thun Tay Dài')
INSERT [dbo].[Category] ([Category_Id], [Category_Name]) VALUES (N'L3', N'Jacket')
INSERT [dbo].[Category] ([Category_Id], [Category_Name]) VALUES (N'L4', N'Quần Short')
INSERT [dbo].[Category] ([Category_Id], [Category_Name]) VALUES (N'L5', N'Quần Dài')
GO
INSERT [dbo].[Customer] ([UserName], [User_Password], [User_Image], [User_First_Name], [User_Last_Name], [Gender], [Phone_Number], [User_Email], [Create_at], [isAdmin]) VALUES (N'anhthang', N'123456', N'thangavt.jpg', N'Thắng', N'Nguyễn', N'Nam', N'0869132529', N'anhthanganh2529@gmail.com', CAST(N'2023-06-13T01:42:00.000' AS DateTime), 0)
INSERT [dbo].[Customer] ([UserName], [User_Password], [User_Image], [User_First_Name], [User_Last_Name], [Gender], [Phone_Number], [User_Email], [Create_at], [isAdmin]) VALUES (N'anhthangadmin', N'123456', N'thangavt.jpg', N'Thắng', N'Anh', N'Nam', N'0869132529', N'anhthang2529@gmail.com', CAST(N'2023-06-12T10:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Customer_Address] ([Address_Id], [City_Province], [District_Town], [Street_Village], [Address_Line], [UserName]) VALUES (N'76', N'Quảng Ngãi', N'Quảng Ngãi', N'Nghĩa Chánh', N'141 Quang Trung', N'anhthang')
GO
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'01', N'TSGF2', N'GoatFather01.png, GoatFather02.png, GoatFather03.png, GoatFather04.png, GoatFather05.png, GoatFather06.png, GoatFather07.png, GoatFather08.png, GoatFather09.png, GoatFather10.png, GoatFather11.png, GoatFather12.png, GoatFather13.png, GoatFather01.png, GoatFather02.png, GoatFather03.png, GoatFather04.png, GoatFather05.png, GoatFather06.png, GoatFather07.png, GoatFather08.png', N'GOAT Father // White', CAST(490000 AS Decimal(18, 0)), N'S', N'White', 10, N'Model [1m78 - 65kg]. Áo size L.
---
Thông tin kỹ thuật:
. Chất liệu: Sovereign™ Streetvibe Fabric: 100% cotton 2 chiều, định lượng 250 gsm, dày dặn, hầu như không chảy nhão, bo cổ bền bỉ, thấm hút cực tốt và mát mẻ. Giặt máy thoải mái.
. Chi tiết in: kéo lụa mực nước.
Thông tin thêm: Vì sử dụng vải hai chiều, chúng tôi khuyên bạn lộn mặt trái khi giặt và ủi, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L1')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'02', N'TSGF2', N'GoatFather01.png, GoatFather02.png, GoatFather03.png, GoatFather04.png, GoatFather05.png, GoatFather06.png, GoatFather07.png, GoatFather08.png', N'GOAT Father // White', CAST(490000 AS Decimal(18, 0)), N'M', N'White', 10, N'Model [1m78 - 65kg]. Áo size L.
---
Thông tin kỹ thuật:
. Chất liệu: Sovereign™ Streetvibe Fabric: 100% cotton 2 chiều, định lượng 250 gsm, dày dặn, hầu như không chảy nhão, bo cổ bền bỉ, thấm hút cực tốt và mát mẻ. Giặt máy thoải mái.
. Chi tiết in: kéo lụa mực nước.
Thông tin thêm: Vì sử dụng vải hai chiều, chúng tôi khuyên bạn lộn mặt trái khi giặt và ủi, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L1')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'03', N'TSGF2', N'GoatFather01.png, GoatFather02.png, GoatFather03.png, GoatFather04.png, GoatFather05.png, GoatFather06.png, GoatFather07.png, GoatFather08.png', N'GOAT Father // White', CAST(490000 AS Decimal(18, 0)), N'L', N'White', 10, N'Model [1m78 - 65kg]. Áo size L.
---
Thông tin kỹ thuật:
. Chất liệu: Sovereign™ Streetvibe Fabric: 100% cotton 2 chiều, định lượng 250 gsm, dày dặn, hầu như không chảy nhão, bo cổ bền bỉ, thấm hút cực tốt và mát mẻ. Giặt máy thoải mái.
. Chi tiết in: kéo lụa mực nước.
Thông tin thêm: Vì sử dụng vải hai chiều, chúng tôi khuyên bạn lộn mặt trái khi giặt và ủi, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L1')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'04', N'TSGF2', N'GoatFather01.png, GoatFather02.png, GoatFather03.png, GoatFather04.png, GoatFather05.png, GoatFather06.png, GoatFather07.png, GoatFather08.png', N'GOAT Father // White', CAST(490000 AS Decimal(18, 0)), N'XL', N'White', 10, N'Model [1m78 - 65kg]. Áo size L.
---
Thông tin kỹ thuật:
. Chất liệu: Sovereign™ Streetvibe Fabric: 100% cotton 2 chiều, định lượng 250 gsm, dày dặn, hầu như không chảy nhão, bo cổ bền bỉ, thấm hút cực tốt và mát mẻ. Giặt máy thoải mái.
. Chi tiết in: kéo lụa mực nước.
Thông tin thêm: Vì sử dụng vải hai chiều, chúng tôi khuyên bạn lộn mặt trái khi giặt và ủi, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L1')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'05', N'TSGN1', N'GOATNight01.png, GOATNight02.png, GOATNight03.png, GOATNight04.png, GOATNight05.png, GOATNight06.png, GOATNight07.png, GOATNight08.png', N'GOAT Night // Black', CAST(390000 AS Decimal(18, 0)), N'S', N'Black', 5, N'Model [1m77 - 68kg]. Áo size L.

---

Thông tin kỹ thuật:

. Chất liệu: GRDC™ Streetvibe Fabric: 100% cotton 2 chiều, định lượng 250 gsm, dày dặn, hầu như không chảy nhão, bo cổ bền bỉ, thấm hút cực tốt và mát mẻ. Giặt máy thoải mái.

. Họa tiết được in kéo lụa mực plastisol, cho độ bền lý tính vượt trội, giúp hạn chế tối đa tình trạng bong tróc chi tiết in trong suốt thời gian sử dụng.

Thông tin thêm: Vì sử dụng vải hai chiều, chúng tôi khuyên bạn lộn mặt trái khi giặt và ủi, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L1')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'06', N'TSGN1', N'GOATNight01.png, GOATNight02.png, GOATNight03.png, GOATNight04.png, GOATNight05.png, GOATNight06.png, GOATNight07.png, GOATNight08.png', N'GOAT Night // Black', CAST(390000 AS Decimal(18, 0)), N'M', N'Black', 5, N'Model [1m77 - 68kg]. Áo size L.

---

Thông tin kỹ thuật:

. Chất liệu: GRDC™ Streetvibe Fabric: 100% cotton 2 chiều, định lượng 250 gsm, dày dặn, hầu như không chảy nhão, bo cổ bền bỉ, thấm hút cực tốt và mát mẻ. Giặt máy thoải mái.

. Họa tiết được in kéo lụa mực plastisol, cho độ bền lý tính vượt trội, giúp hạn chế tối đa tình trạng bong tróc chi tiết in trong suốt thời gian sử dụng.

Thông tin thêm: Vì sử dụng vải hai chiều, chúng tôi khuyên bạn lộn mặt trái khi giặt và ủi, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L1')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'07', N'TSGN1', N'GOATNight01.png, GOATNight02.png, GOATNight03.png, GOATNight04.png, GOATNight05.png, GOATNight06.png, GOATNight07.png, GOATNight08.png', N'GOAT Night // Black', CAST(390000 AS Decimal(18, 0)), N'L', N'Black', 5, N'Model [1m77 - 68kg]. Áo size L.

---

Thông tin kỹ thuật:

. Chất liệu: GRDC™ Streetvibe Fabric: 100% cotton 2 chiều, định lượng 250 gsm, dày dặn, hầu như không chảy nhão, bo cổ bền bỉ, thấm hút cực tốt và mát mẻ. Giặt máy thoải mái.

. Họa tiết được in kéo lụa mực plastisol, cho độ bền lý tính vượt trội, giúp hạn chế tối đa tình trạng bong tróc chi tiết in trong suốt thời gian sử dụng.

Thông tin thêm: Vì sử dụng vải hai chiều, chúng tôi khuyên bạn lộn mặt trái khi giặt và ủi, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L1')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'08', N'TSGN1', N'GOATNight01.png, GOATNight02.png, GOATNight03.png, GOATNight04.png, GOATNight05.png, GOATNight06.png, GOATNight07.png, GOATNight08.png', N'GOAT Night // Black', CAST(390000 AS Decimal(18, 0)), N'XL', N'Black', 5, N'Model [1m77 - 68kg]. Áo size L.

---

Thông tin kỹ thuật:

. Chất liệu: GRDC™ Streetvibe Fabric: 100% cotton 2 chiều, định lượng 250 gsm, dày dặn, hầu như không chảy nhão, bo cổ bền bỉ, thấm hút cực tốt và mát mẻ. Giặt máy thoải mái.

. Họa tiết được in kéo lụa mực plastisol, cho độ bền lý tính vượt trội, giúp hạn chế tối đa tình trạng bong tróc chi tiết in trong suốt thời gian sử dụng.

Thông tin thêm: Vì sử dụng vải hai chiều, chúng tôi khuyên bạn lộn mặt trái khi giặt và ủi, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L1')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'09', N'JKAT1', N'AirTech01.png, AirTech02.png, AirTech03.png, AirTech04.png, AirTech05.png, AirTech06.png, AirTech07.png, AirTech08.png', N'AIR-tech jacket', CAST(599000 AS Decimal(18, 0)), N'S', N'Black', 10, N'Model [1m72 - 70kg]. Áo size XL.

---
Thông tin kỹ thuật:
. Thiết kế AIR-vent in & out hoàn toàn mới, lượng gió lưu thông tăng gấp 2 lần
. Làm mát đến những khu vực khuất nhất như lưng dưới và bụng
. Công nghệ áp dụng: AIR-tech™ by Grimm DC a.k.a Hệ thống luân chuyển dòng khí. Gồm 3 bộ phận: AIR-vent in a.k.a. khe đưa gió vào, lưới mesh cho phép không khí luân chuyển trước/sau và AIR-vent out a.k.a. khe thoát gió ra. Vị trí AIR-vent in và out được tính toán chi tiết để đảm bảo tối đa hiệu quả thông khí cho các vùng nhiệt độ cao của cơ thể nhưng không làm form áo bị phồng lên quá mức khi di chuyển với tốc độ lớn.
. Hệ thống 4 túi: hai túi hông thường + 1 túi ẩn với dây khóa bên hông trái + 1 túi bí mật bên trong.
. Chất liệu vải: Polyester.
. Toàn bộ dây khóa sử dụng YKK zip chính hãng Nhật Bản
. Cổ tay hai thành phần: thun co giãn và đai gài velcro - đảm bảo ôm vừa vặn mọi kích thước cổ tay.
. Box logo: sử dụng kỹ thuật đúc khuôn silicon chính xác để tái tạo độ cao và chi tiết cho từng chữ.
. Cụm Grimm DC ở mặt lưng: sử dụng kỹ thuật thêu nổi 3D với độ cao nét chữ lên đến 1.5mm.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L3')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'10', N'JKAT1', N'AirTech01.png, AirTech02.png, AirTech03.png, AirTech04.png, AirTech05.png, AirTech06.png, AirTech07.png, AirTech08.png', N'AIR-tech jacket', CAST(599000 AS Decimal(18, 0)), N'M', N'Black', 10, N'Model [1m72 - 70kg]. Áo size XL.

---
Thông tin kỹ thuật:
. Thiết kế AIR-vent in & out hoàn toàn mới, lượng gió lưu thông tăng gấp 2 lần
. Làm mát đến những khu vực khuất nhất như lưng dưới và bụng
. Công nghệ áp dụng: AIR-tech™ by Grimm DC a.k.a Hệ thống luân chuyển dòng khí. Gồm 3 bộ phận: AIR-vent in a.k.a. khe đưa gió vào, lưới mesh cho phép không khí luân chuyển trước/sau và AIR-vent out a.k.a. khe thoát gió ra. Vị trí AIR-vent in và out được tính toán chi tiết để đảm bảo tối đa hiệu quả thông khí cho các vùng nhiệt độ cao của cơ thể nhưng không làm form áo bị phồng lên quá mức khi di chuyển với tốc độ lớn.
. Hệ thống 4 túi: hai túi hông thường + 1 túi ẩn với dây khóa bên hông trái + 1 túi bí mật bên trong.
. Chất liệu vải: Polyester.
. Toàn bộ dây khóa sử dụng YKK zip chính hãng Nhật Bản
. Cổ tay hai thành phần: thun co giãn và đai gài velcro - đảm bảo ôm vừa vặn mọi kích thước cổ tay.
. Box logo: sử dụng kỹ thuật đúc khuôn silicon chính xác để tái tạo độ cao và chi tiết cho từng chữ.
. Cụm Grimm DC ở mặt lưng: sử dụng kỹ thuật thêu nổi 3D với độ cao nét chữ lên đến 1.5mm.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L3')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'11', N'JKAT1', N'AirTech01.png, AirTech02.png, AirTech03.png, AirTech04.png, AirTech05.png, AirTech06.png, AirTech07.png, AirTech08.png', N'AIR-tech jacket', CAST(599000 AS Decimal(18, 0)), N'L', N'Black', 10, N'Model [1m72 - 70kg]. Áo size XL.

---
Thông tin kỹ thuật:
. Thiết kế AIR-vent in & out hoàn toàn mới, lượng gió lưu thông tăng gấp 2 lần
. Làm mát đến những khu vực khuất nhất như lưng dưới và bụng
. Công nghệ áp dụng: AIR-tech™ by Grimm DC a.k.a Hệ thống luân chuyển dòng khí. Gồm 3 bộ phận: AIR-vent in a.k.a. khe đưa gió vào, lưới mesh cho phép không khí luân chuyển trước/sau và AIR-vent out a.k.a. khe thoát gió ra. Vị trí AIR-vent in và out được tính toán chi tiết để đảm bảo tối đa hiệu quả thông khí cho các vùng nhiệt độ cao của cơ thể nhưng không làm form áo bị phồng lên quá mức khi di chuyển với tốc độ lớn.
. Hệ thống 4 túi: hai túi hông thường + 1 túi ẩn với dây khóa bên hông trái + 1 túi bí mật bên trong.
. Chất liệu vải: Polyester.
. Toàn bộ dây khóa sử dụng YKK zip chính hãng Nhật Bản
. Cổ tay hai thành phần: thun co giãn và đai gài velcro - đảm bảo ôm vừa vặn mọi kích thước cổ tay.
. Box logo: sử dụng kỹ thuật đúc khuôn silicon chính xác để tái tạo độ cao và chi tiết cho từng chữ.
. Cụm Grimm DC ở mặt lưng: sử dụng kỹ thuật thêu nổi 3D với độ cao nét chữ lên đến 1.5mm.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L3')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'12', N'JKAT1', N'AirTech01.png, AirTech02.png, AirTech03.png, AirTech04.png, AirTech05.png, AirTech06.png, AirTech07.png, AirTech08.png', N'AIR-tech jacket', CAST(599000 AS Decimal(18, 0)), N'XL', N'Black', 10, N'Model [1m72 - 70kg]. Áo size XL.

---
Thông tin kỹ thuật:
. Thiết kế AIR-vent in & out hoàn toàn mới, lượng gió lưu thông tăng gấp 2 lần
. Làm mát đến những khu vực khuất nhất như lưng dưới và bụng
. Công nghệ áp dụng: AIR-tech™ by Grimm DC a.k.a Hệ thống luân chuyển dòng khí. Gồm 3 bộ phận: AIR-vent in a.k.a. khe đưa gió vào, lưới mesh cho phép không khí luân chuyển trước/sau và AIR-vent out a.k.a. khe thoát gió ra. Vị trí AIR-vent in và out được tính toán chi tiết để đảm bảo tối đa hiệu quả thông khí cho các vùng nhiệt độ cao của cơ thể nhưng không làm form áo bị phồng lên quá mức khi di chuyển với tốc độ lớn.
. Hệ thống 4 túi: hai túi hông thường + 1 túi ẩn với dây khóa bên hông trái + 1 túi bí mật bên trong.
. Chất liệu vải: Polyester.
. Toàn bộ dây khóa sử dụng YKK zip chính hãng Nhật Bản
. Cổ tay hai thành phần: thun co giãn và đai gài velcro - đảm bảo ôm vừa vặn mọi kích thước cổ tay.
. Box logo: sử dụng kỹ thuật đúc khuôn silicon chính xác để tái tạo độ cao và chi tiết cho từng chữ.
. Cụm Grimm DC ở mặt lưng: sử dụng kỹ thuật thêu nổi 3D với độ cao nét chữ lên đến 1.5mm.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L3')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'13', N'QDBM1', N'CargoB-mov01.png, CargoB-mov02.png, CargoB-mov03.png, CargoB-mov04.png, CargoB-mov05.png, CargoB-mov06.png, CargoB-mov07.png, CargoB-mov08.png', N'Quần Cargo B-mov // Grey', CAST(469000 AS Decimal(18, 0)), N'S', N'Grey', 15, N'Model [1m77 - 68kg]. Quần size XL.

---

Mẫu quần túi hộp với lưng thun ẩn - kỹ thuật may đặc biệt của Grimm DC.

. Bên ngoài vẫn là lưng vải phẳng phiu cùng con đỉa. Bên trong là lưng thun ẩn, giúp co dãn theo cử động / vòng bụng của người mặc.

. Hệ thống 7 túi: 4 túi thường + 2 túi hộp + 1 túi ẩn bên hông phải với khoá kéo YKK Nhật chính hãng, để điện thoại và những đồ quý giá luôn an toàn.

. Box logo trên nắp túi được thêu tỉ mỉ và tinh tế.

 

Thích hợp để đi skate. Đi cà phê. Đi first date.

---

Thông tin kỹ thuật:

- Vải: khaki 100% cotton, giúp thấm hút tốt, đứng form, hạn chế nhăn. 

- Độ cầm màu: cấp 3-4.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L5')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'14', N'QDBM1', N'CargoB-mov01.png, CargoB-mov02.png, CargoB-mov03.png, CargoB-mov04.png, CargoB-mov05.png, CargoB-mov06.png, CargoB-mov07.png, CargoB-mov08.png', N'Quần Cargo B-mov // Grey', CAST(469000 AS Decimal(18, 0)), N'M', N'Grey', 15, N'Model [1m77 - 68kg]. Quần size XL.

---

Mẫu quần túi hộp với lưng thun ẩn - kỹ thuật may đặc biệt của Grimm DC.

. Bên ngoài vẫn là lưng vải phẳng phiu cùng con đỉa. Bên trong là lưng thun ẩn, giúp co dãn theo cử động / vòng bụng của người mặc.

. Hệ thống 7 túi: 4 túi thường + 2 túi hộp + 1 túi ẩn bên hông phải với khoá kéo YKK Nhật chính hãng, để điện thoại và những đồ quý giá luôn an toàn.

. Box logo trên nắp túi được thêu tỉ mỉ và tinh tế.

 

Thích hợp để đi skate. Đi cà phê. Đi first date.

---

Thông tin kỹ thuật:

- Vải: khaki 100% cotton, giúp thấm hút tốt, đứng form, hạn chế nhăn. 

- Độ cầm màu: cấp 3-4.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L5')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'15', N'QDBM1', N'CargoB-mov01.png, CargoB-mov02.png, CargoB-mov03.png, CargoB-mov04.png, CargoB-mov05.png, CargoB-mov06.png, CargoB-mov07.png, CargoB-mov08.png', N'Quần Cargo B-mov // Grey', CAST(469000 AS Decimal(18, 0)), N'L', N'Grey', 15, N'Model [1m77 - 68kg]. Quần size XL.

---

Mẫu quần túi hộp với lưng thun ẩn - kỹ thuật may đặc biệt của Grimm DC.

. Bên ngoài vẫn là lưng vải phẳng phiu cùng con đỉa. Bên trong là lưng thun ẩn, giúp co dãn theo cử động / vòng bụng của người mặc.

. Hệ thống 7 túi: 4 túi thường + 2 túi hộp + 1 túi ẩn bên hông phải với khoá kéo YKK Nhật chính hãng, để điện thoại và những đồ quý giá luôn an toàn.

. Box logo trên nắp túi được thêu tỉ mỉ và tinh tế.

 

Thích hợp để đi skate. Đi cà phê. Đi first date.

---

Thông tin kỹ thuật:

- Vải: khaki 100% cotton, giúp thấm hút tốt, đứng form, hạn chế nhăn. 

- Độ cầm màu: cấp 3-4.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L5')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'16', N'QDBM1', N'CargoB-mov01.png, CargoB-mov02.png, CargoB-mov03.png, CargoB-mov04.png, CargoB-mov05.png, CargoB-mov06.png, CargoB-mov07.png, CargoB-mov08.png', N'Quần Cargo B-mov // Grey', CAST(469000 AS Decimal(18, 0)), N'XL', N'Grey', 15, N'Model [1m77 - 68kg]. Quần size XL.

---

Mẫu quần túi hộp với lưng thun ẩn - kỹ thuật may đặc biệt của Grimm DC.

. Bên ngoài vẫn là lưng vải phẳng phiu cùng con đỉa. Bên trong là lưng thun ẩn, giúp co dãn theo cử động / vòng bụng của người mặc.

. Hệ thống 7 túi: 4 túi thường + 2 túi hộp + 1 túi ẩn bên hông phải với khoá kéo YKK Nhật chính hãng, để điện thoại và những đồ quý giá luôn an toàn.

. Box logo trên nắp túi được thêu tỉ mỉ và tinh tế.

 

Thích hợp để đi skate. Đi cà phê. Đi first date.

---

Thông tin kỹ thuật:

- Vải: khaki 100% cotton, giúp thấm hút tốt, đứng form, hạn chế nhăn. 

- Độ cầm màu: cấp 3-4.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L5')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'17', N'QDFP1', N'FlexPants01.png, FlexPants02.png, FlexPants03.png, FlexPants04.png, FlexPants05.png, FlexPants06.png, FlexPants07.png, FlexPants08.png', N'Flex pants // Black', CAST(369000 AS Decimal(18, 0)), N'S', N'Black', 5, N'Mẫu nữ 1m63 - 43kg. Quần size L. Áo size L.

 

---

Flexible bên trong, flexin’ bên ngoài.

Flexin’: Grimm DC làm. Cho người Việt mặc. Đơn giản. Chất lượng.

Flexible: sử dụng trong mọi tình huống. Thể thao trên sân. Bay nhảy ngoài trời. Vội vã trong nhà.

---

Những lý do khiến anh em không nên bỏ lỡ chiếc quần này:

. Chất liệu: 100% sợi tổng hợp Polyester với công nghệ dệt sợi dọc ATY và sợi ngang HIGH STRETCH, tạo ra độ bền lý tính vượt trội, cùng cảm giác trên da tương tự sợi Cotton tự nhiên.

. Giặt máy thoải mái. 𝗩𝗮̉𝗶 𝗰𝗵𝗼̂́𝗻𝗴 𝗻𝗵𝗮̆𝗻.

. Không bạc màu. Luôn đẹp như mới.

. Co giãn cực tốt, mỏng nhưng không xuyên thấu, nhẹ nhưng vẫn đứng form, thấm hút mồ hôi tốt. Mặc đi đâu, làm gì cũng tiện: đi học, đi làm, đi trượt ván, đi chơi,... hoặc đi ngủ.

. Đáy quần được gia cố chắc chắn, bao bung chỉ kể cả có xoạc ngang / té.

. Quần có 4 túi thường được đánh bọ rất kỹ, kèm túi ẩn với khóa kéo YKK Nhật chính hãng, để điện thoại và những đồ quý giá luôn an toàn.

. Phom quần suông và rộng. Trendy nhưng thoải mái.

. Lưng thun mềm, co giãn tốt, có dây rút để điều chỉnh vừa với eo và không gây khó chịu.

. “Grimm DC” thêu trên miệng túi sau. Bảo chứng cho chất lượng.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L5')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'18', N'QDFP1', N'FlexPants01.png, FlexPants02.png, FlexPants03.png, FlexPants04.png, FlexPants05.png, FlexPants06.png, FlexPants07.png, FlexPants08.png', N'Flex pants // Black', CAST(369000 AS Decimal(18, 0)), N'M', N'Black', 5, N'Mẫu nữ 1m63 - 43kg. Quần size L. Áo size L.

 

---

Flexible bên trong, flexin’ bên ngoài.

Flexin’: Grimm DC làm. Cho người Việt mặc. Đơn giản. Chất lượng.

Flexible: sử dụng trong mọi tình huống. Thể thao trên sân. Bay nhảy ngoài trời. Vội vã trong nhà.

---

Những lý do khiến anh em không nên bỏ lỡ chiếc quần này:

. Chất liệu: 100% sợi tổng hợp Polyester với công nghệ dệt sợi dọc ATY và sợi ngang HIGH STRETCH, tạo ra độ bền lý tính vượt trội, cùng cảm giác trên da tương tự sợi Cotton tự nhiên.

. Giặt máy thoải mái. 𝗩𝗮̉𝗶 𝗰𝗵𝗼̂́𝗻𝗴 𝗻𝗵𝗮̆𝗻.

. Không bạc màu. Luôn đẹp như mới.

. Co giãn cực tốt, mỏng nhưng không xuyên thấu, nhẹ nhưng vẫn đứng form, thấm hút mồ hôi tốt. Mặc đi đâu, làm gì cũng tiện: đi học, đi làm, đi trượt ván, đi chơi,... hoặc đi ngủ.

. Đáy quần được gia cố chắc chắn, bao bung chỉ kể cả có xoạc ngang / té.

. Quần có 4 túi thường được đánh bọ rất kỹ, kèm túi ẩn với khóa kéo YKK Nhật chính hãng, để điện thoại và những đồ quý giá luôn an toàn.

. Phom quần suông và rộng. Trendy nhưng thoải mái.

. Lưng thun mềm, co giãn tốt, có dây rút để điều chỉnh vừa với eo và không gây khó chịu.

. “Grimm DC” thêu trên miệng túi sau. Bảo chứng cho chất lượng.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L5')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'19', N'QDFP1', N'FlexPants01.png, FlexPants02.png, FlexPants03.png, FlexPants04.png, FlexPants05.png, FlexPants06.png, FlexPants07.png, FlexPants08.png', N'Flex pants // Black', CAST(369000 AS Decimal(18, 0)), N'L', N'Black', 5, N'Mẫu nữ 1m63 - 43kg. Quần size L. Áo size L.

 

---

Flexible bên trong, flexin’ bên ngoài.

Flexin’: Grimm DC làm. Cho người Việt mặc. Đơn giản. Chất lượng.

Flexible: sử dụng trong mọi tình huống. Thể thao trên sân. Bay nhảy ngoài trời. Vội vã trong nhà.

---

Những lý do khiến anh em không nên bỏ lỡ chiếc quần này:

. Chất liệu: 100% sợi tổng hợp Polyester với công nghệ dệt sợi dọc ATY và sợi ngang HIGH STRETCH, tạo ra độ bền lý tính vượt trội, cùng cảm giác trên da tương tự sợi Cotton tự nhiên.

. Giặt máy thoải mái. 𝗩𝗮̉𝗶 𝗰𝗵𝗼̂́𝗻𝗴 𝗻𝗵𝗮̆𝗻.

. Không bạc màu. Luôn đẹp như mới.

. Co giãn cực tốt, mỏng nhưng không xuyên thấu, nhẹ nhưng vẫn đứng form, thấm hút mồ hôi tốt. Mặc đi đâu, làm gì cũng tiện: đi học, đi làm, đi trượt ván, đi chơi,... hoặc đi ngủ.

. Đáy quần được gia cố chắc chắn, bao bung chỉ kể cả có xoạc ngang / té.

. Quần có 4 túi thường được đánh bọ rất kỹ, kèm túi ẩn với khóa kéo YKK Nhật chính hãng, để điện thoại và những đồ quý giá luôn an toàn.

. Phom quần suông và rộng. Trendy nhưng thoải mái.

. Lưng thun mềm, co giãn tốt, có dây rút để điều chỉnh vừa với eo và không gây khó chịu.

. “Grimm DC” thêu trên miệng túi sau. Bảo chứng cho chất lượng.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L5')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'20', N'QDFP1', N'FlexPants01.png, FlexPants02.png, FlexPants03.png, FlexPants04.png, FlexPants05.png, FlexPants06.png, FlexPants07.png, FlexPants08.png', N'Flex pants // Black', CAST(369000 AS Decimal(18, 0)), N'XL', N'Black', 5, N'Mẫu nữ 1m63 - 43kg. Quần size L. Áo size L.

 

---

Flexible bên trong, flexin’ bên ngoài.

Flexin’: Grimm DC làm. Cho người Việt mặc. Đơn giản. Chất lượng.

Flexible: sử dụng trong mọi tình huống. Thể thao trên sân. Bay nhảy ngoài trời. Vội vã trong nhà.

---

Những lý do khiến anh em không nên bỏ lỡ chiếc quần này:

. Chất liệu: 100% sợi tổng hợp Polyester với công nghệ dệt sợi dọc ATY và sợi ngang HIGH STRETCH, tạo ra độ bền lý tính vượt trội, cùng cảm giác trên da tương tự sợi Cotton tự nhiên.

. Giặt máy thoải mái. 𝗩𝗮̉𝗶 𝗰𝗵𝗼̂́𝗻𝗴 𝗻𝗵𝗮̆𝗻.

. Không bạc màu. Luôn đẹp như mới.

. Co giãn cực tốt, mỏng nhưng không xuyên thấu, nhẹ nhưng vẫn đứng form, thấm hút mồ hôi tốt. Mặc đi đâu, làm gì cũng tiện: đi học, đi làm, đi trượt ván, đi chơi,... hoặc đi ngủ.

. Đáy quần được gia cố chắc chắn, bao bung chỉ kể cả có xoạc ngang / té.

. Quần có 4 túi thường được đánh bọ rất kỹ, kèm túi ẩn với khóa kéo YKK Nhật chính hãng, để điện thoại và những đồ quý giá luôn an toàn.

. Phom quần suông và rộng. Trendy nhưng thoải mái.

. Lưng thun mềm, co giãn tốt, có dây rút để điều chỉnh vừa với eo và không gây khó chịu.

. “Grimm DC” thêu trên miệng túi sau. Bảo chứng cho chất lượng.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L5')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'21', N'QSWS1', N'ShortWestside01.png, ShortWestside02.png, ShortWestside03.png, ShortWestside04.png, ShortWestside05.png, ShortWestside06.png, ShortWestside07.png, ShortWestside08.png', N'Quần short Westside', CAST(390000 AS Decimal(18, 0)), N'S', N'Black', 10, N'Model [1m72 - 70kg]. Quần size L.

---

Vải: Sử dụng vải Khaki cotton sớ vừa, đảm bảo độ dày cho các hoạt động ngoài trời nhưng vẫn đủ mềm để không gây khó chịu khi sử dụng.

Túi khoá kéo YKK ở hông phải - không còn việc rớt điện thoại hoặc đồ vật quan trọng.

Hoạ tiết Westside: in decal phản quang.

Tất cả đường may sử dụng chỉ cotton Coats - thương hiệu chỉ của Anh và được sản xuất tại Việt Nam.

Đường đánh bọ/đính bọ (bar-tack stitch): là đường chỉ thêu nhiều lần tới và lui trong một khoảng nhỏ, xuất hiện trên dòng sản phẩm chất lượng cao, tại những vị trí thường chịu nhiều lực tác động, dễ rách, bung đường chỉ như miệng túi sau, miệng túi trước, con đỉa, đường baget (phần môi Phéc-mơ-tuya)…nhằm gia cố đường may và khiến sản phẩm bền theo năm tháng. Trong mẫu quần short Westside, Grimm DC sử dụng tổng cộng 9 đường đánh bọ tại 9 điểm khác nhau.

Dây dệt thương hiệu Grimm DC tặng kèm.

Mỗi quần gồm 1 dây Grimm DC dài 1m5, cùng 1 dây đen trơn. Như vậy bạn sẽ có 2 lựa chọn phối đồ khác nhau cho cùng một mẫu short này.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L4')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'22', N'QSWS1', N'ShortWestside01.png, ShortWestside02.png, ShortWestside03.png, ShortWestside04.png, ShortWestside05.png, ShortWestside06.png, ShortWestside07.png, ShortWestside08.png', N'Quần short Westside', CAST(390000 AS Decimal(18, 0)), N'M', N'Black', 10, N'Model [1m72 - 70kg]. Quần size L.

---

Vải: Sử dụng vải Khaki cotton sớ vừa, đảm bảo độ dày cho các hoạt động ngoài trời nhưng vẫn đủ mềm để không gây khó chịu khi sử dụng.

Túi khoá kéo YKK ở hông phải - không còn việc rớt điện thoại hoặc đồ vật quan trọng.

Hoạ tiết Westside: in decal phản quang.

Tất cả đường may sử dụng chỉ cotton Coats - thương hiệu chỉ của Anh và được sản xuất tại Việt Nam.

Đường đánh bọ/đính bọ (bar-tack stitch): là đường chỉ thêu nhiều lần tới và lui trong một khoảng nhỏ, xuất hiện trên dòng sản phẩm chất lượng cao, tại những vị trí thường chịu nhiều lực tác động, dễ rách, bung đường chỉ như miệng túi sau, miệng túi trước, con đỉa, đường baget (phần môi Phéc-mơ-tuya)…nhằm gia cố đường may và khiến sản phẩm bền theo năm tháng. Trong mẫu quần short Westside, Grimm DC sử dụng tổng cộng 9 đường đánh bọ tại 9 điểm khác nhau.

Dây dệt thương hiệu Grimm DC tặng kèm.

Mỗi quần gồm 1 dây Grimm DC dài 1m5, cùng 1 dây đen trơn. Như vậy bạn sẽ có 2 lựa chọn phối đồ khác nhau cho cùng một mẫu short này.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L4')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'23', N'QSWS1', N'ShortWestside01.png, ShortWestside02.png, ShortWestside03.png, ShortWestside04.png, ShortWestside05.png, ShortWestside06.png, ShortWestside07.png, ShortWestside08.png', N'Quần short Westside', CAST(390000 AS Decimal(18, 0)), N'L', N'Black', 10, N'Model [1m72 - 70kg]. Quần size L.

---

Vải: Sử dụng vải Khaki cotton sớ vừa, đảm bảo độ dày cho các hoạt động ngoài trời nhưng vẫn đủ mềm để không gây khó chịu khi sử dụng.

Túi khoá kéo YKK ở hông phải - không còn việc rớt điện thoại hoặc đồ vật quan trọng.

Hoạ tiết Westside: in decal phản quang.

Tất cả đường may sử dụng chỉ cotton Coats - thương hiệu chỉ của Anh và được sản xuất tại Việt Nam.

Đường đánh bọ/đính bọ (bar-tack stitch): là đường chỉ thêu nhiều lần tới và lui trong một khoảng nhỏ, xuất hiện trên dòng sản phẩm chất lượng cao, tại những vị trí thường chịu nhiều lực tác động, dễ rách, bung đường chỉ như miệng túi sau, miệng túi trước, con đỉa, đường baget (phần môi Phéc-mơ-tuya)…nhằm gia cố đường may và khiến sản phẩm bền theo năm tháng. Trong mẫu quần short Westside, Grimm DC sử dụng tổng cộng 9 đường đánh bọ tại 9 điểm khác nhau.

Dây dệt thương hiệu Grimm DC tặng kèm.

Mỗi quần gồm 1 dây Grimm DC dài 1m5, cùng 1 dây đen trơn. Như vậy bạn sẽ có 2 lựa chọn phối đồ khác nhau cho cùng một mẫu short này.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L4')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'24', N'QSWS1', N'ShortWestside01.png, ShortWestside02.png, ShortWestside03.png, ShortWestside04.png, ShortWestside05.png, ShortWestside06.png, ShortWestside07.png, ShortWestside08.png', N'Quần short Westside', CAST(390000 AS Decimal(18, 0)), N'XL', N'Black', 10, N'Model [1m72 - 70kg]. Quần size L.

---

Vải: Sử dụng vải Khaki cotton sớ vừa, đảm bảo độ dày cho các hoạt động ngoài trời nhưng vẫn đủ mềm để không gây khó chịu khi sử dụng.

Túi khoá kéo YKK ở hông phải - không còn việc rớt điện thoại hoặc đồ vật quan trọng.

Hoạ tiết Westside: in decal phản quang.

Tất cả đường may sử dụng chỉ cotton Coats - thương hiệu chỉ của Anh và được sản xuất tại Việt Nam.

Đường đánh bọ/đính bọ (bar-tack stitch): là đường chỉ thêu nhiều lần tới và lui trong một khoảng nhỏ, xuất hiện trên dòng sản phẩm chất lượng cao, tại những vị trí thường chịu nhiều lực tác động, dễ rách, bung đường chỉ như miệng túi sau, miệng túi trước, con đỉa, đường baget (phần môi Phéc-mơ-tuya)…nhằm gia cố đường may và khiến sản phẩm bền theo năm tháng. Trong mẫu quần short Westside, Grimm DC sử dụng tổng cộng 9 đường đánh bọ tại 9 điểm khác nhau.

Dây dệt thương hiệu Grimm DC tặng kèm.

Mỗi quần gồm 1 dây Grimm DC dài 1m5, cùng 1 dây đen trơn. Như vậy bạn sẽ có 2 lựa chọn phối đồ khác nhau cho cùng một mẫu short này.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L4')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'25', N'QSBS1', N'BasicShorts01.png, BasicShorts02.png, BasicShorts03.png, BasicShorts04.png, BasicShorts05.png, BasicShorts06.png, BasicShorts07.png, BasicShorts08.png', N'Basic shorts // White', CAST(369000 AS Decimal(18, 0)), N'S', N'White', 5, N'Model [1m72 - 70kg]. Quần size L.

---

. Lớp ngoài sử dụng GRDC Standard™ Fabric: 94% cotton 6% spandex, co dãn 4 chiều, ít nhăn, thấm hút tốt và mát mẻ, không tồn dư hóa chất gây ung thư, độ cầm màu cấp 4-5.

. Lớp trong sử dụng thun lạnh, giúp quần thoáng mát, mềm mịn, và dễ chịu khi tiếp xúc với da.

. Giúp giảm đen da tối đa nhờ chất liệu vải chống tia UV (tia cực tím) lên đến 50+, tương đương với khả năng chống đến 98% tia UV gây hại. Tính năng đặc biệt này giúp hạn chế quá trình hình thành hắc tố melanin - sắc tố đen gây sẫm màu da.

. Túi ẩn khóa kéo YKK Nhật chính hãng. Để điện thoại và đồ quý giá luôn an toàn.

. Giặt máy thoải mái.

Phù hợp để đi chơi. Nếu không đi chơi có thể dùng để đi ngủ. Một công đôi việc.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L4')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'26', N'QSBS1', N'BasicShorts01.png, BasicShorts02.png, BasicShorts03.png, BasicShorts04.png, BasicShorts05.png, BasicShorts06.png, BasicShorts07.png, BasicShorts08.png', N'Basic shorts // White', CAST(369000 AS Decimal(18, 0)), N'M', N'White', 5, N'Model [1m72 - 70kg]. Quần size L.

---

. Lớp ngoài sử dụng GRDC Standard™ Fabric: 94% cotton 6% spandex, co dãn 4 chiều, ít nhăn, thấm hút tốt và mát mẻ, không tồn dư hóa chất gây ung thư, độ cầm màu cấp 4-5.

. Lớp trong sử dụng thun lạnh, giúp quần thoáng mát, mềm mịn, và dễ chịu khi tiếp xúc với da.

. Giúp giảm đen da tối đa nhờ chất liệu vải chống tia UV (tia cực tím) lên đến 50+, tương đương với khả năng chống đến 98% tia UV gây hại. Tính năng đặc biệt này giúp hạn chế quá trình hình thành hắc tố melanin - sắc tố đen gây sẫm màu da.

. Túi ẩn khóa kéo YKK Nhật chính hãng. Để điện thoại và đồ quý giá luôn an toàn.

. Giặt máy thoải mái.

Phù hợp để đi chơi. Nếu không đi chơi có thể dùng để đi ngủ. Một công đôi việc.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L4')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'27', N'QSBS1', N'BasicShorts01.png, BasicShorts02.png, BasicShorts03.png, BasicShorts04.png, BasicShorts05.png, BasicShorts06.png, BasicShorts07.png, BasicShorts08.png', N'Basic shorts // White', CAST(369000 AS Decimal(18, 0)), N'L', N'White', 5, N'Model [1m72 - 70kg]. Quần size L.

---

. Lớp ngoài sử dụng GRDC Standard™ Fabric: 94% cotton 6% spandex, co dãn 4 chiều, ít nhăn, thấm hút tốt và mát mẻ, không tồn dư hóa chất gây ung thư, độ cầm màu cấp 4-5.

. Lớp trong sử dụng thun lạnh, giúp quần thoáng mát, mềm mịn, và dễ chịu khi tiếp xúc với da.

. Giúp giảm đen da tối đa nhờ chất liệu vải chống tia UV (tia cực tím) lên đến 50+, tương đương với khả năng chống đến 98% tia UV gây hại. Tính năng đặc biệt này giúp hạn chế quá trình hình thành hắc tố melanin - sắc tố đen gây sẫm màu da.

. Túi ẩn khóa kéo YKK Nhật chính hãng. Để điện thoại và đồ quý giá luôn an toàn.

. Giặt máy thoải mái.

Phù hợp để đi chơi. Nếu không đi chơi có thể dùng để đi ngủ. Một công đôi việc.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L4')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'28', N'QSBS1', N'BasicShorts01.png, BasicShorts02.png, BasicShorts03.png, BasicShorts04.png, BasicShorts05.png, BasicShorts06.png, BasicShorts07.png, BasicShorts08.png', N'Basic shorts // White', CAST(369000 AS Decimal(18, 0)), N'XL', N'White', 5, N'Model [1m72 - 70kg]. Quần size L.

---

. Lớp ngoài sử dụng GRDC Standard™ Fabric: 94% cotton 6% spandex, co dãn 4 chiều, ít nhăn, thấm hút tốt và mát mẻ, không tồn dư hóa chất gây ung thư, độ cầm màu cấp 4-5.

. Lớp trong sử dụng thun lạnh, giúp quần thoáng mát, mềm mịn, và dễ chịu khi tiếp xúc với da.

. Giúp giảm đen da tối đa nhờ chất liệu vải chống tia UV (tia cực tím) lên đến 50+, tương đương với khả năng chống đến 98% tia UV gây hại. Tính năng đặc biệt này giúp hạn chế quá trình hình thành hắc tố melanin - sắc tố đen gây sẫm màu da.

. Túi ẩn khóa kéo YKK Nhật chính hãng. Để điện thoại và đồ quý giá luôn an toàn.

. Giặt máy thoải mái.

Phù hợp để đi chơi. Nếu không đi chơi có thể dùng để đi ngủ. Một công đôi việc.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L4')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'29', N'LSMG1', N'Monogram01.png, Monogram02.png, Monogram03.png, Monogram04.png, Monogram05.png, Monogram06.png, Monogram07.png, Monogram08.png', N'Áo thun tay dài Monogram // Đen', CAST(289000 AS Decimal(18, 0)), N'S', N'Black', 15, N'---

GRDC monogram architecture

Ý đồ là tạo nên những lớp thành phố chất chồng lên nhau, thành phố "GRDC" - một nơi của những điều thú vị và ngập tràn nắng ấm.

---

Thông tin kỹ thuật:

. Chất liệu: GRDC Standard™ Fabric: 94% cotton 6% spandex co dãn 4 chiều, ít nhăn, không xù, ít nhão, thấm hút tốt và mát mẻ, không tồn dư hóa chất gây ung thư, độ cầm màu cấp 4-5. Giặt máy thoải mái.

. Giúp giảm đen da tối đa nhờ chất liệu vải chống tia UV (tia cực tím) lên đến 50+, tương đương với khả năng chống đến 98% tia UV gây hại. Tính năng đặc biệt này giúp hạn chế quá trình hình thành hắc tố melanin - sắc tố đen gây sẫm màu da.

. Hình in: kéo lụa mực plastisol.

. Box logo dệt sau đó thêu đính vải.

Thông tin thêm: Để bảo quản phần hoạ tiết này, khi giặt vui lòng lộn mặt trái, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy. Khi giặt xong, hãy phơi lên ngay để tránh hình in bị tổn hại.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L2')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'30', N'LSMG1', N'Monogram01.png, Monogram02.png, Monogram03.png, Monogram04.png, Monogram05.png, Monogram06.png, Monogram07.png, Monogram08.png', N'Áo thun tay dài Monogram // Đen', CAST(289000 AS Decimal(18, 0)), N'M', N'Black', 15, N'---

GRDC monogram architecture

Ý đồ là tạo nên những lớp thành phố chất chồng lên nhau, thành phố "GRDC" - một nơi của những điều thú vị và ngập tràn nắng ấm.

---

Thông tin kỹ thuật:

. Chất liệu: GRDC Standard™ Fabric: 94% cotton 6% spandex co dãn 4 chiều, ít nhăn, không xù, ít nhão, thấm hút tốt và mát mẻ, không tồn dư hóa chất gây ung thư, độ cầm màu cấp 4-5. Giặt máy thoải mái.

. Giúp giảm đen da tối đa nhờ chất liệu vải chống tia UV (tia cực tím) lên đến 50+, tương đương với khả năng chống đến 98% tia UV gây hại. Tính năng đặc biệt này giúp hạn chế quá trình hình thành hắc tố melanin - sắc tố đen gây sẫm màu da.

. Hình in: kéo lụa mực plastisol.

. Box logo dệt sau đó thêu đính vải.

Thông tin thêm: Để bảo quản phần hoạ tiết này, khi giặt vui lòng lộn mặt trái, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy. Khi giặt xong, hãy phơi lên ngay để tránh hình in bị tổn hại.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L2')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'31', N'LSMG1', N'Monogram01.png, Monogram02.png, Monogram03.png, Monogram04.png, Monogram05.png, Monogram06.png, Monogram07.png, Monogram08.png', N'Áo thun tay dài Monogram // Đen', CAST(289000 AS Decimal(18, 0)), N'L', N'Black', 15, N'---

GRDC monogram architecture

Ý đồ là tạo nên những lớp thành phố chất chồng lên nhau, thành phố "GRDC" - một nơi của những điều thú vị và ngập tràn nắng ấm.

---

Thông tin kỹ thuật:

. Chất liệu: GRDC Standard™ Fabric: 94% cotton 6% spandex co dãn 4 chiều, ít nhăn, không xù, ít nhão, thấm hút tốt và mát mẻ, không tồn dư hóa chất gây ung thư, độ cầm màu cấp 4-5. Giặt máy thoải mái.

. Giúp giảm đen da tối đa nhờ chất liệu vải chống tia UV (tia cực tím) lên đến 50+, tương đương với khả năng chống đến 98% tia UV gây hại. Tính năng đặc biệt này giúp hạn chế quá trình hình thành hắc tố melanin - sắc tố đen gây sẫm màu da.

. Hình in: kéo lụa mực plastisol.

. Box logo dệt sau đó thêu đính vải.

Thông tin thêm: Để bảo quản phần hoạ tiết này, khi giặt vui lòng lộn mặt trái, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy. Khi giặt xong, hãy phơi lên ngay để tránh hình in bị tổn hại.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L2')
INSERT [dbo].[Product] ([Product_Id], [Product_Num], [Product_Image], [Product_Name], [Product_Price], [Size], [Color], [Amount], [Product_Decription], [Create_at], [Category_Id]) VALUES (N'32', N'LSMG1', N'Monogram01.png, Monogram02.png, Monogram03.png, Monogram04.png, Monogram05.png, Monogram06.png, Monogram07.png, Monogram08.png', N'Áo thun tay dài Monogram // Đen', CAST(289000 AS Decimal(18, 0)), N'XL', N'Black', 15, N'---

GRDC monogram architecture

Ý đồ là tạo nên những lớp thành phố chất chồng lên nhau, thành phố "GRDC" - một nơi của những điều thú vị và ngập tràn nắng ấm.

---

Thông tin kỹ thuật:

. Chất liệu: GRDC Standard™ Fabric: 94% cotton 6% spandex co dãn 4 chiều, ít nhăn, không xù, ít nhão, thấm hút tốt và mát mẻ, không tồn dư hóa chất gây ung thư, độ cầm màu cấp 4-5. Giặt máy thoải mái.

. Giúp giảm đen da tối đa nhờ chất liệu vải chống tia UV (tia cực tím) lên đến 50+, tương đương với khả năng chống đến 98% tia UV gây hại. Tính năng đặc biệt này giúp hạn chế quá trình hình thành hắc tố melanin - sắc tố đen gây sẫm màu da.

. Hình in: kéo lụa mực plastisol.

. Box logo dệt sau đó thêu đính vải.

Thông tin thêm: Để bảo quản phần hoạ tiết này, khi giặt vui lòng lộn mặt trái, sử dụng túi giặt, cũng như không sử dụng chế độ sấy của máy. Khi giặt xong, hãy phơi lên ngay để tránh hình in bị tổn hại.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), N'L2')
GO
ALTER TABLE [dbo].[Customer_Address]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[Customer] ([UserName])
GO
ALTER TABLE [dbo].[Customer_Payment]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[Customer] ([UserName])
GO
ALTER TABLE [dbo].[Customer_Product]  WITH CHECK ADD  CONSTRAINT [fk_Customer] FOREIGN KEY([UserName])
REFERENCES [dbo].[Customer] ([UserName])
GO
ALTER TABLE [dbo].[Customer_Product] CHECK CONSTRAINT [fk_Customer]
GO
ALTER TABLE [dbo].[Customer_Product]  WITH CHECK ADD  CONSTRAINT [fk_Product] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Product_Id])
GO
ALTER TABLE [dbo].[Customer_Product] CHECK CONSTRAINT [fk_Product]
GO
ALTER TABLE [dbo].[OrderTb]  WITH CHECK ADD FOREIGN KEY([Payment_Id])
REFERENCES [dbo].[Payment] ([Payment_Id])
GO
ALTER TABLE [dbo].[OrderTb]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[Customer] ([UserName])
GO
ALTER TABLE [dbo].[OrderTb_Product]  WITH CHECK ADD  CONSTRAINT [fk_OrderTb] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[OrderTb] ([Order_Id])
GO
ALTER TABLE [dbo].[OrderTb_Product] CHECK CONSTRAINT [fk_OrderTb]
GO
ALTER TABLE [dbo].[OrderTb_Product]  WITH CHECK ADD  CONSTRAINT [fk_Product1] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Product_Id])
GO
ALTER TABLE [dbo].[OrderTb_Product] CHECK CONSTRAINT [fk_Product1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
USE [master]
GO
ALTER DATABASE [Sovereign] SET  READ_WRITE 
GO
