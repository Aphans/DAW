--EJ1
b)
d)
f)
g)
--EJ2
CREATE OR REPLACE PROCEDURE pverempleoficio (pOficio varchar2)
AS
    CURSOR c_verInfo IS SELECT ENAME,APELLIDO,OFICIO,DNOMBRE FROM EMPLE
                        JOIN EMP ON EMPLE.EMP_NO = EMP.EMPNO
                        JOIN DEPART ON DEPART.DEPT_NO = EMPLE.DEPT_NO
                        WHERE OFICIO = pOficio;
    BEGIN
        FOR v_verInfo IN c_verInfo LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre:'||v_verInfo.ENAME);
        DBMS_OUTPUT.PUT_LINE('Apellido:'||v_verInfo.APELLIDO);
        DBMS_OUTPUT.PUT_LINE('Oficio:'||v_verInfo.OFICIO);
        DBMS_OUTPUT.PUT_LINE('Departamento:'||v_verInfo.DNOMBRE);
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        END LOOP;
    END;
    
BEGIN
pverempleoficio('VENDEDOR');
END;

--EJ3
CREATE OR REPLACE PROCEDURE paumentosalario2(pNumeroDepartamento number)
AS
    CURSOR c_empleados IS SELECT EMP_NO,APELLIDO,OFICIO,DIR,FECHA_ALT,SALARIO,COMISION,DEPT_NO FROM EMPLE WHERE DEPT_NO = pNumeroDepartamento AND UPPER(OFICIO)!='PRESIDENTE'   FOR UPDATE; 
    BEGIN
        FOR v_info IN c_empleados LOOP
            DBMS_OUTPUT.PUT_LINE('EMP_NO:'||v_info.EMP_NO);
            DBMS_OUTPUT.PUT_LINE('APELLIDO:'||v_info.APELLIDO);
            DBMS_OUTPUT.PUT_LINE('OFICIO:'||v_info.OFICIO);
            DBMS_OUTPUT.PUT_LINE('DIR:'||v_info.DIR);
            DBMS_OUTPUT.PUT_LINE('FECHA_ALT:'||v_info.FECHA_ALT);
            DBMS_OUTPUT.PUT_LINE('SALARIO:'||v_info.SALARIO);
            DBMS_OUTPUT.PUT_LINE('COMISION:'||v_info.COMISION);
            DBMS_OUTPUT.PUT_LINE('DEPT_NO:'||v_info.DEPT_NO);
            DBMS_OUTPUT.PUT_LINE('--------------------------');
            CASE v_info.OFICIO
                WHEN 'Analistas' THEN
                    UPDATE EMPLE SET SALARIO = SALARIO+(SALARIO/100)*0.5 WHERE CURRENT OF c_empleados ;
                WHEN 'Vendedores' THEN
                    UPDATE EMPLE SET SALARIO = SALARIO+(SALARIO/100)*0.3 WHERE CURRENT OF c_empleados;
                WHEN 'Directores' THEN
                    UPDATE EMPLE SET SALARIO = SALARIO+(SALARIO/100)*1 WHERE CURRENT OF c_empleados;
                ELSE
                    UPDATE EMPLE SET SALARIO = SALARIO+(SALARIO/100)*0.2 WHERE CURRENT OF c_empleados;
            END CASE;
        END LOOP;
    END;
    /

BEGIN
paumentosalario2(10);
END;
--EJ4 
--Selecciona el apellido y salario de los 5 empleados con el salario mas alto
CREATE OR REPLACE PROCEDURE salarioMasAlto
AS 
    CURSOR c_salarioMasAlto IS SELECT APELLIDO,SALARIO FROM EMPLE ORDER BY SALARIO DESC;
    registro c_salarioMasAlto%ROWTYPE;
    BEGIN
    OPEN c_SalarioMasAlto;
    FETCH c_SalarioMasAlto INTO registro;
    FOR v_salarioMasAlto IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('APELLIDO:'||registro.APELLIDO);
    DBMS_OUTPUT.PUT_LINE('SALARIO:'||registro.SALARIO);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    FETCH c_SalarioMasAlto INTO registro;
    END LOOP;
    CLOSE c_SalarioMasAlto;
    END;
    /
    
BEGIN
salarioMasAlto;
END;
--EJ5
CREATE OR REPLACE PROCEDURE menosSalarioPorOficio
AS
    CURSOR c_menosSalario IS SELECT EMP_NO,APELLIDO,OFICIO,DIR,FECHA_ALT,SALARIO,COMISION,DEPT_NO
                            FROM EMPLE
                                GROUP BY OFICIO, SALARIO, EMP_NO, APELLIDO, DIR, FECHA_ALT, COMISION, DEPT_NO
                                HAVING SALARIO IN(SELECT MIN(SALARIO) FROM EMPLE GROUP BY OFICIO);
    BEGIN
    FOR v_menosSalario IN c_menosSalario LOOP  
        DBMS_OUTPUT.PUT_LINE('EMP_NO:'||v_menosSalario.EMP_NO);
        DBMS_OUTPUT.PUT_LINE('APELLIDO:'||v_menosSalario.APELLIDO);
        DBMS_OUTPUT.PUT_LINE('OFICIO:'||v_menosSalario.OFICIO);
        DBMS_OUTPUT.PUT_LINE('DIR:'||v_menosSalario.DIR);
        DBMS_OUTPUT.PUT_LINE('FECHA_AL:'||v_menosSalario.FECHA_ALT);
        DBMS_OUTPUT.PUT_LINE('SALARIO:'||v_menosSalario.SALARIO);
        DBMS_OUTPUT.PUT_LINE('COMISION:'||v_menosSalario.COMISION);
        DBMS_OUTPUT.PUT_LINE('DEPT_NO:'||v_menosSalario.DEPT_NO);
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
    END LOOP;
    END;
    /
    
BEGIN
menosSalarioPorOficio;
END;
/