//http://sqlzoo.net/wiki/Using_Null_Quiz
//Table teacher: id, dept, name, phone
//Table dept: id, name

//1.

//2. Select the correct statement that shows the name of department which employs Cutflower
SELECT dept.name FROM
	teacher JOIN dept ON (dept.id = dept)
	WHERE name = Cutflower

//3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers
SELECT dept.name, COUNT(teacher.id) FROM
	teacher RIGHT JOIN dept ON (dept.id = dept)
	GROUP BY dept.name