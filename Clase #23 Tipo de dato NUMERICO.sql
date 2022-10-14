/*if object_id('libros') is not null
  drop table libros;
 create table libros (
	codigo smallint identity ,
	titulo varchar(40) not null,
	autor varchar(30) , 
	editorial varchar(15),
	precio smallmoney,
	cantidad tinyint
	)
	select * from libros;
	go
	-- Intentemos ingresar un valor fuera del rango definido, una cantidad 
	insert into libros ( titulo , autor , editorial , precio , cantidad)
		values ( 'Paco Yunque' , 'Cesar vallejo' , 'ImpactoCultural' , 8 , 8)
		select * from libros
		-- Intentamos ingresar un precio que supera el rango del tipo "smallmoney",
-- el valor 250000 (genera error):
insert into libros ( titulo , autor , editorial , precio , cantidad)
		values ( 'Paco Yunque' , 'Cesar vallejo' , 'ImpactoCultural' , 8 , 8)
		select * from libros
		-- Intentamos ingresar una cadena que SQL Server no pueda convertir a valor 
-- numérico en el campo "precio" (genera error):
insert into libros ( titulo , autor , editorial , precio , cantidad)
		values ( 'Paco Yunque' , 'Cesar vallejo' , 'ImpactoCultural' , 8 , 8)
		select * from libros*/
-- EJERCICIO #1--
if object_id('cuentas') is not null
  drop table cuentas;
--Número de cuenta: entero, no nulo, no puede haber valores repetidos, clave primaria;
-- Documento del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8), no nulo;
--Nombre del propietario de la cuenta: cadena de caracteres de 30 de longitud,
-- Saldo de la cuenta: valores altos con decimales.
create table cuentas(
	numero int not null,
	documento char(8) not null,
	nombre varchar(30) , 
	saldo decimal(30,2), 
	primary key (numero)
		)
		go
	insert into cuentas(numero,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);
  select * from cuentas
  --Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)
  select * from cuentas 
	where saldo > 4000
-- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez"
select numero, saldo from cuentas 
	where nombre = 'Juan Lopez'
-- Muestre las cuentas con saldo negativo
select * from cuentas
	 where saldo < 0 
--Muestre todas las cuentas cuyo número es igual o mayor a "3000"
select * from cuentas
	 where numero >= 3000