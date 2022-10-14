if object_id('libros') is not null
  drop table libros;

create table libros(
  titulo varchar(30),
  autor varchar(25),
  editorial varchar(20),
  precio decimal(5,2)
);

go

insert into libros values('Uno','Bach Richard','Planeta',15);
insert into libros values('El aleph','Borges J. L.','Emece',25);
insert into libros values('Matematica estas ahi','Paenza Adrian','Siglo XXI',15);
insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',35);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',35);

-- Declare una variable llamada "@valor" de tipo "int" y vea su contenido:
declare @valor int
select @valor;

-- Declare una variable llamada "@nombre" de tipo "varchar(20)", 
-- asígnele un valor y vea su contenido:
	declare @nombre varchar(20)
	set @nombre='Juan';
	select @nombre;

-- Queremos saber todos los datos de los libros con mayor precio de la tabla "libros".
-- Declare una variable de tipo decimal, busque el precio más alto de "libros"
-- y almacénelo en una variable, 
-- luego utilice dicha variable para mostrar todos los datos del libro:
--declare @mayorprecio  decimal(5,2)
--select @mayorprecio=max(precio) from libros
--select * from libros where precio=@mayorprecio;
-- EJERCICIOS --
--1- Elimine las tablas, si existen:
 if object_id('alumnos') is not null
  drop table alumnos;
 if object_id('notas') is not null
  drop table notas;

--2- Créelas con los campos necesarios. Agregue una restricción "primary key" para el campo 
--"documento" y una restricción "foreign key" para que en la tabla "notas" el documento del alumno 
--haga referencia al documento de la tabla "alumnos":
 create table alumnos(
  documento char(8) not null
   constraint CK_alumnos_documento check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  nombre varchar(30),
  constraint PK_alumnos
  primary key(documento)
 );

 create table notas(
  documento char(8) not null,
  nota decimal(4,2)
   constraint CK_notas_nota check (nota between 0 and 10),
  constraint FK_notas_documento
  foreign key(documento)
  references alumnos(documento)
  on update cascade
 );
 go
--3- Ingrese algunos registros:
 insert into alumnos values('30111111','Ana Algarbe');
 insert into alumnos values('30222222','Bernardo Bustamante');
 insert into alumnos values('30333333','Carolina Conte');
 insert into alumnos values('30444444','Diana Dominguez');
 insert into alumnos values('30555555','Fabian Fuentes');
 insert into alumnos values('30666666','Gaston Gonzalez');

 insert into notas values('30111111',5.1);
 insert into notas values('30222222',7.8);
 insert into notas values('30333333',4);
 insert into notas values('30444444',2.5);
 insert into notas values('30666666',9.9);
 insert into notas values('30111111',7.3);
 insert into notas values('30222222',8.9);
 insert into notas values('30444444',6);
 insert into notas values('30666666',8);

--4- Declare una variable llamada "@documento" de tipo "char(8)" y vea su contenido:
	declare @documento char(8) 
	select @documento
--5- Intente usar la variable "@documento" para almacenar el documento del alumno con la nota más alta:

select @documento= documento from notas
  where nota=(select max(nota) from notas);

--No se puede porque la variable fue declarada en otro lote de sentencias y no es reconocida.

--6- Declare una variable llamada "@documento" de tipo "char(8)" y almacene en ella el documento del 
--alumno con la nota más alta, luego recupere el nombre del alumno:
	
	declare @documento char(8) = max(nota) from notas
		select @documento	
		----
		 declare @documento char(8)
		select @documento= documento from notas
		where nota=(select max(nota) from notas)
		select nombre from alumnos where documento=@documento;
	
			