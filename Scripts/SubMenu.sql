
USE [CuentaCobrarColegio]
GO

/****** Object:  StoredProcedure [dbo].[proc_SubMenuLoadByPrimaryKey] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_SubMenuLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_SubMenuLoadByPrimaryKey];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubMenuLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubMenuLoadByPrimaryKey Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_SubMenuLoadAll] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_SubMenuLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_SubMenuLoadAll];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubMenuLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubMenuLoadAll Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_SubMenuUpdate] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_SubMenuUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_SubMenuUpdate];
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



-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubMenuUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubMenuUpdate Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_SubMenuInsert] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_SubMenuInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_SubMenuInsert];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubMenuInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubMenuInsert Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_SubMenuDelete] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_SubMenuDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_SubMenuDelete];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubMenuDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubMenuDelete Error on Creation'
GO 

