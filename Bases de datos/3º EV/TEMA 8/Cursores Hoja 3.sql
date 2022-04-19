--------------------------------------------------------------------CURSORES-------------------------------------------------
--EJERCICIO 1
CREATE OR REPLACE PROCEDURE c_empleados (codDept number)
AS
CURSOR empleados IS SELECT APELLIDO,SALARIO, OFICIO FROM EMPLE WHERE dept_no=codDept;
v_nEmpleados number:=0;
v_totalSalario number:=0;
BEGIN
   FOR vempleados in empleados 
   loop
   DBMS_OUTPUT.PUT_LINE(vempleados.APELLIDO || ','||vempleados.SALARIO || ' ,' ||vempleados.OFICIO);
   v_nEmpleados:=v_nEmpleados+1;
   v_totalSalario:=v_totalSalario+vempleados.salario;
   END LOOP;
   DBMS_OUTPUT.PUT_LINE(v_nEmpleados);
   DBMS_OUTPUT.PUT_LINE(v_totalSalario);
END;

BEGIN
c_empleados(20);
END;
--EJERCICIO 2
CREATE OR REPLACE PROCEDURE mostrar_empleados(p_oficio varchar2,p_porcentaje number)
AS 
e_null exception;
CURSOR EMPLEADOS IS SELECT APELLIDO,SALARIO,SALARIO*P_PORCENTAJE FROM EMPLE WHERE OFICIO=P_OFICIO;
BEGIN
IF(p_oficio is null OR p_porcentaje is null) THEN
    raise e_null;
ELSE IF (p_porcentaje between 1 and 100) THEN
    FOR v_empleOficio in empleados
    LOOP
      DBMS_OUTPUT.PUT_LINE(v_empleOficio.APELLIDO || ','||v_empleOficio.SALARIO || ' ,' ||((v_empleOficio.Salario)*p_porcentaje));
    END LOOP;
    END IF;
END IF;
EXCEPTION WHEN e_null THEN
DBMS_OUTPUT.PUT_LINE('Los valores no pueden ser nulos');
END;

BEGIN
mostrar_empleados(null,3);
END;
--EJERCICIO 3
CREATE OR REPLACE PROCEDURE empleados_Año(año1 date, año2 date)
AS
diferenciaFechas date;
añoActual number;
CURSOR mostrarEmpleados IS SELECT APELLIDO,SALARIO FROM EMPLE WHERE TO_CHAR(FECHA_ALT,'YYYY') between año1 and año2;
BEGIN
añoActual:=TO_CHAR(SYSDATE,'YYYY');
IF(año1 < año2) AND (año2<añoActual) THEN
DBMS_OUTPUT.PUT_LINE('No se puede realizar la diferencia');
END IF;
FOR v_mostrarEmpleados IN mostrarEmpleados
    LOOP
    DBMS_OUTPUT.PUT_LINE(v_mostrarEmpleados.APELLIDO,v_mostrarEmpleados.Salario);
    END LOOP;
END;
--EJERCICIO 4 
CREATE OR REPLACE PROCEDURE mejoresSalarios(numeroEmpleados number)
AS
CURSOR mostrarEmpleados IS SELECT APELLIDO,SALARIO FROM EMPLE WHERE ORDER BY SALARIO DESC;
v_reg_emp c_emp%rowtype;
v_numeroEmpleados number;
cont number:=1;
e_numeroEmpleadosMenor exception;
BEGIN
    IF(numeroEmpleados<1) THEN
    raise e_numeroEmpleadosMenor;
    END IF;
    SELECT COUNT(*) INTO v_numeroEmpleados FROM EMPLE ;
    IF(numeroEmpleados between 1 and v_numeroEmpleados) THEN
   OPEN mostrarEmpleados;
   FETCH mostrarEmpleados INTO v_reg_emp;
   WHILE cont<=numeroEmpleados LOOP
   DBMS_OUTPUT.PUT_LINE(v_reg_emp.APELLIDO || v_reg_emp.SALARIO);
   cont:=cont+1;
   END LOOP;
   CLOSE mostrarEmpleados;
   END IF;
END;

