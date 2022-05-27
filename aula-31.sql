CREATE OR REPLACE TYPE objecto_regiones IS OBJECT (
    region_id   NUMBER,
    region_name VARCHAR2(25)
);
/

CREATE OR REPLACE TYPE nested_regiones IS
    TABLE OF objecto_regiones;
/

DESC NESTED_REGIONES;

CREATE TABLE n_regiones (
    codigo   NUMBER,
    regiones nested_regiones
)
NESTED TABLE regiones STORE AS tabla_regiones;