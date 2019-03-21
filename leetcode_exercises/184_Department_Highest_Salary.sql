drop table if exists Employee;
drop table if exists Department;
Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, DepartmentId int);
Create table If Not Exists Department (Id int, Name varchar(255));
Truncate table Employee;
-- insert into Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '70000', '1');
-- insert into Employee (Id, Name, Salary, DepartmentId) values ('2', 'Henry', '80000', '2');
-- insert into Employee (Id, Name, Salary, DepartmentId) values ('3', 'Sam', '60000', '2');
-- insert into Employee (Id, Name, Salary, DepartmentId) values ('4', 'Max', '90000', '1');

insert into Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '60000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('2', 'Sam', '50000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('4', 'Max', '50000', '2');

Truncate table Department;
-- insert into Department (Id, Name) values ('1', 'IT');
-- insert into Department (Id, Name) values ('2', 'Sales');
insert into Department (Id, Name) values ('1', 'IT');
insert into Department (Id, Name) values ('2', 'HR');

select * from Employee;
select * from Department;

select DepartmentId, max(Salary) as Salary
from Employee
group by DepartmentId;

select d.Name as Department, e.Name as Employee, Salary
from Employee e
join Department d
on e.DepartmentId = d.Id
where (e.DepartmentId, Salary) in (
	select DepartmentId, max(Salary) as Salary
	from Employee
	group by DepartmentId
)
order by Salary;
