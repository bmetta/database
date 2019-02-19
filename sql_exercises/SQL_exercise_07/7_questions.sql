-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express 
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
select client.Name
	from Package
	inner join client
		on Recipient = AccountNumber
	where Weight = 1.5;

-- 7.2 What is the total weight of all the packages that he sent?
select sum(weight)
	from Package
	where Sender =
	(
		select Recipient from Package where weight = 1.5
	);
