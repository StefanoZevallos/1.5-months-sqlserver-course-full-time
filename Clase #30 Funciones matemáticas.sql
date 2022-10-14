/*-- ABS
select abs(-20) ;
select abs(-26) ;
select abs(-30) ;
-- CEILING
select ceiling (20.5)
select ceiling (2.7)
select ceiling (3.1)
select ceiling (1.2)
-- FLOOR 
select floor (40.5)
select floor (54.9)
--%%%
select 8%2 ;
select 45%2 ;
--POWER
select power (3,2);
select power (5,2);
select power (2,2);
-- ROUND
select round (105.45,-1)
--SIGN
select sign (564)
-- SQUARE 
select SQUARE (5)
-- SQRT 
select sqrt (25)*/
-- ### EJERCICIOS ### --
if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25.33);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
  select * from libros 

-- Vamos a mostrar los precios de los libros redondeando el valor hacia abajo y hacia arriba:
	select * , 
	ceiling (precio) as 'Arriba',
	floor (precio) as 'Abajo'
	from libros