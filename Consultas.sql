/*Consulta para sacar la categoria de un cliente*/
/*select Cli.idcliente numero_cliente,
Cli.nombre, tc.tipocliente as nivel
/*el "as" funciona igual para el alias*/
             /*Alias*/
from Cliente Cli

/* datos que coinciden en las tablas*/
inner join tipocliente tc
on Cli.idtipocli = tc.idtipocli

/*Consulta para sacar la categoria de un producto*/
select pro.nombre, cp.nombre
from producto pro
inner join catprod cp
on pro.idcatprod = cp.idcatprod 

select vta.idventa,  Cli.nombre, vta.fecha, vta.total
from venta vta
inner join Cliente Cli
on vta.idcliente = Cli.idcliente
*/

select vta.idventa Numero_Venta, 
/*cast = dar un formato a una columna*/
('0' + cast(Cli.idcliente as varchar) + '.- ' + Cli.nombre) Cliente, 
Cli.direccion Direccion_Cliente, 
												/*substring = trae los caracteres que le indiques por posicion*/
case when Cli.telefono = '' then 'No Disponible' else substring(Cli.telefono, 1, 3) end Lada,
												/*len = cantidad de caracteres que tiene una variable*/
case when Cli.telefono = '' then 'No Disponible' else substring(Cli.telefono, 4, len(Cli.telefono)) end Telefono_Cliente, 
Cli.correo Correo_Cliente, 
pro.nombre Producto, 
cp.nombre Categoria, 
('0'+ cast(prov.idproveedor as varchar) + '.- ' + prov.nombre) [Proveedor Producto], 
rvp.cantidad [Cantidad Producto], 
vta.descuentos Descuento, 
vta.impuestos Impuesto,
/*Calcular el Subtotal*/
vta.total - vta.impuestos - vta.descuentos Subtotal,
vta.total Total, 
--getdate() as fecha_actual,
/*Agregarle dias a la fecha actual*/
--dateadd(day, 2, getdate()) fecha_mas2,
/*Cuantos dias han pasado desde 1 de enero de 2021 hasta el dia actual*/
--datediff(day, '2021/01/01', getdate()) Cuantos_Dias,
/*Convertir la fecha*/
convert(varchar(12), vta.fecha,106) [Fecha Venta]


from rel_vtaprod rvp
inner join venta vta
on rvp.idventa = vta.idventa
inner join producto pro
on rvp.idproducto = pro.idproducto
inner join Cliente Cli
on vta.idcliente = Cli.idcliente
inner join catprod cp
on cp.idcatprod = pro.idcatprod
inner join rel_provprod rpp	
on rpp.idproducto = pro.idproducto
inner join proveedor prov
on rpp.idproveedor = prov.idproveedor
/*where = quitar datos que no queremos*/
--where vta.total >500 and cp.nombre not in('Papeleria') and rvp.cantidad >=16
--where vta.descuentos =0
/*like = no conocemos los caracteres
like '%A' = con la que finalice en la letra A
like '%A%' = que contenga la letra A
like 'A%' = con la que inicie en la letra A */
--where Cli.nombre like '%p%' and pro.nombre like 'c%'
where Cli.direccion like '%i%'
/*Ordenar por numero de venta y en base del nombre de forma acendente asc o decendente desc*/
order by vta.idventa, pro.nombre asc