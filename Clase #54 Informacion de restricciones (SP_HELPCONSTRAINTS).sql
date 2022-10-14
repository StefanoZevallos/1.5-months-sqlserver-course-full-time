if object_id('alumnos') is not null
  drop table alumnos;

create table alumnos(
  legajo char(4) not null,
  apellido varchar(20),
  nombre varchar(20),
  documento char(8),
  domicilio varchar(30),
  ciudad varchar(30),
  notafinal decimal(4,2)
);

go

-- Agregamos una restricción "primary" para el campo "legajo":
alter table alumnos
 add constraint PK_alumnos_legajo
 primary key(legajo);

-- Agregamos una restricción "unique" para el campo "documento"
alter table alumnos
 add constraint UQ_alumnos_documento
 unique (documento);

-- Agregamos una restricción "check" para que el campo "notafinal" 
-- admita solamente valores entre 0 y 10:
alter table alumnos
 add constraint CK_alumnos_nota
 check (notafinal>=0 and notafinal<=10);

-- Agregamos una restricción "default" para el campo "ciudad":
alter table alumnos
 add constraint DF_alumnos_ciudad
 default 'Cordoba'
 for ciudad;

 -- Veamos las restricciones:
exec sp_helpconstraint alumnos;

-- Deshabilitamos la restricción "check":
	alter table alumnos
		check constraint CK_alumnos_nota

 -- Veamos las restricciones:
exec sp_helpconstraint alumnos;