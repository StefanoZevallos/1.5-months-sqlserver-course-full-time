--if object_id('empleados') is not null
--  drop table empleados;

--create table empleados(
--  documento char(8),
--  nombre varchar(10),
--  domicilio varchar(30),
--  sueldobasico decimal(6,2),
--  hijos tinyint not null default 0,
--  sueldototal as sueldobasico + (hijos*100)
--);

--go

---- No puede ingresarse valor para el campo sueldototal:
--insert into empleados values('22222222','Juan Perez','Colon 123',300,2);
--insert into empleados values('23333333','Ana Lopez','Sucre 234',500,0);

--select * from empleados;

---- Actualizamos un registro:
--update empleados set hijos=1 where documento='23333333';

--select * from empleados;

---- Agregamos un campo calculado:
--alter table empleados
--  add salariofamiliar as hijos*100;

--exec sp_columns empleados;

--select * from empleados;

-- EJERCICIOS --
--1- Elimine la tabla, si existe y créela nuevamente:
 if object_id('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo int identity,
  descripcion varchar(30),
  precio decimal(5,2) not null,
  cantidad smallint not null default 0,
  montototal as precio *cantidad
 );
--El campo "montototal" es un campo calculado que multiplica el precio de cada artículo por la 
--cantidad disponible.
SELECT * FROM articulos
--2- Intente ingresar un registro con valor para el campo calculado:
 insert into articulos values('birome',1.5,100,150);
--No lo permite.

--3- Ingrese algunos registros:
 insert into articulos values('birome',1.5,100);
 insert into articulos values('cuaderno 12 hojas',4.8,150);
 insert into articulos values('lapices x 12',5,200);

--4- Recupere los registros:
 select * from articulos;

--5- Actualice un precio y recupere los registros:
 update articulos set precio=2 where descripcion='birome';
 select * from articulos;
--el campo calculado "montototal" recalcula los valores para cada registro automáticamente.

--6- Actualice una cantidad y vea el resultado:
 update articulos set cantidad=200 where descripcion='birome';
 select * from articulos;
--el campo calculado "montototal" recalcula sus valores.

--7- Intente actualizar un campo calculado:
 update articulos set montototal=300 where descripcion='birome';
--No lo permite.