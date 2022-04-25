--------------------------------------------------------EJ19------------------------------------------------------------------
create or replace procedure ej19(indicador char,pmatricula varchar2,pfuncion varchar2,pimporte number)
as
datos_incorrectos EXCEPTION;
v_num_emp number;
    begin
        if (indicador!='A' and indicador!='T') then--1
            RAISE datos_incorrectos;
          else
             if (indicador='A') then--2
        -- ALTA
            if (BuscaMatricula(pmatricula)=false) then--3
            RAISE datos_incorrectos;
              else
              v_num_emp:=busca_funcion(pfuncion);
                if (pimporte>=0) then--4
                  insert into arreglos values (pmatricula, v_num_emp, sysdate, null, pimporte);
                    else
                      insert into arreglos values (pmatricula, v_num_emp, sysdate, null, null);
        end if;--3
        end if;--4
    else
--TERMINAR
    select nempleado into v_num_emp from arreglos where matricula=pmatricula and fecha_salida is null;
    if (pimporte>0) then--5
    update arreglos set fecha_salida=sysdate, importe=pimporte where matricula=pmatricula and fecha_salida is null;
    else
    update arreglos set fecha_salida=sysdate where matricula=pmatricula and fecha_salida is null;
    end if;--1
    end if;--2
    end if;--5
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
---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------EJ8 HOJA 3--------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE EJ8 
AS
    v_Funcion MECANICOS.FUNCION%TYPE;
    v_Empleado ARREGLOS.NEMPLEADO%TYPE;
    CURSOR c_InfoFuncion IS SELECT FUNCION FROM MECANICOS;
    CURSOR c_InfoMecanico IS SELECT NOMBRE,TELEFONO,NEMPLEADO FROM MECANICOS WHERE FUNCION = v_Funcion;
    CURSOR c_InfoArreglos IS SELECT ARREGLOS.MATRICULA MATRICULA,NOMBRE,FECHA_ENTRADA,TO_NUMBER(TRUNC(FECHA_SALIDA-FECHA_ENTRADA)) DIAS,IMPORTE FROM CLIENTES_TALLER
                                JOIN COCHES_TALLER ON CLIENTES_TALLER.NCLIENTE = COCHES_TALLER.NCLIENTE
                                JOIN ARREGLOS ON COCHES_TALLER.MATRICULA = ARREGLOS.MATRICULA
                                WHERE ARREGLOS.NEMPLEADO =  v_Empleado 
                                ORDER BY FECHA_ENTRADA DESC;
    v_number number:=1;    
    registro c_InfoArreglos%ROWTYPE;
    BEGIN
        FOR v_infoFuncion IN c_InfoFuncion LOOP
            v_Funcion:=v_infoFuncion.FUNCION;
            FOR v_infoMecanico IN c_InfoMecanico LOOP
                v_Empleado:=v_infoMecanico.NEMPLEADO;
                DBMS_OUTPUT.PUT_LINE('NOMBRE MECÁNICO:'||v_infoMecanico.NOMBRE);
                DBMS_OUTPUT.PUT_LINE('TELÉFONO:' || v_infoMecanico.TELEFONO);               
                   OPEN c_InfoArreglos;
                   v_number:=1;
                    FETCH c_InfoArreglos into registro;
                        DBMS_OUTPUT.PUT_LINE('----------ARREGLOS---------');
                        WHILE (v_number<=3 and c_InfoArreglos%found) LOOP
                        dbms_output.put_line(registro.matricula || ' ' || registro.nombre || ' '  || registro.importe || ' ' || registro.fecha_entrada || ' '  || registro.dias);
                        v_number:=v_number+1;
                    FETCH c_InfoArreglos into registro; --Leer la siguiente línea
                    END LOOP;
                    dbms_output.put_line('--------------------------------------------------');
                    CLOSE c_InfoArreglos;
                END LOOP;
                END LOOP;
    END;
    
BEGIN
EJ8;
END;

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------EJ2 HOJA 4--------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE EJ2 (pNumeroDepartamento number,pImporte number,pPorcentaje number)
AS
    CURSOR c_subir IS SELECT SALARIO FROM EMPLE WHERE DEPT_NO=pNumeroDepartamento FOR UPDATE;
    v_contador number:=0;
    registro c_subir%ROWTYPE;
    BEGIN
        OPEN c_subir;
          FETCH c_subir INTO registro;
            WHILE(c_subir%FOUND) LOOP              
                IF(pImporte>(registro.SALARIO/100)*pPorcentaje) THEN
                    UPDATE EMPLE SET SALARIO = SALARIO+pImporte WHERE CURRENT OF c_subir;
                ELSE 
                    UPDATE EMPLE SET SALARIO = SALARIO+(registro.SALARIO/100)*pPorcentaje WHERE CURRENT OF c_subir;
                END IF;
            v_contador:=v_contador+1;
            FETCH c_subir INTO REGISTRO;
            END LOOP;
            CLOSE c_subir;
        DBMS_OUTPUT.PUT_LINE('Número de filas actualizadas:'||v_contador);
    END;
    
BEGIN
EJ2(20,30,0);
END;
---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------VISTAS--------------------------------------------------------------------
CREATE OR REPLACE VIEW DEPT10 
AS SELECT  * FROM EMPLE
WHERE SALARIO>1200 AND DEPT_NO =10
WITH CHECK OPTION;/*Para que no pueda insertarse en la vista si no se cumple el WHERE*/

WITH READ ONLY /*Solo lectura*/

DROP VIEW DEPT10; --Eliminar la vista