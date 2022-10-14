if object_id('libros') is not null                      
  drop table libros;
create table libros(
  codigo int identity,
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
);
go
insert into libros (titulo,autor, editorial ,precio)
  values ('El aleph','Borges','Emece',25.60);
insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);
  select * from libros;
-- Truncamos la tabla:
truncate table libros;

-- Ingresamos nuevamente algunos registros:
insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

-- Si seleccionamos todos los registros vemos que la secuencia se reinició en 1:
select * from libros;

-- Eliminemos todos los registros con "delete":
delete from libros;

-- Ingresamos nuevamente algunos registros:
insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

-- Seleccionamos todos los registros y vemos que la secuencia continuó:
select * from libros;
--Tenemos como resultado:
--Ejercicio 1--
if object_id('alumnos') is not null
  drop table alumnos;
create table alumnos(
  legajo int identity,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30)
 );
 go
  insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
--Elimine todos los registros con "delete".
delete  from alumnos
select * from alumnos
 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
 select * from alumnos;
-- Elimine todos los registros con "truncate table".
truncate table alumnos 
select * from alumnos
insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
 select * from alumnos;
--EJERCICIO #2--
if object_id('articulos') is not null
  drop table articulos;
create table articulos(
  codigo integer identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio float
 );
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C45',400.80);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
  --Elimine todos los registros con "truncate table".
  Truncate table articulos
  select * from articulos
  --
  insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','ingles Biswal',100);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','español Biswal',90);
 select * from articulos;
 delete from articulos
select * from articulos
insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','ingles Biswal',100);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','español Biswal',90);
 select * from articulos;
