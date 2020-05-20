use shop;

#1
select age, email, register_date 
from client
where email LIKE '%mail%'
order by register_date;

#2
select product_name, price 
from product
order by price desc limit 4;

#3 / 1
select email, description, price
from (client inner join product) inner join comment
on comment.product_id = product.product_id
and comment.username = client.`first name`;

#3 / 2
select email, description, sum(price)
from (client inner join product) inner join comment
on comment.product_id = product.product_id
and comment.username = client.`first name`
group by email;