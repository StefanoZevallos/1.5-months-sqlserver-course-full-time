if object_id('libros') is not null
  drop table libros;
if object_id('editoriales') is not null
  drop table editoriales;

create table editoriales(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
);
 
create table libros (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  precio decimal(5,2),
  primary key(codigo)
);

go

insert into editoriales values('Planeta');
insert into editoriales values('Emece');
insert into editoriales values('Paidos');
insert into editoriales values('Siglo XXI');

insert into libros values('Uno','Richard Bach',1,15);
insert into libros values('Ilusiones','Richard Bach',2,20);
insert into libros values('El aleph','Borges',3,10);
insert into libros values('Aprenda PHP','Mario Molina',4,40);
insert into libros values('Poemas','Juan Perez',1,20);
insert into libros values('Cuentos','Juan Perez',3,25);
insert into libros values('Java en 10 minutos','Marcelo Perez',2,30);

-- Actualizamos el precio de todos los libros de editorial "Emece"
-- incrementándolos en un 10%:
	
	--select * from libros
	--select * from editoriales
	------------------------------
	--update libros set precio = precio+(precio*0.1)
	--	where codigoeditorial= 2
	------------------------------
	--update libros set precio=precio+(precio*0.1)
	--  where codigoeditorial=
	--   (select codigo
	--	 from editoriales
	--	 where nombre='Emece');

	--	----- JOIN -----
	--	select l.codigo, titulo , autor , nombre as 'editorial' , precio from libros as l
	--		join editoriales as e	
	--			on e.codigo = l.codigoeditorial

-- Eliminamos todos los libros de las editoriales que tiene 
-- publicados libros de "Juan Perez":

	select * from libros
	select * from editoriales
	-------------------------
	delete from libros	
	where autor = 'Juan Perez'
	-------------------------
	delete from libros
	  where codigoeditorial in
	   (select e.codigo
		from editoriales as e
		join libros
		on codigoeditorial=e.codigo
		where autor='Juan Perez');
	--------------------------

-- EJERCICIOS --
--1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;

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
  matricula char(1),-- 'n' o 's'
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
 );
 go
--3- Ingrese algunos registros:
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis','s');
 insert into inscriptos values(1,'basquet','s');
 insert into inscriptos values(1,'natacion','s');
 insert into inscriptos values(2,'tenis','s');
 insert into inscriptos values(2,'natacion','s');
 insert into inscriptos values(2,'basquet','n');
 insert into inscriptos values(2,'futbol','n');
 insert into inscriptos values(3,'tenis','s');
 insert into inscriptos values(3,'basquet','s');
 insert into inscriptos values(3,'natacion','n');
 insert into inscriptos values(4,'basquet','n');

--4- Actualizamos la cuota ('s') de todas las inscripciones de un socio determinado (por documento) 
--empleando subconsulta.
	select * from socios;
	select * from inscriptos;
	------------------------
	update socios set cuota= 's'
		where 
		




--5- Elimine todas las inscripciones de los socios que deben alguna matrícula (5 registros eliminados)