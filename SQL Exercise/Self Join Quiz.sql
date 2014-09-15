//http://sqlzoo.net/wiki/Self_join_Quiz
//Table stops: id, name
//Table route: num, company, pos, stop

//1. Select the code that would show it is possible to get from Craiglockhart to Haymarket
SELECT a.num from
	route AS a JOIN route AS b ON (a.com)