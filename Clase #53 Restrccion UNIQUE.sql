--if object_id('alumnos') is not null
--  drop table alumnos;

--create table alumnos(
--  legajo char(4) not null,
--  apellido varchar(20),
--  nombre varchar(20),
--  documento char(8)
--);

--go

---- Agregamos una restricción "primary" para el campo "legajo":
--alter table alumnos
-- add constraint PK_alumnos_legajo
-- primary key(legajo);

---- Agregamos una restricción "unique" para el campo "documento":
--alter table alumnos
-- add constraint UQ_alumnos_documento
-- unique (documento);

--insert into alumnos values('A111','Lopez','Ana','22222222');
--insert into alumnos values('A123','Garcia','Maria','23333333');

--exec sp_helpconstraint alumnos;
-- EJERCICIO --
--1- Elimine la tabla si existe:
 if object_id('remis') is not null
  drop table remis;

--2- Cree la tabla con la siguiente estructura:
 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

----3- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula:
 insert into remis values('ABC123','Renault clio','1990');
 insert into remis values('DEF456','Peugeot 504','1995');
 insert into remis values('DEF456','Fiat Duna','1998');
 insert into remis values('GHI789','Fiat Duna','1995');
 insert into remis values(null,'Fiat Duna','1995');

--4- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará 
--valores repetidos.
--No se puede porque hay valores duplicados.
	select * from remis
	alter table remis
		add constraint UQ_remis_patente
		unique (patente)

--5- Elimine el registro con patente duplicada y establezca la restricción.
--Note que hay 1 registro con valor nulo en "patente".

--6- Intente ingresar un registro con patente repetida (no lo permite)

--7- Intente ingresar un registro con valor nulo para el campo "patente".
--No lo permite porque la clave estaría duplicada.

--8- Muestre la información de las restricciones:
exec sp_helpconstraint remis