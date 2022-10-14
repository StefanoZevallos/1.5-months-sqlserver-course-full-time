/*if object_id('empleados') is not null
  drop table empleados;

create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20),
  fechaingreso datetime,
  fechanacimiento datetime,
  hijos tinyint,
  sueldo decimal(6,2)
);

go

-- Recuerde que las reglas son objetos independientes de las tablas (no se eliminan al 
-- borrar la tabla), así que debemos eliminarlas con las siguientes intrucciones:
if object_id ('RG_documento_patron') is not null
  drop rule RG_documento_patron;
if object_id ('RG_empleados_seccion') is not null
  drop rule RG_empleados_seccion;
if object_id ('RG_empleados_fechaingreso') is not null
  drop rule RG_empleados_fechaingreso;
if object_id ('RG_hijos') is not null
  drop rule RG_hijos;
if object_id ('RG_empleados_sueldo') is not null
  drop rule RG_empleados_sueldo;
if object_id ('RG_empleados_sueldo2') is not null
  drop rule RG_empleados_sueldo2;

go

insert into empleados 
   values('22222222','Ana Acosta','Contaduria','1990-10-10','1972-10-10',2,700);
insert into empleados 
   values('23333333','Carlos Costa','Contaduria','1990-12-10','1972-05-04',0,750);
insert into empleados 
   values('24444444','Daniel Duarte','Sistemas','1995-05-05','1975-10-06',1,880);
insert into empleados 
   values('25555555','Fabiola Fuentes','Secretaria','1998-02-11','1978-02-08',3,550);
insert into empleados 
   values('26666666','Gaston Garcia','Secretaria','1999-05-08','1981-01-01',3,670);
insert into empleados 
   values('27777777','Ines Irala','Gerencia','2000-04-10','1985-12-12',0,6000);

go

-- Creamos una regla que establezca un patrón para el documento:
create rule RG_documento_patron
   as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

go

-- Ejecutamos el procedimiento almacenado del sistema "sp_help" para 
-- ver si la regla creada anteriormente fue creada:
exec sp_help;

-- Ejecutamos el procedimiento almacenado del sistema "sp_helpconstraint" para ver si está asociada la regla
-- a algún campo de "empleados" (No aparece porque aún no la asociamos):
exec sp_helpconstraint empleados;

-- Si ingresamos un registro con un documento que no cumpla la regla, SQL Server lo acepta porque la regla
-- aún no está asociada al campo:
insert into empleados values('ab888888','Juan Juarez','Secretaria','2001-04-11','1986-11-12',0,600);

-- Asociamos la regla "RG_documento_patron" al campo "documento":
exec sp_bindrule RG_documento_patron, 'empleados.documento';

-- Volvemos a ejecutar "sp_helpconstraint" (aparece la regla):
exec sp_helpconstraint empleados;

go

-- Creamos una regla para restringir los valores que se pueden ingresar en un campo "seccion":
create rule RG_empleados_seccion
 as @seccion in ('Secretaria','Contaduria','Sistemas','Gerencia');

go

-- La asociamos al campo "seccion":
exec sp_bindrule RG_empleados_seccion, 'empleados.seccion';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en el campo "fechaingreso",
-- para que no sea posterior a la fecha actual:
create rule RG_empleados_fechaingreso
 as @fecha <= getdate();

go

-- Asociamos la regla anteriormente creada a los campos "fechaingreso" y "fechanacimiento":
exec sp_bindrule RG_empleados_fechaingreso, 'empleados.fechaingreso';
exec sp_bindrule RG_empleados_fechaingreso, 'empleados.fechanacimiento';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en el campo "hijos":
create rule RG_hijos
 as @hijos between 0 and 20;

go

-- La asociamos al campo "hijos":
exec sp_bindrule RG_hijos, 'empleados.hijos';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en un campo "sueldo":
create rule RG_empleados_sueldo
 as @sueldo>0 and @sueldo<= 5000;

go

-- La asociamos al campo "sueldo":
exec sp_bindrule RG_empleados_sueldo, 'empleados.sueldo';

go

-- Creamos otra regla para restringir los valores que se pueden ingresar en un campo "sueldo":
create rule RG_empleados_sueldo2
 as @sueldo>0 and @sueldo<= 7000;

go
 
-- La asociamos al campo "sueldo" (la nueva regla reeemplaza la asociación anterior):
exec sp_bindrule RG_empleados_sueldo2, 'empleados.sueldo';

insert into empleados values('29999999','Luis Lopez','Secretaria','2002-03-03','1990-09-09',0,6000);

exec sp_help;

exec sp_helpconstraint empleados;*/
--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Elimine las siguientes reglas:
 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron;
 if object_id ('RG_horallegada') is not null
   drop rule RG_horallegada;
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo;
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2;
 if object_id ('RG_menor_fechaactual') is not null
   drop rule RG_menor_fechaactual;

