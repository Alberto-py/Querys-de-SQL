ALTER PROCEDURE Inserta_Venta
	@cliente varchar(150),
	@descuento numeric(18,2),
	@producto varchar(500), 
	@cantidad varchar(500)   --Se recibe datos: 'Albert, 15, Laptop, 4000' | como tipo cadena
AS
BEGIN
	SET NOCOUNT ON;
	declare @idcliente int, @idventa int, @existecli int
	set @idventa = 0

	set @existecli = (select case when COUNT(*) > 0 then COUNT(*) else 0 end from Cliente where nombre = @cliente)

	if @existecli > 0
	begin
		set @idcliente = (select idcliente from Cliente where nombre = @cliente)

		insert into venta(idcliente, descuentos)
		values(@idcliente, @descuento)
		set @idventa = (select @@IDENTITY)

		if @idventa > 0
		begin	
			declare @cant varchar(10), @prod varchar(50)
			declare product cursor for select value from string_split(@producto, ',')  --convierte un String en caracteres separados
			open product
			fetch next from product into @prod
			while @@FETCH_STATUS = 0
			begin
				declare cantidad cursor for select cast(value as int)  from string_split(@cantidad, ',')
				open cantidad 
				fetch next from cantidad into @cant
				while @@FETCH_STATUS = 0
				begin
					declare @exiteprod int, @idproducto int
					set @idproducto = 0

					set @exiteprod = (select case when COUNT(*) > 0 then COUNT(*) else 0 end from producto where nombre = @prod)

					if @exiteprod > 0
					begin
						set @idproducto = (select idproducto from producto where nombre = @prod)

						insert into rel_vtaprod(idventa, idproducto, cantidad)
						values (@idventa, @idproducto, @cant)
					end
					fetch next from cantidad into @cant
					fetch next from product into @prod
				end
			end
			close cantidad
			deallocate cantidad
			close product
			deallocate product
			exec ActualizarTotalV @idventa

			print('¡Venta Existosa!')
		end
		else
		begin
			print('Venta No Generada')
		end
	end
	else
	begin
		print('Cliente No Existe')
	end

END
GO
