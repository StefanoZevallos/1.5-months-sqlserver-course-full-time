if object_id('empleados') is not null
  drop table empleados;
if object_id('secciones') is not null
  drop table secciones;

create table secciones(
  codigo tinyint identity,
  nombre varchar(20),
  sueldo decimal(5,2)
   constraint CK_secciones_sueldo check (sueldo>=0),
  constraint PK_secciones primary key (codigo)
);

create table empleados(
  legajo int identity,
  documento char(8)
   constraint CK_empleados_documento check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  sexo char(1)
   constraint CK_empleados_sexo check (sexo in ('f','m')),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  seccion tinyint not null,
  cantidadhijos tinyint
   constraint CK_empleados_hijos check (cantidadhijos>=0),
  estadocivil char(10)
   constraint CK_empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  fechaingreso datetime,
   constraint PK_empleados primary key (legajo),
  sueldo decimal(6,2),
  constraint FK_empleados_seccion
   foreign key (seccion)
   references secciones(codigo)
   on update cascade,
  constraint UQ_empleados_documento
   unique(documento)
);

go

insert into secciones values('Administracion',300);
insert into secciones values('Contaduría',400);
insert into secciones values('Sistemas',500);

insert into empleados values('22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10',600);
insert into empleados values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10',650);
insert into empleados values('24444444', 'm', 'Garcia', 'Marcos', 'Sarmiento 1234', 2, 3, 'divorciado', '1998-07-12',800);
insert into empleados values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09',900);
insert into empleados values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09',700);

if object_id('vista_empleados') is not null
  drop view vista_empleados;

go

-- Creamos la vista "vista_empleados", que es resultado de una combinación en la cual se muestran 5 campos:
create view vista_empleados as
  select (apellido+' '+e.nombre) as nombre,sexo,
   s.nombre as seccion, cantidadhijos
   from empleados as e
   join secciones as s
   on codigo=seccion;

go

select * from vista_empleados;

if object_id('vista_empleados2') is not null
  drop view vista_empleados2;

go

-- Creamos otra vista de "empleados" denominada "vista_empleados2" 
-- que consulta solamente la tabla "empleados" con "with check option":
create view vista_empleados2
  as
  select nombre, apellido,fechaingreso,seccion,estadocivil,sueldo
   from empleados
  where sueldo>=600
  with check option;

go

-- Consultamos la vista:
 select * from vista_empleados2;

-- Ingresamos un registro en la vista "vista_empleados2":
insert into vista_empleados values('Pedro','Perez','2000-10-10',1,'casado',800);
-- No es posible insertar un registro en la vista "vista_empleados2" porque el campo de la vista "nombre" es un campo calculado.

-- Actualizamos la sección de un registro de la vista "vista_empleados":
 update vista_empleados set seccion='Sistemas' where nombre='Lopez Ana';

-- Si intentamos actualizar el nombre de un empleado no lo permite porque es una columna calculada.
-- Actualizamos el nombre de un registro de la vista "vista_empleados2":
 update vista_empleados set nombre='Beatriz' where nombre='Ana';

-- Verifique que se actualizó la tabla:
 select * from empleados;

-- Eliminamos un registro de la vista "vista_empleados2":
 delete from vista_empleados2 where apellido='Lopez';

-- Si podemos eliminar registros de la vista "vista_empleados2" dicha vista solamente consulta una tabla. 
-- No podemos eliminar registros de la vista "vista_empleados" porque hay varias tablas en su definición.