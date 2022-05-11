/* Stworzenie tabeli Users na https://sqliteonline.com/ 
Wybieramy MS SQL i klikamy Click to connect*/

/* Opis kroków:
CREATE TABLE - tworzymy tabelę o nazwie'Users'
Nazwy kolumn: Id, LastName, FirstName, Age, Country
INT - liczby całkowite
VARCHAR - wartość typu 'Tekst' (max. 255 znaków)
IDENTITY(1,1) - auto inkrementalny identyfikator (od 1, co 1)
PRIMARY KEY - indywidualny identyfikator użytkownika
NOT NULL - pole nie może być puste*/

CREATE TABLE Users (
    Id int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int,
    Country varchar(255) 
);

/* Dodanie rekordów do tabeli Users 
Składnia
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
UWAGA - gdy pole oznaczone jako 'PRIMARY KEY' (w naszym przypadku 'Id') skonfigurowane jest
jako autogenerowane ('IDENTITY(1,1)') to nie podajemy go w wartościach przy dodawaniu rekordów
https://www.w3schools.com/sql/sql_insert.asp
*/

INSERT INTO Users
VALUES ('Paluch', 'Filip', 30, 'Italy')

INSERT INTO Users
VALUES ('Krychowski', 'Damian', 31, 'Poland')

INSERT INTO Users
VALUES ('Kowalski', 'Jan', 17, 'Poland')

INSERT INTO Users
VALUES ('Nowak', 'Jan', null, 'Spain')
