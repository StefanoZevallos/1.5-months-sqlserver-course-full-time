/*if object_id('libros') is not null
  drop table libros;
if object_id('editoriales') is not null
  drop table editoriales;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  primary key (codigo)
);
create table editoriales(
  codigo tinyint not null,
  nombre varchar(20),
  primary key (codigo)
);

go

insert into editoriales values(1,'Planeta');
insert into editoriales values(2,'Emece');
insert into editoriales values(3,'Paidos');

insert into libros values(1,'Uno','Richard Bach',1);
insert into libros values(2,'El aleph','Borges',2);
insert into libros values(3,'Aprenda PHP','Mario Molina',5);

-- Agregamos una restricci�n "foreign key" a la tabla "libros" para evitar que se ingresen 
-- c�digos de editoriales inexistentes en "editoriales".
-- Incluimos la opci�n "with nocheck" para evitar la comprobaci�n de la restricci�n en los
-- datos existentes (note que hay un libro que tiene un c�digo de editorial inv�lido):
select * from editoriales
select * from libros
--
alter table libros
 with nocheck
 add constraint FK_libros_codigoeditorial
 foreign key (codigoeditorial)
 references editoriales(codigo);

-- Para poder ingresar, modificar o eliminar datos a una tabla sin que SQL Server 
-- compruebe la restricci�n debemos deshabilitarla:
alter table libros
 nocheck constraint FK_libros_codigoeditorial;

-- Veamos si la restricci�n est� habilitada o no:
exec sp_helpconstraint libros;

-- Veamos las restricciones de "editoriales":
exec sp_helpconstraint editoriales;

-- Ahora podemos ingresar un registro en "libros" con c�digo inv�lido:
insert into libros values(4,'Ilusiones','Richard Bach',6);

-- Tambi�n podemos modificar:
update editoriales set codigo=8 where codigo=1;

-- Tambi�n realizar eliminaciones:
delete from editoriales where codigo=2;

-- Habilitamos la restricci�n:
alter table libros
  check constraint FK_libros_codigoeditorial;

-- Veamos si la restricci�n est� habilitada o no:
exec sp_helpconstraint libros;

-- Eliminamos la restricci�n:
alter table libros
  drop constraint FK_libros_codigoeditorial;

exec sp_helpconstraint libros;

exec sp_helpconstraint editoriales;*/
-- EJERCICIOS --
--1- Elimine las tablas "clientes" y "provincias", si existen:
 if object_id('clientes') is not null
  drop table clientes;
 if object_id('provincias') is not null
  drop table provincias;

--2- Cr�elas con las siguientes estructuras:
 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint,
  nombre varchar(20),
  primary key (codigo)
 );

--3- Ingrese algunos registros para ambas tablas:
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values('Garcia Juan','Sucre 345','Cordoba',1);
 insert into clientes values('Lopez Susana','Caseros 998','Posadas',3);
 insert into clientes values('Marcelo Moreno','Peru 876','Viedma',4);
 insert into clientes values('Lopez Sergio','Avellaneda 333','La Plata',5);

--4- Intente agregar una restricci�n "foreign key" para que los c�digos de provincia de "clientes" 
--existan en "provincias" con acci�n en cascada para actualizaciones y eliminaciones, sin especificar 
--la opci�n de comprobaci�n de datos:
SELECT * FROM CLIENTES
SELECT * FROM PROVINCIAS 
--
	alter table clientes
		add constraint FK_clientes_codigoprovincia
			foreign key (codigoprovincia)
				references provincias(codigo)
					on update cascade 
					on delete cascade;

--No se puede porque al no especificar opci�n para la comprobaci�n de datos, por defecto es "check" y 
--hay un registro que no cumple con la restricci�n.

--5- Agregue la restricci�n anterior pero deshabilitando la comprobaci�n de datos existentes:
					alter table clientes
				with nocheck
				add constraint FK_clientes_codigoprovincia
				foreign key (codigoprovincia)
				references provincias(codigo)
				on update cascade
				on delete cascade;

--6- Vea las restricciones de "clientes":
 sp_helpconstraint clientes;

--Aparece la restricci�n "primary key" y "foreign key", las columnas "delete_action" y "update_action" 
--contienen "cascade" y la columna "status_enabled" contiene "Enabled".

--7- Vea las restricciones de "provincias":
		sp_helpconstraint provincias;
--Aparece la restricci�n "primary key" y la referencia a esta tabla de la restricci�n "foreign key" de 
--la tabla "clientes.

--8- Deshabilite la restricci�n "foreign key" de "clientes":
 
 select * from clientes
 select * from provincias
 --
 alter table clientes
 nocheck constraint FK_clientes_codigoprovincia;

--9- Vea las restricciones de "clientes":
 exec sp_helpconstraint clientes;
--la restricci�n "foreign key" aparece inhabilitada.

--10- Vea las restricciones de "provincias":
 exec sp_helpconstraint provincias;

--informa que la restricci�n "foreign key" de "clientes" hace referencia a ella, a�n cuando est� 
--deshabilitada.

--11- Agregue un registro que no cumpla la restricci�n "foreign key":
 insert into clientes values('Garcia Omar','San Martin 100','La Pampa',6);
--Se permite porque la restricci�n est� deshabilitada.

--12- Elimine una provincia de las cuales haya clientes:
 delete from provincias where codigo=2;

--13- Corrobore que el registro se elimin� de "provincias" pero no se extendi� a "clientes":
 select * from clientes;
 select * from provincias;

--14- Modifique un c�digo de provincia de la cual haya clientes:
 update provincias set codigo=9 where codigo=3;

--15- Verifique que el cambio se realiz� en "provincias" pero no se extendi� a "clientes":
-- select * from clientes;
-- select * from provincias;

--16- Intente eliminar la tabla "provincias":
 drop table provincias;
--No se puede porque la restricci�n "FK_clientes_codigoprovincia" la referencia, aunque est� deshabilitada.

--17- Habilite la restricci�n "foreign key":
 alter table clientes
 check constraint FK_clientes_codigoprovincia;

--18- Intente agregar un cliente con c�digo de provincia inexistente en "provincias":
-- insert into clientes values('Hector Ludue�a','Paso 123','La Plata',8);
--No se puede.

--19- Modifique un c�digo de provincia al cual se haga referencia en "clientes":
-- update provincias set codigo=20 where codigo=4;
--Actualizaci�n en cascada.

--20- Vea que se modificaron en ambas tablas:
-- select * from clientes;
-- select * from provincias;

--21- Elimine una provincia de la cual haya referencia en "clientes":
-- delete from provincias where codigo=1;
--Acci�n en cascada.

--22- Vea que los registros de ambas tablas se eliminaron:
-- select * from clientes;
-- select * from provincias;

--23- Elimine la restriccion "foreign key":
  alter table clientes
 drop constraint FK_clientes_codigoprovincia;

--24- Vea las restriciones de la tabla "provincias":
-- exec sp_helpconstraint provincias;
--Solamente aparece la restricci�n "primary key", ya no hay una "foreign key" que la referencie.

--25- Elimine la tabla "provincias":
-- drop table provincias;
--Puede eliminarse porque no hay restricci�n "foreign key" que la referencie.