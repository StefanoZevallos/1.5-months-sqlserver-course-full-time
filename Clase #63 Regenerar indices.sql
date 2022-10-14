/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
);

go

-- Creamos un �ndice no agrupado para el campo "titulo":
	 create nonclustered index I_libros_titulo
		on libros(titulo)

-- Vamos a agregar el campo "autor" al �ndice "I_libros_titulo"
-- y vemos si se modific�:
	 create nonclustered index I_libros_titulo
		on libros(titulo,autor)
			with drop_existing;

-- Lo convertimos en agrupado:
	create clustered index I_libros_titulo
		on libros(titulo,autor)
			with drop_existing;

-- Quitamos un campo "autor":
create clustered index I_libros_titulo
		on libros(titulo)
			with drop_existing;*/
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
	create nonclustered index I_alumnos_apellido
		on alumnos(apellido)

--3- Vea la informaci�n de los �ndices de "alumnos".
	exec sp_helpindex alumnos

--4- Modif�quelo agregando el campo "nombre".
	create  index I_alumnos_apellido
		on alumnos(apellido,nombre)
		with drop_existing

--5- Verifique que se modific�:
-- exec sp_helpindex alumnos;

--6- Establezca una restricci�n "unique" para el campo "documento".

	alter table alumnos
		add constraint UQ_libros_documento
			unique nonclustered (documento)
--7- Vea la informaci�n que muestra "sp_helpindex":
 exec sp_helpindex alumnos

--8- Intente modificar con "drop_existing" alguna caracter�stica del �ndice que se cre� 
--autom�ticamente al agregar la restricci�n "unique":
	

--No se puede emplear "drop_existing" con �ndices creados a partir de una restricci�n.

--9- Cree un �ndice no agrupado para el campo "legajo".
	create index I_alumnos_legajo
		on alumnos(legajo)


--10- Muestre todos los �ndices:
 exec sp_helpindex alumnos

--11- Convierta el �ndice creado en el punto 9 a agrupado conservando las dem�s caracter�sticas.
	create clustered index I_alumnos_legajo
		on alumnos(legajo)
		with drop_existing

--12- Verifique que se modific�:
 exec sp_helpindex alumnos

--13- Intente convertir el �ndice "I_alumnos_legajo" a no agrupado:
--No se puede convertir un �ndice agrupado en no agrupado.

--14- Modifique el �ndice "I_alumnos_apellido" quit�ndole el campo "nombre".

	create  index I_alumnos_apellido
		on alumnos(apellido)
		with drop_existing


--15- Intente convertir el �ndice "I_alumnos_apellido" en agrupado:
	create  clustered index I_alumnos_apellido
		on alumnos(apellido)
		with drop_existing

--No lo permite porque ya existe un �ndice agrupado.

--16- Modifique el �ndice "I_alumnos_legajo" para que sea �nico y conserve todas las otras 
--caracter�sticas.
	create unique clustered index I_alumnos_legajo
		on alumnos(legajo)
		with drop_existing



--17- Verifique la modificaci�n:
 exec sp_helpindex alumnos;

--18- Modifique nuevamente el �ndice "I_alumnos_legajo" para que no sea �nico y conserve las dem�s 
--caracter�sticas.

create clustered index I_alumnos_legajo
		on alumnos(legajo)
		with drop_existing


--19- Verifique la modificaci�n:
-- exec sp_helpindex alumnos