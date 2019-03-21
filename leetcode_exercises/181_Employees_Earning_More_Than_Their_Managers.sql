drop table if exists Employee;

-- Create table If Not Exists Employee (
create table Employee (
	Id int,
	Name varchar(255),
	Salary int,
	ManagerId int
);
truncate table Employee;
insert into Employee (Id, Name, Salary, ManagerId) values ('1', 'Joe', '70000', '3');
insert into Employee (Id, Name, Salary, ManagerId) values ('2', 'Henry', '80000', '4');
insert into Employee (Id, Name, Salary, ManagerId) values ('3', 'Sam', '60000', NULL);
insert into Employee (Id, Name, Salary, ManagerId) values ('4', 'Max', '90000', NULL);

select * from Employee;

-- Approach 1
select
	a.Name as 'Employee'
from 
	Employee as a, Employee as b
where
	a.ManagerId = b.Id and
	a.Salary > b.Salary;

-- Approach 2: using JOIN clause; join is a more common and efficient way to link tables together
select
	a.Name as 'Employee'
from 
	Employee as a
	join Employee as b
	ON a.ManagerId = b.Id and
		 a.Salary > b.Salary;
