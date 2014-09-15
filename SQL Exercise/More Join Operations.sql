//http://sqlzoo.net/wiki/More_JOIN_operations
//Table movie : id, title, yr, director, budget, gross
//Table actor: id, name
//Table casting: movieid, actorid, ord

//1. List the films where the yr is 1962 [Show id, title]
SELECT id, title FROM movie
	WHERE yr = 1962

//2. Give year of 'Citizen Kane'.
SELECT yr FROM movie
	WHERE title = 'Citizen Kane'

//3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr FROM movie
	WHERE title LIKE '%Star Trek%'
	ORDER BY yr

//4. What are the titles of the films with id 11768, 11955, 21191
SELECT title FROM movie
	WHERE id IN (11768, 11955, 21191)

//5. What id number does the actor 'Glenn Close' have?
SELECT id FROM actor
	WHERE name = 'Glenn Close' 

//6. What is the id of the film 'Casablanca'
SELECT id FROM movie
	WHERE title = 'Casablanca'

//7. Obtain the cast list for 'Casablanca'. Use the id value that you obtained in the previous question.
SELECT name FROM 
	actor JOIN casting ON (id = actorid)
	WHERE movieid = (
		SELECT id FROM movie
			WHERE title = 'Casablanca'
	)

//8. Obtain the cast list for the film 'Alien'
SELECT name FROM
	actor JOIN casting ON (id = actorid)
	WHERE movieid = (
		SELECT id FROM movie
			WHERE title = 'Alien'
	)

//9. List the films in which 'Harrison Ford' has appeared
SELECT title FROM movie
	WHERE id IN (
		SELECT movieid FROM 
			actor JOIN casting ON (id = actorid)
			WHERE name = 'Harrison Ford'
	)

//10. List the films where 'Harrison Ford' has appeared - but not in the star role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title FROM movie
	WHERE id in (
		SELECT movieid FROM 
			actor JOIN casting ON (id = actorid)
			WHERE name = 'Harrison Ford' AND ord <> 1
	)

//11. List the films together with the leading star for all 1962 films.
SELECT title, name FROM
	movie JOIN casting ON (id = movieid)
	      JOIN actor ON (actorid = actor.id)
	WHERE yr = 1962 AND ord = 1

//12. Which were the busiest years for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
//Show all records with 2+ movies/yr
SELECT yr, COUNT(title) FROM movie 
	WHERE movie.id in (
		SELECT movieid FROM
		actor JOIN casting ON (actor.id = actorid)
		WHERE name = 'John Travolta')
	GROUP BY yr
	HAVING COUNT(title) > 2
//Show the max year
SELECT yr, COUNT(title) FROM movie 
	WHERE movie.id in (
		SELECT movieid FROM
		actor JOIN casting ON (actor.id = actorid)
		WHERE name = 'John Travolta')
	GROUP BY yr
	HAVING COUNT(title) = (
		SELECT MAX(c) FROM (
			SELECT COUNT(title) AS c FROM movie
				WHERE movie.id in (
					SELECT movieid FROM
					actor JOIN casting ON (actor.id = actorid)
					WHERE name = 'John Travolta')
				GROUP BY yr
		) AS t
	)

//13. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title, name FROM 
	movie JOIN casting ON (movie.id = movieid)
		  JOIN actor ON (actor.id = actorid)
		  WHERE ord = 1 AND movieid IN (
		  	SELECT movieid FROM 
		  		casting JOIN actor ON (actor.id = actorid)
		  		WHERE name = 'Julie Andrews'
		  )

//14. Obtain a list in alphabetical order of actors who have had at least 30 starring roles.
//ORDER BY should be after HAVING
SELECT name FROM
	actor JOIN casting ON (actorid = actor.id)
	WHERE ord = 1 
	GROUP BY name
	HAVING COUNT(movieid) >= 30
	ORDER BY name

//15. List the 1978 films by order of cast list size.
SELECT title, COUNT(*)  FROM
	movie JOIN casting ON (movie.id = movieid)
	WHERE yr = 1978	
	GROUP BY title
	ORDER BY COUNT(*) DESC

//16. List all the people who have worked with 'Art Garfunkel'.
SELECT name FROM
	actor JOIN casting on (actor.id = actorid)
	WHERE movieid IN (
		SELECT movieid FROM 
			casting JOIN actor on (actor.id = actorid)
			WHERE name = 'Art Garfunkel'
	) AND name <> 'Art Garfunkel'

