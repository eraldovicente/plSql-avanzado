CREATE TABLE prueba (
    c1 NUMBER,
    c2 NUMBER
);

SELECT
    *
FROM
    user_objects
WHERE
    object_name LIKE 'PRUEBA%';

CREATE VIEW prueba_v AS
    SELECT
        c1
    FROM
        prueba;

SELECT
    *
FROM
    user_objects
WHERE
    object_name LIKE 'PRUEBA%';

ALTER TABLE prueba MODIFY
    c2 VARCHAR2(100);

ALTER TABLE prueba MODIFY
    c1 VARCHAR2(100);

SELECT
    *
FROM
    prueba_v;

ALTER TABLE prueba DROP COLUMN c1;