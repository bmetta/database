drop table if exists customer;
CREATE TABLE IF NOT EXISTS customer (id INT,name VARCHAR(25),referee_id INT);
Truncate table customer;
-- insert into customer (id, name, referee_id) values ('1', 'Will', NULL);
-- insert into customer (id, name, referee_id) values ('2', 'Jane', NULL);
-- insert into customer (id, name, referee_id) values ('3', 'Alex', '2');
-- insert into customer (id, name, referee_id) values ('4', 'Bill', NULL);
-- insert into customer (id, name, referee_id) values ('5', 'Zack', '1');
-- insert into customer (id, name, referee_id) values ('6', 'Mark', '2');

insert into customer (id, name, referee_id) values (1,"Will",null);
insert into customer (id, name, referee_id) values (2,"Jane",null);
insert into customer (id, name, referee_id) values (3,"Alex",2);
insert into customer (id, name, referee_id) values (4,"Bill",null);
insert into customer (id, name, referee_id) values (5,"Zack",1);
insert into customer (id, name, referee_id) values (6,"Mark",2);
insert into customer (id, name, referee_id) values (7,"Georgi",4);
insert into customer (id, name, referee_id) values (8,"Bezalel",2);
insert into customer (id, name, referee_id) values (9,"Parto",2);
insert into customer (id, name, referee_id) values (10,"Chirstian",4);
insert into customer (id, name, referee_id) values (11,"Kyoichi",2);
insert into customer (id, name, referee_id) values (12,"Anneke",3);
insert into customer (id, name, referee_id) values (13,"Tzvetan",2);
insert into customer (id, name, referee_id) values (14,"Saniya",3);
insert into customer (id, name, referee_id) values (15,"Sumant",16);
insert into customer (id, name, referee_id) values (16,"Duangkaew",21);
insert into customer (id, name, referee_id) values (17,"Mary",4);
insert into customer (id, name, referee_id) values (18,"Patricio",3);
insert into customer (id, name, referee_id) values (19,"Eberhardt",7);
insert into customer (id, name, referee_id) values (20,"Berni",12);

select * from customer;

select name
from
	customer
where
	-- referee_id != 2 or referee_id is null;
	referee_id <> 2 or referee_id is null;
