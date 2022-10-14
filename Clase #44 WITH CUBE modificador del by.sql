/*if object_id('empleados') is not null
  drop table empleados;

create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20),
  primary key (documento)
);

go

insert into empleados
  values ('22222222','Alberto Lopez','m','c','Sistemas');
insert into empleados
  values ('23333333','Beatriz Garcia','f','c','Administracion');
insert into empleados
  values ('24444444','Carlos Fuentes','m','s','Administracion');
insert into empleados
  values ('25555555','Daniel Garcia','m','s','Sistemas');
insert into empleados
  values ('26666666','Ester Juarez','f','c','Sistemas');
insert into empleados
  values ('27777777','Fabian Torres','m','s','Sistemas');
insert into empleados
  values ('28888888','Gabriela Lopez','f','c','Sistemas');
insert into empleados
  values ('29999999','Hector Garcia','m','c','Administracion');
insert into empleados
  values ('30000000','Ines Torres','f','c','Administracion');
insert into empleados
  values ('11111111','Juan Garcia','m','v','Administracion');
insert into empleados
  values ('12222222','Luisa Perez','f','v','Administracion');
insert into empleados
  values ('31111111','Marcela Garcia','f','s','Administracion');
insert into empleados
  values ('32222222','Nestor Fuentes','m','c','Sistemas');
insert into empleados
  values ('33333333','Oscar Garcia','m','s','Sistemas');
insert into empleados
  values ('34444444','Patricia Juarez','f','c','Administracion');
insert into empleados
  values ('35555555','Roberto Torres','m','c','Sistemas');
insert into empleados
  values ('36666666','Susana Torres','f','c','Administracion');
  select * from empleados
  ------------------------------------------------------------
select sexo,estadocivil,seccion,
  count(*) from empleados
  group by sexo,estadocivil,seccion
  with rollup;
 
select sexo,estadocivil,seccion,
  count(*) from empleados
  group by sexo,estadocivil,seccion
  with cube;*/
  -- EJEMPLO --
  --1- Elimine la tabla si existe:
/* if object_id('ventas') is not null
  drop table ventas;

--2- Cree la tabla:
 create table ventas(
  numero int identity,
  montocompra decimal(6,2),
  tipopago char(1),--c=contado, t=tarjeta
  vendedor varchar(30),
  primary key (numero)
 );

--3- Ingrese algunos registros:
 insert into ventas
  values(100.50,'c','Marisa Perez');
 insert into ventas
  values(200,'c','Marisa Perez');
 insert into ventas
  values(50,'t','Juan Lopez');
 insert into ventas
  values(220,'c','Juan Lopez');
 insert into ventas
  values(150,'t','Marisa Perez');
 insert into ventas
  values(550.80,'c','Marisa Perez');
 insert into ventas
  values(300,'t','Juan Lopez');
 insert into ventas
  values(25,'c','Marisa Perez');
  select * from ventas
--4- Agrupe por "tipopago" y "vendedor" y cuente la cantidad empleando "rollup".
--Las agrupaciones de resumen son las siguientes:
--- vendedor (tipopago seteado a "null"), 2 filas y
-- total (todos los campos seteados a "null"), 1 fila

select tipopago , vendedor , 
	count(*) as 'CUENTA' from ventas
	group by tipopago , vendedor 
	with rollup;
	--
--5- Agrupe por "tipopago" y "vendedor" y cuente la cantidad empleando "cube".
--Las agrupaciones de resumen son las siguientes:
--- vendedor (tipopago seteado a "null"), 2 filas,
--- total (todos los campos seteados a "null"), 1 fila y
--- tipopago (vendedor seteado a "null"), 2 filas.
select tipopago , vendedor , 
	count(*) as 'CUENTA' from ventas
	group by tipopago , vendedor 
	with cube;*/
	-- EJERCICIO -- 
--1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

--2- Créela con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  mail varchar(30) default 'no tiene',
  montocompra decimal(6,2)
 );
 go
--3- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba',default,22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m',default,'Alta Gracia','albertogarcia@hotmail.com',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia',default,120);
 insert into visitantes
  values ('Roberto Perez',45,'m',null,'Cordoba','robertoperez@xaxamail.com',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f',null,'Villa Dolores',default,95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','julietagomez@gmail.com',53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',default,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba',default,48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);
 
--4- Agrupe por sexo y ciudad y calcule el total de la compra empleando "rollup" y luego "cube":
--Se generan 2 filas con "ciudad" conteniendo "null" y 1 fila con ambos campos seteados a "null".
--Se generan 2 filas con "ciudad" conteniendo "null" (total de sexo femenino y masculino); 1 fila con 
--ambos campos seteados a "null" (monto total de todos los visitantes) y 3 filas con "sexo" 
--conteniendo "null" (monto total de cada ciudad). 
select * from visitantes
select sexo , ciudad , 
	sum(montocompra) as 'SUMA MONTOCOMPRA' from visitantes
	group by sexo , ciudad with rollup;
	--
select sexo , ciudad , 
	sum(montocompra) as 'SUMA MONTOCOMPRA' from visitantes
	group by sexo , ciudad with cube
	
--5- Calcule la edad promedio de los visitantes agrupando por sexo y ciudad, sin considerar los que no 
--tienen mail, use ambos modificadores de "group by" ("rollup" y "cube"):
 
--Se generan 2 filas con el promedio de edad por sexo de cada ciudad y 1 fila con el promedio de edad 
--de todos los visitantes.
 
--Se generan 2 filas con el promedio de edad por sexo de cada ciudad, 1 fila con el promedio de edad 
--de todos los visitantes y 3 filas con el promedio de edad por ciudad.

select * from visitantes
select sexo , ciudad ,
	avg(montocompra) as 'PROMEDIO MONTO COMPRA' from visitantes
	where mail like '%@%'
	group by sexo , ciudad
	with rollup; 
	--
	select sexo , ciudad ,
	avg(montocompra) as 'PROMEDIO MONTO COMPRA' from visitantes
	where mail like '%@%'
	group by sexo , ciudad
	with cube;
	
	
	