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
--------------------------------------------------------EJ27------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE Pedir_Revision(pAnimal varchar2,pNombreVeterinario varchar2)
AS
    e_noRellenos exception;
    e_noEncontrado exception;
    v_animal varchar2(64);
    e_demasiadosRegistros exception;
    v_veterinario number(38);
    BEGIN
           v_animal:=Busca_Animal(pAnimal);
        IF(pAnimal is null OR pNombreVeterinario is null) THEN
            RAISE e_noRellenos;
        ELSE
            IF(v_animal='1001') THEN
                RAISE e_noEncontrado;
            IF(v_animal='1002') THEN
                RAISE e_demasiadosRegistros;
             END IF;
             END IF;
        END IF;
        v_veterinario:=Busca_Vet(pNombreVeterinario);
        IF v_animal is not null AND v_veterinario is not null THEN
                INSERT INTO VISITAS VALUES(v_animal,SYSDATE,v_veterinario,'REVISIÓN',null,null);
        END IF;
    EXCEPTION 
    WHEN e_noRellenos THEN
        DBMS_OUTPUT.PUT_LINE('No puede haber valores nulos');
    WHEN e_noEncontrado THEN
        DBMS_OUTPUT.PUT_LINE('El animal no ha sido encontrado');
    WHEN e_demasiadosRegistros THEN
        DBMS_OUTPUT.PUT_LINE('El identificador corresponde a varios registros');
    END;
    
CREATE OR REPLACE FUNCTION Busca_Animal(pAnimal varchar2)
RETURN VARCHAR2
AS
    v_identificador animales.ident%type;
    BEGIN
    IF(pAnimal between '0' and '100') THEN
    SELECT IDENT INTO v_identificador FROM ANIMALES WHERE IDENT = pAnimal;
        RETURN v_identificador;
    ELSE
    SELECT NOMBRE INTO v_identificador FROM ANIMALES WHERE UPPER(NOMBRE) LIKE '%'||UPPER(pAnimal)||'%';
        RETURN v_identificador;
    END IF;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN '1001';
    WHEN TOO_MANY_ROWS THEN
        RETURN '1002';
    RETURN v_identificador;
    END;
    
CREATE OR REPLACE FUNCTION Busca_Vet(pNombreVeterinario varchar2)
RETURN NUMBER
    AS
        v_numColegiado VETERINARIOS.NUMCOLEGIADO%TYPE;
        BEGIN
            SELECT NUMCOLEGIADO INTO v_numColegiado FROM VETERINARIOS WHERE UPPER(NOMBRE) LIKE '%'||UPPER(pNombreVeterinario)||'%';
                RETURN v_numColegiado;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                SELECT NUMCOLEGIADO INTO v_numColegiado FROM VETERINARIOS WHERE NUMCOLEGIADO = (SELECT MAX(NUMCOLEGIADO) FROM VETERINARIOS);
                    RETURN v_numColegiado;
            WHEN TOO_MANY_ROWS THEN
                SELECT MAX(NUMCOLEGIADO) INTO v_numColegiado FROM VETERINARIOS WHERE NOMBRE like '%'||pNombreVeterinario||'%';
                RETURN  v_numColegiado;
        END;
    
BEGIN
    pedir_Revision('1','ELENA');
END;

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------EJ8 HOJA 3--------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE EJ8 
AS
   
    CURSOR c_InfoFuncion IS SELECT DISTINCT FUNCION FROM MECANICOS;
    CURSOR c_InfoMecanico(func MECANICOS.FUNCION%TYPE) IS SELECT NOMBRE,TELEFONO,NEMPLEADO FROM MECANICOS WHERE FUNCION = func;
    CURSOR c_InfoArreglos(empleado MECANICOS.NEMPLEADO%TYPE) IS SELECT ARREGLOS.MATRICULA MATRICULA,NOMBRE,FECHA_ENTRADA,TO_NUMBER(TRUNC(FECHA_SALIDA-FECHA_ENTRADA)) DIAS,IMPORTE FROM CLIENTES_TALLER
                                JOIN COCHES_TALLER ON CLIENTES_TALLER.NCLIENTE = COCHES_TALLER.NCLIENTE
                                JOIN ARREGLOS ON COCHES_TALLER.MATRICULA = ARREGLOS.MATRICULA
                                WHERE ARREGLOS.NEMPLEADO = empleado 
                                ORDER BY FECHA_ENTRADA DESC;
    v_number number:=0;    
    registro c_InfoArreglos%ROWTYPE;
