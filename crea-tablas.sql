--@Autor  García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 16/07/2021
--@Descripción: Creación de tablas

prompt Conectando como administrador_gimnasios
connect administrador_gimnasios/gimnasios
start administracion-ddl.sql

prompt Conectando como sys as sysdba
connect sys/system as sysdba

prompt Otorgando permisos para crear referencias en otras tablas
grant references on administrador_gimnasios.dispositivo to administrador_clientes;
grant references on administrador_gimnasios.instructor to administrador_clientes;
grant references on administrador_gimnasios.sala to administrador_clientes;

prompt Conectando como administrador_clientes
connect administrador_clientes/clientes
start clientes-ddl.sql
