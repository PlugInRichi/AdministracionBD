-- @Autor García García Ricardo - Humberto Serafín Castillo López
-- @Fecha 10/08/2021
-- @Descripcion: Script para realizar la creación de un SPIFILE (archivo
--                binario)a partir de un archivo PFILE (archivo de texto).
--                Se debe haber inicializado ORACLE_SID con gacaproy

--Autenticación como usuario sys
connect sys/hola1234* as sysdba

--Inicio de instancia en modo nomount, no existe la base de datos
--que se iniciará
startup nomount

--Creación del archivo binario
create spfile from pfile;

--Verifica que se ha creado el SPIFILE
--! permite ejecuatar comandos del sistema operativo
!ls $ORACLE_HOME/dbs/spfilegacaproy.ora

-- Se detiene la instancia
shutdow immediate
