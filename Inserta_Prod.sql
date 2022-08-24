-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Alberto Cruz>
-- Create date: <12/02/2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Inserta_Prod
	-- Add the parameters for the stored procedure here
	@nombreprod varchar(50),
	@categoria varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @idcatprod int

	set @idcatprod = (select idcatprod from catprod where nombre = @categoria)

	insert into producto (nombre, idcatprod) values(@nombreprod, @idcatprod)

	select @@IDENTITY
END
GO


--exec Inserta_Prod 'Elotes', 'Enlatados'

/*select pro.idproducto as [Numero Producto],
pro.nombre as Producto,
cp.nombre as Categoria
from producto pro
inner join catprod cp
on pro.idcatprod = cp.idcatprod*/