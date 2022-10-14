if object_id('usuarios') is not null
  drop table usuarios;

create table usuarios(
  nombre varchar(20),
  clave varchar(10)
);

go

insert into usuarios (nombre,clave)
  values ('Marcelo','River');
insert into usuarios (nombre,clave)
  values ('Susana','chapita');
insert into usuarios (nombre,clave)
  values ('Carlosfuentes','Boca');
insert into usuarios (nombre,clave)
  values ('Federicolopez','Boca');
  SELECT * FROM usuarios 
  --- Cambiamos las claves por real madrid
	update usuarios set clave='Realmadrid'
	Select * from usuarios
  --- Cambiamos las claves del nombre FedericoLopez por Boca
	update usuarios set clave='Boca'
	where nombre='FedericoLopez'
	select * from usuarios 
  --- Cambiamos la clave del nombre JuanaJuarez por payaso
	update usuarios set clave='payaso'
	where nombre='JuanaJuarez'
	select * from usuarios
  --- Cambiamos el nombre marcelo y su clave por Maceloduarte y clave Marce
	update usuarios set nombre='MarceloDuarte' , clave='Marce'
	where nombre ='Marcelo'
	select * from usuarios