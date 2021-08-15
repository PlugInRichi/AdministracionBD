# @Autor  García García Ricardo - Humberto Serafín Castillo López
# @Fecha 3/08/2021
# @Descripcion Proyecto Final - Creación de directorios. Ejecutar como root

echo "Creación de carpeta base"
base=$ORACLE_BASE/oradata/GACAPROY
mkdir $base
chown oracle:oinstall $base
chmod 750 $base

echo "Creación de puntos de montaje"
cd $base

#Directorio para wallets
mkdir -p disk_1/wallets
#Crea directorios para discos
mkdir disk_2 disk_3 disk_4 disk_5 disk_6 disk_7 disk_8 disk_9

#Comprueba la creación de los discos
numImg=$(ls | wc -l)
if [ $numImg -ne 9 ]; then
  echo "No se pudieron crear todos los archivos"
  exit 1
fi

#Cambia permisos y dueño de los directorios
chown -R oracle:oinstall disk_*
chmod -R 750 disk_*
