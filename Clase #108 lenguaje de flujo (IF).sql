if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key (codigo)
);

go

insert into libros values('Uno','Richard Bach','Planeta',15,100);
insert into libros values('El aleph','Borges','Emece',20,150);
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',50,200);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,0);
insert into libros values('Java en 10 minutos','Mario Molina','Emece',40,200);

-- Mostramos los títulos de los cuales no hay libros disponibles (cantidad=0); 
-- en caso que no haya, mostramos un mensaje:
select * from libros
--
if exists (select * from libros where cantidad=0)
  (select titulo from libros where cantidad=0)
else
  select 'No hay libros sin stock';

-- Hacemos un descuento del 10% a todos los libros de editorial "Emece";
-- si no hay, mostramos un mensaje:
if exists (select * from libros where editorial='Emece')
begin
  update libros set precio=precio-(precio*0.1) where editorial='Emece'
  select 'libros actualizados'
end
else
  select 'no hay registros actualizados';

-- Veamos si se actualizaron:
select * from libros where editorial='Emece';

-- Eliminamos los libros de los cuales no hay stock (cantidad=0); 
-- si no hay, mostramos un mensaje:
if exists (select * from libros where cantidad=0)
  delete from libros where cantidad=0
else
  select 'No hay registros eliminados';

-- Ejecutamos nuevamente la sentencia anterior (Ahora se ejecuta la sentencia
-- del "else" porque no hay registros que cumplieran la condición.):
if exists (select * from libros where cantidad=0)
  delete from libros where cantidad=0
 else
  select 'No hay registros eliminados';

select titulo,costo=iif(precio<38,'barato','caro') from libros;