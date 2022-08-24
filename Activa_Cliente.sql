CREATE PROCEDURE Activa_Cliente
	@idcliente int
AS
BEGIN
	
	SET NOCOUNT ON;
	update Cliente set
	activo = 1
	where idcliente = @idcliente

END
GO
