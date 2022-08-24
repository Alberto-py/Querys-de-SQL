USE [Inventario]
GO
/****** Object:  StoredProcedure [dbo].[Producto_Cat]    Script Date: 19/02/2021 11:11:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Producto_Cat]
	@catprod varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

	if @catprod = ''
	begin
		select pro.idproducto as [Numero Producto],
		pro.nombre as Producto,
		cp.nombre as Categoria
		from producto pro
		inner join catprod cp
		on pro.idcatprod = cp.idcatprod
	end
	else
	begin
		select pro.idproducto as [Numero Producto],
		pro.nombre as Producto,
		cp.nombre as Categoria
		from producto pro
		inner join catprod cp
		on pro.idcatprod = cp.idcatprod
		where cp.nombre = @catprod
	end
END