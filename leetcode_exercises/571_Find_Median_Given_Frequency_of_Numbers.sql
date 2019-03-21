drop table if exists Numbers;
Create table If Not Exists Numbers (Number int, Frequency int);
Truncate table Numbers;
insert into Numbers (Number, Frequency) values ('0', '7');
insert into Numbers (Number, Frequency) values ('1', '1');
insert into Numbers (Number, Frequency) values ('2', '3');
insert into Numbers (Number, Frequency) values ('3', '1');

select * from Numbers;

-- Total
select 
		n.Number,
		n.Frequency,
		@total := @total + n.Frequency as Total
from Numbers n,
		 (select @total := 0) T
;

-- TODO: Solve
