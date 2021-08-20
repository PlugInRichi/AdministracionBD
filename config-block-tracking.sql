-- @Autor García García Ricardo - Humberto Serafín Castillo López
-- @Fecha creación: 16/07/2021
-- @Descripción: Script para realizar la carga inicial de datos

-- Conexión como usuario sys
connect sys/system as sysdba

-- Activación del proceso Change Tracking Writer
alter database enable block change tracking using file
  '/u01/app/oracle/oradata/GACAPROY/disk_1/change_tracking.dbf';
