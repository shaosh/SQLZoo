//http://sqlzoo.net/wiki/Nobel_Quiz
//Table nobel: yr, subject, winner

//Pick the code which shows the name of winner's names beginning with C and ending in n
1. 	SELECT winner FROM nobel 
   		WHERE winner LIKE 'C%' AND winner LIKE 'n%'

//Select the code that shows how many Chemistry awards were given between 1950 and 1960
2. 	SELECT COUNT(subject) FROM nobel
		WHERE yr BETWEEN 1950 AND 1960 
		      AND subject = 'Chemistry'

//Pick the code that shows the amount of years where no Medicine awards were given
3. 	SELECT COUNT(DISTINCT yr) FROM nobel
		WHERE yr NOT IN (SELECT yr FROM nobel 
			WHERE subject = 'Medicine')

4. 	SELECT subject, winner FROM nobel 
		WHERE yr LIKE '196%' and winner LIKE 'Sir%'

//Select the code which would show the year when neither a Physics or Chemistry award was given
5. 	SELECT yr FROM nobel 
		WHERE yr NOT IN 
			(SELECT yr FROM nobel 
				WHERE subject = 'Physics' OR subject = 'Chemistry')
				or
				WHERE subject IN ('Physics', 'Chemistry')

//Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
6. 	SELECT DISTINCT yr FROM nobel 
		WHERE yr NOT IN (
			SELECT yr FROM nobel
				WHERE subject IN ('Peace', 'Literature')
		)
		AND subject = 'Medicine'

7.	SELECT subject, COUNT(subject) FROM nobel
		WHERE yr = '1960' 
		GROUP BY subject