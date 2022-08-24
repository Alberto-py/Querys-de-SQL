ALTER PROCEDURE ActualizarTotalV
	@idventa int
AS
BEGIN
	SET NOCOUNT ON;
	update vta set
	vta.total = vtat.total,
	vta.impuestos = vtat.impuestos
	from 
		(
			select vta.idventa,
			cast(sum(rpp.precio * rvp.cantidad) as numeric(18,2)) total,
			cast(sum(rpp.precio * rvp.cantidad) * .16 as numeric(18,2)) impuestos
			from venta vta
			inner join rel_vtaprod rvp
			on vta.idventa = rvp.idventa
			inner join rel_provprod rpp
			on rvp.idproducto = rpp.idproducto
			group by vta.idventa
		) vtat
	inner join venta vta
	on vta.idventa = vtat.idventa
	where vta.idventa = @idventa

END
GO