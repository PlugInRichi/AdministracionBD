


--Distintas unidades de almacenamiento para que si se cae uno no afecte el
--funcionamiento del otro TBS, además evitamos congestión

--Todas generan datos redo01a
--Todas puedan autoexpandirse
--Localy managed por default
--Extensiones de longitud variable? Bueno si los registros serán de long variable
--Segment porque lo recomienda xd
create tablespace administracion_tbs
 datafile '/u01/app/oracle/oradata/GACAPROY/disk_2/administracion_tbs.dbf ' size 10m
 autoextend on next 10m
 extent management local autoallocate
 segment space management auto;

 create tablespace administracion_idx_tbs
  datafile '/u01/app/oracle/oradata/GACAPROY/disk_2/administracion_idx_tbs.dbf ' size 10m
  autoextend on next 10m
  extent management local autoallocate
  segment space management auto;


create tablespace clientes_tbs
 datafile '/u01/app/oracle/oradata/GACAPROY/disk_2/clientes_tbs.dbf ' size 10m
 autoextend on next 10m
 extent management local autoallocate
 segment space management auto;

create tablespace clientes_idx_tbs
 datafile '/u01/app/oracle/oradata/GACAPROY/disk_2/clientes_idx_tbs.dbf ' size 10m
 autoextend on next 10m
 extent management local autoallocate
 segment space management auto;



--Opciones:
 reuse autoextend on next 1m maxsize 30m
 nologging
 blocksize 8k
 offline
 extent management local uniform size 64k
 segment space management auto;

 reuse autoextend on next 1m maxsize 30m
 nologging
 blocksize 8k
 offline
 extent management local uniform size 64k
 segment space management auto;

 autoextend off
 extent management local autoallocate
 segment space management auto;

 datafile '/u01/app/oracle/oradata/RGGBDA2/store_tbs_multiple_01.dbf' size 10m
           autoextend off,
          '/u01/app/oracle/oradata/RGGBDA2/store_tbs_multiple_02.dbf' size 10m
           autoextend off,
          '/u01/app/oracle/oradata/RGGBDA2/store_tbs_multiple_03.dbf' size 10m
           autoextend off
 extent management local autoallocate
 segment space management auto;

 create user store_user identified by store_user default tablespace STORE_TBS1 quota unlimited on STORE_TBS1;
grant create session, create table to store_user;
