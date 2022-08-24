USE [Inventario]
GO
/****** Object:  StoredProcedure [dbo].[Inserta_Categoria]    Script Date: 19/02/2021 11:14:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Inserta_Categoria]
	@categoria varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	declare @existe int 
	set @existe = (select case when count(*) > 0 then count(*) else 0 end from catprod where nombre = @categoria)

	if @existe = 0
	begin
			insert into catprod (nombre) values(@categoria)
			select @@IDENTITY
		end
		else
		begin
			print('La categoria ya existe')
		end
END