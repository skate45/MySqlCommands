DROP FUNCTION IF EXISTS response;
CREATE FUNCTION response(name VARCHAR(40)) RETURNS VARCHAR(200) DETERMINISTIC
BEGIN
    SET @firstname = SUBSTR(name,1,INSTR(name,' ')-1);
    
    SET @lastname = SUBSTR(name,INSTR(name,' ')+1,LENGTH(name));
    
    
    SET @firstname2 = CONCAT(UCASE(SUBSTR(@firstname, 1,1)) , LCASE(SUBSTR(@firstname, 2, LENGTH(@firstname))));
    SET @lastname2 = CONCAT(UCASE(SUBSTR(@lastname, 1,1)) , LCASE(SUBSTR(@lastname, 2, LENGTH(@lastname))));
    
    
    SET @result = CONCAT('Dear ' , @firstname2 , ' ' , @lastname2 , '! We received your message and will process it as soon as possible. Thanks for using our service. FooBar On! - FooBarIO team.');
    
    RETURN (@result);
    
    
END;

CREATE PROCEDURE solution()
BEGIN
    SELECT id, name, response(name) AS response
    FROM customers;
END;
