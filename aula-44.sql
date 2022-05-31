CREATE OR REPLACE PACKAGE sobrecarga AS
    FUNCTION concatenar (
        a VARCHAR2,
        b VARCHAR2
    ) RETURN VARCHAR2;

    FUNCTION concatenar (
        a NUMBER,
        b NUMBER
    ) RETURN NUMBER;

    FUNCTION concatenar (
        a DATE,
        b NUMBER
    ) RETURN DATE;

END sobrecarga;
/

CREATE OR REPLACE PACKAGE BODY sobrecarga AS

    FUNCTION concatenar (
        a VARCHAR2,
        b VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        RETURN a
               || ' '
               || b;
    END;

    FUNCTION concatenar (
        a NUMBER,
        b NUMBER
    ) RETURN NUMBER IS
    BEGIN
        RETURN a + b;
    END;

    FUNCTION concatenar (
        a DATE,
        b NUMBER
    ) RETURN DATE IS
    BEGIN
        RETURN a
               || ' '
               || b;
    END;

END sobrecarga;
/