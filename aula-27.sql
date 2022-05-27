-- NESTED TABLES
-- NO TIENEN LIMITE DEFINIDO
-- SE ACCEDE POR POSICIÓN
-- SPARSE - DISPERSOS HUECOS
-- VARRAYS
SET SERVEROUTPUT ON

DECLARE
    TYPE empleado IS
        TABLE OF employees%rowtype;
    empleados empleado := empleado();
BEGIN
    SELECT
        *
    BULK COLLECT
    INTO empleados
    FROM
        employees
    FETCH FIRST 10 ROWS ONLY;

    FOR i IN empleados.first()..empleados.last() LOOP
        dbms_output.put_line(empleados(i).first_name
                             || ' '
                             || empleados(i).salary);
    END LOOP;

    dbms_output.put_line(empleados.last());
    dbms_output.put_line(empleados.first());
    dbms_output.put_line(empleados.next(1));
    IF empleados.EXISTS(20) THEN
        dbms_output.put_line('EXISTE');
    ELSE
        dbms_output.put_line('NO EXISTE');
    END IF;  
    -- EMPLEADOS.DELETE(2);
    FOR i IN empleados.first()..empleados.last() LOOP
        IF empleados.EXISTS(i) THEN
            dbms_output.put_line(empleados(i).first_name
                                 || ' '
                                 || empleados(i).salary);

        END IF;
    END LOOP;

END;
/