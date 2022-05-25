CREATE OR REPLACE PACKAGE paq1 IS
    FUNCTION f1 RETURN NUMBER;

    PROCEDURE p1;
    PROCEDURE p2;
END;
/

SELECT
    *
FROM
    user_objects
WHERE
    object_name LIKE 'PAQ1%';

CREATE OR REPLACE PACKAGE BODY paq1 IS
    FUNCTION f1 RETURN NUMBER IS
    BEGIN
        RETURN 0;
    END;

    PROCEDURE p1 IS
    BEGIN
        NULL;
    END;
    
    PROCEDURE p2 IS
    BEGIN
        NULL;
    END;
    
    PROCEDURE p3 IS
    BEGIN
        NULL;
    END;

END;
/

ALTER PACKAGE PAQ1 COMPILE;

ALTER PACKAGE PAQ1 COMPILE BODY;