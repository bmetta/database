Create table If Not Exists seat(id int, student varchar(255));
Truncate table seat;
insert into seat (id, student) values ('1', 'Abbot');
insert into seat (id, student) values ('2', 'Doris');
insert into seat (id, student) values ('3', 'Emerson');
insert into seat (id, student) values ('4', 'Green');
-- insert into seat (id, student) values ('5', 'Jeames');

select * from seat;

select 
	(case
		when mod(id, 2) != 0 and id = A.counts then id
		when mod(id, 2) != 0 then id + 1
		else id - 1
	end) as id,
	student
from seat,
(select count(*) as counts from seat) A
order by id
