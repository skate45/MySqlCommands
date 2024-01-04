DROP FUNCTION IF EXISTS get_total;
CREATE FUNCTION get_total(items VARCHAR(45)) RETURNS INT DETERMINISTIC
BEGIN
    return (select sum(price) 
                from item_prices 
                where FIND_IN_SET(id, replace(items, ';', ','))
           );
END;

CREATE PROCEDURE solution()
BEGIN
    SELECT id, buyer, get_total(items) AS total_price
    FROM orders
    ORDER BY id;
END;


/*
The following tables 
[orders]
id	buyer	        items
1	Justin Penrose	1
2	Bertha Neiman	  1;2;14
3	John Doe	      1;14;15

and 
[item_prices]
id	price
1	100
2	200
3	500
4	250
14	50
15	75
16	100

the output should be
id	buyer	        total_price
1	Justin Penrose	100
2	Bertha Neiman	  350
3	John Doe	      225
*/
