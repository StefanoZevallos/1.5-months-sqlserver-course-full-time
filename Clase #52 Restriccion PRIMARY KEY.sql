/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
);

go

-- Veamos la restricci�n "primary key" que cre� autom�ticamente SQL Server:
exec sp_helpconstraint libros;

-- Vamos a eliminar la tabla y la crearemos nuevamente, sin establecer la 
-- clave primaria:
drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
);

go

-- Definimos una restricci�n "primary key" para nuestra tabla "libros" 
-- para asegurarnos que cada libro tendr� un c�digo diferente y �nico:
alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);

-- Veamos la informaci�n respecto a ella:
exec sp_helpconstraint libros;*/
-- EJERCICIOS --
--1- Elimine la tabla si existe:
-- if object_id('empleados') is not null
--  drop table empleados;

----2- Cr�ela con la siguiente estructura:
-- create table empleados (
--  documento varchar(8) not null,
--  nombre varchar(30),
--  seccion varchar(20)
-- );
-- GO
----3- Ingrese algunos registros, dos de ellos con el mismo n�mero de documento:
-- insert into empleados
--  values ('22222222','Alberto Lopez','Sistemas');
-- insert into empleados
--  values ('23333333','Beatriz Garcia','Administracion');
-- insert into empleados
--  values ('23333333','Carlos Fuentes','Administracion');

----4- Intente establecer una restricci�n "primary key" para la tabla para que el documento no se repita 
----ni admita valores nulos:
--	select * from empleados
--	alter table empleados
--		add constraint PK_empleados_documento
--			primary key(documento)
----No lo permite porque la tabla contiene datos que no cumplen con la restricci�n, debemos eliminar (o 
----modificar) el registro que tiene documento duplicado:
--	delete from empleados
 
----5- Establezca la restricci�n "primary key" del punto 4.
--	alter table empleados
--		add constraint PK_empleados_documento
--			primary key(documento)
--6- Intente actualizar un documento para que se repita.
--No lo permite porque va contra la restricci�n.
		
--7-Intente establecer otra restricci�n "primary key" con el campo "nombre".
--No lo permite, s�lo puede haber una restricci�n "primary key" por tabla.

	


--8- Intente ingresar un registro con valor nulo para el documento.
--No lo permite porque la restricci�n no admite valores nulos.

--9- Establezca una restricci�n "default" para que almacene "00000000" en el documento en caso de 
--omitirlo en un "insert".

--10- Ingrese un registro sin valor para el documento.

--11- Vea el registro:


--12- Intente ingresar otro empleado sin documento expl�cito.
--No lo permite porque se duplicar�a la clave.

--13- Vea las restricciones de la tabla empleados (2 filas):
-- EJERCICIO 2--
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

--3- Ingrese algunos registros sin repetir patente:
 insert into remis values('ABC123','Renault 12','1990');
 insert into remis values('DEF456','Fiat Duna','1995');

--4- Intente definir una restricci�n "primary key" para el campo "patente".
--No lo permite porque el campo no fue definido "not null".
	ALTER TABLE REMIS
		add constraint PK_remis_patente
			primary key (patente)
	
--5- Establezca una restricci�n "primary key" para el campo "numero".
--Si bien "numero" no fue definido expl�citamente "not null", no acepta valores nulos por ser 
--"identity".

--6- Vea la informaci�n de las restricciones (2 filas):
