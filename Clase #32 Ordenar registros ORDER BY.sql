/*if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25.33);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);
 
-- Recuperamos los registros ordenados por el título:

select * from libros
order by precio

-- Ordenamos los registros por el campo "precio", referenciando el campo
-- por su posición en la lista de selección:
select * from libros 
order by 5

-- Los ordenamos por "editorial", de mayor a menor empleando "desc":
select * from libros	
	order by editorial desc ;

-- Ordenamos por dos campos:

	select * from libros	
		order by editorial , precio ;

-- Ordenamos en distintos sentidos:
select * from libros	
		order by editorial desc, precio asc ;

-- Ordenamos por un campo que no se lista en la selección:

select autor from libros
	order by precio
-- Ordenamos por un valor calculado:

select * , precio-(precio*0.1) as descuento from libros 
	order by descuento ; */
	-- #### EJERCICIO #### --
--1- Elimine la tabla "visitas", si existe:
 if object_id('visitas') is not null
  drop table visitas;
--2- Créela con la siguiente estructura:
 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
);
--3- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

--4- Ordene los registros por fecha, en orden descendente.

select * from visitas 
order by fecha desc;

--5- Muestre el nombre del usuario, pais y el nombre del mes, ordenado por pais (ascendente) y nombre del mes (descendente)

select nombre,pais,	
	datename(month , fecha) as 'nombre del mes' from visitas
	order by pais asc , [nombre del mes] desc;

--6- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la hora.
	
select pais , 
	datename(month , fecha) as Mes ,
	datename(WEEKDAY , fecha) as Dia ,
	datename(hour , fecha) as Hora
	from visitas
	order by 2,3,4 ;
	--
	 select nombre,mail,
  datename(month,fecha) mes,
  datename(day,fecha) dia,
  datename(hour,fecha) hora
  from visitas
  order by 3,4,5;

--7- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 registros)
	 select mail, pais
	from visitas
	where datename(month,fecha)='October'
	order by 2; 
	
