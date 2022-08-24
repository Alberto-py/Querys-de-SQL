CREATE PROCEDURE Activa_TipoCliente
	@idtipocliente int
AS
BEGIN
	SET NOCOUNT ON;
	update tipocliente set
	activo = 1
	where idtipocli = @idtipocliente

END
GO
