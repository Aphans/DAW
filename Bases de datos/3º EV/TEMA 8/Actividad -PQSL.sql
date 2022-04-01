SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('HOLA MUNDO');
END;
/


DECLARE
    numero1 number(2);
    numero2 number(2);
BEGIN
DBMS_OUTPUT.PUT_LINE('Introduce un número');
numero1 := &numero1;
DBMS_OUTPUT.PUT_LINE('El número introducido es:'|| numero1);
DBMS_OUTPUT.PUT_LINE('Introduce un número');
numero2 :=&numero2;
DBMS_OUTPUT.PUT_LINE('El número introducido es:'|| numero2);
END;
/
