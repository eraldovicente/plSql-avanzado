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

END;
/