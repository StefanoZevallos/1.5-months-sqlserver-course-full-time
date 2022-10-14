--if object_id('detalles') is not null
--  drop table detalles;
--if object_id('facturas') is not null
--  drop table facturas;

--create table facturas(
--  numero int not null,
--  fecha datetime,
--  cliente varchar(30),
--  primary key(numero)
--);

--create table detalles(
--  numerofactura int not null,
--  numeroitem int not null, 
--  articulo varchar(30),
--  precio decimal(5,2),
--  cantidad int,
--  primary key(numerofactura,numeroitem),
--   constraint FK_detalles_numerofactura
--   foreign key (numerofactura)
--   references facturas(numero)
--   on update cascade
--   on delete cascade,
--);

--go

---- Seteamos el formato de la fecha: año, mes y día:
--set dateformat ymd;

--insert into facturas values(1200,'2018-01-15','Juan Lopez');
--insert into facturas values(1201,'2018-01-15','Luis Torres');
--insert into facturas values(1202,'2018-01-15','Ana Garcia');
--insert into facturas values(1300,'2018-01-20','Juan Lopez');

--insert into detalles values(1200,1,'lapiz',1,100);
--insert into detalles values(1200,2,'goma',0.5,150);
--insert into detalles values(1201,1,'regla',1.5,80);
--insert into detalles values(1201,2,'goma',0.5,200);
--insert into detalles values(1201,3,'cuaderno',4,90);
--insert into detalles values(1202,1,'lapiz',1,200);
--insert into detalles values(1202,2,'escuadra',2,100);
--insert into detalles values(1300,1,'lapiz',1,300);

----  Listado de todas las facturas que incluya el número, la fecha, 
---- el cliente, la cantidad de artículos comprados y el total:
--select f.*,
--  (select count(d.numeroitem)
--    from detalles as d
--    where f.numero=d.numerofactura) as cantidad,
--  (select sum(d.precio*cantidad)
--    from detalles as d
--    where f.numero=d.numerofactura) as total
-- from facturas as f;
-- --
-- select * from facturas
-- select * from detalles
 --
 -- EJERCICIOS --
 --1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
	--2- Cree las tablas:
 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade,
 );
 GO
--3- Ingrese algunos registros:
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

--4- Se necesita un listado de todos los socios que incluya nombre y domicilio, la cantidad de 
--deportes a los cuales se ha inscripto, empleando subconsulta.
--4 registros.
	SELECT * FROM SOCIOS
	SELECT * FROM inscriptos
	-------------------------
	select *, (select count(numerosocio)  from inscriptos where numero=numerosocio) from socios 
	-------------------------

--5- Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada 
--deporte) y el total de cuotas pagas, empleando subconsulta.
--4 registros.
	
	SELECT * FROM SOCIOS
	SELECT * FROM inscriptos
	------------------------
	select * , 
	(select (count(cuotas)*10)  from inscriptos  where numero=numerosocio) as 'total',
	(select (sum(cuotas)) from inscriptos where numero=numerosocio) as 'pagas' 
	from socios 
	-----------------
--6- Obtenga la misma salida anterior empleando join.
	
	select nombre, count(cuotas)*10 as total, sum(cuotas) as pagas from socios 
		join inscriptos	
			on numero = numerosocio
			group by nombre
	---------------------------------------------------------------------------
			select nombre,
		  count(i.deporte)*10 as total,
		  sum(i.cuotas) as pagas
		  from socios as s
		  join inscriptos as i
		  on numero=numerosocio
		  group by nombre;


