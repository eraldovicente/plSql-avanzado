SET SERVEROUTPUT ON;

DECLARE
    TYPE empleado IS
        VARRAY(10) OF employees%rowtype;
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
    dbms_output.put_line(empleados.next(10));
    IF empleados.EXISTS(11) THEN
        dbms_output.put_line('EXISTE');
    ELSE
        dbms_output.put_line('NO EXISTE');
    END IF;  
    -- EMPLEADOS.DELETE(2); -- NÃO PODE USAR TEM QUE TER POSIÇÕES CONTÍNUAS 
END;
/