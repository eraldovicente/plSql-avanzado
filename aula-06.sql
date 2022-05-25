DESC USER_DEPENDENCIES;

SELECT
    *
FROM
    user_dependencies
WHERE
    referenced_name = 'PRUEBA';

CREATE OR REPLACE PROCEDURE prueba_p IS
    x NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO x
    FROM
        prueba_v;

END;
/

SELECT
    *
FROM
    user_dependencies
WHERE
    referenced_name = 'PRUEBA_V';

-- utldtree;

EXECUTE DEPTREE_FILL('TABLE', 'HR', 'PRUEBA');
SELECT * FROM DEPTREE;
SELECT LPAD(SEQ#, NESTED_LEVEL*1+1, '*') || ' ' || TYPE || ' ' || SCHEMA || ' ' || NAME FROM DEPTREE;