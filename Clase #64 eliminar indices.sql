/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
);

go

-- Creamos un �ndice para el campo "titulo":
	CREATE INDEX I_libros_titulo
		on libros(titulo)
-- Eliminamos el �ndice "I_libros_titulo":
	drop index libros.libros_titulo

-- Solicitamos que se elimine el �ndice "I_libros_titulo" si existe:
if exists (select name from sysindexes
  where name = 'I_libros_titulo')
   drop index libros.I_libros_titulo;*/
-- EJERCICIO --
--1- Elimine la tabla si existe y cr�ela con la siguiente estructura:
 if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

--2- Cree un �ndice no agrupado para el campo "apellido".

	CREATE INDEX I_alumnos_apellido
		on alumnos(apellido)

--3- Establezca una restricci�n "primary" para el campo "legajo" y especifique que cree un �ndice 
--"agrupado".
	alter table alumnos 
	Add constraint PK_alumnos_apellidos
		primary key clustered (legajo)

--4- Vea la informaci�n que muestra "sp_helpindex":
exec sp_helpindex alumnos

--5- Intente eliminar el �ndice "PK_alumnos_legajo" con "drop index":
--No se puede.

drop index alumnos.PK_alumnos_apellidos
--6- Intente eliminar el �ndice "I_alumnos_apellido" sin especificar el nombre de la tabla:
-- Mensaje de error.

drop index I_alumnos_apellido
--7- Elimine el �ndice "I_alumnos_apellido" especificando el nombre de la tabla.
drop index alumnos.I_alumnos_apellido
--8- Verifique que se elimin�:

exec sp_helpindex alumnos
--9- Solicite que se elimine el �ndice "I_alumnos_apellido" si existe:
select name from sysindexes 
	where name like 'I%'
if exists ( select * from sysindexes 
				where name like 'I%')
		drop index alumnos.I_alumnos_apellido
--10- Elimine el �ndice "PK_alumnos_legajo" (quite la restricci�n).
	alter table alumnos
		drop constraint PK_alumnos_apellidos

--11- Verifique que el �ndice "PK_alumnos_legajo" ya no existe:
exec sp_helpindex alumnos