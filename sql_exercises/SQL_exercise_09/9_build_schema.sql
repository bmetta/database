create table cran_logs (
	date DATE,
	time TIME,
	size int,
	r_version varchar(255),
	r_arch varchar(255),
	r_os varchar(255),
	package varchar(255),
	version varchar(255),
	country varchar(255),
	ip_id int
);

load data local infile '/Users/bhogeswararao/workspace/github/mysql/SQL_exercise_09/cran_logs_2015-01-01.csv'
into table cran_logs
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

