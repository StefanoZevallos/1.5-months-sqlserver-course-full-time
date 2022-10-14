-- Trabajamos con la tabla "libros" de una librería.
-- Eliminamos la tabla si existe y la creamos nuevamente:
if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo) 
);

go

insert into libros values ('Uno','Richard Bach','Planeta',15);
insert into libros values ('Ilusiones','Richard Bach','Planeta',12);
insert into libros values ('El aleph','Borges','Emece',25);
insert into libros values ('Aprenda PHP','Mario Molina','Nuevo siglo',50);
insert into libros values ('Matematica estas ahi','Paenza','Nuevo siglo',18);
insert into libros values ('Puente al infinito','Bach Richard','Sudamericana',14);
insert into libros values ('Antología','J. L. Borges','Paidos',24);
insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
insert into libros values ('Cervantes y el quijote','Borges- Casares','Planeta',34);

-- Eliminamos el procedimiento almacenado "pa_libros_autor" si existe:
if object_id('pa_libros_autor') is not null
  drop procedure pa_libros_autor;

go

-- Creamos el procedimiento para que reciba el nombre de un autor y 
-- muestre todos los libros del autor solicitado:
create procedure pa_libros_autor
  @autor varchar(30) 
 as
  select titulo, editorial,precio
   from libros
   where autor= @autor;

go
--
select * from libros
--
-- Ejecutamos el procedimiento:
exec pa_libros_autor 'Richard Bach';

-- Empleamos la otra sintaxis (por nombre) y pasamos otro valor:
exec pa_libros_autor @autor='Borges';

-- Eliminamos, si existe, el procedimiento "pa_libros_autor_editorial":
if object_id('pa_libros_autor_editorial') is not null
  drop procedure pa_libros_autor_editorial;

go

-- Creamos un procedimiento "pa_libros_autor_editorial" que recibe 2 parámetros,
-- el nombre de un autor y el de una editorial:
create procedure pa_libros_autor_editorial
  @autor varchar(30),
  @editorial varchar(20) 
 as
  select titulo, precio
   from libros
   where autor= @autor and
   editorial=@editorial;

go

-- Ejecutamos el procedimiento enviando los parámetros por posición:
exec pa_libros_autor_editorial 'Richard Bach','Planeta';

-- Ejecutamos el procedimiento enviando otros valores y lo hacemos por nombre 
--(Si ejecutamos el procedimiento omitiendo los parámetros, aparecerá un mensaje de error.):
exec pa_libros_autor_editorial @autor='Borges',@editorial='Emece';

-- Eliminamos, si existe, el procedimiento "pa_libros_autor_editorial2":
if object_id('pa_libros_autor_editorial2') is not null
  drop procedure pa_libros_autor_editorial2;

go

-- Creamos el procedimiento almacenado "pa_libros_autor_editorial2" que recibe los mismos
-- parámetros, esta vez definimos valores por defecto para cada parámetro:
create procedure pa_libros_autor_editorial2
  @autor varchar(30)='Richard Bach',
  @editorial varchar(20)='Planeta' 
 as
  select titulo,autor,editorial,precio
   from libros
   where autor= @autor and
   editorial=@editorial;

go

-- Ejecutamos el procedimiento anterior sin enviarle valores para verificar que usa 
-- los valores por defecto (Muestra los libros de "Richard Bach" y editorial
-- "Planeta" (valores por defecto)):
exec pa_libros_autor_editorial2;

-- Enviamos un solo parámetro al procedimiento (SQL Server asume que es el primero,
-- y no hay registros cuyo autor sea "Planeta"):
exec pa_libros_autor_editorial2 'Planeta';

-- Especificamos el segundo parámetro, enviando parámetros por nombre:
exec pa_libros_autor_editorial2 @editorial='Planeta';

-- Ejecutamos el procedimiento enviando parámetros por nombre en distinto orden:
exec pa_libros_autor_editorial2 @editorial='Nuevo siglo',@autor='Paenza';

-- Definimos un procedimiento empleando patrones de búsqueda 
-- (antes verificamos si existe para eliminarlo):
if object_id('pa_libros_autor_editorial3') is not null
  drop procedure pa_libros_autor_editorial3;

go
 
 create proc pa_libros_autor_editorial3
  @autor varchar(30) = '%',
  @editorial varchar(30) = '%'
 as 
  select titulo,autor,editorial,precio
   from libros
   where autor like @autor and
   editorial like @editorial;

go

-- Ejecutamos el procedimiento enviando parámetro por posición, asume que es el primero:
exec pa_libros_autor_editorial3 'P%';

-- Ejecutamos el procedimiento especificando que el valor corresponde al segundo parámetro:
exec pa_libros_autor_editorial3 @editorial='P%';

-- La sentencia siguiente muestra lo mismo que la anterior:
exec pa_libros_autor_editorial3 default, 'P%';