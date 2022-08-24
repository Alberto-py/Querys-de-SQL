CREATE PROCEDURE Baja_Producto
	@idproducto int
AS
BEGIN
	SET NOCOUNT ON;

	update producto set
	activo = 0
	where idproducto = @idproducto

END
GO
