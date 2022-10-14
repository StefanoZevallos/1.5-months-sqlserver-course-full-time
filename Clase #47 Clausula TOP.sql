/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(20),
  editorial varchar(20)
);

go

insert into libros values ('Uno','Richard Bach','Planeta');
insert into libros values ('El aleph','Borges','Emece');
insert into libros values ('Alicia en el pais...','Carroll','Planeta');
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI');
insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI');
insert into libros values ('Java desde cero','Mario Molina','Emece');
insert into libros values ('Ilusiones','Richard Bach','Planeta');

-- Obtenemos todos los datos de los primeros 2 libros de la tabla:
select * from libros
select top 2 * from libros;

-- Mostramos los títulos y autores de los 3 primeros libros ordenados por autor:
select * from libros
select top 3 titulo,autor 
  from libros
  order by autor;

-- Realizamos la misma consulta anterior pero empleamos la cláusula "with ties", 
-- con lo cual incluiremos en la selección, todos los registros que tengan el
-- mismo autor que el último registro retornado, aunque pasemos de 3:
select * from libros
select top 3 with ties titulo,autor 
  from libros
  order by autor;

-- El 50% de los registros de la tabla libros:
select * from libros
select top 50 percent
  * from libros
  order by autor;*/
  -- EJERCICIO -- 
  --1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20)
 );

--3- Ingrese algunos registros:
 insert into empleados
  values ('22222222','Alberto Lopez','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez','c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres','s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia',null,'Administracion');

--4- Muestre los 5 primeros registros (5 registros)
select * from empleados
	select top 5 * from empleados

--5- Muestre nombre y seccion de los 4 primeros registros ordenados por sección (4 registros)

select * from empleados
	select top 4 nombre , seccion from empleados
	order by seccion;
--6- Realice la misma consulta anterior pero incluya todos los registros que tengan el mismo valor en 
--"seccion" que el último (8 registros)
	select * from empleados	
	select top 4 with ties nombre , seccion from empleados
		order by seccion;

--7- Muestre nombre, estado civil y seccion de los primeros 4 empleados ordenados por estado civil y 
--sección (4 registros)
	select *from empleados
		select top 4 nombre , estadocivil , seccion from empleados
		order by estadocivil, seccion

--8- Realice la misma consulta anterior pero incluya todos los valores iguales al último registro 
--retornado (5 registros)
select *from empleados
		select top 4 with ties nombre , estadocivil , seccion from empleados
		order by estadocivil, seccion