
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
  
