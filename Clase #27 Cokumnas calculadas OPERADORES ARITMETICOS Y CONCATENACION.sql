/*if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
);
go
insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
  select * from libros 
  -- Queremos saber el monto total en dinero de cada libro: 
  select * , precio * cantidad from libros 
  -- Conocer el precio de cada libro con un 10% de descuento:
  select * , precio-(precio*0.1) from libros 
  -- Actualizar los precios con un 10% de descuento:
  update libros set precio = precio-(precio*0.1)
  select * from libros 
-- Queremos una columna con el título, el autor y la editorial de cada libro:
select titulo + '-'+ autor +'-'+ editorial from libros*/
-- EJERCICIO #1 --
--1- Elimine la tabla si existe:
 if object_id ('articulos') is not null
  drop table articulos;

--2- Cree la tabla:
 create table articulos(
  codigo int identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
  primary key (codigo)
 );

--3- Ingrese algunos registros:
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);
  select * from articulos
--4- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los precios empleando operadores aritméticos.
update libros set precio=precio+(precio*0.15)
select * from articulos
--5- Vea el resultado:
 select * from articulos
--6- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos separados por coma.
select nombre+','+descripcion
  from articulos;

--7- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-")
update articulos set cantidad=(cantidad - 5)
	where nombre='teclado';
	select * from articulos;