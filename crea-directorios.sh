# @Autor  García García Ricardo -
# @Fecha 3/08/2021
# @Descripcion Proyecto Final - Creación de directorios

echo "Creación de carpeta base"
base=$ORACLE_BASE/oradata/GACAPROY
mkdir $base
chown oracle:oinstall $base
chmod 755 $base

echo "Creación de puntos de montaje"
cd $base

#Crea archivos binarios
dd if=/dev/zero of=disk1.img bs=100M count=10
dd if=/dev/zero of=disk2.img bs=100M count=10
dd if=/dev/zero of=disk3.img bs=100M count=10

#Comprueba la creación de los discos
numImg=$(du -sh disk*.img | wc -l)
if [ $numImg -ne 3 ]; then
  echo "No se pudieron crear todos los archivos"
  exit 1
fi

#Asocia los loop-devices con sus respectivos archivos binarios
losetup -fP disk1.img
losetup -fP disk2.img
losetup -fP disk3.img

#Dar formato a los archivos creados
mkfs.ext4 disk1.img
mkfs.ext4 disk2.img
mkfs.ext4 disk3.img

#Creación de directorios
mkdir  disk_1
mkdir  disk_2
mkdir  disk_3

#Añadir las líneas a /etc/fstab
#/u01/app/oracle/oradata/GACAPROY/disk1.img     /u01/app/oracle/oradata/GACAPROY/disk_1    auto    loop    0 0
#/u01/app/oracle/oradata/GACAPROY/disk2.img     /u01/app/oracle/oradata/GACAPROY/disk_2    auto    loop    0 0
#/u01/app/oracle/oradata/GACAPROY/disk3.img     /u01/app/oracle/oradata/GACAPROY/disk_3    auto    loop    0 0
