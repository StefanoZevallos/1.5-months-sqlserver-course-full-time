/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  preciomin decimal(5,2),
  preciomay decimal(5,2)
);

go

insert into libros values ('Uno','Bach','Planeta',22,20);
insert into libros values ('El quijote','Cervantes','Emece',15,13);
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',48,53);
insert into libros values ('Java en 10 minutos','Garcia','Siglo XXI',35,40);

-- Agregamos una restricción "check" para asegurar que los valores de los campos
-- correspondientes a precios no puedan ser negativos:
alter table libros
  add constraint CK_libros_precios_positivo
  check (preciomin>=0 and preciomay>=0);

update libros set preciomay=48
  where titulo='Aprenda PHP';

delete from libros where titulo='Java en 10 minutos'; 

-- Agregamos la restricción "check" que impida que se ingresen valores 
-- para "preciomay" superiores a "preciomin":
alter table libros
 add constraint CK_libros_preciominmay
 check (preciomay<=preciomin);

exec sp_helpconstraint libros;

insert into libros default values;

select * from libros;

-- Genera un error si intentamos ingresar un preciomin negativo
insert into libros values ('Java Total','Martinez','Cuello',-1,40);*/
-- ## EJERCICIOS ## -- 
--1- Elimine la tabla si existe:
 /*if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento datetime,
  cantidadhijos tinyint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

--3- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el 
--sueldo:
	alter table empleados
		add constraint CK_empleados_sueldononegativo
		check ( sueldo > 0 );

--4- Ingrese algunos registros válidos:
 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);
 select * from empleados

--5- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el 
--valor 5000:
	delete from empleados where sueldo = 6000
	alter table empleados
	add constraint CK_empleados_sueldomenor500
		check (sueldo <=5000);
		
--6- Elimine el registro infractor y vuelva a crear la restricción:
 --delete from empleados where sueldo=6000;

-- LISTO

--7- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la 
--fecha actual:
	alter table empleados
		add constraint CK_sueldo_libros
		check (fechanacimiento < getdate())

--8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
--"Administracion" y "Contaduría":

	alter table empleados
		add constraint CK_empleados_seccionvalorespermitidos
			check ( seccion in ('sistemas' , 'Administracion' , 'Contaduria'))
			
--9- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 15.
	select * from empleados
	alter table empleados
		add constraint CK_empleados_cantidadhijos
			check ( cantidadhijos between 0 and 15 )
--10- Vea todas las restricciones de la tabla (5 filas):
exec sp_helpconstraint empleados

--11- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo".
--Mensaje de error porque se infringe la restricción "CK_empleados_sueldo_positivo".

--12- Intente agregar un registro con fecha de nacimiento futura.
--Mensaje de error.

--13- Intente modificar un registro colocando en "cantidadhijos" el valor "21".
--Mensaje de error.

--14- Intente modificar el valor de algún registro en el campo "seccion" cambiándolo por uno que no 
--esté incluido en la lista de permitidos.
--Mensaje de error.

--15- Intente agregar una restricción al campo sección para aceptar solamente valores que comiencen 
--con la letra "B":
	select * from empleados
	alter table empleados
		add constraint CK_empleados_B
		check (seccion like 'B%')
		delete from empleados	
			where seccion like '%a%'
--Note que NO se puede establecer esta restricción porque va en contra de la establecida anteriormente 
--para el mismo campo, si lo permitiera, no podríamos ingresar ningún valor para "seccion".*/
--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Cree la tabla:
 create table vehiculos(
  numero int identity,
  patente char(6),
  tipo char(4),
  fechahoraentrada datetime,
  fechahorasalida datetime
 );

--3- Ingresamos algunos registros:
 insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
 insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null);
 insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');
 select * from vehiculos

--4- Agregue una restricción "check" que especifique un patrón de 3 letras y 3 dígitos para "patente":


--5- Intente ingresar un registro con un valor inapropiado para "patente":

--No lo permite.

--6- Agregue una restricción "check" que especifique que el campo "tipo" acepte solamente los valores 
--"auto" y "moto":
	delete from vehiculos
		
		select * from vehiculos

	alter table vehiculos
		add constraint CK_vehiculos_tip
			check (tipo in ('Auto' ,'Moto'))
	
--7- Intente modificar el valor del campo "tipo" ingresando un valor inexistente en la lista de 
--valores permitidos por la restricción establecida a dicho campo:
 
--No lo permite.

--8- Agregue una restricción "default" para el campo "tipo" que almacene el valor "bici":
	alter table vehiculos
		add constraint CK_vehiculos_default
			default  'bici'
			for tipo

--Lo acepta. Pero, note que va en contra de la restricción "check" impuesta en el punto 6.

--9- Intente ingresar un registro sin valor para "tipo":
 
--No lo permite porque va contra la restricción "check" del campo.

--10- Agregue una restricción "check" para asegurarse que la fecha de entrada a la playa no sea 
--posterior a la fecha y hora actual:
 
 --select * from vehiculos
	--alter table vehiculos
	--	constraint CK_vehiculos_fecha
	--		check ( fechaentrada < getdate())


--11- Agregue otra restricción "check" al campo "fechahoraentrada" que establezca que sus valores no 
--sean posteriores a "fechahorasalida":


--12- Intente ingresar un valor que no cumpla con la primera restricción establecida en el campo 
--"fechahoraentrada":
 
--La inserción no se realiza.

--13- Intente modificar un registro para que la salida sea anterior a la entrada:
 
--Mensaje de error.

--14- Vea todas las restricciones para la tabla "vehiculos":
 
--aparecen 5 filas, 4 correspondientes a restricciones "check" y 1 a "default".

--15- Establezca una restricción "default" para el campo "fechahoraentrada" para que almacene la fecha 
--actual del sistema:
	alter table vehiculos
		add constraint DF_vehiculos_fechaentrada
		 default getdate()
			for fechahoraentrada


--16- Ingrese un registro sin valor para "fechahoraentrada":
 

--17- Vea todos los registros:


--18- Vea las restricciones:
-- exec sp_helpconstraint vehiculos;
