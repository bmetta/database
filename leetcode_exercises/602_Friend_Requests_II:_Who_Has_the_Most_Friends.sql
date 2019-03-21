Create table If Not Exists request_accepted (
	requester_id INT NOT NULL,
	accepter_id INT NULL,
	accept_date DATE NULL
);
Truncate table request_accepted;
insert into request_accepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03');
insert into request_accepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08');
insert into request_accepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08');
insert into request_accepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09');

select * from request_accepted;

select requester_id as id , count(*) as num
from 
	(
	select requester_id
	from request_accepted
	union all
	select accepter_id
	from request_accepted
	) as A
group by requester_id
order by num desc
limit 1;
