/*if object_id('alumnos') is not null
  drop table alumnos;
if object_id('docentes') is not null
  drop table docentes;

if exists (select *from systypes
  where name = 'tipo_documento')
  exec sp_droptype tipo_documento;

-- Creamos un tipo de dato definido por el usuario llamado 
-- "tipo_documento" basado en el tipo "char" que permita 8 caracteres
-- y valores nulos:
exec sp_addtype tipo_documento, 'char(8)', 'null';

exec sp_help tipo_documento;

create table alumnos(
  documento tipo_documento,
  nombre varchar(30)
);

go
select * from alumnos
-- borramos la regla para confirmar
if object_id ('RG_documento') is not null
   drop rule RG_documento;

go 

-- Creamos la regla que permita 8 caracteres que solamente pueden ser
-- d�gitos del 0 al 5 para el primer d�gito y de 0 al 9 para los siguientes:
create rule RG_documento
  as @documento like '[0-5][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

go

-- Asociamos la regla al tipo de datos "tipo_documento" especificando que 
-- solamente se aplique a los futuros campos de este tipo:
exec sp_bindrule RG_documento, 'tipo_documento', 'futureonly';

exec sp_helpconstraint alumnos;

create table docentes(
  documento tipo_documento,
  nombre varchar(30)
);

-- Verificamos que se aplic� la regla en la nueva tabla:
exec sp_helpconstraint docentes;

-- Ingresamos un registro en "alumnos" con valores para documento que infrinjan la regla,
-- Lo acepta porque en esta tabla no se aplica la regla. 
-- Pero no podr�amos ingresar un valor como el anterior en la tabla "docentes"
-- la cual si tiene asociada la regla.
insert into alumnos values('a111111','Ana Acosta');

-- Quitamos la asociaci�n:
exec sp_unbindrule 'tipo_documento';

-- Volvemos a asociar la regla, ahora sin el par�metro "futureonly":
exec sp_bindrule RG_documento, 'tipo_documento';

-- Verificamos que se aplic� la regla en ambas tablas:
exec sp_helpconstraint docentes;
exec sp_helpconstraint alumnos;

-- Eliminamos si existe, la regla "RG_documento2":
if object_id ('RG_documento2') is not null
   drop rule RG_documento2;

go

-- Creamos la regla llamada "RG_documento2" que permita 8 caracteres 
-- que solamente pueden ser d�gitos del 0 al 9 para todas las posiciones:
create rule RG_documento2
  as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

go

-- Asociamos la regla al tipo de datos "tipo_documento" (ya tiene una regla asociada):
exec sp_bindrule RG_documento2, 'tipo_documento';

--Veamos si la asociaci�n fue reemplazada en el tipo de datos:
exec sp_help tipo_documento;

-- Veamos si la asociaci�n fue reemplazada en las tablas:
exec sp_helpconstraint alumnos;
exec sp_helpconstraint docentes;

-- Asociamos la regla "RG_documento" al campo "documento" de "alumnos":
exec sp_bindrule RG_documento, 'alumnos.documento';

-- Verificamos que "documento" de "alumnos" tiene asociada la regla "RG_documento":
exec sp_helpconstraint alumnos;

-- Verificamos que el tipo de dato "tipo_documento" tiene asociada la regla "RG_documento2":
exec sp_help tipo_documento;

-- Intentamos ingresar un valor para "documento" aceptado por la regla asociada al
-- tipo de dato pero no por la regla asociada al campo (no lo permite):
insert into alumnos values ('77777777','Juan Lopez');

-- Ingrese un valor para "documento" aceptado por la regla asociada al campo (si lo permite):
insert into alumnos values ('55555555','Juan Lopez');

select * from alumnos*/
-- EJERCICIOS --
--1- Elimine ambas tablas, si existen:
 if object_id ('empleados') is not null
  drop table empleados;
 if object_id ('clientes') is not null
  drop table clientes;

--2- Defina un nuevo tipo de dato llamado "tipo_a�o". Primero debe eliminarlo, si existe, para volver 
--a crearlo. Para ello emplee esta sentencia que explicaremos en el siguiente cap�tulo:
 if exists (select *from systypes
  where name = 'tipo_a�o')
   exec sp_droptype tipo_a�o;

