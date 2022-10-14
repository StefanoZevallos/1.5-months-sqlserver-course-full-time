 if object_id('peliculas') is not null
  drop table peliculas;
create table peliculas(
  codigo int identity (50,3),
  titulo varchar(40),
  actor varchar(20),
  duracion int
 );
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
  --4- Seleccione todos los registros y verifique la carga automática de los códigos:
  select * from peliculas
  --5- Setee la opción "identity_insert" en "on"
  set identity_insert peliculas on
  --6- Ingrese un registro con valor de código menor a 50.
  insert into peliculas (codigo , titulo,actor,duracion)
  values(40 , 'Mision imposible','Tom Cruise',120);
  --7- Ingrese un registro con valor de código mayor al último generado.
   insert into peliculas (codigo , titulo,actor,duracion)
  values(60 , 'Mision imposible','Tom Cruise',120);
  --8- Averigue el valor de inicio del campo "identity" de la tabla "peliculas".
  select ident_seed ('peliculas');
  --9- Averigue el valor de incremento del campo "identity" de "peliculas".
  select ident_incr ('peliculas')
  --10- Intente ingresar un registro sin valor para el campo código.
  --insert into peliculas (titulo,actor,duracion)
  --values('Mision imposible','Tom Cruise',120);
  --11- Desactive la opción se inserción para el campo de identidad.
  set identity_insert peliculas off
  --12- Ingrese un nuevo registro y muestre todos los registros para ver cómo SQL Server siguió la secuencia tomando el último valor del campo como referencia.
  insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
  select * from peliculas
