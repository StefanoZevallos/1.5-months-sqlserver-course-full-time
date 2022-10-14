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
--   on delete cascade
--);

--go

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

---- Retornar la lista de clientes que compraron el artículo "lapiz":
--select cliente,numero
--  from facturas as f
--  where exists
--   (select * from detalles as d
--     where f.numero=d.numerofactura
--     and d.articulo='lapiz');
--	 ----------------------
--	 select * from facturas
--	 select * from detalles
--	 ----------------------
---- Buscamos los clientes que NO han comprado el artículo "lapiz":
-- select cliente,numero
--  from facturas as f
--  where not exists
--   (select * from detalles as d
--     where f.numero=d.numerofactura
--     and d.articulo='lapiz');
--	 ------------------------
--	  select * from facturas
--		select * from detalles
	 ------------------------
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

--4- Emplee una subconsulta con el operador "exists" para devolver la lista de socios que se 
--inscribieron en un determinado deporte.
--3 registros.
		select * from socios
		select * from inscriptos
		------------------------
		select nombre from socios 
			where exists (
				select * from inscriptos
					where numero = numerosocio and
						deporte = 'tenis' )
		--------------------------
			select nombre
			  from socios as s
			  where exists
			   (select *from inscriptos as i
				 where s.numero=i.numerosocio
				 and i.deporte='natacion');

--5- Busque los socios que NO se han inscripto en un deporte determinado empleando "not exists".
--1 registro.

		select nombre from socios 
			where not exists (
				select * from inscriptos
					where numero = numerosocio and
						deporte = 'tenis' )
						---
		select * from socios
		select * from inscriptos
--6- Muestre todos los datos de los socios que han pagado todas las cuotas.
--1 registro.

	select * from socios 
		where exists 
		(select * from inscriptos
		where numero=numerosocio and cuotas = 10)
		------
		select s.*
		  from socios as s
		  where exists
		   (select *from inscriptos as i
			 where s.numero=i.numerosocio
			 and i.cuotas=10);


