/*--------------------------------------------------------PROCEDIMIENTOS + FUNCIONES-----------------------------------------*/
--EJ1
CREATE OR REPLACE PROCEDURE precioIncrementado(precio number,porcentaje number, resultado IN OUT number)
AS
BEGIN
    IF porcentaje < 0 AND porcentaje > 100 THEN 
        DBMS_OUTPUT.PUT_LINE('El porcentaje debe estar entre 1 y 100');
    ELSE
        resultado:=precio*porcentaje/100 + precio;
    END IF;
END;
/

DECLARE
    resultado NUMBER(5, 2);
BEGIN
    precioIncrementado(100, 100, resultado);
    dbms_output.put_line(resultado);
END;
--EJ2
CREATE OR REPLACE PROCEDURE pares (numero1 number,numero2 number)
AS
BEGIN
DBMS_OUTPUT.PUT_LINE('Numeros pares comprendidos entre:'||numero1||'y' ||numero2);
FOR i IN numero1 .. numero2 LOOP
IF mod(i,2)=0 THEN
DBMS_OUTPUT.PUT_LINE(i);
END IF;
END LOOP;
END;
/

Execute pares(1,10);
--EJ3
CREATE OR REPLACE PROCEDURE multiplicar (numero1 number)
AS
BEGIN
FOR i IN 0 .. 10 LOOP
DBMS_OUTPUT.PUT_LINE(i*numero1);
END LOOP;
END;
/

Execute multiplicar(4);
--EJ4
CREATE OR REPLACE FUNCTION devueltaAño(fecha date)
RETURN date
AS
BEGIN
RETURN TO_CHAR(fecha,'YYYY');
END;
/
--EJ5
CREATE OR REPLACE FUNCTION diferenciaFecha(fecha1 date,fecha2 date)
RETURN number
AS
diferencia number;
BEGIN 
 diferencia := TO_NUMBER(TO_CHAR(fecha1,'YYYY')-TO_CHAR(fecha2,'YYYY'));
return diferencia;
END;
/
--EJ6
CREATE OR REPLACE FUNCTION numTrienios (fecha1 date,fecha2 date)
RETURN number
AS
trienios number(10);
BEGIN
trienios:=TO_NUMBER(TO_CHAR(fecha1,'YYYY')-TO_CHAR(fecha2,'YYYY')/3);
return trienios;
END;

EXECUTE DBMS_OUTPUT.PUT_LINE(numTrienios(SYSDATE,'8/01/2000'));
--EJ7
CREATE OR REPLACE FUNCTION conversionCaracteres(cadena varchar2)
RETURN varchar2
AS
v_cadena varchar2(30);
BEGIN
v_cadena :=upper(cadena);
v_cadena :=REGEXP_REPLACE(cadena, '[^aA-zZ]',' ');
return v_cadena;
END;
/

EXECUTE DBMS_OUTPUT.PUT_LINE(conversionCaracteres('CA%%MELO'));
--EJ8
CREATE OR REPLACE FUNCTION altaEmpleado (p_apellido VARCHAR2)
RETURN date 
AS
v_fecha_ALT emple.fecha_ALT%TYPE;
BEGIN 
    SELECT fecha_ALT into v_fecha_ALT from emple where p_apellido = emple.apellido;
    return v_fecha_ALT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('El apellido no esta encontrado');
        RETURN NULL;
END;
/
EXECUTE DBMS_OUTPUT.PUT_LINE(altaEmpleado('SANCHEZ'));
--EJ9
CREATE OR REPLACE PROCEDURE nuevoOficio(p_apellido Varchar2,p_oficio Varchar2)
AS
v_apellido emple.apellido%TYPE;
old_oficio emple.oficio%TYPE; 
BEGIN 
SELECT OFICIO INTO old_OFICIO FROM EMPLE where apellido=p_apellido;
DBMS_OUTPUT.PUT_LINE('El oficio antiguo es:'||old_oficio);
UPDATE EMPLE SET OFICIO= p_oficio where apellido=p_apellido;
DBMS_OUTPUT.PUT_LINE('El nuevo oficio es:'||p_oficio);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('EL APELLIDO NO HA SIDO ENCONTRADO');
END;
/
EXECUTE nuevoOficio('SALA','AGRICULTOR');
--EJ10
CREATE OR REPLACE PROCEDURE datosDepartamento(departamento number)
AS 
v_maxSalario emple.salario%type;
v_minSalario emple.salario%type;
v_avgSalario emple.salario%type;
BEGIN
SELECT MAX(SALARIO),MIN(SALARIO),AVG(SALARIO) INTO v_maxSalario,v_minSalario,v_avgSalario FROM EMPLE
WHERE DEPT_NO=departamento;
DBMS_OUTPUT.PUT_LINE('El máximo salario es:'||v_maxSalario);
DBMS_OUTPUT.PUT_LINE('El mínimo salario es:'||v_minSalario);
DBMS_OUTPUT.PUT_LINE('La media del departamento es:'||v_avgSalario);
END;
/

