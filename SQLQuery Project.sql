--ZONAL NUMBERS

SELECT *
FROM Northamericacovid


SELECT *
FROM Southamericacovid

SELECT Country, TotalCases, COUNT(ActiveCases)
FROM Northamericacovid
WHERE ActiveCases is not NULL
GROUP BY Country, TotalCases
ORDER BY 1,2 DESC

--Joining Northamerican and Southamerica covid data together (Althugh fully joined, Nothing here is 
distinct to both columns in the data that is why we have alot of columns with null)

SELECT *
FROM Northamericacovid N 
FULL OUTER JOIN Southamericacovid S
ON N.Country = S.Country

SELECT N.Country, N.TotalDeaths,N.ActiveCases, S.Country, S.TotalDeaths, S.TotalCases
FROM Northamericacovid N 
RIGHT JOIN Southamericacovid S
ON N.Country = S.Country

SELECT N.Country, N.TotalDeaths,N.ActiveCases, S.Country, S.TotalDeaths, S.TotalCases
FROM Northamericacovid N 
LEFT JOIN Southamericacovid S
ON N.Country = S.Country

--Looking at Population vs Active Cases using Partition by

SELECT N.Country, N.TotalDeaths,N.ActiveCases, S.Country, S.TotalDeaths, S.ActiveCases
,SUM(S.ActiveCases) OVER  (Partition by N.Country, N.TotalDeaths,N.ActiveCases)
FROM Northamericacovid N 
JOIN Southamericacovid S
ON N.Country = S.Country
WHERE S.ActiveCases IS NOT NULL

USING SUBQUERIES

--Selecting a record from the table with highest Active Cases in Northamerica
SELECT *
FROM Northamericacovid 
WHERE ActiveCases = (SELECT MAX(ActiveCases) FROM Northamericacovid)

SELECT *
FROM Northamericacovid 
WHERE ActiveCases = (SELECT MIN(ActiveCases) FROM Northamericacovid)

--USING CTE's 

WITH CTE_Northamerica as
(
SELECT *
FROM Northamericacovid 
WHERE ActiveCases = (SELECT MIN(ActiveCases) FROM Northamericacovid)
)
SELECT Population, MIN(ActiveCases) MinimumActiveCases
FROM CTE_Northamerica
GROUP BY Population

