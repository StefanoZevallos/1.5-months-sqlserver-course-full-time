/* object_id('comidas') is not null
  drop table comidas;

create table comidas(
  codigo int identity,
  nombre varchar(30),
  precio decimal(4,2),
  rubro char(6),-- 'plato'=plato principal', 'postre'=postre
  primary key(codigo)
);

go

insert into comidas values('ravioles',5,'plato');
insert into comidas values('tallarines',4,'plato');
insert into comidas values('milanesa',7,'plato');
insert into comidas values('cuarto de pollo',6,'plato');
insert into comidas values('flan',2.5,'postre');
insert into comidas values('porcion torta',3.5,'postre');
select * from comidas
-- Realizamos un "cross join"
-- Note que aparecen filas duplicadas, por ejemplo, "ravioles" se
-- combina con "ravioles" y la combinación "ravioles- flan"
-- se repite como "flan- ravioles"
select c1.nombre as 'plato principal',
  c2.nombre as postre,
  c1.precio+c2.precio as total
  from comidas as c1
  cross join comidas as c2;

-- Debemos especificar que combine el rubro "plato" con "postre":
select c1.nombre as 'plato principal',
  c2.nombre as postre,
  c1.precio+c2.precio as total
  from comidas as c1
  cross join comidas as c2
  where c1.rubro='plato' and
  c2.rubro='postre';

-- También se puede realizar una autocombinación con "join":
select c1.nombre as 'plato principal',
  c2.nombre as postre,
  c1.precio+c2.precio as total
  from comidas as c1
  join comidas as c2
  on c1.codigo<>c2.codigo
  where c1.rubro='plato' and
  c2.rubro='postre';*/
  -- ##EJERCICIO ## -- 
  --1- Elimine la tabla si existe y créela:
-- if object_id('clientes') is not null
--  drop table clientes;
-- create table clientes(
--  nombre varchar(30),
--  sexo char(1),--'f'=femenino, 'm'=masculino
--  edad int,
--  domicilio varchar(30)
-- );
-- go
----2- Ingrese los siguientes registros:
-- insert into clientes values('Maria Lopez','f',45,'Colon 123');
-- insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
-- insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
-- insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
-- insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
-- insert into clientes values('Federico Pereyra','m',38,'Colon 234');
-- insert into clientes values('Juan Garcia','m',50,'Peru 333');

----3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
----masculino. Use un  "cross join" (12 registros)
--		select * from clientes
--		--
--		select cm.nombre,cm.edad,cv.nombre,cv.edad
--		  from clientes as cm
--		  cross join clientes cv
--		  where cm.sexo='f' and cv.sexo='m';
--		  --
--		select c1.nombre , c1.sexo , c2.nombre , c2.sexo from clientes as c1
--			cross join clientes as c2
--				where c1.sexo = 'f' and c2.sexo = 'm' 
----4- Obtenga la misma salida anterior pero realizando un "join".
	
--		select * from clientes
--		--
--		select c1.nombre , c1.sexo , c2.nombre , c2.sexo from clientes as c1
--			cross join clientes as c2
--				where c1.sexo = 'f' and c2.sexo = 'm' 
--				--
--		select c1.nombre , c1.sexo ,c2.nombre , c2.sexo from clientes as c1
--			join clientes as c2
--				on c1.nombre <> c2.nombre
--					where c1.sexo = 'f' and c2.sexo='m'
	
----5- Realice la misma autocombinación que el punto 3 pero agregue la condición que las parejas no 
----tengan una diferencia superior a 5 años (5 registros)
--	select c1.nombre , c1.sexo ,c1.edad, c2.nombre , c2.sexo ,c2.edad 
--		from clientes as c1
--			cross join clientes as c2
--				where (c1.sexo = 'f' and c2.sexo = 'm') and 
--				(c1.edad - c2.edad between -5 and 5);
--				--
--				select cm.nombre,cm.edad,cv.nombre,cv.edad
--				  from clientes as cm
--				  cross join clientes cv
--				  where cm.sexo='f' and cv.sexo='m' and
--				  cm.edad-cv.edad between -5 and 5;
		-- ## EJERCICIO 2 ## --
--1- Elimine la tabla, si existe y créela nuevamente:
 if object_id('equipos') is not null
  drop table equipos;

 create table equipos(
  nombre varchar(30),
  barrio varchar(20),
  domicilio varchar(30),
  entrenador varchar(30)
 );

--2- Ingrese los siguientes registros:
 insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
 insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
 insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
 insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

--4- Cada equipo jugará con todos los demás 2 veces, una vez en cada sede. Realice un "cross join" 
--para combinar los equipos teniendo en cuenta que un equipo no juega consigo mismo (12 registros)
	select * from equipos
	select e1.nombre,e2.nombre,e1.barrio as 'sede'
	from equipos as e1
	 cross join equipos as e2
	 where e1.nombre<>e2.nombre;
		--
		select e1.nombre , e2.nombre , e1.barrio from equipos as e1
		cross join equipos as e2
			where e1.nombre <> e2.nombre

--5- Obtenga el mismo resultado empleando un "join".

		select e1.nombre , e2.nombre , e1.barrio from equipos as e1	
			join equipos as e2
				on e1.nombre <> e2.nombre 
--6- Realice un "cross join" para combinar los equipos para que cada equipo juegue con cada uno de los 
--otros una sola vez (6 registros)
		select * from equipos
			select e1.nombre,e2.nombre,e1.barrio as 'sede'
			from equipos as e1
			 cross join equipos as e2
			 where e1.nombre>e2.nombre;
			 --
			  select e1.nombre,e2.nombre,e1.barrio as 'sede'
				  from equipos as e1
				  cross join equipos as e2
				  where e1.nombre>e2.nombre;