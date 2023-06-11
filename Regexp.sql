
/*
Phone validation
A record is correct if the IP it contains is a valid IPv4 address, and either the first or the second component in the host part is a two-digit number.
*/
SELECT
name,
surname,
phone_number
FROM phone_numbers
WHERE REGEXP_LIKE(phone_number,'^1-[0-9]{3}-[0-9]{3}-[0-9]{4}$')=1
OR REGEXP_LIKE(phone_number,'^\\(1\\)[0-9]{3}-[0-9]{3}-[0-9]{4}$')=1
ORDER BY surname;

/*ip validation*/
SELECT
	id,
	ip
	FROM ips
	WHERE (
		(
			ip REGEXP('^[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{2}$')=1
		) OR(
			ip REGEXP('^[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{2}\.[0-9]{1,4}$')=1
		)
	)
