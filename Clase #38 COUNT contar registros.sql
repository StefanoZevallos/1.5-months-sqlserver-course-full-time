/*if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','J. L. Borges','Planeta',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo',null);
insert into libros
  values('Uno','Richard Bach','Planeta',20);
  select * from libros

-- Averiguemos la cantidad de libros usando la función "count()":
select count(*)
from libros ;

-- Contamos los libros de editorial "Planeta":
select count(editorial) from libros	
	where editorial = 'planeta'
-- Contamos los registros que tienen precio (sin tener en cuenta 
-- los que tienen valor nulo),
select count(precio) from libros;*/
-- EJERCICIOS --
--1- Elimine la tabla, si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 );
 go
--3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

select * from medicamentos
--4- Muestre la cantidad de registros empleando la función "count(*)" (6 registros)

select count(*) as 'Count(*)' from medicamentos

--5- Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)

select count(laboratorio) 'Count(laboratorio)'from medicamentos

--6- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que tienen cantidad 
--distinto a "null", disponer alias para las columnas.
select count(precio) as precio,
		count(cantidad) as cantidad from medicamentos


--7- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" (2 
--registros)

select count(precio) as precio from medicamentos
	where laboratorio like 'B%'

--8- Cuente la cantidad de medicamentos con número de lote distitno de "null" (0 registros)

select count(numerolote) from medicamentos 