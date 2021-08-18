-- @Autor García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 15/07/2021
--@Descripción: Script para habilitar el modo archivelog en la BD

-- Conexión como usuario sys
prompt Conectando como sys...
connect sys/system as sysdba

-- Se respalda el SPFILE
create pfile='/u01/app/oracle/oradata/GACAPROY/disk_9/gacaspfile0.bkp'
from spfile;

prompt Configurando parámetros del modo archivelog
-- Se establecen 5 procesos ARCn
alter system set log_archive_max_processes=5 scope=spfile;

-- Se configuran los destinos de archivos
-- Disco dedicado para archivelogs
alter system set log_archive_dest_1=
  'LOCATION=/u01/app/oracle/oradata/GACAPROY/disk_5 MANDATORY' scope=spfile;
-- Copia en la FRA
alter system set log_archive_dest_2='LOCATION=USE_DB_RECOVERY_FILE_DEST'
scope=spfile;

-- Se configura el formato de nombrado
alter system set log_archive_format='arch_gacaproy_%t_%s_%r.arc' scope=spfile;

-- Estable como mínimo una Copia para que le proceso de archivado sea exitoso
alter system set log_archive_min_succeed_dest=1 scope=spfile;

-- Se activa el modo archivelog
prompt Reiniciando la instancia...
shutdown immediate
startup mount
alter database archivelog;
alter database open;

-- Se comprueba que se ha activado el modo archivelog
prompt Comprobando modo de la base de datos...
archive log list

-- Se realiza un nuevo respaldo del spfile en la FRA
create pfile='/u01/app/oracle/oradata/GACAPROY/disk_9/gacaspfile1.bkp'
from spfile;
