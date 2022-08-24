--create database HotelAA
--drop table Cliente   --Borrar tabla permanente
use HotelAA

create table Cliente
(
idcliente int primary key identity(1,1) not null,
nombre varchar(50) not null,
apellidos varchar(50) not null,
sexo varchar(10),
pasaporte varchar(30) not null,
f_nac date not null,
telefono varchar(10) not null,
correo varchar(50),
ciudad varchar(20),
estado varchar(20),
pais varchar(20)
);

create table Registro
(
idregistro int primary key identity(1,1) not null,
idcliente int,
idtipcliente int,
idtiphabitacion int,
fecha_reg smalldatetime default(getdate()) not null,
hora_entr time not null,
fecha_hosp date not null,
estancia int not null,
salida date not null
);

create table Tipo_Cliente
(
idtipocliente int primary key identity(1,1) not null,
tipocliente varchar(50) not null
);

create table Tipo_Habitacion
(
idtipohabit int primary key identity(1,1) not null,
tipohabit varchar(50) not null
);

create table Reserva
(
idreserva int primary key identity(1,1) not null,
idregistro int,
namecontac varchar(100) not null,
contacto varchar(10) not null,
segmento varchar(50),
personas varchar(10) not null,
pagorecibido varchar(10) not null
);