/* Agrupar valores en una fila */

SELECT GROUP_CONCAT(country)
FROM(
  SELECT
  country
  FROM diary
  GROUP BY country
  ORDER BY country
)TB;

 
/* Búsqueda en texto binario: Diferencía entre mayúsculas y minúsculas (attribute:string with text to search) */
/*<one or more arbitrary character>%<first name>_<second name>%<zero or more arbitrary characters>*/
SELECT
*
FROM users
WHERE BINARY attribute LIKE CONCAT('%','\%',first_name,'_',second_name,'\%','%')
  AND LENGTH(attribute)>LENGTH(first_name+second_name)+4
  AND LEFT(attribute,1) NOT IN('%')
ORDER BY attribute ASC;


/*IF ELSE*/
SELECT id, IF (given_answer IS NULL, 'no answer', IF(correct_answer=given_answer,'correct','incorrect') ) AS checks
FROM answers
ORDER BY id;


/*SELECT CASE */
SELECT
id,
a,
b,
operation,
c
FROM expressions
WHERE 
  CASE operation
    WHEN '+' THEN a+b
    WHEN '-' THEN a-b
    WHEN '*' THEN a*b
    WHEN '/' THEN a/b
  END=c
ORDER BY id;
  

/*Redondeo inferior: Floor*/
SELECT
id,
email_title,
CASE
  WHEN size<1048576 THEN
    CONCAT(FLOOR(size/1024),' Kb')
  ELSE
    CONCAT(FLOOR(size/1048576),' Mb')
END AS short_size
FROM emails
ORDER BY size DESC;


