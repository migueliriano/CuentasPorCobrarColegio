
USE [CuentaCobrarColegio]
GO

CREATE PROCEDURE [dbo].[ultimoUsuario]
(
	@Id int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT COUNT(*)
	FROM [dbo].[Usuario]

	SET @Err = @@Error

	RETURN @Err
END
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

	SELECT COUNT(*)
	FROM [dbo].[Usuario]
	WHERE
	([Id] = @Id) AND ([Clave] = @Clave)
	SET @Err = @@Error

	RETURN @Err
END
GO	


/****** Object:  StoredProcedure [dbo].[proc_UsuarioLoadByPrimaryKey] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_UsuarioLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_UsuarioLoadByPrimaryKey];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsuarioLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsuarioLoadByPrimaryKey Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_UsuarioLoadAll] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_UsuarioLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_UsuarioLoadAll];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsuarioLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsuarioLoadAll Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_UsuarioUpdate] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_UsuarioUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_UsuarioUpdate];
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



-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsuarioUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsuarioUpdate Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_UsuarioInsert] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_UsuarioInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_UsuarioInsert];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsuarioInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsuarioInsert Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_UsuarioDelete] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_UsuarioDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_UsuarioDelete];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsuarioDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsuarioDelete Error on Creation'
GO 