--EJERCICIO 5
CREATE OR REPLACE PROCEDURE mostrarInfoDept
AS
CURSOR INFODEPART IS SELECT DNOMBRE NOMBRE,MAX(SALARIO)MINSALARIO,MIN(SALARIO) MAXSALARIO ,COUNT(*)TOTAL  FROM DEPARTAMENTOS JOIN
                    EMPLE ON DEPARTAMENTOS.DEPT_NO = EMPLE.DEPT_NO
                    GROUP BY DNOMBRE;
BEGIN 
FOR infoEmple IN INFODEPART
    LOOP
    DBMS_OUTPUT.PUT_LINE(infoEmple.NOMBRE || infoEmple.MINSALARIO || infoEmple.MAXSALARIO || infoEmple.TOTAL);
    END LOOP;
END;

BEGIN
mostrarInfoDept;
END;
--EJERCICIO 6
CREATE OR REPLACE PROCEDURE ordenaDatos 
AS
CURSOR ordena IS SELECT MOTIVO,FH_VISITA,NOMBRE,DNI_DUEÑO,PRECIO FROM VISITAS
                JOIN ANIMALES ON ANIMALES.IDENT = VISITAS.IDENT_ANIMAL ORDER BY MOTIVO,FH_VISITA;
BEGIN
FOR orde IN ordena
LOOP
DBMS_OUTPUT.PUT_LINE(orde.motivo ||'    ' || orde.fh_visita ||'       ' || orde.nombre || '          ' || orde.dni_dueño ||'      '|| orde.precio);
END LOOP;
END;

BEGIN
ordenaDatos;
END;
--EJERCICIO 7
CREATE OR REPLACE PROCEDURE visi_coste (p_nombreDueño varchar2)
AS
v_dni dueños.dni%type;
v_identAnimal animales.ident%type;
v_existeDNI boolean;
noExisteDueño exception;
cursor infoAnimales IS SELECT IDENT,NOMBRE,ESPECIE,RAZA FROM ANIMALES WHERE DNI_DUEÑO = v_dni ;
cursor infoDueños IS SELECT DNI,NOMBRE,DIRECCION FROM DUEÑOS;
cursor infoVisitas IS SELECT FH_VISITA,NOMBRE,MOTIVO,PRECIO FROM VISITAS 
                        JOIN VETERINARIOS ON VISITAS.NUMCOLEGIADO = VISITAS.NUMCOLEGIADO
                        WHERE IDENT_ANIMAL = v_identAnimal;
contador number :=0;
contadorVisitas number:=0;
totalPrecioVisitas visitas.precio%type;
BEGIN
v_existeDNI :=existeDNI(p_nombreDueño);
IF (v_existeDNI) THEN
   FOR v_animal IN infoAnimales LOOP
   DBMS_OUTPUT.PUT_LINE(v_animal.ident  || v_animal.nombre || v_animal.especie || v_animal.raza);
   v_identAnimal:=v_animal.ident;
   END LOOP;
ELSE
    raise noExisteDueño;
END IF;
EXCEPTION WHEN noExisteDueño THEN
    FOR v_dueños IN infoDueños LOOP
         DBMS_OUTPUT.PUT_LINE(v_dueños.DNI || v_dueños.NOMBRE || v_dueños.DIRECCION);
         v_dni:=v_dueños.dni;
         FOR v_animales IN infoAnimales LOOP
        DBMS_OUTPUT.PUT_LINE(v_animales.IDENT || v_animales.NOMBRE || v_animales.ESPECIE);
        v_identAnimal:=v_animales.ident;
        contador :=contador+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('TOTAL ANIMALES' || contador);
    contador:=0;
    END LOOP;
    FOR v_visitas IN infoVisitas LOOP
    DBMS_OUTPUT.PUT_LINE(v_visitas.FH_VISITA || '    ' || v_visitas.MOTIVO || '   ' || v_visitas.NOMBRE);
    contadorVisitas := contadorVisitas+1;
    totalPrecioVisitas := totalPrecioVisitas+v_visitas.precio;
    END LOOP;
    DBMS_OUTPUT_PUT_LINE('TOTAL VISITAS DEL ANIMAL' || contadorVisitas );
    DBMS_OUTPUT_PUT_LINE('TOTAL PRECIO VISITAS' || totalPrecioVisitas);
    contadorVisitas := 0; --PORQUE VA A PASAR A OTRO ANIMAL
    totalPrecioVisitas :=0;--
