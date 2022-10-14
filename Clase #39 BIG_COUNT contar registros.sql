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

insert into libros values('El aleph','Borges','Emece',15.90);
insert into libros values('Antología poética','Borges','Planeta',null);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros values('Martin Fierro','Jose Hernandez',default,40);
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',null);
insert into libros values('Uno','Richard Bach','Planeta',20);

select count_big(*)
  from libros;

select count_big(*)
  from libros
  where editorial='Planeta';

select count_big(precio)
  from libros;

-- Contamos las editoriales (sin repetir):
select count_big(distinct editorial)
  from libros;*/

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

--4- Muestre la cantidad de registros empleando la función "count_big(*)" (6 registros)

select COUNT_BIG(*) from medicamentos

--5- Cuente la cantidad de laboratorios distintos (3 registros)

select COUNT_BIG(distinct laboratorio) from medicamentos

--6- Cuente la cantidad de medicamentos que tienen precio y cantidad distinto de "null" (5 y 5)

select COUNT_BIG(precio) , COUNT_BIG(cantidad) from medicamentos 
