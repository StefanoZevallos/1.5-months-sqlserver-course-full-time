/*if object_id('visitantes') is not null
  drop table visitantes;

create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
);

go

insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

-- Cantidad de visitantes por ciudad y el total de visitantes
select * from visitantes
select ciudad,
  count(*) as cantidad
  from visitantes
  group by ciudad with rollup;

-- Filas de resumen cuando agrupamos por 2 campos, "ciudad" y "sexo":
 select * from visitantes
 select ciudad,sexo,
  count(*) as cantidad
  from visitantes
  group by ciudad,sexo
  with rollup;

-- Para conocer la cantidad de visitantes y la suma de sus compras agrupados
-- por ciudad y sexo,
  select * from visitantes
 select ciudad,sexo,
  count(*) as cantidad,
  sum(montocompra) as total
  from visitantes
  group by ciudad,sexo
  with CUBE;*/
  -- EJERCICIO --
 -- 1- Elimine la tabla "clientes", si existe:
 /*if object_id('clientes') is not null
  drop table clientes;

--2- Créela con la siguiente estructura:
 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  estado varchar (20),
  pais varchar(20),
  primary key(codigo)
 );
 GO
--3- Ingrese algunos registros:
 insert into clientes
  values ('Lopez Marcos','Colon 111', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Perez Ana','San Martin 222', 'Carlos Paz','Cordoba','Argentina');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333', 'Carlos Paz','Cordoba','Argentina');
 insert into clientes
  values ('Perez Luis','Sarmiento 444', 'Rosario','Santa Fe','Argentina');
 insert into clientes
  values ('Gomez Ines','San Martin 987', 'Santa Fe','Santa Fe','Argentina');
 insert into clientes
  values ('Gomez Ines','San Martin 666', 'Santa Fe','Santa Fe','Argentina');
 insert into clientes
  values ('Lopez Carlos','Irigoyen 888', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Ramos Betina','San Martin 999', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Fernando Salas','Mariano Osorio 1234', 'Santiago','Region metropolitana','Chile');
 insert into clientes
  values ('German Rojas','Allende 345', 'Valparaiso','Region V','Chile');
 insert into clientes
  values ('Ricardo Jara','Pablo Neruda 146', 'Santiago','Region metropolitana','Chile');
 insert into clientes
  values ('Joaquin Robles','Diego Rivera 147', 'Guadalajara','Jalisco','Mexico');

--4- Necesitamos la cantidad de clientes por país y la cantidad total de clientes en una sola consulta 
--(4 filas)
--Note que la consulta retorna los registros agrupados por pais y una fila extra en la que la columna 
--"pais" contiene "null" y la columna con la cantidad muestra la cantidad total.
select * from clientes
	select pais , 
	count(*) as 'CONTAR' from clientes	
	group by pais with rollup 
--5- Necesitamos la cantidad de clientes agrupados por pais y estado, incluyendo resultados paciales 
--(9 filas)
--Note que la salida muestra los totales por pais y estado y produce 4 filas extras: 3 muestran los 
--totales para cada pais, con la columna "estado" conteniendo "null" y 1 muestra el total de todos los 
--clientes, con las columnas "pais" y "estado" conteniendo "null".

select * from clientes
	select pais , estado, 
	count(*) as 'CONTAR' from clientes	
	group by pais, estado
	with rollup 

--6- Necesitamos la cantidad de clientes agrupados por pais, estado y ciudad, empleando "rollup" (16 filas)
--El resultado muestra los totales por pais, estado y ciudad y genera 9 filas extras: 5 muestran los 
--totales para cada estado, con la columna correspondiente a "ciudad" conteniendo "null", 3 muestran 
--los totales para cada pais, con las columnas "ciudad" y "estado" conteniendo "null" y 1 muestra el 
--total de todos los clientes, con las columnas "pais", "estado" y "ciudad" conteniendo "null".
	select * from clientes
	select pais , estado , ciudad,
	count(*) from clientes
	group by pais,estado , ciudad 
	with rollup*/
	-- EJERCICIO --
--Un instituto de enseñanza guarda las notas de sus alumnos en una tabla llamada "notas".
--1- Elimine la tabla si existe:
 if object_id('notas') is not null
  drop table notas;

--2- Cree la tabla con la siguiente estructura:
 create table notas(
  documento char(8) not null,
  materia varchar(30),
  nota decimal(4,2)
 );

--3-Ingrese algunos registros:
 insert into notas values ('22333444','Programacion',8);
 insert into notas values ('22333444','Programacion',9);
 insert into notas values ('22333444','Ingles',8);
 insert into notas values ('22333444','Ingles',7);
 insert into notas values ('22333444','Ingles',6);
 insert into notas values ('22333444','Sistemas de datos',10);
 insert into notas values ('22333444','Sistemas de datos',9);

 insert into notas values ('23444555','Programacion',5);
 insert into notas values ('23444555','Programacion',4);
 insert into notas values ('23444555','Programacion',3);
 insert into notas values ('23444555','Ingles',9);
 insert into notas values ('23444555','Ingles',7);
 insert into notas values ('23444555','Sistemas de datos',9);

 insert into notas values ('24555666','Programacion',1);
 insert into notas values ('24555666','Programacion',3.5);
 insert into notas values ('24555666','Ingles',4.5);
 insert into notas values ('24555666','Sistemas de datos',6);

--4- Se necesita el promedio por alumno por materia y el promedio de cada alumno en todas las materias 
--cursadas hasta el momento (13 registros):
--Note que  hay 4 filas extras, 3 con el promedio de cada alumno y 1 con el promedio de todos los 
--alumnos de todas las materias.
select * from notas
	select materia ,
	avg(nota) from notas	
	group by materia
	--
	select documento,materia,
  avg(nota) as promedio
  from notas
  group by documento,materia with rollup;
--5- Compruebe los resultados parciales de la consulta anterior realizando otra consulta mostrando el 
--promedio de todas las carreras de cada alumno (4 filas)

select * from notas
select avg(nota) from notas
	group by materia

--6- Muestre la cantidad de notas de cada alumno, por materia (9 filas)
select * from notas
select documento , materia ,
count(nota) as cantidad from notas 
group by documento , materia 
--
select documento,materia,
  count(nota) as cantidad
  from notas
  group by documento,materia;
--7- Realice la misma consulta anterior con resultados parciales incluidos (13 filas)
select * from notas
select documento , materia ,
count(nota) as cantidad from notas 
group by documento , materia 
--8- Muestre la nota menor y la mayor de cada alumno y la menor y mayor nota de todos (use "rollup") 
--(4 filas)
select * from notas
select documento , max(nota) , min(nota) from notas
	group by documento with rollup
	--select documento,
select documento,
  min(nota) as minima, max(nota)as maxima
  from notas
  group by documento with rollup;