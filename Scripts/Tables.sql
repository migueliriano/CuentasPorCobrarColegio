CREATE TABLE [dbo].[Estudiante](
	[IdEstudiante] [int] NOT NULL,
	[NombreEstudiante] [varchar](20) NOT NULL, 
	[PrimerApellidoEstudiante] [varchar](30), 
	[SegundoApellidoEstudiante] [varchar](30), 
	[NombrePadre] [varchar](20), 
	[PrimerApellidoPadre] [varchar](30), 
	[SegundoApellidoPadre] [varchar](30), 
	[NombreMadre] [varchar](20), 
	[PrimerApellidoMadre] [varchar](30), 
	[SegundoApellidoMadre] [varchar](30), 
	[GradoEstudiante] [varchar](15) NOT NULL, 
	[Estado] [varchar](10) NOT NULL
 CONSTRAINT [PK_IdEstudiante] PRIMARY KEY (IdEstudiante)
)
GO


go

CREATE TABLE [dbo].[Usuario](
	[Id] [int] NOT NULL, 
	[Nombre] [varchar](20) NOT NULL, 
	[PrimerApellido] [varchar](30), 
	[SegundoApellido] [varchar](30), 
	[Direccion] [varchar](20), 
	[Telefono] [varchar](30), 
	[Clave] [varchar](30)
 CONSTRAINT [PK_Usuario] PRIMARY KEY (Id)
)
GO

CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Activa] [int] NULL,
 CONSTRAINT [PK_IdMenu] PRIMARY KEY (IdMenu)
)
GO
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (1, 'Archivos', 1)
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (2, 'Ingresos', 1)
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (3, 'Facturacion', 1)
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (4, 'Reportes', 1)
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (5, 'Herramientas', 1)

--select * from Menu

go

CREATE TABLE [dbo].[SubMenu](
	[IdSubMenu] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdMenu] [int] NOT NULL,
	[Activa] [int] NULL,
	[imagen] [varchar](250) NULL,
 CONSTRAINT [PK_SubMenu] PRIMARY KEY (IdMenu,IdSubMenu)
)
GO

INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, 'Familia', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, 'Alumnos', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (3, 'Tabla de Costos', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (4, 'Tabla de Cuentas', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (5, 'Condicion Docente', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (6, 'Salir del Sistema', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, 'Recibos por Cuotas', 2, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, 'Recibos de Admision', 2, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (3, 'Consulta Pagos de Familia', 2, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (4, 'Cuadre de Ingresos Diarios', 2, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, 'Cuotas de Periodo', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, 'Actualiza Cuotas', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (3, 'Hoja Control de Pagos', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (4, 'Estados de Cuentas', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (5, 'Estados Resumidos', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (6, 'cuentas por Cobrar', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (7, 'Proyeccion de Ingresos', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (8, 'Mover al Historico', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, 'Consulta Seccion', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, 'Alumnos por Cursos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (3, 'Estudiantes Becados', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (4, 'Familias con Hijos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (5, 'Form, Reinscripcion', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (6, 'Alumnos con Atrasos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (7, 'Familias por Cursos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (8, 'Alumnos Pre-Inscritos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (9, 'Alumnos no Pre-Inscritos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, 'Seguridad', 5, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, 'Backup', 5, 1, NULL)
go
