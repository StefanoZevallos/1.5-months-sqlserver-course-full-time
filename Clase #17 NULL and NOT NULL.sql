if OBJECT_ID('medicamentos') is not null
	drop table medicamentos 

	create table medicamentos(
  codigo integer not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer not null
 );
 --Visualice la estructura de la tabla "medicamentos":--
 exec sp_columns medicamentos 
  insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);
 select * from medicamentos;
--Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio:--
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas','',0,100); 
  select * from medicamentos
--Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre:--
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(0,'','inkafarma',0,0); 
    select * from medicamentos
--Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que tengan una cadena vacía en el mismo campo. Note que el resultado es diferente.--
select * from medicamentos 
	where laboratorio is null 
select * from medicamentos 
	where laboratorio=''
--recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el valor 0 en el mismo campo. Note que el resultado es distinto.--
select * from medicamentos 
	where precio is null 
select * from medicamentos 
	where precio=0
--Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean distintos de "null".--
select * from medicamentos 
	where laboratorio is not null; 
select * from medicamentos 
	where laboratorio <> '';