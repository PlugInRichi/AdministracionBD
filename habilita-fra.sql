-- @Autor García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 15/07/2021
--@Descripción: Script para habilitar la Fast Recovery Area (FRA) en la BD

-- Conexión como sys
connect sys/system as sysdba

-- Se establece tamaño de la FRA
-- Propuesta inicial, hay que recalcular después
alter system set db_recovery_file_dest_size=24G scope=both;

-- Se establece la ruta de la FRA
alter system set db_recovery_file_dest='/u01/app/oracle/oradata/GACAPROY/disk_2'
scope=both;

-- Se establece la política de retención de la FRA, hacer flashback al pasado
-- 10080 min = 7 dias
alter system set db_flashback_retention_target=10080 scope=both;
