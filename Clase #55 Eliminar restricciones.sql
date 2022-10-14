/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
);

go

-- Definimos una restricción "primary key" para nuestra tabla "libros" para asegurarnos 
-- que cada libro tendrá un código diferente y único:
	alter table libros
		add constraint PK_libros_codigo
			primary key (codigo)
-- Definimos una restricción "check" para asegurarnos que el precio no será negativo:
	alter table libros
		add constraint CK_libros_preciononegativo
			check (precio >0)

-- Definimos una restricción "default" para el campo "autor" para que almacene "Desconocido":
alter table libros
 add constraint DF_libros_autor
 default 'Desconocido'
 for autor;

-- Definimos una restricción "default" para el campo "precio" para que almacene 0:
alter table libros
 add constraint DF_libros_precio
 default 0
 for precio;

-- Vemos las restricciones:
exec sp_helpconstraint libros;

-- Eliminamos la restricción "DF_libros_autor":
	alter table libros
		drop  DF_libros_precio

-- Eliminamos la restricción "PK_libros_codigo":

exec sp_helpconstraint libros;*/

-- EJERCICIOS -- 
--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

--3- Establezca una restricción "check" que admita solamente los valores "a" y "m" para el campo 
--"tipo":
 alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'));

4- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
ingresarse valor para dicho campo:
 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo;

5- Establezca una restricción "check" para el campo "patente" para que acepte 3 letras seguidas de 3 
dígitos:
 alter table vehiculos
 add constraint CK_vehiculos_patente_patron
 check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

--6- Agregue una restricción "primary key" que incluya los campos "patente" y "horallegada":


--7- Ingrese un vehículo:
-- insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

--8- Intente ingresar un registro repitiendo la clave primaria:
-- insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);
--No se permite.

--9- Ingrese un registro repitiendo la patente pero no la hora de llegada:
 --insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

--10- Ingrese un registro repitiendo la hora de llegada pero no la patente:
-- insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

--11- Vea todas las restricciones para la tabla "vehiculos":

--aparecen 4 filas, 2 correspondientes a restricciones "check", 1 a "default" y 1 a "primary key".

--12- Elimine la restricción "default" del campo "tipo".

--13- Vea si se ha eliminado:


--14- Elimine la restricción "primary key" y "check".

--15- Vea si se han eliminado:
