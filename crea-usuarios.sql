--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/02/2021
--@Descripción: Proyecto Final - Creacion de Usuarios y roles

Prompt Conectando como sysdba
connect sys/system2 as sysdba

--Estos usuarios se encargarán de administrar los TBS de su módulo
--correspondiente
Prompt Creando usuario administrador_gimnasios
create user administrador_gimnasios identified by gimnasios
default tablespace administracion_tbs quota unlimited on administracion_tbs;

Prompt Creando usuario administrador_clientes
create user administrador_clientes identified by clientes
default tablespace clientes_tbs quota unlimited on clientes_tbs;

--Estos usuarios se encargarán de hacer registros en sus respectivos módulos,
--son ejemplos, podrían crearse más

Prompt Creando usuario cliente_01
create user cliente_01 identified by cliente
default tablespace clientes_tbs quota unlimited on clientes_tbs;

Prompt Creando usuario gimnasio_01
create user gimnasio_01 identified by gimnasio
default tablespace administracion_tbs quota unlimited on administracion_tbs;

--create role user;
--grant select, insert, update, delete on

--Creación de roles
--Eliminado rol admin en caso de existir


Prompt Creando rol admin
create role rol_admin;

grant create session, create table, create view, create procedure,
  create sequence, create trigger, create index to rol_admin;

Prompt Asignamos rol a los usuarios
grant rol_admin to administrador_gimnasios;
grant rol_admin to administrador_clientes;


--Permisos para los índices 
