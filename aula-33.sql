--EMPTY_CLOB()
--EMPTY_BLOB()

INSERT INTO pru_lob VALUES (
    3,
    'JUAN',
    empty_clob(),
    empty_blob()
);

SELECT
    *
FROM
    pru_lob;