CREATE PROCEDURE Baja_Cliente
	@idcliente int
AS
BEGIN
	SET NOCOUNT ON;
	update Cliente set
	activo = 0
	where idcliente = @idcliente

END
GO
