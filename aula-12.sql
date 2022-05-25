SET SERVEROUTPUT ON;

DECLARE
    TYPE cursor_variable IS REF CURSOR RETURN employees%rowtype;
    v1        cursor_variable;
    v2        cursor_variable;
    empleados employees%rowtype;
BEGIN
    --ABRIMOS EL CURSOR CON LA PRIMERA VARIABLE
    OPEN v1 FOR SELECT
                    *
                FROM
                    employees
                ORDER BY
                    first_name;

    FETCH v1 INTO empleados;
    dbms_output.put_line(empleados.first_name
                         || ' '
                         || empleados.salary);
    
    -- ASIGNAMOS V1 A V2
    v2 := v1;
    FETCH v2 INTO empleados;
    dbms_output.put_line(empleados.first_name
                         || ' '
                         || empleados.salary);
    FETCH v1 INTO empleados;
    dbms_output.put_line(empleados.first_name
                         || ' '
                         || empleados.salary);
    FETCH v2 INTO empleados;
    dbms_output.put_line(empleados.first_name
                         || ' '
                         || empleados.salary);
    CLOSE v1;
END;