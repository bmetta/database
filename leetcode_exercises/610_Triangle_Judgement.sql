drop table if exists triangle;

Create table If Not Exists triangle (
	x int,
	y int,
	z int
);
Truncate table triangle;
insert into triangle (x, y, z) values ('13', '15', '30');
insert into triangle (x, y, z) values ('10', '20', '15');

select * from triangle;

select
	x,
	y,
	z,
	case
		when (x + y) > z and (y + z) > x and (x + z) > y then 'yes'
		else 'no'
	end as 'triangle'
from triangle;
