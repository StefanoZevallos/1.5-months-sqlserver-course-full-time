/*if object_id('empleados') is not null
  drop table empleados;

create table empleados(
  nombre varchar(20),
  documento char(8),
  fechaingreso datetime
);

go
-- Seteamos el formato de la fecha para que guarde día, mes y año:
set dateformat dmy;

insert into empleados values('Ana Gomez','22222222','12-01-1980');
insert into empleados values('Bernardo Huerta','23333333','15-03-81');
insert into empleados values('Carla Juarez','24444444','20/05/1983');
insert into empleados values('Daniel Lopez','25555555','2.5.1990');
-- Note que el formato de visualización es "y-m-d".
select * from empleados;
-- Mostramos los datos de los empleados cuya fecha de ingreso es anterior a '01-01-1985':
select * from empleados 
where fechaingreso < '01/01/1985'

-- Actualizamos el nombre a "Maria Carla Juarez' 
-- del empleado cuya fecha de ingreso es igual a '20/05/1983':
update empleados set nombre='Maria Carla Juares'
	where fechaingreso='20/05/1983'
	select * from empleados

-- Borramos los empleados cuya fecha de ingreso es distinta a '20.5.83':

delete from empleados	
where fechaingreso <> '20/05/83'
select * from empleados*/

--EJERCICIO #1--
if object_id('alumnos') is not null
  drop table alumnos;
  create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  fechanacimiento datetime
 );
 --Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año": 
 set dateformat dmy
 --Ingrese un alumno empleando distintos separadores para las fechas:
 insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)
	values ('ZEVALLOS','STEFANO','70091117', 'COMAS MZ E','01/06/22','02.07.23')
	select * from alumnos
 --Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año:
 insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)
	values ('CARDENAS','FRANCHESCA','4118860', 'COMAS MZ F','1/6/22','2.7.23')
	select * from alumnos
 --Ingrese un alumno empleando 2 dígitos para el año de la fecha de ingreso y "null" en  "fechanacimiento":
 insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)
	values ('CARDENAS','PAOLA','4118860', 'COMAS MZ G','1/6/22',null)
	select * from alumnos
 --Intente ingresar un alumno con fecha de ingreso correspondiente a "15 de marzo de 1990" pero en  orden incorrecto "03-15-90":
 insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)
	values ('VASQUEZ','JORDAN','70095557', 'SAN FELIPE','15/03/1990','05.05.1999')
	select * from alumnos
 --Muestre todos los alumnos que ingresaron antes del '1-1-91'.
 select * from alumnos 
	where fechaingreso < '1/1/91'
 --Muestre todos los alumnos que tienen "null" en "fechanacimiento":
  select * from alumnos 
	where fechanacimiento is null
 --Intente ingresar una fecha de ingreso omitiendo los separadores:
 insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)
	values ('VASQUEZ','JORDAN','70095557', 'SAN FELIPE','15.03.1990','05.05.1999')
	select * from alumnos
 --Setee el formato de entrada de fechas para que acepte valores "mes-dia-año".
 set dateformat mdy
 --Ingrese el registro del punto 7.
