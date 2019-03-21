drop table if exists point;
CREATE TABLE If Not Exists point (x INT NOT NULL, UNIQUE INDEX x_UNIQUE (x ASC));
Truncate table point;
insert into point (x) values ('-1');
insert into point (x) values ('0');
insert into point (x) values ('2');

select * from point;

select p1.x, p2.x, abs(p1.x - p2.x) as distance
from point p1, point p2
where p1.x != p2.x;

select min(abs(p1.x - p2.x)) as shortest
from point p1, point p2
where p1.x != p2.x;
