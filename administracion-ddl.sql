--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      modulo_administracion.DM1
--
-- Date Created : Friday, August 06, 2021 00:15:41
-- Target DBMS : Oracle 11g
--

--
-- table: puesto
--
create table puesto(
  puesto_id      number(10, 0)    not null,
  clave          char(3)          not null,
  nombre         varchar2(40)     not null,
  descripcion    varchar2(80)     not null,
  constraint puesto_pk primary key (puesto_id)
  using index (
    create unique index puesto_pk on puesto(puesto_id)
    tablespace administracion_idx_tbs
  )
)
tablespace administracion_tbs;

--
-- table: disciplina
--
create table disciplina(
  disciplina_id    number(10, 0)    not null,
  clave            char(3)          not null,
  nombre           varchar2(20)     not null,
  descripcion      varchar2(50)     not null,
  icono            blob             not null,
  constraint disciplina_pk primary key (disciplina_id)
  using index (
    create unique index disciplina_pk on disciplina(disciplina_id)
    tablespace administracion_idx_tbs
  )
) lob (icono) store as basicfile (tablespace administracion_blob_tbs)
tablespace administracion_tbs;

--
-- table: estatus
--
create table estatus(
  estatus_id     number(10, 0)    not null,
  clave          char(1)          not null,
  descripcion    varchar2(40)     not null,
  constraint estatus_pk primary key (estatus_id)
  using index (
    create unique index estatus_pk on estatus(estatus_id)
    tablespace administracion_idx_tbs
  )
)
tablespace administracion_tbs;


--
-- table: tipo_dispositivo
--
create table tipo_dispositivo(
  tipo_dispositivo_id    number(10, 0)    not null,
  nombre                 varchar2(20)     not null,
  descripcion            varchar2(50)     not null,
  constraint tipo_dispositivo_pk primary key (tipo_dispositivo_id)
  using index (
    create unique index tipo_dispositivo_pk on tipo_dispositivo(tipo_dispositivo_id)
    tablespace administracion_idx_tbs
  )
)
tablespace administracion_tbs;


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
  gerente_id     number(10, 0)    null,   --para permitir carga inicial de gimnasios
  constraint gimnasio_pk primary key (gimnasio_id)
  using index (
    create unique index gimnasio_pk on gimnasio(gimnasio_id)
    tablespace administracion_idx_tbs
  )
)
tablespace administracion_tbs;

--
-- table: empleado
--
create table empleado(
  empleado_id         number(10, 0)    not null,
  nombre              varchar2(40)     not null,
  ap_paterno          varchar2(40)     not null,
  ap_materno          varchar2(40),
  curp                varchar2(18)     ENCRYPT USING 'AES256'  not null,
  num_trabajador      varchar2(10)     not null,
  rfc                 varchar2(13)     ENCRYPT USING 'AES256' not null,
  fecha_nacimiento    date             not null,
  email               varchar2(30)     not null,
  foto                blob             not null,
  tipo                char(1)          not null,
  puesto_id           number(10, 0)    not null,
  gimnasio_id         number(10, 0)    not null,
  constraint empleado_pk primary key (empleado_id)
  using index (
    create unique index empleado_pk on empleado(empleado_id)
    tablespace administracion_idx_tbs
  ),
  constraint empleado_puesto_id_fk foreign key (puesto_id)
  references puesto(puesto_id),
  constraint empleado_gimnasio_id_fk foreign key (gimnasio_id)
  references gimnasio(gimnasio_id)
) lob (foto) store as basicfile (tablespace administracion_blob_tbs)
tablespace administracion_tbs;

--Se agrega constraint de llave for�nea a gimnasio
alter table gimnasio
add constraint gimnasio_gerente_id_fk foreign key (gerente_id)
references empleado(empleado_id);

--
-- table: administrativo
--
create table administrativo(
  empleado_id    number(10, 0)    not null,
  login          varchar2(20)     not null,
  password       varchar2(15)     not null,
  rol            varchar2(20)     not null,
  certificado    blob             not null,
  constraint administrativo_pk primary key (empleado_id)
  using index (
    create unique index administrativo_pk on administrativo(empleado_id)
    tablespace administracion_idx_tbs
  ),
  constraint administrativo_emp_id_fk foreign key (empleado_id)
  references empleado(empleado_id)
) lob (certificado) store as basicfile (tablespace administracion_blob_tbs)
tablespace administracion_tbs;

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
  constraint sala_pk primary key (sala_id)
  using index (
    create unique index sala_pk on sala(sala_id)
    tablespace administracion_idx_tbs
  ),
  constraint sala_administrador_id_fk foreign key (administrador_id)
  references empleado(empleado_id),
  constraint sala_gimnasio_id_fk foreign key (gimnasio_id)
  references gimnasio(gimnasio_id)
)
tablespace administracion_tbs;

--
-- table: dispositivo
--
create table dispositivo(
  dispositivo_id         number(10, 0)    not null,
  num_inventario         varchar2(18)     not null,
  nombre                 varchar2(20)     not null,
  fecha_adquisicion      date             not null,
  descripcion            varchar2(50)     not null,
  sala_id                number(10, 0)    not null,
  tipo_dispositivo_id    number(10, 0)    not null,
  estatus_id             number(10, 0)    not null,
  constraint dispositivo_pk primary key (dispositivo_id)
  using index (
    create unique index dispositivo_pk on dispositivo(dispositivo_id)
    tablespace administracion_idx_tbs
  ),
  constraint dispositivo_sala_id_fk foreign key (sala_id)
  references sala(sala_id),
  constraint dispositivo_t_d_id_fk foreign key (tipo_dispositivo_id)
  references tipo_dispositivo(tipo_dispositivo_id),
  constraint dispositivo_estatus_id_fk foreign key (estatus_id)
  references estatus(estatus_id)
)
tablespace administracion_tbs;


