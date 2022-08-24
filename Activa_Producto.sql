CREATE PROCEDURE Activa_Producto
	@idproducto int
AS
BEGIN
	SET NOCOUNT ON;

    update producto set
	activo = 1
	where idproducto = @idproducto

END
GO
