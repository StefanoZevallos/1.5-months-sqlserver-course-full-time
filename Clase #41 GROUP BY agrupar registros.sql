/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

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
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200);
insert into libros
  values('PHP de la A a la Z',null,null,null,0);
  select * from libros 

-- Cantidad de libros de cada editorial:

	select  editorial , count(*) from libros
		group by editorial  

-- Cantidad libros con precio no nulo de cada editorial:

	select editorial, count(precio)
	from libros
	group by editorial;
		

-- Total en dinero de los libros agrupados por editorial:
	select sum(precio) from libros	
		group by editorial;

-- Máximo y mínimo valor de los libros agrupados por editorial:
	select editorial ,max(precio) as 'maximo' , 
		min(precio) as 'minimo' from libros 
		group by editorial;

-- Promedio del valor de los libros agrupados por editorial:
	select editorial , avg(precio) as 'promedio' from libros	
		group by editorial

-- Contar y agrupar por editorial considerando solamente los libros cuyo precio es menor a 30 pesos:
		select editorial , count(precio) from libros
		where precio < 30
		group by editorial 
	
-- Todos los valores de editorial, incluso los que devuelven cero o "null" en la columna de agregado,
--  debemos emplear la palabra clave "all" al lado de "group by":
	select editorial from libros 
	group by all editorial*/

--	## EJERCICIO ##
	--1- Elimine la tabla "visitantes", si existe:
 /*if object_id('visitantes') is not null
  drop table visitantes;

--2- Cree la tabla con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

--3- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);
  SELECT * FROM visitantes

--4- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)

select ciudad , count(*) from visitantes	
	group by ciudad

--5- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)

	select ciudad, count(telefono) from visitantes
		group by ciudad;
		
--6- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)
	select * from visitantes
	select sexo , sum(montocompra) from visitantes
		group by sexo 

--7- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)

	select * from visitantes
	select sexo ,ciudad , max(montocompra) as mayor, min(montocompra) as menor from visitantes
	group by sexo , ciudad

--8- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)
	select * from visitantes
	select avg(montocompra) from visitantes
	group by ciudad
--9- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas):
	select * from visitantes
	select  ciudad , count(mail) as mail from visitantes
	where mail like '%@%'
	group by ciudad
	select ciudad,
	count(*) as 'cantidad con mail'
	from visitantes
	where mail is not null and
	mail<>'no tiene'
	group by ciudad;
--10- Realice la misma consulta anterior, pero use la palabra clave "all" para mostrar todos los 
--valores de ciudad, incluyendo las que devuelven cero o "null" en la columna de agregado (4 filas)

	select * from visitantes
	select  ciudad , count(mail) as mail from visitantes
	where mail like '%@%'
	group by all ciudad
	select ciudad,
  count(*) as 'cantidad con mail'
  from visitantes
  where mail is not null and
  mail<>'no tiene'
  group by all ciudad;*/
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
  fechaingreso datetime,
  primary key(documento)
 );
  go
--3- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null,null);
  SELECT * from empleados
--4- Cuente la cantidad de empleados agrupados por sección (5 filas)
select seccion ,count(*) as 'Contar' from empleados
	group by seccion
--5- Calcule el promedio de hijos por sección (5 filas):
	select seccion , avg(cantidadhijos) as 'Promedio' from empleados
		group by seccion
--6- Cuente la cantidad de empleados agrupados por año de ingreso (6 filas)
	select DATEPART(year,fechaingreso) , count(nombre) as empleados from empleados
		group by DATEPART(year,fechaingreso)
		
--7- Calcule el promedio de sueldo por sección de los empleados con hijos (4 filas)
	SELECT * from empleados
	select seccion , avg(sueldo) from empleados
		where cantidadhijos > 0 
		group by seccion

--8- Realice la misma consulta anterior pero esta vez incluya las secciones que devuelven cero o 
--"null" en la columna de agregado (5 filas)
SELECT * from empleados
	select seccion , avg(sueldo) from empleados
		where cantidadhijos > 0 
		group by all seccion