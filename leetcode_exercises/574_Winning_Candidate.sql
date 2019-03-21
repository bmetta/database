drop table if exists Candidate;
drop table if exists Vote;
Create table If Not Exists Candidate (id int, Name varchar(255));
Create table If Not Exists Vote (id int, CandidateId int);
Truncate table Candidate;
-- insert into Candidate (id, Name) values ('1', 'A');
-- insert into Candidate (id, Name) values ('2', 'B');
insert into Candidate (id, Name) values ('3', 'C');
-- insert into Candidate (id, Name) values ('4', 'D');
-- insert into Candidate (id, Name) values ('5', 'E');
Truncate table Vote;
insert into Vote (id, CandidateId) values ('1', '2');
insert into Vote (id, CandidateId) values ('2', '4');
insert into Vote (id, CandidateId) values ('3', '3');
insert into Vote (id, CandidateId) values ('4', '2');
insert into Vote (id, CandidateId) values ('5', '5');

select * from Candidate;
select * from Vote;

select CandidateId
from vote
group by CandidateId
order by count(*) desc
limit 1;

-- Approach 1
select Name
from Candidate c
join 
	(select CandidateId
	 from vote
	 group by CandidateId
	 order by count(*) desc
	 limit 1
	 ) as Winner
on c.id = Winner.CandidateId
;


-- Approach 2
select Name
from Candidate c
where c.id =
	(select CandidateId
	 from vote
	 group by CandidateId
	 order by count(*) desc
	 limit 1
	 )
;
