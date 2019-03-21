drop table if exists cinema;

Create table If Not Exists cinema (
	seat_id int primary key auto_increment,
	free bool
);
Truncate table cinema;
insert into cinema (seat_id, free) values ('1', '1');
insert into cinema (seat_id, free) values ('2', '0');
insert into cinema (seat_id, free) values ('3', '1');
insert into cinema (seat_id, free) values ('4', '1');
insert into cinema (seat_id, free) values ('5', '1');

select * from cinema;

select a.seat_id, a.free, b.seat_id, b.free
from cinema a join cinema b
where abs(a.seat_id - b.seat_id) = 1 and
			a.free = 1 and b.free = 1;

select distinct a.seat_id
from cinema a join cinema b
on abs(a.seat_id - b.seat_id) = 1 and
	 a.free = 1 and b.free = 1
order by a.seat_id;
