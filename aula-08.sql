SET SERVEROUTPUT ON;

DECLARE
-- CURSOR C1 IS SELECT * FROM EMPLOYEES;
    TYPE cursor_variable IS REF CURSOR;
    v1        cursor_variable;
    x1        cursor_variable;
    empleados employees%rowtype;
BEGIN
    OPEN v1 FOR SELECT
                    *
                FROM
                    employees;

    FETCH v1 INTO empleados;
    dbms_output.put_line(empleados.first_name
                         || ' '
                         || empleados.salary);
    CLOSE v1;
END;