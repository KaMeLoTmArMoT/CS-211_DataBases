use test;

show tables;

select users.id, users.name, users.value,
	comments.text, comments.status
from `users` left join `comments`
on users.name = comments.name;

select users.value, comments.text
from users inner join comments
on users.name = comments.name;

#todo
select users.value, comments.text
from users inner join comments
on users.name = comments.name
where users.value > 2000 and users.value < 6000;

select users.name 
from users
where not exists
(select * from comments where comments.name = users.name);

#length < 5...