---### EJERCICIO 1 ###---
if object_id('agenda') is not null
  drop table agenda;
  create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Acosta','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Suarez','Susana','Gral. Paz 1234','4123456');
  select * from agenda
-- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro afectado)
	update agenda set nombre='JuanJose'
		where nombre='Juan'
	select * from agenda 
-- Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566" (2 registros afectados)
	update agenda set telefono='4445566'
		where telefono='4545454'
	select * from agenda 
-- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" (ningún registro afectado porque ninguno cumple con la condición del "where")
	update agenda set nombre='JuanJose'
		where nombre='Juan'
	select * from agenda 

---### EJERCICIO 2 ###---
 if object_id('libros') is not null
  drop table libros;
  create table libros (
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );
 insert into libros (titulo, autor, editorial, precio)
  values ('El aleph','Borges','Emece',25.00);
 insert into libros (titulo, autor, editorial, precio)
  values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Aprenda PHP','Mario Molina','Emece',45.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Cervantes y el quijote','Borges','Emece',25);
 insert into libros (titulo, autor, editorial, precio)
  values ('Matematica estas ahi','Paenza','Siglo XXI',15);
select * from libros
---Modifique los registros cuyo autor sea igual  a "Paenza", por "Adrian Paenza" 
UPDATE LIBROS SET autor='Adrian Paenza'
where autor = 'Paenza'
select * from libros
---Nuevamente, modifique los registros cuyo autor sea igual  a "Paenza", por "Adrian Paenza"
UPDATE LIBROS SET autor='Adrian Paenza'
where autor = 'Paenza'
select * from libros
---Actualice el precio del libro de "Mario Molina" a 27 pesos
UPDATE LIBROS SET precio= 27
where autor='Mario Molina'
select * from libros
---Actualice el valor del campo "editorial" por "Emece S.A.", para todos los registros cuya editorial sea igual a "Emece"
UPDATE LIBROS SET editorial= 'EMECE S.A'
where editorial='Emece'
select * from libros