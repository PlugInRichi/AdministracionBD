# @Autor Ricardo García García
# @Fecha 3/07/2021
# @Descripcion:

rutaArchivoPass=$ORACLE_HOME/dbs/orapwgacaproy
rutaArchivoParam=$ORACLE_HOME/dbs/orapwgacaproy.ora

orapwd FILE=$rutaArchivoPass \
  force=y \
  FORMAT=12.2 \
  SYS=password \

echo "
db_name=gacaproy
control_files = (/u01/app/oracle/oradata/GACAPROY/disk_1/control01.ctl,
                 /u01/app/oracle/oradata/GACAPROY/disk_2/control02.ctl,
                 /u01/app/oracle/oradata/GACAPROY/disk_3/control03.ctl)
memory_target=768M
" > $rutaArchivoParam
