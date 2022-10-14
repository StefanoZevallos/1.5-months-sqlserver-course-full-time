/*if object_id('vehiculos') is not null
  drop table vehiculos;

create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime,
  horasalida datetime,
  primary key(patente,horallegada)
);

go

insert into vehiculos values('AIC124','a','8:05','12:30');
insert into vehiculos values('CAA258','a','8:05',null);
insert into vehiculos values('DSE367','m','8:30','18:00');
insert into vehiculos values('FGT458','a','9:00',null);
insert into vehiculos values('AIC124','a','16:00',null);
insert into vehiculos values('LOI587','m','18:05','19:55');

-- Si intentamos ingresar un registro con clave primaria repetida:
insert into vehiculos values('LOI587','m','18:05',null);

-- Si ingresamos un registro repitiendo el valor de uno de los campos
-- que forman parte de la clave, si lo acepta:
insert into vehiculos values('LOI587','m','21:30',null);

-- Si intentamos actualizar un registro repitiendo la clave primaria
-- (se genera un error):
update vehiculos set horallegada='8:05'
  where patente='AIC124' and horallegada='16:00';

-- Recordemos que los campos que forman parte de la clave primaria no 
-- aceptan valores nulos, aunque no se haya aclarado en la definición 
-- de la tabla (genera un error):
insert into vehiculos values('HUO690','m',null,null);

-- mostramos la estructura de la tabla 
-- (los campos que forman parte de la clave primaria (patente y horallegada)
--  tienen "NO" en la columna "IS_NULLABLE", es decir, no admiten valores nulos.):
exec sp_columns vehiculos*/

---- ##### EJERCICIOS ##### --
--Un consultorio médico en el cual trabajan 3 médicos registra las consultas de los pacientes en una 
--tabla llamada "consultas".
--1- Elimine la tabla si existe:
 /*if object_id('consultas') is not null
  drop table consultas;

--2- La tabla contiene los siguientes datos:
 --  fechayhora: datetime not null, fecha y hora de la consulta,
 -- -medico: varchar(30), not null, nombre del médico (Perez,Lopez,Duarte),
 -- - documento: char(8) not null, documento del paciente,
 -- - paciente: varchar(30), nombre del paciente,
 -- - obrasocial: varchar(30), nombre de la obra social (IPAM,PAMI, etc.).
 --);

--3- Un médico sólo puede atender a un paciente en una fecha y hora determianada. En una fecha y hora 
--determinada, varios médicos atienden a distintos pacientes. Cree la tabla definiendo una clave 
--primaria compuesta:
 create table consultas(
  fechayhora datetime not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 );
 go
  set dateformat dmy
--4- Ingrese varias consultas para un mismo médico en distintas horas el mismo día.
insert into consultas values ( '01/01/2020' , 'Stefano Zevallos' , '70091117' , 'Marianita' , 'obrasocial' )
insert into consultas values ( '01/01/2020' , 'jordan' , '41177550' , 'Marianita' , 'obrasocial' )
insert into consultas values ( '01/01/2020' , 'kito' , '70091117' , 'Maria' , 'obkhrasocial' )
select * from consultas

--5- Ingrese varias consultas para diferentes médicos en la misma fecha y hora.
--insert into consultas values ( '01/01/2020' , 'Stefano Zevallos' , '70091117' , 'Marianita' , 'obrasocial' )
--insert into consultas values ( '01/01/2020' , 'jordan' , '41177550' , 'Marianita' , 'obrasocial' )
--insert into consultas values ( '01/01/2020' , 'kito' , '70091117' , 'Maria' , 'obkhrasocial' )
--6- Intente ingresar una consulta para un mismo médico en la misma hora el mismo día.
insert into consultas values ( '01/01/2020' , 'Stefano Zevallos' , '70091117' , 'Marianita' , 'obrasocial' )
insert into consultas values ( '01/01/2020' , 'Stefano Zevallos' , '41177550' , 'Marianita' , 'obrasocial' )
insert into consultas values ( '01/01/2020' , 'kito' , '70091117' , 'Maria' , 'obkhrasocial' )*/
-- PROBLEMA 2 --
--Un club dicta clases de distintos deportes. En una tabla llamada "inscriptos" almacena la 
--información necesaria.
--1- Elimine la tabla "inscriptos" si existe:
 if object_id('inscriptos') is not null
  drop table inscriptos;

--2- La tabla contiene los siguientes campos:
-- - documento del socio alumno: char(8) not null
-- - nombre del socio: varchar(30),
-- - nombre del deporte (tenis, futbol, natación, basquet): varchar(15) not null,
-- - año de inscripcion: datetime,
-- - matrícula: si la matrícula ha sido o no pagada ('s' o 'n').

--3- Necesitamos una clave primaria que identifique cada registro. Un socio puede inscribirse en 
--varios deportes en distintos años. Un socio no puede inscribirse en el mismo deporte el mismo año. 
--Varios socios se inscriben en un mismo deporte en distintos años. Cree la tabla con una clave 

 create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  año datetime,
  matricula char(1),
  primary key(documento,deporte,año)
 );

--4- Inscriba a varios alumnos en el mismo deporte en el mismo año:
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s');
 insert into inscriptos
  values ('23333333','Marta Garcia','tenis','2005','s');
 insert into inscriptos
  values ('34444444','Luis Perez','tenis','2005','n');

--5- Inscriba a un mismo alumno en varios deportes en el mismo año:
 insert into inscriptos
  values ('12222222','Juan Perez','futbol','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','natacion','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','basquet','2005','n');

--6- Ingrese un registro con el mismo documento de socio en el mismo deporte en distintos años:
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2006','s');
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2007','s');

--7- Intente inscribir a un socio alumno en un deporte en el cual ya esté inscripto en un año en el 
--cual ya se haya inscripto.

--8- Intente actualizar un registro para que la clave primaria se repita.

