USE [Inventario]
GO
/****** Object:  StoredProcedure [dbo].[Baja_Proveedor]    Script Date: 24/03/2021 08:41:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Baja_Proveedor]
	@idproveedor int
AS
BEGIN
	SET NOCOUNT ON;

    declare @existe int

	set @existe = (select case when COUNT(*) > 0 then COUNT(*) else 0 end from rel_provprod where activo = 1 and idproveedor = @idproveedor)

	if @existe > 0
	begin
		update rel_provprod set
		activo = 0
		where idproveedor = @idproveedor
	end
	
	update proveedor set
	activo = 0 
	where idproveedor = @idproveedor

END
GO
