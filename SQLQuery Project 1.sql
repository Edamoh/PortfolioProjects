SELECT *	
FROM Northamericacovid

SELECT *	
FROM Southamericacovid

--Data to be used for the project

SELECT Country, TotalCases, TotalDeaths, TotalRecovered, ActiveCases, Population
FROM Northamericacovid

--Looking Total death as a percentage

SELECT Country, TotalCases, TotalRecovered, TotalDeaths,(TotalDeaths/TotalCases)*100 DeathPercentage
FROM Northamericacovid
ORDER BY 1,2

--looking at Total case v population

SELECT Country, TotalCases, TotalRecovered, TotalDeaths,(TotalCases/Population)*100 CasePercentage
FROM Northamericacovid
ORDER BY 1,2

--Looking at Total case percentage In the U.S

SELECT Country, TotalCases, TotalRecovered, TotalDeaths,(TotalCases/Population)*100 CasePercentage
FROM Northamericacovid
WHERE Country LIKE '%USA%'

--Finding highest infection rate countries to population

SELECT Country, Population, MAX(TotalCases) as HighestInfectionCount, MAX(TotalCases/Population)*100 as HighestInfectionPercentage
FROM Northamericacovid
GROUP BY Country, Population
ORDER BY 1 desc