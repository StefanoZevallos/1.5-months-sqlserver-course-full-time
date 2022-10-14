/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  editorial varchar(15),
  precio decimal(6,2)
);

go

insert into libros (titulo,editorial) values('Martin Fierro','Emece');
insert into libros (titulo,editorial) values('Aprenda PHP','Emece');

-- Veamos que SQL Server creó automáticamente una restricción "default"
-- para el campo "autor":
exec sp_helpconstraint libros;

drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
);

go

-- Agregamos una restricción "default" empleando "alter table" 
-- para que almacene el valor "Desconocido" en el campo "autor":
alter table libros
  add constraint DF_libros_autor
  default 'Desconocido'
  for autor;

-- Veamos la restrición agregada anteriormente con el procedimiento 
-- almacenado "sp_helpcontraint":
exec sp_helpconstraint libros;

insert into libros (titulo,editorial) values('Martin Fierro','Emece');
insert into libros default values;

-- Veamos cómo se almacenaron los registros sin valor explícito
-- para el campo con restricción "default":
select * from libros;

-- Agregamos otra restricción "default" para el campo "precio" 
-- para que almacene el valor 0 en dicho campo:
alter table libros
  add constraint DF_libros_precio
  default 0
  for precio;

exec sp_helpconstraint libros;*/

-- EJERCICIOS --
--1- Elimine la tabla "visitantes", si existe:
-- if object_id('visitantes') is not null
--  drop table visitantes;

----2- Cree la tabla con la siguiente estructura:
-- create table visitantes(
--  numero int identity,
--  nombre varchar(30),
--  edad tinyint,
--  domicilio varchar(30),
--  ciudad varchar(20),
--  montocompra decimal (6,2) not null
-- );

----3- Defina una restricción "default" para el campo "ciudad" que almacene el valor "Cordoba" en caso 
----de no ingresar valor para dicho campo:
--	alter table visitantes 
--	add constraint DF_visitantes_ciudad
--	default 'Cordoba' 
--	for ciudad

----4- Defina una restricción "default" para el campo "montocompra" que almacene el valor "0" en caso de 
----no ingresar valor para dicho campo:
	
--	alter table visitantes 
--	add constraint DF_visitantes_montocompra
--	default 0
--	for montocompra;

----5- Ingrese algunos registros sin valor para los campos con restricción "default":
-- insert into visitantes
--  values ('Susana Molina',35,'Colon 123',default,59.80);
-- insert into visitantes (nombre,edad,domicilio)
--  values ('Marcos Torres',29,'Carlos Paz');
-- insert into visitantes
--  values ('Mariana Juarez',45,'Carlos Paz',null,23.90);

----6- Vea cómo se almacenaron los registros:
-- select * from visitantes;

----7- Vea las restricciones creadas anteriormente.
----aparecen dos filas, una por cada restricción.
--EXEC sp_helpconstraint visitantes


----8- Intente agregar otra restricción "default" al campo "ciudad".
----Aparece un mensaje de error indicando que el campo ya tiene una restricción "default" y sabemos 
----que no puede establecerse más de una restricción "default" por campo.

--	--alter table visitantes
--	--add constraint DF_visitantes_ciudad
--	--default 'Lima'
--	--for ciudad

----9- Intente establecer una restricción "default" al campo "identity".
----No se permite.

--	--alter table visitantes
--	--add constraint DF_visitantes_ciudad
--	--default 0
--	--for numero

--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime,
  horasalida datetime
 );

--3- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
--ingresarse valor para dicho campo.
	alter table vehiculos
	add constraint DF_vehiculos_tipo
	default 'a'
	for tipo

--4- Ingrese un registro sin valor para el campo "tipo":
 insert into vehiculos values('BVB111',default,default,null);

--5- Recupere los registros:
select * from vehiculos

--6- Intente establecer otra restricción "default" para el campo "tipo" que almacene el valor "m" en 
--caso de no ingresarse valor para dicho campo.
--No lo permite porque un campo solamente admite una restricción "default" y ya tiene una.

--7- Establezca una restricción "default" para el campo "horallegada" que almacene la fecha y hora del 
--sistema.
alter table vehiculos
	add constraint DF_vehiculos_horallegada
	default getdate()
	for horallegada


--8- Ingrese un registro sin valor para los campos de tipo datetime.
insert into vehiculos values('BVB111',default,default,null);
select * from vehiculos

--9- Recupere los registros:
-- select * from vehiculos;

--10- Vea las restricciones.
--2 restricciones.
exec sp_helpconstraint  vehiculos
