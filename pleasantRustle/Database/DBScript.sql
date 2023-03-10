USE [master]
GO
/****** Object:  Database [Demo2021]    Script Date: 26.05.2022 9:38:49 ******/
CREATE DATABASE [Demo2021]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo2021', FILENAME = N'D:\SQLServer\MSSQL15.SQLEXPRESS\MSSQL\DATA\Demo2021.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demo2021_log', FILENAME = N'D:\SQLServer\MSSQL15.SQLEXPRESS\MSSQL\DATA\Demo2021_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Demo2021] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo2021].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo2021] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo2021] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo2021] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo2021] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo2021] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo2021] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo2021] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo2021] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo2021] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo2021] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo2021] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo2021] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo2021] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo2021] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo2021] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demo2021] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo2021] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo2021] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo2021] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo2021] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo2021] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo2021] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo2021] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Demo2021] SET  MULTI_USER 
GO
ALTER DATABASE [Demo2021] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo2021] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demo2021] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo2021] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Demo2021] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Demo2021] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Demo2021] SET QUERY_STORE = OFF
GO
USE [Demo2021]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 26.05.2022 9:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[Id] [int] NOT NULL,
	[NameCompany] [nvarchar](max) NULL,
	[AgentTypeId] [int] NULL,
	[Adress] [nvarchar](max) NULL,
	[INN] [nvarchar](max) NULL,
	[KPP] [nvarchar](max) NULL,
	[Director] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentTypes]    Script Date: 26.05.2022 9:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentTypes](
	[Id] [int] NOT NULL,
	[TypeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AgentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRealization]    Script Date: 26.05.2022 9:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRealization](
	[Id] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[DateRealization] [date] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_ProductRealization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26.05.2022 9:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductTypeId] [int] NULL,
	[Articul] [nvarchar](max) NULL,
	[PriceMin] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 26.05.2022 9:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] NOT NULL,
	[ProductType] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'БухФлотФинансСнаб', 3, N'035823, Смоленская область, город Одинцово, проезд Будапештсткая, 61', N'4591032477', N'290155423', N'Ираклий Максимович Титова', N'8-800-121-66-81', N'elvira07@sysoeva.org', N'\agents\agent_93.png', 338)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'ЛифтТомскСофтЦентр', 6, N'280811, Омская область, город Балашиха, пер. Сталина, 15', N'3908099185', N'747184361', N'Виноградоваа Вера Александровна', N'(812) 267-19-59', N'izolda.vorontov@lytkina.ru', N'\agents\agent_116.png', 76)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'Транс', 3, N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', N'9604275878', N'951258069', N'Евсеева Болеслав Сергеевич', N'+7 (922) 467-93-83', N' artem.fadeev@polykov.com', N'\agents\agent_66.png', 38)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'CибОмскМорЦентр', 5, N'371407, Рязанская область, город Шатура, пл. Чехова, 48', N'3626169571', N'300062579', N'Гавриил Сергеевич Игнатьев', N'8-800-317-35-79', N'fedotov.platon@pavlov.ru', N'\agents\agent_96.png', 68)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'ОрионТомскТех', 6, N'738763, Курская область, город Егорьевск, спуск Чехова, 66', N'9351493429', N'583041591', N'Георгий Александрович Лукин', N'+7 (922) 851-23-23', N'faina.tikonova@veselov.com', N'\agents\agent_58.png', 73)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'КрепОрионСофтПром', 1, N'351666, Ульяновская область, город Луховицы, въезд Косиора, 07', N'3776671267', N'642177246', N'Алина Борисовна Потаповаа', N'(495) 931-29-26', N'viktoriy.belozerova@isaev.net', N'', 38)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'ПивРадиоВектор', 5, N'330228, Ивановская область, город Ногинск, ул. Славы, 42', N'7447864518', N'211697866', N'Изабелла Борисовна Архиповаа', N'(495) 445-61-43', N'nazarov.polina@voronova.ru', N'\agents\agent_108.png', 245)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'БашкирИнфоЭлектро', 3, N'584771, Брянская область, город Раменское, наб. Славы, 53', N'9037040523', N'803529530', N'Дорофеева Зинаида Борисовна', N'8-800-232-56-37', N'lebedeva.larisa@lavrentev.net', N'\agents\agent_97.png', 289)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'Компания CибМоторКазань', 5, N'887741, Тульская область, город Пушкино, пр. Чехова, 77', N'6221520857', N'758155852', N'Тетерина Георгий Сергеевич', N'(495) 713-51-83', N' tamara22@pavlova.com', N'\agents\agent_100.png', 136)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'Компания Газ', 5, N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', N'2262431140', N'247369527', N'Давид Андреевич Фадеев', N'(812) 823-93-42', N' alina56@zdanov.com', N'\agents\agent_59.png', 445)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'СантехБашкир', 3, N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', N'4159215346', N'639267493', N'Виктор Иванович Молчанов', N'8-800-582-39-19', N' nikodim81@kiseleva.com', N'\agents\agent_38.png', 369)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'ОрионГлав', 6, N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', N'9032455179', N'763045792', N'Тимофеева Григорий Андреевич', N'(35222) 96-19-26', N'sermakova@sarova.net', N'\agents\agent_45.png', 482)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'Мобайл', 4, N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', N'7803888520', N'885703265', N'Екатерина Сергеевна Бобылёва', N'8-800-511-43-61', N' dsiryev@dementeva.com', N'\agents\agent_46.png', 464)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'Компания ТомскХоз', 5, N'861543, Томская область, город Истра, бульвар Славы, 42', N'8430391035', N'961540858', N'Лазарева Аркадий Сергеевич', N'(495) 893-71-17', N' nelli11@gureva.ru', N'\agents\agent_54.png', 464)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'ЛенХозРем', 6, N'946112, Волгоградская область, город Шаховская, пл. Сталина, 98', N'4318970454', N'389962934', N'Носов Михаил Андреевич', N'(35222) 73-44-19', N' tdrozdov@ersova.ru', N'\agents\agent_78.png', 3)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'Строй', 5, N'426305, Калининградская область, город Чехов, пл. Ломоносова, 00', N'7687851800', N'470221602', N'Люся Владимировна Фёдороваа', N'+7 (922) 233-27-68', N'wsamsonov@martynov.ru', N'\agents\agent_76.png', 258)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'ЭлектроТранс', 4, N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', N'6019144874', N'450629885', N'Сава Александрович Титова', N'(495) 688-28-59', N'boleslav.zukova@nikiforova.com', N'\agents\agent_30.png', 129)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'Флот', 1, N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', N'1112170258', N'382584255', N'Василий Андреевич Ковалёв', N'8-800-538-41-77', N'gerasim.makarov@kornilov.ru', N'', 473)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'ОмскЛифтРадио', 1, N'146093, Белгородская область, город Можайск, пл. Ломоносова, 94', N'8325114917', N'356835763', N'Горбунов Назар Сергеевич', N'(495) 452-58-94', N' kanisimov@nikolaev.ru', N'\agents\agent_92.png', 373)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'ВостокНефть', 5, N'171297, Оренбургская область, город Зарайск, проезд Сталина, 17', N'3532367439', N'788413794', N'Данила Александрович Кириллов', N'+7 (922) 596-14-53', N'stanislav.zykov@volkova.net', N'\agents\agent_120.png', 49)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'СервисХмельМонтаж', 1, N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', N'3459886235', N'356196105', N'Анжелика Дмитриевна Горбунова', N'(35222) 39-28-95', N'galina31@melnikov.ru', N'\agents\agent_31.png', 124)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'АсбоцементЛифтРеч-H', 6, N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', N'6567878928', N'560960507', N'Кондратьева Таисия Андреевна', N'(495) 284-69-37', N'vladlena58@seliverstova.ru', N'\agents\agent_44.png', 407)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'БухМоторТомск', 4, N'936264, Ростовская область, город Ногинск, проезд Славы, 52', N'5630128011', N'571438707', N'Игорь Львович Щукина', N'(812) 132-93-75', N'dmitrii05@zukov.ru', N'\agents\agent_95.png', 65)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'Глав', 1, N'077760, Ленинградская область, город Сергиев Посад, спуск Славы, 05', N'6433380154', N'715096638', N'Герман Иванович Гусева', N'(812) 524-87-16', N'albert57@burova.ru', N'', 35)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'Тяж', 6, N'395435, Мурманская область, город Красногорск, шоссе Косиора, 47', N'3302080044', N'733101773', N'Бронислав Владимирович Ефимов', N'(812) 976-77-15', N'vladlen06@melnikov.net', N'\agents\agent_106.png', 402)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ТелекомГор', 4, N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', N'3748947224', N'766431901', N'Ксения Андреевна Михайлова', N'8-800-752-71-45', N' gorskov.larisa@kalinin.com', N'\agents\agent_37.png', 255)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'ОрионХмельCиб', 4, N'266126, Ленинградская область, город Сергиев Посад, шоссе Чехова, 31', N'9895514594', N'587685742', N'Воробьёва Родион Максимович', N'(35222) 85-24-18', N'pstepanova@siryev.com', N'\agents\agent_105.png', 173)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'РадиоСевер', 4, N'491360, Московская область, город Одинцово, въезд Ленина, 19', N'5889206249', N'372789083', N'Карпов Иосиф Максимович', N'(495) 374-21-79', N' maiy.belov@rogov.ru', N'\agents\agent_62.png', 431)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'CибСервисСевер', 5, N'711370, Курская область, город Истра, пр. Будапештсткая, 89', N'1719781819', N'742676221', N'Чернов Геннадий Алексеевич', N'+7 (922) 248-79-98', N' faina02@muraveva.com', N'\agents\agent_74.png', 385)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'СофтРосБух', 1, N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', N'8321561226', N'807803984', N'Белова Полина Владимировна', N'+7 (922) 947-11-99', N' ivanova.antonin@rodionov.ru', N'\agents\agent_63.png', 69)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'Компания СервисТелеМотор', 5, N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', N'3248454160', N'138472695', N'Фролова Эдуард Борисович', N'(35222) 13-15-63', N'veronika.egorov@bespalova.com', N'\agents\agent_41.png', 81)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'КрепФлот', 4, N'357783, Рязанская область, город Павловский Посад, наб. Домодедовская, 44', N'2795067090', N'967021779', N'Злата Романовна Корнилова', N'8-800-753-27-68', N'danila.birykov@stepanov.ru', N'\agents\agent_90.png', 349)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'ГаражФорсаж', 4, N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', N'2816939574', N'754741128', N'Клавдия Фёдоровна Кудряшова', N'(495) 277-77-59', N'lydmila.belyeva@karpov.ru', N'\agents\agent_47.png', 335)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'ГлавРечФлот', 3, N'116028, Челябинская область, город Балашиха, шоссе Космонавтов, 69', N'5299346323', N'214239563', N'Шубина Валерия Евгеньевна', N'8-800-933-48-75', N' emysnikov@kiselev.net', N'\agents\agent_85.png', 283)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'МикроБашкирГор', 1, N'437208, Астраханская область, город Озёры, спуск Славы, 45', N'5774378274', N'352728364', N'Нонна Владимировна Горбунова', N'(35222) 41-81-98', N'ybragina@odintov.org', N'\agents\agent_86.png', 427)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'ХозЮпитер', 4, N'038182, Курганская область, город Москва, спуск Космонавтов, 16', N'6667635058', N'380592865', N'Максимоваа Вера Фёдоровна', N'(495) 178-61-32', N' jisakova@nazarova.com', N'\agents\agent_53.png', 375)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'Дизайн', 2, N'243999, Орловская область, город Можайск, пер. Домодедовская, 77', N'9646693050', N'201876935', N'Мельниковаа Федосья Борисовна', N'+7 (922) 349-67-96', N'viktoriy73@kalinina.org', N'\agents\agent_71.png', 330)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'ЛифтАлмазТех', 4, N'925700, Нижегородская область, город Зарайск, шоссе Гоголя, 35', N'3950510936', N'240396350', N'Воронова Альберт Александрович', N'(495) 834-12-97', N'donat.gerasimov@rogova.ru', N'\agents\agent_77.png', 497)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'Вод', 1, N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', N'1296063939', N'447430051', N'Зоя Романовна Селезнёва', N'(495) 811-36-55', N' savva86@zaiteva.ru', N'\agents\agent_68.png', 359)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'CибГаз', 2, N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', N'6483417250', N'455013058', N'Вячеслав Романович Третьякова', N'8-800-567-79-81', N' inna.sarova@panfilov.ru', N'\agents\agent_42.png', 488)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'МеталСервисМор', 6, N'293265, Иркутская область, город Клин, пр. Славы, 12', N'6922817841', N'580142825', N'Коновалова Кирилл Львович', N'8-800-427-61-43', N' xdanilov@titov.ru', N'\agents\agent_23.png', 475)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'МоторБашкирИнфоЭкспедиция', 6, N'352034, Сахалинская область, город Домодедово, пр. Балканская, 97', N'6542240791', N'928029129', N'Тимофеева Регина Львовна', N'(35222) 86-94-61', N'egorov.zanna@maslova.ru', N'\agents\agent_88.png', 68)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'Пив', 6, N'306012, Ростовская область, город Талдом, пл. Сталина, 01', N'3936600214', N'873471159', N'Макар Романович Савельев', N'(812) 465-97-96', N' klavdiy50@nazarov.com', N'\agents\agent_118.png', 198)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'Компания КазМеталКазань', 5, N'532703, Пензенская область, город Чехов, наб. Чехова, 81', N'4598939812', N'303467543', N'Валерий Владимирович Хохлова', N'(495) 683-76-57', N'mmoiseev@teterin.ru', N'\agents\agent_69.png', 252)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'Компания Орион', 5, N'661101, Оренбургская область, город Волоколамск, въезд Чехова, 16', N'8698706801', N'251899316', N'Елисееваа Эмилия Андреевна', N'+7 (922) 916-34-31', N'msorokina@andreeva.ru', N'\agents\agent_70.png', 227)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ИнфоАлмазГлав', 1, N'937201, Самарская область, город Воскресенск, въезд Космонавтов, 10', N'8990745795', N'517528851', N'Вишняков Гордей Владимирович', N'+7 (922) 627-96-25', N' valentin23@sitnikov.net', N'\agents\agent_112.png', 133)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'ТяжРадиоУралПроф', 4, N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', N'5688533246', N'401535045', N'София Алексеевна Мухина', N'+7 (922) 635-97-19', N'liliy62@grisina.ru', N'\agents\agent_27.png', 278)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'РемМетиз', 5, N'837800, Псковская область, город Солнечногорск, ул. Сталина, 67', N'2129059967', N'287016575', N'Жанна Евгеньевна Гришинаа', N'(495) 698-56-86', N'mdavydov@blokin.org', N'\agents\agent_111.png', 296)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'Гараж', 3, N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', N'2638464552', N'746822723', N'Панфилов Константин Максимович', N'8-800-297-69-48', N'antonin51@korolev.com', N'', 107)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'Компания МикроГлавУралЭкспедиция', 5, N'225511, Новосибирская область, город Можайск, наб. Ладыгина, 82', N'5555957575', N'680301577', N'Зайцева Лада Дмитриевна', N'(495) 484-42-65', N'nonna23@nesterova.ru', N'\agents\agent_109.png', 387)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'БашкирРечТомск', 6, N'136886, Амурская область, город Видное, въезд Космонавтов, 39', N'7027724917', N'823811460', N'Назарова Вера Андреевна', N'+7 (922) 437-38-91', N'aleksandra77@karpov.com', N'\agents\agent_39.png', 84)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'Орион', 6, N'049104, Новгородская область, город Павловский Посад, бульвар Ладыгина, 58', N'7387259022', N'875652541', N'Клим Сергеевич Аксёнова', N'(35222) 77-98-59', N' donat05@sokolova.com', N'\agents\agent_104.png', 412)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'МетизСтрой', 2, N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', N'4024742936', N'295608432', N'Ева Борисовна Беспалова', N'(35222) 77-46-44', N'kristina.pakomov@burova.ru', N'\agents\agent_33.png', 374)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'ЦементКрепТех-М', 1, N'263764, Свердловская область, город Раменское, пер. Косиора, 28', N'5359981084', N'680416300', N'Сергеев Владлен Александрович', N'(812) 413-91-32', N'yna.evdokimov@gordeeva.ru', N'\agents\agent_21.png', 189)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'РемВод', 4, N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', N'3986603105', N'811373078', N'Медведеваа Ярослава Фёдоровна', N'(812) 766-11-88', N'komarov.elizaveta@agafonova.ru', N'\agents\agent_65.png', 1)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'БашкирМотор', 4, N'073468, Читинская область, город Шаховская, наб. Косиора, 99', N'6032171116', N'180861585', N'Денисов Владимир Андреевич', N'(812) 176-77-77', N' kseniy80@rusakov.net', N'\agents\agent_117.png', 91)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'Компания МоторТелекомЦемент-М', 5, N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', N'7326832482', N'440199498', N'Иван Евгеньевич Белоусова', N'(812) 131-84-24', N'larisa44@silin.org', N'\agents\agent_57.png', 237)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'ЦементСантехФинансЛизинг', 4, N'165429, Курганская область, город Озёры, въезд Балканская, 17', N'6290983121', N'136566390', N'Даниил Фёдорович Григорьева', N'+7 (922) 877-12-28', N'anfisa07@semenova.com', N'\agents\agent_101.png', 70)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'Компания ВодАлмазIT', 5, N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', N'2345297765', N'908449277', N'Гуляев Егор Евгеньевич', N'8-800-595-91-99', N' zakar37@nikolaeva.ru', N'\agents\agent_50.png', 31)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'Компания БашкирСтрой', 5, N'152450, Брянская область, город Серебряные Пруды, наб. 1905 года, 56', N'1660486169', N'253830866', N'Яна Дмитриевна Моисееваа', N'(35222) 89-74-97', N'bgromov@tretykov.org', N'\agents\agent_80.png', 92)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'ТелеРечДизайн', 4, N'063695, Новгородская область, город Можайск, шоссе Гагарина, 39', N'6369492130', N'115604622', N'Виктория Романовна Королёваа', N'(812) 731-79-52', N' kazakova.yroslava@silina.net', N'\agents\agent_82.png', 226)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'ГазГлавПивЛизинг', 4, N'899084, Амурская область, город Талдом, спуск Балканская, 34', N'5309136217', N'170258253', N'Злата Сергеевна Архипова', N'(495) 744-37-11', N'sysoeva.evgenii@kolesnikova.ru', N'\agents\agent_91.png', 52)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'Софт', 4, N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', N'3889910123', N'952047511', N'Петухова Прохор Фёдорович', N'(35222) 15-35-92', N' jterentev@ersov.com', N'\agents\agent_61.png', 292)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'Инфо', 4, N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', N'6549468639', N'718386757', N'Баранова Виктор Романович', N'(35222) 28-33-28', N'arsenii.mikailova@prokorov.com', N'\agents\agent_28.png', 304)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'ЭлектроШум', 4, N'975616, Вологодская область, город Клин, пер. Косиора, 57', N'3124748557', N'525403940', N'Игнатьеваа Флорентина Фёдоровна', N'(35222) 28-59-34', N'nataly89@kulakov.ru', N'\agents\agent_103.png', 109)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'РыбВостокCибСнаб', 1, N'990758, Челябинская область, город Серпухов, въезд Космонавтов, 57', N'2412503891', N'711642010', N'Степанова Фаина Львовна', N'8-800-486-84-47', N' filipp93@polykov.ru', N'\agents\agent_94.png', 496)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'СервисПивВектор', 6, N'669558, Омская область, город Шаховская, шоссе Гагарина, 55', N'4098988911', N'952390693', N'Олег Евгеньевич Журавлёв', N'(812) 564-46-65', N'wersov@molcanova.com', N'\agents\agent_87.png', 267)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'Бух', 6, N'481744, Амурская область, город Щёлково, пл. Сталина, 48', N'2320989197', N'359282667', N'Тарасов Болеслав Александрович', N'(35222) 99-92-42', N'valentina.bolsakova@aksenova.ru', N'\agents\agent_43.png', 327)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'МеталТекстильЛифтТрест', 2, N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', N'2971553297', N'821859486', N'Одинцов Назар Борисович', N'8-800-736-36-73', N'muravev.trofim@sazonov.net', N'\agents\agent_25.png', 425)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'ВостокЛен', 3, N'546530, Тульская область, город Видное, наб. Гагарина, 63', N'1697025997', N'931878289', N'Лыткинаа Люся Дмитриевна', N'(495) 971-71-24', N'dmitrii90@zaitev.ru', N'\agents\agent_114.png', 246)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'АлмазАсбоцементБухКомплекс', 6, N'794964, Мурманская область, город Озёры, ул. 1905 года, 56', N'8996890877', N'349709983', N'Зыков Никита Александрович', N'(812) 752-53-41', N' akoseleva@dementeva.ru', N'\agents\agent_119.png', 39)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'ТверьМонтажОмск', 6, N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', N'2421347164', N'157370604', N'Матвей Романович Большакова', N'(35222) 92-87-52', N'dteterina@selezneva.ru', N'\agents\agent_67.png', 272)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'ТверьХозМорСбыт', 2, N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', N'6681338084', N'460530907', N'Аким Львович Субботина', N'(35222) 72-93-38', N' marina58@koroleva.com', N'\agents\agent_56.png', 207)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'МорТехТелекомСнаб', 4, N'239247, Архангельская область, город Лотошино, бульвар Ломоносова, 28', N'4354676693', N'631235170', N'Беспалова Ева Романовна', N'8-800-359-95-29', N'garri.rybakov@ermakova.com', N'\agents\agent_98.png', 149)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'Лифт', 5, N'479565, Курганская область, город Клин, пл. Ленина, 54', N'6169713039', N'848972934', N'Вера Евгеньевна Денисоваа', N'(812) 887-59-97', N'zinaida01@bespalova.ru', N'\agents\agent_40.png', 92)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'МясХмельФлот', 2, N'252826, Костромская область, город Солнечногорск, проезд Ленина, 75', N'3019787650', N'974897634', N'Гавриил Львович Зуева', N'8-800-548-11-53', N'anna48@alekseev.ru', N'\agents\agent_72.png', 372)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'Компания МобайлЮпитерМобайл', 5, N'697880, Тюменская область, город Егорьевск, проезд Домодедовская, 82', N'3824054933', N'715845254', N'Рожкова Аркадий Владимирович', N'(812) 941-35-96', N'klara.gavrilov@nosova.com', N'\agents\agent_75.png', 31)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'Компания Инж', 5, N'475644, Ивановская область, город Луховицы, въезд Будапештсткая, 43', N'6730622378', N'201657751', N'Чернова Инесса Сергеевна', N'8-800-765-67-46', N' osilova@muravev.ru', N'\agents\agent_99.png', 179)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'АсбоцементТехАвто', 3, N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', N'7626076463', N'579234124', N'Сидорова Любовь Ивановна', N'(495) 676-81-98', N'matveev.yliy@kiseleva.ru', N'\agents\agent_49.png', 247)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'Cиб', 5, N'194134, Омская область, город Волоколамск, пер. Косиора, 79', N'7892739766', N'524021828', N'Беспалова Мирослав Владимирович', N'(812) 373-27-64', N' anfisa50@krykova.org', N'\agents\agent_83.png', 174)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'СервисТомск', 3, N'194903, Амурская область, город Ногинск, ул. Бухарестская, 45', N'8538379073', N'761935124', N'Егор Сергеевич Филиппов', N'(35222) 66-31-65', N' mukin.lev@komarov.ru', N'\agents\agent_79.png', 475)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'ТверьМетизУралСнос', 5, N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', N'1076095397', N'947828491', N'Зоя Андреевна Соболева', N'+7 (922) 497-22-19', N'rlazareva@novikov.ru', N'\agents\agent_48.png', 165)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'Электро', 4, N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', N'7896029866', N'786038848', N'Шарапова Елена Дмитриевна', N'(812) 264-41-75', N'likacev.makar@antonov.ru', N'\agents\agent_32.png', 366)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'Компания Алмаз', 5, N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', N'6698862694', N'662876919', N'Фоминаа Лариса Романовна', N'+7 (922) 167-89-39', N' akalinina@zaitev.ru', N'\agents\agent_60.png', 259)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'ПивЛенТверь', 1, N'783238, Тюменская область, город Серебряные Пруды, проезд 1905 года, 67', N'9476119404', N'365311390', N'Костин Савва Романович', N'(812) 653-19-26', N'dnikitina@antonova.ru', N'\agents\agent_110.png', 190)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'МетизБухРем', 4, N'318328, Кемеровская область, город Павловский Посад, спуск 1905 года, 92', N'1449531554', N'124871353', N'Нонна Фёдоровна Федотова', N'+7 (922) 852-73-43', N' koselev.anfisa@selezneva.ru', N'', 112)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'ITСтройАлмаз', 4, N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', N'7689065648', N'456612755', N'Алексеева Валериан Андреевич', N'(35222) 46-33-91', N'fokin.eduard@samoilov.com', N'', 159)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'МонтажОрионУрал', 2, N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', N'1692286718', N'181380912', N'Давыдоваа Нина Евгеньевна', N'8-800-916-27-93', N' pzaitev@blokin.org', N'\agents\agent_35.png', 50)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'ВодГор', 4, N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', N'4463113470', N'899603778', N'Фаина Фёдоровна Филиппова', N'(35222) 61-58-74', N'tvetkova.robert@sorokin.com', N'\agents\agent_64.png', 72)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'ВостокКазРыб', 3, N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', N'7411284960', N'176779733', N'Самсонов Родион Романович', N'+7 (922) 263-93-51', N'flukin@misin.org', N'\agents\agent_51.png', 361)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'ЛифтРыб', 5, N'076703, Саратовская область, город Одинцово, ул. Косиора, 01', N'3997121859', N'970823018', N'Субботин Анатолий Евгеньевич', N'+7 (922) 298-45-48', N'maksim86@fokina.ru', N'', 445)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (92, N'УралСтройХмель', 1, N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', N'8773558039', N'402502867', N'Август Борисович Красильникова', N'(812) 986-94-47', N'aleksandr95@kolobova.ru', N'\agents\agent_52.png', 372)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'ГаражРосВекторПроф', 2, N'828207, Тверская область, город Щёлково, наб. Ленина, 70', N'1092776106', N'164232266', N'Абрам Фёдорович Дроздов', N'8-800-595-65-86', N'adrian61@guseva.ru', N'\agents\agent_81.png', 189)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'Каз', 2, N'432454, Ленинградская область, город Луховицы, пр. Косиора, 88', N'1036132639', N'918316432', N'Святослав Андреевич Моисеева', N'(495) 829-15-77', N'jsafonov@molcanov.com', N'\agents\agent_115.png', 291)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'КрепМетал', 5, N'103296, Иркутская область, город Солнечногорск, пл. 1905 года, 59', N'1689100612', N'671073273', N'Андрей Сергеевич Лобанов', N'+7 (922) 537-88-64', N'nika.kalasnikov@maslova.ru', N'не указано', 471)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'Компания ЖелДорТверьМонтаж', 5, N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', N'3325722996', N'665766347', N'Нестор Максимович Гуляев', N'(495) 168-53-94', N'burova.zlata@zueva.ru', N'\agents\agent_24.png', 2)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'ОрионСофтВодСнос', 1, N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', N'1522348613', N'977738715', N'Мухина Ян Фёдорович', N'8-800-187-56-96', N'isukanov@sobolev.com', N'\agents\agent_36.png', 361)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'БухМясМоторПром', 4, N'677498, Костромская область, город Зарайск, спуск Славы, 59', N'7377410338', N'592041317', N'Нина Дмитриевна Черноваа', N'(35222) 73-81-81', N'varvara49@savin.ru', N'', 158)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'ГлавБашкирМоторБанк', 6, N'258285, Ульяновская область, город Ступино, пл. Ладыгина, 83', N'9101293748', N'531950230', N'Стефан Алексеевич Андреев', N'(495) 134-27-72', N'xaksenova@kazakov.ru', N'', 98)
