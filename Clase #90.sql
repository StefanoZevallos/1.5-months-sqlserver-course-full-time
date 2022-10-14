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
--  precio decimal(5,2),
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

--insert into libros values('Uno','Richard Bach',1,15);
--insert into libros values('Ilusiones','Richard Bach',4,18);
--insert into libros values('Puente al infinito','Richard Bach',2,19);
--insert into libros values('Aprenda PHP','Mario Molina',4,40);
--insert into libros values('El aleph','Borges',2,10);
--insert into libros values('Antología','Borges',1,20);
--insert into libros values('Cervantes y el quijote','Borges',3,25);

---- Mostramos los títulos de los libros de "Borges" de editoriales que 
---- han publicado también libros de "Richard Bach":

--------------------------
--	select titulo
--	  from libros
--	  where autor like '%Borges%' and
--	  codigoeditorial = any
--	   (select e.codigo
--		from editoriales as e
--		join libros as l
--		on codigoeditorial=e.codigo
--		where l.autor like '%Bach%');
--		--
--		select * from libros
--		select * from editoriales

---- Mostramos los títulos y precios de los libros "Borges" cuyo precio 
---- supera a ALGUN precio de los libros de "Richard Bach":
		
--		select titulo,precio
--		from libros
--		where autor like '%Borges%' and
--		precio > any
--		(select precio
--		from libros
--		where autor like '%Bach%');
--		--

---- Veamos la diferencia si empleamos "all" en lugar de "any":
-- select titulo,precio
--  from libros
--  where autor like '%Borges%' and
--  precio > all
--   (select precio
--    from libros
--    where autor like '%Bach%');
--	--
--		select * from libros
--		select * from editoriales


---- Empleamos la misma subconsulta para eliminación:
-- delete from libros
--  where autor like '%Borges%' and
--  precio > all
--   (select precio
--    from libros
--    where autor like '%Bach%');

	-- EJERCICIOS --
	--1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
  --

	--
	--2- Cree las tablas:
	 create table socios(
	  numero int identity,
	  documento char(8),
	  nombre varchar(30),
	  domicilio varchar(30),
	  primary key (numero)
	 );
 
	 create table inscriptos (
	  numerosocio int not null,
	  deporte varchar(20) not null,
	  cuotas tinyint
	  constraint CK_inscriptos_cuotas
	   check (cuotas>=0 and cuotas<=10)
	  constraint DF_inscriptos_cuotas default 0,
	  primary key(numerosocio,deporte),
	  constraint FK_inscriptos_socio
	   foreign key (numerosocio)
	   references socios(numero)
	   on update cascade
	   on delete cascade,
	 );
	GO
	--3- Ingrese algunos registros:
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

--4- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de 
--ambas tablas.

	 select * from socios
	 select * from inscriptos
	 --
	 select numerosocio , nombre , deporte from socios	
		join inscriptos 
			on numerosocio=numero
			--
	select numero,nombre,deporte
		from socios as s
		join inscriptos as i
		on numerosocio=numero;

--5- Muestre los socios que se serán compañeros en tenis y también en natación (empleando 
--subconsulta)
--3 filas devueltas.
		------------------------
		select * from socios
		select * from inscriptos
		------------------------
		select numerosocio , nombre , deporte from socios	
		join inscriptos 
		on numerosocio=numero
			where deporte = 'natacion'
				and 
		--------------------------
				select nombre
			from socios
			join inscriptos as i
			on numero=numerosocio
			where deporte='natacion' and 
			numero= any
			(select numerosocio
			from inscriptos as i
			where deporte='tenis');
		
	

--6- vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio 2.
--3 filas.
	
	-- #COMPLETAR# -- 

--7- Obtenga el mismo resultado anterior pero empleando join.

	-- COMPLETAR -- 

--8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en los que se 
--inscribió el socio 1.
--2 registros.

	select * from inscriptos	
	select * from socios
	--
		select deporte
	  from inscriptos as i
	  where numerosocio=2 and
	  cuotas>any
	   (select cuotas
		from inscriptos
		where numerosocio=1); 

--9- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS los deportes en que se 
--inscribió el socio 1.
--1 registro.
select deporte
	  from inscriptos as i
	  where numerosocio=2 and
	  cuotas>all
	   (select cuotas
		from inscriptos
		where numerosocio=1);
	

--10- Cuando un socio no ha pagado la matrícula de alguno de los deportes en que se ha inscripto, se 
--lo borra de la inscripción de todos los deportes. Elimine todos los socios que no pagaron ninguna 
--cuota en algún deporte.
--7 registros.
	 delete from inscriptos
	  where numerosocio=any
	   (select numerosocio 
		from inscriptos
		where cuotas=0);
