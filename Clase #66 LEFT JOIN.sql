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

-- Combinación izquierda para obtener los datos de los libros, 
-- incluyendo el nombre de la editorial.
-- Las editoriales de las cuales no hay libros, es decir, cuyo código
-- de editorial no está presente en "libros" aparece en el resultado, 
-- pero con el valor "null" en el campo "titulo":
select * from libros
select * from editoriales
select titulo , nombre  from editoriales as e
	left join libros as l
		on l.codigoeditorial = e.codigo
		--
		select titulo,nombre
  from editoriales as e
  left join libros as l
  on l.codigoeditorial = e.codigo;

-- Realizamos la misma consulta anterior pero cambiamos el orden de las tablas:
	select titulo , nombre
		from libros
		left join editoriales	
			on editoriales.codigo = libros.codigoeditorial
			--
			select titulo,nombre
			  from libros as l
			  left join editoriales as e
			  on codigoeditorial = e.codigo;

-- Consulta considerando solamente los registros que encuentran coincidencia en la
-- tabla de la derecha, es decir, cuyo valor de código está presente en "libros":

	select titulo,nombre
  from editoriales as e
  left join libros as l
  on e.codigo=codigoeditorial
  where codigoeditorial is not null;


-- Mostramos las editoriales que no están presentes en "libros", es decir,
-- que no encuentran coincidencia en la tabla de la derecha:
	select titulo,nombre
  from editoriales as e
  left join libros as l
  on e.codigo=codigoeditorial
  where codigoeditorial is null;
  --
  select titulo,nombre
  from editoriales as e
  left join libros as l
  on e.codigo=codigoeditorial
  where codigoeditorial is null;*/
  -- EJERCICIOS -- 
  --1- Elimine las tablas "clientes" y "provincias", si existen y cree las tablas:
  if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

--3- Muestre todos los datos de los clientes, incluido el nombre de la provincia:

select * from clientes	
select * from provincias
select clientes.nombre,domicilio,ciudad,provincias.nombre from clientes
	left join provincias
		on codigoprovincia = provincias.codigo
		--
		 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;

--4- Realice la misma consulta anterior pero alterando el orden de las tablas:
	select clientes.nombre,domicilio,ciudad,provincias.nombre from provincias
	left join clientes
		on codigoprovincia = provincias.codigo
		--
		select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  left join clientes as c
  on codigoprovincia = p.codigo;
--5- Muestre solamente los clientes de las provincias que existen en "provincias" (5 registros):

	select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre is not null
  --
   select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is not null;


--6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por 
--nombre del cliente (2 registros):
select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre is null
  order by c.nombre
  --
  select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by c.nombre;
 

--7- Obtenga todos los datos de los clientes de "Cordoba" (3 registros):
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre = 'Cordoba'
  --
  select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre='Cordoba';

  