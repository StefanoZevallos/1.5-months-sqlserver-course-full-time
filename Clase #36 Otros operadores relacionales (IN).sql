/*if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros (titulo,precio)
  values('Antología poética',32);
insert into libros (titulo,autor,precio)
  values('Martin Fierro','Jose Hernandez',40);
insert into libros (titulo,autor,precio)
  values('Aprenda PHP','Mario Molina',56.50);

select * from libros
  where autor in('Borges','Paenza');

select * from libros
  where autor not in ('Borges','Paenza');*/
  -- ### EJERCICIO ### --
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
  primary key(codigo)
 );
 GO
--3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01');
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01');
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01');
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01');
 insert into medicamentos 
  values('Bayaspirina','Bayer',2.10,150,'2019-12-01'); 
 insert into medicamentos 
  values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01'); 

  SELECT * from medicamentos	
--4- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" 
--empleando el operador "in" (4 registros)
	 select * from medicamentos	
	 where laboratorio in ('Bayer' , 'Bago')


--5- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y 
--luego el operador "in" (2 registros):
	select * from medicamentos	
	where cantidad between 1 and 5;
	select * from medicamentos	
	where cantidad in (1,2,3,4,5)

--Note que es más conveniente emplear, en este caso, el operador ""between".

