

USE [CuentaCobrarColegio]
GO

/****** Object:  StoredProcedure [dbo].[proc_EstudianteLoadByPrimaryKey] Script Date: 5/29/2014 2:43:15 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_EstudianteLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_EstudianteLoadByPrimaryKey];
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
		[Estado]
	FROM [dbo].[Estudiante]
	WHERE
		([IdEstudiante] = @IdEstudiante)

	SET @Err = @@Error

	RETURN @Err
END
GO	


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EstudianteLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_EstudianteLoadByPrimaryKey Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_EstudianteLoadAll] Script Date: 5/29/2014 2:43:15 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_EstudianteLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_EstudianteLoadAll];
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
		[Estado]
	FROM [dbo].[Estudiante]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EstudianteLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_EstudianteLoadAll Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_EstudianteUpdate] Script Date: 5/29/2014 2:43:15 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_EstudianteUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_EstudianteUpdate];
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
	@GradoEstudiante varchar(15), 
	@Estado varchar(10)
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
		[Estado] = @Estado
	WHERE
		([IdEstudiante] = @IdEstudiante)

	SET @Err = @@Error


	RETURN @Err
END
GO



-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EstudianteUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_EstudianteUpdate Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_EstudianteInsert] Script Date: 5/29/2014 2:43:15 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_EstudianteInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_EstudianteInsert];
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
	@GradoEstudiante varchar(15), 
	@Estado varchar(10)
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
		[Estado]
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
		@Estado
	)


	SET @Err = @@Error



	

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EstudianteInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_EstudianteInsert Error on Creation'
GO 


/****** Object:  StoredProcedure [dbo].[proc_EstudianteDelete] Script Date: 5/29/2014 2:43:15 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[proc_EstudianteDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[proc_EstudianteDelete];
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EstudianteDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_EstudianteDelete Error on Creation'
GO 

