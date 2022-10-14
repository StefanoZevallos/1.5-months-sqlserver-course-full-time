--1- Elimine la tabla, si existe, créela y cargue un registro:
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  fechaingreso datetime
 );
 insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');

--2- Agregue el campo "sueldo", de tipo decimal(5,2).
alter table empleados
	add sueldo decimal(5,2)
--3- Verifique que la estructura de la tabla ha cambiado.
	exec sp_columns empleados
--4- Agregue un campo "codigo", de tipo int con el atributo "identity".
	alter table empleados
		add codigo int identity
--5- Intente agregar un campo "documento" no nulo.
--No es posible, porque SQL Server no permite agregar campos "not null" a menos que se especifique un 
--valor por defecto.
	alter table empleados
		add documento varchar(30) not null ;
		--

--6- Agregue el campo del punto anterior especificando un valor por defecto:
alter table empleados
		add documento varchar(30) not null default ('default') 

--7- Verifique que la estructura de la tabla ha cambiado.
exec sp_columns empleados
--8- Elimine el campo "sueldo".
alter table empleados
	drop column sueldo;
--9- Verifique la eliminación:
exec sp_columns empleados
--10- Intente eliminar el campo "documento".
--no lo permite.

alter table empleados
	drop column documento 
--11- Elimine los campos "codigo" y "fechaingreso" en una sola sentencia.

alter table empleados	
	drop column codigo , fechaingreso

--12- Verifique la eliminación de los campos:

exec sp_columns empleados