--
-- table: historial_dispositivo
--
create table historial_dispositivo(
  historial_dispositivo_id    number(10, 0)    not null,
  fecha_registro              date             not null,
  dispositivo_id              number(10, 0)    not null,
  estatus_id                  number(10, 0)    not null,
  constraint historial_dispositivo_pk primary key (historial_dispositivo_id)
  using index (
    create unique index historial_dispositivo_pk
    on historial_dispositivo(historial_dispositivo_id)
    tablespace administracion_idx_tbs
  ),
  constraint his_dis_dispositivo_id_fk foreign key (dispositivo_id)
  references dispositivo(dispositivo_id),
  constraint his_dis_estatus_id_fk foreign key (estatus_id)
  references estatus(estatus_id)
)
tablespace administracion_tbs;

--
-- table: huella_empleado
--
create table huella_empleado(
  huella_empleado_id    number(10, 0)    not null,
  huella                blob             not null,
  empleado_id           number(10, 0)    not null,
  constraint huella_empleado_pk primary key (huella_empleado_id)
  using index (
    create unique index huella_empleado_pk
    on huella_empleado(huella_empleado_id)
    tablespace administracion_idx_tbs
  ),
  constraint huella_empleado_emp_id_fk foreign key (empleado_id)
  references empleado(empleado_id)
) lob (huella) store as basicfile (tablespace administracion_blob_tbs)
tablespace administracion_tbs;

--
-- table: instructor
--
create table instructor(
  empleado_id         number(10, 0)    not null,
  cedula              varchar2(8)      not null,
  anios_experiencia   number(2, 0)     not null,
  suplente            number(10, 0),
  constraint instructor_pk primary key (empleado_id)
  using index (
    create unique index instructor_pk on instructor(empleado_id)
    tablespace administracion_idx_tbs
  ),
  constraint instructor_empleado_id_fk foreign key (empleado_id)
  references empleado(empleado_id),
  constraint instructor_suplente_fk foreign key (suplente)
  references instructor(empleado_id)
)
tablespace administracion_tbs;

--
-- table: multimedia
--
create table multimedia(
  multimedia_id    number(10, 0)    not null,
  archivo          blob             not null,
  tipo_archivo     char(1)          not null,
  vigencia         date             not null,
  fecha_fin        date             not null,
  gimnasio_id      number(10, 0)    not null,
  constraint multimedia_pk primary key (multimedia_id)
  using index (
    create unique index multimedia_pk on multimedia(multimedia_id)
    tablespace administracion_idx_tbs
  ),
  constraint multimedia_gimnasio_id_fk foreign key (gimnasio_id)
  references gimnasio(gimnasio_id),
  constraint ml_tipo_archivo_chk check (
    tipo_archivo in ('I', 'V')
  )
) lob (archivo) store as basicfile (tablespace administracion_blob_tbs)
tablespace administracion_tbs;

--
-- table: sala_disciplina
--
create table sala_disciplina(
  disciplina_id         number(10, 0)    not null,
  sala_id               number(10, 0)    not null,
  constraint sala_disciplina_pk primary key (disciplina_id, sala_id)
  using index (
    create unique index sala_disciplina_pk
    on sala_disciplina(disciplina_id, sala_id)
    tablespace administracion_idx_tbs
  ),
  constraint sala_dis_disciplina_id_fk foreign key (sala_id)
  references sala(sala_id),
  constraint sala_dis_sala_id_fk foreign key (disciplina_id)
  references disciplina(disciplina_id)
)
tablespace administracion_tbs;

--
-- table: trayectoria_instructor
--

create table trayectoria_instructor(
  tayectoria_instructor_id    number(10, 0)    not null,
  url                         varchar2(50)     not null,
  empleado_id                 number(10, 0)    not null,
  constraint trayectoria_instructor_pk primary key (tayectoria_instructor_id)
  using index (
    create unique index trayectoria_instructor_pk
    on trayectoria_instructor(tayectoria_instructor_id)
    tablespace administracion_idx_tbs
  ),
  constraint tra_ins_empleado_id_fk foreign key (empleado_id)
  references instructor(empleado_id)
)
tablespace administracion_tbs;


-- Creación de índices
create index empleado_puesto_id_ix on empleado(puesto_id)
tablespace administracion_idx_tbs;

create index empleado_gimnasio_id_ix on empleado(gimnasio_id)
tablespace administracion_idx_tbs;

create index huella_emp_emp_id_ix on huella_empleado(empleado_id)
tablespace administracion_idx_tbs;

create index multimedia_gim_id_ix on multimedia(gimnasio_id)
tablespace administracion_idx_tbs;

create unique index gim_gerente_id_ix on gimnasio(gerente_id)
tablespace administracion_idx_tbs;

create index tr_ins_empleado_id_ix on trayectoria_instructor(empleado_id)
tablespace administracion_idx_tbs;

create index sala_administrador_id_ix on sala(administrador_id)
tablespace administracion_idx_tbs;

create index sala_gimnasio_id_ix on sala(gimnasio_id)
tablespace administracion_idx_tbs;

create index dispositivo_sala_id_ix on dispositivo(sala_id)
tablespace administracion_idx_tbs;

create index disp_tipo_disp_id_ix on dispositivo(tipo_dispositivo_id)
tablespace administracion_idx_tbs;

create index disp_estatus_id_ix on dispositivo(estatus_id)
tablespace administracion_idx_tbs;

create index hd_dispositivo_id_ix on historial_dispositivo(dispositivo_id)
tablespace administracion_idx_tbs;

create index hd_estatus_id_ix on historial_dispositivo(estatus_id)
tablespace administracion_idx_tbs;
