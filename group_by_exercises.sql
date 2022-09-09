2. In your script, use DISTINCT to find the unique titles 
in the titles table. How many unique titles have there ever been? 
Answer that in a comment in your SQL file.

7 distinct titles 

USE employees;
SELECT DISTINCT title
FROM titles 

3. Write a query to to find a list of all unique last names 
of all employees that start and end with 'E' using GROUP BY.

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name

4. Write a query to to find all unique combinations of 
first and last names of all employees whose last names 
start and end with 'E'.

SELECT DISTINCT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'

classroom 
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name

5. Write a query to find the unique last names with a 'q' but
 not 'qu'. Include those names in a comment in your sql code.

SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%' 
    AND last_name NOT LIKE '%qu%'

'Chleq'
'Lindqvist'
'Qiwen'

classroom 
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' 
    AND last_name NOT LIKE '%qu%'
GROUP BY last_name

6. Add a COUNT() to your results (the query above) to find 
the number of employees with the same last name.

SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%'

547

classroom (breaks them out by name, not overall total)
SELECT last_name, 
	COUNT(last_name) AS number_of_employees
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name


7. Find all employees with first names 
'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the
 number of employees for each gender with those names.

SELECT COUNT(*),gender
FROM employees
WHERE first_name = ('Irena'
	AND 'Vidya'
    OR 'Maya')
GROUP BY gender
m 179973
f 120051

CLASSROOM, breakout how many of each gender in each name 
SELECT gender, first_name, COUNT(gender)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name;

8. Using your query that generates a username for all of the 
employees, generate a count employees for each unique username. 
'300024'

SELECT COUNT(LOWER(CONCAT(substring(first_name,1,1), 
substring(last_name,1,4), '_',
substring(birth_date,6,2), 
substring(birth_date,3,2))))
FROM employees

classroom 
SELECT COUNT(*) as COUNT_OF_USERS,
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
GROUP BY username;

Are there any duplicate usernames? 
classroom 
SELECT COUNT(*) as COUNT_OF_USERS,
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
GROUP BY username
HAVING count_of_users >1 ;
BONUS: How many duplicate usernames are there?