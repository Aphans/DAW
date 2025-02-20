CREATE OR REPLACE TRIGGER TRG_SUPERPOBLACION
AFTER INSERT OR DELETE ON PAIS
    FOR EACH ROW
    WHEN (new.num_hab > 90000000)
    BEGIN
        IF INSERTING THEN
            INSERT INTO PAISES_SUPERPOBLADOS VALUES (:NEW.COD_PAIS,:NEW.NOMBRE,:NEW.NUM_HAB,:NEW.EXTENSION,(:NEW.NUM_HAB)/:NEW.EXTENSION);
        ELSE IF DELETING THEN
            DELETE PAISES_SUPERPOBLADOS WHERE COD_PAIS = :OLD.COD_PAIS;
        END IF;
        END IF;
    EXCEPTION 
    WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('El país ya existe');
    END;