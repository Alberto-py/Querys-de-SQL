USE [Inventario]
GO
/****** Object:  StoredProcedure [dbo].[Inserta_Producto]    Script Date: 19/02/2021 11:13:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Inserta_Producto]
	@nombreprod varchar(50),
	@categoria varchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	declare @existe int 
	set @existe = (select case when count(*) > 0 then count(*) else 0 end from producto where nombre = @nombreprod)
	declare @idcatprod int

	if @existe = 0
	begin
		
		set @idcatprod = (select case when idcatprod > 0 then idcatprod else 0 end from catprod where nombre = @categoria)
		if @idcatprod > 0 
		begin
			insert into producto (nombre, idcatprod) values(@nombreprod, @idcatprod)
			select @@IDENTITY
		end 
		else
		begin
		exec Inserta_Categoria @categoria
			set @idcatprod = (select case when idcatprod > 0 then idcatprod else 0 end from catprod where nombre = @categoria)
			insert into producto (nombre, idcatprod) values(@nombreprod, @idcatprod)
			select @@IDENTITY
		end
	end
	else
	begin
		print('El Producto Ya Existe')
	end
END