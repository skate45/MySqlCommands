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

/*Using point function*/
select l.name place1,
   r.name place2
from sights l, sights r
where l.name < r.name
  and
  distance(point(l.x, l.y), point(r.x, r.y)) < 5
order by 1, 2;

/*
Minima distancia l->r
*/
SELECT
	id1,
	id2
	FROM(
		SELECT
			id1,
			id2,
			ROW_NUMBER() OVER (PARTITION BY id1 ORDER BY DISTANCIA ASC) AS ORDEN_DISTANCIAS
			/*
			,DISTANCIA
			*/
		FROM(
			SELECT
			l.id as id1,
			r.id as id2,
			ROUND(
				SQRT(POW(l.x - r.x,2) + POW(l.y - r.y,2))
			, 2) AS DISTANCIA
			FROM positions l
			LEFT JOIN positions r ON (l.x<>r.x) OR (l.y<>r.y)
		)TB
	)TB2
	WHERE ORDEN_DISTANCIAS=1
	ORDER BY id1;

