
--- EJERCICIO 1---

if object_id('agenda') is not null
  drop table agenda;
  create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );
 insert into agenda values( 'Alvarez','Alberto','Colon 123','4234567');
  insert into agenda values( 'Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda values( 'Lopez','Maria','Urquiza 333','4545454');
  insert into agenda values( 'Lopez','Jose','Urquiza 333','4545454');
  insert into agenda values( 'Salas','SusanaGral','Paz 1234','4123456');
  select * from agenda 
--Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)
delete from agenda 
where nombre = 'Juan';
select * from agenda;

--Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados):
delete from agenda
where telefono='4545454';
--Muestre la tabla.
select * from agenda;
--Elimine todos los registros (2 registros afectados):
delete from agenda;
--Muestre la tabla.
select * from agenda;