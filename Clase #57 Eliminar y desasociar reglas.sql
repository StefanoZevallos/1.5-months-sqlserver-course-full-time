/*if object_id ('empleados') is not null
  drop table empleados;

if object_id ('RG_sueldo_100a1000') is not null
   drop rule RG_sueldo_100a1000;

create table empleados(
  documento char(8),
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
);

go
select * from empleados
-- Creamos una regla para restringir los valores que se pueden ingresar
-- en un campo "sueldo":

	create rule RG_empleados_sueldo
		as @restringir >= 0 ;

-- Asociamos la regla creada anteriormente al campo "sueldo":
	exec sp_bindrule RG_empleados_sueldo,  'empleados.sueldo'

-- Vemos si la regla está asociada a algún campo de "empleados":
	exec sp_help

-- Quitamos la asociación:
	exec sp_unbindrule 'empleados.sueldo'


-- Ahora que hemos quitado la asociación, podemos ingresar el valor
-- "1200" en el campo "sueldo":


-- Vemos si la regla está asociada a algún campo de "empleados":
exec sp_helpconstraint empleados;

-- Ejecutamos el procedimiento "sp_help" para verificar que la regla aún existe:
exec sp_help
-- Ahora si podemos borrar la regla:
drop rule RG_empleados_sueldo*/
-- ## EJERCICIOS ## -- 
--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Elimine las siguientes reglas, si existen:
 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron;
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo;
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2;

--3- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );
 SELECT * FROM vehiculos

--4- Cree una regla para restringir los valores que se pueden ingresar en un campo "patente" (3 letras 
--seguidas de 3 dígitos):
	create rule RG_vehiculos_patenes
		as @restriccion like '[A-Z][A-Z][A-Z][1-9][1-9][1-9]'



--5-Asocie la regla al campo "patente":
exec sp_bindrule RG_vehiculos_patenes , 'vehiculos.patente'

--6- Intente ingresar un registro con valor para el campo "patente" que no cumpla con la regla:
-- insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null);
--aparece un mensaje de error indicando que hay conflicto con la regla y la inserción no se realiza.

--7- Cree otra regla que controle los valores para el campo "tipo" para que solamente puedan 
--ingresarse los caracteres "a" y "m":
	create rule RG_vehiculos_tipo
		as @tipo in ('a' , 'n')
		

--8- Asocie la regla al campo "tipo":
-- exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo';
	exec sp_bindrule RG_vehiculos_tipo , 'vehiculos.tipo'

--9- Intente ingresar un registro con el valor 'c' para "tipo":
-- insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);
--No lo permite.

--10- Cree otra regla llamada "RG_vehiculos_tipo2" que controle los valores para el campo "tipo" para 
--que solamente puedan ingresarse los caracteres "a", "c" y "m":
	create rule RG_vehiculos_tipo2 
		as @tipo2 in ('a' , 'b' ,'c')

--11- Si la asociamos a un campo que ya tiene asociada otra regla, la nueva regla reeemplaza la 
--asociación anterior. Asocie la regla creada en el punto anterior al campo "tipo".
	exec sp_bindrule RG_vehiculos_tipo2 , 'vehiculos.tipo'

--12- Ingrese el registro que no pudo ingresar en el punto 9.

--13- Intente eliminar la regla "RG_vehiculos_tipo2".
--No es posible porque está asociada a un campo de "vehiculos".

--14- Elimine la regla "RG_vehiculos_tipo".
--Es posible porque no está asociada a ningún campo.

--15- Intente eliminar la regla "RG_patente_patron".
--No es posible porque está asociada.

--16- Quite la asociación de la regla con el campo "patente" de "vehiculos".

	exec sp_unbindrule 'vehiculos.patente'

--17- Vea si la regla "RG_patente_patron" está asociada a algún campo de "vehiculos".
--No lo está.


--18- Verifique que la regla aún existe en la base de datos activa:
-- exec sp_help;
--aparece la regla.

--19- Elimine la regla que no pudo eliminar en el punto 15.

--20- Verifique que la regla ya no existe en la base de datos activa.
--No aparece la regla "RG_patente_patron".