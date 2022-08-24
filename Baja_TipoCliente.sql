CREATE PROCEDURE Baja_TipoCliente
	@idtipocliente int
AS
BEGIN
	SET NOCOUNT ON;
	update tipocliente set
	activo = 0
	where idtipocli = @idtipocliente
END
GO
