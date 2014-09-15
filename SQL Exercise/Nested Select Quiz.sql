//http://sqlzoo.net/wiki/Nested_SELECT_Quiz
//Table bbc: name, region, area, population, gdp

//1. Select the code that shows the name, region and population of the smallest country in each region
SELECT a.name, a.region, a.population FROM bbc AS a 
	WHERE a.population <= ALL(
		SELECT b.population FROM bbc AS b
			WHERE b.region = a.region
	)

//2. Select the code that shows the countries belonging to regions with all populations over 50000
SELECT a.name FROM bbc AS a
	WHERE 50000 <= ALL(
		SELECT b.population FROM bbc AS b
			WHERE b.region = a.region
	)

//3. Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT a.name FROM bbc AS a
	WHERE a.population < ALL(
		SELECT b.population/3 FROM bbc AS b
			WHERE b.region = a.region AND
				a.name <> b.name
	)

//4. Select the result that would be obtained from the following code:
SELECT name FROM bbc 
	WHERE population > (
		SELECT population FROM bbc 
			WHERE name = 'United Kingdom'
	)
	AND
	region IN (
		SELECT region FROM bbc
			WHERE name = 'United Kingdom'
	)

//5. Select the code that would show the countries with a greater GDP than any country in Africa
SELECT name FROM bbc
	WHERE gdp > ALL(
		SELECT gdp FROM bbc 
			WHERE region  = 'Africa'
			AND gdp IS NOT NULL
	)

//6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name FROM bbc
	WHERE population > (
		SELECT population FROM bbc 
			WHERE name = 'Denmark'
	)
	AND
	population < (
		SELECT population FROM bbc 
			WHERE name = 'Russia'
	)

//7. Select the result that would be obtained from the following code:
SELECT name FROM bbc
	WHERE population > ALL(
		SELECT MAX(population) FROM bbc
			WHERE region = 'Europe'
	)
	AND
	region = 'South Asia'

