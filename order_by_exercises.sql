--Lecture Notes 
use farmers_market;

SELECT*
FROM customer_purchases
ORDER BY customer_id DESC;

use farmers_market;
-- sorting two different columns simultaneously Order By 
SELECT*
FROM customer_purchases
ORDER BY customer_id ASC, quantity DESC;

--2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and 
--order your results returned by first name. In your comments, answer: 
--What was the first and last name in the first row of the results? Irena Reutenauer
-- What was the first and last name of the last person in the table? Vidya Simmen
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

--3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results 
--returned by first name and then last name. 
--In your comments, answer: What was the first and last name in the first row of the results? 
--What was the first and last name of the last person in the table?
--What was the first and last name in the first row of the results? Irena Acton
-- What was the first and last name of the last person in the table? Vidya Zweizig

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

--4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results 
--returned by last name and then first name. In your comments, answer: What was the first and last name 
--in the first row of the results? What was the first and last name of the last person in the table? 
--Irena Acton / Maya Zyda

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

--5.Write a query to to find all employees whose last name starts and ends with 'E'. 
--Sort the results by their employee number. 
--Enter a comment with the number of employees returned, the first employee number and 
--their first and last name, and the last employee number with their first and last name. 
--899 Employees returned/ employee number 10021/ Ramzi Erde/ 499648/ Tadahiro Erde

SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no;

--6. Write a query to to find all employees whose last name starts and ends with 'E'. 
--Sort the results by their hire date, so that the newest employees are listed first. 
--Enter a comment with the number of employees returned, 
--the name of the newest employee, and the name of the oldest employee.
--899 Employees returned/ Teiji Eldridge/ Sergi Erde
SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY hire_date ;

--7. Find all employees hired in the 90s and born on Christmas. 
--Sort the results so that the oldest employee who was hired last is the first result. 
--Enter a comment with the number of employees returned, the name of the oldest employee who was hired last,
--and the name of the youngest employee who was hired first.
--362 RETURNED/KHUN BERNINI/DOUADI PETTIS
SELECT *
FROM employees
WHERE hire_date LIKE '199%' 
	AND birth_date LIKE '%12-25%'
    ORDER BY birth_date DESC, hire_date ;

    SELECT *
FROM employees
WHERE hire_date LIKE '199%' 
	AND birth_date LIKE '%12-25%'
    ORDER BY birth_date , hire_date DESC ;
