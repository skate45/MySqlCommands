/* Agrupar valores en una fila */

SELECT GROUP_CONCAT(country)
FROM(
  SELECT
  country
  FROM diary
  GROUP BY country
  ORDER BY country
)TB;

 
