CREATE OR REPLACE FUNCTION tam (
    directorio VARCHAR2,
    codigo     NUMBER
) RETURN NUMBER IS
    fichero VARCHAR2(100);
    foto    BFILE;
BEGIN
    fichero := 'cliente'
               || codigo
               || '.jpg';
    foto := bfilename(
                     directorio,
                     fichero
            );
    IF dbms_lob.fileexists(foto) = 1 THEN
        RETURN dbms_lob.getlength(foto);
    ELSE
        RETURN 0;
    END IF;

END;
/

SET SERVEROUTPUT ON
EXECUTE DBMS_OUTPUT.PUT_LINE(TAM('FICHEROS', 5));