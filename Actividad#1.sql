/*select tp.tipocliente, count(Cli.idtipocli) [Total Clientes]
from tipocliente tp
inner join Cliente Cli
on tp.idtipocli = Cli.idtipocli
group by tp.tipocliente, Cli.idtipocli */

/*select Cli.nombre, count(v.idcliente) [Total Venta]
from venta v
inner join Cliente Cli
on Cli.idcliente = v.idcliente
group by Cli.nombre, v.idcliente */

select rvp.idventa [Numero Venta], pro.nombre Producto, rvp.cantidad [Cantidad Productos]
from rel_vtaprod rvp
inner join producto pro
on rvp.idproducto = pro.idproducto
