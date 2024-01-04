CREATE PROCEDURE solution()
BEGIN
	
	DROP TABLE IF EXISTS `tablesFiltered`;
		
	CREATE TABLE tablesFiltered(
		tab_name varchar(100),
		col_name varchar(100),
		data_type varchar(100)
	);

	INSERT INTO tablesFiltered (tab_name, col_name, data_type)
	SELECT
	TB.TABLE_NAME,
	TB.COLUMN_NAME,
	TB.DATA_TYPE
	FROM INFORMATION_SCHEMA.COLUMNS TB
	WHERE BINARY TB.TABLE_NAME like 'e%' AND BINARY TB.TABLE_NAME like '%s';

	SELECT * FROM tablesFiltered
	ORDER BY tab_name,col_name;
	
END
