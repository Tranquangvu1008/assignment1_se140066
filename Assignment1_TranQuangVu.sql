USE [master]
GO
/****** Object:  Database [Assignment1_TranQuangVu]    Script Date: 3/16/2021 9:27:03 AM ******/
CREATE DATABASE [Assignment1_TranQuangVu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1_TranQuangVu', FILENAME = N'E:\App\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_TranQuangVu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment1_TranQuangVu_log', FILENAME = N'E:\App\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_TranQuangVu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1_TranQuangVu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET QUERY_STORE = OFF
GO
USE [Assignment1_TranQuangVu]
GO
/****** Object:  Table [dbo].[tblItems]    Script Date: 3/16/2021 9:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblItems](
	[itemID] [varchar](10) NOT NULL,
	[itemName] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[description] [varchar](200) NULL,
	[picture] [varchar](500) NULL,
	[price] [float] NOT NULL,
	[createDate] [datetime] NULL,
	[category] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tblFoodDrinks] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/16/2021 9:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[itemID] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 3/16/2021 9:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[totalPrice] [float] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 3/16/2021 9:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](50) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblShippingDetails]    Script Date: 3/16/2021 9:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShippingDetails](
	[ShippingID] [int] IDENTITY(1,1) NOT NULL,
	[ShippingUser] [varchar](50) NOT NULL,
	[ShippingEmail] [varchar](50) NOT NULL,
	[ShippingPhone] [varchar](50) NOT NULL,
	[ShippingAddress] [varchar](50) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[orderID] [int] NOT NULL,
 CONSTRAINT [PK_tblShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUpdate]    Script Date: 3/16/2021 9:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUpdate](
	[updateID] [int] IDENTITY(1,1) NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[content] [varchar](100) NOT NULL,
	[userID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblUpdate1] PRIMARY KEY CLUSTERED 
(
	[updateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/16/2021 9:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[roleID] [varchar](50) NOT NULL,
	[phoneNumber] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'BK', N'Burger King Whopper', 1, N'Job', N'https://burgerking.vn/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/w/h/whopperjr_1.jpg', 5, CAST(N'2021-01-15T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'BM', N'Banh Mi', 1, N'Amazing Good job em', N'https://i.pinimg.com/originals/3f/58/47/3f5847ede58b1a0a4f0b135daee470b2.png', 3.5, CAST(N'2021-04-03T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'BMads', N'Matcha ice blended', 0, N'Ice cream like a crush', N'https://s1.storage.hochoimoingay.com/image/2014/11/moi-tai-ve-bo-hinh-nen-moi-cua-samsung-galaxy-note-4-1416525036-546e74ecbc5b2.jpg', 3, CAST(N'2021-01-19T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'BS', N'	Panera Bread Broccoli Cheddar Soup', 1, N'DA QUA PEPSI OI', N'https://www.kroger.com/product/images/xlarge/front/0007795869391', 20, CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'CI', N'Chick-fil-A Iced Tea', 1, N'NOT BAD', N'https://i.pinimg.com/originals/4d/a7/64/4da7641dd790fa45d17a7b66726ac5a6.png', 9, CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'Drink', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'CW', N'Culver''s Wisconsin Cheese Curds', 1, N'NGON', N'https://i1.wp.com/burgerbeast.com/wp-content/uploads/2013/10/Culvers-02.jpg?resize=1000%2C1000&ssl=1', 10, CAST(N'2021-01-09T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'DQ', N'Dairy Queen Blizzard', 1, N'La qua', N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dairy-queen-double-fudge-cookie-dough-blizzard-1580141817.jpg', 15, CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Drink', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'FF', N'McDonald’s French Fries', 1, N'Em', N'https://scoopempire.com/wp-content/uploads/2015/09/qq_whatsinside_fries_f.jpg', 3, CAST(N'2021-01-13T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'HB', N'McDonald''s Hash Browns', 1, N'mckid', N'https://ih1.redbubble.net/image.1417174327.3060/ur,coaster_pack_4_flatlay,square,1000x1000.2.jpg', 7, CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'IC', N'Ice Cream', 0, N'Ice cream like a crush', N'https://s1.storage.hochoimoingay.com/image/2014/11/moi-tai-ve-bo-hinh-nen-moi-cua-samsung-galaxy-note-4-1416525036-546e74ecbc5b2.jpg', 1, CAST(N'2021-01-19T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'ICqwe', N'Ice Cream', 0, N'Ice cream like a crush', N'https://s1.storage.hochoimoingay.com/image/2014/11/moi-tai-ve-bo-hinh-nen-moi-cua-samsung-galaxy-note-4-1416525036-546e74ecbc5b2.jpg', 5, CAST(N'2021-01-19T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'JB', N'Jack in the Box Curly Fries', 1, N'trui ui them qua', N'https://s3-media0.fl.yelpcdn.com/bphoto/9qqGmKoGN8Ar7xeE9mVnbg/o.jpg', 11, CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'KFC', N'KFC Original Recipe Chicken', 1, N'Good ', N'https://omgchocolatedesserts.com/wp-content/uploads/2017/01/Best-Fried-Chicken-KFC-Copycat-2.jpg', 4, CAST(N'2021-01-05T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'KK', N'Krispy Kreme Original Glazed Doughnuts
', 1, N'Ngon ngon ngon', N'https://pbs.twimg.com/media/EW9I8zFXkAE04Hj.jpg', 5, CAST(N'2021-01-03T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'MC', N'Matcha Ice Blenced', 0, N'Good', N'https://www.thirstyfortea.com/wp-content/uploads/2016/04/ice-green-tea-latte-3-2.jpg', 5, CAST(N'2021-05-06T00:00:00.000' AS DateTime), N'Drink', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'PB', N'Panera Bread', 1, N'True true true', N'https://s3-media0.fl.yelpcdn.com/bphoto/P0pUr3OYFnjIpJ9csnIPcA/o.jpg', 13, CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'PC', N'Panda Express Kung Pao Chicken', 1, N'so beautiful honey', N'https://s3-media0.fl.yelpcdn.com/bphoto/FhHTCIYCPFj0zKSjSWWiQA/o.jpg', 15, CAST(N'2021-01-19T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'PZ', N'Pizza', 1, N'Oke man', N'https://tophaiphong.com/wp-content/uploads/2020/07/Qu%C3%A1n-Pizza-Ngon-H%E1%BA%A3i-Ph%C3%B2ng-6.jpg', 10, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'SA', N'Starbucks Americano', 1, N'Amazing', N'https://images.dailyhive.com/20201105155940/Peppermint-Mocha.png', 7.5, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'Drink', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'SC', N'Subway Cookies', 1, N'Dry dfa', N'https://wifetch.com/assets/uploads/product/c8dd9c8a97e630002b3dc33ba6c4f40a-cookies.jpg', 2, CAST(N'2021-01-15T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'SCL', N'Sonic Cherry Limeade', 1, N'Ui la ngon', N'https://i.pinimg.com/originals/aa/05/44/aa05440efc43c8df7c4a0090d024b3d6.jpg', 10, CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Drink', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'SM', N'Starbucks Macchiato', 1, N'OKAYYYY', N'https://www.bestwaywholesale.co.uk/img/products/1000/0/5760466920490.jpg', 15, CAST(N'2021-01-09T00:00:00.000' AS DateTime), N'Drink', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'SP', N'Starbucks Pumpkin Spice Latte', 1, N'Great', N'https://stories.starbucks.com/uploads/sites/17/2018/08/psl.jpg', 12, CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'Drink', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'TB', N'Taco Bell Burrito Supreme', 1, N'oH NO', N'https://dynl.mktgcdn.com/p/ZIj4TpmovX0O7vGPQdfZJscaQX7Sd1WWTIvQ7pNfDYk/1000x1000.jpg', 5, CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'WCS', N'White Castle Sliders', 1, N'Ngon lem', N'https://www.kroger.com/product/images/xlarge/front/0008298801088', 6, CAST(N'2021-01-10T00:00:00.000' AS DateTime), N'Food', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'WF', N'Wendy''s Frosty', 1, N'Trui ui ngon', N'https://www.manilaonsale.com/wp-content/uploads/2017/08/img_9847.jpg', 9, CAST(N'2021-01-09T00:00:00.000' AS DateTime), N'Drink', 20)
INSERT [dbo].[tblItems] ([itemID], [itemName], [status], [description], [picture], [price], [createDate], [category], [quantity]) VALUES (N'WP', N'Wendy''s Baked Potato', 1, N'Boring', N'https://pbs.twimg.com/media/DU6_MTeUQAAmo2p.jpg', 8.5, CAST(N'2021-01-11T00:00:00.000' AS DateTime), N'Food', 20)
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'Ad', N'Admin')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'Us', N'User')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [phoneNumber], [email], [address], [status]) VALUES (N'admin', N'Admin', N'123456', N'Ad', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [phoneNumber], [email], [address], [status]) VALUES (N'user', N'User', N'123456', N'Us', NULL, NULL, NULL, 1)
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblItems] FOREIGN KEY([itemID])
REFERENCES [dbo].[tblItems] ([itemID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblItems]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblShippingDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblShippingDetails] CHECK CONSTRAINT [FK_tblShippingDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblShippingDetails_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblShippingDetails] CHECK CONSTRAINT [FK_tblShippingDetails_tblUsers]
GO
ALTER TABLE [dbo].[tblUpdate]  WITH CHECK ADD  CONSTRAINT [FK_tblUpdate_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblUpdate] CHECK CONSTRAINT [FK_tblUpdate_tblUsers]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [fk_roleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [fk_roleID]
GO
USE [master]
GO
ALTER DATABASE [Assignment1_TranQuangVu] SET  READ_WRITE 
GO
