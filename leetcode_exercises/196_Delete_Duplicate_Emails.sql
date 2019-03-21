drop table if exists Person;

Create table If Not Exists Person (
	Id int primary key,
	Email varchar(255)
);

Truncate table Person;

insert into Person (Id, Email) values ('1', 'a@b.com');
insert into Person (Id, Email) values ('2', 'c@d.com');
insert into Person (Id, Email) values ('3', 'a@b.com');

select * from Person;

-- select * from
-- 	Person p1, Person p2
-- where
-- 	p1.Email = p2.Email;
-- 
-- select p1.* from
-- 	Person p1, Person p2
-- where
-- 	p1.Email = p2.Email and p1.Id > p2.Id;
-- 
-- delete p1 from
-- 	Person p1, Person p2
-- where
-- 	p1.Email = p2.Email and p1.Id > p2.Id;
-- 
-- select * from Person;

-- Approach 2:
select min(Id)
from Person
group by Email;

delete from Person
where Id not in
(
	select A.Id from
	(
		select min(Id) as Id
		from Person
		group by Email
	) as A
);

select *
from Person;
