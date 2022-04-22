--EJ1
CREATE OR REPLACE FUNCTION verTitulo(pRental_id number)
RETURN varchar2
AS
    v_titulo FILM.title%type;
    BEGIN
    SELECT TITLE INTO v_titulo FROM FILM 
        JOIN INVENTORY ON FILM.FILM_ID = INVENTORY.FILM_ID
        JOIN RENTAL ON RENTAL.INVENTORY_ID = INVENTORY.INVENTORY_ID
        WHERE RENTAL_ID = pRental_id;
    return v_titulo;
    EXCEPTION 
    WHEN
    NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No existe ningún rental');
    END;
    /

DECLARE
v_titulo varchar2(64);
BEGIN
v_titulo:=verTitulo(1);
DBMS_OUTPUT.PUT_LINE(v_titulo);
END;


--EJ2
CREATE OR REPLACE FUNCTION verID (pName varchar2)
RETURN number
AS  
    v_id CUSTOMER.CUSTOMER_ID%TYPE;
    BEGIN
    SELECT CUSTOMER_ID INTO v_id FROM CUSTOMER WHERE UPPER(FIRST_NAME) LIKE '%' || UPPER(pName) || '%';
    return v_id;
    EXCEPTION 
    WHEN
    NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('El cliente no ha sido encontrado');
    return 0;
    WHEN TOO_MANY_ROWS THEN
     SELECT CUSTOMER_ID INTO v_id FROM CUSTOMER WHERE UPPER(FIRST_NAME) LIKE '%' || UPPER(pName) || '%' AND ROWNUM=1;
     return v_id;
    END;
    /

DECLARE
v_id number(38);
BEGIN
v_id:=verID('MAR');
DBMS_OUTPUT.PUT_LINE(v_id);
END;

--EJ3
CREATE OR REPLACE PROCEDURE peliculasAlquiladas(pName varchar2)
AS
    v_customerID number(38);
    CURSOR c_verPeliculas IS SELECT TITLE FROM FILM
                            JOIN INVENTORY ON FILM.FILM_ID = INVENTORY.FILM_ID
                            JOIN RENTAL ON RENTAL.INVENTORY_ID = INVENTORY.INVENTORY_ID
                            WHERE CUSTOMER_ID = v_customerID;
    contador number:=0;
    BEGIN
    v_customerID:=verID(pName);
        FOR v_peliculas IN c_verPeliculas LOOP
        DBMS_OUTPUT.PUT_LINE(v_peliculas.title);
        contador:=contador+1;
        END LOOP;
    DBMS_OUTPUT.PUT_LINE('Hay:'||' '||contador||' '||'peliculas alquiladas con este nombre');
    END;
    
BEGIN
peliculasAlquiladas('Mar');
END;


--EJ4
CREATE OR REPLACE PROCEDURE verActores(pTituloPelicula varchar2)
AS
    CURSOR c_verActores IS SELECT FIRST_NAME,LAST_NAME FROM ACTOR 
                            JOIN FILM_ACTOR ON FILM_ACTOR.ACTOR_ID = ACTOR.ACTOR_ID
                            JOIN FILM ON FILM_ACTOR.FILM_ID = FILM.FILM_ID
                            WHERE UPPER(TITLE) LIKE '%'||UPPER(pTituloPelicula)||'%';
    registro c_verActores%rowtype;
    BEGIN
        OPEN c_verActores;
        FETCH c_verActores INTO registro;
            WHILE c_verActores%FOUND LOOP
             DBMS_OUTPUT.PUT_LINE(registro.FIRST_NAME ||' '||registro.LAST_NAME);
        FETCH c_verActores INTO registro;
             END LOOP;
        CLOSE c_verActores;
    EXCEPTION 
    WHEN
    NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('La película no existe');
    END;

BEGIN
verActores('ACADEMY DINOSAUR');
END;