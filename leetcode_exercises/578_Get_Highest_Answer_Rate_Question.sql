Create table If Not Exists survey_log (
	uid int,
	action varchar(255),
	question_id int,
	answer_id int,
	q_num int,
	timestamp int
);
Truncate table survey_log;
insert into survey_log (uid, action, question_id, answer_id, q_num, timestamp) values ('5', 'show', '285', NULL, '1', '123');
insert into survey_log (uid, action, question_id, answer_id, q_num, timestamp) values ('5', 'answer', '285', '124124', '1', '124');
insert into survey_log (uid, action, question_id, answer_id, q_num, timestamp) values ('5', 'show', '369', NULL, '2', '125');
insert into survey_log (uid, action, question_id, answer_id, q_num, timestamp) values ('5', 'skip', '369', NULL, '2', '126');

select * from survey_log;

select 
	question_id,
	(case
		when action = 'show' then 1
		else 0
	end) as shows,
	(case
		when action = 'answer' then 1
		else 0
	end) as answers
from survey_log
;

select 
	question_id,
	SUM(case
		when action = 'show' then 1
		else 0
	end) as num_show,
	SUM(case
		when action = 'answer' then 1
		else 0
	end) as num_answer
from survey_log
group by question_id
;

-- approach 1
select 
	question_id as survery_log -- ,
--	num_answer/num_show as ratio
	from
		(select 
			question_id,
			SUM(case
				when action = 'show' then 1
				else 0
			end) as num_show,
			SUM(case
				when action = 'answer' then 1
				else 0
			end) as num_answer
		from survey_log
		group by question_id) as A
	order by num_answer/num_show desc
	limit 1
;

