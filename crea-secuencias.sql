-- @Autor García García Ricardo - Humberto Serafín Castillo López
-- @Fecha 17/07/2021
-- @Descripcion: Creación de secuencias

-- Secuencias para módulo de administración
connect administrador_gimnasios/gimnasios

-- multimedia
create sequence multimedia_seq
  start with 101
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- empleado
create sequence empleado_seq
  start with 1501
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- instructor
create sequence instructor_seq
  start with 1501
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- trayectoria_instructor
create sequence trayectoria_seq
  start with 101
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- dispositivo
create sequence dispositivo_seq
  start with 2001
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- historial_dispositivo
create sequence historial_seq
  start with 2001
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- Secuencias para módulo de clientes
connect administrador_clientes/clientes

-- cliente
create sequence cliente_seq
  start with 1501
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- reporte
create sequence reporte_seq
  start with 1001
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- sesion
create sequence sesion_seq
  start with 2001
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- bitacora
create sequence bitacora_seq
  start with 2001
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- sesion_dispositivo, sólo usada en campo sesion
create sequence ses_disp_seq
  start with 2001
  increment by 1
  nominvalue
  nomaxvalue
  cache 20 noorder;

-- sesion_dispositivo, sólo usada en campo dispositivo
create sequence multimedia_seq
  start with 1
  increment by 1
  maxvalue 2000
  cycle;
