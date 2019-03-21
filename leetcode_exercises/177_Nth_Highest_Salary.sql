drop table if exists Employee;
create table if not exists Employee(id int, salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');
insert into Employee (id, salary) values ('4', '400');

select * from Employee;

drop procedure if exists getNthHighestSalary;

delimiter //

CREATE PROCEDURE getNthHighestSalary(N int)
BEGIN
	-- declare M int;
	-- set M = N - 1;
	set N = N - 1;
 	(select distinct Salary as NthHighestSalary
		from Employee
		order by Salary
		-- desc LIMIT M, 1
		desc LIMIT N, 1
	);
END//

delimiter ;

call getNthHighestSalary(2);
call getNthHighestSalary(3);
