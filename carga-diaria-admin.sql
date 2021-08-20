-- @Autor García García Ricardo - Humberto Serafín Castillo López
-- @Fecha 17/07/2021
-- @Descripcion:  Simula carga diaria en modulo de administración

set serveroutput on;
whenever sqlerror exit rollback

connect administrador_gimnasios/gimnasios

-- REDO para multimedia
declare
  v_max_id number;
  v_count number;
  cursor cur_insert is
    select multimedia_seq.nextval as multimedia_id, archivo, tipo_archivo,
      vigencia, fecha_fin, gimnasio_id
    from multimedia sample(60) where rownum <= 200;

  cursor cur_update is
    select * from multimedia sample (60) where rownum <= 200;

begin
  --insert
  v_count := 0;
  for r in cur_insert loop
    insert into multimedia(multimedia_id, archivo, tipo_archivo, vigencia,
      fecha_fin, gimnasio_id)
    values (r.multimedia_id, r.archivo, r.tipo_archivo, r.vigencia,
      r.fecha_fin, r.gimnasio_id);
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en multimedia: '||v_count);

  -- update
  select max(multimedia_id) into v_max_id
  from multimedia;
  v_count := 0;
  for r in cur_update loop
    update multimedia set vigencia = r.vigencia, fecha_fin = r.fecha_fin,
      gimnasio_id = r.gimnasio_id
    where multimedia_id = (select trunc(dbms_random.value(1,v_max_id))from dual);
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modificados en multimedia: '||v_count);
end;
/


-- REDO para historial_dispositivo
declare
  v_max_id number;
  v_count number;
  cursor cur_insert is
    select historial_seq.nextval as historial_dispositivo_id, fecha_registro,
      dispositivo_id, estatus_id
    from historial_dispositivo sample(60) where rownum <= 600;

begin
  --insert
  v_count := 0;
  for r in cur_insert loop
    insert into historial_dispositivo(historial_dispositivo_id, fecha_registro,
      dispositivo_id, estatus_id)
    values (r.historial_dispositivo_id, r.fecha_registro, r.dispositivo_id,
      r.estatus_id);
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en historial_dispositivo: '||v_count);
end;
/

-- REDO para dispositivo
declare
  v_max_id number;
  v_count number;

  cursor cur_update is
    select * from dispositivo sample (60) where rownum <= 600;
    
begin
    -- update
    select max(dispositivo_id) into v_max_id
    from dispositivo;
    v_count := 0;
    for r in cur_update loop
      update dispositivo set estatus_id = r.estatus_id,
        num_inventario = r.num_inventario, descripcion = r.descripcion
      where dispositivo_id = (select trunc(dbms_random.value(1,v_max_id))from dual);
      v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros modificados en multimedia: '||v_count);
end;
/

Prompt Confirmando Cambios
commit;

whenever sqlerror continue none
