CREATE PROCEDURE Activa_CatProd
	@idcatprod int
AS
BEGIN
	SET NOCOUNT ON;
	update catprod set
	activo = 1
	where idcatprod = @idcatprod

END
GO
