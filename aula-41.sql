CREATE OR REPLACE PROCEDURE carga_descri IS

    CURSOR cli IS
    SELECT
        *
    FROM
        clientes
    FOR UPDATE;

    temporal CLOB;
    cantidad INTEGER := 5;
    posicion INTEGER := 1;
BEGIN
    FOR c1 IN cli LOOP
        -- ABRIR EL FICHERO. ES OBLIGATORIO
        dbms_lob.open(c1.description.dbms_lob.lob_readonly);
        -- LEEMOS 5 POSICIONES DE NUESTRO CAMPO DESCRIPCION Y LO DEJAMOS EN LA VARIABLE TEMPORAL
        dbms_lob.read(
                     c1.descripcion,
                     cantidad,
                     posicion,
                     temporal
        );
        -- INSERT INTO PRUEBA_LOB VALUES (DBMS_LOB.WRITE(DESCRIP,5,1,TEMPORAL));
        INSERT INTO prueba_lob VALUES ( temporal );
        -- CERRAR EL LOB
        dbms_lob.close(c1.descripcion);
    END LOOP;
END;
/

EXECUTE CARGA_DESCRI;

SELECT
    *
FROM
    prueba_lob;

SELECT
    *
FROM
    clientes;