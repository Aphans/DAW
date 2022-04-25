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
            if (BuscaMatricula(pmatricula)=false) then
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


CREATE OR REPLACE FUNCTION ComprobacionMatricula(pMatricula varchar2)
RETURN BOOLEAN 
AS
    v_Matricula COCHES_TALLER.MATRICULA%TYPE;
    v_letras varchar2(64);
    BEGIN
    SELECT MATRICULA INTO v_Matricula FROM COCHES_TALLER WHERE MATRICULA = pMatricula;
    RETURN TRUE;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        IF(LENGTH(pMatricula)=7) THEN
            FOR i IN 1..4 LOOP
                IF(SUBSTR(pMatricula,i,1) NOT BETWEEN '0' AND '9') THEN
                RETURN FALSE;                   
                END IF;         
            END LOOP;
                  v_letras:=SUBSTR(pMatricula,5,3);
                        FOR i IN 1..3 LOOP
                           IF(SUBSTR(v_letras,i,1)  NOT BETWEEN 'A' AND 'Z') THEN
                                RETURN FALSE;
                        END IF;
                        END LOOP;
        ELSE
           RETURN FALSE;  
        END IF;
        RETURN TRUE;
    END;
    /
    
Create or replace function BuscaMatricula(matriCoche varchar2)
return boolean
    is
    v_matri coches_taller.matricula%TYPE;
        begin
        select matricula into v_matri from coches_taller where matricula = matriCoche;
        return true;
    exception
    when no_data_found then
        if ComprobacionMatricula(matriCoche) then
            insert into coches_taller values (matriCoche, 'nuevo', null, 0);
            return true;
     else
            return false;
     end if;
end;
    
CREATE OR REPLACE FUNCTION Busca_Funcion(pFuncion varchar2)
RETURN NUMBER
AS
    v_nEmpleado MECANICOS.NEMPLEADO%TYPE;
    BEGIN
    SELECT NEMPLEADO INTO v_nEmpleado FROM MECANICOS WHERE FUNCION = pFuncion;
        RETURN v_nEmpleado;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        SELECT NEMPLEADO INTO v_nEmpleado FROM MECANICOS WHERE FUNCION =pFuncion AND FECHA_ING=(SELECT MIN(FECHA_ING) FROM MECANICOS WHERE FUNCION=pFuncion);
        RETURN v_nEmpleado;
    WHEN TOO_MANY_ROWS THEN
        SELECT NEMPLEADO INTO v_nEmpleado FROM MECANICOS WHERE FUNCION =pFuncion AND FECHA_ING=(SELECT MAX(FECHA_ING) FROM MECANICOS WHERE FUNCION=pFuncion);
        RETURN v_nEmpleado;
    END;
    
    
BEGIN
ej19('T','3333AAA','CHAPISTA',5000);
END;
