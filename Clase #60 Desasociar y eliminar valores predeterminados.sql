----if object_id ('empleados') is not null
----  drop table empleados;

----if object_id ('VP_cero') is not null
----   drop default VP_cero;
----if object_id ('VP_datodesconocido') is not null
----   drop default VP_datodesconocido;

--   if OBJECT_ID('empleados') is not null
--	drop table empleados

--create table empleados(
--  nombre varchar(30),
--  domicilio varchar(30),
--  barrio varchar(15),
--  sueldo decimal(6,2)
--);

--go

---- Creamos un valor predeterminado que inserta el valor "0":
--	create default DF_0
--		as '0'
---- Lo asociamos al campo "sueldo":
--exec sp_bindefault DF_0 , 'empleados.sueldo'
---- Creamos un valor predeterminado con el valor "Desconocido":
--create default DF_desconocido
--		as 'Desconocido'

---- Lo asociamos al campo "domicilio" y al campo "barrio":

--exec sp_bindefault DF_desconocido, 'empleados.domicilio'
--exec sp_bindefault DF_desconocido, 'empleados.barrio'
---- Veamos los valores predeterminados asociados a los campos de la tabla "empleados":
--exec sp_helpconstraint empleados
--exec sp_help empleados

---- Quitamos la asociación al campo "barrio":
--exec sp_unbindefault 'empleados.domicilio'
--exec sp_unbindefault'empleados.barrio'
--drop default DF_desconocido


---- Aun no podemos eliminarlo porque está asociado al campo "domicilio",
---- quitamos la asociación y luego lo eliminamos:

-- EJERCICIO --

--1- Elimine la tabla si existe:
 if object_id ('libros') is not null
  drop table libros;

--2- Recuerde que si elimina una tabla, las asociaciones de reglas y valores predeterminados de sus 
--campos desaparecen, pero las reglas y valores predeterminados siguen existiendo. Si intenta crear 
--una regla o un valor predeterminado con igual nombre que uno existente, aparecerá un mensaje 
--indicándolo, por ello, debe eliminarlos (si existen) para poder crearlos nuevamente:
 --if object_id ('VP_cero') is not null
 --  drop default VP_cero;
 --if object_id ('VP_desconocido') is not null
 --  drop default VP_desconocido;
 --if object_id ('RG_positivo') is not null
 --  drop rule RG_positivo;

--3- Cree la tabla:
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  cantidad smallint
 );

--4- Cree una regla para impedir que se ingresen valores negativos, llamada "RG_positivo".
	create rule RG_libros_negativo
		as @rule > 0 

--5- Asocie la regla al campo "precio"
	
	exec sp_bindrule RG_libros_negativo , 'libros.precio'

--6- Asocie la regla al campo "cantidad".
		exec sp_bindrule RG_libros_negativo , 'libros.cantidad'

--7- Cree un valor predeterminado para que almacene el valor cero, llamado "VP_cero".
	create default VP_libros_default
		as 0

--8- Asócielo al campo "precio".
	exec sp_bindefault VP_libros_default , 'libros.precio'

--9- Asócielo al campo "cantidad".
	
	exec sp_bindefault VP_libros_default , 'libros.cantidad'

--10- Cree un valor predeterminado con la cadena "Desconocido" llamado "VP_desconocido".
			create default VP_libros_desconosco
		as 'Desconocido'

--11- Asócielo al campo "autor".

	exec sp_bindefault VP_libros_default , 'libros.autor'
--12- Asócielo al campo "editorial".
	exec sp_bindefault VP_libros_default , 'libros.editorial'
--13- Vea las reglas y valores predeterminados con "sp_help":
-- exec sp_help;
	exec sp_help libros

--14- Vea las reglas y valores predeterminados asociados a "libros".
--Aparecen 6 filas, 2 corresponden a la regla "RG_positivo" asociadas a los campos "precio" y 
--"cantidad"; 2 al valor predeterminado "VP_cero" asociados a los campos "precio" y "cantidad" y 2 al 
--valor predeterminado "VP_desconocido" asociados a los campos "editorial" y "autor".



--15- Ingrese un registro con valores por defecto para todos los campos, excepto "titulo" y vea qué se 
--almacenó.

--15- Quite la asociación del valor predeterminado "VP_cero" al campo "precio".
	exec sp_unbindefault 'libros.precio'

--16- Ingrese otro registro con valor predeterminado para el campo "precio" y vea cómo se almacenó.
	


--17- Vea las reglas y valores predeterminados asociados a "libros".
--5 filas; el valor predeterminado "VP_cero" ya no está asociado al campo "precio".
exec sp_helpconstraint libros

--18- Verifique que el valor predeterminado "VP_cero" existe aún en la base de datos.


--19- Intente eliminar el valor predeterminado "VP_cero".
--No se puede porque está asociado al campo "cantidad".

--20- Quite la asociación del valor predeterminado "VP_cero" al campo "cantidad".
exec sp_unbindefault 'libros.CANTIDAD'
exec sp_unbindefault 'libros.autor'
exec sp_unbindefault 'libros.editorial'
--21- Verifique que ya no existe asociación de este valor predeterminado con la tabla "libros".
--4 filas.

--22- Verifique que el valor predeterminado "VP_cero" aun existe en la base de datos.

--23- Elimine el valor predeterminado "VP_cero".

drop  default VP_libros_default 
--24- Verifique que ya no existe en la base de datos.





