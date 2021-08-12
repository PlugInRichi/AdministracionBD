-- @Autor Ricardo García García
--        Humberto Serafín Castillo López
-- @Fecha 5/08/2021
-- @Descripcion: Creación de las tablas contenidas en el modulo
--               de clientes

-- 
-- table: cliente 
--
create table cliente(
  cliente_id          number(10, 0)    not null,
  nombre              varchar2(40)     not null,
  ap_paterno          varchar2(40)     not null,
  ap_materno          varchar2(40),
  email               varchar2(40)     not null,
  username            varchar2(20)     not null,
  password            varchar2(15)     not null,
  direccion           varchar2(50)     not null,
  fecha_nacimiento    date             not null,
  curp                varchar2(18)     not null,
  foto                blob             not null,
  constraint cliente_pk primary key (cliente_id) 
  using index (
    create unique index cliente_pk on cliente(cliente_id)
    tablespace clientes_idx_tbs
  )
)
tablespace clientes_tbs;

-- 
-- table: sensor 
--
create table sensor(
  sensor_id       varchar2(40)     not null,
  num_serie       varchar2(20)     not null,
  fecha_compra    date             not null,
  marca           varchar2(20)     not null,
  cliente_id      number(10, 0),
  constraint sensor_pk primary key (sensor_id) 
  using index (
    create unique index sensor_pk on sensor(sensor_id)
    tablespace clientes_idx_tbs
  ), 
  constraint sensor_cliente_id_fk foreign key (cliente_id)
  references cliente(cliente_id)
)
tablespace clientes_tbs;

-- 
-- table: sesion 
--
create table sesion(
  sesion_id        number(10, 0)    not null,
  num_sesion       number(10, 0)    not null,
  fecha_inicio     date             not null,
  duracion         number(3, 0)     not null,
  en_linea         number(1, 0)     not null,
  cliente_id       number(10, 0)    not null,
  instructor_id    number(10, 0)    not null,
  sala_id          number(10, 0),
  constraint sesion_pk primary key (sesion_id) 
  using index(
    create unique index sesion_pk on sesion(sesion_id)
    tablespace clientes_idx_tbs
  ), 
  constraint sesion_cliente_id_fk foreign key (cliente_id)
  references cliente(cliente_id)
)
tablespace clientes_tbs;

--  
-- table: bitacora 
--
create table bitacora(
  bitacora_id    number(10, 0)    not null,
  num_minuto     number(10, 0)    not null,
  calorias       number(4, 0)     not null,
  sensor_id      varchar2(40)     not null,
  sesion_id      number(10, 0)    not null,
  constraint bitacora_pk primary key (bitacora_id) 
  using index (
    create unique index bitacora_pk on bitacora(bitacora_id)
    tablespace clientes_idx_tbs
  ), 
  constraint bitacora_sesion_id_fk foreign key (sesion_id)
  references sesion(sesion_id),
  constraint bitacora_sensor_id_fk foreign key (sensor_id)
  references sensor(sensor_id)
)
tablespace clientes_tbs;



-- 
-- table: credencial 
--
create table credencial(
  credencial_id    number(10, 0)    not null,
  folio            varchar2(8)      not null,
  vigencia         date             not null,
  codigo_barras    blob             not null,
  cliente_id       number(10, 0)    not null,
  constraint credencial_pk primary key (credencial_id) 
  using index (
    create unique index credencial_pk on credencial(credencial_id)
    tablespace clientes_idx_tbs
  ), 
  constraint credencial_cliente_id_fk foreign key (cliente_id)
  references cliente(cliente_id)
)
tablespace clientes_tbs;

-- 
-- table: reporte 
--
create table reporte(
  reporte_id        number(10, 0)    not null,
  fecha_medicion    timestamp(6)     not null,
  peso              number(5, 2)     not null,
  masa_corporal     number(5, 2)     not null,
  estatura          number(4, 1),
  cliente_id        number(10, 0)    not null,
  constraint reporte_pk primary key (reporte_id) 
  using index (
    create unique index reporte_pk on reporte(reporte_id)
    tablespace clientes_idx_tbs
  ), 
  constraint reporte_cliente_id_fk foreign key (cliente_id)
  references cliente(cliente_id)
)
tablespace clientes_tbs;



-- 
-- table: sesion_dispositivo 
--
create table sesion_dispositivo(
  sesion_id                number(10, 0)    not null,
  dispositivo_id           number(10, 0)    not null,
  constraint sesion_dispositivo_pk primary key (sesion_id, dispositivo_id)
  using index (
    create unique index sesion_dispositivo_pk 
    on sesion_dispositivo(sesion_id, dispositivo_id)
    tablespace clientes_idx_tbs
  ), 
  constraint se_di_sesion_id_fk foreign key (sesion_id)
  references sesion(sesion_id)
)
tablespace clientes_tbs;