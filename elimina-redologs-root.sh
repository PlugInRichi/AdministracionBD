# @Autor García García Ricardo - Humberto Serafín Castillo López
# @Fecha creación: 15/07/2021
# @Descripción:   Elimina los archivos redo log a nivel físico.
#                 Se ejecuta como usuario root

echo "Eliminando archivos obsoletos"

# Elimina archivos de grupo 1
rm /u01/app/oracle/oradata/GACAPROY/disk_3/redo01a.log
rm /u01/app/oracle/oradata/GACAPROY/disk_4/redo01b.log

# Elimina archivos de grupo 2
rm /u01/app/oracle/oradata/GACAPROY/disk_3/redo02a.log
rm /u01/app/oracle/oradata/GACAPROY/disk_4/redo02b.log

# Elimina archivos de grupo 3
rm /u01/app/oracle/oradata/GACAPROY/disk_3/redo03a.log
rm /u01/app/oracle/oradata/GACAPROY/disk_4/redo03b.log
