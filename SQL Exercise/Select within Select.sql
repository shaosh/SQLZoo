//http://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
//Table world: name, continent, area, population, gdp

//1. 
//List each country name where the population is larger than 'Russia'.
SELECT name FROM world 
	WHERE population > (
		SELECT population FROM world
			WHERE name = 'Russia'
	)

//2.
//Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world 
	WHERE continent = 'Europe' AND
		gdp/population > (
			SELECT gdp/population FROM world 
				WHERE name = 'United Kingdom'
		)

//3.
//List the name and continent of countries in the continents containing 'Belize', 'Belgium'.
SELECT name, continent FROM world 
	WHERE continent IN (
		SELECT continent FROM world
			WHERE name IN ('Belize', 'Belgium')
	)

//4.
//Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world 
	WHERE population < (
		SELECT population FROM world 
			WHERE name = 'Poland'
	) AND population > (
		SELECT population FROM world 
			WHERE name = 'Canada'
	)

//5.
//Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
//Use ALL to allow >= or > or < or <=to act over a list.
SELECT name FROM world 
	WHERE gdp > ALL(
		SELECT gdp FROM world 
			WHERE continent = 'Europe' AND
				gdp IS NOT NULL
	)

//6.
//Find the largest country (by area) in each continent, show the continent, the name and the area:
//Use AS to refer outer SELECT and inner SELECT
SELECT x.continent, x.name, x.area
FROM world AS x
WHERE x.area = (
  SELECT MAX(y.area)
  FROM world AS y
  WHERE x.continent = y.continent)

//7.
//Find each country that belongs to a continent where all populations are less than 25000000. Show name, continent and population.
SELECT a.name, a.continent, a.population FROM world AS a
	WHERE 25000000 > ALL(
		SELECT b.population FROM world AS b
			WHERE b.continent = a.continent
	)

//8.
//Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT a.name, a.continent FROM world AS a
	WHERE a.population/3 > ALL(
		SELECT b.population FROM world AS b
			WHERE a.continent = b.continent AND
			a.name <> b.name
	)
