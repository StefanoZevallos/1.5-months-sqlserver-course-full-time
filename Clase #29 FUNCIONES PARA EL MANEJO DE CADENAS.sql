-- SUBSTRING
/*select substring ('Hola Mundo',6,5);
select substring ('STEFANO ZEVALLOS' , 8 , 9) 
select substring ('FRANCHESCA CARDENAS',0,11)
-- STR 
select str(700911.17,15,2)
select str(926802.518,10,3)
-- STUFF
-- LEN
select len('XAVIERSTEFANOZEVALLOSREYES') ;
select len('INGRIDNAYELIMONTAÑODONGO');
--CHAR
select char(2)
-- LEFT 
select left('ZEVALLOS',7)
-- RIGTH 
select right('SQLSERVER',6)
-- UPPER
select UPPER('phyton')
-- LOWER
select LOWER('FACEBOOK&INSTAGRAM')
-- LTRIM
select ltrim(' IDAT ')
-- RTRIM
select rtrim ('UNIVERSIDADTECNOLOGICADELPERU')
-- REPLACE
select replace ('zzz.facebook.com', 'z' , 'w')      
-- REVERSE
select REVERSE ('OESTRUENDOMUDO')
--PAT INDEX 
select PATINDEX( '%www%','Yo siempre entro a www.facebook.com')
select PATINDEX('%DRINK%' , 'ICE COLD DRINK')
--CHARINDEX
 select charindex('or','Jorge Luis Borges'); 
 select charindex('or', 'Jorge Luis Borges');
 --REPLICATE 
 select REPLICATE('PEDRO SUAREZ VERTIZ' , 5)
 --SPACE 
 select  'STEFANO' + space(2) + 'ZEVALLOS' */
 --EJERCICIOS--
 if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
  select * from libros 

-- Mostramos sólo los 12 primeros caracteres de los títulos de los libros y
-- sus autores, empleando la función "substring()":
select substring(titulo,1,12) as titulo,
		substring(autor,1,12) as autor
  from libros;

-- Mostramos sólo los 12 primeros caracteres de los títulos de los libros y
-- sus autores, ahora empleando la función "left()":
select left(titulo,12) as titulo,
		left(autor,12) as autor
  from libros;
-- Mostramos los títulos de los libros y sus precios convirtiendo este último a cadena
-- de caracteres con un solo decimal, empleando la función "str":
select titulo, 
str (precio,6,1) as 'Funcion str' 
from libros

-- Mostramos los títulos de los libros y sus precios convirtiendo este último a cadena
-- de caracteres especificando un solo argumento:
select titulo, 
str (precio) as 'Funcion str' 
from libros

-- Mostramos los títulos, autores y editoriales de todos libros, al último
-- campo lo queremos en mayúsculas:
	select titulo , autor ,	
	upper ( editorial ) as 'PASANDO A MAYUSCULAS' from libros