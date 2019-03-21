drop table if exists Scores;
Create table If Not Exists Scores (Id int, Score DECIMAL(3,2));
Truncate table Scores;
insert into Scores (Id, Score) values ('1', '3.5');
insert into Scores (Id, Score) values ('2', '3.65');
insert into Scores (Id, Score) values ('3', '4.0');
insert into Scores (Id, Score) values ('4', '3.85');
insert into Scores (Id, Score) values ('5', '4.0');
insert into Scores (Id, Score) values ('6', '3.65');

select * from Scores;

select * from scores order by score desc;

select score,
  @last_score,
	@curr_rank := if (@last_score = score, @curr_rank, @curr_rank + 1) as curr_rank,
	@last_score := score
from (select score from scores order by score desc) A,
		 (select @last_score := null, @curr_rank := 0) B
;

-- Approach 1
select score, curr_rank as 'Rank'
from 
  (select score,
   	@curr_rank := if (@last_score = score, @curr_rank, @curr_rank + 1) as curr_rank,
   	@last_score := score
   from (select score from scores order by score desc) A,
   		 (select @last_score := null, @curr_rank := 0) B
	 	) C
;

-- Approach 2
select X.Score, curr_rank as 'Rank'
from Scores,
	(select Score,(@start:=@start+1) as curr_rank
	from (select distinct Score from Scores order by Score desc) as S,
			 (select @start := 0) as T) as X
	where X.Score=Scores.Score
	order by curr_rank
;

-- Approach 3
select Score,
	(
		select count(distinct Score)
		from Scores s2
		where s2.Score >= s1.Score
	) as 'Rank'
from Scores s1
order by s1.Score desc
;
