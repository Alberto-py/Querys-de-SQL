
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Consulta_TipoCli
	@tipocli varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	if @tipocli = ''
	begin
		select idtipocli [Numero Tipo Cliente],
		tipocliente [Tipo Cliente]
		from tipocliente
	end
	else 
	begin
		select idtipocli [Numero Tipo Cliente],
		tipocliente [Tipo Cliente]
		from tipocliente
		where tipocliente = @tipocli
	end
END
GO
