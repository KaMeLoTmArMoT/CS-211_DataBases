use shop;

#todo
select max_order_size(110,30) as ord;
select max_order_size(0,30) as ord;

select password_strongness('Asddada');
select password_strongness('Asd');

call get_rating('Andrii');
call get_rating('Vitya');
call get_rating('');