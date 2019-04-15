USE [master]
GO
/****** Object:  Database [BancoCentral]    Script Date: 23/3/2019 14:02:58 ******/
CREATE DATABASE [BancoCentral]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BancoCentral', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BancoCentral.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BancoCentral_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BancoCentral_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BancoCentral] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BancoCentral].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BancoCentral] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BancoCentral] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BancoCentral] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BancoCentral] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BancoCentral] SET ARITHABORT OFF 
GO
ALTER DATABASE [BancoCentral] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BancoCentral] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BancoCentral] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BancoCentral] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BancoCentral] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BancoCentral] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BancoCentral] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BancoCentral] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BancoCentral] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BancoCentral] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BancoCentral] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BancoCentral] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BancoCentral] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BancoCentral] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BancoCentral] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BancoCentral] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BancoCentral] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BancoCentral] SET RECOVERY FULL 
GO
ALTER DATABASE [BancoCentral] SET  MULTI_USER 
GO
ALTER DATABASE [BancoCentral] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BancoCentral] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BancoCentral] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BancoCentral] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BancoCentral] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BancoCentral', N'ON'
GO
ALTER DATABASE [BancoCentral] SET QUERY_STORE = OFF
GO
USE [BancoCentral]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 23/3/2019 14:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria](
	[idAuditoria] [int] IDENTITY(1,1) NOT NULL,
	[accion] [varchar](100) NOT NULL,
	[fechaEjecucion] [datetime] NOT NULL,
	[quienEjecuto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Auditoria] PRIMARY KEY CLUSTERED 
(
	[idAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 23/3/2019 14:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[idCanton] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[provinciaId] [int] NOT NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[idCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/3/2019 14:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidoPaterno] [varchar](50) NOT NULL,
	[apellidoMaterno] [varchar](50) NULL,
	[cedula] [int] NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[profesion] [varchar](50) NULL,
	[ultimaFechaIng] [Datetime] NOT NULL,
	[distritoId] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteIndicador]    Script Date: 23/3/2019 14:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteIndicador](
	[idIndicadorCliente] [int] IDENTITY(1,1) NOT NULL,
	[indicadorId] [int] NOT NULL,
	[clienteId] [int] NOT NULL,
 CONSTRAINT [PK_ClienteIndicador] PRIMARY KEY CLUSTERED 
(
	[idIndicadorCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 23/3/2019 14:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[idDistrito] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cantonId] [int] NOT NULL,
 CONSTRAINT [PK_Distrito] PRIMARY KEY CLUSTERED 
(
	[idDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indicador]    Script Date: 23/3/2019 14:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indicador](
	[idIndicador] [int] IDENTITY(1,1) NOT NULL,
	[indicador] [varchar](50) NOT NULL,
	[grafico] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Indicador] PRIMARY KEY CLUSTERED 
(
	[idIndicador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 23/3/2019 14:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idPronvincia] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[idPronvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (1, N'San José', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (2, N'Escazú', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (3, N'Desamparados', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (4, N'Puriscal', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (5, N'Tarrazú', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (6, N'Aserrí', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (7, N'Mora', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (8, N'Goicochea', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (9, N'Santa Ana', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (10, N'Alajuelita', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (11, N'Vásquez de Coronado', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (12, N'Acosta', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (13, N'Tibás', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (14, N'Moravia', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (15, N'Montes de Oca', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (16, N'Turrubares', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (17, N'Dota', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (18, N'Curridabat', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (19, N'Pérez Zeledón', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (20, N'León Cortés', 1)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (21, N'Alajuela', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (22, N'San Ramón', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (23, N'Grecia', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (24, N'San Mateo', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (25, N'Atenas', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (26, N'Naranjo', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (27, N'Palmares', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (28, N'Poás', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (29, N'Orotina', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (30, N'San Carlos', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (31, N'Zarcero', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (32, N'Valverde Vega', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (33, N'Upala', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (34, N'Los Chiles', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (35, N'Guatuso', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (36, N'Río Cuarto', 2)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (37, N'Cartago', 3)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (38, N'Paraíso', 3)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (39, N'La Unión', 3)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (40, N'Jiménez', 3)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (41, N'Turrialba', 3)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (42, N'Alvarado', 3)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (43, N'Oreamuno', 3)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (44, N'El Guarco', 3)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (45, N'Heredia', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (46, N'Barva', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (47, N'Santo Domingo', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (48, N'Santa Bárbara', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (49, N'San Rafael', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (50, N'San Isidro', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (51, N'Belén', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (52, N'Flores', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (53, N'San Pablo', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (54, N'Sarapiquí', 4)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (55, N'Liberia', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (56, N'Nicoya', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (57, N'Santa Cruz', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (58, N'Bagaces', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (59, N'Carrillo', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (60, N'Cañas', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (61, N'Abangares', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (62, N'Tilarán', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (63, N'Nandayure', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (64, N'La Cruz', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (65, N'Hojancha', 5)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (66, N'Puntarenas', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (67, N'Esparza', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (68, N'Buenos Aires', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (69, N'Montes de Oro', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (70, N'Osa', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (71, N'Quepos', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (72, N'Golfito', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (73, N'Coto Brus', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (74, N'Parrita', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (75, N'Corredores', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (76, N'Garabito', 6)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (77, N'Limón', 7)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (78, N'Pococí', 7)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (79, N'Siquirres', 7)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (80, N'Talamanca', 7)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (81, N'Matina', 7)
INSERT [dbo].[Canton] ([idCanton], [nombre], [provinciaId]) VALUES (82, N'Guácimo', 7)
INSERT [dbo].[Provincia] ([idPronvincia], [nombre]) VALUES (1, N'San José')
INSERT [dbo].[Provincia] ([idPronvincia], [nombre]) VALUES (2, N'Alajuela')
INSERT [dbo].[Provincia] ([idPronvincia], [nombre]) VALUES (3, N'Cartago')
INSERT [dbo].[Provincia] ([idPronvincia], [nombre]) VALUES (4, N'Heredia')
INSERT [dbo].[Provincia] ([idPronvincia], [nombre]) VALUES (5, N'Guanacaste')
INSERT [dbo].[Provincia] ([idPronvincia], [nombre]) VALUES (6, N'Puntarenas')
INSERT [dbo].[Provincia] ([idPronvincia], [nombre]) VALUES (7, N'Limón')
INSERT [dbo].[Distrito] ([idDistrito], [nombre], [cantonId]) VALUES (1, N'Las Américas',41)
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD  CONSTRAINT [FK_Canton_Provincia] FOREIGN KEY([provinciaId])
REFERENCES [dbo].[Provincia] ([idPronvincia])
GO
ALTER TABLE [dbo].[Canton] CHECK CONSTRAINT [FK_Canton_Provincia]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Distrito] FOREIGN KEY([distritoId])
REFERENCES [dbo].[Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Distrito]
GO
ALTER TABLE [dbo].[ClienteIndicador]  WITH CHECK ADD  CONSTRAINT [FK_ClienteIndicador_Cliente] FOREIGN KEY([clienteId])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[ClienteIndicador] CHECK CONSTRAINT [FK_ClienteIndicador_Cliente]
GO
ALTER TABLE [dbo].[ClienteIndicador]  WITH CHECK ADD  CONSTRAINT [FK_ClienteIndicador_Indicador] FOREIGN KEY([indicadorId])
REFERENCES [dbo].[Indicador] ([idIndicador])
GO
ALTER TABLE [dbo].[ClienteIndicador] CHECK CONSTRAINT [FK_ClienteIndicador_Indicador]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [FK_Distrito_Canton] FOREIGN KEY([cantonId])
REFERENCES [dbo].[Canton] ([idCanton])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [FK_Distrito_Canton]
GO
USE [master]
GO
ALTER DATABASE [BancoCentral] SET  READ_WRITE 
GO

