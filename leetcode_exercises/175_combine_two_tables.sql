drop table if exists Person;
drop table if exists Address;

Create table Person (
	PersonId int,
	FirstName varchar(255),
	LastName varchar(255)
);

Create table Address (
	AddressId int,
	PersonId int,
	City varchar(255),
	State varchar(255)
);

Truncate table Person;
insert into Person (PersonId, LastName, FirstName) values ('1', 'Wang', 'Allen');
Truncate table Address;
insert into Address (AddressId, PersonId, City, State) values ('1', '2', 'New York City', 'New York');

select * from Person;
select * from Address;

select FirstName, LastName, City, State
from Person p
left join Address a on p.PersonId = a.PersonId;
