--@Autor  García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 03/07/2021
--@Descripción: Creación de tablespaces


--Distintas unidades de almacenamiento para que si se cae uno no afecte el
--funcionamiento del otro TBS, además evitamos congestión

--Todas generan datos redo
--Todas puedan autoexpandirse
--Localy managed por default
--Extensiones de longitud variable? Bueno si los registros serán de long variable
--Segment porque lo recomienda xd

prompt Conectando como usuario sys
connect sys/system as sysdba

prompt Abrir el WALLET para tablespaces encriptados

alter system set encryption wallet open identified by "wallet_password";

--Tablespace módulo Administración
create tablespace administracion_tbs
 datafile '/u01/app/oracle/oradata/GACAPROY/disk_6/administracion_tbs.dbf ' size 10m
 autoextend on next 10m
 extent management local autoallocate
 segment space management auto;

create tablespace administracion_idx_tbs
  datafile '/u01/app/oracle/oradata/GACAPROY/disk_6/administracion_idx_tbs.dbf ' size 5m
  autoextend on next 10m
  extent management local autoallocate
  segment space management auto;

create bigfile tablespace administracion_blob_tbs
  datafile '/u01/app/oracle/oradata/GACAPROY/disk_6/administracion_blob_tbs.dbf ' size 100m
  autoextend on next 10m
  extent management local autoallocate
  segment space management auto;




--Tablespace módulo Clientes
create tablespace clientes_tbs
 datafile '/u01/app/oracle/oradata/GACAPROY/disk_7/clientes_tbs_01.dbf' size 10m
          autoextend on next 10m,
          '/u01/app/oracle/oradata/GACAPROY/disk_8/clientes_tbs_02.dbf' size 10m
          autoextend on next 10m
 extent management local autoallocate
 segment space management auto;

create tablespace clientes_idx_tbs
 datafile '/u01/app/oracle/oradata/GACAPROY/disk_7/clientes_idx_tbs.dbf' size 5m
 autoextend on next 5m
 extent management local autoallocate
 segment space management auto;

 --drop tablespace clientes_blob_tbs including contents and datafiles;
create bigfile tablespace clientes_blob_tbs
 datafile '/u01/app/oracle/oradata/GACAPROY/disk_8/clientes_blob_tbs.dbf ' size 100m
 autoextend on next 10m
 extent management local autoallocate
 segment space management auto;

--Tablespace encriptado para datos personales
 create tablespace clientes_ecnrypt_tbs
  datafile '/u01/app/oracle/oradata/GACAPROY/disk_7/datos_personales_tbs.dbf ' size 10m
  autoextend on next 10m
  extent management local autoallocate
  segment space management auto
  encryption using 'aes256' encrypt;
