/* Stworzenie tabeli Users */
CREATE TABLE Users (
	Id INT IDENTITY (1,1) PRIMARY KEY,
  	FirstName VARCHAR (255) NOT NULL,
  	LastName VARCHAR (255),
  	Email VARCHAR (255) NOT NULL,
  	Age INT
);

/* Stworzenie tabeli Expenses */
CREATE TABLE Expenses (
	Id INT IDENTITY (1,1) PRIMARY KEY,
  	UserId INT,
  	Title VARCHAR (255) NOT NULL,
  	Description VARCHAR (255),
  	Price DECIMAL (10,2) NOT NULL,
  	StoreName VARCHAR (255),
  	Date datetime2
);

/* Stworzenie relacji pomiędzy użytkownikiem a wydatkami. Jeden użytkownik może mieć wiele wydatków. */
ALTER TABLE Expenses
ADD CONSTRAINT FK_UserExpense
FOREIGN key (UserId) REFERENCES Users (Id);

INSERT INTO Users (FirstName, LastName, Email, Age)
VALUES
/* Id 1 */ ('Filip', 'Paluch', 'filip@o2.pl', NULL),
/* Id 2 */ ('Damian', 'Krychowski', 'damian@gmail.com', 31)

INSERT INTO Expenses (UserId, Title, Description, Price, StoreName, Date)
VALUES
(1, 'Masło', NULL, 5.99, 'Lidl', '2022-03-09 12:34:11'),
(1, 'Chleb', NULL, 4.80, 'Lidl', '2022-03-09 12:34:11'),
(1, 'Szynka', NULL, 40.39, 'Lidl', '2022-03-09 12:34:11'),
(1, 'Sól', NULL, 2.00, 'Lidl', '2022-03-04 06:21:11'),
(1, 'Sok', 'Dla Adama', 3.78, 'Biedronka', '2022-03-06 10:46:20'),
(1, 'Woda mineralna', NULL, 1.20, 'Biedronka', '2022-03-06 10:46:20'),
(1, 'Mięso', NULL, 25.87, 'Biedronka', '2022-03-06 10:46:20'),
(1, 'Pomidory', NULL, 12.99, 'Biedronka', '2022-03-06 10:46:20'),
(1, 'Papryka', NULL, 14.99, NULL, '2022-03-07 09:59:20'),
(1, 'Banany', NULL, 8.99, NULL, '2022-03-07 09:59:20'),
(1, 'Mięso', NULL, 45.87, 'Sklep mięsny PROSIACZEK', '2022-03-05 12:46:20'),

(2, 'Mięso', NULL, 35.87, 'Lidl', '2022-03-05 10:46:20'),
(2, 'Pomidory', NULL, 14.99, 'Lidl', '2022-03-06 07:30:20'),
(2, 'Gruszki', NULL, 3.99, 'Biedronka', '2022-03-07 08:59:20'),
(2, 'Mięso', NULL, 87.99, 'Sklep mięsny PROSIACZEK', '2022-03-07 09:59:20'),
(2, 'Mięso', NULL, 37.99, NULL, '2022-02-07 09:59:20'),
(2, 'Mięso', NULL, 67.99, 'Sklep mięsny PROSIACZEK', '2022-01-07 09:59:20'),
(2, 'Płatki', 'Zakupy dla rodziców', 5.99, 'Lidl', '2022-01-03 09:59:20'),
(2, 'Mydło', 'Zakupy dla rodziców', 7.99, 'Lidl', '2022-01-03 09:59:20')

/* 1. Wypisz wszystkie wydatki z tabeli Expenses które powiązane są z użytkownikiem Filip w kolejnosci od najnowszych do najstarszych */
SELECT *
FROM Expenses
WHERE UserId = 1
ORDER BY Date DESC

/* 2. Wypisz wszystkie wydatki użytkoownika Filip i Damian które zostały wykonane w sklepie Lidl. */
SELECT *
FROM Expenses
WHERE StoreName = 'Lidl'

/* 3. Wypisz jaka jest cena najdroższego wydatku dla uzytkownika Filip. */
SELECT TOP 1 Price
FROM Expenses
WHERE UserId = 1
ORDER BY Price DESC

/* 4. Podlicz i wypisz ile sumarycznie wydał uzytkownik Damian na mięso w miesiącu Marzec. */
SELECT SUM (Price)
FROM Expenses
WHERE UserId = 2 AND Title = 'Mięso' AND Date LIKE ('%-03-%')

/* 5. Wypisz wszystkie wydatki wszystkich uzytkowników które mają dodany opis. */
SELECT *
FROM Expenses
WHERE Description IS NOT NULL

/* 6. Policz i wypisz ile średnio wydał użytkownik Damiana na mięso. */
SELECT AVG (Price)
FROM Expenses
WHERE UserId = 2 AND Title = 'Mięso'

/* 7. Policz i wypisz za pomocą jednego zapytania ile wydał łącznie Filip oraz Damian dnia 07.03.2022.
	Wypisz wyniki w postaci dwóch kolumn: Użytkownik, Kwota.*/
SELECT UserId AS Użytkownik, SUM (Price) AS Kwota
FROM Expenses
WHERE Date LIKE ('2022-03-07%')
GROUP BY UserId

/* zadania z gwiazdką. */
/* 6. Wypisz wszystkie wydatki wszystkich użytkowników łącząc dane z tabeli Expenses z danymi z tabeli Users 
	za pomocą komendy JOIN w formie: FirstName, LastName, Title, Price. */
SELECT Users.FirstName, Users.LastName, Expenses.Title, Expenses.Price
FROM Users 
JOIN Expenses ON Users.Id = Expenses.UserId

/* 7. Podlicz i wypisz ile średnio wydaje Damian i Filip w każdym miesiącu na mięso. */
SELECT MONTH(Date), AVG(Price) 
FROM Expenses 
WHERE Title = 'mięso' 
GROUP BY MONTH(Date)