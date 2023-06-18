SELECT
place1,
place2
FROM(
  SELECT 
  ROUND(
    SQRT(POW(a.x - b.x,2) + POW(a.y - b.y,2))
  , 2) AS distance,
  IF(a.name<b.name,a.name,b.name) AS place1,
  IF(a.name>b.name,a.name,b.name) AS place2
  FROM 
  sights a, sights b
  WHERE
  (a.x != b.x OR a.y != b.y) AND
  (a.x >= b.x)
)TB
WHERE distance<5
ORDER BY place1,place2;

*/Using point function*/
select l.name place1,
   r.name place2
from sights l, sights r
where l.name < r.name
  and
  distance(point(l.x, l.y), point(r.x, r.y)) < 5
order by 1, 2;
        
