CREATE TABLE pru_lob (
    codigo NUMBER,
    nombre VARCHAR2(100),
    datos  CLOB
);

DESC PRU_LOB;

INSERT INTO pru_lob VALUES (
    1,
    'ERALDO',
    'SFGFJOERWITJERJFGVKFDSJGKLSDFTKYJTRSDFWERTYRTYTU TYTYRTTUYT'
);

SELECT * FROM PRU_LOB;

-- BLOB E BFILE TEM QUE USAR PL/SQL E BIBLIOTECAS PARA MANUPULAR. SQL N�O FUNCIONA.
ALTER TABLE PRU_LOB ADD (FOTO BLOB);

DESC PRU_LOB;

INSERT INTO PRU_LOB VALUES (2, 'BIANA', 'EGTTEYTRYUYTUJJHGKGJHKJHGKHKJGGH', 'SDJHFJHJKLGHERRE');