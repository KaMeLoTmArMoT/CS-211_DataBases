use shop;

insert into `comment` values
	(9, 1, 'Great', '4', 'Andrii'),
	(10, 1, 'Top', '5', 'Katya'),
	(11, 3, 'Super', '4', 'Vitya'),
	(12, 4, 'Terrible', '1', 'Lera'),
	(13, 2, 'Bad', '3', 'Andrii'),
	(14, 1, 'Excelent', '4', 'Zoya')
;

create table `comment_1` as (select * from `comment` where comment_id < 12);

select* from comment;
select* from product;

select * from `comment_1`
union
select * from `comment`;

select * from `product`
where `product_id` in (select `product_id` from `comment`);

select * from `product`
where `product_id` not in (select `product_id` from `comment`);

select product.product_name, comment.comment from `product`, `comment`;
