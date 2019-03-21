drop table if exists Employee;
Create table If Not Exists Employee (Id int, Company varchar(255), Salary int);
Truncate table Employee;
insert into Employee (Id, Company, Salary) values ('1', 'A', '2341');
insert into Employee (Id, Company, Salary) values ('2', 'A', '341');
insert into Employee (Id, Company, Salary) values ('3', 'A', '15');
insert into Employee (Id, Company, Salary) values ('4', 'A', '15314');
insert into Employee (Id, Company, Salary) values ('5', 'A', '451');
insert into Employee (Id, Company, Salary) values ('6', 'A', '513');
insert into Employee (Id, Company, Salary) values ('7', 'B', '15');
insert into Employee (Id, Company, Salary) values ('8', 'B', '13');
insert into Employee (Id, Company, Salary) values ('9', 'B', '1154');
insert into Employee (Id, Company, Salary) values ('10', 'B', '1345');
insert into Employee (Id, Company, Salary) values ('11', 'B', '1221');
insert into Employee (Id, Company, Salary) values ('12', 'B', '234');
insert into Employee (Id, Company, Salary) values ('13', 'C', '2345');
insert into Employee (Id, Company, Salary) values ('14', 'C', '2645');
insert into Employee (Id, Company, Salary) values ('15', 'C', '2645');
insert into Employee (Id, Company, Salary) values ('16', 'C', '2652');
insert into Employee (Id, Company, Salary) values ('17', 'C', '65');

select * from Employee;

-- Ranking the salary per company
select 
		e.Id,
		e.Company,
		e.Salary,
		@ranking := if(@prev = e.Company, @ranking + 1, 1) as Ranking,
		@prev := e.Company as Prev
from Employee e,
     (select @prev := 0, @ranking := 0) as pr
order by e.Company, e.Salary, e.Id
;

-- Total Employees per Company
select 
		Company,
		count(*) as Count
from Employee
group by Company
;

select
		EmpRank.Id,
		EmpRank.Company,
		EmpRank.Salary
from (select 
					e.Id,
					e.Company,
					e.Salary,
					@ranking := if(@prev = e.Company, @ranking + 1, 1) as Ranking,
					@prev := e.Company as Prev
			from Employee e,
			     (select @prev := 0, @ranking := 0) as pr
			order by e.Company, e.Salary, e.Id
		 ) EmpRank
		
		inner join
		
		(select 
				Company,
				count(*) as Count
		 from Employee
		 group by Company
		) EmpCount
		on EmpRank.Company = EmpCount.Company
where Ranking = floor((count + 1)/2) 
			or
			Ranking = floor((count + 2)/2) 
			
;
