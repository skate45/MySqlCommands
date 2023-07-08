/*
GET INFO ABOUT ANONIMOUSID
WHERE:
  A) Most recent event and user_id NULL
  B) Last event and user_id not null / null if not exists
*/
SELECT
TB1.anonymous_id,
TB1.event_name AS last_null,
TB2.event_name AS first_notnull
FROM(
  SELECT
  anonymous_id,
  event_name,
  row_number() OVER (PARTITION BY anonymous_id ORDER BY received_at DESC) AS ORDEN_last_null
  FROM tracks T1
  WHERE user_id IS NULL
)TB1
LEFT JOIN(
  SELECT
  anonymous_id,
  event_name,
  row_number() OVER (PARTITION BY anonymous_id ORDER BY received_at ASC) AS ORDEN_first_notnull
  FROM tracks T1
  WHERE user_id IS NOT NULL
)TB2 ON TB1.anonymous_id=TB2.anonymous_id
WHERE TB1.ORDEN_last_null=1
  AND IFNULL(TB2.ORDEN_first_notnull,1)=1
ORDER BY TB1.anonymous_id;
