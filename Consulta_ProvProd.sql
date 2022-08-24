ALTER PROCEDURE Consulta_ProvProd
	@proveedor varchar(50),
	@producto varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	declare @where varchar(500)
	declare @query varchar(1000)

	if @proveedor <> '' and @producto != ''
	begin
		set @where = 'Where prov.nombre like ''%' + @proveedor + '%'' and prod.nombre like ''%' + @producto + '%'''
	end
	else if @proveedor != ''
	begin
		set @where = 'Where prov.nombre like ''%' + @proveedor + '%'''
	end
	else if @producto <> ''
	begin
		set @where = 'Where prod.nombre like ''%' + @producto + '%'''
	end
	else
	begin
		set @where = ''
	end

	set @query = 'select prov.nombre Proveedor,
				prod.nombre Producto,
				rpp.cantidad Cantidad,
				rpp.precio Precio
				from proveedor prov
				inner join rel_provprod rpp
				on prov.idproveedor = rpp.idproveedor
				inner join producto prod
				on prod.idproducto = rpp.idproducto' + @where


	exec(@query)
	print(@query)
END
