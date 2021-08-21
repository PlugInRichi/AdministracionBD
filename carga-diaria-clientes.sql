-- @Autor García García Ricardo - Humberto Serafín Castillo López
-- @Fecha 17/07/2021
-- @Descripcion:  Simula carga diaria en modulo de clientes

set serveroutput on;
whenever sqlerror exit rollback

-- Sesión del módulo de administración de clientes
connect administrador_clientes/clientes

declare
  v_max_id number;
  v_count number;

    cursor cur_insert is
    select bitacora_seq.nextval as bitacora_id, num_minuto, calorias,
      sensor_id, sesion_id
    from bitacora sample(60) where rownum <= 200; --Subir más

  cursor cur_update is
    select * from cliente sample (70);
begin
  --insert
  v_count := 0;
  for r in cur_insert loop
    insert into bitacora(bitacora_id, num_minuto, calorias, sensor_id,
      sesion_id)
    values (r.bitacora_id, r.num_minuto, r.calorias, r.sensor_id,
      r.sesion_id);
    v_count := v_count + sql%rowcount;
  end loop;


   -- update
   v_count := 0;
  select max(cliente_id) into v_max_id
  from cliente;
  -- update
  v_count := 0;
  for r in cur_update loop
    update cliente set
    nombre = r.nombre, ap_paterno = r.ap_paterno, ap_materno= r.ap_materno,
    password = r.password, direccion = r.direccion,
    fecha_nacimiento = r.fecha_nacimiento, foto = r.foto
      where cliente_id = (select trunc(dbms_random.value(1,v_max_id))from dual);
        v_count := v_count + sql%rowcount;
  end loop;
end;
/

Prompt Confirmando Cambios
commit;

whenever sqlerror continue none
