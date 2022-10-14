--if object_id('visitantes') is not null
--  drop table visitantes;

--create table visitantes(
--  nombre varchar(30),
--  sexo char(1),
--  ciudad varchar(20)
--);

--go 

--insert into visitantes values('Susana Molina', 'f', 'Cordoba');
--insert into visitantes values('Marcela Mercado', 'f','Cordoba');
--insert into visitantes values('Roberto Perez','f',null);
--insert into visitantes values('Alberto Garcia','m','Cordoba');
--insert into visitantes values('Teresa Garcia','f','Alta Gracia');

---- Contamos la cantidad de visitantes agrupando por ciudad y empleando "rollup":
	
--	select * from visitantes
--select ciudad,
--	count(*) from visitantes 
--	group by ciudad 
--		with rollup
---- Contamos la cantidad de visitantes agrupando por ciudad y empleando "rollup"
---- empleando grouping:
	
--	select * from visitantes
--select ciudad,
--	count(*) as 'cantidad',
--	grouping (ciudad) as 'resumen' 
--	from visitantes 
--	group by ciudad 
--		with rollup;

--#### EJERCICIO #### --
--Una empresa tiene registrados sus empleados en una tabla llamada "empleados".
--1- Elimine la tabla si existe:

 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20),
  primary key (documento)
 );
 GO
--3- Ingrese algunos registros:
 insert into empleados
  values ('22222222','Alberto Lopez','m','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','f','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','m','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','m','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez',null,'c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres',null,'s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez','f',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia','m',null,'Administracion');

--4- Cuente la cantidad de empleados agrupados por sexo y estado civil, empleando "rollup".
--Es dificil distinguir los valores de detalle y resumen.

select * from empleados
select sexo , estadocivil , 
	count(*) from empleados 
	group by sexo , estadocivil
	with rollup

--5- Realice la misma consulta anterior pero emplee la función "grouping" para los dos campos por los 
--que se agrupa para distinguir los valores de resumen y de detalle.
--Note que las columnas de resumen contienen 1 y las de detalle 0.

select * from empleados
select sexo , estadocivil , 
	count(*),
	grouping(sexo) as 'resumen sexo',
	grouping(estadocivil) as 'resumen estadocivil'
	 from empleados 
	group by sexo , estadocivil
	with rollup
--6- Realice la misma consulta anterior pero con "cube" en lugar de "rollup", distinguiendo los 
--valores de resumen y de detalle.
--Note que las columnas de resumen contienen 1 y las de detalle 0.
select * from empleados
select sexo , estadocivil , 
	count(*),
	grouping(sexo) as 'resumen sexo',
	grouping(estadocivil) as 'resumen estadocivil'
	 from empleados 
	group by sexo , estadocivil
	with CUBE