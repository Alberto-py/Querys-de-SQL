USE [Inventario]
GO
/****** Object:  StoredProcedure [dbo].[Consulta_Cat]    Script Date: 26/03/2021 10:59:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Consulta_Cat]
	@categoria varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	if @categoria = ''
	begin
	-- si la variable esta vacia Selecionamos toda la informacion 
		select idcatprod [Numero Categoria],
		nombre [Categoria]
		from catprod where activo = 1
	end
	else if exists (select activo from catprod where nombre = @categoria)
	begin
		declare @activo bit
		set @activo = (select activo from catprod where nombre = @categoria)

		if @activo = 1
		begin
			-- Si no trae la que seleccionamos
			select idcatprod [Numero Categoria],
			nombre [Categoria]
			from catprod
			where nombre = @categoria
		end
		else
		begin
			print('La Categoria ' + @categoria + ' No Esta Dada De Alta')
		end
	end
	else
	begin
		print('La Categoria No Existe')
	end

END
