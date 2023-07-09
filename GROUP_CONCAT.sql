CREATE TABLE t (
    v CHAR
);

INSERT INTO t(v) VALUES('A'),('B'),('C'),('B');

SELECT 
    GROUP_CONCAT(DISTINCT v
        ORDER BY v ASC
        SEPARATOR ';')
FROM
    t;

/*
=> a;b;c
*/