BEGIN
    FOR v_infoFuncion IN c_InfoFuncion LOOP
        DBMS_OUTPUT.PUT_LINE('FUNCIÓN:'||v_infoFuncion.FUNCION);
        FOR v_infoMecanico IN c_InfoMecanico(v_infoFuncion.FUNCION) LOOP
            DBMS_OUTPUT.PUT_LINE('NOMBRE MECÁNICO:'||v_infoMecanico.NOMBRE);
            DBMS_OUTPUT.PUT_LINE('TELÉFONO:' || v_infoMecanico.TELEFONO);    
               OPEN c_InfoArreglos(v_infoMecanico.NEMPLEADO);
               v_number:=0;
                FETCH c_InfoArreglos into registro ;
                    DBMS_OUTPUT.PUT_LINE('----------ARREGLOS---------');
                    WHILE (v_number < 3 and c_InfoArreglos%found) LOOP
                    dbms_output.put_line(registro.MATRICULA || ' ' || registro.nombre || ' '  || registro.importe || ' ' || registro.FECHA_ENTRADA || ' '  || registro.dias);
                FETCH c_InfoArreglos into registro; --Leer la siguiente línea
                 v_number:=v_number+1;
                END LOOP;
              DBMS_OUTPUT.PUT_LINE('ARREGLOS:'||v_number);
                v_number:=0;
                dbms_output.put_line('--------------------------------------------------');
                CLOSE c_InfoArreglos;
        END LOOP;
    END LOOP;
END;
/
    
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


CREATE OR REPLACE VIEW MOVIMIENTOS11000
AS
    SELECT * FROM MOVIMIENTOS WHERE NUM_CUENTA=11000
    WITH READ ONLY;

---------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------EJERCICIOS TABLAS BANCO--------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------

--EJ1
CREATE OR REPLACE PROCEDURE clientes_unicos
AS
CURSOR c_titular is select DISTINCT nombre, num_cuenta from cuentas 
                        natural join clientes 
                        natural join movimientos 
                        where  nif_cotitular is null and nif_titular is not null order by nombre ;
CURSOR c_cuenta(cuenta cuentas.num_cuenta%type) is select num_cuenta, fechahora, importe, concepto from movimientos 
                    where num_cuenta = cuenta;
BEGIN
    for v_registro1 in c_titular loop
    dbms_output.put_line(v_registro1.nombre || ' * ' || v_registro1.num_cuenta);
        for v_registro2 in c_cuenta(v_registro1.num_cuenta) loop
            dbms_output.put_line(v_registro2.num_cuenta || ' * ' ||v_registro2.fechahora || ' * ' ||  v_registro2.importe || ' * ' || v_registro2.concepto);
        end loop;
    end loop;
end;

execute clientes_unicos;

--EJ2
CREATE OR REPLACE PROCEDURE mostrarCliente
AS
    CURSOR c_cuenta IS SELECT NUM_CUENTA,NIF_TITULAR,NIF_COTITULAR,FECHA_ABIERTA,NUM_SUCURSAL,TIPO,SALDO,CONTROL FROM CUENTAS;
    CURSOR c_cliente(cuenta CUENTAS.NIF_TITULAR%TYPE)IS SELECT NIF,NOMBRE,DIRECCION,TELEFONO FROM CLIENTES WHERE NIF=cuenta;
    registroCliente c_cliente%ROWTYPE;
    BEGIN
        FOR v_cuenta IN c_cuenta LOOP
            OPEN c_cliente(v_cuenta.NIF_TITULAR);
                FETCH c_cliente INTO registroCliente;
                    WHILE(c_cliente%FOUND) LOOP
                    DBMS_OUTPUT.PUT_LINE('NUMERO DE CUENTA:'||v_cuenta.NUM_CUENTA);
                    DBMS_OUTPUT.PUT_LINE('NOMBRE DEL CLIENTE:' || registroCliente.NOMBRE);
                    FETCH c_cliente INTO registroCliente;
                    END LOOP;
                CLOSE c_cliente;
            END LOOP;
        END;
BEGIN
mostrarCliente;
END;

--EJ3

