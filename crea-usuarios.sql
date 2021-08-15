--@Autor  García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 15/07/2021
--@Descripción: Proyecto Final - Creacion de Usuarios y roles

Prompt Conectando como sysdba
connect sys/system as sysdba

--Estos usuarios se encargarán de administrar los TBS de su módulo
--correspondiente
Prompt Creando usuario gimnasios_admin
create user gimnasios_admin identified by gimnasios
default tablespace administracion_tbs quota unlimited on administracion_tbs;

Prompt Creando usuario clientes_admin
create user clientes_admin identified by clientes
default tablespace clientes_tbs quota unlimited on clientes_tbs;


Prompt Creando rol admin
create role rol_admin;

grant create session, create table, create view, create procedure,
  create sequence, create trigger, create index to rol_admin;

Prompt Asignamos rol a los usuarios
grant rol_admin to gimnasios_admin;
grant rol_admin to clientes_admin;


alter user gimnasios_admin quota unlimited on administracion_idx_tbs;
alter user gimnasios_admin quota unlimited on administracion_blob_tbs;

alter user clientes_admin  quota unlimited on clientes_idx_tbs;
alter user clientes_admin  quota unlimited on clientes_blob_tbs;
alter user clientes_admin  quota unlimited on clientes_ecnrypt_tbs;
