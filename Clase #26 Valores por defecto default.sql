/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) not null default 'Desconocido', 
  editorial varchar(20),
  precio decimal(5,2),
  cantidad tinyint default 0
);

go
-- Ingresamos un registro omitiendo los valores para el campo "autor" y "cantidad":
insert into libros (titulo , editorial, precio)
	values ( 'PacoYunque', 'PEARSON', 23);
	Select * from libros 

-- Si ingresamos un registro sin valor para el campo "precio", 
-- que admite valores nulos, se ingresará "null" en ese campo:

insert into libros (titulo , editorial)
	values ( 'PacoYunque', 'PEARSON');
	Select * from libros 

-- Visualicemos la estructura de la tabla:

exec sp_columns libros
-- Podemos emplear "default" para dar el valor por defecto a algunos campos:
insert into libros (titulo ,autor, editorial)
	values ( 'PacoYunque',default, 'PEARSON');
	Select * from libros 

-- Como todos los campos de "libros" tienen valores predeterminados, podemos tipear:
insert into libros default values;
select * from libros 

-- Podemos ingresar el valor "null" en el campo "cantidad":*/

-- EJERCICIOS #1--
--1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

--2- Cree la tabla con la siguiente estructura:

 /*create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

--4- Vea la información de las columnas "COLUMN_DEF" y "IS_NULLABLE":
exec sp_columns visitantes;
--5- Ingrese algunos registros sin especificar valores para algunos campos para ver cómo opera la 
--cláusula "default":
insert into visitantes (nombre , edad , montocompra)
	values ( 'Stefano',22,500)
	select * from visitantes
 
--6- Use la palabra "default" para ingresar valores en un insert.

insert into visitantes (nombre , edad , montocompra,ciudad)
	values ( 'Stefano',22,500,default)
	select * from visitantes
--7- Ingrese un registro con "default values".
insert into libros default values  
select * from libros*/


