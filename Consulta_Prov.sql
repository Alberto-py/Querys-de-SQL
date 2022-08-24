SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Consulta_Prov
	@proveedor varchar(150)
AS
BEGIN
	SET NOCOUNT ON;
	if @proveedor = ''
	begin 
		select idproveedor [Numero Proveedor],
		nombre Proveedor,
		direccion Direccion,
		telefono Telefono,
		correo Correo
		from Proveedor
	end
	else
	begin
		declare @query varchar(500)
		set @query = 'select idproveedor [Numero Proveedor],
		nombre Proveedor,
		direccion Direccion,
		telefono Telefono,
		correo Correo
		from proveedor
		where nombre like ''%' + @proveedor + '%'''
		
		exec(@query)
		print(@query)
	end
END
GO