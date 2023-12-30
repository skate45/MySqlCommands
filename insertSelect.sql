DROP TABLE IF EXISTS `order_analytics`;
    
CREATE TABLE order_analytics(
    id int,
    year int,
    quarter int,
    type varchar(100),
    total_price int
);

INSERT INTO order_analytics (id, year, quarter,type,total_price)
SELECT
id,
year(order_date),
QUARTER(order_date),
type,
(price*quantity)
FROM orders;

SELECT *
FROM order_analytics
ORDER by id;
