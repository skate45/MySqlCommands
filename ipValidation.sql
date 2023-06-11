/*
A record is correct if the IP it contains is a valid IPv4 address, and either the first or the second component in the host part is a two-digit number.
*/
CREATE FUNCTION SPLIT_STR(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
)
RETURNS VARCHAR(255)

RETURN REPLACE(
	SUBSTRING(
		SUBSTRING_INDEX(x, delim, pos),
    	LENGTH(
			SUBSTRING_INDEX(x, delim, pos -1)
		)+ 1
	),
 	delim, ''
);

CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	SELECT
	id,
	ip
	FROM ips
	WHERE (
		(
			ip REGEXP('^[0-9]{1,4}\.[0-9]{1,4}\.(([0-9]{1,4}\.[0-9]{2})|([0-9]{2}\.[0-9]{1,4}))$')=1
		) /*OR(
			ip REGEXP('^[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{2}\.[0-9]{1,4}$')=1
		)*/
	) AND (
		CONVERT(SPLIT_STR(ip,'.',1),SIGNED)<=255 and CONVERT(SPLIT_STR(ip,'.',2),SIGNED)<=255 and CONVERT(SPLIT_STR(ip,'.',3),SIGNED)<=255 and CONVERT(SPLIT_STR(ip,'.',4),SIGNED)<=255
	)
	ORDER BY id;
	
END