END;
/

CREATE OR REPLACE FUNCTION existeDNI (p_nombreDueño varchar2)
return varchar2
AS
v_dni dueños.dni%type;
existeDNI boolean;
BEGIN
SELECT DNI INTO v_dni FROM DUEÑOS WHERE NOMBRE = p_nombreDueño;
existeDNI := TRUE;
return existeDNI;
EXCEPTION WHEN NO_DATA_FOUND THEN
existeDNI := FALSE;
return existeDNI;
END;
/

BEGIN 
visi_coste('Esther Flores');
END;

--EJERCICIO 8
create or replace procedure ej8
as
vfuncion mecanicos.funcion%type;
vnempleado mecanicos.nempleado%type;
vdias number;
vmatricula coches_taller.matricula%type;
vnombre clientes_taller.nombre%type;
vimporte arreglos.importe%type;
vfecha_entrada arreglos.fecha_entrada%type;
registro cur3%rowtype;
n number:=1;
cursor cur is select distinct funcion from mecanicos;
cursor cur2 is select nombre,telefono,nempleado from mecanicos where funcion=vfuncion;
cursor cur3 is select coches_taller.matricula,clientes_taller.nombre,importe,fecha_entrada, trunc(fecha_salida-fecha_entrada) dias
from arreglos, clientes_taller,coches_taller where arreglos.matricula=coches_taller.matricula and 
coches_taller.ncliente=clientes_taller.ncliente
and arreglos.nempleado=vnempleado order by fecha_entrada desc;
begin
for vfunc in cur loop
  dbms_output.put_line(vfunc.funcion);
  vfuncion:=vfunc.funcion;
  for vmecanicos in cur2 loop
    dbms_output.put_line(vmecanicos.nombre || ' ' || vmecanicos.telefono);
    vnempleado:=vmecanicos.nempleado;
    open cur3;
    n:=1;
    fetch cur3 into registro;
    while (n<=3 and cur3%found) loop
      if vdias is null then
        vdias:=trunc(sysdate-vfecha_entrada);
      end if;
      dbms_output.put_line(vmatricula || ' ' || vnombre || ' '  || vimporte || ' ' || vfecha_entrada || ' '  || vdias);
      n:=n+1;
      fetch cur3 into registro; --Leer la siguiente línea
      end loop;
    close cur3;
    
  end loop;
  
end loop;


end;

--EJERCICIO 9
CREATE OR REPLACE PROCEDURE mostrarCoches 
AS
CURSOR COCHES IS SELECT MATRICULA,MODELO,AÑO_MATRICULA,NCLIENTE FROM COCHES_TALLER;
CURSOR ARREGLOSTERMINADOS(MAT COCHES_TALLER.MATRICULA%TYPE) IS SELECT MATRICULA,NEMPLEADO,FECHA_ENTRADA,FECHA_SALIDA,IMPORTE,ROWNUM FROM ARREGLOS WHERE FECHA_SALIDA IS NOT NULL AND MATRICULA = MAT ORDER BY FECHA_ENTRADA ASC FOR UPDATE;
BEGIN
DBMS_OUTPUT.PUT_LINE('COCHES:');
    FOR V_COCHES IN COCHES
    LOOP
    DBMS_OUTPUT.PUT_LINE(V_COCHES.MATRICULA || V_COCHES.MODELO || V_COCHES.AÑO_MATRICULA || V_COCHES.NCLIENTE);
    DBMS_OUTPUT.PUT_LINE('ARREGLOS:');
        FOR V_ARREGLOS IN ARREGLOSTERMINADOS(V_COCHES.MATRICULA)
        LOOP
        DBMS_OUTPUT.PUT_LINE(V_ARREGLOS.MATRICULA || V_ARREGLOS.NEMPLEADO || V_ARREGLOS.FECHA_ENTRADA || V_ARREGLOS.FECHA_SALIDA || V_ARREGLOS.IMPORTE);
        IF ARREGLOSTERMINADOS%ROWCOUNT = V_ARREGLOS.ROWNUM THEN        
            dbms_output.put_line('importe actualizado');
            UPDATE ARREGLOS SET IMPORTE = (V_ARREGLOS.IMPORTE * 10 / 100) WHERE CURRENT OF ARREGLOSTERMINADOS;
        END IF;
        END LOOP;
    END LOOP;

