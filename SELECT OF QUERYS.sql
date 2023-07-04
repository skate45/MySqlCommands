SET @MINIMO=(
		SELECT MIN(salary)
		FROM employees
	);
	
	SET @MAXIMO=(
		SELECT MAX(salary)
		FROM employees
	);
	
	SELECT
	IFNULL(
		(CONTEOS.conteoMaximos*@MAXIMO) - (CONTEOS.conteoMinimos*@MINIMO)
		,0
	) as salary_diff
	FROM(
		
		SELECT
		(
		SELECT
		COUNT(salary)
		FROM employees
		WHERE salary=@MINIMO
		) AS conteoMinimos,
		(
		SELECT
		COUNT(salary)
		FROM employees
		WHERE salary=@MAXIMO
		)AS conteoMaximos
		
	)CONTEOS;
