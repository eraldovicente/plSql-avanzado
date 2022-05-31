ALTER TABLE CLIENTES ADD COMENTARIOS BLOB DEFAULT EMPTY_BLOB();
/
DESC CLIENTES;
/
SELECT * FROM CLIENTES;
/
CREATE OR REPLACE PROCEDURE CARGA_COMENTARIOS
IS
    CURSOR CLI IS SELECT * FROM CLIENTES FOR UPDATE;
    FICHERO VARCHAR2(100);
    COMENTARIOS BFILE;
    TEMPORAL BLOB;
BEGIN
    FOR C1 IN CLI LOOP
        -- NOMBRE DEL FICHERO
        FICHERO := 'COMENTARIOS'||C1.CODIGO||'.docx';
        -- ASOCIAR EL FICHERO AL BFILE
        COMENTARIOS := BFILENAME('FICHEROS', FICHERO);
        -- ABRIR EL FICHERO, ES OBLIGATORIO SI QUEREMOS USAR LOADFROMFILE 
        DBMS_LOB.OPEN(COMENTARIOS, DBMS_LOB.LOB_READONLY);
        -- ES NECESARIO CREAR UN LOB TEMPORAL, PARA INICIALIZAR EL LOCALIZADOR
        DBMS_LOB.CREATETEMPORARY(TEMPORAL, TRUE);
        -- CARGAMOS EL FICHERO A LA VARIABLE TEMPORAL
        DBMS_LOB.LOADFROMFILE(TEMPORAL, COMENTARIOS, DBMS_LOB.GETLENGTH(COMENTARIOS));
        -- MODIFICAMOS LA COLUMNA DE LA TABLA
        UPDATE CLIENTES SET COMENTARIOS=TEMPORAL WHERE CURRENT OF CLI;
        -- CERRAMOS EL FICHERO
        DBMS_LOB.CLOSE(COMENTARIOS);
    END LOOP;
END;

EXECUTE CARGA_COMENTARIOS;

SELECT * FROM CLIENTES;