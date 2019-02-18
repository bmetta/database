-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store
-- 1.1 Select the names of all the products in the store.
SELECT Name FROM Products;

-- 1.2 Select the names and the prices of all the products in the store.
SELECT Name, Price FROM Products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT Name FROM Products WHERE Price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
SELECT Name, Price FROM Products WHERE Price >= 60 AND Price < 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name, Price*100 as 'Price(in cents)' FROM Products;

-- 1.6 Compute the average price of all the products.
SELECT AVG(Price) FROM Products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price) FROM Products WHERE Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) FROM Products WHERE Price >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name, Price FROM Products WHERE Price >= 180 ORDER BY Price DESC, Name ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT a.*, b.Name FROM Products a JOIN Manufacturers b ON (a.Manufacturer = b.Code);
SELECT a.*, b.Name FROM Products a, Manufacturers b WHERE a.Manufacturer = b.Code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT a.Name, a.Price, b.Name
	FROM Products a, Manufacturers b
	WHERE a.Manufacturer = b.Code;

SELECT a.Name, a.Price, b.Name
	FROM Products a
	JOIN Manufacturers b
	ON a.Manufacturer = b.Code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT Manufacturer, AVG(Price)
	FROM Products 
	GROUP BY Manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(a.Price), b.Name
	FROM Products a
	JOIN Manufacturers b ON a.Manufacturer = b.Code
	GROUP BY b.name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(a.Price), b.Name
	FROM Products a
	JOIN Manufacturers b ON a.Manufacturer = b.Code
	GROUP BY b.name
	HAVING AVG(a.Price) >= 150;
	
-- 1.15 Select the name and price of the cheapest product.
SELECT Name, Price 
	FROM Products 
	WHERE Price = (SELECT min(Price) FROM Products);

SELECT Name, Price
	FROM Products
	ORDER BY Price ASC
	LIMIT 1;

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
select manname, product, maxprice
from 
		(select Price, Manufacturer, m.Name as manname, p.name as product
		 from Products p
		 join Manufacturers m
		 on p.Manufacturer = m.Code) manf
	join 
		(select Manufacturer, MAX(Price) as maxprice from Products group by Manufacturer) price
	on 
		manf.Manufacturer = price.Manufacturer
		and 
		manf.Price = price.maxprice;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products VALUES (11, "Loudspeakers", 70, 2);

-- 1.18 Update the name of product 8 to "Laser Printer".
UPDATE Products SET Name = 'Laser Printer' WHERE Name = 'Printer';

UPDATE Products SET Name = 'Laser Printer' WHERE Code = 8;

-- 1.19 Apply a 10% discount to all products.
UPDATE Products SET Price = Price * 0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE Products SET Price = Price * 0.9 WHERE Price > 120;
