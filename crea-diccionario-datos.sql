-- @Autor García García Ricardo - Humberto Serafín Castillo López
--@Fecha creación: 15/07/2021
--@Descripción: Ejecuta los scripts necesarios para la creación de la BD

Prompt Ejecutando scripts de sys
connect sys/system as sysdba

@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

Prompt Ejecutando scripts de system
connect system/system

@?/sqlplus/admin/pupbld.sql
