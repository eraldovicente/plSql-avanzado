ALTER SESSION SET plsql_code_type = 'INTERPRETED';

CREATE OR REPLACE PROCEDURE n1 AS
    v VARCHAR2(1000) := 'A';
    x DATE;
    z VARCHAR2(1000);
BEGIN
    dbms_output.put_line(to_char(
                                sysdate,
                                'mi-ss'
                         ));
    FOR x IN 1..100000000 LOOP
        FOR x IN 1..15 LOOP
            v := 'A'
                 || substr(
                          'AAAAA',
                          1,
                          5
                    );
        END LOOP;
    END LOOP;

    dbms_output.put_line(to_char(
                                sysdate,
                                'mi:ss'
                         ));
END;
/

SELECT * FROM USER_PLSQL_OBJECT_SETTINGS WHERE NAME LIKE 'N1';

EXECUTE N1;

ALTER SESSION SET PLSQL_CODE_TYPE='NATIVE';