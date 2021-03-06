USE [master]
GO
/****** Object:  Database [DBAgenciaFB]    Script Date: 4/03/2019 10:34:56 a. m. ******/
CREATE DATABASE [DBAgenciaFB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBAgenciaFB', FILENAME = N'C:\Users\PC\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\DBAgenciaFB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBAgenciaFB_log', FILENAME = N'C:\Users\PC\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\DBAgenciaFB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBAgenciaFB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBAgenciaFB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBAgenciaFB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [DBAgenciaFB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [DBAgenciaFB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [DBAgenciaFB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [DBAgenciaFB] SET ARITHABORT ON 
GO
ALTER DATABASE [DBAgenciaFB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBAgenciaFB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [DBAgenciaFB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [DBAgenciaFB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [DBAgenciaFB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBAgenciaFB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBAgenciaFB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET RECOVERY FULL 
GO
ALTER DATABASE [DBAgenciaFB] SET  MULTI_USER 
GO
ALTER DATABASE [DBAgenciaFB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBAgenciaFB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBAgenciaFB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBAgenciaFB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBAgenciaFB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBAgenciaFB] SET QUERY_STORE = OFF
GO
USE [DBAgenciaFB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DBAgenciaFB]
GO
/****** Object:  Table [dbo].[AsesorVenta]    Script Date: 4/03/2019 10:34:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsesorVenta](
	[IdAsesorVenta] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[NumDocumento] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAsesorVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 4/03/2019 10:34:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 4/03/2019 10:34:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[TipoCliente] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[TipoDocumento] [varchar](20) NOT NULL,
	[NumDocumento] [varchar](20) NOT NULL,
	[FechaNacimiento] [datetime] NULL,
	[Direccion] [varchar](70) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompañiaAseguradora]    Script Date: 4/03/2019 10:34:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompañiaAseguradora](
	[IdCompañia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompañia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 4/03/2019 10:34:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Precio] [decimal](11, 2) NOT NULL,
	[Descuento] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 4/03/2019 10:34:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](256) NULL,
	[Cobertura] [varchar](256) NOT NULL,
	[Exclusion] [varchar](256) NOT NULL,
	[DocExpedicion] [varchar](256) NULL,
	[PrecioVenta] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 4/03/2019 10:34:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdAsesorVenta] [int] NOT NULL,
	[IdCompañia] [int] NOT NULL,
	[NumComprobante] [varchar](10) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Total] [decimal](11, 2) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AsesorVenta] ON 

INSERT [dbo].[AsesorVenta] ([IdAsesorVenta], [Nombres], [Apellidos], [NumDocumento]) VALUES (1, N'José Antonio', N'Martínez', N'1065789741')
INSERT [dbo].[AsesorVenta] ([IdAsesorVenta], [Nombres], [Apellidos], [NumDocumento]) VALUES (2, N'Ana Lucía', N'Hernandez', N'10657891')
INSERT [dbo].[AsesorVenta] ([IdAsesorVenta], [Nombres], [Apellidos], [NumDocumento]) VALUES (4, N'María Fernanda', N'Rodriguez', N'10657123')
SET IDENTITY_INSERT [dbo].[AsesorVenta] OFF
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (1, N'Seguros de vida', N'Cubre el riesgo de muerte, supervivencia e incapacidad. El seguro de vida cubre los riesgos que puedan afectar a la existencia, integridad o salud de las personas.')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (2, N'Seguros de hogar', N'El Seguro de Hogar de la Agencia de Seguros Falabella protege tu inmueble y/o contenidos.')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (3, N'Seguros de salud', N'Protege tu hogar con Agencia de Seguros Falabella. Con los Seguros de Hogar podrás disfrutar del seguro que protege tu inmueble, con el respaldo de Compañías Aseguradoras de gran reconocimiento en Colombia.')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (1004, N'Seguros de Auto', N'El Seguro de auto de y nada mas que autos yes of course')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (2003, N'Seguro de moto', N'En Agencia de Seguros Falabella encontrarás el seguro que más te conviene a la hora de conducir tu moto, porque nos preocupamos por ofrecerte diferentes opciones con excelentes compañías que te brindan respaldo cuando más lo necesitas')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [TipoCliente], [Nombre], [TipoDocumento], [NumDocumento], [FechaNacimiento], [Direccion], [Telefono], [Email]) VALUES (1, N'Persona', N'Juan Sebastian martinez', N'CEDULA', N'1065654789', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Cl. 74a #63-4', N'57815545', N'juanmartinez@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [TipoCliente], [Nombre], [TipoDocumento], [NumDocumento], [FechaNacimiento], [Direccion], [Telefono], [Email]) VALUES (2, N'Persona', N'Juan Pablo Lopez', N'Cedula', N'1065657951', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Cl. 74a #62-5', N'57815545', N'juanpablo@hotmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [TipoCliente], [Nombre], [TipoDocumento], [NumDocumento], [FechaNacimiento], [Direccion], [Telefono], [Email]) VALUES (3, N'Persona', N'Sara Sofía Torres', N'Cedula', N'1065852741', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Cl. 80a #62-9', N'57878965', N'sarast@gmail.com')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[CompañiaAseguradora] ON 

INSERT [dbo].[CompañiaAseguradora] ([IdCompañia], [Nombre], [Descripcion]) VALUES (1, N'Equidad Seguros ', N'Somos una aseguradora cooperativa constituida para fomentar cultura de previsión y asegurar a las personas, sus familias, sus bienes y sus empresas.')
INSERT [dbo].[CompañiaAseguradora] ([IdCompañia], [Nombre], [Descripcion]) VALUES (2, N'Sura Seguros', N'Te ofrecemos lo que necesitas para que te asegures de vivir al máximo.')
SET IDENTITY_INSERT [dbo].[CompañiaAseguradora] OFF
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 

INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Precio], [Descuento]) VALUES (1, 1, 1, CAST(10000000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)))
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Precio], [Descuento]) VALUES (2, 3, 3, CAST(10000000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)))
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Precio], [Descuento]) VALUES (3, 4, 13, CAST(10000000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)))
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Descripcion], [Cobertura], [Exclusion], [DocExpedicion], [PrecioVenta]) VALUES (1, 1, N'Vida Individual', N'Este producto que está diseñado para atender segmentos de clientes o asociados, tiene por objeto otorgar cobertura en forma individual.', N'Muerte por cualquier causa, incapacidad total y permanente.', N'Suicidio o tentativa de suicidio ocurrido dentro del primer año de haber contratado la póliza', N'- Solicitud de seguro.
- Formato de historia médica cuando se requiera.
- Exámenes médicos cuando se requiera.', CAST(1000000.00 AS Decimal(11, 2)))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Descripcion], [Cobertura], [Exclusion], [DocExpedicion], [PrecioVenta]) VALUES (2, 1, N'Vida Grupo Familiar', N'Indemnizar a los beneficiarios o al propio asegurado ante la ocurrencia de uno de los riesgos amparados.', N'Muerte por cualquier causa diferente a las excluidas en la póliza', N'Tener menos de 71 años de edad para la cobertura del riesgo de muerte', N'- Slip para Suscripción Ramos de Vida cuando se requiera según valor asegurado.', CAST(50000000.00 AS Decimal(11, 2)))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Descripcion], [Cobertura], [Exclusion], [DocExpedicion], [PrecioVenta]) VALUES (3, 2, N'Vivienda Segura', N'Amparar el patrimonio familiar representado en las casas de habitación o apartamentos, por los daños o pérdidas que se causen a consecuencia de accidentes, fenómenos de la naturaleza o actos de terceros,', N'Daños y pérdidas materiales', N'Terremoto, reacciones o explosiones, emision de radiaciones', N'- Solicitud de seguro diligenciada', CAST(30000000.00 AS Decimal(11, 2)))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Descripcion], [Cobertura], [Exclusion], [DocExpedicion], [PrecioVenta]) VALUES (13, 1004, N'Vehículos Servicio Público', N'Resarce al propietario del vehículo de servicio público asegurado, los daños o el robo que este sufra, igualmente se cubren los perjuicios patrimoniales por daños materiales, lesiones o muerte accidental de terceras personas.', N'Pérdida total del vehículo por daños Pérdida parcial del vehículo por daños', N'Muerte o lesiones a ocupantes del vehículo asegurado.', N'Solicitud de Seguro debidamente diligenciada', CAST(10000000.00 AS Decimal(11, 2)))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Descripcion], [Cobertura], [Exclusion], [DocExpedicion], [PrecioVenta]) VALUES (14, 1004, N'RCC Transporte Público', N'Indemnizar por intermedio del tomador a los pasajeros del vehículo asegurado que sufran lesiones corporales derivadas de la Responsabilidad Civil Contractual en que incurra el transportador del vehículo asegurado', N'Muerte adicional, Incapacidad permanente o temporal, Gastos médicos, quirúrgicos, farmacéuticos y hospitalarios, asistencia jurídica.', N'Terremoto, erupción volcánica, marejada, inundaciones, crecientes o modificación de la estructura de los átomos.', N'Carta del tomador solicitando la póliza o aceptando la cotización.', CAST(25000000.00 AS Decimal(11, 2)))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([IdVenta], [IdCliente], [IdAsesorVenta], [IdCompañia], [NumComprobante], [Fecha], [Total], [Estado]) VALUES (1, 1, 1, 1, N'0001', CAST(N'2019-01-03T00:00:00.000' AS DateTime), CAST(10000000.00 AS Decimal(11, 2)), N'Aceptado')
INSERT [dbo].[Venta] ([IdVenta], [IdCliente], [IdAsesorVenta], [IdCompañia], [NumComprobante], [Fecha], [Total], [Estado]) VALUES (3, 2, 1, 2, N'0002', CAST(N'2019-01-03T00:00:00.000' AS DateTime), CAST(30000000.00 AS Decimal(11, 2)), N'Aceptado')
INSERT [dbo].[Venta] ([IdVenta], [IdCliente], [IdAsesorVenta], [IdCompañia], [NumComprobante], [Fecha], [Total], [Estado]) VALUES (4, 3, 4, 2, N'0004', CAST(N'2019-01-03T00:00:00.000' AS DateTime), CAST(10000000.00 AS Decimal(11, 2)), N'Aceptado')
SET IDENTITY_INSERT [dbo].[Venta] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__75E3EFCF1BBF7ED3]    Script Date: 4/03/2019 10:34:58 a. m. ******/
ALTER TABLE [dbo].[Categoria] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Producto__75E3EFCFBEEDD845]    Script Date: 4/03/2019 10:34:58 a. m. ******/
ALTER TABLE [dbo].[Producto] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([IdAsesorVenta])
REFERENCES [dbo].[AsesorVenta] ([IdAsesorVenta])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([IdCompañia])
REFERENCES [dbo].[CompañiaAseguradora] ([IdCompañia])
GO
USE [master]
GO
ALTER DATABASE [DBAgenciaFB] SET  READ_WRITE 
GO
