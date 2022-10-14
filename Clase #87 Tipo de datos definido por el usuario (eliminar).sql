-- Eliminamos ambas tablas, si existen:
if object_id('alumnos') is not null
  drop table alumnos;
if object_id('docentes') is not null
  drop table docentes;
-- Queremos definir un nuevo tipo de dato llamado "tipo_documento". Primero debemos eliminarlo,
-- si existe para volver a crearlo. Para ello empleamos esta sentencia que explicaremos pr�ximamente:
if exists (select *from systypes
  where name = 'tipo_documento')
  exec sp_droptype tipo_documento;

-- Creamos un tipo de dato definido por el usuario llamado "tipo_documento" 
-- basado en el tipo "char" que permita 8 caracteres y valores nulos:
exec sp_addtype tipo_documento, 'char(8)', 'null';

-- Ejecutamos el procedimiento almacenado "sp_help" junto al nombre del tipo de dato
-- definido anteriormente para obtener informaci�n del mismo:
exec sp_help tipo_documento;

create table alumnos(
  documento tipo_documento,
  nombre varchar(30)
);

-- Eliminamos si existe, el valor predeterminado "VP_documento0":
 if object_id ('VP_documento0') is not null
   drop default VP_documento0;

go

-- Creamos el valor predeterminado "VP_documento0" que almacene el valor '00000000':
create default VP_documento0
  as '00000000';

go

-- Asociamos el valor predeterminado al tipo de datos "tipo_documento" 
-- especificando que solamente se aplique a los futuros campos de este tipo:
exec sp_bindefault VP_documento0, 'tipo_documento', 'futureonly';

-- Ejecutamos el procedimiento almacenado "sp_helpconstraint" para verificar que
-- no se aplic� a la tabla "alumnos" porque especificamos la opci�n "futureonly":
exec sp_helpconstraint alumnos;

create table docentes(
  documento tipo_documento,
  nombre varchar(30)
);

-- Verificamos que se aplic� el valor predeterminado creado anteriormente al campo
-- "documento" de la nueva tabla:
exec sp_helpconstraint docentes;

-- Ingresamos un registro en "alumnos" sin valor para documento y vemos qu� se almacen�.
-- En esta tabla no se aplica el valor predeterminado por ello almacena "null", 
-- que es el valor por defecto.
insert into alumnos default values;
select * from alumnos;

-- Si ingresamos en la tabla "docentes" un registro con valores por defecto,
--  se almacena el valor predeterminado porque est� asociado:
insert into docentes default values;
select * from docentes;

-- Quitamos la asociaci�n:
exec sp_unbindefault 'tipo_documento';

-- Volvemos a asociar el valor predeterminado, ahora sin el par�metro "futureonly":
exec sp_bindefault VP_documento0, 'tipo_documento';

-- Ingresamos un registro en "alumnos" y en "docentes" sin valor para documento 
-- y vemos qu� se almacen� (en ambas se almacen� '00000000'):
insert into alumnos default values;
select * from alumnos;
insert into docentes default values;
select * from docentes;

-- Eliminamos si existe, el valor predeterminado "VP_documentoDesconocido":
if object_id ('VP_documentoDesconocido') is not null
   drop default VP_documentoDesconocido;

go

-- Creamos el valor predeterminado llamado "VP_documentoDesconocido" 
-- que almacene el valor 'SinDatos':
create default VP_documentoDesconocido
  as 'SinDatos';

go

-- Asociamos el valor predeterminado al tipo de datos "tipo_documento" 
-- (ya tiene otro valor predeterminado asociado):
exec sp_bindefault VP_DocumentoDesconocido, 'tipo_documento';

-- Veamos si la asociaci�n fue reemplazada en el tipo de datos:
exec sp_help tipo_documento;

-- Veamos si la asociaci�n fue reemplazada en la tabla "alumnos":
exec sp_helpconstraint alumnos;

-- Quitamos la asociaci�n del valor predeterminado:
exec sp_unbindefault 'tipo_documento';

-- Veamos si se quit� de ambas tablas:
exec sp_helpconstraint alumnos;
exec sp_helpconstraint docentes;

-- Ingresamos un registro en "alumnos" y vemos qu� se almacen� en el campo "documento":
insert into alumnos default values;
select * from alumnos;

-- Agregue a la tabla "docentes" una restricci�n "default" para el campo "documento":
alter table docentes
 add constraint DF_docentes_documento
 default '--------'
 for documento;

-- Ingrese un registro en "docentes" con valores por defecto y vea qu� se almacen� en 
-- "documento" recuperando los registros:
insert into docentes default values;
select * from docentes;

-- Asocie el valor predeterminado "VP_documento0" al tipo de datos "tipo_documento":
exec sp_bindefault VP_documento0, 'tipo_documento';

-- Vea qu� informa "sp_helpconstraint" acerca de la tabla "docentes" (Tiene asociado
-- el valor por defecto establecido con la restricci�n "default"):
exec sp_helpconstraint docentes;

-- Ingrese un registro en "docentes" con valores por defecto y vea qu� se almacen�
-- en "documento" (note que guarda el valor por defecto establecido con la restricci�n):
insert into docentes default values;
select * from docentes;

-- Eliminamos la restricci�n:
alter table docentes
  drop DF_docentes_documento;

-- Vea qu� informa "sp_helpconstraint" acerca de la tabla "docentes" (no tiene valor 
-- por defecto):
exec sp_helpconstraint docentes;

-- Asociamos el valor predeterminado "VP_documento0" al tipo de datos "tipo_documento":
exec sp_bindefault VP_documento0, 'tipo_documento';

-- Intente agregar una restricci�n "default" al campo "documento" de "docentes" 
--(SQL Server no lo permite porque el tipo de dato de ese campo ya tiene
-- un valor predeterminado asociado):
alter table docentes
 add constraint DF_docentes_documento
 default '--------'
 for documento;