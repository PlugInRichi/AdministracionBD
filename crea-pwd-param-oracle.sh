# @Autor García García Ricardo - Humberto Serafín Castillo López
# @Fecha 3/07/2021
# @Descripcion: Creación del archivo de passwords y archivo de parámetros
#               Ejecutar como usuario oracle

#Se crea variable de entorno
echo "Creando variable de entorno ORACLE_SID..."
export ORACLE_SID=gacaproy

rutaArchivoPass=$ORACLE_HOME/dbs/orapwgacaproy
rutaArchivoParam=$ORACLE_HOME/dbs/initgacaproy.ora
rutaArchivoSqlnet=$ORACLE_HOME/network/admin/sqlnet.ora

orapwd FILE=$rutaArchivoPass \
  force=y \
  FORMAT=12.2 \
  SYS=password \
  SYSBACKUP=password

echo "
db_name=gacaproy
control_files = (/u01/app/oracle/oradata/GACAPROY/disk_1/control01.ctl,
                 /u01/app/oracle/oradata/GACAPROY/disk_3/control02.ctl,
                 /u01/app/oracle/oradata/GACAPROY/disk_4/control03.ctl)
memory_target=768M
" > $rutaArchivoParam

echo "
ENCRYPTION_WALLET_LOCATION=
 (SOURCE=
  (METHOD=file)
   (METHOD_DATA=
    (DIRECTORY=$ORACLE_BASE/oradata/GACAPROY/disk_1/wallets)))
" > $rutaArchivoSqlnet
