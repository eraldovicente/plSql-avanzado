SET SERVEROUTPUT ON;

DECLARE
    TYPE departamentos IS
        TABLE OF departments.department_name%TYPE INDEX BY PLS_INTEGER;
    depts  departamentos;
   -- CURSOR C1 IS SELECT * FROM DEPARTMENTS;

    TYPE empleados IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    x      NUMBER := 0;
    emples empleados;
BEGIN
    SELECT
        *
    BULK COLLECT
    INTO emples
    FROM
        employees
    WHERE
        salary > 5000;

    FOR i IN 1..emples.count() LOOP
        dbms_output.put_line(emples(i).first_name);
    END LOOP;

END;
/