EXECUTE datosDepartamento(10);
--EJ11
CREATE OR REPLACE PROCEDURE obCod(p_serie_titulo varchar2)
AS
v_codSerie serie.serie_id%type;
BEGIN
SELECT SERIE_ID INTO v_codSerie FROM SERIE where serie_titulo=p_serie_titulo;
DBMS_OUTPUT.put_line(v_codSerie);
END;
/
EXECUTE obCod('Borgen');
--EJ12
CREATE OR REPLACE PROCEDURE totalCapitulos(p_serie_id varchar2)
AS
capitulos number(10);
BEGIN
SELECT COUNT(CAPITULO) INTO capitulos FROM CAPITULO where serie_id=p_serie_id;
DBMS_OUTPUT.PUT_LINE('El número de capitulos es:'||capitulos);
EXCEPTION 
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('Hay demasiadas lineas');
END;
/
EXECUTE totalCapitulos('BRGN');
--EJ13
CREATE OR REPLACE FUNCTION rtotalCapitulos(p_serie_id varchar2)
return number
AS
capitulos number(10);
BEGIN  
SELECT COUNT(CAPITULO) INTO capitulos FROM CAPITULO where serie_id=p_serie_id;
return capitulos;
END;
/
EXECUTE DBMS_OUTPUT.PUT_LINE(rtotalCapitulos('BRGN'));
--EJ14
CREATE OR REPLACE FUNCTION rellenarCapitulos (p_serie_id varchar2)
return String
AS
v_capitulos number;
BEGIN
SELECT COUNT(CAPITULO) INTO v_capitulos FROM CAPITULO where serie_id = p_serie_id;
UPDATE SERIE SET CAPITULOS = v_capitulos
where serie_id=p_serie_id;
return 'La serie ha sido rellenada con sus capitulos';
EXCEPTION
WHEN NOT_DATA_FOUND
THEN DBMS_OUTPUT.PUT_LINE('La serie no existe');
return '';
END;
/
EXECUTE DBMS_OUTPUT.PUT_LINE(rellenarCapitulos('BRKNG'));
--EJ15
CREATE OR REPLACE PROCEDURE dimeCantidadPersonajes(nombreAutor varchar2)
AS
personajes number;
BEGIN
SELECT COUNT(PERSONAJE_NOMBRE) INTO personajes FROM REPARTO
JOIN ACTOR ON REPARTO.ACTOR_ID = ACTOR.ACTOR_ID
WHERE ACTOR_NOMBRE=nombreAutor;
DBMS_OUTPUT.PUT_LINE(personajes);
END;
/

EXECUTE dimeCantidadPersonajes('Anna Gunn');
--EJ16
CREATE OR REPLACE PROCEDURE buscarEmpleadoMenosSalario(p_dept_no number)
AS 
v_emp_no number;
BEGIN
SELECT emp_no into v_emp_no FROM emple where dept_no = p_dept_no and salario IN (SELECT MIN(Salario) from emple group by dept_no);
DBMS_OUTPUT.put_line(v_emp_no);
END;
/

EXECUTE buscarEmpleadoMenosSalario(10);
--EJ17
CREATE OR REPLACE PROCEDURE borrarEmpleado(p_emp_no number)
AS
emp_no number;
BEGIN
DELETE EMPLE where emp_no =p_emp_no;
END;
/

EXECUTE borrarEmpleado(7934);
--EJ18
CREATE OR REPLACE PROCEDURE subirSalario(p_dnombre varchar2,porcentaje number)
AS
departamento number;
cod_dept emple.dept_no%type;
BEGIN
SELECT dept_no into departamento from depart where dnombre = p_dnombre; 
IF porcentaje between 0 and 100 
cod_dept:=hallarCodigo(p_dnombre);
THEN  UPDATE EMPLE SET SALARIO = SALARIO+&porcentaje WHERE dept_no=cod_dept;
DBMS_OUTPUT.PUT_LINE('Se ha subido el salario de todo el departamento:'||departamento);
ELSE
DBMS_OUTPUT.PUT_LINE('El porcentaje no es el adecuado');
END IF;
END;
/