END;
/

BEGIN 
mostrarCoches;
END;
--EJERCICIO 10
CREATE OR REPLACE PROCEDURE ej10 
AS 
CURSOR empleados IS SELECT CLIENTES_TALLER.ncliente CLIENTE ,nombre,SUM(IMPORTE)SUMAIMPORTE FROM CLIENTES_TALLER
                    JOIN COCHES_TALLER ON CLIENTES_TALLER.NCLIENTE = COCHES_TALLER.NCLIENTE
                    JOIN ARREGLOS ON COCHES_TALLER.MATRICULA = ARREGLOS.MATRICULA
                    GROUP BY CLIENTES_TALLER.ncliente,nombre
                    ORDER BY SUM(IMPORTE) DESC;
contador number;
registro empleados%rowtype;
BEGIN
    contador:=0;
    OPEN empleados;
    FETCH empleados INTO registro;
   WHILE (contador<3 AND empleados%FOUND) LOOP
DBMS_OUTPUT.PUT_LINE(registro.CLIENTE || ',' || registro.nombre || ',' || registro.SUMAIMPORTE);
   contador:=contador+1;
   FETCH empleados INTO registro;
   END LOOP;
   CLOSE empleados;
END; 
/

BEGIN
ej10;
END;
---EJERCICIO 11

CREATE OR REPLACE PROCEDURE Mostrar_Averias_Emple(p_nombre varchar2)
AS 
v_dni AVERIAS_PARQUE.DNI_EMPLE%TYPE;
v_averiasAcabadas number;
v_averiasSinAcabar number;
CURSOR c_averias IS SELECT COD_ATRACCION,TO_CHAR(FECHA_FALLA,'d') FALLA,FECHA_ARREGLO,COSTE_AVERIA,DNI_EMPLE FROM AVERIAS_PARQUE WHERE DNI_EMPLE = v_dni;
BEGIN
--LLamada a la función de buscar el empleado
v_dni :=Busca_Emple_Parque(p_nombre);
    IF(v_dni IS null) THEN
    DBMS_OUTPUT.PUT_LINE('El empleado no existe');
    END IF;
    IF(v_dni='0') THEN
    DBMS_OUTPUT.PUT_LINE('El empleado no tiene averias');
    END IF;
--Mostrar las averias del empleado si este existe
    DBMS_OUTPUT.PUT_LINE('Averias que ha realizado el empleado');
    FOR v_averias IN c_averias LOOP
    DBMS_OUTPUT.PUT_LINE(v_averias.cod_atraccion ||'  '||v_averias.falla ||'  '||v_averias.fecha_arreglo||'  ' || v_averias.coste_averia || '  ' || v_averias.dni_emple);
    END LOOP;
--Mostrar la cantidad de arreglos del empleado
    SELECT SUM(DECODE(FECHA_ARREGLO, NULL, 0, 1)) "ACABADAS", SUM(DECODE(FECHA_ARREGLO, NULL, 1, 0)) "SINACABAR" INTO v_averiasAcabadas, v_averiasSinAcabar
    FROM AVERIAS_PARQUE
    JOIN ATRACCIONES ON ATRACCIONES.COD_ATRACCION = AVERIAS_PARQUE.COD_ATRACCION
    WHERE DNI_EMPLE = v_dni;
    dbms_output.put_line('ARREGLOS ACABADOS: ' || v_averiasAcabadas || ', ARREGLOS SIN ACABAR: ' || v_averiasSinAcabar);
END; 
/

CREATE OR REPLACE FUNCTION Busca_Emple_Parque(p_nombre VARCHAR2)
RETURN VARCHAR2
AS
    v_dni EMPLE_PARQUE.DNI_EMPLE%TYPE;
    v_averias NUMBER;
BEGIN
    SELECT DNI_EMPLE INTO v_dni FROM EMPLE_PARQUE WHERE NOM_EMPLEADO = p_nombre;
    SELECT COUNT(*) INTO v_averias FROM AVERIAS_PARQUE WHERE DNI_EMPLE = v_dni;
    IF v_averias = 0 THEN
        RETURN '0';
    END IF;
    RETURN v_dni;
EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/


BEGIN
Mostrar_Averias_Emple('Ignacio Peña');
END;

