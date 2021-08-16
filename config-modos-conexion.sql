-- @Autor García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 15/07/2021
--@Descripción: Configuracion y conexion en modo compartido

-- Creación de 2 dispatchers con protocolo TCP
alter system set dispatchers='(dispatchers=2)(protocol=tcp)';

-- Creación de 4 shared servers
alter system set shared_servers=5;

Prompt Dispatchers y Shared Servers configurados
show parameter dispatchers
show parameter shared_servers

-- Registrar servicios con el listener
alter system register;

--Añade el nuevo archivo de tnsnames
!cp tnsnames.ora /u01/app/oracle/product/19.3.0/dbhome_1/network/admin/tnsnames.ora

-- Mostrar servicios registrados en el listener
!lsnrctl services


Prompt Listo!
