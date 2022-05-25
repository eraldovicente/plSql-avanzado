SET SERVEROUTPUT ON;

DECLARE
-- CURSOR C1 IS SELECT * FROM EMPLOYEES;
    TYPE cursor_variable IS REF CURSOR;
    v1            cursor_variable;
    x1            cursor_variable;
    empleados     employees%rowtype;
    departamentos departments%rowtype;
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
    OPEN v1 FOR SELECT
                    *
                FROM
                    departments;

    FETCH v1 INTO departamentos;
    dbms_output.put_line(departamentos.department_name);
END;