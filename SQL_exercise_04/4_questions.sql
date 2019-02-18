-- https://en.wikibooks.org/wiki/SQL_Exercises/Movie_theatres
-- 4.1 Select the title of all movies.
select Title from Movies;

-- 4.2 Show all the distinct ratings in the database.
select distinct(Rating) from Movies;
select distinct Rating from Movies;

-- 4.3  Show all unrated movies.
select Rating from Movies where Rating is NULL;

-- 4.4 Select all movie theaters that are not currently showing a movie.
select Name from MovieTheaters where Movie is NULL;

-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
select * from MovieTheaters mt join Movies m on Movie = m.code;
select * from MovieTheaters mt left join Movies m on Movie = m.code;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
select * from Movies m left join MovieTheaters mt on Movie = m.code;
select * from MovieTheaters mt right join Movies m on Movie = m.code;

-- 4.7 Show the titles of movies not currently being shown in any theaters.
select Title 
	from Movies
	where code not in
	(
		select Movie
		from MovieTheaters
		where Movie is not NULL
	);

select Title
	from Movies m
	left join MovieTheaters mt
	on m.Code = mt.Movie
	where Name is NULL;

-- 4.8 Add the unrated movie "One, Two, Three".
insert into
	Movies(Code, Title, Rating)
	Values(9, 'One, Two, Three', NULL);

-- 4.9 Set the rating of all unrated movies to "G".
update Movies
	set Rating = 'G'
	where Rating is NULL;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
delete 
	from Movietheaters
	where Movie in
	(
		select Code from Movies where Rating = 'NC-17'
	);
