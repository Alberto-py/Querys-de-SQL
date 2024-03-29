USE [Inventario]
GO
/****** Object:  StoredProcedure [dbo].[Consulta_Cli]    Script Date: 26/03/2021 10:49:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Consulta_Cli]
	@Cliente varchar(250),
	@tipocli varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	declare @where varchar(500)
	declare @query varchar(1000)

	if @Cliente <> '' and @tipocli != ''
	begin
		set @where = ' Where Cli.nombre like ''%' + @Cliente + '%'' and tc.tipocliente like ''%' + @tipocli + '%'''
	end
	else if @Cliente != ''
	begin
		set @where = ' Where Cli.nombre like ''%' + @Cliente + '%'''
	end
	else if @tipocli <> ''
	begin
		set @where = ' Where Cli.nombre like ''%' + @tipocli + '%'''
	end
	else
	begin
		set @where = ''
	end

	set @query = ' select Cli.idCliente [Numero de Cliente],
				Cli.nombre Nombre,
				Cli.direccion Direccion,
				Cli.telefono Telefono,
				Cli.correo Correo,
				tc.tipocliente Nivel
				from Cliente Cli
				inner join tipocliente tc
				on Cli.idcliente = tc.idtipocli' + @where + ' and Cli.activo = 1'

	exec(@query)
	print(@query)

END
