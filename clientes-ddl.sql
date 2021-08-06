-- @Autor Ricardo García García
--        Humberto Serafín Castillo López
-- @Fecha 5/08/2021
-- @Descripcion: Creación de las tablas contenidas en el modulo
--               de clientes

--  
-- table: bitacora 
--

create table bitacora(
    bitacora_id    number(10, 0)    not null,
    num_minuto     number(10, 0)    not null,
    calorias       number(4, 0)     not null,
    sensor_id      varchar2(40)     not null,
    sesion_id      number(10, 0)    not null,
    constraint pk19 primary key (bitacora_id), 
    constraint refsesion51 foreign key (sesion_id)
    references sesion(sesion_id),
    constraint refsensor71 foreign key (sensor_id)
    references sensor(sensor_id)
)
;



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
    constraint pk14 primary key (cliente_id)
)
;



-- 
-- table: credencial 
--

create table credencial(
    credencial_id    number(10, 0)    not null,
    folio            varchar2(8)      not null,
    vigencia         date             not null,
    codigo_barras    blob             not null,
    cliente_id       number(10, 0)    not null,
    constraint pk15 primary key (credencial_id), 
    constraint refcliente11 foreign key (cliente_id)
    references cliente(cliente_id)
)
;



-- 
-- table: reporte 
--

create table reporte(
    reporte_id        number(10, 0)    not null,
    fecha_medicion    timestamp(6)     not null,
    peso              number(5, 2)     not null,
    masa_corporal     number(5, 2)     not null,
    estatura          number(4, 1),
    cliente_id        number(10, 0),
    constraint pk20 primary key (reporte_id), 
    constraint refcliente61 foreign key (cliente_id)
    references cliente(cliente_id)
)
;



-- 
-- table: sensor 
--

create table sensor(
    sensor_id       varchar2(40)     not null,
    num_serie       varchar2(20)     not null,
    fecha_compra    date             not null,
    marca           varchar2(20)     not null,
    cliente_id      number(10, 0),
    constraint pk16 primary key (sensor_id), 
    constraint refcliente21 foreign key (cliente_id)
    references cliente(cliente_id)
)
;



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
    constraint pk17 primary key (sesion_id), 
    constraint refcliente41 foreign key (cliente_id)
    references cliente(cliente_id)
)
;



-- 
-- table: sesion_dispositivo 
--

create table sesion_dispositivo(
    sesion_dispositivo_id    number(10, 0)    not null,
    dispositivo_id           number(10, 0)    not null,
    sesion_id                number(10, 0)    not null,
    constraint pk18 primary key (sesion_dispositivo_id), 
    constraint refsesion31 foreign key (sesion_id)
    references sesion(sesion_id)
)
;



