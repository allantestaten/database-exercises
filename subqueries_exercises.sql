1. Find all the current employees with 
the same hire date as employee 101010 using a sub-query.

USE employees;

USE employees;

SELECT *
FROM dept_emp
WHERE dept_emp.emp_no IN(SELECT emp_no
	FROM employees WHERE hire_date ='1990-10-22'
    AND to_date > CURDATE())

CLASSROOM
USE employees;

FROM employees
JOIN dept_emp USING(emp_no)
WHERE to_date > CURDATE()
AND hire_date= 
				(SELECT hire_date
                FROM employees 
                WHERE emp_no = '101010'

2. Find all the titles ever held by all current employees with the first name Aamod.
USE employees;

SELECT *

FROM titles
WHERE emp_no IN (SELECT emp_no FROM employees
				WHERE employees.first_name = 'Aamod')
                MISSING CURDATE FOR CURRENTLY EMPLOYEES 

CLASSROOM
USE employees;

SELECT title

FROM titles
WHERE emp_no IN (SELECT emp_no FROM employees
				JOIN dept_emp USING (emp_no)
                WHERE employees.first_name = 'aamod'
				AND to_date > CURDATE())
3. How many people in the employees table are no longer working for the company? 
Give the answer in a comment in your code.
    /*91,479*/

SELECT former_employees
FROM employees
WHERE emp_no IN (SELECT COUNT(emp_no)AS former_employees	
				FROM dept_emp
				WHERE dept_emp.to_date != '9999-01-01')
4. Find all the current department managers that are female.
 List their names in a comment in your code.
 /*'Isamu Legleitner'
'Karsten Sigstam'
'Leon DasSarma'
'Hilary Kambil'*/

USE employees;

SELECT *
FROM employees
WHERE emp_no IN (SELECT emp_no
				FROM dept_manager
                WHERE gender ='F' 
                AND to_date > CURDATE())


5. finish

SELECT employees.first_name, employees.last_name
FROM employees
WHERE emp_no IN (SELECT emp_no
FROM salaries
WHERE to_date > CURDATE() AND salaries.salary > 
				(SELECT(AVG(salaries.salary)) 
                FROM salaries))

6. 