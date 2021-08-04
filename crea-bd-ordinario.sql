-- @Autor Ricardo García García
-- @Fecha 3/07/2021
-- @Descripcion: Crea la base de datos, hay que levantar la instancia como
-- nomount previo a la ejecución de este script

connect sys/hola1234* as sysdba
whenever sqlerror exit rollback;

create database gacaproy
user sys identified by system
user sysbackup identified by system
logfile group 1 (
'/u01/app/oracle/oradata/GACAPROY/disk_1/redo01a.log',
'/u01/app/oracle/oradata/GACAPROY/disk_2/redo01b.log',
'/u01/app/oracle/oradata/GACAPROY/disk_3/redo01c.log') size 50m blocksize 512,
group 2 (
'/u01/app/oracle/oradata/GACAPROY/disk_1/redo02a.log',
'/u01/app/oracle/oradata/GACAPROY/disk_2/redo02b.log',
'/u01/app/oracle/oradata/GACAPROY/disk_3redo02c.log') size 50m blocksize 512,
group 3 (
'/u01/app/oracle/oradata/GACAPROY/disk_1/redo03a.log',
'/u01/app/oracle/oradata/GACAPROY/disk_2/redo03b.log',
'/u01/app/oracle/oradata/GACAPROY/disk_3/redo03c.log') size 50m blocksize 512
maxloghistory 1
maxlogfiles 16
maxlogmembers 3
maxdatafiles 1024
character set AL32UTF8
national character set AL16UTF16

extent management local
datafile '/u01/app/oracle/oradata/GACAPROY/system01.dbf'
size 700m reuse autoextend on next 10240k maxsize unlimited

sysaux datafile '/u01/app/oracle/oradata/GACAPROY/sysaux01.dbf'
size 550m reuse autoextend on next 10240k maxsize unlimited

default tablespace users
datafile '/u01/app/oracle/oradata/GACAPROY/users01.dbf'
size 500m reuse autoextend on maxsize unlimited

default temporary tablespace tempts1
tempfile '/u01/app/oracle/oradata/GACAPROY/temp01.dbf'
size 20m reuse autoextend on next 640k maxsize unlimited

undo tablespace undotbs1
datafile '/u01/app/oracle/oradata/GACAPROY/undotbs01.dbf'
size 200m reuse autoextend on next 5120k maxsize unlimited;

alter user sys identified by system;
alter user sysbackup identified by system;
