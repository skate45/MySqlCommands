
/*Phone validation*/
SELECT
name,
surname,
phone_number
FROM phone_numbers
WHERE REGEXP_LIKE(phone_number,'^1-[0-9]{3}-[0-9]{3}-[0-9]{4}$')=1
OR REGEXP_LIKE(phone_number,'^\\(1\\)[0-9]{3}-[0-9]{3}-[0-9]{4}$')=1
ORDER BY surname;

/*ip validation*/
