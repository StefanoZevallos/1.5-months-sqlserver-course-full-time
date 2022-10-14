/*if object_id('libros') is not null
  drop table libros;
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
);

go

-- Creamos un �ndice agrupado �nico para el campo "codigo" de la tabla "libros":
	
	create unique clustered index I_libros_codigo
		on libros(codigo);

-- Creamos un �ndice no agrupado para el campo "titulo":
	create nonclustered index I_libros_titulo
		on libros(titulo)

-- Veamos los indices de "libros":

exec sp_helpindex libros
-- Creamos una restricci�n "primary key" al campo "codigo" especificando
-- que cree un �ndice NO agrupado:
	alter table libros
		add constraint PK_libros_codigo
			primary key nonclustered (codigo)

-- Verificamos que cre� un �ndice autom�ticamente:
exec sp_helpindex libros

-- Analicemos la informaci�n que nos muestra "sp_helpconstraint":
	 exec sp_helpconstraint libros

-- Creamos un �ndice compuesto para el campo "autor" y "editorial":
	create index I_libros_autor_editorial
		on libros(autor,editorial)
	
-- Consultamos la tabla "sysindexes":

	select * from sysindexes
	
-- Veamos los �ndices de la base de datos activa creados por nosotros
-- podemos tipear la siguiente consulta:
	select name from sysindexes	
		where name like 'I_%'*/
-- EJERCICIOS --
--Un profesor guarda algunos datos de sus alumnos en una tabla llamada "alumnos".
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
 GO
--2- Ingresamos algunos registros:
 insert into alumnos values ('A123','22222222','Perez','Patricia',5.50);
 insert into alumnos values ('A234','23333333','Lopez','Ana',9);
 insert into alumnos values ('A345','24444444','Garcia','Carlos',8.5);
 insert into alumnos values ('A348','25555555','Perez','Daniela',7.85);
 insert into alumnos values ('A457','26666666','Perez','Fabian',3.2);
 insert into alumnos values ('A589','27777777','Gomez','Gaston',6.90);

--3- Intente crear un �ndice agrupado �nico para el campo "apellido".
--No lo permite porque hay valores duplicados.

SELECT* FROM ALUMNOS
create unique clustered index I_alumnos_apellidos
	on alumnos(apellido)

--4- Cree un �ndice agrupado, no �nico, para el campo "apellido".

create clustered index I_alumnos_apellidos
	on alumnos(apellido)


--5- Intente establecer una restricci�n "primary key" al campo "legajo" especificando que cree un 
--�ndice agrupado.
--No lo permite porque ya existe un �ndice agrupado y solamente puede haber uno por tabla.

	alter table alumnos
		add constraint PK_alumnos_legajo
			primary key clustered (legajo)
--6- Establezca la restricci�n "primary key" al campo "legajo" especificando que cree un �ndice NO 
--agrupado.
	alter table alumnos
		add constraint PK_alumnos_legajo
			primary key nonclustered (legajo)

--7- Vea los �ndices de "alumnos":
exec sp_helpindex alumnos;
--2 �ndices: uno "I_alumnos_apellido", agrupado, con "apellido" y otro "PK_alumnos_legajo", no 
--agrupado, unique, con "legajo" que se cre� autom�ticamente al crear la restricci�n "primary key".



--8- Analice la informaci�n que muestra "sp_helpconstraint":
exec sp_helpconstraint libros;
--En la columna "constraint_type" aparece "PRIMARY KEY" y entre par�ntesis, el tipo de �ndice creado.

--9- Cree un �ndice unique no agrupado para el campo "documento".

	create unique nonclustered index I_alumnos_documento
	on alumnos(documento)

--10- Intente ingresar un alumno con documento duplicado.
--No lo permite.

--11- Veamos los indices de "alumnos".
--Aparecen 3 filas, uno por cada �ndice.
exec sp_helpindex alumnos;
--12- Cree un �ndice compuesto para el campo "apellido" y "nombre".
--Se crear� uno no agrupado porque no especificamos el tipo, adem�s, ya existe uno agrupado y 
--solamente puede haber uno por tabla.
	create index I_alumnos_apellido_nombre
		on alumnos(apellido,nombre)

--13- Consulte la tabla "sysindexes", para ver los nombres de todos los �ndices creados para 
--"alumnos":
	select * from sysindexes

--14- Cree una restricci�n unique para el campo "documento".
	alter table alumnos
		add constraint UQ_alumnos_documento
			unique (documento)

--15- Vea la informaci�n de "sp_helpconstraint".
exec sp_helpconstraint alumnos
--16- Vea los �ndices de "alumnos".
--Aparecen 5 filas, uno por cada �ndice.
exec sp_helpindex alumnos
--17- Consulte la tabla "sysindexes", para ver los nombres de todos los �ndices creados para 
--"alumnos":
	select name from sysindexes
		where name like '%alumnos%'

--18- Consulte la tabla "sysindexes", para ver los nombres de todos los �ndices creados por usted:
--3 �ndices. Recuerde que los �ndices que crea SQL Server autom�ticamente al agregarse una restricci�n 
--"primary" o "unique" no comienzan con "I_".