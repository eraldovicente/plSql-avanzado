CREATE OR REPLACE TYPE empleado IS
    TABLE OF VARCHAR2(100);
/

SET SERVEROUTPUT ON

DECLARE
    empleados empleado;
BEGIN
    empleados := empleado(
                         'SERGIO',
                         'ALBERTO',
                         'ROSA'
                 );
    dbms_output.put_line(empleados(1));
    dbms_output.put_line(empleados(2));
END;
/

DESC EMPLEADO;

SELECT
    *
FROM
    USER_TYPES;