SET SERVEROUTPUT ON;

-- SYS_REFCURSOR

DECLARE
    --TYPE CURSOR_VARIABLE IS REF CURSOR;
    v1            SYS_REFCURSOR;
    departamentos departments%rowtype;
BEGIN
    OPEN v1 FOR SELECT
                    *
                FROM
                    departments;

    FETCH v1 INTO departamentos;
    WHILE v1%found LOOP
        dbms_output.put_line(departamentos.department_name);
        FETCH v1 INTO departamentos;
    END LOOP;

    CLOSE v1;
END;