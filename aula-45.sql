-- EXECUTE IMMEDIATE CADENA
/*
    CREATE TABLE NOM (V1 NUMBER, V2 VARCHAR2(200));
*/

CREATE OR REPLACE PROCEDURE crear_tabla (
    nombre_tabla VARCHAR2,
    columnas     VARCHAR2
)
    AUTHID current_user --DEFINER
IS
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE '
                      || nombre_tabla
                      || '('
                      || columnas
                      || ')';
END;
/

BEGIN
    crear_tabla(
               'PR2',
               'CODIGO NUMBER, DATOS VARCHAR2(100)'
    );
END;
/