create or replace procedure ej19(indicador char,pmatricula varchar2,pfuncion varchar2,pimporte number)
as
datos_incorrectos EXCEPTION;
v_num_emp number;
begin
if (indicador!='A' and indicador!='T') then
RAISE datos_incorrectos;
else
if (indicador='A') then
-- ALTA
if (busca_matricula(pmatricula)=false) then
RAISE datos_incorrectos;
else
v_num_emp:=busca_funcion(pfuncion);
if (pimporte>=0) then
insert into arreglos values (pmatricula, v_num_emp, sysdate, null, pimporte);
else
insert into arreglos values (pmatricula, v_num_emp, sysdate, null, null);
end if;
end if;
else
--TERMINAR
select nempleado into v_num_emp from arreglos where matricula=pmatricula and fecha_salida is null;
if (pimporte>0) then
update arreglos set fecha_salida=sysdate, importe=pimporte where matricula=pmatricula and fecha_salida is null;
else
update arreglos set fecha_salida=sysdate where matricula=pmatricula and fecha_salida is null;
end if;
end if;
end if;
exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE('No hay un arreglo para terminar');
when datos_incorrectos then
DBMS_OUTPUT.PUT_LINE('Datos incorrectos');
end;


create or replace function comprobarMatricula(matriCoche varchar2)
return boolean
is
   v_letras char(3);
begin
   if(length(matriCoche)=7) then
           for i in 1..4 loop
             if (substr(matriCoche,i,1) not between '0' and '9') then
                return false;
             end if;
           end loop;
           -- comprobar letras
            v_letras:= substr(matriCoche,5,3);
            for i in 1..3 loop
              if (substr(v_letras,i,1) not between 'A' and 'Z') then
                return false;
              end if;
            end loop;
    else
        return false;
    end if;
    return true;
end;



create or replace function buscarMatricula(matriCoche varchar2)
return boolean
    is
    v_matri coches_taller.matricula%TYPE;
        begin
        select matricula into v_matri from coches_taller where matricula = matriCoche;
        return true;
    exception
    when no_data_found then
        if comprobarMatricula(matriCoche) then
            insert into coches_taller values (matriCoche, 'nuevo', null, 0);
            return true;
     else
            return false;
     end if;
end;


create or replace function busca_funcion (pfuncion varchar2)
return number
as
v_num_emp number;
begin
select nempleado into v_num_emp from mecanicos where funcion=pfuncion;
return v_num_emp;
exception
when no_data_found then
select nempleado into v_num_emp from mecanicos where fecha_ing=(select min(fecha_ing) from mecanicos);
return v_num_emp;
when too_many_rows then
select nempleado into v_num_emp from mecanicos where funcion=pfuncion and fecha_ing=(select max(fecha_ing) from mecanicos where funcion=pfuncion);
return v_num_emp;
end;