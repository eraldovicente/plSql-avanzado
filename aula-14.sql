SET SERVEROUTPUT ON

DECLARE
    TYPE departamentos IS
        TABLE OF departments.department_name%TYPE INDEX BY PLS_INTEGER;
    depts   departamentos;
    TYPE empleados IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    emples  empleados;
    TYPE nombre IS
        TABLE OF employees.first_name%TYPE INDEX BY VARCHAR2(2);
    nombres nombre;
BEGIN
    depts(1)      := 'HOLA';
    depts(2)      := 'ADIOS';
    depts(50)     := 'OTRO VALOR';
    depts(-10)    := 'SIGUIENTE VALOR';
    nombres('AA') := 'ERALDO';
    dbms_output.put_line(depts(2));
    dbms_output.put_line(depts(-10));
    dbms_output.put_line(nombres('AA'));
END;
/
--SPARSE ARRAY