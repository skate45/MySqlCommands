/* Agrupar valores en una fila */

SELECT GROUP_CONCAT(country)
FROM(
  SELECT
  country
  FROM diary
  GROUP BY country
  ORDER BY country
)TB;

 
/* Búsqueda en texto binario (attribute:string with text to search) */
/*<one or more arbitrary character>%<first name>_<second name>%<zero or more arbitrary characters>*/
SELECT
*
FROM users
WHERE BINARY attribute LIKE CONCAT('%','\%',first_name,'_',second_name,'\%','%')
  AND LENGTH(attribute)>LENGTH(first_name+second_name)+4
  AND LEFT(attribute,1) NOT IN('%')

ORDER BY attribute ASC;

