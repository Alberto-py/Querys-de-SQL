
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE Inserta_Proveedor
	@proveedor varchar(150),
	@direccion varchar(200),
	@telefono varchar(10),
	@correo varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	declare @existe int
	set @existe = (select case when count(*) > 0 then count(*) else 0 end from proveedor where nombre = @proveedor)

	if @existe = 0
	begin
		insert into proveedor(nombre, direccion, telefono, correo)
		values(@proveedor, @direccion, @telefono, @correo)
		select @@IDENTITY
	end
	else
	begin
		print('El Proveedor Ya Se Encuentra Registrado')
	end
END
GO
