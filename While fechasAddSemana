
CREATE TEMPORARY TABLE Fechas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  alarm_date DATETIME
);

SET
@DATE=(
  SELECT
  input_date
  FROM userInput
);

SET
@BEGIN_YEAR=(
  SELECT
  year(input_date)
  FROM userInput
);


WHILE(YEAR(@DATE)=@BEGIN_YEAR) DO
  INSERT INTO Fechas
  (alarm_date)
  SELECT @DATE;

  SET @DATE=(
    SELECT DATE_ADD(@DATE,INTERVAL 1 WEEK)
  );

END WHILE;

SELECT
alarm_date
FROM Fechas
ORDER BY id ASC;

drop table Fechas;
  
