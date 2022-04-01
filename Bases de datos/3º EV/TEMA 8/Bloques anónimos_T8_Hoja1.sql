--EJ1
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('Hola &nom_alumno');
END;
/
--EJ2
SET SERVEROUTPUT ON
    DECLARE
    uno number(10) :=5;
    dos number(10) :=8;
    tres number(10) :=3;
    resultado number(10);
    BEGIN
        resultado:=uno+dos;
        resultado := resultado * tres;
        DBMS_OUTPUT.PUT_LINE('El resultado es:'|| resultado);
    END;
    /
--EJ3
SET SERVEROUTPUT ON
    DECLARE
    radio number(5,2);
    pi CONSTANT number(3,2) :=3.14;
    BEGIN
        radio := &radio;
        DBMS_OUTPUT.PUT_LINE('El radio es:'|| radio);
        DBMS_OUTPUT.PUT_LINE('El area del circulo es:'|| ((radio*radio)*pi));
    END;
    /
--EJ4
SET SERVEROUTPUT ON
    DECLARE
    nombre varchar2(10);
    apellido varchar2(10);
    resultado varchar2(50);
    BEGIN
    nombre :='&nombre';
    apellido :='&apellido';
    resultado := nombre || apellido;
    DBMS_OUTPUT.PUT_LINE('La concatenación es:'|| upper(resultado));
    DBMS_OUTPUT.PUT_LINE('La longitud de la concatenación es:'|| LENGTH(resultado));
    END;
    /
--EJ5
SET SERVEROUTPUT ON
    DECLARE
    fecha date;
    BEGIN
    fecha := '&fecha';
    DBMS_OUTPUT.PUT_LINE('El año de la fecha es:' || TO_CHAR(fecha,'yyyy'));
    DBMS_OUTPUT.PUT_LINE('El mes es:' || TO_CHAR(fecha,'month'));
    DBMS_OUTPUT.PUT_LINE('El día es:' || TO_CHAR(fecha,'day'));
    END;
    /
--EJ6
SET SERVEROUTPUT ON
    DECLARE
    fecha date DEFAULT SYSDATE;
    BEGIN
    DBMS_OUTPUT.PUT_LINE('El año de la fecha es:' || TO_CHAR(fecha,'yyyy'));
    DBMS_OUTPUT.PUT_LINE('El mes es:' || TO_CHAR(fecha,'month'));
    DBMS_OUTPUT.PUT_LINE('El día es:' || TO_CHAR(fecha,'day'));
    DBMS_OUTPUT.PUT_LINE ('La hora es:' || TO_CHAR(fecha,'hh24:mi'));
    END;
    /
--EJ7
SET SERVEROUTPUT ON
    DECLARE
    numero number(10);
    BEGIN
    numero := &numero;
    IF 
    mod(numero,2)=0
    THEN
    DBMS_OUTPUT.PUT_LINE('El numero es par');
    ELSE
    DBMS_OUTPUT.PUT_LINE('El numero es impar');
    END IF;
    END;
    /
--EJ8
SET SERVEROUTPUT ON
    DECLARE
    letra varchar2(1);
    cadena varchar2(50);
    BEGIN
    DBMS_OUTPUT.PUT_LINE('Indique la cadena');
    cadena := '&cadena';
    DBMS_OUTPUT.PUT_LINE('Indique la letra a buscar en la cadena');
    letra :='&letra';
    IF INSTR(cadena,letra) > 0 THEN
    DBMS_OUTPUT.PUT_LINE('La letra esta en la cadena');
    ELSE
    DBMS_OUTPUT.PUT_LINE('La letra no esta en la cadena');
    END IF;
    END;
    /

--EJ9
SET SERVEROUTPUT ON
DECLARE
    letra1 varchar2(1);
    letra2 varchar(2);
    cadena varchar2(10);
    encontrado boolean default false;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Indique la cadena');
    cadena := '&cadena';
    DBMS_OUTPUT.PUT_LINE('Indique la primera letra a buscar en la cadena');
    letra1 :='&letra1';
    DBMS_OUTPUT.PUT_LINE('Indique la segunda letra a buscar en la cadena');
    letra2 :='&letra2';
    IF INSTR(cadena,letra1) > 0 THEN
        DBMS_OUTPUT.PUT_LINE('La letra 1 esta en la cadena');
        encontrado := true;
    END IF;
    IF INSTR(cadena,letra2) > 0 THEN
        DBMS_OUTPUT.PUT_LINE('La letra 2 esta en la cadena');
        encontrado := true;
    END IF;
    IF encontrado = false THEN
        DBMS_OUTPUT.PUT_LINE('La letras no se encuentran en la cadena');
    END IF;
END;
/
--EJ10
SET SERVEROUTPUT ON
DECLARE
    numero1 number(5);
    numero2 number(5);
    resultado number(8,2);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Indique el primer numero');
    numero1 := &numero1;
    DBMS_OUTPUT.PUT_LINE('Indique el segundo numero');
    numero2 := &numero2;
    IF numero1>numero2 THEN
    resultado := numero1/numero2;
    DBMS_OUTPUT.PUT_LINE('El resultado de la división es:' || resultado);
    ELSIF numero2=0 THEN
    DBMS_OUTPUT.PUT_LINE('No se puede realizar la división');
    ELSE
    DBMS_OUTPUT.PUT_LINE('La división no es factible');
    END IF;
    END;
    /
--EJ11
SET SERVEROUTPUT ON
DECLARE
    numero1 number(5);
    numero2 number(5);
    numero3 number(5);
    resultadoSuma number(8,2);
BEGIN
numero1 :=&numero1;
numero2 :=&numero2;
numero3 :=&numero3;
CASE
WHEN (numero1=numero2+numero3) THEN DBMS_OUTPUT.PUT_LINE('El número 1 es equivalente');
WHEN (numero2=numero1+numero3) THEN DBMS_OUTPUT.PUT_LINE('El numero 2 es equivalente');
WHEN (numero3=numero1+numero2) THEN DBMS_OUTPUT.PUT_LINE('El numero 3 es equivalente');
ELSE DBMS.OUTPUT.PUT_LINE ('No hay numeros equivalentes');
END CASE;
END;
    /
--EJ12