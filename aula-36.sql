CREATE TABLE imagenes (
    codigo NUMBER,
    foto   BFILE
);

SELECT
    *
FROM
    imagenes;

DESC IMAGENES;

DECLARE
    foto BFILE;
BEGIN
    foto := bfilename(
                     'FICHEROS',
                     'gatito1.jpg'
            );
    INSERT INTO imagenes VALUES (
        1,
        foto
    );

END;
/

INSERT INTO imagenes VALUES (
    2,
    bfilename(
        'FICHEROS', 'gatito1.jpg'
    )
);

SELECT
    *
FROM
    imagenes;

SELECT
    *
FROM
    all_directories;