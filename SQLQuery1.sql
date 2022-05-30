CREATE DATABASE [Procedure]

USE [Procedure]

CREATE TABLE Books(
	Id int PRIMARY KEY IDENTITY,
	[Name] nvarchar(100) CHECK(LEN([Name])>=2) NOT NULL,
	AuthorId int FOREIGN KEY REFERENCES Authors(Id),
	[PageCount] smallint CHECK([PageCount]>=10) NOT NULL,
)

CREATE TABLE Authors(
	Id int PRIMARY KEY IDENTITY,
	[Name] nvarchar(30) NOT NULL,
	Surname nvarchar(30),
)

CREATE VIEW vw_View1 AS
SELECT * FROM(
	SELECT b.Id , b.Name, b.PageCount, a.Name+' '+a.Surname AS AuthorFullName FROM Books AS b
	JOIN Authors AS a
	ON b.AuthorId=a.Id
) AS [First]

CREATE VIEW vw_Authors AS
SELECT * FROM(
	SELECT a.Id, a.Name+' '+a.Surname AS FullName, COUNT(b.Id) AS BooksCount, MAX(b.PageCount) AS MaxPageCount FROM Books AS b
	JOIN Authors AS a
	ON b.AuthorId=a.Id
) AS [Second]