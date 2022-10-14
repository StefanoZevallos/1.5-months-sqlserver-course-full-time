/*-- GETDATE
select getdate ()
--DATEPART
select datepart (YEAR , getdate())
select datepart (MONTH , getdate())
select datepart (DAY , getdate())
--DATENAME
select DATENAME ( YEAR , '2022.06.02')
select DATENAME ( Month , getdate())
select DATENAME ( DAY , getdate())
--DATEADD
select dateadd(day,5,getdate())
--DATEDIFF
Select DATEDIFF (YEAR , '2020.06.02' , '2022.06.02')
Select DATEDIFF (month , '2020.06.02' , '2022.06.02') 
Select DATEDIFF (day , '2020.06.02' , '2022.06.02') 
--DAY 
select day(getdate())
--MONTH 
select month (getdate())
--YEAR 
select year(getdate())*/

-- ### EJERCICIOS ### --

if object_id ('libros') is not null
  drop table libros;

create table libros(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion datetime,
  precio decimal(6,2)
);

go

set dateformat ymd;

insert into libros 
  values('El aleph','Borges','Emece','1980/10/10',25.33);
insert into libros 
  values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
insert into libros 
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
insert into libros 
  values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);
  select * from libros

-- Mostramos el t�tulo del libro y el a�o de edici�n:
select titulo , edicion , 
year(edicion) as 'A�o de edicion' 
from libros 

-- Mostramos el t�tulo del libro y el nombre del mes de edici�n:

select titulo , edicion , 
datename(month ,edicion) as 'Mes de edicion' 
from libros 

-- Mostramos el t�tulo del libro y los a�os que tienen de editados:

select titulo , edicion , 
DATEDIFF(year , edicion , getdate()) as 'A�os de edicion'
from libros

-- Muestre los t�tulos de los libros que se editaron el d�a 9, de cualquier mes de cualquier a�o:
select titulo from libros 
	where day(edicion)=9