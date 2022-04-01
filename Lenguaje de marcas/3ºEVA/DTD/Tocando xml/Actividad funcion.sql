CREATE OR REPLACE FUNCTION con_iva (cantidad NUMBER, tipo NUMBER)
RETURN NUMBER
AS
v_resultado NUMBER (10,2) DEFAULT 0;
BEGIN
v_resultado := cantidad * (1+(tipo/100));
return (v_resultado);
END con_iva;
/

SELECT EMP_NO,SALARIO,con_iva(SALARIO,16) FROM EMPLE;
