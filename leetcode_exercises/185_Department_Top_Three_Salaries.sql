drop table if exists Employee;
drop table if exists Department;
Create table If Not Exists Employee (
	Id int,
	Name varchar(255),
	Salary int,
	DepartmentId int
);

Create table If Not Exists Department (
	Id int,
	Name varchar(255)
);

Truncate table Employee;
insert into Employee (Id, Name, Salary, DepartmentId) values (1, 'Joe', 70000, 1);
insert into Employee (Id, Name, Salary, DepartmentId) values (2, 'Henry', 80000, 2);
insert into Employee (Id, Name, Salary, DepartmentId) values (3, 'Sam', 60000, 2);
insert into Employee (Id, Name, Salary, DepartmentId) values (4, 'Max', 90000, 1);
insert into Employee (Id, Name, Salary, DepartmentId) values (5, 'Janet', 69000, 1);
insert into Employee (Id, Name, Salary, DepartmentId) values (6, 'Randy', 85000, 1);

Truncate table Department;
insert into Department (Id, Name) values ('1', 'IT');
insert into Department (Id, Name) values ('2', 'Sales');

select * from Employee;
select * from Department;

select * from Employee e1
where 3 >
(
	select count(e2.salary)
	from Employee e2
	where e2.Salary > e1.Salary
);

select * from Employee e1
where 3 >
(
	select count(e2.salary)
	from Employee e2
	where e2.Salary > e1.Salary and
	      e1.DepartmentId = e2.DepartmentId
);

-- Approach 1
select d.Name as Department,
			 e1.Name as Employee,
			 Salary
from Employee e1
join Department d
on d.Id = e1.DepartmentId
where 3 > (select count(distinct e2.salary)
					from Employee e2
					where e2.Salary > e1.Salary and
	      				e1.DepartmentId = e2.DepartmentId)
;

-- TODO: optimized solution
