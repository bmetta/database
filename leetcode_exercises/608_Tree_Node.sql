Create table If Not Exists tree (
	id int,
	p_id int
);
Truncate table tree;
insert into tree (id, p_id) values ('1', NULL);
insert into tree (id, p_id) values ('2', '1');
insert into tree (id, p_id) values ('3', '1');
insert into tree (id, p_id) values ('4', '2');
insert into tree (id, p_id) values ('5', '2');

select * from tree;

-- using IF statement
select
	id as Id, 
 	if(isnull(p_id),
		'Root',
		if(id in (select p_id from tree),
			 'Inner',
			 'Leaf'
			)
		) Type
from tree
order by Id;

-- using case statement
select id as Id,
	case
		when isnull(p_id)
			then 'Root'
		when id in (select p_id from tree)
			then 'Inner'
		else 'Leaf'
	end as Type
from tree
order by Id;
