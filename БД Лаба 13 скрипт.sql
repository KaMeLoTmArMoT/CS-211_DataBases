use shop;

show index from client;
show index from comment;

create index clientIND on client (`first name`);
create index commentIND on comment (username);

drop index clientIND on client;
drop index commentIND on comment;

select `first name`, count(distinct comment) as comments, ifnull(sum(distinct amount), 0) as products,
(count(distinct comment) + ifnull(sum(distinct amount), 0)*2) as rating
from client left join comment
on client.`first name` = comment.username
left join basket
on client.client_id = basket.client_id
group by  `first name`
order by rating DESC limit 3;

explain select `first name`, count(distinct comment) as comments, 
ifnull(sum(distinct amount), 0) as products,
(count(distinct comment) + ifnull(sum(distinct amount), 0)*2) as rating
from client left join comment
on client.`first name` = comment.username
left join basket
on client.client_id = basket.client_id
group by  `first name`
order by rating DESC limit 3;

explain select straight_join `first name`, count(distinct comment) as comments, 
ifnull(sum(distinct amount), 0) as products,
(count(distinct comment) + ifnull(sum(distinct amount), 0)*2) as rating
from client left join comment
on client.`first name` = comment.username
left join basket
on client.client_id = basket.client_id
group by  `first name`
order by rating DESC limit 3;