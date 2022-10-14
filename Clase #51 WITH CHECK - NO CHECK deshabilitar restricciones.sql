/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2)
);

go

insert into libros values ('Uno','Bach','Planeta',22);
insert into libros values ('El quijote','Cervantes','Emece',15);
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',-40);

-- Agregamos una restricción "check" para asegurar que los precios no puedan ser 
-- negativos, pero como ya tenemos almacenado un precio que infringe la restricción,
-- vamos a especificar que no haya comprobación de datos existentes:
	select * from libros
	alter table libros
		with nocheck
		add constraint CK_libros_precio
			check (precio > 0 )
			
-- Si intentamos ingresar un registro con precio negativo, no lo permite.
-- Para que lo permita, debemos dehabilitar la comprobación:

  nocheck constraint CK_libros_precio

-- Ingresemos un registro con precio negativo (si lo permite):
insert into libros values('Java en 10 minutos',default,'Siglo XXI',-1);

-- Veamos si la restricción está o no habilitada:
-- La columna "status_enabled" nos informa que está deshabilitada (Disabled)
exec sp_helpconstraint libros;

-- Habilitamos la restricción.
-- Si ahora intentamos ingresar un precio negativo SQL Server no lo permitirá.
alter table libros
  check constraint CK_libros_precio_positivo;

select * from libros;*/
-- ...  ### EJERCICIOS ### ... -- 
--1- Elimine la tabla (si existe):
 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura e ingrese los registros siguientes:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2)
 );
 go
 insert into empleados
  values ('22222222','Alberto Acosta','Sistemas',-10);
 insert into empleados
  values ('33333333','Beatriz Benitez','Recursos',3000);
 insert into empleados
  values ('34444444','Carlos Caseres','Contaduria',4000);

--3- Intente agregar una restricción "check" para asegurarse que no se ingresen valores negativos para 
--el sueldo:
select * from empleados
	alter table empleados
		with nocheck
		add constraint CK_empleados_negativos
			check ( sueldo > 0 )

--No se permite porque hay un valor negativo almacenado.

--5- Vuelva a intentarlo agregando la opción "with nocheck":
alter table empleados
		with nocheck
		add constraint CK_empleados_negativos
			check ( sueldo > 0 )


--6- Intente ingresar un valor negativo para sueldo:
 

--7- Deshabilite la restricción e ingrese el registro anterior:
	alter table empleados
	 nocheck constraint CK_empleados_negativos

--8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
--"Administracion" y "Contaduría":

	alter table empleados 
		add constraint CK_empleados_2
			check (seccion in ('Sistemas' , 'Administracion' , 'Contaduria'))

--No lo permite porque existe un valor fuera de la lista.

--9- Establezca la restricción anterior evitando que se controlen los datos existentes.
	alter table empleados 
		with nocheck
		add constraint CK_empleados_2
			check (seccion in ('Sistemas' , 'Administracion' , 'Contaduria'))

--10- Vea si las restricciones de la tabla están o no habilitadas:

	exec sp_helpconstraint empleados

--Muestra 2 filas, una por cada restricción.

--11- Habilite la restricción deshabilitada.
	alter table empleados
		check constraint CK_empleados_2

--12- Intente modificar la sección del empleado "Carlos Caseres" a "Recursos".
--No lo permite.

	
--13- Deshabilite la restricción para poder realizar la actualización del punto precedente.
alter table empleados
		nocheck constraint CK_empleados_2
