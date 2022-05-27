CREATE TABLE prueba1 (
    c1 NUMBER,
    c2 dato,
    c3 VARCHAR2(60)
);

DESC PRUEBA;
DESC DATO;

SELECT
    *
FROM
    user_types;

SELECT
    *
FROM
    user_varrays;

SELECT
    *
FROM
    prueba1;

INSERT INTO prueba1 VALUES (
    100,
    dato(
        'UNO', 'DOS'
    ),
    'EJEMPLO'
);

INSERT INTO prueba1 VALUES (
    100,
    dato(
        'AA', 'BB'
    ),
    'EJEMPLO'
);

SELECT
    c2
FROM
    prueba1;

--SELECT C2(1) FROM PRUEBA1;

SELECT
    c1,
    t2.*,
    c3
FROM
    prueba1,
    TABLE ( prueba1.c2 ) t2;