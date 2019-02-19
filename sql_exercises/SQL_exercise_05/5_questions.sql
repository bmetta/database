-- https://en.wikibooks.org/wiki/SQL_Exercises/Pieces_and_providers
-- 5.1 Select the name of all the pieces. 
select name from Pieces;

-- 5.2 Select all the providers' data. 
select * from Providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
select Piece, avg(Price)
	from Provides
	group by Piece;

-- 5.4  Obtain the names of all providers who supply piece 1.
select Name
	from Provides
	join Providers
	on Provider = Code
	where Piece = 1;

-- 5.5 Select the name of pieces provided by provider with code "HAL".
select Name
	from Pieces
	where Code in
	(
		select Piece from Provides where Provider = 'HAL'
	);

/* With EXISTS subquery */   
select Name
	from Pieces
	where exists
	(
		select *
		from Provides
		where Provider = 'HAL'
			and Pieces.Code = Piece
	)

-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------

-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
insert into Provides values (1, 'TNBC', 7);

-- 5.8 Increase all prices by one cent.
update Provides set Price = Price + 1;

-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
delete from Provides where Provider = 'RBT' and Piece = 4;

-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
delete from provides where provider = 'RBT';
