/*Obtener última fecha más reciente y comparar contra fecha de evento: Deben considerarse fechas de 1 semana atras*/
SET @LAST_EVENT=(
  SELECT
  MAX(event_date) as most_recent_event
  FROM Events
);

SELECT
name,
event_date
FROM Events
WHERE DATEDIFF(@LAST_EVENT,event_date) BETWEEN 1 AND 7
ORDER BY CONVERT(event_date,DATE) DESC;
  



/*Calculo quarto de mes, año y totales ganancias - perdidas */
SELECT
YEAR(date) AS year,
CASE
  WHEN MONTH(date) BETWEEN 1 AND 3 THEN 1
  WHEN MONTH(date) BETWEEN 4 AND 6 THEN 2
  WHEN MONTH(date) BETWEEN 7 AND 9 THEN 3
  WHEN MONTH(date) BETWEEN 10 AND 12 THEN 4
END AS quarter,
SUM(profit)-SUM(loss) as net_profit
FROM accounting
GROUP BY YEAR(date),CASE
  WHEN MONTH(date) BETWEEN 1 AND 3 THEN 1
  WHEN MONTH(date) BETWEEN 4 AND 6 THEN 2
  WHEN MONTH(date) BETWEEN 7 AND 9 THEN 3
  WHEN MONTH(date) BETWEEN 10 AND 12 THEN 4
END
ORDER BY year ASC, quarter ASC;
  
