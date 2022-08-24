CREATE PROCEDURE Baja_ProvProd
	@idproveedor int,
	@idproducto int
AS
BEGIN
	SET NOCOUNT ON;

    if @idproducto > 0 and @idproveedor > 0
	begin
		update rel_provprod set
		activo = 0
		where idproducto = @idproducto and idproveedor = @idproveedor
	end
	else if @idproducto > 0
	begin
		update rel_provprod set
		activo = 0
		where idproducto = @idproducto
	end
	else if @idproveedor > 0
	begin
		update rel_provprod set
		activo = 0
		where idproveedor = @idproveedor
	end
	else 
	begin
		print('Indica un Proveedor y/o Producto para darlo de Alta')
	end
END
GO