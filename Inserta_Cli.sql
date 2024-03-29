USE [Inventario]
GO
/****** Object:  StoredProcedure [dbo].[Inserta_Cli]    Script Date: 05/03/2021 11:21:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Inserta_Cli]
	@idtipocli varchar(5),
	@nombre varchar(150),
	@direccion varchar(200),
	@correo varchar(50),
	@telefono varchar(10)
AS
BEGIN
	
	SET NOCOUNT ON;
	declare @existe int
	set @existe = (select case when count(*) > 0 then count(*) else 0 end from Cliente where nombre = @nombre)

	if @existe = 0
	begin
		insert into Cliente(idtipocli, nombre,	direccion,	correo,	telefono)
		values(@idtipocli, @nombre, @direccion, @correo, @telefono)
		select @@IDENTITY
	end
	else
	begin
		print('El Cliente Ya Existe')
	end
END
