USE [master]
GO
/****** Object:  Database [CuentaCobrarColegio]    Script Date: 08/06/2014 6:30:07 ******/
CREATE DATABASE [CuentaCobrarColegio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CuentaCobrarColegio', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CuentaCobrarColegio.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CuentaCobrarColegio_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CuentaCobrarColegio_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CuentaCobrarColegio] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CuentaCobrarColegio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CuentaCobrarColegio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET ARITHABORT OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CuentaCobrarColegio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CuentaCobrarColegio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CuentaCobrarColegio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CuentaCobrarColegio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CuentaCobrarColegio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET RECOVERY FULL 
GO
ALTER DATABASE [CuentaCobrarColegio] SET  MULTI_USER 
GO
ALTER DATABASE [CuentaCobrarColegio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CuentaCobrarColegio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CuentaCobrarColegio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CuentaCobrarColegio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CuentaCobrarColegio]
GO
/****** Object:  StoredProcedure [dbo].[proc_EstudianteDelete]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_EstudianteDelete]
(
	@IdEstudiante int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[Estudiante]
	WHERE
		([IdEstudiante] = @IdEstudiante)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_EstudianteInsert]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_EstudianteInsert]
(
	@IdEstudiante int, 
	@NombreEstudiante varchar(20), 
	@PrimerApellidoEstudiante varchar(30) = NULL, 
	@SegundoApellidoEstudiante varchar(30) = NULL, 
	@NombrePadre varchar(20) = NULL, 
	@PrimerApellidoPadre varchar(30) = NULL, 
	@SegundoApellidoPadre varchar(30) = NULL, 
	@NombreMadre varchar(20) = NULL, 
	@PrimerApellidoMadre varchar(30) = NULL, 
	@SegundoApellidoMadre varchar(30) = NULL, 
	@GradoEstudiante varchar(30) = NULL, 
	@Estado varchar(10), 
	@Direccion varchar(100) = NULL, 
	@Telefono varchar(15) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [Estudiante]
	(
		[IdEstudiante], 
		[NombreEstudiante], 
		[PrimerApellidoEstudiante], 
		[SegundoApellidoEstudiante], 
		[NombrePadre], 
		[PrimerApellidoPadre], 
		[SegundoApellidoPadre], 
		[NombreMadre], 
		[PrimerApellidoMadre], 
		[SegundoApellidoMadre], 
		[GradoEstudiante], 
		[Estado], 
		[Direccion], 
		[Telefono]
	)
	
	VALUES
	(
		@IdEstudiante, 
		@NombreEstudiante, 
		@PrimerApellidoEstudiante, 
		@SegundoApellidoEstudiante, 
		@NombrePadre, 
		@PrimerApellidoPadre, 
		@SegundoApellidoPadre, 
		@NombreMadre, 
		@PrimerApellidoMadre, 
		@SegundoApellidoMadre, 
		@GradoEstudiante, 
		@Estado, 
		@Direccion, 
		@Telefono
	)


	SET @Err = @@Error



	

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_EstudianteLoadAll]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_EstudianteLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdEstudiante], 
		[NombreEstudiante], 
		[PrimerApellidoEstudiante], 
		[SegundoApellidoEstudiante], 
		[NombrePadre], 
		[PrimerApellidoPadre], 
		[SegundoApellidoPadre], 
		[NombreMadre], 
		[PrimerApellidoMadre], 
		[SegundoApellidoMadre], 
		[GradoEstudiante], 
		[Estado], 
		[Direccion], 
		[Telefono]
	FROM [dbo].[Estudiante]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_EstudianteLoadByPrimaryKey]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_EstudianteLoadByPrimaryKey]
(
	@IdEstudiante int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdEstudiante], 
		[NombreEstudiante], 
		[PrimerApellidoEstudiante], 
		[SegundoApellidoEstudiante], 
		[NombrePadre], 
		[PrimerApellidoPadre], 
		[SegundoApellidoPadre], 
		[NombreMadre], 
		[PrimerApellidoMadre], 
		[SegundoApellidoMadre], 
		[GradoEstudiante], 
		[Estado], 
		[Direccion], 
		[Telefono]
	FROM [dbo].[Estudiante]
	WHERE
		([IdEstudiante] = @IdEstudiante)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_EstudianteUpdate]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_EstudianteUpdate]
(
	@IdEstudiante int, 
	@NombreEstudiante varchar(20), 
	@PrimerApellidoEstudiante varchar(30) = NULL, 
	@SegundoApellidoEstudiante varchar(30) = NULL, 
	@NombrePadre varchar(20) = NULL, 
	@PrimerApellidoPadre varchar(30) = NULL, 
	@SegundoApellidoPadre varchar(30) = NULL, 
	@NombreMadre varchar(20) = NULL, 
	@PrimerApellidoMadre varchar(30) = NULL, 
	@SegundoApellidoMadre varchar(30) = NULL, 
	@GradoEstudiante varchar(30) = NULL, 
	@Estado varchar(10), 
	@Direccion varchar(100) = NULL, 
	@Telefono varchar(15) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [Estudiante]
	SET
		[NombreEstudiante] = @NombreEstudiante, 
		[PrimerApellidoEstudiante] = @PrimerApellidoEstudiante, 
		[SegundoApellidoEstudiante] = @SegundoApellidoEstudiante, 
		[NombrePadre] = @NombrePadre, 
		[PrimerApellidoPadre] = @PrimerApellidoPadre, 
		[SegundoApellidoPadre] = @SegundoApellidoPadre, 
		[NombreMadre] = @NombreMadre, 
		[PrimerApellidoMadre] = @PrimerApellidoMadre, 
		[SegundoApellidoMadre] = @SegundoApellidoMadre, 
		[GradoEstudiante] = @GradoEstudiante, 
		[Estado] = @Estado, 
		[Direccion] = @Direccion, 
		[Telefono] = @Telefono
	WHERE
		([IdEstudiante] = @IdEstudiante)

	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_FamiliaDelete]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_FamiliaDelete]
(
	@IdFamilia int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[Familia]
	WHERE
		([IdFamilia] = @IdFamilia)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_FamiliaInsert]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_FamiliaInsert]
(
	@IdFamilia int, 
	@NombrePadre varchar(20), 
	@PrimerApellidoPadre varchar(30), 
	@SegundoApellidoPadre varchar(30), 
	@TelefonoPadre varchar(20), 
	@NombreMadre varchar(20), 
	@PrimerApellidoMadre varchar(30), 
	@SegundoApellidoMadre varchar(30), 
	@TelefonoMadre varchar(20), 
	@Direccion varchar(100), 
	@Estado varchar(10)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [Familia]
	(
		[IdFamilia], 
		[NombrePadre], 
		[PrimerApellidoPadre], 
		[SegundoApellidoPadre], 
		[TelefonoPadre], 
		[NombreMadre], 
		[PrimerApellidoMadre], 
		[SegundoApellidoMadre], 
		[TelefonoMadre], 
		[Direccion], 
		[Estado]
	)
	
	VALUES
	(
		@IdFamilia, 
		@NombrePadre, 
		@PrimerApellidoPadre, 
		@SegundoApellidoPadre, 
		@TelefonoPadre, 
		@NombreMadre, 
		@PrimerApellidoMadre, 
		@SegundoApellidoMadre, 
		@TelefonoMadre, 
		@Direccion, 
		@Estado
	)


	SET @Err = @@Error



	

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_FamiliaLoadAll]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_FamiliaLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdFamilia], 
		[NombrePadre], 
		[PrimerApellidoPadre], 
		[SegundoApellidoPadre], 
		[TelefonoPadre], 
		[NombreMadre], 
		[PrimerApellidoMadre], 
		[SegundoApellidoMadre], 
		[TelefonoMadre], 
		[Direccion], 
		[Estado]
	FROM [dbo].[Familia]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_FamiliaLoadByPrimaryKey]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_FamiliaLoadByPrimaryKey]
(
	@IdFamilia int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdFamilia], 
		[NombrePadre], 
		[PrimerApellidoPadre], 
		[SegundoApellidoPadre], 
		[TelefonoPadre], 
		[NombreMadre], 
		[PrimerApellidoMadre], 
		[SegundoApellidoMadre], 
		[TelefonoMadre], 
		[Direccion], 
		[Estado]
	FROM [dbo].[Familia]
	WHERE
		([IdFamilia] = @IdFamilia)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_FamiliaUpdate]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_FamiliaUpdate]
(
	@IdFamilia int, 
	@NombrePadre varchar(20), 
	@PrimerApellidoPadre varchar(30), 
	@SegundoApellidoPadre varchar(30), 
	@TelefonoPadre varchar(20), 
	@NombreMadre varchar(20), 
	@PrimerApellidoMadre varchar(30), 
	@SegundoApellidoMadre varchar(30), 
	@TelefonoMadre varchar(20), 
	@Direccion varchar(100), 
	@Estado varchar(10)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [Familia]
	SET
		[NombrePadre] = @NombrePadre, 
		[PrimerApellidoPadre] = @PrimerApellidoPadre, 
		[SegundoApellidoPadre] = @SegundoApellidoPadre, 
		[TelefonoPadre] = @TelefonoPadre, 
		[NombreMadre] = @NombreMadre, 
		[PrimerApellidoMadre] = @PrimerApellidoMadre, 
		[SegundoApellidoMadre] = @SegundoApellidoMadre, 
		[TelefonoMadre] = @TelefonoMadre, 
		[Direccion] = @Direccion, 
		[Estado] = @Estado
	WHERE
		([IdFamilia] = @IdFamilia)

	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_MenuDelete]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_MenuDelete]
(
	@IdMenu int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[Menu]
	WHERE
		([IdMenu] = @IdMenu)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_MenuInsert]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_MenuInsert]
(
	@IdMenu int, 
	@Nombre varchar(100), 
	@Activa int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [Menu]
	(
		[IdMenu], 
		[Nombre], 
		[Activa]
	)
	
	VALUES
	(
		@IdMenu, 
		@Nombre, 
		@Activa
	)


	SET @Err = @@Error



	

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_MenuLoadAll]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_MenuLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdMenu], 
		[Nombre], 
		[Activa]
	FROM [dbo].[Menu]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_MenuLoadByPrimaryKey]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_MenuLoadByPrimaryKey]
(
	@IdMenu int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdMenu], 
		[Nombre], 
		[Activa]
	FROM [dbo].[Menu]
	WHERE
		([IdMenu] = @IdMenu)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_MenuUpdate]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_MenuUpdate]
(
	@IdMenu int, 
	@Nombre varchar(100), 
	@Activa int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [Menu]
	SET
		[Nombre] = @Nombre, 
		[Activa] = @Activa
	WHERE
		([IdMenu] = @IdMenu)

	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_SubMenuDelete]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SubMenuDelete]
(
	@IdSubMenu int, 
	@IdMenu int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[SubMenu]
	WHERE
		([IdMenu] = @IdMenu) AND 
		([IdSubMenu] = @IdSubMenu)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_SubMenuInsert]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SubMenuInsert]
(
	@IdSubMenu int, 
	@Nombre varchar(100), 
	@IdMenu int, 
	@Activa int = NULL, 
	@Imagen varchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [SubMenu]
	(
		[IdSubMenu], 
		[Nombre], 
		[IdMenu], 
		[Activa], 
		[imagen]
	)
	
	VALUES
	(
		@IdSubMenu, 
		@Nombre, 
		@IdMenu, 
		@Activa, 
		@Imagen
	)


	SET @Err = @@Error



	

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_SubMenuLoadAll]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SubMenuLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdSubMenu], 
		[Nombre], 
		[IdMenu], 
		[Activa], 
		[imagen]
	FROM [dbo].[SubMenu]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_SubMenuLoadByPrimaryKey]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SubMenuLoadByPrimaryKey]
(
	@IdMenu int, 
	@IdSubMenu int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdSubMenu], 
		[Nombre], 
		[IdMenu], 
		[Activa], 
		[imagen]
	FROM [dbo].[SubMenu]
	WHERE
		([IdMenu] = @IdMenu) AND 
		([IdSubMenu] = @IdSubMenu)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_SubMenuUpdate]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SubMenuUpdate]
(
	@IdSubMenu int, 
	@Nombre varchar(100), 
	@IdMenu int, 
	@Activa int = NULL, 
	@Imagen varchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [SubMenu]
	SET
		[Nombre] = @Nombre, 
		[Activa] = @Activa, 
		[imagen] = @Imagen
	WHERE
		([IdMenu] = @IdMenu) AND 
		([IdSubMenu] = @IdSubMenu)

	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UltimaFamilia]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UltimaFamilia]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdFamilia]

	FROM [dbo].[Familia]
	ORDER BY IdFamilia DESC

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UltimoEstudiante]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UltimoEstudiante]

AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[IdEstudiante]

	FROM [dbo].[Estudiante]
	ORDER BY IdEstudiante DESC

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UsuarioBuscarPorIdNombre]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsuarioBuscarPorIdNombre]
(
	@Buscar varchar(99)
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int
	
	SELECT * 
	FROM [dbo].[Usuario]
	WHERE
	CAST(id as varchar(99)) like @Buscar + '%' or
	Nombre like @Buscar + '%'

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UsuarioDelete]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsuarioDelete]
(
	@Id int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[Usuario]
	WHERE
		([Id] = @Id)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UsuarioInsert]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsuarioInsert]
(
	@Id int, 
	@Nombre varchar(20), 
	@PrimerApellido varchar(30) = NULL, 
	@SegundoApellido varchar(30) = NULL, 
	@Direccion varchar(20) = NULL, 
	@Telefono varchar(30) = NULL, 
	@Clave varchar(30)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	
	
	INSERT
	INTO [Usuario]
	(
		[Id], 
		[Nombre], 
		[PrimerApellido], 
		[SegundoApellido], 
		[Direccion], 
		[Telefono], 
		[Clave]
	)
	
	VALUES
	(
		@Id, 
		@Nombre, 
		@PrimerApellido, 
		@SegundoApellido, 
		@Direccion, 
		@Telefono, 
		@Clave
	)


	SET @Err = @@Error



	

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UsuarioLoadAll]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsuarioLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Id], 
		[Nombre], 
		[PrimerApellido], 
		[SegundoApellido], 
		[Direccion], 
		[Telefono], 
		[Clave]
	FROM [dbo].[Usuario]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UsuarioLoadByPrimaryKey]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsuarioLoadByPrimaryKey]
(
	@Id int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Id], 
		[Nombre], 
		[PrimerApellido], 
		[SegundoApellido], 
		[Direccion], 
		[Telefono], 
		[Clave]
	FROM [dbo].[Usuario]
	WHERE
		([Id] = @Id)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UsuarioUpdate]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsuarioUpdate]
(
	@Id int, 
	@Nombre varchar(20), 
	@PrimerApellido varchar(30) = NULL, 
	@SegundoApellido varchar(30) = NULL, 
	@Direccion varchar(20) = NULL, 
	@Telefono varchar(30) = NULL, 
	@Clave varchar(30)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	
	
	

	UPDATE [Usuario]
	SET
		[Nombre] = @Nombre, 
		[PrimerApellido] = @PrimerApellido, 
		[SegundoApellido] = @SegundoApellido, 
		[Direccion] = @Direccion, 
		[Telefono] = @Telefono, 
		[Clave] = @Clave
	WHERE
		([Id] = @Id)

	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[ultimoUsuario]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ultimoUsuario]

AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT count(*)+1 as ultimoUser
	FROM [dbo].[Usuario]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[validarUsuario]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[validarUsuario]
(
	@Id int,
	@Clave varchar(30)
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT 		
		[Nombre], 
		[PrimerApellido], 
		[SegundoApellido]
		
	FROM [dbo].[Usuario]
	WHERE
	([Id] = @Id) AND ([Clave] = @Clave)
	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estudiante](
	[IdEstudiante] [int] NOT NULL,
	[NombreEstudiante] [varchar](20) NOT NULL,
	[PrimerApellidoEstudiante] [varchar](30) NULL,
	[SegundoApellidoEstudiante] [varchar](30) NULL,
	[NombrePadre] [varchar](20) NULL,
	[PrimerApellidoPadre] [varchar](30) NULL,
	[SegundoApellidoPadre] [varchar](30) NULL,
	[NombreMadre] [varchar](20) NULL,
	[PrimerApellidoMadre] [varchar](30) NULL,
	[SegundoApellidoMadre] [varchar](30) NULL,
	[GradoEstudiante] [varchar](30) NULL,
	[Estado] [varchar](10) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
	[FamiliaId] [int] NULL,
 CONSTRAINT [PK_IdEstudiante] PRIMARY KEY CLUSTERED 
(
	[IdEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Familia]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Familia](
	[IdFamilia] [int] NOT NULL,
	[NombrePadre] [varchar](20) NOT NULL,
	[PrimerApellidoPadre] [varchar](30) NOT NULL,
	[SegundoApellidoPadre] [varchar](30) NOT NULL,
	[TelefonoPadre] [varchar](20) NOT NULL,
	[NombreMadre] [varchar](20) NOT NULL,
	[PrimerApellidoMadre] [varchar](30) NOT NULL,
	[SegundoApellidoMadre] [varchar](30) NOT NULL,
	[TelefonoMadre] [varchar](20) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_IdFamilia] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Activa] [int] NULL,
 CONSTRAINT [PK_IdMenu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubMenu]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubMenu](
	[IdSubMenu] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdMenu] [int] NOT NULL,
	[Activa] [int] NULL,
	[imagen] [varchar](250) NULL,
 CONSTRAINT [PK_SubMenu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC,
	[IdSubMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/06/2014 6:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[PrimerApellido] [varchar](30) NULL,
	[SegundoApellido] [varchar](30) NULL,
	[Direccion] [varchar](20) NULL,
	[Telefono] [varchar](30) NULL,
	[Clave] [varchar](30) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Estudiante] ([IdEstudiante], [NombreEstudiante], [PrimerApellidoEstudiante], [SegundoApellidoEstudiante], [NombrePadre], [PrimerApellidoPadre], [SegundoApellidoPadre], [NombreMadre], [PrimerApellidoMadre], [SegundoApellidoMadre], [GradoEstudiante], [Estado], [Direccion], [Telefono], [FamiliaId]) VALUES (1, N'roberto', N'cabrera', N'rosario', N'miguel', N'liriano', N'santana', N'maria', N'ana', N'gonzales', N'2', N'1', N'calle 5 no.58', N'809-718-7047', 1)
INSERT [dbo].[Estudiante] ([IdEstudiante], [NombreEstudiante], [PrimerApellidoEstudiante], [SegundoApellidoEstudiante], [NombrePadre], [PrimerApellidoPadre], [SegundoApellidoPadre], [NombreMadre], [PrimerApellidoMadre], [SegundoApellidoMadre], [GradoEstudiante], [Estado], [Direccion], [Telefono], [FamiliaId]) VALUES (2, N'other student', N'land', N'store', N'', N'', N'', N'', N'', N'', N'2', N'1', N'street 5, no. 60', N'809-748-4151', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombrePadre], [PrimerApellidoPadre], [SegundoApellidoPadre], [TelefonoPadre], [NombreMadre], [PrimerApellidoMadre], [SegundoApellidoMadre], [TelefonoMadre], [Direccion], [Estado]) VALUES (1, N'miguel', N'liri', N'manolo', N'809-576-1980', N'maria', N'lana', N'peña', N'809-718-748', N'calle 5, no 58 ', N'1')
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (1, N'Archivos', 1)
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (2, N'Ingresos', 1)
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (3, N'Facturacion', 1)
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (4, N'Reportes', 1)
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Activa]) VALUES (5, N'Herramientas', 1)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, N'Familia', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, N'Alumnos', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (3, N'Usuario', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (4, N'Tabla de Cuentas', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (5, N'Condicion Docente', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (6, N'Salir del Sistema', 1, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, N'Recibos por Cuotas', 2, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, N'Recibos de Admision', 2, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (3, N'Consulta Pagos de Familia', 2, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (4, N'Cuadre de Ingresos Diarios', 2, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, N'Cuotas de Periodo', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, N'Actualiza Cuotas', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (3, N'Hoja Control de Pagos', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (4, N'Estados de Cuentas', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (5, N'Estados Resumidos', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (6, N'cuentas por Cobrar', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (7, N'Proyeccion de Ingresos', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (8, N'Mover al Historico', 3, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, N'Consulta Seccion', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, N'Alumnos por Cursos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (3, N'Estudiantes Becados', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (4, N'Familias con Hijos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (5, N'Form, Reinscripcion', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (6, N'Alumnos con Atrasos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (7, N'Familias por Cursos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (8, N'Alumnos Pre-Inscritos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (9, N'Alumnos no Pre-Inscritos', 4, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (1, N'Seguridad', 5, 1, NULL)
INSERT [dbo].[SubMenu] ([IdSubMenu], [Nombre], [IdMenu], [Activa], [imagen]) VALUES (2, N'Backup', 5, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Direccion], [Telefono], [Clave]) VALUES (1, N'miguel', N'liriano', N'Santos', N'calle 3, 58', N'809-575-4199', N'123')
INSERT [dbo].[Usuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Direccion], [Telefono], [Clave]) VALUES (2, N'charlie', N'escoboza', N'garcia', N'calle 5, 59', N'809-541-7415', N'1234')
INSERT [dbo].[Usuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Direccion], [Telefono], [Clave]) VALUES (3, N'pedro', N'santana', N'rosario', N'calle 4, #58', N'809-576-1980', N'12345')
INSERT [dbo].[Usuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Direccion], [Telefono], [Clave]) VALUES (4, N'Pedro ', N'Santana', N'Liriano', N'calle 5, No. 65', N'809-573-1541', N'12345')
INSERT [dbo].[Usuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Direccion], [Telefono], [Clave]) VALUES (5, N'Ramon', N'Peña', N'Faña', N'calle 5, No 60', N'809-574-5415', N'2514')
INSERT [dbo].[Usuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Direccion], [Telefono], [Clave]) VALUES (6, N'pedro', N'santana', N'Rosario', N'Calle 20', N'8097418', N'1597')
INSERT [dbo].[Usuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Direccion], [Telefono], [Clave]) VALUES (7, N'monicat', N'lugo', N'lima', N'calle 10', N'809-417-041', N'12345')
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_familiaId] FOREIGN KEY([FamiliaId])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_familiaId]
GO
USE [master]
GO
ALTER DATABASE [CuentaCobrarColegio] SET  READ_WRITE 
GO
