SET SERVEROUTPUT ON;

DECLARE
    TYPE v1 IS
        VARRAY(50) OF VARCHAR2(100);
    var1 v1 := v1(
                 'ERALDO',
                 'HOLA',
                 'BIANA'
               );
BEGIN
    dbms_output.put_line(var1(1));
    var1(1) := 'FABIANA';
    dbms_output.put_line(var1(1));
END;
/