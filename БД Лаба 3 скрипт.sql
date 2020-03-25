use transport;

ALTER TABLE car
	MODIFY capicity int,
    ADD COLUMN `temporary` int AFTER car_id,
    ADD CONSTRAINT temp FOREIGN KEY (`temporary`) REFERENCES `Way` (`way_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE car
	MODIFY `driver_id` int NOT NULL,
	DROP FOREIGN KEY `temp`,
    DROP COLUMN `temporary`;
    
ALTER TABLE client
	MODIFY `first name` varchar(40),
    MODIFY `second name` varchar(40),
    MODIFY `email` varchar(50) NOT NULL;
	
DESCRIBE `car`;
DESCRIBE `client`;
SHOW CREATE TABLE `car`;