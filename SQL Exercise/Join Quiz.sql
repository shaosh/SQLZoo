//http://sqlzoo.net/wiki/JOIN_Quiz
//Table game: id, madate, stadium, team1, team2
//Table goal: matchid, teamid, player, gtime
//Table eteam: id, teamname, coach

//1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:
SELECT stadium FROM
	game JOIN goal ON (id = matchid)
	WHERE player = 'Dimitris Salpingidis'

//2. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:

//3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
SELECT player, teamid, COUNT(player) FROM
	game JOIN goal ON (id = matchid)
	WHERE (team1 = 'GRE' OR team2 = 'GRE') AND teamid <> 'GRE'
	GROUP BY player

//4. Select the result that would be obtained from this code: SELECT teamid, mdate FROM goal JOIN game on (matchid=id) WHERE mdate = '9 June 2012'

//5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
SELECT DISTINCT player, teamid FROM
	game JOIN goal ON (id = matchid)
	WHERE (team1 = 'POL' OR team2 = 'POL') AND teamid != 'POL'
		  AND stadium = 'National Stadium, Warsaw'

//6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
SELECT playre, teamid, gtime FROM
	game JOIN goal ON (id = matchid)
	WHERE stadium = 'Stadion Miejski (Wroclaw)' AND (teamid = team1 OR teamid = team2) AND 
		  ((team1 != 'ITA' AND team2 != 'ITA' AND teamid != 'ITA') OR (teamid = 'ITA'))
