
USE [CuentaCobrarColegio]
GO

/****** Object:  StoredProcedure [dbo].[proc_MenuLoadByPrimaryKey] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_MenuLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_MenuLoadByPrimaryKey];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MenuLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MenuLoadByPrimaryKey Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_MenuLoadAll] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_MenuLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_MenuLoadAll];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MenuLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MenuLoadAll Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_MenuUpdate] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_MenuUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_MenuUpdate];
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



-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MenuUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MenuUpdate Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_MenuInsert] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_MenuInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_MenuInsert];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MenuInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MenuInsert Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_MenuDelete] Script Date: 19/5/14 10:03:13 p. m. ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_MenuDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_MenuDelete];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MenuDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MenuDelete Error on Creation'
GO 

