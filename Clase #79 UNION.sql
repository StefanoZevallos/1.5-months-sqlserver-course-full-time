--if object_id('alumnos') is not null
--  drop table alumnos;
--if object_id('profesores') is not null
--  drop table profesores;

--create table profesores(
--  documento varchar(8) not null,
--  nombre varchar (30),
--  domicilio varchar(30),
--  primary key(documento)
--);
--create table alumnos(
--  documento varchar(8) not null,
--  nombre varchar (30),
--  domicilio varchar(30),
--  primary key(documento)
--);

--go

--insert into alumnos values('30000000','Juan Perez','Colon 123');
--insert into alumnos values('30111111','Marta Morales','Caseros 222');
--insert into alumnos values('30222222','Laura Torres','San Martin 987');
--insert into alumnos values('30333333','Mariano Juarez','Avellaneda 34');
--insert into alumnos values('23333333','Federico Lopez','Colon 987');
--insert into profesores values('22222222','Susana Molina','Sucre 345');
--insert into profesores values('23333333','Federico Lopez','Colon 987');

---- Nombre y domicilio de profesores y alumnos
--select * from alumnos
--select * from profesores
----
--select nombre, domicilio from alumnos
--  union
--    select nombre, domicilio from profesores;
---- Mostrar las filas duplicadas de ambas tablas
---- (existe un profesor que también está presente en la tabla "alumnos")
--select nombre, domicilio from alumnos
--  union all
--    select nombre, domicilio from profesores;

---- Ordenamos por domicilio:
--select nombre, domicilio from alumnos
--  union
--    select nombre, domicilio from profesores
--  order by domicilio;

---- agregar una columna extra a la consulta con el encabezado "condicion"
---- en la que aparezca el literal "profesor" o "alumno" según si la persona
---- es uno u otro:
--select * from alumnos
--select * from profesores
----
--select nombre, domicilio, 'alumno' as condicion from alumnos
--  union
--    select nombre, domicilio,'profesor' from profesores
--  order by condicion;
 -- EJERCICIOS --
 --1- Elimine las tablas si existen:
 if object_id('clientes') is not null
  drop table clientes;
 if object_id('proveedores') is not null
  drop table proveedores;
 if object_id('empleados') is not null
  drop table empleados;

--2- Cree las tablas:
 create table proveedores(
  codigo int identity,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 create table clientes(
  codigo int identity,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 create table empleados(
  documento char(8) not null,
  nombre varchar(20),
  apellido varchar(20),
  domicilio varchar(30),
  primary key(documento)
 );
 GO
--3- Ingrese algunos registros:
 insert into proveedores values('Bebida cola','Colon 123');
 insert into proveedores values('Carnes Unica','Caseros 222');
 insert into proveedores values('Lacteos Blanca','San Martin 987');
 insert into clientes values('Supermercado Lopez','Avellaneda 34');
 insert into clientes values('Almacen Anita','Colon 987');
 insert into clientes values('Garcia Juan','Sucre 345');
 insert into empleados values('23333333','Federico','Lopez','Colon 987');
 insert into empleados values('28888888','Ana','Marquez','Sucre 333');
 insert into empleados values('30111111','Luis','Perez','Caseros 956');

--4- El supermercado quiere enviar una tarjeta de salutación a todos los proveedores, clientes y 
--empleados y necesita el nombre y domicilio de todos ellos. Emplee el operador "union" para obtener 
--dicha información de las tres tablas.

SELECT * FROM CLIENTES
SELECT * FROM EMPLEADOS
SELECT * FROM PROVEEDORES
--
SELECT nombre , domicilio from clientes 
	union
select (nombre + ' ' + apellido) , domicilio from empleados
	union 
	select nombre , domicilio from proveedores
	--
	select nombre, domicilio from proveedores
  union
  select nombre, domicilio from clientes
   union
   select (apellido+' '+nombre), domicilio from empleados;

--5- Agregue una columna con un literal para indicar si es un proveedor, un cliente o un empleado y 
--ordene por dicha columna.
SELECT * FROM proveedores
SELECT * FROM clientes
SELECT * FROM empleados
--
	select nombre, domicilio, 'proveedor' as categoria from proveedores
	  union
	  select nombre, domicilio, 'clientes' as categoria from clientes
	   union
	   select (apellido+' '+nombre), domicilio , 'empleados' as categoria from empleados
		order by categoria