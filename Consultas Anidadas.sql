select vta.idventa Numero_Venta, 
/*cast = dar un formato a una columna*/
('0' + cast(Cli.idcliente as varchar) + '.- ' + Cli.nombre) Cliente, 
Cli.direccion Direccion_Cliente, 
												/*substring = trae los caracteres que le indiques por posicion*/
case when Cli.telefono = '' then 'No Disponible' else substring(Cli.telefono, 1, 3) end Lada,
												/*len = cantidad de caracteres que tiene una variable*/
case when Cli.telefono = '' then 'No Disponible' else substring(Cli.telefono, 4, len(Cli.telefono)) end Telefono_Cliente, 
Cli.correo Correo_Cliente, 
/*Convertir la fecha*/
convert(varchar(12), vta.fecha,106) [Fecha Venta],
sum(pro.cantidad) [Cantidad Producto],
sum(pro.total) Subtotal,
cast(sum(pro.total)*0.16 as decimal(18,2)) Impuesto,
cast(sum(pro.total)*1.16 as decimal (18,2)) Total

from venta vta
inner join Cliente Cli
on vta.idcliente = Cli.idcliente
inner join 
			(
				select rvp.idventa,
				rvp.cantidad,
				rvp.cantidad * rpp.precio Total
				from rel_vtaprod rvp
				inner join producto pro
				on rvp.idproducto = pro.idproducto
				inner join rel_provprod rpp
				on pro.idproducto = rpp.idproducto
			)pro
on pro.idventa = vta.idventa
group by vta.idventa, Cli.idcliente, Cli.nombre, Cli.direccion, Cli.telefono, Cli.correo, vta.fecha
/*Ordenar por numero de venta y en base del nombre de forma acendente asc o decendente desc*/
order by vta.idventa asc