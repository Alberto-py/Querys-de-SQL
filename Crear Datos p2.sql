/*select*from proveedor

insert into proveedor(nombre, direccion, correo, telefono)
values('Fud', 'Cd. Mexico', 'ventas@fud.com.mx', '5578964122'),
('Office Depot', 'Tijuana', 'proveedor@officedepot.com', '6654789654'),
('Frutas y Verduras de Calidad', 'Sinaloa', 'fyvvtas@gmail.com', '7895123468' ),
('Cloralex', 'Cd. Mexico', 'ventasclorox@cloralex.mx', '5551237894'),
('Herdez', 'Toluca', 'ventas@herdez.mx', '5123468496')
*/

/*select*from rel_provprod

insert into rel_provprod(idproveedor, idproducto, precio, cantidad)
values(4, 1, 30.5, 12),
(4, 2, 50, 15),
(2, 3, 2.5, 50),
(2, 4, 56.8, 28),
(2, 5, 14.6, 45),
(3, 6, 29.7, 1000),
(3, 7, 18.3, 100),
(3, 8, 3.6, 2870),
(3, 9, 8.9, 500),
(5, 10, 35.4, 90),
(5, 11, 38.7, 67),
(1, 12, 154.6, 100),
(1, 13, 89.6, 247),
(1, 14, 48.5, 45)
*/

/*select*from venta

insert into venta(total, descuentos, impuestos, idcliente)
values(500, 0, 50, 1),
(1800, 200, 180, 1),
(9500, 800, 950, 2),
(4950, 0, 495, 3),
(10890, 890, 1089, 3)
*/

select*from rel_vtaprod

insert into rel_vtaprod(idventa, idproducto, cantidad)
values(1, 8, 15),
(1, 10, 5),
(1, 2, 8),
(2, 4, 10),
(2, 7, 6),
(3, 3, 9),
(3, 1, 7),
(4, 11, 80),
(4, 13, 50),
(4, 5, 25),
(5, 9, 2),
(5, 1, 16),
(5, 3, 2)
