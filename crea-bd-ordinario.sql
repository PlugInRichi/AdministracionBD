-- @Autor García García Ricardo - Humberto Serafín Castillo López
-- @Fecha 3/07/2021
-- @Descripcion: Crea la base de datos, hay que levantar la instancia como
-- nomount previo a la ejecución de este script

prompt Conectando como usuario sys
connect sys/hola1234* as sysdba

--Se inicia la instancia en modo nomount
startup nomount

whenever sqlerror exit rollback;

prompt Creando base de datos

create database gacaproy
user sys identified by system
user system identified by system
logfile group 1 (
'/u01/app/oracle/oradata/GACAPROY/disk_3/redo01a.log',
'/u01/app/oracle/oradata/GACAPROY/disk_4/redo01b.log') size 50m blocksize 512,
group 2 (
'/u01/app/oracle/oradata/GACAPROY/disk_3/redo02a.log',
'/u01/app/oracle/oradata/GACAPROY/disk_4/redo02b.log') size 50m blocksize 512,
group 3 (
'/u01/app/oracle/oradata/GACAPROY/disk_3/redo03a.log',
'/u01/app/oracle/oradata/GACAPROY/disk_4/redo03b.log') size 50m blocksize 512
maxloghistory 1
maxlogfiles 16
maxlogmembers 3
maxdatafiles 1024
character set AL32UTF8
national character set AL16UTF16
extent management local
  --tablespace para system
  datafile '/u01/app/oracle/oradata/GACAPROY/disk_1/system01.dbf'
    size 700m reuse autoextend on next 10240k maxsize unlimited
  --tablespace auxiliar
  sysaux datafile '/u01/app/oracle/oradata/GACAPROY/disk_1/sysaux01.dbf'
    size 550m reuse autoextend on next 10240k maxsize unlimited
  --tablespace default
  default tablespace users
    datafile '/u01/app/oracle/oradata/GACAPROY/disk_1/users01.dbf'
    size 100m reuse autoextend on maxsize unlimited
  --tablespace temporal
  default temporary tablespace temptbs1
    tempfile '/u01/app/oracle/oradata/GACAPROY/disk_1/temp01.dbf'
    size 20m reuse autoextend on next 640k maxsize unlimited
  --tablespace para datos undo
  undo tablespace undotbs1
    datafile '/u01/app/oracle/oradata/GACAPROY/disk_1/undotbs01.dbf'
    size 200m reuse autoextend on next 5120k maxsize unlimited;

prompt Actualizando contraseñas
-- Actualiza contraseña de sys
alter user sys identified by system;
-- Actualiza contraseña de sysbackup
alter user sysbackup identified by system;
-- Desbloquea al usuario
alter user sysbackup identified by system account unlock;

prompt Creando wallet
-- Creamos el Wallet
alter system set encryption key identified by "wallet_password";

-- Se reinicia la BD
-- shutdown immediate
-- startup mount
-- Abrimos el Wallet, requerido despues de cada reinicio
-- alter system set encryption wallet open identified by "wallet_password";
-- Para cerrar el wallet
-- ALTER SYSTEM SET ENCRYPTION WALLET CLOSE IDENTIFIED BY "wallet_password";
