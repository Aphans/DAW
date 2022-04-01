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