CREATE OR REPLACE FUNCTION hallarcodigo(nombre_dept varchar2)
return number
AS
codigo number;
SELECT dept_no into codigo from depart where dnombre=nombre_dept;
return codigo;
END;
/

EXECUTE subirSalario('CONTABILIDAD',33);
--EJ19
--PROCEDURE
CREATE OR REPLACE PROCEDURE alta_acabado_arreglo(p_indicador varchar2,p_matricula varchar2,p_nempleado number,p_importe varchar2)
AS
    v_indicador_erroneo EXCEPTION;
BEGIN
    IF p_indicador= 'A' THEN
        RAISE buscarMatricula;
    ELSE IF p_indicador='T' THEN
        SELECT * FROM ARREGLOS WHERE MATRICULA = p_matricula and fecha_salida is null;
        UPDATE ARRREGLOS SET FECHA_SALIDA = SYSDATE;
    ELSE
        RAISE v_indicador_erroneo;
    END IF;
EXCEPTION 
    WHEN v_indicador_erroneo THEN
        DBMS_OUTPUT.PUT_LINE('El indicador no es el correcto');
END;
/
--FUNCTION
CREATE OR REPLACE FUNCTION buscarMatricula(p_matricula varchar2)
RETURN BOOLEAN
AS
    v_matricula arreglos.matricula%type;
BEGIN
    SELECT matricula into v_matricula from Coches_Taller where matricula=p_matricula;
    RETURN TRUE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        IF  (SUBSTR(p_matricula, 1, 4) BETWEEN '0000' AND '9999') AND
            (SUBSTR(p_matricula, 5, 3) BETWEEN 'AAA' AND 'ZZZ') THEN
            UPDATE COCHES_TALLER SET MATRICULA = p_matricula
            where ncliente=0;
            RETURN TRUE;
        END IF;
        RETURN FALSE;
END;
/
--BLOCK ANONYMOUS
DECLARE
    existeMatricula boolean;
