--if object_id('libros') is not null
--  drop table libros;
--if object_id('editoriales') is not null
--  drop table editoriales;

--create table editoriales(
--  codigo tinyint identity,
--  nombre varchar(30),
--  primary key (codigo)
--);
 
--create table libros (
--  codigo int identity,
--  titulo varchar(40),
--  autor varchar(30),
--  codigoeditorial tinyint,
--  primary key(codigo),
-- constraint FK_libros_editorial
--   foreign key (codigoeditorial)
--   references editoriales(codigo)
--   on update cascade,
--);

--go

--insert into editoriales values('Planeta');
--insert into editoriales values('Emece');
--insert into editoriales values('Paidos');
--insert into editoriales values('Siglo XXI');

--insert into libros values('Uno','Richard Bach',1);
--insert into libros values('Ilusiones','Richard Bach',1);
--insert into libros values('Aprenda PHP','Mario Molina',4);
--insert into libros values('El aleph','Borges',2);
--insert into libros values('Puente al infinito','Richard Bach',2);

---- Queremos conocer el nombre de las editoriales que han publicado 
---- libros del autor "Richard Bach": 
--select * from editoriales
--select * from libros
----
--select nombre
--  from editoriales
--  where codigo in
--   (select codigoeditorial
--     from libros
--     where autor='Richard Bach');

---- Probamos la subconsulta separada de la consulta exterior
---- para verificar que retorna una lista de valores de un solo campo:
--select codigoeditorial
--  from libros
--  where autor='Richard Bach';

---- Podemos reemplazar por un "join" la primera consulta:
--select distinct nombre
--  from editoriales as e
--  join libros
--  on codigoeditorial=e.codigo
--  where autor='Richard Bach';

---- También podemos buscar las editoriales que no han publicado
---- libros de "Richard Bach":
--	select nombre
--	  from editoriales
--	  where codigo not in
--	   (select codigoeditorial
--		 from libros
--		 where autor='Richard Bach');
		 -- EJERCICIOS --
	--1- Elimine las tablas "clientes" y "ciudades", si existen:
  if (object_id('ciudades')) is not null
   drop table ciudades;
  if (object_id('clientes')) is not null
   drop table clientes;

--2- Cree la tabla "clientes" (codigo, nombre, domicilio, ciudad, codigociudad) y "ciudades" (codigo, 
--nombre). Agregue una restricción "primary key" para el campo "codigo" de ambas tablas y una "foreing 
--key" para validar que el campo "codigociudad" exista en "ciudades" con actualización en cascada:
 create table ciudades(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad tinyint not null,
  primary key(codigo),
  constraint FK_clientes_ciudad
   foreign key (codigociudad)
   references ciudades(codigo)
   on update cascade,
 );
 GO
--3- Ingrese algunos registros para ambas tablas:
 insert into ciudades (nombre) values('Cordoba');
 insert into ciudades (nombre) values('Cruz del Eje');
 insert into ciudades (nombre) values('Carlos Paz');
 insert into ciudades (nombre) values('La Falda');
 insert into ciudades (nombre) values('Villa Maria');

 insert into clientes values ('Lopez Marcos','Colon 111',1);
 insert into clientes values ('Lopez Hector','San Martin 222',1);
 insert into clientes values ('Perez Ana','San Martin 333',2);
 insert into clientes values ('Garcia Juan','Rivadavia 444',3);
 insert into clientes values ('Perez Luis','Sarmiento 555',3);
 insert into clientes values ('Gomez Ines','San Martin 666',4);
 insert into clientes values ('Torres Fabiola','Alem 777',5);
 insert into clientes values ('Garcia Luis','Sucre 888',5);

--4- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle 
--"San Martin", empleando subconsulta.
--3 registros.
SELECT * FROM CIUDADES
SELECT * FROM CLIENTES
--
	select nombre from ciudades
		where codigo  in 
			(select codigociudad from clientes where domicilio like '%san martin%')
			--
			select nombre
		  from ciudades
		  where codigo in
		   (select codigociudad
			 from clientes
			 where domicilio like '%San Martin %');
--
--5- Obtenga la misma salida anterior pero empleando join.
	
		select * from clientes
		select * from ciudades
		--
		select  ciudades.nombre from clientes	
			join ciudades 
				on ciudades.codigo = codigociudad
					where domicilio like '%martin%'


--6- Obtenga los nombre de las ciudades de los clientes cuyo apellido no comienza con una letra 
--específica, empleando subconsulta.
--2 registros.

		select * from clientes
		select * from ciudades
		----------------------
		select nombre from ciudades
			where codigo in 
				( 
				--
				select nombre
			  from ciudades
			  where codigo not in
			   (select codigociudad
				 from clientes
				 where nombre like 'G%');

--7- Pruebe la subconsulta del punto 6 separada de la consulta exterior para verificar que retorna una 
--lista de valores de un solo campo.
	