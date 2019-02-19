-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
select s.Name, p.Name, p.Hours
	from Scientists s
		inner join AssignedTo a on Scientist = SSN
		inner join Projects p on Code = Project
	order by p.Name, s.Name;

-- 6.2 Select the project names which are not assigned yet
select Code, Name
	from Projects
	where Code not in
	(
		select distinct Project from AssignedTo
	);
