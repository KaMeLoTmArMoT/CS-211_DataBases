drop database if exists transport;
create database if not exists transport;
USE transport;

CREATE TABLE `Client` (
  `client_id` int PRIMARY KEY AUTO_INCREMENT,
  `first name` varchar(30),
  `second name` varchar(30),
  `age` tinyint,
  `email` varchar(40),
  `phone_number` int,
  `register_date` DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Order` (
  `order_id` int PRIMARY KEY AUTO_INCREMENT,
  `client_id` int,
  `car_id` int,
  `total_price` int,
  `status` enum('Active','Completed','Canceled'),
  `additional_inf` text(500)
);

CREATE TABLE `Basket` (
  `basket_id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `product_id` int,
  `amount` smallint
);

CREATE TABLE `Product` (
  `product_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_name` varchar(60),
  `description` text(500),
  `weight` float,
  `colour` varchar(255),
  `amount` smallint,
  `price` int
);

CREATE TABLE `Comment` (
  `comment_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int,
  `comment` text(500),
  `rating` enum('1','2','3','4','5'),
  `username` varchar(50)
);

CREATE TABLE `Car` (
  `car_id` int PRIMARY KEY AUTO_INCREMENT,
  `driver_id` int,
  `way_id` int,
  `capicity` float
);

CREATE TABLE `Driver` (
  `driver_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `age` tinyint,
  `phone_number` int,
  `experience` tinyint
);

CREATE TABLE `Way` (
  `way_id` int PRIMARY KEY AUTO_INCREMENT,
  `start_city` varchar(60),
  `dest_city` varchar(60),
  `stops` boolean
);

CREATE TABLE `Stops` (
  `stops_id` int PRIMARY KEY AUTO_INCREMENT,
  `way_id` int,
  `city` varchar(60),
  `stop_que` tinyint
);

ALTER TABLE `Order` ADD FOREIGN KEY (`client_id`) REFERENCES `Client` (`client_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `Order` ADD FOREIGN KEY (`car_id`) REFERENCES `Car` (`car_id`) ON DELETE NO ACTION ON UPDATE CASCADE;


ALTER TABLE `Basket` ADD FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Basket` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Comment` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Car` ADD FOREIGN KEY (`driver_id`) REFERENCES `Driver` (`driver_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `Car` ADD FOREIGN KEY (`way_id`) REFERENCES `Way` (`way_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `Stops` ADD FOREIGN KEY (`way_id`) REFERENCES `Way` (`way_id`) ON DELETE CASCADE ON UPDATE CASCADE;