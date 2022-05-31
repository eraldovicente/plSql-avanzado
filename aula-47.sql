--EXECUTE IMMEDIATE CADENA
INSERT INTO pr2 VALUES (
    1,
    'DATO1'
);

INSERT INTO pr2 VALUES (
    2,
    'DATO2'
);

INSERT INTO pr2 VALUES (
    3,
    'DATO3'
);

CREATE OR REPLACE FUNCTION ejemplo_dml RETURN NUMBER
    AUTHID current_user
IS
    comando VARCHAR2(100);
    filas   NUMBER;
BEGIN
    comando := 'DELETE FROM PR2';
    dbms_output.put_line(comando);
    EXECUTE IMMEDIATE ( comando );
    RETURN filas;
END;
/

BEGIN
    dbms_output.put_line('SE HAN BORRADO '
                         || ejemplo_dml
                         || ' FILAS');
END;
/