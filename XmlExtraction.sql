
/*
--Extract authors--

<catalog>
  <book id="...">
    <author>...</author>
    <title>...</title>
  </book>
  <book id="...">
    <author>...</author>
    <title>...</title>
  </book>
  ...
</catalog>
*/

CREATE TEMPORARY TABLE Authors (
	name varchar(255)
);

SET @lim=(
	SELECT COUNT(doc_id)
	FROM catalogs
);

SET @i=1;

WHILE @i<=@lim DO
	INSERT INTO Authors(name)
	SELECT ExtractValue(
		(SELECT
		xml_doc
		FROM(
			SELECT
			row_number() over(order by doc_id) as orden,
			xml_doc
			FROM catalogs
		)TB WHERE orden=@i
		)
		, '//catalog/book[1]/author'
	) as author;

	SET @i=@i+1;
END WHILE;

SELECT
name as author
FROM Authors
GROUP BY name
ORDER BY name;

DROP TABLE Authors;
	
