DESC USER_OBJECTS;

SELECT * FROM USER_OBJECTS;

-- VALID INVALID

SELECT STATUS, COUNT(*) FROM USER_OBJECTS GROUP BY STATUS;

SELECT * FROM USER_OBJECTS WHERE STATUS='INVALID';
