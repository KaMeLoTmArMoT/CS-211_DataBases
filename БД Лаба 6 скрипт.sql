use test;

drop table if exists `comments`;
drop table if exists `users`;
drop view if exists `comment2`;

create table `comments`(
	`comment_1d` int primary key auto_increment,
    `name` varchar(50),
    `text` varchar(100),
    `status` enum('posted', 'deleted', 'edited')
);

create table `users` (
	`id` int PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(50),
    `value` int
);

insert into `comments` values
	(1, 'Andrii', 'I am first here', 'posted'),
	(2, 'Leon', 'Great product!!!', 'edited'),
	(3, 'Zoya', 'What is the price?', 'posted'),
	(4, 'Double', 'Trash...', 'deleted'),
	(5, 'Katya', 'When will be the sales?', 'posted'),
	(6, 'Lera', 'Green colour is the best.', 'deleted')
;

insert into `users`(`name`, `value`) values
	('Andrii', 1234),
    ('Taras', 2345),
	('Vasya', 3456),
    ('Leon', 4567),
    ('Double', 2),
    ('Katya', 4321),
    ('Lera', 5432),
	('Tanya', 6543),
    ('Zoya', 7654)
;

create view `comment2` as 
select distinct `name`, `text`, `status`
from `comments`;

select *
from `comment2`
where `status` = 'edited' or `status` = 'posted';

select users.id, users.name, users.value,
	comments.text, comments.status
from `users`, `comments`
where users.name = comments.name;

select users.id, users.name, users.value,
	comments.text, comments.status
from `users`, `comments`
where users.name = comments.name and comments.status = 'posted';

select * from `comments`;
select * from `users`;
select * from `comment2`;