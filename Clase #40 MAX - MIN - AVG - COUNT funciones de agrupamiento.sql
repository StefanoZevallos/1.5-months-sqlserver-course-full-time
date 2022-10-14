/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30) default 'Desconocido',
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Planeta',15,null);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18.20,null);
insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',46.00,100);
insert into libros (titulo,autor,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll',220);
insert into libros (titulo,autor,cantidad)
  values('PHP de la A a la Z',default,0);

  select * from libros
-- Cantidad total de libros, sumamos las cantidades de cada uno:

select sum(cantidad) from libros


-- Para conocer cuántos libros tenemos de la editorial "Emece":

select count(editorial) from libros
where editorial = 'Emece'

-- Queremos saber cuál es el libro más costoso:
 
 select max(precio) 
	from libros;

-- Para conocer el precio mínimo de los libros de "Rowling":

	select min(precio) from libros 
	where autor like '%Row%'

 -- Queremos saber el promedio del precio de los libros referentes a "PHP":
	select avg(precio) from libros	
	where titulo like '%PHP%'*/
	-- ## EJERCICIO ## --
--1- Elimine la tabla, si existe:
 if object_id('empleados') is not null
  drop table empleados;
  
--2- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  primary key(documento)
 );

--3- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null);

select * from empleados

--4- Muestre la cantidad de empleados usando "count" (9 empleados)

select COUNT(*) from empleados
	
--5- Muestre la cantidad de empleados con sueldo no nulo de la sección "Secretaria" (2 empleados)
	select count(sueldo)
  from empleados
  where seccion='Secretaria';
	

--6- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000)

	select max(sueldo) as 'maximo' , 
	min(sueldo) as 'minimo' from empleados
--7- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)	
	select max(cantidadhijos) from empleados
		where nombre like '%Perez%'

--8- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es 
--tenido en cuenta)
	select avg(sueldo) from empleados 

--9- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100)

	select avg(sueldo) from empleados
		where seccion='secretaria'

--10- Muestre el promedio de hijos de todos los empleados de "Sistemas" (2)
--Ver solución
	select avg(cantidadhijos) from empleados
		where seccion='sistemas'