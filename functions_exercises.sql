--Lecture Notes 
SELECT CONCAT ('Hey, 1+1 = ', 2);

USE employees;

SELECT REPLACE(dept_no, 'd00', 'Department ')
FROM departments;

USE employees;

SELECT CONCAT(LOWER (first_name), ' ', UPPER(last_name))
FROM employees;

USE employees;

SELECT substr(dept_no, 2, 3)
FROM departments;

2.Write a query to to find all employees whose last name starts and ends with 'E'. 
Use concat() to combine their first and last name together as a single column named full_name.

SELECT (CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E'

3. Convert the names produced in your last query to all uppercase.

SELECT UPPER (CONCAT(first_name, ' ', last_name))
FROM employees
WHERE last_name LIKE 'E%E';


4. Find all employees hired in the 90s and born on Christmas. 
Use datediff() function to find how many days they have been working at the company 
(Hint: You will also need to use NOW() or CURDATE()),

SELECT DATEDIFF(now(),hire_date),first_name, last_name
FROM employees
WHERE hire_date LIKE '199%' 
	AND birth_date LIKE '%12-25%';



5. Find the smallest and largest current salary from the salaries table.
SELECT MAX(salary), 
    MIN(salary)
FROM salaries
WHERE to_date > CURDATE();




--6. Use your knowledge of built in SQL functions to generate a username for all of the employees. 
A username should be all lowercase, and consist of the first character of the employees first name, 
the first 4 characters of the employees last name, an underscore, the month the employee was born, 
and the last two digits of the year that they were born. 
Below is an example of what the first 10 rows will look like:

SELECT LOWER(CONCAT(substring(first_name,1,1), 
substring(last_name,1,4), '_',
substring(birth_date,6,2), 
substring(birth_date,3,2)))
FROM employees

class solution 
USE employees; 

SELECT first_name,
	last_name, 
    birth_date,
    LOWER(
	CONCAT(
		SUBSTR(first_name,1,1),
		SUBSTR(last_name, 1, 4),
		'_',
        SUBSTR(birth_date, 6, 2),
        SUBSTR(birth_date, 3, 2)
       )
	) AS username
FROM employees