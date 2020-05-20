use shop;

#1
drop trigger car_delete;

create
	trigger car_delete before delete
    on shop.car for each row
    update shop.driver set car_id = null where car_id = old.car_id;
    
delete from shop.car where car_id = 1;


#2
drop trigger author_password;

create
	trigger author_password before
    insert on shop.client for each row
    set NEW.pass = aes_encrypt(NEW.password, 'string');

INSERT INTO `shop`.`client` (`client_id`, `first name`, `second name`, `age`, `email`, `phone_number`, `password`) VALUES 
	('8', 'Surname', 'NAme', '41', 'some@gmail', '1424', 'pasqasssre'),
	('9', 'Aafgaf', 'NAme', '24', 'qwe@gmail', '55343', '23424dfaf'),
	('10', 'SQqqrqur', 'NAme', '46', 'sage@gmail', '3673', '142asfd234');

delete from shop.client where client_id = 8;
delete from shop.client where client_id = 9;
delete from shop.client where client_id = 10;


#3
truncate shop.order;

alter table client
	add column lastseen Date default null;

drop trigger user_order;

create trigger user_order after
	insert on shop.order for each row
    update shop.client set client.lastseen = date(curdate())
    where client.client_id = NEW.client_id;
    
INSERT INTO `shop`.`order` (`order_id`, `client_id`, `car_id`, `way_id`, `total_price`, `status`, `additional_inf`) VALUES 
	('1', '1', '1', '1', '23414', 'Active', 'none'),
	('2', '2', '2', '2', '1432', 'Active', 'Be carefull!'),
	('3', '3', '3', '3', '33', 'Active', 'MMM');

#4
drop trigger user_order;

create trigger user_order after
	insert on shop.basket for each row
    update shop.product set product.amount = product.amount - NEW.amount
    where NEW.product_id = product.product_id;

insert into basket values
	(1, 1, 1, 4),
    (3, 1, 1, 16);
    
select * from product;
select * from basket;
truncate shop.basket;