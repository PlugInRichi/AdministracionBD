-- @Autor Ricardo García García
--        Humberto Serafín Castillo López
-- @Fecha 5/08/2021
-- @Descripcion: Creación de las tablas contenidas en el modulo
--               de administración

-- 
-- table: administrativo 
--

create table administrativo(
    empleado_id    number(10, 0)    not null,
    login          varchar2(20)     not null,
    password       varchar2(15)     not null,
    rol            varchar2(20)     not null,
    certificado    blob             not null,
    constraint pk5 primary key (empleado_id), 
    constraint refempleado31 foreign key (empleado_id)
    references empleado(empleado_id)
)
;



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
    constraint refsesion221 foreign key (sesion_id)
    references sesion(sesion_id),
    constraint refsensor241 foreign key (sensor_id)
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
    constraint refcliente151 foreign key (cliente_id)
    references cliente(cliente_id)
)
;



-- 
-- table: disciplina 
--

create table disciplina(
    disciplina_id    number(10, 0)    not null,
    clave            char(3)          not null,
    nombre           varchar2(20)     not null,
    descripción      varchar2(50)     not null,
    icono            blob             not null,
    constraint pk9 primary key (disciplina_id)
)
;



-- 
-- table: dispositivo 
--

create table dispositivo(
    dispositivo_id         number(10, 0)    not null,
    num_inventario         varchar2(18)     not null,
    nombre                 varchar2(20)     not null,
    fecha_adquisicion      date             not null,
    descripción            varchar2(50)     not null,
    sala_id                number(10, 0)    not null,
    tipo_dispositivo_id    number(10, 0)    not null,
    estatus_id             number(10, 0)    not null,
    constraint pk11 primary key (dispositivo_id), 
    constraint refsala121 foreign key (sala_id)
    references sala(sala_id),
    constraint reftipo_dispositivo131 foreign key (tipo_dispositivo_id)
    references tipo_dispositivo(tipo_dispositivo_id),
    constraint refestatus271 foreign key (estatus_id)
    references estatus(estatus_id)
)
;



-- 
-- table: empleado 
--

create table empleado(
    empleado_id         number(10, 0)    not null,
    nombre              varchar2(40)     not null,
    ap_paterno          varchar2(40)     not null,
    ap_materno          varchar2(40),
    curp                varchar2(18)     not null,
    num_trabajador      varchar2(10)     not null,
    rfc                 varchar2(13)     not null,
    fecha_nacimiento    date             not null,
    email               varchar2(30)     not null,
    foto                blob             not null,
    tipo                char(1)          not null,
    puesto_id           number(10, 0)    not null,
    gimnasio_id         number(10, 0)    not null,
    constraint pk3 primary key (empleado_id), 
    constraint refpuesto21 foreign key (puesto_id)
    references puesto(puesto_id),
    constraint refgimnasio261 foreign key (gimnasio_id)
    references gimnasio(gimnasio_id)
)
;



-- 
-- table: estatus 
--

create table estatus(
    estatus_id     number(10, 0)    not null,
    clave          char(1)          not null,
    descripcion    varchar2(40)     not null,
    constraint pk22 primary key (estatus_id)
)
;



-- 
-- table: gimnasio 
--

create table gimnasio(
    gimnasio_id    number(10, 0)    not null,
    folio          varchar2(5)      not null,
    nombre         varchar2(40)     not null,
    direccion      varchar2(40)     not null,
    latitud        varchar2(20)     not null,
    longitud       varchar2(20)     not null,
    telefono       varchar2(13)     not null,
    pagina_web     varchar2(40)     not null,
    gerente_id     number(10, 0)    not null,
    constraint pk1 primary key (gimnasio_id), 
    constraint refempleado71 foreign key (gerente_id)
    references empleado(empleado_id)
)
;



-- 
-- table: historial_dispositivo 
--

