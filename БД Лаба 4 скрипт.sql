use transport;

INSERT INTO product VALUES
	(1,'Table','Big round-shape table',40,'green',700,499)
;

INSERT INTO product VALUES
	(2,'Table','Big round-shape table',40,'green',700,499),
    (3,'Chair','small light chair',11,'light-green',2100,199),
    (4,'Umbrella','Big square `1715` umbrella',24,'black with grttn lines',700,359),
    (5,'Table','Small round-shape table',20,'green',900,279)
;

LOAD DATA INFILE 
	'client_data.txt'
INTO TABLE `client`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

UPDATE `client` 
SET `first name` = 'Not Andrii'
WHERE client_id = 2;

DELETE FROM `client`
WHERE(`phone_number`=8889998)
ORDER BY client_id;

DESCRIBE product;