BEGIN
    existeMatricula := buscarMatricula('1111BBB');
    if existeMatricula then
        DBMS_OUTPUT.PUT_LINE('lA MATRICULA EXISTE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('LA MATRICULA NO EXISTE');  
    END IF;
END;
/
--EJ20
CREATE OR REPLACE PROCEDURE PBORRA_AUTOR(p_idAutor varchar2)
AS
v_idAutor varchar2(30);
BEGIN
DELETE LIBROS WHERE IDAUTOR= p_idAutor;
DELETE AUTORES WHERE IDAUTOR = p_idAutor;
DBMS_OUTPUT.PUT_LINE('El autor ha sido borrado con exito');
END;
/
EXECUTE PBORRA_AUTOR(3);
--EJ21
DECLARE
id_autor varchar2(30):=&id_autor;
BEGIN
PBORRA_AUTOR(id_autor);
END;
/
--EJ22

CREATE OR REPLACE FUNCTION FCUANTOS_LIBROS(p_idAutor varchar2)
RETURN NUMBER
AS
numeroLibros number(3);
BEGIN
SELECT COUNT(IDLIBRO)INTO numeroLibros FROM LIBROS where idautor = p_idAutor;
RETURN numeroLibros;
END;
/
EXECUTE dbms_output.put_line(FCUANTOS_LIBROS(0));
--EJ23
CREATE OR REPLACE FUNCTION  FEXISTE_AUTOR(id number)
RETURN BOOLEAN
AS
idAutor varchar2(30);
existeAutor boolean;
BEGIN
SELECT IDAUTOR INTO idAutor FROM AUTORES where idAutor=id;
return true;
END;
/

DECLARE
existeAutor boolean;
BEGIN
existeAutor :=(FEXISTE_AUTOR(10));
dbms_output.put_line(sys.diutil.bool_to_int(existeAutor));
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('No existe el autor');
END;
/
--EJ24
CREATE OR REPLACE PROCEDURE PINSERTA_LIBRO(p_titulo varchar2, p_numpaginas NUMBER, p_idAutor NUMBER)
AS
v_idAutorEncontrado autores.idautor%type;
v_idLibro LIBROS.IDLIBRO%TYPE;
BEGIN
    SELECT idAutor  INTO v_idAutorEncontrado from AUTORES where idAutor=p_idAutor;
    SELECT COUNT(*)+1 INTO v_idLibro FROM LIBROS;
    INSERT INTO LIBROS values (v_idLibro,p_titulo,p_numpaginas,SYSDATE,p_idAutor);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No se ha podido insertar el libro,ya que el autor no existe');
END;
/
--EJ25
DECLARE 
v_titulo varchar2(30):='&v_titulo';
v_numpaginas number(30):=&v_numpaginas;
v_idAutor number(30):=&v_idAutor; 
BEGIN
PINSERTA_LIBRO(v_titulo,v_numpaginas,v_idAutor);
END;
/
--EJ26
CREATE OR REPLACE FUNCTION invertirCadena(cadena varchar2)
return varchar2
AS
cadenaInvertida varchar2(30);
longitudCadena number(30);
BEGIN
longitudCadena:=length(cadena);
FOR I IN REVERSE 1.. longitudCadena LOOP
cadenaInvertida := cadenaInvertida || substr(cadena,i,1);
END LOOP;
return cadenainvertida;
END;
/

DECLARE
cadenaInvertida varchar2(30);
BEGIN
cadenaInvertida:=invertirCadena('perro');
END;
/
--EJ27
CREATE OR REPLACE PROCEDURE pedir_Revision(p_Animal varchar2,p_nombreVeterinario varchar2)
AS 
v_buscaVet number(30);
v_existeAnimal varchar2(30);
e_esNull exception;
e_noEncontrado exception;
e_demasiadosRegistros exception;
BEGIN
   v_existeAnimal:=busca_Animal(p_Animal);
IF (p_Animal is null OR p_nombreVeterinario is null) THEN 
       RAISE e_esNull;
ELSE
   IF(v_existeAnimal='1001') THEN
     RAISE e_noEncontrado;
    ELSIF (v_existeAnimal='1002') THEN
     RAISE e_demasiadosRegistros;
     END IF;
     END IF;
END IF;
   v_buscaVet:=busca_Vet(p_nombreVeterinario);
IF v_existeAnimal is not null AND v_buscavet is not null THEN
   INSERT INTO VISITAS VALUES (v_existeAnimal,SYSDATE,v_buscaVet,'Revisión',null,null);
END IF;
EXCEPTION 
    WHEN e_esNull THEN
    DBMS_OUTPUT.PUT_LINE('Los valores no pueden ser nulos');
    WHEN e_demasiadosRegistros THEN
    DBMS_OUTPUT.PUT_LINE('Hay demasiados registros');
    WHEN e_noEncontrado THEN
    DBMS_OUTPUT.PUT_LINE('El animal no ha sido encontrado');
END;
/

CREATE OR REPLACE FUNCTION busca_Animal(p_Animal varchar2)
return varchar2
AS
v_identificador animales.ident%type;
BEGIN
IF(p_Animal between '0' and '100') THEN
SELECT IDENT INTO v_identificador FROM ANIMALES where IDENT = p_Animal;
return v_identificador;
ELSE
SELECT IDENT INTO v_identificador FROM ANIMALES where NOMBRE = p_Animal;
return v_identificador;
END IF;
EXCEPTION 
WHEN NO_DATA_FOUND THEN
return '1001';
WHEN TOO_MANY_ROWS THEN
return '1002';
END;
/

CREATE OR REPLACE FUNCTION busca_Vet(p_nombreVeterinario varchar2)
return number
AS 
v_numColegiado veterinarios.numColegiado%type;
BEGIN 
SELECT NUMCOLEGIADO INTO v_numColegiado FROM VETERINARIOS WHERE NOMBRE like '%'||p_nombreVeterinario||'%';
return v_numColegiado;
EXCEPTION 
WHEN NO_DATA_FOUND THEN
SELECT NUMCOLEGIADO INTO v_numColegiado FROM VETERINARIOS WHERE NUMCOLEGIADO = (SELECT MAX(NUMCOLEGIADO) FROM VETERINARIOS);
return v_numColegiado;
WHEN TOO_MANY_ROWS THEN
SELECT MAX(NUMCOLEGIADO) INTO v_numColegiado FROM VETERINARIOS WHERE NOMBRE like '%'||p_nombreVeterinario||'%';
return v_numColegiado;
END;
/


DECLARE
BEGIN
pedir_Revision('null','ANA');
END;
/