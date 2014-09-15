//http://sqlzoo.net/wiki/JOIN_Quiz_2#quiz0
//Table movie : id, title, yr, director, budget, gross
//Table actor: id, name
//Table casting: movieid, actorid, ord

//1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT director FROM movie
	WHERE gross < budget

//2. Select the correct example of JOINing three tables
SELECT * FROM
	actor JOIN casting ON (actor.id = actorid)
	JOIN movie ON (movie.id = movieid)

//3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
SELECT name, COUNT(movieid) FROM
	actor JOIN casting ON (actorid = actor.id)
	WHERE name LIKE 'John%'
	GROUP BY name
	ORDER BY COUNT(movieid)

//4. Select the result that would be obtained from the following code:

//5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott
SELECT name FROM 
	movie JOIN casting ON (moive.id = movieid)
		  JOIN actor ON (actor.id = actorid)
	WHERE director = 'Ridley Scott' AND ord = 1

//6. Select the statement showing all movies with budget bigger than ALL movie with Harrison Ford is incorrect
SELECT title FROM movie 
	WHERE budget > ALL(
		SELECT budget FROM 
			movie JOIN casting ON (moive.id = movieid)
				  JOIN actor ON (actor.id = actorid)
			WHERE name = 'Harrison Ford'
	)

//7. Select the result that would be obtained from the following code:


