SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Inserta_TipoCli
	@tipocli varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	declare @existe int 
	set @existe = (select case when count(*) > 0 then count(*) else 0 end from tipocliente where tipocliente = @tipocli)

	if @existe = 0
	begin
			insert into tipocliente (tipocliente) values(@tipocli)
			select @@IDENTITY
	end
	else
	begin
			print('El Tipo de Cliente Ya Existe')
	end
END
GO
