Create table If Not Exists number (num int);
Truncate table number;
insert into number (num) values ('8');
insert into number (num) values ('8');
insert into number (num) values ('3');
insert into number (num) values ('3');
insert into number (num) values ('1');
insert into number (num) values ('4');
insert into number (num) values ('5');
insert into number (num) values ('6');

select * from number;


select max(num) as num
from
	(select num
	 from number
	 group by num
	 having count(*) = 1) as t
;
