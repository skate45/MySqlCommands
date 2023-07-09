/*
id	name	          date_of_birth	salary
1	  Justin Penrose	1969-03-01	  3000
2			
3	  Robt Claire		
10		1              970-12-12	

=>
1	name	        Justin Penrose
1	date_of_birth	1969-03-01
1	salary	      3000
3	name	        Robt Claire
10	            date_of_birth	1970-12-12

*/

SELECT id,column_name,value FROM(
	SELECT
	id,
	TB2.COLUMNNAME AS column_name,
	CASE
		WHEN TB2.COLUMNNAME='name'
			THEN name
		WHEN TB2.COLUMNNAME='date_of_birth'
			THEN date_of_birth
		WHEN TB2.COLUMNNAME='salary'
			THEN salary
	END AS value,
	CASE
		WHEN TB2.COLUMNNAME='name' THEN 1
		WHEN TB2.COLUMNNAME='date_of_birth' THEN 2
		WHEN TB2.COLUMNNAME='salary' THEN 3
	END AS ORDEN
	FROM workers_info
	cross join
	(
		select 'name' as COLUMNNAME
		union all select 'date_of_birth'
		union all select 'salary'
	)TB2
)TB3
WHERE TB3.value IS NOT NULL
ORDER BY id ASC,ORDEN ASC;

/*
ORDER BY FIELD VALUES:
*/
SELECT id,column_name,value FROM(
	SELECT
	id,
	TB2.COLUMNNAME AS column_name,
	CASE
		WHEN TB2.COLUMNNAME='name'
			THEN name
		WHEN TB2.COLUMNNAME='date_of_birth'
			THEN date_of_birth
		WHEN TB2.COLUMNNAME='salary'
			THEN salary
	END AS value
	FROM workers_info
	cross join
	(
	select 'name' as COLUMNNAME
	union all select 'date_of_birth'
	union all select 'salary'
	)TB2
)TB3
WHERE TB3.value IS NOT NULL
ORDER BY id ASC,FIELD(column_name, 'name', 'date_of_birth', 'salary');
	
