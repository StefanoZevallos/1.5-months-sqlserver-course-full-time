if object_id('afiliados') is not null
  drop table afiliados;

create table afiliados(
  numero int identity not null,
  documento char(8) not null,
  nombre varchar(30),
  afiliadotitular int,
  primary key (documento),
  unique (numero)
);

go

alter table afiliados
  add constraint FK_afiliados_afiliadotitular
  foreign key (afiliadotitular)
  references afiliados (numero);
  select * from afiliados
insert into afiliados values('22222222','Perez Juan',null);
insert into afiliados values('23333333','Garcia Maria',null);
insert into afiliados values('24444444','Lopez Susana',null);
insert into afiliados values('30000000','Perez Marcela',1);
insert into afiliados values('31111111','Morales Luis',1);
insert into afiliados values('32222222','Garcia Maria',2);

delete from afiliados where numero=5;

exec sp_helpconstraint afiliados;
-- EJERCICIOS --
--1- Elimine las tablas "clientes" y "provincias", si existen y créelas:
 if object_id('clientes') is not null
  drop table clientes;
 if object_id('provincias') is not null
  drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint
 );

 create table provincias(
  codigo tinyint not null,
  nombre varchar(20)
 );

--En este ejemplo, el campo "codigoprovincia" de "clientes" es una clave foránea, se emplea para 
--enlazar la tabla "clientes" con "provincias".

--2- Intente agregar una restricción "foreign key" a la tabla "clientes" que haga referencia al campo 
--"codigo" de "provincias":
 alter table clientes
 add constraint FK_clientes_codigoprovincia
  foreign key (codigoprovincia)
  references provincias(codigo);
--No se puede porque "provincias" no tiene restricción "primary key" ni "unique".

--3- Establezca una restricción "primary key" al campo "codigo" de "provincias":
 alter table provincias
 add constraint PK_provincias_codigo
  primary key (codigo);

--4- Ingrese algunos registros para ambas tablas:
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);
 insert into clientes values('Luisa Lopez','Juarez 555','La Plata',6);

--5- Intente agregar la restricción "foreign key" del punto 2 a la tabla "clientes":
-- alter table clientes
-- add constraint FK_clientes_codigoprovincia
--  foreign key (codigoprovincia)
--  references provincias(codigo);
--No se puede porque hay un registro en "clientes" cuyo valor de "codigoprovincia" no existe en 
--"provincias".

--6- Elimine el registro de "clientes" que no cumple con la restricción y establezca la restricción 
--nuevamente:
-- delete from clientes where codigoprovincia=6;
-- alter table clientes
-- add constraint FK_clientes_codigoprovincia
--  foreign key (codigoprovincia)
--  references provincias(codigo);

--7- Intente agregar un cliente con un código de provincia inexistente en "provincias".
--No se puede.

--8- Intente eliminar el registro con código 3, de "provincias".
--No se puede porque hay registros en "clientes" al cual hace referencia.

--9- Elimine el registro con código "4" de "provincias".
--Se permite porque en "clientes" ningún registro hace referencia a él.

--10- Intente modificar el registro con código 1, de "provincias".
--No se puede porque hay registros en "clientes" al cual hace referencia.

--11- Vea las restricciones de "clientes".
--aparece la restricción "foreign key".

--12- Vea las restricciones de "provincias".
--aparece la restricción "primary key" y nos informa que la tabla es rerenciada por una "foreign key" 
--de la tabla "clientes" llamada "FK_clientes_codigoprovincia".
