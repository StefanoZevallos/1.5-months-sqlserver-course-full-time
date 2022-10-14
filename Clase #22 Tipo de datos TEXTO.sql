if object_id('visitantes') is not null
  drop table visitantes;
  /* Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" 
   algunos datos de las personas que visitan o compran en su stand para luego enviarle 
   publicidad de sus productos. */
   create table visitantes(
  nombre varchar(30),
  edad integer,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11)
);
go
-- Intentamos ingresar una cadena de mayor longitud que la definida 
-- en el campo sexo (se genera un error):
insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Juan Juarez',32,'X','Avellaneda 789','Cordoba','4234567');
  -- Ingresamos un número telefónico olvidando las comillas, es decir, 
-- como un valor numérico (lo transforma a cadena):
insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Marcela Morales',43,'f','Colon 456','Cordoba',4567890);

select * from visitantes;
--#EJERCICIO 1 ##-
--1- Elimine la tabla "autos" si existe:
 if object_id('autos') is not null
  drop table autos;

--2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo 
--"patente" como clave primaria:
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 );

--Hemos definido el campo "patente" de tipo "char" y no "varchar" porque la cadena de caracteres 
--siempre tendrá la misma longitud (6 caracteres). Lo mismo sucede con el campo "modelo", en el cual 
--almacenaremos el año, necesitamos 4 caracteres fijos.

--3- Ingrese los siguientes registros:
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);
  SELECT * FROM autos

--4- Seleccione todos los autos del año 1990:
 select * from autos
  where modelo='1990';