DECLARE
    TYPE suma_salarios IS RECORD (
        nombre        departments.department_name%TYPE,
        suma_salarios NUMBER
    );
    TYPE suma_sal IS
        TABLE OF suma_salarios INDEX BY PLS_INTEGER;
    salarios suma_sal;
BEGIN
    SELECT
        department_name,
        SUM(salary)
    BULK COLLECT
    INTO salarios
    FROM
        employees
        JOIN departments USING ( department_id )
    GROUP BY
        department_name;

    FOR i IN 1..salarios.count() LOOP
        dbms_output.put_line(salarios(i).nombre
                             || ' '
                             || salarios(i).suma_salarios);
    END LOOP;

    dbms_output.put_line('NÚMERO EMPLEADOS:' || salarios.count());
    dbms_output.put_line('PRIMER REGISTRO:' || salarios.first());
    dbms_output.put_line('ULTIMO REGISTRO:' || salarios.last());
    IF salarios.EXISTS(20) THEN
        dbms_output.put_line('EXISTE');
    ELSE
        dbms_output.put_line('NO EXISTE');
    END IF;

    salarios.DELETE(1);
    dbms_output.put_line('PRIMER REGISTRO:' || salarios.first());
    dbms_output.put_line(salarios.PRIOR(3));
    dbms_output.put_line(salarios.next(3));
    salarios.DELETE(4);
    dbms_output.put_line(salarios.PRIOR(3));
    dbms_output.put_line(salarios.next(3));
END;
/