create table historial_dispositivo(
    historial_dispositivo_id    number(10, 0)    not null,
    fecha_registro              date             not null,
    dispositivo_id              number(10, 0)    not null,
    estatus_id                  number(10, 0)    not null,
    constraint pk13 primary key (historial_dispositivo_id), 
    constraint refdispositivo141 foreign key (dispositivo_id)
    references dispositivo(dispositivo_id),
    constraint refestatus281 foreign key (estatus_id)
    references estatus(estatus_id)
)
;



-- 
-- table: huella_empleado 
--

create table huella_empleado(
    huella_empleado_id    number(10, 0)    not null,
    huella                blob             not null,
    empleado_id           number(10, 0)    not null,
    constraint pk21 primary key (huella_empleado_id), 
    constraint refempleado251 foreign key (empleado_id)
    references empleado(empleado_id)
)
;



-- 
-- table: instructor 
--

create table instructor(
    empleado_id         number(10, 0)    not null,
    cedula              varchar2(8)      not null,
    años_experiencia    number(2, 0)     not null,
    suplente            number(10, 0),
    constraint pk6 primary key (empleado_id), 
    constraint refempleado41 foreign key (empleado_id)
    references empleado(empleado_id),
    constraint refinstructor51 foreign key (suplente)
    references instructor(empleado_id)
)
;



-- 
-- table: multimedia 
--

create table multimedia(
    multimedia_id    number(10, 0)    not null,
    tipo_archivo     char(1)          not null,
    vigencia         date             not null,
    fecha_fin        date             not null,
    gimnasio_id      number(10, 0)    not null,
    constraint pk2 primary key (multimedia_id), 
    constraint refgimnasio11 foreign key (gimnasio_id)
    references gimnasio(gimnasio_id)
)
;



-- 
-- table: puesto 
--

create table puesto(
    puesto_id      number(10, 0)    not null,
    clave          char(3)          not null,
    nombre         varchar2(40)     not null,
    descripcion    varchar2(80)     not null,
    constraint pk4 primary key (puesto_id)
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
    constraint refcliente231 foreign key (cliente_id)
    references cliente(cliente_id)
)
;



-- 
-- table: sala 
--

create table sala(
    sala_id             number(10, 0)    not null,
    clave               char(3)          not null,
    nombre              varchar2(40)     not null,
    capacidad           number(2, 0)     not null,
    administrador_id    number(10, 0)    not null,
    gimnasio_id         number(10, 0)    not null,
    constraint pk8 primary key (sala_id), 
    constraint refempleado81 foreign key (administrador_id)
    references empleado(empleado_id),
    constraint refgimnasio91 foreign key (gimnasio_id)
    references gimnasio(gimnasio_id)
)
;



-- 
-- table: sala_disciplina 
--

create table sala_disciplina(
    sala_disciplina_id    number(10, 0)    not null,
    disciplina_id         number(10, 0)    not null,
    sala_id               number(10, 0)    not null,
    constraint pk10 primary key (sala_disciplina_id), 
    constraint refsala101 foreign key (sala_id)
    references sala(sala_id),
    constraint refdisciplina111 foreign key (disciplina_id)
    references disciplina(disciplina_id)
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
    constraint refcliente161 foreign key (cliente_id)
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
    constraint refcliente201 foreign key (cliente_id)
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
    constraint refsesion181 foreign key (sesion_id)
    references sesion(sesion_id)
)
;



-- 
-- table: tipo_dispositivo 
--

create table tipo_dispositivo(
    tipo_dispositivo_id    number(10, 0)    not null,
    nombre                 varchar2(20)     not null,
    descripcion            varchar2(50)     not null,
    constraint pk12 primary key (tipo_dispositivo_id)
)
;



-- 
-- table: trayectoria_instructor 
--

create table trayectoria_instructor(
    tayectoria_instructor_id    number(10, 0)    not null,
    url                         varchar2(50)     not null,
    empleado_id                 number(10, 0)    not null,
    constraint pk7 primary key (tayectoria_instructor_id), 
    constraint refinstructor61 foreign key (empleado_id)
    references instructor(empleado_id)
)
;



