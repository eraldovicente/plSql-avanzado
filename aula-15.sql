SET SERVEROUTPUT ON

DECLARE
    TYPE departamentos IS
        TABLE OF departments.department_name%TYPE INDEX BY PLS_INTEGER;
    depts   departamentos;
    CURSOR cur_dept IS
    SELECT
        *
    FROM
        departments;

    x       PLS_INTEGER := 1;
    TYPE empleados IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    emples  empleados;
    TYPE nombre IS
        TABLE OF employees.first_name%TYPE INDEX BY VARCHAR2(2);
    nombres nombre;
BEGIN
    FOR dep1 IN cur_dept LOOP
        depts(x) := dep1.department_name;
        x := x + 1;
    END LOOP;

    FOR i IN 1..x-1 LOOP
        dbms_output.put_line(depts(i));
    END LOOP;

END;
/
--SPARSE ARRAY