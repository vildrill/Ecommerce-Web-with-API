USE [net19_project1]
GO
/****** Object:  Table [dbo].[Adv]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adv](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Photo] [nvarchar](500) NULL,
	[Position] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[Create_at] [date] NULL,
	[Update_at] [date] NULL,
	[Description] [nvarchar](4000) NULL,
	[Content] [ntext] NULL,
	[Photo] [nvarchar](4000) NULL,
	[Video] [nvarchar](4000) NULL,
 CONSTRAINT [PK_dbo_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[DisplayHomePage] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriesProducts]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_CategoriesProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Create] [date] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_orders_detail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](4000) NULL,
	[Description] [nvarchar](4000) NULL,
	[Content] [ntext] NULL,
	[Photo] [nvarchar](4000) NULL,
	[Hot] [int] NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Star] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Photo] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[SubTitle] [nvarchar](500) NULL,
	[Info] [nvarchar](500) NULL,
	[Link] [nvarchar](500) NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsProducts]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_TagsProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/26/2023 1:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adv] ON 

INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (22, N'Adv 1', N'category-1.jpg', 1)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (23, N'Adv 2', N'category-2.jpg', 2)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (24, N'Adv 3', N'category-3.jpg', 3)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (25, N'Adv 4', N'category-4.jpg', 4)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (29, N'Adv 5', N'category-5.jpg', 5)
SET IDENTITY_INSERT [dbo].[Adv] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (3, N'Tile', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p>dasafsdfsdf</p>', N'<p>adsdfsfdsf</p>', N'133220297727865447_11171715_5e380167dd.jpeg', N'https://www.youtube.com/embed/AsvyQIchbhI')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (4, N'Nilou', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p>Test</p>', N'<p>Test 02</p>', N'133220334161543189_1280084.jpg', N'https://www.youtube.com/embed/cqCMakOE8Go')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (5, N'Ganyu Genshin Impact', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p>Lorem ipsum dolor sit amet, an munere tibique consequat mel, congue albucius no qui, a t everti meliore erroribus sea. ro cum. Sea ne accusata voluptatibus. Ne cum falli dolor voluptua, duo ei sonet choro facilisis, labores officiis torquatos cum ei.</p>

<p>Cum altera mandamus in, mea verear disputationi et. Vel regione discere ut, legere expetenda ut eos. In nam nibh invenire similique. Atqui mollis ea his, ius graecis accommodare te. No eam tota nostrum eque. Est cu nibh clita. Sed an nominavi, et stituto, duo id rebum lucilius. Te eam iisque deseruisse, ipsum euismod his at. Eu putent habemus voluptua sit, sit cu rationibus scripserit, modus taria .</p>

<p>experian soleat maluisset per. Has eu idque similique, et blandit scriptorem tatibus mea. Vis quaeque ocurreret ea.cu bus scripserit, modus voluptaria ex per.</p>', N'<p>fsadfasdf</p>', N'133220334562171620_genshin-impact-ganyu-genshin-impact-hd-wallpaper-preview.jpg', N'https://www.youtube.com/embed/xqQVlEHGW4U')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (6, N'Tại sao ngày càng nhiều trái ác quỷ thức tỉnh xuất hiện trong One Piece?', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p>Sự thức tỉnh của tr&aacute;i &aacute;c quỷ l&agrave; một điều hiếm khi xảy ra trong thế giới One Piece cho đến cốt truyện Wano. Vậy&nbsp;điều g&igrave; c&oacute; thể l&agrave; l&yacute; do khiến rất nhiều sự thức tỉnh tr&aacute;i &aacute;c quỷ xuất hiện?</p>

<p>L&yacute; do những người sử dụng tr&aacute;i &aacute;c quỷ thức tỉnh dần dần xuất hiện thường xuy&ecirc;n hơn rất đơn giản. Bởi c&agrave;ng về cuối, những trận chiến trong One Piece c&agrave;ng trở n&ecirc;n khốc liệt hơn, khi những sức mạnh mới được giới thiệu.</p>', N'<p>Kh&ocirc;ng n&oacute;i đ&acirc;u xa, một trong những trận chiến ho&agrave;nh tr&aacute;ng gần đ&acirc;y nhất l&agrave; cuộc chiến của c&aacute;c Si&ecirc;u t&acirc;n tinh với Tứ Ho&agrave;ng Kaido ở Wano quốc. Trước một đối thủ kh&ocirc;ng chỉ ăn tr&aacute;i &aacute;c quỷ Zoan thần thoại, lại c&ograve;n l&agrave; bậc thầy của tất cả c&aacute;c dạng Haki, thậm ch&iacute; được mệnh danh l&agrave; &quot;Sinh vật mạnh nhất thế giới&quot; th&igrave; c&aacute;c Si&ecirc;u t&acirc;n tinh phải l&agrave;m thế n&agrave;o mới đương đầu được đ&acirc;y.</p>

<p>Mặc d&ugrave; Luffy hay Law rất mạnh, nhưng họ vẫn chỉ l&agrave; những t&ecirc;n cướp biển mới, hay l&agrave; những tay mơ mới bước v&agrave;o ngưỡng cửa của những kẻ mạnh m&agrave; th&ocirc;i. Thế n&ecirc;n, việc đối mặt với một Tứ Ho&agrave;ng sẽ l&agrave; điều kh&ocirc;ng thể, trừ khi c&oacute; ph&eacute;p m&agrave;u xảy ra.&nbsp;Do đ&oacute;, t&aacute;c giả Oda cần phải trao cho Luffy, Law v&agrave; thậm ch&iacute; cả Kid sức mạnh của tr&aacute;i &aacute;c quỷ khi được thức tỉnh.</p>

<p>Như đ&atilde; thấy, sau khi thức tỉnh tr&aacute;i &aacute;c quỷ Gomu Gomu (từng được nhận định thuộc hệ&nbsp;Paramecia), hay ch&iacute;nh x&aacute;c hơn l&agrave; tr&aacute;i Hito Hito no Mi, mẫu: Nika (thuộc hệ Zoan thần thoại), Luffy đ&atilde; trở n&ecirc;n cực kỳ mạnh mẽ v&agrave; kh&oacute; đối ph&oacute; hơn hẳn. Với tất cả sức mạnh của m&igrave;nh, cậu c&oacute; thể dễ d&agrave;ng &aacute;p đảo ngay cả một đối thủ mạnh như Kaido.&nbsp;Nếu kh&ocirc;ng c&oacute; những kỹ năng nhờ thức tỉnh tr&aacute;i &aacute;c quỷ, Mũ Rơm sẽ ho&agrave;n to&agrave;n thua cuộc trong một cuộc chiến do ch&iacute;nh anh ta khởi xướng.</p>

<p>Cuối c&ugrave;ng, Luffy đ&atilde; đ&aacute;nh bại Kaido bằng ch&iacute;nh đ&ocirc;i tay của m&igrave;nh, vươn l&ecirc;n trở th&agrave;nh một t&acirc;n Tứ Ho&agrave;ng, v&agrave; chỉ c&ograve;n một số &iacute;t người tr&ecirc;n thế giới thực sự c&oacute; thể chiến đấu với cậu.</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2023/2/27/base64-1677233114666700649875-1677466314558-16774663146201283345468-1677472035673-16774720357531376064682.png" target="_blank" title=""><img alt="Tại sao ngày càng nhiều trái ác quỷ thức tỉnh xuất hiện trong One Piece? - Ảnh 3." src="https://gamek.mediacdn.vn/133514250583805952/2023/2/27/base64-1677233114666700649875-1677466314558-16774663146201283345468-1677472035673-16774720357531376064682.png" title="Tại sao ngày càng nhiều trái ác quỷ thức tỉnh xuất hiện trong One Piece? - Ảnh 3." /></a></p>

<p>Hiện tại, One Piece sẽ đi đến cốt truyện gay cấn nhất từng c&oacute; để kh&eacute;p lại h&agrave;nh tr&igrave;nh phi&ecirc;u lưu của Luffy, n&ecirc;n những đối thủ trong tương lai của Luffy cũng cần được n&acirc;ng cấp. Oda vẫn thỉnh thoảng giới thiệu một số nh&acirc;n vật phản diện nhỏ để c&acirc;u chuyện tiếp tục, v&agrave; những kẻ n&agrave;y sẽ cần nhiều thứ hơn l&agrave; Haki hay sức mạnh tr&aacute;i &aacute;c quỷ đơn thuần để đối mặt được với Luffy.&nbsp;Do đ&oacute;, việc thức tỉnh tr&aacute;i &aacute;c quỷ l&agrave; cần thiết v&agrave; sẽ trở n&ecirc;n phổ biến hơn.</p>', N'133220507911747780_Blog2.jpg', N'https://www.youtube.com/embed/_Kyq0T3qe4w')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (7, N'ĐẠI CHIẾN TITAN CÔNG BỐ TRAILER MỚI, "ÚP MỞ" VỀ CA KHÚC MỞ ĐẦU!', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p><strong>V&agrave;o h&ocirc;m thứ bảy vừa qua, một chương tr&igrave;nh đặc biệt đ&atilde; ph&aacute;t h&agrave;nh trailer ch&iacute;nh thức cho nửa đầu ti&ecirc;n của bộ anime truyền h&igrave;nh&nbsp;<em>Shingeki no Kyojin The Final Season Kanketsu-hen</em>. Đ&acirc;y l&agrave; trailer cho phi&ecirc;n bản anime d&agrave;i hơn một giờ đồng hồ sắp được ph&aacute;t h&agrave;nh trong thời gian sắp tới.</strong></p>', N'<p>Trong th&ocirc;ng b&aacute;o mới nhất cũng đ&atilde; x&aacute;c nhận, ban nhạc SIM sẽ quay trở lại để tr&igrave;nh b&agrave;y cho ca kh&uacute;c mở đầu, &quot;Under the Tree&quot; (Tạm dịch: &quot;Dưới t&aacute;n c&acirc;y&quot;). MAH, người đ&atilde; viết lời cho ca kh&uacute;c &quot;Under the Tree&quot; đ&atilde; chia sẻ về việc c&ocirc;ng bố ca kh&uacute;c muộn để kh&ocirc;ng tiết lộ qu&aacute; nhiều về b&agrave;i h&aacute;t n&agrave;y v&agrave; chỉ hy vọng mọi người sẽ được lắng nghe n&oacute; trong bộ phim. Thậm ch&iacute;, trailer ch&iacute;nh thức cũng kh&ocirc;ng hề &quot;nh&aacute; h&agrave;ng&quot; một t&yacute; g&igrave; về ca kh&uacute;c.</p>

<p>&nbsp;</p>

<p><img src="https://s199.imacdn.com/ta/2023/02/26/a642a73189ebc6a7_4e337b9b92076cbd_15597116773871923185710.jpg" /></p>

<p>&nbsp;</p>

<p>Hồi đầu ti&ecirc;n của phần 3 m&ugrave;a cuối c&ugrave;ng cho&nbsp;<em>Đại chiến Titan</em>&nbsp;sẽ được ph&aacute;t s&oacute;ng k&eacute;o d&agrave;i một giờ đồng hồ v&agrave;o khuya ng&agrave;y 3 th&aacute;ng 3, rạng s&aacute;ng ng&agrave;y 4 th&aacute;ng 3.</p>', N'133220509785286414_Blog3.jpg', N'https://www.youtube.com/embed/r7MosyoAUhQ')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (8, N'ANIME LYCORIS RECOIL SẼ SỚM TRỞ LẠI!', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p><strong>T&agrave;i khoản Twitter ch&iacute;nh thức cho anime&nbsp;<em>Lycoris Recoil&nbsp;</em>đ&atilde; th&ocirc;ng b&aacute;o rằng việc sản xuất dự &aacute;n phim mới đ&atilde; được bật đ&egrave;n xanh. C&ugrave;ng với khẩu hiệu: &quot;C&acirc;u chuyện của họ... vẫn chưa kết th&uacute;c&quot;.</strong></p>', N'<p>Th&ocirc;ng b&aacute;o đ&atilde; được đưa ra trong sự kiện &quot;Lycoris Recoil Caf&eacute; Presents After Party! Tomorrow is another day&quot;.</p>

<p>&nbsp;</p>

<p>Phim đ&atilde; được c&ocirc;ng chiếu v&agrave;o ng&agrave;y 2 th&aacute;ng 7 năm 2022.</p>

<p>&nbsp;</p>

<p><img src="https://s199.imacdn.com/ta/2023/02/12/7740744fc2710b76_64ad836af4f12adb_30129516761958352734221.jpg" /></p>

<p>&nbsp;</p>

<p><em>C&acirc;u chuyện về một tổ chức b&iacute; mật ngăn chặn tội &aacute;c: &ldquo;DA - Direct Attack&rdquo;, v&agrave; nh&oacute;m đặc vụ to&agrave;n nữ của họ: &ldquo;Lycoris&rdquo;. Cuộc sống trở n&ecirc;n b&igrave;nh y&ecirc;n đều l&agrave; nhờ những c&ocirc; g&aacute;i trẻ n&agrave;y. Chisato Nishikigi l&agrave; đặc vụ Lycoris mạnh nhất mọi thời đại. B&ecirc;n cạnh c&ocirc; l&agrave; Takina Inoue, cũng l&agrave; một Lycoris t&agrave;i năng. Họ l&agrave;m việc c&ugrave;ng nhau tại Caf&eacute; LycoReco, một trong những chi nh&aacute;nh của tổ chức.</em></p>

<p>&nbsp;</p>

<p><em>Tại đ&acirc;y, c&aacute;c đơn h&agrave;ng m&agrave; qu&aacute;n c&agrave; ph&ecirc; n&agrave;y nhận rất đa dạng, từ c&agrave; ph&ecirc;, b&aacute;nh kẹo đến tr&ocirc;ng trẻ, mua sắm, dạy tiếng Nhật cho sinh vi&ecirc;n nước ngo&agrave;i, v.v. Đ&oacute; hầu hết l&agrave; những c&ocirc;ng việc kh&ocirc;ng ph&ugrave; hợp với Lycoris.</em></p>

<p>&nbsp;</p>

<p>Bộ phim l&agrave; t&aacute;c phẩm đầu tay của đạo diễn&nbsp;<strong>Adachi</strong>.&nbsp;</p>', N'133220513410704576_Blog4.jpg', N'https://www.youtube.com/embed/8R365_tkFBg')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (9, N'LISA (BLACKPINK) HÓA THÂN THÀNH ANYA TRONG SPY X FAMILY!?', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p><strong>Lisa, th&agrave;nh vi&ecirc;n của một ban nhạc H&agrave;n Quốc BLACKPINK nổi tiếng đ&atilde; rất đ&aacute;ng y&ecirc;u trong ngoại h&igrave;nh th&ocirc;ng thường nhưng c&ocirc; đ&atilde; trở n&ecirc;n dễ thương hơn nữa khi h&oacute;a th&acirc;n th&agrave;nh Anya Forger. Tr&ecirc;n mạng x&atilde; hội, đặc biệt l&agrave; Facebook v&agrave; Tiktok th&igrave; những h&igrave;nh ảnh của Lisa với m&aacute;i t&oacute;c hồng đ&atilde; được lan truyền rộng r&atilde;i.</strong></p>

<p>&nbsp;</p>', N'<p>Như vậy, chẳng kh&aacute;c g&igrave; Lisa cũng thưởng thức anime? V&agrave; liệu những h&igrave;nh ảnh lan truyền tr&ecirc;n mạng x&atilde; hội l&agrave; do Lisa tự cosplay hay được photoshop lại?&nbsp;</p>

<p>Trong một cuộc phỏng vấn mới đ&acirc;y th&igrave; nữ ca sĩ K-POP nổi tiếng tiết lộ bản th&acirc;n c&ocirc; đ&atilde; xem Spy x Family v&agrave; thấy c&ocirc; b&eacute; t&oacute;c hồng (&aacute;m chỉ) Anya rất dễ thương.</p>

<p>&nbsp;</p>

<p><img src="https://s199.imacdn.com/ta/2022/07/21/74b35fae06e51df3_4476124f862e470c_16197416583364566185710.jpg" /></p>

<p><img src="https://s199.imacdn.com/ta/2022/07/21/c790d84d75af6620_0355e04911a3243c_18985016583364647185710.jpg" /></p>

<p>&nbsp;</p>

<p>Trong cuộc phỏng vấn với Marie Claire Trung Quốc, Lisa được hỏi: &quot;C&ocirc; thường xả stress như thế n&agrave;o?&quot;</p>

<p><em>Th&ocirc;ng thường, t&ocirc;i chơi với m&egrave;o, nhưng những ng&agrave;y gần đ&acirc;y, t&ocirc;i hay xem phim hoạt h&igrave;nh. T&ocirc;i đang xem Spy x Family v&agrave; c&ocirc; g&aacute;i c&oacute; m&aacute;i t&oacute;c hồng rất dễ thương. T&ocirc;i nghĩ rằng qu&aacute; tr&igrave;nh xem n&oacute; đ&atilde; chữa l&agrave;nh bản th&acirc;n m&igrave;nh rất nhiều.</em></p>

<p>Tuy những h&igrave;nh ảnh tr&ecirc;n của Lisa l&agrave; vẫn chưa r&otilde; l&agrave; c&ocirc; tự cosplay hay l&agrave; do photoshop nhưng vẫn c&oacute; thể x&aacute;c định bản th&acirc;n nữ ca sĩ K-POP n&agrave;y cũng đ&atilde; xem qua Spy x Family v&agrave; y&ecirc;u th&iacute;ch nh&acirc;n vật Anya.</p>', N'133220515299462583_Blog6.jpg', N'https://www.youtube.com/embed/YOIJOJsUkUg')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (10, N'[FANMADE] ANYA ĐẤM MỘT PHÁT SAITAMA VÀ GOKU PHẢI BAY MÀU!', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p><strong>Dạo gần đ&acirc;y tr&ecirc;n một số trang mạng x&atilde; hội quốc tế th&igrave; nhiều người h&acirc;m mộ đ&atilde; s&aacute;ng tạo v&agrave; vẽ n&ecirc;n một c&acirc;u chuyện khi Anya Forger c&oacute; khả năng đ&aacute;nh bại được những nh&acirc;n vật tầm cỡ trong c&aacute;c c&acirc;u chuyện shounen như Goku v&agrave; Saitama.&nbsp;</strong></p>', N'<p>Đoạn video đ&atilde; được một YouTuber c&oacute; t&ecirc;n Animeiko thực hiện v&agrave; đăng tải d&agrave;i tập. Nhưng trong một tập được YouTuber n&agrave;y vẽ v&agrave; diễn họa v&agrave;o ng&agrave;y 9 th&aacute;ng 7 năm 2022 lại được cộng đồng mạng cười th&iacute;ch th&uacute; khi Anya đ&atilde; hạ gục được &quot;đấm ph&aacute;t chết lu&ocirc;n&quot; Saitama.</p>

<p>Về đoạn video của Goku th&igrave; đ&atilde; được YouTuber n&agrave;y đăng tải v&agrave;o ng&agrave;y 1 th&aacute;ng 6 năm 2022 khi Anya sử dụng c&aacute;c kỹ năng được dạy bởi Piccolo, người m&agrave; c&ocirc; n&agrave;ng n&agrave;y y&ecirc;u mến v&agrave; gọi l&agrave; &quot;hạt đậu phộng xanh&quot;.</p>

<p>Nhiều người h&acirc;m mộ đ&atilde; được một pha &quot;cười vỡ bụng&quot; v&agrave; ca ngợi nỗ lực của YouTuber trong việc s&aacute;ng tạo c&aacute;c video.&nbsp;</p>

<p><em>T&ocirc;i rất cảm k&iacute;ch việc bạn đ&atilde; thiết kế nh&acirc;n vật cũng như diễn họa v&ocirc; c&ugrave;ng tr&ocirc;i chảy m&agrave; kh&ocirc;ng hề nh&aacute;m ch&aacute;n. Vượt qua sự mong đợi của t&ocirc;i đối với một t&aacute;c phẩm fanmade.</em></p>

<p><em>Hahaha... H&agrave;i qu&aacute; đi, t&ocirc;i rất th&iacute;ch th&uacute; khi thấy nh&acirc;n vật m&agrave; m&igrave;nh y&ecirc;u th&iacute;ch (Anya) trong nhiều bộ anime kh&aacute;c nhau. Hi vọng YouTuber Animeiko c&oacute; thể s&aacute;ng tạo th&ecirc;m nhiều video hấp dẫn kh&aacute;c nh&eacute;. T&ocirc;i sẽ ủng hộ!</em></p>

<p>&nbsp;</p>

<p><img src="https://s199.imacdn.com/ta/2022/07/28/77a0aa45ff43644a_8e041b70071c70c5_6224516590242181185710.jpg" /></p>

<p>Anya Forger l&agrave; một trong những nh&acirc;n vật biểu tượng cho bộ anime Spy x Family. C&ocirc; n&agrave;ng đ&atilde; g&acirc;y s&oacute;ng gi&oacute; v&ocirc; c&ugrave;ng lớn tr&ecirc;n to&agrave;n cầu trước sự dễ thương v&ocirc; bờ bến của m&igrave;nh.</p>', N'133220517461488937_Blog7.jpg', N'https://www.youtube.com/embed/U37C4ALj6cM')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (11, N'YOASOBI SẼ TRÌNH DIỄN CA KHÚC CHỦ ĐỀ CHO ANIME OSHI NO KO', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p><strong>Một sự kiện ph&aacute;t trực tiếp cho anime&nbsp;<em>Oshi no Ko</em>, chuyển thể từ manga của Aka Akasaka v&agrave; Mengo Yokoyari đ&atilde; đăng tải main trailer cho bộ phim, dự kiến sẽ l&ecirc;n s&oacute;ng v&agrave;o th&aacute;ng 4.</strong></p>', N'<p><strong>Rie Takahashi</strong>&nbsp;sẽ đ&oacute;ng vai thần tượng Ai.</p>

<p>&nbsp;</p>

<p>Bộ phim được đạo diễn bởi&nbsp;<strong>Daisuke Hiramaki</strong>&nbsp;v&agrave;&nbsp;<strong>Chao Nekotomi&nbsp;</strong>tại Doga Kobo, với kịch bản của&nbsp;<strong>Jin Tanaka</strong>.</p>

<p>&nbsp;</p>

<p><strong>YOASOBI</strong>&nbsp;thể hiện ca kh&uacute;c chủ đề &quot;Idol&quot;.</p>

<p>&nbsp;</p>

<p><strong>Akasaka</strong>&nbsp;v&agrave;&nbsp;<strong>Yokoyari</strong>&nbsp;đ&atilde; ra mắt manga tr&ecirc;n tạp ch&iacute; Weekly Young Jump của Shueisha v&agrave;o th&aacute;ng 4 năm 2020.&nbsp;</p>

<p>&nbsp;</p>

<p><img src="https://s199.imacdn.com/ta/2023/02/19/9b9b396e6a5e862d_d0b43e20b23efdb0_13443416768204885734221.jpg" /></p>

<p>&nbsp;</p>

<p><em>C&acirc;u chuyện bắt đầu với Goro, một b&aacute;c sĩ t&igrave;nh cờ xử l&yacute; ca sinh nở của thần tượng m&agrave; m&igrave;nh y&ecirc;u th&iacute;ch - Ai Hoshino, người đ&atilde; tạm ngừng hoạt động trong ng&agrave;nh giải tr&iacute; để sinh hai đứa con song sinh. Tuy nhi&ecirc;n, ngay trước khi Ai sinh ra, Gorō đ&atilde; chết v&igrave; một tai nạn, nhưng được t&aacute;i sinh th&agrave;nh một trong những đứa con của Ai, Aquamarine Hoshino, với k&yacute; ức ho&agrave;n to&agrave;n nguy&ecirc;n vẹn.</em></p>

<p>&nbsp;</p>

<p>Bộ truyện tranh đ&atilde; gi&agrave;nh vị tr&iacute; thứ nhất tại Tsugi ni Kuru Manga Taisho (Next Manga Awards) v&agrave;o năm 2021.</p>', N'133220519457067398_Blog8.jpg', N'https://www.youtube.com/embed/BQ28u-8c-hI')
INSERT [dbo].[Blog] ([Id], [Title], [Create_at], [Update_at], [Description], [Content], [Photo], [Video]) VALUES (12, N'YORU WA NEKO TO ISSHO - BỘ ANIME VỀ "HOÀNG THƯỢNG" CÔNG BỐ RA MẮT PHẦN HAI', CAST(N'2023-02-28' AS Date), CAST(N'2023-02-28' AS Date), N'<p><strong>Kadokawa đ&atilde; th&ocirc;ng b&aacute;o rằng anime&nbsp;</strong><em>Yoru wa Neko to Issho (Nights with a Cat)</em><strong>, chuyển thể từ manga của Kyuryu Z sẽ c&oacute; m&ugrave;a thứ hai trong năm nay.&nbsp;</strong></p>', N'<p>Đội ngũ sản xuất ch&iacute;nh:</p>

<ul>
	<li>Đạo diễn:&nbsp;<strong>Minoru Ashina&nbsp;</strong></li>
	<li>Bi&ecirc;n kịch:&nbsp;<strong>Minoru Ashina</strong>&nbsp;</li>
	<li>Studio:&nbsp;<strong>Puyukai</strong></li>
	<li>Thiết kế nh&acirc;n vật:<strong>&nbsp;Minoru Takehara</strong>&nbsp;</li>
	<li>Soạn nhạc:&nbsp;<strong>Kana Utatane</strong>&nbsp;</li>
	<li>Gi&aacute;m đốc &acirc;m thanh:&nbsp;<strong>Fumiyuki Go&nbsp;</strong></li>
</ul>

<p>Phần đầu ti&ecirc;n của anime được c&ocirc;ng chiếu tr&ecirc;n Tokyo MX v&agrave;o ng&agrave;y 3 th&aacute;ng 8 năm 2022.</p>

<p>&nbsp;</p>

<p><img src="https://s199.imacdn.com/ta/2023/01/13/3d9e9fc044261d06_e317b3f50c081f29_26766416735517244734221.jpg" /></p>

<p>&nbsp;</p>

<p><em>Khi Fuuta mệt mỏi trở về nh&agrave; v&agrave;o buổi tối, tất cả những g&igrave; anh muốn l&agrave;m l&agrave; d&agrave;nh thời gian cho b&eacute; m&egrave;o mới của m&igrave;nh. Tất cả những th&oacute;i quen v&agrave; c&aacute;ch cư xử b&iacute; ẩn của b&eacute; m&egrave;o đều được t&aacute;i hiện một c&aacute;ch cẩn thận trong bộ phim h&agrave;i thoải m&aacute;i v&agrave; dễ thương về việc sống c&ugrave;ng một quả cầu l&ocirc;ng đ&aacute;ng y&ecirc;u n&agrave;y!</em></p>

<p>&nbsp;</p>

<p><strong>Kyuryu Z&nbsp;</strong>lần đầu ti&ecirc;n đăng manga tr&ecirc;n t&agrave;i khoản Twitter c&aacute; nh&acirc;n, nơi bộ truyện đ&atilde; trở n&ecirc;n nổi tiếng.&nbsp;</p>', N'133220522523354386_Blog9.jpg', N'https://www.youtube.com/embed/JUAlvTjibfI')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (22, 0, N'T-Shirt', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (23, 0, N'Quần', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (24, 0, N'Hoodie', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (25, 0, N'Sweater', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (26, 0, N'Khẩu trang', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (27, 0, N'Mũ lười trai', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (28, 0, N'Móc khóa', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriesProducts] ON 

INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (69, 4, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (70, 5, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (71, 9, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (72, 12, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (73, 14, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (74, 15, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (75, 19, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (76, 20, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (77, 4, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (78, 5, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (79, 9, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (80, 10, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (81, 11, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (82, 12, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (83, 13, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (84, 14, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (85, 15, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (86, 19, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (87, 20, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (88, 3, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (89, 9, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (90, 16, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (91, 17, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (92, 18, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (93, 19, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (94, 20, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (95, 5, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (96, 9, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (97, 10, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (98, 11, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (99, 12, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (100, 19, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (101, 20, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (102, 3, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (103, 4, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (104, 9, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (105, 13, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (106, 14, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (107, 15, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (108, 16, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (109, 17, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (110, 18, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (111, 19, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (112, 3, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (113, 4, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (114, 13, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (115, 14, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (116, 15, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (117, 16, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (118, 17, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (119, 18, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (120, 19, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (121, 20, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (122, 5, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (123, 9, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (124, 10, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (125, 11, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (126, 12, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (127, 19, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (128, 4, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (129, 5, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (130, 9, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (131, 10, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (132, 11, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (133, 13, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (134, 14, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (135, 19, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (168, 4, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (169, 5, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (170, 9, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (171, 12, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (172, 15, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (173, 19, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (174, 20, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (175, 4, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (176, 5, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (177, 9, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (178, 12, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (179, 15, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (180, 19, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (181, 20, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (182, 4, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (183, 5, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (184, 9, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (185, 12, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (186, 15, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (187, 19, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (188, 20, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (189, 3, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (190, 4, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (191, 5, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (192, 9, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (193, 11, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (194, 14, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (195, 16, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (196, 17, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (197, 18, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (198, 19, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (199, 20, 12)
GO
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (502, 22, 24)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (503, 25, 36)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (504, 27, 35)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (505, 23, 34)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (506, 25, 33)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (507, 23, 32)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (508, 22, 31)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (509, 22, 30)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (510, 26, 29)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (511, 28, 28)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (512, 27, 27)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (513, 24, 26)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (514, 22, 25)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (515, 22, 23)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (516, 22, 22)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (517, 22, 21)
SET IDENTITY_INSERT [dbo].[CategoriesProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (6, N'dan', N'nva@gmail.com', N'abcd', N'123456', N'$2b$10$132OCpPditIHWYyOhlBn1.DdcUx/vUBBsliMRHW5BaBzeKSnkO1X2')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (7, N'Nguyen Van T', N'nvt@gmail.com', N'abcd', N'19001009', N'$2b$10$KJMxMdXRQ1sCV0Cs5VaTa.z3DAQQuKOFB4IU5DxFOTw.Q3OWZGEra')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (8, N'Hien', N'hien@gmail.com', N'ha nam', N'12345', N'$2b$10$iH.Ed9WZFNnTtMhcVHjDoewvEA3aBQft5eb49GhbZ.h5C0alkkGk2')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (9, N'dan', N'test@gmail.com', N'abcd', N'19001009', N'$2b$10$B8xPQxwmagRguI7b7SNGQOzOLbbQ1shXrt8jazmCqMowcs85riy/O')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (10, N'dango', N'anjapan12345@gmail.com', N'abcd', N'12345', N'$2b$10$VKAK.3iVvntp99C.plG7UuhfDettlAchMVbjW8jou.gPHFhjI1KNi')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (11, N'Hien1320', N'tranminhhien131220@gmail.com', N'Ha Nam', N'19001009', N'$2b$10$n1kDr.PRKsxqfIbO9QjE1.YiEUNESBqOy1SwUZaQ9nsI1OWsaTY92')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (12, N'khanh beo', N'khanhbeo8c@gmail.com', N'ha noi', N'19001009', N'$2b$10$.DIi6BxxIfLoQeGmBuVFguCJ296sUEQHBkVFf5rZDDG7.d5KqyXtG')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (24, 9, CAST(N'2023-02-12' AS Date), 183900000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (25, 9, CAST(N'2023-02-12' AS Date), 75000000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (26, 9, CAST(N'2023-02-17' AS Date), 202500000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (27, 10, CAST(N'2023-02-27' AS Date), 37800000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (28, 10, CAST(N'2023-02-27' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (29, 8, CAST(N'2023-02-28' AS Date), 90000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (30, 8, CAST(N'2023-02-28' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (31, 6, CAST(N'2023-02-28' AS Date), 90000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (32, 9, CAST(N'2023-02-28' AS Date), 410400000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (33, 6, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (34, 8, CAST(N'2023-02-28' AS Date), 45000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (35, 9, CAST(N'2023-02-28' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (36, 9, CAST(N'2023-02-28' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (37, 8, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (38, 6, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (39, 9, CAST(N'2023-02-28' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (40, 8, CAST(N'2023-02-28' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (41, 6, CAST(N'2023-02-28' AS Date), 45000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (42, 9, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (43, 8, CAST(N'2023-02-28' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (44, 6, CAST(N'2023-02-28' AS Date), 45000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (69, 6, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (70, 7, CAST(N'2023-02-28' AS Date), 60000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (71, 9, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (72, 8, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (73, 8, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (74, 9, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (75, 8, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (76, 7, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (77, 7, CAST(N'2023-02-28' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (78, 8, CAST(N'2023-02-28' AS Date), 240000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (79, 7, CAST(N'2023-02-28' AS Date), 300000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (80, 7, CAST(N'2023-02-28' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (81, 6, CAST(N'2023-02-28' AS Date), 120000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (82, 9, CAST(N'2023-02-28' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (83, 11, CAST(N'2023-03-01' AS Date), 45000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (84, 11, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (85, 11, CAST(N'2023-03-01' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (86, 11, CAST(N'2023-03-01' AS Date), 180000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (87, 11, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (88, 10, CAST(N'2023-03-01' AS Date), 15000000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (89, 6, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (90, 10, CAST(N'2023-03-01' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (91, 10, CAST(N'2023-03-01' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (92, 11, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (93, 11, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (94, 10, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (95, 11, CAST(N'2023-03-01' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (96, 11, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (97, 10, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (98, 11, CAST(N'2023-03-01' AS Date), 45000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (99, 10, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (100, 8, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (101, 10, CAST(N'2023-03-01' AS Date), 15000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (102, 11, CAST(N'2023-03-01' AS Date), 200800000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (103, 12, CAST(N'2023-03-01' AS Date), 15000000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (104, 11, CAST(N'2023-03-01' AS Date), 50800000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (105, 10, CAST(N'2023-03-01' AS Date), 30000000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (106, 10, CAST(N'2023-03-01' AS Date), 30000000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (107, 10, CAST(N'2023-03-01' AS Date), 14500000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (108, 11, CAST(N'2023-03-01' AS Date), 30000000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (109, 11, CAST(N'2023-03-01' AS Date), 75000000, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetail] ON 

INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (50, 24, 17, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (51, 24, 16, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (52, 24, 14, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (53, 24, 8, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (54, 25, 17, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (55, 25, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (56, 26, 16, 4, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (57, 26, 14, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (58, 26, 10, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (59, 27, 8, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (60, 28, 14, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (61, 29, 16, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (62, 30, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (63, 31, 16, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (64, 32, 12, 12, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (65, 32, 7, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (66, 33, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (67, 34, 17, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (68, 35, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (69, 36, 17, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (70, 37, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (71, 38, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (72, 39, 17, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (73, 40, 17, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (74, 41, 17, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (75, 42, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (76, 43, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (77, 44, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (78, 44, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (79, 45, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (80, 48, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (81, 49, 17, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (82, 49, 8, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (83, 49, 7, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (84, 50, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (85, 51, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (86, 52, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (87, 53, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (88, 54, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (89, 55, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (90, 56, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (91, 57, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (92, 58, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (93, 59, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (94, 60, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (95, 61, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (96, 62, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (97, 63, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (98, 64, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (99, 65, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (100, 66, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (101, 67, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (102, 68, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (103, 69, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (104, 70, 16, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (105, 71, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (106, 72, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (107, 73, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (108, 74, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (109, 75, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (110, 76, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (111, 77, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (112, 78, 16, 8, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (113, 79, 16, 10, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (114, 80, 12, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (115, 81, 16, 4, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (116, 82, 17, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (117, 83, 17, 3, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (118, 84, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (119, 85, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (120, 86, 12, 6, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (121, 87, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (122, 88, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (123, 89, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (124, 90, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (125, 91, 17, 2, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (126, 92, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (127, 93, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (128, 94, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (129, 95, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (130, 96, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (131, 97, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (132, 98, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (133, 98, 14, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (134, 99, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (135, 100, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (136, 101, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (137, 102, 16, 6, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (138, 102, 9, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (139, 103, 17, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (140, 104, 14, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (141, 104, 9, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (142, 105, 12, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (143, 106, 14, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (144, 107, 6, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (145, 108, 16, 1, 0)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (146, 109, 17, 5, 0)
SET IDENTITY_INSERT [dbo].[OrdersDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (21, N'Virgin Black T-shirt', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'54f5a50785a7341572be520bc629c6b6.png', 1, 49, 40)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (22, N'T-shirt Ngồi Mát Ăn Bát Vàng', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'6cc99ede7387d7c5300d7046613b6ac3.png', 1, 49, 40)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (23, N'T-shirt Ngồi Mát Ăn Bát Vàng (White)', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'0084aaf0404e31321ab9b897d84ae993.jpg', 1, 49, 40)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (24, N'T-shirt Con Chó Biết Nói', N'<p>Vải 100% cotton định lượng cao, chất vải dày dặn, đường may chất lượng, form dáng thời trang. Hình in bằng mực cao cấp, an toàn, rõ nét, không nhoè, không phai, không bong tróc. Đảm bảo hài lòng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải dày dặn, đường may chất lượng, form dáng thời trang. Hình in bằng mực cao cấp, an toàn, rõ nét, không nhoè, không phai, không bong tróc. Đảm bảo hài lòng.</p>', N'81a36cf0e1172e187c111af42faf10f3.jpg', 1, 49, 40)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (25, N'Thích Nghi T-Shirt', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'c48c0e204c28e9fbd2a728d5faaf176d.jpg', 1, 59, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (26, N'Mèo Thần Tài Ny Ny Hoodie', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'b733c29eb8be40d55d39ed4862658889.jpg', 1, 79, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (27, N'Mũ Thích Nghi', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'd725b116231796cffbc8b0f6aeb0a522.jpg', 1, 29, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (28, N'Móc khóa PobbRose Đi Quẩy', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'd613165e3339e40713abc667a72d276d.jpg', 1, 19, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (29, N'Khẩu Trang Con Chó Biết Nói', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'30aacaa66bdcdc58fb318489f56d1d1c.jpg', 1, 9, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (30, N'YÊU VỚI ĐƯƠNG CÁI GÌ T-SHIRT POD', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'b48c73392f1a7f41adee985b5aa2ad4c.png', 1, 59, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (31, N'KHÔNG THỂ TIN ĐƯỢC T-SHIRT', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'02bb0e6df2d31d10209c0539b18a5b74.png', 1, 59, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (32, N'QUẦN PEW PEW CAO THỦ', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'92004ea18a7e91a04b9612f356f391cc.png', 1, 39, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (33, N'Sweater Ngồi Mát Ăn Bát Vàng', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'133268654504534932_50a08bcec08c34dbb027e49667cec20c.jpg', 1, 59, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (34, N'QUẦN ĐÙI - SR21 DXG 2', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'133268654274080661_183fe06f5261447a94a1623553800028.png', 0, 29, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (35, N'NÓN LƯỠI TRAI - SR21 DXG 2', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>', N'133268654038851247_2139b43d2dba4573f4ac1f7d13d0c476.png', 0, 19, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (36, N'Maneki FG Neko Sweater', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>

<p>&nbsp;</p>', N'<p>Vải 100% cotton định lượng cao, chất vải d&agrave;y dặn, đường may chất lượng, form d&aacute;ng thời trang. H&igrave;nh in bằng mực cao cấp, an to&agrave;n, r&otilde; n&eacute;t, kh&ocirc;ng nho&egrave;, kh&ocirc;ng phai, kh&ocirc;ng bong tr&oacute;c. Đảm bảo h&agrave;i l&ograve;ng.</p>

<p>&nbsp;</p>', N'133268653714061136_71d04b2469eef91085d8d08064c2a101.png', 0, 49, 10)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (5, 17, 4)
INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (6, 16, 5)
INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (7, 16, 5)
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (4, N'Slide 1', N'slide-02.jpg', N'Men New-Season', N'NEW SEASON', N'Shopping with the best price', N'http://localhost:5172')
INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (12, N'Slide 2', N'slide-03.jpg', N'Men Collection 2023', N'New arrivals', N'Shopping with the best price', N'http://localhost:5172')
INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (13, N'Slide 3', N'slide-01.jpg', N'Women Collection 2023', N'New arrivals', N'Shopping with the best price', N'http://localhost:5172')
INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (14, N'Slide 4', N'slide-04.jpg', N'Goodies', N'NEW SEASON', N'Shopping with the best price', N'http://localhost:5172')
SET IDENTITY_INSERT [dbo].[Slides] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name]) VALUES (9, N'Mean Nghi')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (10, N'Dương FG')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (11, N'ẾCH ỘP')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (12, N'Tủ đồ PEW PEW')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (13, N'DIVISIONX')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (14, N'PobbRose')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsProducts] ON 

INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (3, 1, 18)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (4, 4, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (5, 3, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (6, 2, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (7, 4, 20)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (8, 2, 20)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (47, 6, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (48, 5, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (49, 4, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (50, 3, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (51, 2, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (52, 1, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (53, 4, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (54, 3, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (55, 2, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (56, 3, 8)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (57, 2, 8)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (58, 1, 8)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (59, 4, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (60, 3, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (61, 2, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (62, 1, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (63, 5, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (64, 4, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (65, 3, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (66, 2, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (67, 6, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (68, 5, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (69, 4, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (70, 3, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (71, 2, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (72, 1, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (73, 4, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (74, 3, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (75, 2, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (76, 1, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (97, 4, 17)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (98, 3, 17)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (99, 2, 17)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (100, 1, 17)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (101, 4, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (102, 3, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (103, 2, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (104, 1, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (105, 6, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (106, 5, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (107, 4, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (108, 3, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (109, 2, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (110, 1, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (111, 6, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (112, 5, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (113, 4, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (114, 3, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (115, 2, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (116, 1, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (403, 11, 24)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (404, 10, 36)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (405, 13, 35)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (406, 13, 34)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (407, 11, 33)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (408, 12, 32)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (409, 12, 31)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (410, 12, 30)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (411, 11, 29)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (412, 14, 28)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (413, 9, 27)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (414, 9, 26)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (415, 9, 25)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (416, 11, 23)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (417, 11, 22)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (418, 11, 21)
SET IDENTITY_INSERT [dbo].[TagsProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (1, N'Nguyễn Văn A', N'nva@gmail.com', N'$2b$10$/MzAsDRud8t1eWA7RoMGqOvdz7TB9lm7DSLTKKT2XbCD76rDeXSNK')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (2, N'Nguyễn Văn B', N'nvb@gmail.com', N'$2b$10$/MzAsDRud8t1eWA7RoMGqOvdz7TB9lm7DSLTKKT2XbCD76rDeXSNK')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (3, N'Nguyễn Văn C', N'nvc@gmail.com', N'$2b$10$/MzAsDRud8t1eWA7RoMGqOvdz7TB9lm7DSLTKKT2XbCD76rDeXSNK')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (4, N'Nguyễn Văn D', N'nvd@gmail.com', N'$2b$10$/MzAsDRud8t1eWA7RoMGqOvdz7TB9lm7DSLTKKT2XbCD76rDeXSNK')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (5, N'Nguyễn Văn E@', N'nve@gmail.com', N'$2b$10$/MzAsDRud8t1eWA7RoMGqOvdz7TB9lm7DSLTKKT2XbCD76rDeXSNK')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_DisplayHomePage]  DEFAULT ((0)) FOR [DisplayHomePage]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_news_hot]  DEFAULT ((0)) FOR [Hot]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discount_1]  DEFAULT ((0)) FOR [Discount]
GO
