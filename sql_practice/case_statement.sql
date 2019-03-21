drop table if exists Faculty;

create table if not exists Faculty (
	facultyId	int,
	name			varchar(255),
	department	varchar(255),
	gender			varchar(255),
	primary key(facultyId)
);

insert into Faculty(facultyId, name, department, gender) values(1, 'Aakash', 'CS', 'M');
insert into Faculty(facultyId, name, department, gender) values(2, 'Sahil', 'EC', 'M');
insert into Faculty(facultyId, name, department, gender) values(3, 'John', 'HSS', 'M');
insert into Faculty(facultyId, name, department, gender) values(4, 'Shelley', 'CS', 'F');
insert into Faculty(facultyId, name, department, gender) values(5, 'Anannya', 'CS', 'F');
insert into Faculty(facultyId, name, department, gender) values(6, 'Sia', 'HSS', 'F');

select * from Faculty;

-- convert the department to full name
select facultyId, name, gender,
case department
	when 'CS'
		then 'Computer Science'
	when 'EC'
		then 'Electronics Communication'
	when 'HSS'
		then 'No idea'
end as department
from Faculty;

-- change the gender
update Faculty
set gender = (
	case gender
		when ('M') then 'Male'
		when ('F') then 'Female'
		else 'Unknown'
	end
);

select * from Faculty;
