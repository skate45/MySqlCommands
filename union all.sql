--UNION ALL RETURN EVEN REPEATED VALUES WHILE UNION ONLY UNIQUE VALUES
SELECT
	name as names
	FROM(
			SELECT
			name,ORDEN
			FROM(
				SELECT
				name,
				1 AS ORDEN
				FROM pr_department
				ORDER BY date_joined DESC
				LIMIT 5
			)TB
			
			UNION ALL
			
			SELECT
			name,ORDEN
			FROM(
				SELECT
				name,
				2 AS ORDEN
				FROM it_department
				ORDER BY date_joined DESC
				LIMIT 5
			)TB
			
			UNION ALL
			
			SELECT
			name,ORDEN
			FROM(
				SELECT
				name,
				3 AS ORDEN
				FROM sales_department
				ORDER BY date_joined DESC
				LIMIT 5
			)TB
			
	)TB ORDER BY ORDEN ASC,name ASC;
