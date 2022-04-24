----------------------------------------------EJ1---------------------------------------------------
CREATE ROLE ROL; --Crear rol
GRANT INSERT,SELECT ON DEPART TO ROL; --Dar permiso de insert,select en la tabla depart a el rol
GRANT INSERT,SELECT ON EMPLE TO ROL; --Dar permioso de insertar,select en la tabla emple a el rol
GRANT CREATE SESSION,CREATE DATABASE LINK,CREATE TABLE, CREATE VIEW TO ROL;
--Dar permiso de crear sesiones,database link,crear tablas y crear vistas a el rol
----------------------------------------------EJ2---------------------------------------------------
CREATE USER COMPRADOR IDENTIFIED BY COMPRADOR --Crear usuario con la misma contraseña
DEFAULT TABLESPACE USERS --Tablespace por defecto
QUOTA 1M ON USERS --CUOTA DE 1 MEGA EN USERS
QUOTA 0M ON SYSTEM --CUOTA DE 0 MEGAS EN SYSTEM
TEMPORARY TABLESPACE TEMP; --Tablespace temporal llamado TEMP
GRANT ROL TO COMPRADOR; --Dar el rol 'ROL' a comprador
GRANT CREATE SESSION TO COMPRADOR; --Dar permiso para conectarse
----------------------------------------------EJ3---------------------------------------------------
SELECT * FROM alumno.DEPART; --Select sobre el esquema alumno, la tabla depart
--Es posible hacer el select porque tiene asignado el rol 'ROL' e este tiene permisos para ello
----------------------------------------------EJ4---------------------------------------------------
A)Crear un usuario llamado ADMINISTRADOR con la misma
password que tenga funciones de administrador 
--SOLUCIÓN:
    CREATE USER ADMINISTRADOR IDENTIFIED BY ADMINISTRADOR; --Creación de usuario
    GRANT DBA TO ADMINISTRADOR; --Dar permisos de administrador. Todos los permisos.

B)Conectarse con el nombre del usuario creado 
--SOLUCIÓN:
    --SE CONECTA SIN PROBLEMAS, YA QUE TIENE TODOS LOS PERMISOS MEDIANTE EL ROL ADMINISTRADOR.


C)Crear tres tablas (TABLA, TABLA2 Y TABLA3) formadas por un
único campo: n que es un numérico de 10 dígitos, en el propio
esquema
--SOLUCIÓN:
    CREATE TABLE TABLA( --Creación tabla
    n number(10)
    );

    CREATE TABLE TABLA2( --Creación tabla 2
    n number(10)
    );

    CREATE TABLE TABLA3( --Creación tabla 3
    n number(10)
    );

D)Crear 5 usuarios nuevos (USU1, USU2,...,USU5) con la misma
password asignándoles como tablespace por defecto USERS y
cuota de 2M en USERS.
--SOLUCIÓN:
    CREATE USER USU1 IDENTIFIED BY USU1
    DEFAULT TABLESPACE USERS --Tablespace por defecto
    QUOTA 2M ON USERS; --Cuota en el tablespace

    CREATE USER USU2 IDENTIFIED BY USU2
    DEFAULT TABLESPACE USERS
    QUOTA 2M ON USERS;

    CREATE USER USU3 IDENTIFIED BY USU3
    DEFAULT TABLESPACE USERS
    QUOTA 2M ON USERS;

    CREATE USER USU4 IDENTIFIED BY USU4
    DEFAULT TABLESPACE USERS
    QUOTA 2M ON USERS;

    CREATE USER USU5 IDENTIFIED BY USU5
    DEFAULT TABLESPACE USERS
    QUOTA 2M ON USERS;


E)Dar permisos a USU1 para que pueda conectarse a la BD. 
--SOLUCIÓN:
    GRANT CREATE SESSION TO USU1;


H)Conceder al USU4 privilegios sobre TABLA1 y sobre TABLA2 de
inserción y borrado con la opción de poder concedérselos a otros
usuarios. 
--SOLUCIÓN:
    GRANT INSERT,DELETE ON TABLA1 TO USU4 WITH GRANT OPTION; 
    --Permisos de insertar y eliminar en la tabla 1 para el usuario 4, e también
    --poder dar estos permisos a otros usuarios
    GRANT INSERT,DELETE ON TABLA2 TO USU4 WITH GRANT OPTION;
    --Permisos de insertar y eliminar en la tabla 2 para el usuario 4, e también
    --poder dar estos permisos a otros usuarios


I)Conceder al usuario USU5 privilegios para crear tablas y para
crear usuarios con la opción de poder concedérselos a otros
usuarios. Además, asígnale privilegios para que pueda crear y
modificar tablespace. 
--SOLUCIÓN:
    GRANT CREATE TABLE,CREATE USER TO USU5 WITH ADMIN OPTION;
    --Conceder al usuario USU5 privilegios para crear tablas y para
    --crear usuarios con la opción de poder concedérselos a otros usuarios
    GRANT CREATE TABLESPACE, ALTER TABLESPACE TO USU5;
    --asígnale privilegios para que pueda crear y modificar tablespace

J)Conceder a todos los usuarios de la BD privilegios para que
puedan modificar columnas de TABLA1 y TABLA2. 
--SOLUCIÓN:
    GRANT ALTER ON TABLA TO PUBLIC;
    GRANT ALTER ON TABLA2 TO PUBLIC;

K)Quitar a los usuarios USU3 y USU4 todos los privilegios q tenían
asignados.
--SOLUCIÓN:
REVOKE ALL PRIVILEGES ON TABLA FROM USU3;
REVOKE ALL PRIVILEGES ON TABLA2 FROM USU4;


L)Hacer que USU5 solo pueda conectarse en dos sesiones
concurrentes a la vez. 
--SOLUCIÓN:
    CREATE PROFILE SESSIONS_LIMIT LIMIT --Se crea un perfil para asignar el numero de sesioenes
    SESSIONS_PER_USER 2;
    ALTER USER USU5 PROFILE SESSIONS_LIMIT; --Se asigna el perfil a el usuario usu5

M)Limitar el tiempo de conexión a la BD a 5 minutos a los usuarios
USU2 y USU3. 
--SOLUCIÓN:
    CREATE PROFILE P_INACTIVE LIMIT
    IDLE_TIME 5; --Se crea un perfil para asignar el tiempo de conexión
    ALTER USER USU2 PROFILE P_INACTIVE; --Se asigna este tiempo de conexión a los usuarios
    ALTER USER USU3 PROFILE P_INACTIVE;