INSERT [dbo].[Agents] ([Id], [NameCompany], [AgentTypeId], [Adress], [INN], [KPP], [Director], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'Рем', 6, N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', N'9006569852', N'152177100', N'Альбина Александровна Романова', N'(812) 111-67-11', N'rafail96@sukin.ru', N'\agents\agent_55.png', 88)
GO
INSERT [dbo].[AgentTypes] ([Id], [TypeName]) VALUES (1, N'ЗАО')
INSERT [dbo].[AgentTypes] ([Id], [TypeName]) VALUES (2, N'МКК')
INSERT [dbo].[AgentTypes] ([Id], [TypeName]) VALUES (3, N'МФО')
INSERT [dbo].[AgentTypes] ([Id], [TypeName]) VALUES (4, N'ОАО')
INSERT [dbo].[AgentTypes] ([Id], [TypeName]) VALUES (5, N'ООО')
INSERT [dbo].[AgentTypes] ([Id], [TypeName]) VALUES (6, N'ПАО')
GO
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (1, 39, 47, CAST(N'2010-05-15' AS Date), 9)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (2, 45, 69, CAST(N'2016-12-27' AS Date), 18)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (3, 28, 14, CAST(N'2018-01-14' AS Date), 9)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (4, 31, 83, CAST(N'2016-02-23' AS Date), 8)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (5, 38, 59, CAST(N'2019-05-28' AS Date), 19)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (6, 45, 59, CAST(N'2019-03-28' AS Date), 19)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (7, 10, 63, CAST(N'2014-10-07' AS Date), 7)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (8, 6, 96, CAST(N'2011-02-24' AS Date), 13)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (9, 42, 97, CAST(N'2010-07-03' AS Date), 19)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (10, 19, 55, CAST(N'2010-02-05' AS Date), 2)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (11, 42, 41, CAST(N'2010-04-11' AS Date), 2)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (12, 46, 47, CAST(N'2012-07-08' AS Date), 19)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (13, 30, 82, CAST(N'2011-02-01' AS Date), 12)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (14, 35, 73, CAST(N'2014-08-15' AS Date), 3)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (15, 33, 57, CAST(N'2015-10-23' AS Date), 14)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (16, 44, 11, CAST(N'2013-02-17' AS Date), 4)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (17, 21, 51, CAST(N'2018-01-20' AS Date), 1)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (18, 19, 40, CAST(N'2013-11-23' AS Date), 8)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (19, 39, 14, CAST(N'2016-06-02' AS Date), 8)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (20, 40, 97, CAST(N'2010-10-17' AS Date), 16)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (21, 21, 13, CAST(N'2018-02-12' AS Date), 17)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (22, 3, 11, CAST(N'2011-11-10' AS Date), 6)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (23, 46, 11, CAST(N'2010-07-18' AS Date), 10)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (24, 8, 40, CAST(N'2016-12-21' AS Date), 13)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (25, 21, 45, CAST(N'2012-07-09' AS Date), 6)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (26, 24, 12, CAST(N'2012-08-19' AS Date), 5)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (27, 28, 14, CAST(N'2014-08-15' AS Date), 13)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (28, 6, 40, CAST(N'2015-04-23' AS Date), 19)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (29, 13, 57, CAST(N'2013-05-22' AS Date), 4)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (30, 26, 90, CAST(N'2014-08-24' AS Date), 14)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (31, 50, 45, CAST(N'2010-06-05' AS Date), 3)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (32, 47, 45, CAST(N'2019-03-12' AS Date), 11)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (33, 8, 69, CAST(N'2011-09-12' AS Date), 3)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (34, 2, 55, CAST(N'2013-11-22' AS Date), 8)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (35, 49, 83, CAST(N'2014-12-10' AS Date), 6)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (36, 20, 49, CAST(N'2016-10-25' AS Date), 10)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (37, 35, 11, CAST(N'2017-08-27' AS Date), 5)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (38, 11, 64, CAST(N'2018-08-18' AS Date), 9)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (39, 48, 14, CAST(N'2017-05-12' AS Date), 7)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (40, 39, 40, CAST(N'2012-03-02' AS Date), 15)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (41, 46, 57, CAST(N'2010-12-05' AS Date), 4)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (42, 20, 68, CAST(N'2010-02-03' AS Date), 7)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (43, 42, 53, CAST(N'2016-02-20' AS Date), 10)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (44, 3, 33, CAST(N'2015-07-21' AS Date), 2)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (45, 22, 49, CAST(N'2012-04-05' AS Date), 11)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (46, 33, 12, CAST(N'2019-10-06' AS Date), 17)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (47, 21, 84, CAST(N'2014-01-18' AS Date), 3)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (48, 45, 40, CAST(N'2010-12-21' AS Date), 11)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (49, 11, 79, CAST(N'2017-03-08' AS Date), 2)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (50, 1, 79, CAST(N'2012-09-09' AS Date), 9)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (51, 36, 47, CAST(N'2013-06-24' AS Date), 1)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (52, 20, 30, CAST(N'2019-05-07' AS Date), 20)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (53, 21, 68, CAST(N'2010-03-18' AS Date), 5)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (54, 7, 57, CAST(N'2018-09-06' AS Date), 8)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (55, 40, 18, CAST(N'2018-03-24' AS Date), 5)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (56, 50, 40, CAST(N'2019-02-18' AS Date), 14)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (57, 14, 45, CAST(N'2015-11-16' AS Date), 10)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (58, 34, 30, CAST(N'2011-01-28' AS Date), 19)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (59, 26, 53, CAST(N'2019-02-24' AS Date), 1)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (60, 5, 82, CAST(N'2014-04-27' AS Date), 19)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (61, 33, 84, CAST(N'2014-02-28' AS Date), 18)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (62, 36, 14, CAST(N'2015-10-21' AS Date), 13)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (63, 5, 30, CAST(N'2012-09-26' AS Date), 15)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (64, 13, 68, CAST(N'2010-10-19' AS Date), 4)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (65, 36, 44, CAST(N'2012-03-20' AS Date), 15)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (66, 8, 64, CAST(N'2014-12-11' AS Date), 9)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (67, 49, 41, CAST(N'2019-12-04' AS Date), 4)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (68, 38, 87, CAST(N'2015-07-01' AS Date), 9)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (69, 28, 64, CAST(N'2018-12-04' AS Date), 13)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (70, 33, 68, CAST(N'2018-03-22' AS Date), 11)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (71, 22, 49, CAST(N'2019-10-26' AS Date), 12)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (72, 39, 72, CAST(N'2018-06-21' AS Date), 9)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (73, 1, 82, CAST(N'2012-09-10' AS Date), 11)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (74, 20, 44, CAST(N'2016-09-25' AS Date), 20)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (75, 40, 3, CAST(N'2018-08-18' AS Date), 17)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (76, 28, 83, CAST(N'2014-02-19' AS Date), 2)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (77, 11, 73, CAST(N'2013-03-24' AS Date), 18)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (78, 43, 89, CAST(N'2010-08-24' AS Date), 16)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (79, 14, 33, CAST(N'2019-03-10' AS Date), 13)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (80, 39, 30, CAST(N'2019-01-18' AS Date), 3)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (81, 31, 73, CAST(N'2010-11-06' AS Date), 1)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (82, 27, 87, CAST(N'2018-01-05' AS Date), 7)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (83, 11, 31, CAST(N'2011-07-18' AS Date), 11)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (84, 28, 49, CAST(N'2019-06-02' AS Date), 12)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (85, 50, 54, CAST(N'2017-09-13' AS Date), 2)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (86, 34, 51, CAST(N'2013-09-05' AS Date), 20)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (87, 35, 45, CAST(N'2013-08-24' AS Date), 3)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (88, 6, 3, CAST(N'2015-09-05' AS Date), 15)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (89, 21, 26, CAST(N'2015-08-17' AS Date), 14)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (90, 16, 49, CAST(N'2016-04-26' AS Date), 4)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (91, 7, 12, CAST(N'2010-08-02' AS Date), 2)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (92, 1, 26, CAST(N'2010-06-15' AS Date), 18)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (93, 22, 18, CAST(N'2017-08-17' AS Date), 19)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (94, 39, 84, CAST(N'2019-04-27' AS Date), 3)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (95, 30, 31, CAST(N'2013-12-24' AS Date), 16)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (96, 27, 44, CAST(N'2011-05-15' AS Date), 13)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (97, 30, 36, CAST(N'2010-06-14' AS Date), 4)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (98, 31, 12, CAST(N'2019-09-20' AS Date), 6)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (99, 25, 21, CAST(N'2010-05-01' AS Date), 14)
INSERT [dbo].[ProductRealization] ([Id], [ProductId], [AgentId], [DateRealization], [Count]) VALUES (100, 49, 83, CAST(N'2015-04-08' AS Date), 18)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (1, N'Газета большая 1868', 1, N'27976646', CAST(902.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (2, N'Газета большая 3657', 2, N'78091245', CAST(930.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (3, N'Газета для художников 4236', 3, N'48553183', CAST(1550.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (4, N'Газета в самолет 4604', 2, N'8680636', CAST(753.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (5, N'Газета большая 4944', 4, N'9353504', CAST(273.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (6, N'Газета на все случаи жизни 1520', 3, N'45594795', CAST(456.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (7, N'Газета в для бесплатной раздачи 2606', 2, N'83462242', CAST(774.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (8, N'Газета большая 6862', 3, N'59167393', CAST(434.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (9, N'Газета для камина 3315', 5, N'54478746', CAST(1218.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (10, N'Газета для художников 3342', 1, N'22057074', CAST(1810.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (11, N'Газета на все случаи жизни 6648', 4, N'87295396', CAST(855.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (12, N'Газета с рекламой 6481', 5, N'24075601', CAST(1082.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (13, N'Газета для камина 2315', 6, N'50256318', CAST(371.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (14, N'Газета в для бесплатной раздачи 3292', 5, N'85600070', CAST(1538.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (15, N'Газета в самолет 5630', 4, N'84369081', CAST(408.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (16, N'Газета с рекламой 2151', 4, N'7334637', CAST(469.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (17, N'Газета для художников 4151', 6, N'36541845', CAST(1941.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (18, N'Газета для художников 6785', 6, N'39091116', CAST(1803.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (19, N'Газета 4345', 3, N'52923383', CAST(1184.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (20, N'Газета 3090', 3, N'11600809', CAST(1330.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (21, N'Газета на все случаи жизни 3544', 4, N'60843368', CAST(859.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (22, N'Газета большая 3643', 4, N'22067189', CAST(1915.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (23, N'Газета 4180', 6, N'76654386', CAST(921.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (24, N'Газета 3975', 5, N'82659311', CAST(1508.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (25, N'Газета с рекламой 3242', 1, N'7149484', CAST(921.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (26, N'Газета для художников 6864', 2, N'87872929', CAST(171.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (27, N'Газета 1082', 4, N'77937928', CAST(714.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (28, N'Газета в для бесплатной раздачи 6111', 3, N'72416523', CAST(309.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (29, N'Газета на все случаи жизни 1714', 5, N'31665003', CAST(1424.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (30, N'Газета для камина 6285', 2, N'71281919', CAST(983.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (31, N'Газета на все случаи жизни 6220', 3, N'18410956', CAST(1698.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (32, N'Газета для художников 4102', 5, N'63922854', CAST(1579.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (33, N'Газета для художников 4315', 3, N'42103413', CAST(393.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (34, N'Газета с рекламой 2519', 4, N'80730863', CAST(540.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (35, N'Газета большая 3238', 3, N'89835699', CAST(1755.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (36, N'Газета большая 5121', 6, N'64624694', CAST(756.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (37, N'Газета в самолет 2000', 4, N'29040461', CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (38, N'Газета 2519', 3, N'13583259', CAST(1046.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (39, N'Газета с рекламой 5369', 4, N'1238940', CAST(1272.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (40, N'Газета в для бесплатной раздачи 2698', 5, N'70753171', CAST(1877.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (41, N'Газета для камина 6472', 2, N'82969831', CAST(1114.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (42, N'Газета в для бесплатной раздачи 5284', 4, N'33299792', CAST(1347.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (43, N'Газета в для бесплатной раздачи 1541', 3, N'14324022', CAST(467.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (44, N'Газета для художников 4719', 1, N'77692803', CAST(1701.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (45, N'Газета на все случаи жизни 3653', 4, N'53542547', CAST(1378.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (46, N'Газета в для бесплатной раздачи 6264', 5, N'18281277', CAST(1127.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (47, N'Газета на все случаи жизни 2342', 3, N'30687057', CAST(1180.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (48, N'Газета для художников 3691', 4, N'54726555', CAST(557.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (49, N'Газета 3037', 5, N'26474670', CAST(1653.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (50, N'Газета 5023', 5, N'1423893', CAST(1389.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [ProductName], [ProductTypeId], [Articul], [PriceMin]) VALUES (51, N'Моржики', 4, N'243522', CAST(150.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[ProductType] ([Id], [ProductType]) VALUES (1, N' Спам')
INSERT [dbo].[ProductType] ([Id], [ProductType]) VALUES (2, N' Государственная')
INSERT [dbo].[ProductType] ([Id], [ProductType]) VALUES (3, N' Художественная')
INSERT [dbo].[ProductType] ([Id], [ProductType]) VALUES (4, N' Новостная')
INSERT [dbo].[ProductType] ([Id], [ProductType]) VALUES (5, N' Объявления')
INSERT [dbo].[ProductType] ([Id], [ProductType]) VALUES (6, N' Популярное')
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD  CONSTRAINT [FK_Agents_AgentTypes] FOREIGN KEY([AgentTypeId])
REFERENCES [dbo].[AgentTypes] ([Id])
GO
ALTER TABLE [dbo].[Agents] CHECK CONSTRAINT [FK_Agents_AgentTypes]
GO
ALTER TABLE [dbo].[ProductRealization]  WITH CHECK ADD  CONSTRAINT [FK_ProductRealization_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agents] ([Id])
GO
ALTER TABLE [dbo].[ProductRealization] CHECK CONSTRAINT [FK_ProductRealization_Agents]
GO
ALTER TABLE [dbo].[ProductRealization]  WITH CHECK ADD  CONSTRAINT [FK_ProductRealization_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductRealization] CHECK CONSTRAINT [FK_ProductRealization_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
/****** Object:  StoredProcedure [dbo].[Summ]    Script Date: 26.05.2022 9:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Summ] 
@dateFrom Date,
@dateTo Date ,
@sum int output as
select @sum = SUM(pr.Count * p.PriceMin)
from ProductRealization pr join Products p on p.Id = pr.Id
where DateRealization between @dateFrom and @dateTo
GO
USE [master]
GO
ALTER DATABASE [Demo2021] SET  READ_WRITE 
GO
