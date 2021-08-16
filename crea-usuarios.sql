--@Autor  García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 15/07/2021
--@Descripción: Proyecto Final - Creacion de Usuarios y roles

Prompt Conectando como sysdba
connect sys/system as sysdba

--Estos usuarios se encargarán de administrar los TBS de su módulo
--correspondiente
Prompt Creando usuario administrador_gimnasios
create user administrador_gimnasios identified by gimnasios
default tablespace administracion_tbs quota unlimited on administracion_tbs;

Prompt Creando usuario administrador_clientes
create user administrador_clientes identified by clientes
default tablespace clientes_tbs quota unlimited on clientes_tbs;


Prompt Creando rol admin
create role rol_admin;

grant create session, create table, create view, create procedure,
  create sequence, create trigger to rol_admin;


Prompt Asignamos rol a los usuarios
grant rol_admin to administrador_gimnasios;
grant rol_admin to administrador_clientes;


alter user administrador_gimnasios quota unlimited on administracion_idx_tbs;
alter user administrador_gimnasios quota unlimited on administracion_blob_tbs;

alter user administrador_clientes  quota unlimited on clientes_idx_tbs;
alter user administrador_clientes  quota unlimited on clientes_blob_tbs;
alter user administrador_clientes  quota unlimited on clientes_ecnrypt_tbs;
