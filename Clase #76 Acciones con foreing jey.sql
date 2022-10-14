--if object_id('libros') is not null
--  drop table libros;
--if object_id('editoriales') is not null
--  drop table editoriales;

--create table libros(
--  codigo int not null,
--  titulo varchar(40),
--  autor varchar(30),
--  codigoeditorial tinyint,
--  primary key (codigo)
--);
--create table editoriales(
--  codigo tinyint not null,
--  nombre varchar(20),
--  primary key (codigo)
--);

--go

--insert into editoriales values(1,'Emece');
--insert into editoriales values(2,'Planeta');
--insert into editoriales values(3,'Siglo XXI');

--insert into libros values(1,'El aleph','Borges',1);
--insert into libros values(2,'Martin Fierro','Jose Hernandez',2);
--insert into libros values(3,'Aprenda PHP','Mario Molina',2);

---- Establecemos una restricción "foreign key" para evitar que se ingrese en "libros"
---- un código de editorial inexistente en "editoriales" con la opción "on cascade" 
---- para actualizaciones y eliminaciones:
--	alter table libros
--	 add constraint FK_libros_codigoeditorial
--	  foreign key (codigoeditorial)
--	  references editoriales(codigo)
--	  on update cascade
--	  on delete cascade;

---- Si actualizamos un valor de código de "editoriales", la modificación se extiende a 
---- todos los registros de la tabla "libros" que hacen referencia a ella en "codigoeditorial":
--update editoriales set codigo=10 where codigo=1;
 
--select titulo, autor, e.codigo,nombre
--  from libros as l
--  join editoriales as e
--  on codigoeditorial=e.codigo;

---- Si eliminamos una editorial, se borra tal editorial de "editoriales" 
---- y todos los registros de "libros" de dicha editorial:
--delete from editoriales where codigo=2;

--select * from libros;
--select * from editoriales;
-- EJERCICIOS --
--1- Elimine las tablas "clientes" y "provincias", si existen:
-- if object_id('clientes') is not null
--  drop table clientes;
-- if object_id('provincias') is not null
--  drop table provincias;

----2- Créelas con las siguientes estructuras:
-- create table clientes (
--  codigo int identity,
--  nombre varchar(30),
--  domicilio varchar(30),
--  ciudad varchar(20),
--  codigoprovincia tinyint,
--  primary key(codigo)
-- );

-- create table provincias(
--  codigo tinyint,
--  nombre varchar(20),
--  primary key (codigo)
-- );
-- GO
----3- Ingrese algunos registros para ambas tablas:
-- insert into provincias values(1,'Cordoba');
-- insert into provincias values(2,'Santa Fe');
-- insert into provincias values(3,'Misiones');
-- insert into provincias values(4,'Rio Negro');

-- insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
-- insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
-- insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);

----4- Establezca una restricción "foreign key" especificando la acción "en cascade" para 
----actualizaciones y "no action" para eliminaciones.}
--	select * from clientes
--	select * from provincias
--	alter table clientes 
--		add constraint FK_clientes_codigoprovincia
--			foreign key (codigoprovincia)
--				references provincias(codigo)
--			on update cascade  
--			on delete no action

----5- Intente eliminar el registro con código 3, de "provincias".
----No se puede porque hay registros en "clientes" al cual hace referencia y la opción para 
----eliminaciones se estableció como "no action".}

--	delete from provincias where codigo = 3

----6- Modifique el registro con código 3, de "provincias".

--	select * from clientes
--	select * from provincias
--	update provincias set codigo = 8 where codigo =3 

----7- Verifique que el cambio se realizó en cascada, es decir, que se modificó en la tabla "provincias" 
----y en "clientes":
-- select * from provincias;
-- select * from clientes;

----8- Intente modificar la restricción "foreign key" para que permita eliminación en cascada.
----Mensaje de error, no se pueden modificar las restricciones.
--alter table clientes 
--		add constraint FK_clientes_codigoprovincia
--			foreign key (codigoprovincia)
--				references provincias(codigo)
--			on update cascade  
--			on delete cascade

----9- Intente eliminar la tabla "provincias".
----No se puede eliminar porque una restricción "foreign key" hace referencia a ella.
--delete from provincias
-- EJERCICIOS -- 
--1- Elimine las tablas si existen:
 if object_id('inscripciones') is not null
  drop table inscripciones;
 if object_id('deportes') is not null
  drop table deportes;
 if object_id('socios') is not null
  drop table socios;