--3- Cree un tipo de dato definido por el usuario llamado "tipo_a�o" basado en el tipo "int" que 
--permita valores nulos:

	exec sp_addtype tipo_a�o , 'int' , 'null'

--4- Ejecute el procedimiento almacenado "sp_help" junto al nombre del tipo de dato definido 
--anteriormente para obtener informaci�n del mismo:

 sp_help tipo_a�o;

--5- Cree la tabla "empleados" con 3 campos: documento (char de 8), nombre (30 caracteres) y 
--a�oingreso (tipo_a�o):

 create table empleados(
  documento char(8),
  nombre varchar(30),
  a�oingreso tipo_a�o
 );

--6- Elimine la regla llamada "RG_a�o" si existe:
 if object_id ('RG_a�o') is not null
   drop rule RG_a�o;

--7- Cree la regla que permita valores integer desde 1990 (a�o en que se inaugur� el comercio) y el 
--a�o actual:
	create rule RG_a�os
	as @a�os between 1990 and datepart(year,getdate())

--8- Asocie la regla al tipo de datos "tipo_a�o" especificando que solamente se aplique a los futuros 
--campos de este tipo:
	exec sp_bindrule RG_a�os, 'tipo_a�o', 'futureonly'

--9- Vea si se aplic� a la tabla empleados:
SELECT * FROM EMPLEADOS
I
 
--No se aplic� porque especificamos la opci�n "futureonly":

--10- Cree la tabla "clientes" con 3 campos: nombre (30 caracteres), a�oingreso (tipo_a�o) y domicilio 
--(30 caracteres):
 create table clientes(
  documento char(8),
  nombre varchar(30),
  a�oingreso tipo_a�o
 );

--11- Vea si se aplic� la regla en la nueva tabla:
 exec sp_helpconstraint clientes;
--Si aparece.

--12- Ingrese registros con valores para el a�o que infrinjan la regla en la tabla "empleados":
 insert into empleados values('11111111','Ana Acosta',2050);
 select * from empleados;
--Lo acepta porque en esta tabla no se aplica la regla.

--13- Intente ingresar en la tabla "clientes" un valor de fecha que infrinja la regla:
 --insert into clientes values('22222222','Juan Perez',2050);
--No lo permite.

--14- Quite la asociaci�n de la regla con el tipo de datos:
	EXEC sp_unbindrule  'empleados.tipo_a�o'
--15- Vea si se quit� la asociaci�n:

--Si se quit�.

--16- Vuelva a asociar la regla, ahora sin el par�metro "futureonly":
 
--Note que hay valores que no cumplen la regla pero SQL Server NO lo verifica al momento de asociar 
--una regla.

--17- Intente agregar una fecha de ingreso fuera del intervalo que admite la regla en cualquiera de 
--las tablas (ambas tienen la asociaci�n):
 
--Mensaje de error.

--18- Vea la informaci�n del tipo de dato:

--En la columna que hace referencia a la regla asociada aparece "RG_a�o".

--19- Elimine la regla llamada "RG_a�onegativo", si existe:
 

--20- Cree una regla llamada "RG_a�onegativo" que admita valores entre -2000 y -1:


--21- Asocie la regla "RG_a�onegativo" al campo "a�oingreso" de la tabla "clientes":
 

--22- Vea si se asoci�:
 
--Se asoci�.

--23- Verifique que no est� asociada al tipo de datos "tipo_a�o":

--No, tiene asociada la regla "RG_a�o".

--24- Intente ingresar un registro con valor '-1900' para el campo "a�oingreso" de "empleados":
 insert into empleados values('44444444','Pedro Perez',-1900);
--No lo permite por la regla asociada al tipo de dato.

--25- Ingrese un registro con valor '-1900' para el campo "a�oingreso" de "clientes" y recupere los 
--registros de dicha tabla:
 
--Note que se ingreso, si bien el tipo de dato de "a�oingreso" tiene asociada una regla que no admite 
--tal valor, el campo tiene asociada una regla que si lo admite y �sta prevalece.