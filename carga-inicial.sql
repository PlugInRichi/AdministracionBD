-- @Autor García García Ricardo - Humberto Serafín Castillo López
-- @Fecha creación: 16/07/2021
-- @Descripción: Script para realizar la carga inicial de datos

--si ocurre un error, se hace rollback de los datos y
--se sale de SQL *Plus
whenever sqlerror exit rollback

-- Sesión del módulo de administración de gimnasios
connect administrador_gimnasios/gimnasios
alter session set nls_date_format='dd/mm/yyyy';

prompt Cargando datos del módulo de Administración
alter table puesto nologging;
@carga-inicial/puesto.sql
alter table puesto logging;

alter table disciplina nologging;
@carga-inicial/disciplina.sql
alter table disciplina logging;

alter table estatus nologging;
@carga-inicial/estatus.sql
alter table estatus logging;

alter table tipo_dispositivo nologging;
@carga-inicial/tipo_dispositivo.sql
alter table tipo_dispositivo logging;

alter table gimnasio nologging;
@carga-inicial/gimnasio.sql
alter table gimnasio logging;

alter table empleado nologging;
@carga-inicial/empleado.sql
alter table empleado logging;

alter table administrativo nologging;
@carga-inicial/administrativo.sql
alter table administrativo logging;

alter table sala nologging;
@carga-inicial/sala.sql
alter table sala logging;

alter table dispositivo nologging;
@carga-inicial/dispositivo.sql
alter table dispositivo logging;

alter table historial_dispositivo nologging;
@carga-inicial/historial_dispositivo.sql
alter table historial_dispositivo logging;

alter table huella_empleado nologging;
@carga-inicial/huella_empleado.sql
alter table huella_empleado logging;

alter table instructor nologging;
@carga-inicial/instructor.sql
alter table instructor logging;

alter table multimedia nologging;
@carga-inicial/multimedia.sql
alter table multimedia logging;

alter table sala_disciplina nologging;
@carga-inicial/sala_disciplina.sql
alter table sala_disciplina logging;

alter table trayectoria_instructor nologging;
@carga-inicial/trayectoria_instructor.sql
alter table trayectoria_instructor logging;

-- Sesión del módulo de administración de clientes
connect administrador_clientes/clientes
alter session set nls_date_format='dd/mm/yyyy';
alter session set nls_timestamp_format='YYYY-MM-DD HH24:MI:SS';

prompt Cargando datos del módulo de clientes
alter table cliente nologging;
@carga-inicial/cliente.sql
alter table cliente logging;

alter table sensor nologging;
@carga-inicial/sensor.sql
alter table sensor logging;

alter table sesion nologging;
@carga-inicial/sesion.sql
alter table sesion logging;

alter table bitacora nologging;
@carga-inicial/bitacora.sql
alter table bitacora logging;

alter table credencial nologging;
@carga-inicial/credencial.sql
alter table credencial logging;

alter table reporte nologging;
@carga-inicial/reporte.sql
alter table reporte logging;

alter table sesion_dispositivo nologging;
@carga-inicial/sesion_dispositivo.sql
alter table sesion_dispositivo logging;

prompt confirmando cambios
commit;

--Si se encuentra un error, no se sale de SQL *Plus
--no se hace commit ni rollback, es decir, se
--regresa al estado original.
whenever sqlerror continue none

Prompt Listo!
