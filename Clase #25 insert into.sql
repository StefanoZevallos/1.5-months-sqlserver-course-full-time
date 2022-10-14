/*if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15)
);

go

-- Si ingresamos valores para todos los campos, podemos omitir la lista de campos:
insert into libros 
values ('Paco Yunque', 'Cesar Vallejo', 'ImpactoCultural')
select * from libros 

-- Podemos ingresar valores para algunos de los campos:

insert into libros (titulo,autor)
values ('Paco Yunque', 'Cesar Vallejo')
select * from libros 
-- No podemos omitir el valor para un campo declarado "not null",
-- como el campo "titulo" (genera error):
insert into libros (titulo,autor)
values ( 'Paco Yunque','Cesar Vallejo')
select * from libros */
--EJERCICIO #1--
--1- Elimine la tabla "cuentas" si existe:
 if object_id('cuentas') is not null
  drop table cuentas;

--2- Cree la tabla :
 create table cuentas(
  numero int identity,
  documento char(8) not null,
  nombre varchar(30),
  saldo money
 );
 select * from cuentas
--3- Ingrese un registro con valores para todos sus campos, inclusive el campo identity, omitiendo la 
--lista de campos (error, no se debe ingresar para el campo identity):
--insert into cuentas values
	--( '700911','Stefano',1200)
 --select * from cuentas
--4- Ingrese un registro con valores para todos sus campos omitiendo la lista de campos (excepto el 
--campo "identity"):
insert into cuentas values
	( '700911','Stefano',1200)
 select * from cuentas
--5- Ingrese un registro omitiendo algún campo que admitan valores nulos.
insert into cuentas (documento , nombre)
	values ( '700911','Stefano')
 select * from cuentas

--6- Intente ingresar un registro con valor para el campo "numero" (error):


--7- Intente ingresar un registro listando 3 campos y colocando 4 valores (error)
insert into cuentas (documento , nombre,saldo)
	values ( '700911','Stefano',12000)
 select * from cuentas

--8- Intente ingresar un registro sin valor para el campo "documento" (error)

--9- Vea los registros ingresados:
