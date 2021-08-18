-- @Autor García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 15/07/2021
--@Descripción: Script para crear nuevos grupos de REDO.
--              Se multiplexan archivos en la FRA

-- Conexión como usuario sys
prompt Conectando como sys
connect sys/system as sysdba

prompt Creando grupos de REDO
-- Se crean tres nuevos grupos de REDO en la FRA
alter database add logfile group 4 size 50m;
alter database add logfile group 5 size 50m;
alter database add logfile group 6 size 50m;

-- Se añaden nuevos miembros de REDO en cada grupo
alter database add
  logfile member '/u01/app/oracle/oradata/GACAPROY/disk_3/redo04a.log'
  to group 4;
alter database add
  logfile member '/u01/app/oracle/oradata/GACAPROY/disk_4/redo04b.log'
  to group 4;

alter database add
  logfile member '/u01/app/oracle/oradata/GACAPROY/disk_3/redo05a.log'
  to group 5;
alter database add
  logfile member '/u01/app/oracle/oradata/GACAPROY/disk_4/redo05b.log'
  to group 5;

alter database add
  logfile member '/u01/app/oracle/oradata/GACAPROY/disk_3/redo06a.log'
  to group 6;
alter database add
  logfile member '/u01/app/oracle/oradata/GACAPROY/disk_4/redo06b.log'
  to group 6;

-- Se realiza un log switch forzado a los nuevos grupos
alter system switch logfile;

-- Se hace un checkpoint manual para inactivar todos los grupos de REDO
alter system checkpoint;

prompt Eliminando grupos de REDO obsoletos
-- Se eliminan los grupos antiguos
alter database drop logfile group 1;
alter database drop logfile group 2;
alter database drop logfile group 3;

-- Se borran los archivos obsoletos con el sistema operativo
