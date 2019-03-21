drop table if exists Logs;
Create table If Not Exists Logs (Id int, Num int);
Truncate table Logs;
insert into Logs (Id, Num) values ('1', '1');
insert into Logs (Id, Num) values ('2', '1');
insert into Logs (Id, Num) values ('3', '1');
insert into Logs (Id, Num) values ('4', '2');
insert into Logs (Id, Num) values ('5', '2');
insert into Logs (Id, Num) values ('6', '2');
insert into Logs (Id, Num) values ('7', '2');
insert into Logs (Id, Num) values ('8', '1');
insert into Logs (Id, Num) values ('9', '2');
insert into Logs (Id, Num) values ('10', '2');
-- insert into Logs (Id, Num) values ('1', '3');
-- insert into Logs (Id, Num) values ('2', '3');
-- insert into Logs (Id, Num) values ('3', '3');
-- insert into Logs (Id, Num) values ('4', '3');

select * from Logs;

-- select distinct l1.Num as ConsecutiveNums
-- from Logs l1, Logs l2, Logs l3
-- where l1.Id + 1 = l2.Id and
-- 			l1.Id +2 = l3.Id and
-- 			l1.Num = l2.Num and
-- 			l2.Num = l3.Num;

-- Approach 1
SELECT Num,
       @showtimes := IF(@prev = Num, @showtimes := @showtimes + 1, 1) AS times,
       @prev := Num
FROM Logs,
		 (SELECT @prev := null, @showtimes := 0) tmp
ORDER BY Id ASC;

SELECT DISTINCT Num AS ConsecutiveNums FROM (
 	SELECT Num,
 	       @showtimes := IF(@prev = Num, @showtimes := @showtimes + 1, 1) AS times,
 	       @prev := Num
 	FROM Logs,
			 (SELECT @prev := null, @showtimes := 0) tmp
 	ORDER BY Id ASC
) a
WHERE times >= '3';


-- Approach 3
-- TODO: Need to understand the following code
select a.Num as ConsecutiveNums
from Logs a
where (a.Id+1, Num) in (select * from Logs) 
and (a.Id+2, Num) in (select * from Logs) 
group by a.Num
