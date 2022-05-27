CREATE OR REPLACE TYPE dato IS
    VARRAY(80) OF VARCHAR2(100);
/

DESC DATO;

---------------------------

SET SERVEROUTPU ON;

DECLARE
    datos dato;
BEGIN
    datos := dato(
                 'UNO',
                 'DOS'
             );
    dbms_output.put_line(datos(1));
END;