CREATE TABLE If Not Exists point_2d (
	x INT NOT NULL,
	y INT NOT NULL
);
Truncate table point_2d;
insert into point_2d (x, y) values ('-1', '-1');
insert into point_2d (x, y) values ('0', '0');
insert into point_2d (x, y) values ('-1', '-2');

select *
from point_2d p1
join point_2d p2
on p1.x != p2.x or p1.y != p2.y
;

select p1.x, p1.y, p2.x, p2.y,
  SQRT((POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2))) as distance
from point_2d p1
join point_2d p2
on p1.x != p2.x or p1.y != p2.y
;

select p1.x, p1.y, p2.x, p2.y,
  SQRT((POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2))) as distance
from point_2d p1
join point_2d p2
on (p1.x <= p2.x AND p1.y < p2.y) OR
   (p1.x <= p2.x AND p1.y > p2.y) OR
   (p1.x < p2.x AND p1.y = p2.y)
;

-- Approach 1
select
  ROUND(MIN(SQRT(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2))), 2) as shortest
from point_2d p1
join point_2d p2
on p1.x != p2.x or p1.y != p2.y
;
