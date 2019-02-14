-- LINK : https://en.wikibooks.org/wiki/SQL_Exercises/Employee_management
-- 2.1 Select the last name of all employees.
SELECT LastName FROM Employees;

-- 2.2 Select the last name of all employees, without duplicates.
SELECT DISTINCT LastName FROM Employees;

-- 2.3 Select all the data of employees whose last name is "Smith".
SELECT * FROM Employees WHERE LastName = 'Smith';

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM Employees WHERE LastName = 'Smith' OR LastName = 'Doe'
SELECT * FROM Employees WHERE LastName in ('Smith', 'Doe');

-- 2.5 Select all the data of employees that work in department 14.
SELECT * FROM Employees WHERE Department = 14;

-- 2.6 Select all the data of employees that work in department 37 or department 77.
SELECT * FROM Employees WHERE Department in (37, 77);

-- 2.7 Select all the data of employees whose last name begins with an "S".
SELECT * FROM Employees WHERE LastName LIKE 'S%';

-- 2.8 Select the sum of all the departments' budgets.
SELECT SUM(Budget) FROM Departments;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
select Department, count(*) from Employees group by Department;

-- 2.10 Select all the data of employees, including each employee's department's data.
select e.*, d.Name, d.Budget
	from Employees e 
	join Departments d on e.Department = d.Code;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
select e.Name, LastName, d.Name, Budget
	from Employees e join Departments d
	on e.Department = d.Code;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
select e.Name, LastName, d.Name, Budget
	from Employees e join Departments d
	on e.Department = d.Code
	where d.Budget > 60000;

select e.Name, LastName, d.Name, Budget
	from Employees e join Departments d
	on e.Department = d.Code
		and d.Budget > 60000;

select name, lastName, Department
	from Employees
	where Department
		in (select Code from Departments where Budget > 60000);

-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
select *
	from Departments
	where Budget >
		(select avg(Budget) from Departments);

-- 2.14 Select the names of departments with more than two employees.
select Code, Name
	from Departments
	where Code in
	(
		select Department
			from Employees
			group by Department
			having count(Department) > 2
	);

select d.Name
	from Employees e
	inner join Departments d
	on Department = Code
	group by d.Name
	having count(*) > 2;

-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
select Name, LastName
	from Employees
	where Department = 
		(select sub.Code
			from (select * from Departments order by Budget limit 2) sub
			order by Budget desc limit 1
		);

-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into Departments values (11, 'Quality Assurance', 40000);
insert into employees values (847219811, 'Mary', 'Moore', 11);

-- 2.17 Reduce the budget of all departments by 10%.
update departments
	set Budget = Budget * .9;

-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
update Employees
	set Department = 14
	where Department = 77;

-- 2.19 Delete from the table all employees in the IT department (code 14).
delete from Employees
	where department = 14;

-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from Employees
	where Department in (select Code from Departments where Budget >= 60000);

-- 2.21 Delete from the table all employees.
delete from employees;
