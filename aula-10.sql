DECLARE
    TYPE c1 IS REF CURSOR RETURN departments%rowtype;
    v1            c1;
    departamentos departments%rowtype;
BEGIN
    OPEN v1 FOR SELECT
                    *
                FROM
                    departments
                WHERE
                    department_id > 150;

    FETCH v1 INTO departamentos;
    WHILE v1%found LOOP
        dbms_output.put_line(departamentos.department_name);
        FETCH v1 INTO departamentos;
    END LOOP;

    CLOSE v1;
END;