--3- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

--4- Ingrese algunos registros:
 insert into vehiculos values ('AAA111','a','1990-02-01 08:10',null);
 insert into vehiculos values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10');
 insert into vehiculos values ('BCD222','m','1990-02-01 12:00',null);
 insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null);

--5- Cree una regla para restringir los valores que se pueden ingresar en un campo "patente" (3 letras 
--seguidas de 3 dígitos):
	create rule RG_vehiculos_patente
		as @patente like '[A-Z][A-Z][A-Z][1-9][1-9][1-9]'
--6- Ejecute el procedimiento almacenado del sistema "sp_help" para ver que la regla creada 
--anteriormente existe:
exec sp_help
--7- Ejecute el procedimiento almacenado del sistema "sp_helpconstraint" para ver que la regla creada 
--anteriormente no está asociada aún a ningún campo de la tabla "vehiculos".
exec sp_helpconstraint vehiculos
--8-  Asocie la regla al campo "patente":
--Note que hay una patente que no cumple la regla, SQL Server NO controla los datos existentes, pero 
--si controla las inserciones y actualizaciones:
	exec sp_bindrule RG_vehiculos_patente , 'vehiculos.patente'
--9- Intente ingresar un registro con valor para el campo "patente" que no cumpla con la regla.
--aparece un mensaje de error indicando que hay conflicto con la regla y la inserción no se realiza.

--10- Cree otra regla que controle los valores para el campo "tipo" para que solamente puedan 
--ingresarse los caracteres "a" y "m".
	create rule RG_vehiculos_tipo
		as @tipo in ( 'a' , 'm')

--11- Asocie la regla al campo "tipo".
	exec sp_bindrule RG_vehiculos_tipo ,'vehiculos.tipo'
--12- Intente actualizar un registro cambiando el valor de "tipo" a un valor que no cumpla con la 
--regla anterior.
--No lo permite.

--13- Cree otra regla llamada "RG_vehiculos_tipo2" que controle los valores para el campo "tipo" para 
--que solamente puedan ingresarse los caracteres "a", "c" y "m".
	create rule RG_vehiculos_tipo2 
	as @tipo in ('a' , 'c', 'm')
--14- Si la asociamos a un campo que ya tiene asociada otra regla, la nueva regla reeemplaza la 
--asociación anterior. Asocie la regla creada en el punto anterior al campo "tipo".
			exec sp_bindrule RG_vehiculos_tipo2 , 'vehiculos.tipo'

--15- Actualice el registro que no pudo actualizar en el punto 12:
-- update vehiculos set tipo='c' where patente='AAA111';

--16- Cree una regla que permita fechas menores o iguales a la actual.
	create rule RG_vehiculos_fechas
	as @fechaentrada < getdate()

--17- Asocie la regla anterior a los campos "horallegada" y "horasalida":
-- exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada';
-- exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horasalida';
select * from vehiculos

--18- Ingrese un registro en el cual la hora de entrada sea posterior a la hora de salida:
-- insert into vehiculos values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

--19- Intente establecer una restricción "check" que asegure que la fecha y hora de llegada a la playa 
--no sea posterior a la fecha y hora de salida:
-- alter table vehiculos
-- add constraint CK_vehiculos_llegada_salida
-- check(horallegada<=horasalida);
--No lo permite porque hay un registro que no cumple la restricción.

--20- Elimine dicho registro:
-- delete from vehiculos where patente='NOP555';

--21- Establezca la restricción "check" que no pudo establecer en el punto 19:
-- alter table vehiculos
-- add constraint CK_vehiculos_llegada_salida
-- check(horallegada<=horasalida);

--22- Cree una restricción "default" que almacene el valor "b" en el campo "tipo:
-- alter table vehiculos
-- add constraint DF_vehiculos_tipo
-- default 'b'
-- for tipo;
--Note que esta restricción va contra la regla asociada al campo "tipo" que solamente permite los 
--valores "a", "c" y "m". SQL Server no informa el conflicto hasta que no intenta ingresar el valor 
--por defecto.

--23- Intente ingresar un registro con el valor por defecto para el campo "tipo":
-- insert into vehiculos values ('STU456',default,'1990-02-01 10:10','1990-02-01 15:30');
--No lo permite porque va contra la regla asociada al campo "tipo".

--24- Vea las reglas asociadas a "empleados" y las restricciones aplicadas a la misma tabla ejecutando 
--"sp_helpconstraint".
--Muestra 1 restricción "check", 1 restricción "default" y 4 reglas asociada