/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio float
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',23);

select * from libros;

insert into libros (titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',18);
insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Siglo XXI',45.60);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de maravillas','Lewis Carroll','Paidos',15.50);

select * from libros;

-- Intentemos ingresar un valor para el campo "codigo" (genera error):
--insert into libros (codigo,titulo,autor,editorial,precio)
  --values(5,'Martin Fierro','Jose Hernandez','Paidos',25);--

-- Intentemos cambiar el valor de código de un registro (genera error):
--update libros set codigo=9
  --where titulo='Uno';--

exec sp_columns libros;

-- Eliminemos el último registro:
delete from libros
  where autor='Lewis Carroll';

-- Ingresamos un quinto registro
insert into libros (titulo, autor, editorial, precio)
  values('Martin Fierro','Jose Hernandez','Paidos',25); 

--  El campo código se guardó el valor secuencial sin considerar que el valor "4" ya no existe:
select * from libros;*/

/*############### Ejercicio Identity ##############*/

if object_id('medicamentos') is not null
  drop table medicamentos;
create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );
 go
 exec sp_columns medicamentos;
insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);
select * from medicamentos;
--Intente ingresar un registro con un valor para el campo "codigo"--

/*insert into medicamentos (codigo ,nombre, laboratorio,precio,cantidad)
   --values(1,'Sertal','Roche',5.2,100);--(SALE ERROR) */

--Intente actualizar un valor de código (aparece un mensaje de error)--
/*update medicamentos set codigo=4
 where cantidad=100 SALE ERROR*/
 
-- Elimine el registro con codigo "3" (1 registro eliminado)--
delete from medicamentos 
where codigo=3
select * from medicamentos
--Ingrese un nuevo registro:--
insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 345','Pfizer',15.60,100);

--Seleccione todos los registros para ver qué valor guardó SQL Server en el campo código:--
 select * from medicamentos