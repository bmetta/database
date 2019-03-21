Create table If Not Exists Weather (
	Id int,
	RecordDate date,
	Temperature int
);

Truncate table Weather;

-- insert into Weather (Id, RecordDate, Temperature) values ('1', '2015-01-01', '10');
-- insert into Weather (Id, RecordDate, Temperature) values ('2', '2015-01-02', '25');
-- insert into Weather (Id, RecordDate, Temperature) values ('3', '2015-01-03', '20');
-- insert into Weather (Id, RecordDate, Temperature) values ('4', '2015-01-04', '30');

insert into Weather (Id, RecordDate, Temperature) values (1, "2000-12-16", 3);
insert into Weather (Id, RecordDate, Temperature) values (2, "2000-12-15", -1);

select * from Weather;

select *
from Weather w1, Weather w2
where datediff(w1.RecordDate, w2.RecordDate) = 1 and
			w1.Temperature > w2.Temperature;

-- Approach 1
select w1.Id
from Weather w1, Weather w2
where datediff(w1.RecordDate, w2.RecordDate) = 1 and
		  w1.Temperature > w2.Temperature;
