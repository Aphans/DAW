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
--EJ4
--EJ5