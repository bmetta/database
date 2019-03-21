drop table if exists Employee;

Create table If Not Exists Employee (
	Id int,
	Salary int
);

Truncate table Employee;
insert into Employee (Id, Salary) values ('1', '100');
insert into Employee (Id, Salary) values ('3', '200');
insert into Employee (Id, Salary) values ('3', '300');

select * from Employee;

-- approach 1
select 
  IFNULL(
	(select distinct Salary
   from Employee
   order by Salary desc limit 1 offset 1),
   NULL) as SecondHighestSalary;

-- approach 2
select max(salary) as SecondHighestSalary
	from Employee
	where Salary < 
	(
		select max(salary) from Employee
	);
