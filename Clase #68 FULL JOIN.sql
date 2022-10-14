/*if object_id('libros') is not null
  drop table libros;
if object_id('editoriales') is not null
  drop table editoriales;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
);

create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
);

go

insert into editoriales values('Planeta');
insert into editoriales values('Emece');
insert into editoriales values('Siglo XXI');

insert into libros values('El aleph','Borges',1,20);
insert into libros values('Martin Fierro','Jose Hernandez',1,30);
insert into libros values('Aprenda PHP','Mario Molina',2,50);
insert into libros values('Java en 10 minutos',default,4,45);

-- Combinación externa completa para obtener todos los registros de ambas tablas,
-- incluyendo los libros cuyo código de editorial no existe en la tabla "editoriales"
-- y las editoriales de las cuales no hay correspondencia en "libros":
select *from libros
select * from editoriales
select * from libros
	full join editoriales	
		on codigoeditorial = editoriales.codigo
		--
	 select *
  from editoriales as e
  full join libros as l
  on codigoeditorial = e.codigo;*/
  --- ''' ... ### EJERCICIOS ### ... ''' ---
--  Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada "deportes" 
--en la cual incluye el nombre del deporte y el nombre del profesor y en otra tabla llamada 
--"inscriptos" que incluye el documento del socio que se inscribe, el deporte y si la matricula está 
--paga o no.
--1- Elimine las tablas si existen y cree las tablas:
 if (object_id('deportes')) is not null
  drop table deportes;
 if (object_id('inscriptos')) is not null
  drop table inscriptos;
 create table deportes(
  codigo tinyint identity,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte tinyint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );
 go
--2- Ingrese algunos registros para ambas tablas:
 insert into deportes values('tenis','Marcelo Roca');
 insert into deportes values('natacion','Marta Torres');
 insert into deportes values('basquet','Luis Garcia');
 insert into deportes values('futbol','Marcelo Roca');
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 
 insert into inscriptos values('22222222',5,'n'); 

--3- Muestre toda la información de la tabla "inscriptos", y consulte la tabla "deportes" para 
--obtener el nombre de cada deporte (6 registros)
	select * from deportes
	select * from inscriptos
	select documento,nombre,matricula from inscriptos
		join deportes 
		on codigo=codigodeporte
		--
		select documento,d.nombre,matricula
  from inscriptos as i
  join deportes as d
  on codigodeporte=codigo;
--4- Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)
	select * from deportes
	select * from inscriptos
	select  documento, nombre , matriculafrom inscriptos
		left join deportes 
			on codigo = codigodeporte
			--
			select documento,d.nombre,matricula
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo;

	select documento, nombre, matricula from inscriptos
		left join deportes
		on codigodeporte = codigo

	--select documento,d.nombre,matricula
 -- from inscriptos as i
 -- left join deportes as d
 -- on codigodeporte=codigo;

--5- Obtenga la misma salida anterior empleando un "rigth join".
	select * from inscriptos
	select * from deportes
	
	select documento, nombre , matricula from deportes
		right join inscriptos
			on codigodeporte=deportes.codigo
			--
			 select documento,d.nombre,matricula
			  from deportes as d
			  right join inscriptos as i
			  on codigodeporte=codigo;
--6- Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)
	select  documento, nombre , matricula from deportes
		left join inscriptos
			on codigo = codigodeporte
				where documento is null
--7- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 
--registro)
	
	select * from inscriptos
	select * from deportes
				--
		select documento from deportes
		right join inscriptos
			on codigodeporte=deportes.codigo
				where nombre is null
				--
--8- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones 
--a deportes inexistentes en "deportes" y los deportes que no tienen inscriptos (8 registros)
				
				select * from inscriptos
				select * from deportes
				--
				select * from deportes
					full join inscriptos	
						on codigo=codigodeporte
						--
						select * from inscriptos
					full join deportes	
						on codigo=codigodeporte
						--
						 select documento,nombre,profesor,matricula
						  from inscriptos as i
						  full join deportes as d
						  on codigodeporte=codigo; 