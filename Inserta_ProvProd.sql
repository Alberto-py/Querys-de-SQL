ALTER PROCEDURE Inserta_ProvProd
	@proveedor varchar(100),
	@producto varchar(100),
	@cantidad int,
	@precio numeric(18,2)
AS
BEGIN
	SET NOCOUNT ON;
	declare @existeprod int, @existeprov int, @exiterel int, @idproducto int, @idproveedor int
	set @idproducto = 0
	set @idproveedor = 0

	set @existeprod = (select case when COUNT(*) > 0 then COUNT(*) else 0 end from producto where nombre = @producto)

	if @existeprod > 0
	begin
		set @idproducto = (select idproducto from producto where nombre = @producto)
	end

	
	set @existeprov = (select case when COUNT(*) > 0 then COUNT(*) else 0 end from proveedor where nombre = @proveedor)

	if @existeprov > 0
	begin
		set @idproveedor = (select idproveedor from proveedor where nombre = @proveedor)
	end
	

	if @idproducto > 0 and @idproveedor > 0
	begin
		set @exiterel = (select case when COUNT(*) > 0 then COUNT(*) else 0 end from rel_provprod where idproducto = @idproducto and idproveedor = @idproveedor)

		if @exiterel > 0
		begin 
			print('El Producto Ya Esta Dado De Alta Con El Proveedor')
		end
		else
		begin
			insert into rel_provprod(idproducto, idproveedor, cantidad, precio)
			values(@idproducto, @idproveedor, @cantidad, @precio)
			select @@IDENTITY
		end
	end
	else
	begin
		print('No Existe El Proveedor o Producto Dado De Alta')
	end
END
GO
