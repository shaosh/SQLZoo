//http://sqlzoo.net/wiki/SUM_and_COUNT_Quiz
//Table bbc: name, region, area, population, gdp

//1. Select the statement that shows the sum of population of all countries in 'Europe'
SELECT SUM(population) FROM bbc
	WHERE region = 'Europe'

//2. Select the statement that shows the number of countries with population smaller than 150000
SELECT COUNT(name) FROM bbc
	WHERE population < 150000

//4. Select the result that would be obtained from the following code:
SELECT region, SUM(area) FROM bbc
	HAVING SUM(area) > 15000000
	GROUP BY region

//5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population) FROM bbc
	WHERE name IN ( 'Poland', 'Germany', 'Denmark')

//6. Select the statement that shows the medium population density of each region
SELECT region, SUM(population)/SUM(area) FROM bbc
	GROUP BY region

//7. Select the statement that shows the name and population density of the country with the largest population
SELECT name, population/area FROM bbc
	WHERE population = (
		SELECT MAX(population) FROM bbc
	)

//8. Pick the result that would be obtained from the following code:
SELECT region, SUM(area) FROM bbc
	GROUP BY region
	HAVING SUM(area) <= 20000000
