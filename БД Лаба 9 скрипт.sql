use shop;

#1
select email, description, sum(price)
from (client inner join product) inner join comment
on comment.product_id = product.product_id
and comment.username = client.`first name`
group by email;

#2
select email, year(register_date) as year, month(register_date) as month,
count(client_id) as users
from client
group by year, month with rollup;

#3
select `first name`, email, avg(char_length(comment)) as avgcomment
from comment inner join client
on comment.username = client.`first name`
group by username;

#4
select `first name`, count(distinct comment) as comments, ifnull(sum(distinct amount), 0) as products,
(count(distinct comment) + ifnull(sum(distinct amount), 0)*2) as rating
from client left join comment
on client.`first name` = comment.username
left join basket
on client.client_id = basket.client_id
group by  `first name`
order by rating DESC limit 3;