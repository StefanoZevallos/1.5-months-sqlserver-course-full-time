if object_id ('empleados') is not null
  drop table empleados;
if object_id ('RG_sueldo') is not null
   drop rule RG_sueldo;
if object_id ('RG_seccion_lista') is not null
   drop rule RG_seccion_lista;

create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
);

go

-- Creamos una regla para el campo "sueldo": 
create rule RG_sueldo
  as @sueldo between 100 and 1000;

go

-- Asociamos la regla creada anteriormente al campo "sueldo":
exec sp_unbindrule RG_sueldo, 'empleados.sueldo';

go

-- Creamos una regla con una lista de valores para "seccion":
create rule RG_seccion_lista
 as @seccion in ('Sistemas','Secretaria','Contaduria');

go

exec sp_help RG_sueldo;

exec sp_helpconstraint empleados;

exec sp_bindrule RG_seccion_lista, 'empleados.seccion';

exec sp_helpconstraint empleados;

exec sp_helptext "RG_seccion_lista";

-- Deshacemos la asociación de la regla "RG_sueldo" y la eliminamos:
exec sp_unbindrule 'empleados.sueldo'; 
drop rule RG_sueldo;

exec sp_help RG_sueldo;

select * from sysobjects
  where xtype='R' and
  name like '%seccion%';