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
    dbms_output.put_line(var1.count());
    dbms_output.put_line(var1.limit());
    var1.extend();
    dbms_output.put_line(var1.count());
    var1.extend(5);
    dbms_output.put_line(var1.count());
    --VAR1.EXTEND(50);
END;
/