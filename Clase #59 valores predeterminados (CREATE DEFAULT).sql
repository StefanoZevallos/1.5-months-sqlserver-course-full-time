/*if object_id ('empleados') is not null
  drop table empleados;

if object_id ('VP_cero') is not null
   drop default VP_cero;
if object_id ('VP_100') is not null
   drop default VP_100;
if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
if object_id ('VP_telefono') is not null
   drop default VP_telefono;

create table empleados(
  nombre varchar(30),
  domicilio varchar(30),
  barrio varchar(15),
  telefono char(14),
  sueldo decimal(6,2)
);

go

insert into empleados default values;

select * from empleados;

go

-- Creamos un valor predeterminado con el valor "Desconocido":
create default VP_datodesconocido
  as 'Desconocido';

go

-- Lo asociamos al campo "domicilio":
exec sp_bindefault VP_datodesconocido, 'empleados.domicilio';

-- Lo asociamos al campo "barrio":
exec sp_bindefault VP_datodesconocido, 'empleados.barrio';

insert into empleados default values;

select * from empleados;

go

-- Creamos un valor predeterminado que inserta el valor "0":
create default VP_cero
  as 0;

go

-- Lo asociamos al campo "sueldo":
exec sp_bindefault VP_cero, 'empleados.sueldo';

insert into empleados default values;

select * from empleados;

go

-- Creamos un valor predeterminado que inserta el valor "100":
create default VP_100
  as 100;

go

-- Lo asociamos al campo "sueldo"
-- Recuerde que si asociamos a un campo que ya tiene asociado un valor
-- predeterminado otro valor predeterminado, la nueva asociación reemplaza a la anterior 
exec sp_bindefault VP_100, 'empleados.sueldo';

insert into empleados default values;

select * from empleados;

exec sp_helpconstraint empleados;

exec sp_help;

go

-- Creamos un valor predeterminado que inserta ceros con el formato válido
-- para un campo número de teléfono:
create default VP_telefono
 as '(0000)0-000000';

go

-- La asociamos al campo "telefono" de la tabla "empleados":
exec sp_bindefault VP_telefono,'empleados.telefono';

insert into empleados default values;

select * from empleados;

exec sp_helpconstraint empleados;*/
 -- EJERCICIOS --
 --1- Elimine la tabla si existe:
 if object_id ('clientes') is not null
  drop table clientes;

--2- Recuerde que si elimina una tabla, las asociaciones de reglas y valores predeterminados de sus 
--campos desaparecen, pero las reglas y valores predeterminados siguen existiendo. Si intenta crear 
--una regla o un valor predeterminado con igual nombre que uno existente, aparecerá un mensaje 
--indicándolo, por ello, debe eliminarlos (si existen) para poder crearlos nuevamente:
 --if object_id ('VP_legajo_patron') is not null
 --  drop default VP_legajo_patron;
 --if object_id ('RG_legajo_patron') is not null
 --  drop rule RG_legajo_patron;
 --if object_id ('RG_legajo') is not null
 --  drop rule RG_legajo;
 --if object_id ('VP_datodesconocido') is not null
 --  drop default VP_datodesconocido;
 --if object_id ('VP_fechaactual') is not null
 --  drop default VP_fechaactual;
   
--3- Cree la tabla:
 create table clientes(
  legajo char(4),
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(15),
  provincia varchar(20) default 'Cordoba',
  fechaingreso datetime
 );

--4- Cree una regla para establecer un patrón para los valores que se ingresen en el campo "legajo" (2 
--letras seguido de 2 cifras) llamada "RG_legajo_patron":
	

--5- Asocie la regla al campo "legajo".
	
--6- Cree un valor predeterminado para el campo "legajo" ('AA00') llamado "VP_legajo_patron".
	create default VP_legajo_patrón
		as 'AA00';

--7- Asócielo al campo "legajo".
--Recuerde que un campo puede tener un valor predeterminado y reglas asociados.
	exec sp_bindefault VP_legajo_patrón , 'clientes.legajo'

--8- Cree un valor predeterminado con la cadena "??" llamado "VP_datodesconocido".
	create default VP_datodesc
	as '??'
--9- Asócielo al campo "domicilio".
	exec sp_bindefault VP_datodesc , 'clientes.domicilio'
--10- Asócielo al campo "ciudad".
--Recuerde que un valor predeterminado puede asociarse a varios campos.
	exec sp_bindefault VP_datodesc , 'clientes.ciudad'
--11- Ingrese un registro con valores por defecto para los campos "domicilio" y "ciudad" y vea qué 
--almacenaron.

	
--12- Intente asociar el valor predeterminado "VP_datodesconocido" al campo "provincia".
--No se puede porque dicho campo tiene una restricción "default".

--13- Cree un valor predeterminado con la fecha actual llamado "VP_fechaactual".
	create default VP_fechahoy
		as getdate()
--14- Asócielo al campo "fechaingreso".
	exec sp_bindefault VP_fechahoy , 'clientes.fechaingreso'
--15- Ingrese algunos registros para ver cómo se almacenan los valores para los cuales no se insertan 
--datos.
		
	
--16- Asocie el valor predeterminado "VP_datodesconocido" al campo "fechaingreso".
--Note que se asoció un valor predeterminado de tipo caracter a un campo de tipo "datetime"; SQL 
--Server lo permite, pero al intentar ingresar el valor aparece un mensaje de error.


--17- Ingrese un registro con valores por defecto.
--No lo permite porque son de distintos tipos.

--18- Cree una regla que entre en conflicto con el valor predeterminado "VP_legajo_patron".

--19- Asocie la regla al campo "legajo".
--Note que la regla especifica que el campo "legajo" debe comenzar con la letra "B", pero el valor 
--predeterminado tiene el valor "AA00"; SQL Server realiza la asociación, pero al intentar ingresar el 
--valor predeterminado, no puede hacerlo y muestra un mensaje de error.

--20- Intente ingresar un registro con el valor "default" para el campo "legajo".
--No lo permite porque al intentar ingresar el valor por defecto establecido con el valor 
--predeterminado entra en conflicto con la regla "RG_legajo".
exec sp_helpconstraint CLIENTES
exec sp_help clientes