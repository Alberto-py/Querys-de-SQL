/*ver los registros
select*from tipocliente

/*Eliminar los registros
truncate table 'nombre de la tabla'*/

insertar datos
insert into tipocliente(tipocliente)
values('Platinum')
*/

/*
select*from Cliente

insert into Cliente(nombre, direccion, correo, telefono, idtipocli)
values('Pedro Lopez', 'Zona Rio', 'pedro@gmail.com', '6641258973', 2),
('Maria Perez', 'La Postal', 'mperez@gmail.com', '6645123785', 3),
('Luis Sanchez', '20 de Noviembre', 'lusan@gmail.com', '', 1)
*/

/*
select*from catprod

insert into catprod(nombre)
values('Limpieza'),
('Papeleria'),
('Verduras'),
('Enlatados'),
('Carnes Frias')
*/


select*from producto

insert into producto(nombre, idcatprod)
values('Jabon de Trastes', 1),
('Clorox', 1),
('Lapiz', 2),
('Cuaderno', 2),
('Plumas', 2),
('Tomate', 3),
('Cebolla', 3),
('Zanahoria', 3),
('Chile', 3),
('Chile Chipotle', 4),
('Atun en Agua', 4),
('Jamon de Pavo', 5),
('Salchicha', 5),
('Tocino', 5)
