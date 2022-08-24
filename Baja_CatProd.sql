CREATE PROCEDURE Baja_CatProd
	@idcatprod int
AS
BEGIN
	SET NOCOUNT ON;
	update catprod set
	activo = 0
	where idcatprod = @idcatprod
END
GO