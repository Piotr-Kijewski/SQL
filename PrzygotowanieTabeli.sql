/* Stworzenie tabeli Users */

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
