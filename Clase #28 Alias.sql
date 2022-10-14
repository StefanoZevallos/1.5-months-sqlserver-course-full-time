/*if object_id('agenda') is not null
  drop table agenda;

create table agenda(
  nombre varchar(30),
  domicilio varchar(30),
  telefono varchar(11)
);

go
insert into agenda
  values('Juan Perez','Avellaneda 908','4252525');
insert into agenda
  values('Marta Lopez','Sucre 34','4556688');
insert into agenda
  values('Carlos Garcia','Sarmiento 1258',null);
  select * from agenda
--
  select nombre as NombreYApellido,
  domicilio,telefono
  from agenda;
--
  select nombre as 'Nombre y apellido',
  domicilio,telefono
  from agenda;
-- 
select nombre 'Nombre y apellido',
  domicilio,telefono
  from agenda;*/
  -- EJERCICIO #2 --
 
--1- Elimine la tabla si existe:
 if object_id ('libros') is not null
  drop table libros;

--2- Cree la tabla:
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );

--3- Ingrese algunos registros:
 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
  select * from libros

--4- Muestre todos los campos de los libros y un campo extra, con el encabezado "monto total" en la 
--que calcule el monto total en dinero de cada libro (precio por cantidad)
 select * , precio * cantidad as 'Monto total' from libros

/*5- Muestre el título, autor y precio de todos los libros de editorial "Emece" y agregue dos columnas 
extra en las cuales muestre el descuento de cada libro, con el encabezado "descuento" y el precio 
con un 10% de descuento con el encabezado "precio final".*/
	select titulo , autor , editorial, precio , 
	precio * 0.1 as 'Descuento' , 
	precio -(precio * 0.1) as 'Precio final'
	from libros
	where editorial = 'Emece'
--6- Muestre una columna con el título y el autor concatenados con el encabezado "Título y autor"
	select titulo + '  '+ autor as 'Titulo y Autor' from libros
	select user_name()