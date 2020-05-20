truncate shop.stops;

start transaction;
set autocommit = 0;
	insert into shop.stops value ('1', '0', 'Ternopil', 1);
	insert into shop.stops value ('2', '0', 'White Church', 2);
	insert into shop.stops value ('3', '1', 'Khmelnitsk', 1);
	insert into shop.stops value ('4', '12', 'Moskow', 1);
rollback;


start transaction;
	insert into shop.stops value ('1', '0', 'Ternopil', 1);
	insert into shop.stops value ('2', '0', 'White Church', 2);
	insert into shop.stops value ('3', '1', 'Khmelnitsk', 1);
    
    savepoint one;
    
    insert into shop.stops value ('4', '0', 'White Church', 3);
	insert into shop.stops value ('5', '1', 'Khmelnitsk', 5);
    
    rollback to savepoint one;
    savepoint two;
    
	insert into shop.stops value ('6', '1', 'Khmelnitsk', 5);
        
	rollback to savepoint two;
commit;

select * from shop.stops;