--2- Cree las tablas:
 create table deportes(
  codigo tinyint,
  nombre varchar(20),
  primary key(codigo)
 );

 create table socios(
  documento char(8),
  nombre varchar(30),
  primary key(documento)
 );

 create table inscripciones(
  documento char(8), 
  codigodeporte tinyint,
  matricula char(1),-- 's' si está paga, 'n' si no está paga
  primary key(documento,codigodeporte)
 );

--3- Establezca una restricción "foreign key" para "inscripciones" que haga referencia al campo 
--"codigo" de "deportes" que permita la actualización en cascada:
 

 select * from socios
 select * from inscripciones
 select * from deportes
 --
	alter table inscripciones
		add constraint FK_inscriptos_codigodeporte
			foreign key (codigodeporte)
				references deportes(codigo)
					on update cascade

--4- Establezca una restricción "foreign key" para "inscripciones" que haga referencia al campo 
--"documento" de "socios" que permita la eliminación en cascada (Recuerde que se pueden establecer 
--varias retricciones "foreign key" a una tabla):
select * from socios
 select * from inscripciones
 select * from deportes

 alter table inscripciones
		add constraint FK_socios_documento
			foreign key (documento)
				references socios(documento)
					on delete cascade
--5- Ingrese algunos registros en las tablas:
 insert into deportes values(1,'basquet');
 insert into deportes values(2,'futbol');
 insert into deportes values(3,'natacion');
 insert into deportes values(4,'tenis');

 insert into socios values('30000111','Juan Lopez');
 insert into socios values('31111222','Ana Garcia');
 insert into socios values('32222333','Mario Molina');
 insert into socios values('33333444','Julieta Herrero');

 insert into inscripciones values ('30000111',1,'s');
 insert into inscripciones values ('30000111',2,'s');
 insert into inscripciones values ('31111222',1,'s');
 insert into inscripciones values ('32222333',3,'n');

--6- Intente ingresar una inscripción con un código de deporte inexistente:
insert into inscripciones values('30000111',6,'s');
--
	select * from socios
	select * from inscripciones
	select * from deportes

--
--Mensaje de error.

--7- Intente ingresar una inscripción con un documento inexistente en "socios":
 insert into inscripciones values('40111222',1,'s');
--Mensaje de error.

--8- Elimine un registro de "deportes" que no tenga inscriptos:

delete from deportes where codigo = 4

--Se elimina porque no hay inscriptos en dicho deporte.

--9- Intente eliminar un deporte para los cuales haya inscriptos:
	select * from socios
	select * from inscripciones
	select * from deportes
	--
	delete from deportes where codigo=3

--No se puede porque al no especificarse acción para eliminaciones, por defecto es "no action" y hay 
--inscriptos en dicho deporte.

--10- Modifique el código de un deporte para los cuales haya inscriptos.
--La opción para actualizaciones se estableció en cascada, se modifica el código en "deportes" y en 
--"inscripciones".
	select * from socios
	select * from inscripciones
	select * from deportes
	--
	update deportes set codigo = 5 
	from deportes
	where codigo = 1
--11- Verifique los cambios:
select * from deportes;
select * from inscripciones;

--12- Elimine el socio que esté inscripto en algún deporte.
--Se elimina dicho socio de "socios" y la acción se extiende a la tabla "inscripciones".
	select * from socios
	select * from inscripciones
	select * from deportes
	--
	delete from socios where documento = 30000111


--13- Verifique que el socio eliminado ya no aparece en "inscripciones":
-- select * from socios;
-- select * from inscripciones;

--14- Modifique el documento de un socio que esté inscripto.
--No se puede porque la acción es "no action" para actualizaciones.

--15- Intente eliminar la tabla "deportes":
-- drop table deportes;
--No se puede porque una restricción "foreign key" hace referencia a ella.

--16- Vea las restricciones de la tabla "socios":
-- exec sp_helpconstraint socios;
--Muestra la restricción "primary key" y la referencia de una "foreign key" de la tabla 
--"inscripciones".

--17- Vea las restricciones de la tabla "deportes":
-- exec sp_helpconstraint deportes;
--Muestra la restricción "primary key" y la referencia de una "foreign key" de la tabla 
--"inscripciones".

--18- Vea las restricciones de la tabla "inscripciones":
-- exec sp_helpconstraint inscripciones;
--Muestra 3 restricciones. Una "primary key" y dos "foreign key", una para el campo "codigodeporte" 
--que especifica "no action" en la columna "delete_action" y "cascade" en la columna "update_action"; 
--la otra, para el campo "documento" especifica "cascade" en la columna "delete_action" y "no action" 
--en "update_action"