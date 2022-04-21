--EJ1
--FIRST METHOD
CREATE OR REPLACE PROCEDURE subirSalario(pDepartamento number, pPorcentaje number)
AS
CURSOR c_subir IS SELECT SALARIO FROM EMPLE WHERE dept_no=pDepartamento FOR UPDATE;
BEGIN
FOR v_subida IN c_subir LOOP
UPDATE EMPLE SET SALARIO=SALARIO+(SALARIO/100)*pPorcentaje
WHERE CURRENT OF c_subir;
END LOOP;
END;
/

BEGIN
subirSalario(20,20);
END;
--SECOND METHOD
CREATE OR REPLACE PROCEDURE subirSalario(pDepartamento number, pPorcentaje number)
AS
CURSOR c_subir IS SELECT SALARIO,ROWID FROM EMPLE WHERE dept_no=pDepartamento FOR UPDATE;
BEGIN
FOR v_subida IN c_subir LOOP
UPDATE EMPLE SET SALARIO=SALARIO+(SALARIO/100)*pPorcentaje
WHERE ROWID =v_subida.ROWID;
END LOOP;
END;
/

BEGIN
subirSalario(20,20);
END;
--EJ2
CREATE OR REPLACE PROCEDURE subirSalario(pDepartamento number,pImporte number ,pPorcentaje number)
AS
CURSOR c_subir IS SELECT SALARIO FROM EMPLE WHERE dept_no=pDepartamento FOR UPDATE;
v_contador number:=0;
BEGIN
    FOR v_subida IN c_subir LOOP
    IF pImporte>(v_subida.SALARIO+(v_subida.Salario/100)*pPorcentaje) THEN
        UPDATE EMPLE SET SALARIO=SALARIO+pImporte WHERE CURRENT OF c_subir;
    END IF;
    IF pImporte<(v_subida.SALARIO+(v_subida.Salario/100)*pPorcentaje) THEN
        UPDATE EMPLE SET SALARIO=(v_subida.SALARIO+(Salario/100)*pPorcentaje) WHERE CURRENT OF c_subir;
    END IF;
    v_contador:=v_contador+1;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('Filas actualizadas:'||v_contador);
END;
/

BEGIN
subirSalario(20,30,0);
END;
--EJ3 
CREATE OR REPLACE PROCEDURE subirSueldoOficio(pOficio varchar2)
AS
    CURSOR c_subir IS SELECT SALARIO FROM EMPLE WHERE SALARIO<(SELECT AVG(SALARIO) FROM EMPLE WHERE OFICIO = pOficio) FOR UPDATE;
    v_mediaSalario number;
    v_salarios number;
    contador number;
    e_null exception;
BEGIN
    IF(pOficio is null) THEN
        raise e_null;
    END IF;
    contador:=0;
    SELECT AVG(SALARIO) INTO v_mediaSalario FROM EMPLE WHERE oficio =pOficio;
    FOR v_subida IN c_subir LOOP
        UPDATE EMPLE SET SALARIO =(v_mediaSalario-v_subida.salario/100*50)
        WHERE CURRENT OF c_subir;
    contador:=contador+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Filas actualizadas:' || contador);
EXCEPTION WHEN
    e_null THEN
    DBMS_OUTPUT.PUT_LINE('El oficio no puede ser nulo');
END;
/

BEGIN
subirSueldoOficio('AGRICULT');
END;