/* Pobieranie elementów za pomocą komendy SELECT 
Składnia:
SELECT column1, column2, ...
FROM table_name;
https://www.w3schools.com/sql/sql_select.asp
*/

SELECT Id, LastName, FirstName, Age FROM Users

SELECT * FROM Users

SELECT FirstName FROM Users

/* Warunek filtrujący Where 
Składnia:
SELECT column1, column2, ...
FROM table_name
WHERE condition;
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
https://www.w3schools.com/sql/sql_where.asp
https://www.w3schools.com/sql/sql_null_values.asp
https://www.w3schools.com/sql/sql_like.asp
https://www.w3schools.com/sql/sql_orderby.asp
*/

SELECT * FROM Users Where Age = 30

SELECT * from Users where Age > 20

SELECT * FROM Users Where LastName = 'Krychowski'

SELECT * FROM Users WHERE Age != 30 AND LastName = 'Krychowski'

SELECT * from Users where Age IS NULL

SELECT * FROM Users Where LastName like('%ski')

SELECT TOP 2 * FROM Users

SELECT * FROM Users order by Age DESC

SELECT * FROM Users order by Age ASC

/*1. Wypisz wszystkich użytkowników którzy mieszkają w Polsce i są pełnoletni*/
SELECT * FROM Users where Country = 'Poland' AND Age >= 18

/*2. Wypisz wszystkich użytkowników którzy mieszkają w Polsce lub we Włoszech*/
SELECT * FROM Users where Country = 'Poland' OR Country = 'Italy'

/*3. Wypisz 'Id' wszystkich użytkowników którzy nie mieszkają w Polsce*/
SELECT Id FROM Users Where Country != 'Poland'

/*4. Wypisz najstarszego użytkownika*/
SELECT TOP 1 * FROM Users ORDER BY Age DESC

/*5. Wypisz wszystkich użytkowników którzy nie mają przypisanego wieku*/
SELECT * FROM Users Where Age is null

/*6. Wypisz użytkowników których imie zaczyna się na literę 'J'*/
SELECT * FROM Users Where FirstName like('J%')


/* SQL COUNT(), AVG() and SUM()
Składnia:
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
SELECT AVG(column_name)
FROM table_name
WHERE condition;
SELECT SUM(column_name)
FROM table_name
WHERE condition;
https://www.w3schools.com/sql/sql_count_avg_sum.asp
*/

/*Sprawdzamy ile rekordów zawiera tabela (ilu jest użytkowników)*/
SELECT COUNT(Id) FROM Users 
SELECT COUNT(*) FROM Users

/*1. Wypisz sumę wieku wszystkich użytkowników*/
SELECT SUM(Age) FROM Users

/*2. Wypisz średnią wieku wszystkich użytkowników*/
SELECT AVG(Age) FROM Users

/*3. Wypisz sumę wieku użytkowników których imie zaczyna się na 'J' lub nazwisko kończy na 'ski'*/
SELECT SUM(Age) FROM Users Where FirstName like('J%') OR LastName like('%ski')

/* UPDATE
Składnia:
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
https://www.w3schools.com/sql/sql_update.asp
*/

UPDATE Users 
SET FirstName = 'New Jan',
	Age = 20
WHERE LastName = 'Nowak'

SELECT * FROM Users where LastName = 'Nowak'

/* DELETE
Składnia:
DELETE FROM table_name WHERE condition;
https://www.w3schools.com/sql/sql_delete.asp
*/

DELETE FROM Users where LastName = 'Nowak'


/* MIN, MAX
Składnia:
SELECT MIN(column_name)
FROM table_name
WHERE condition;
SELECT MAX(column_name)
FROM table_name
WHERE condition;
https://www.w3schools.com/sql/sql_min_max.asp
*/

SELECT MAX(Age) FROM Users

SELECT MIN(Age) FROM Users

/*1. Wypisz jaki jest wiek najstarszego użytkownika mieszkającego w Polsce*/
SELECT MAX(Age) from Users where Country = 'Poland'

/*2. Wypisz jaki jest najniższy wiek użytkownika który ma w nazwisku literę 'K'*/
SELECT MIN(Age) FRom Users Where LastName like ('%K%')

/* Usunięcie bazy danych Users */
DROP DATABASE Users;