Example Data Base Problems 
1. 
USE join_example_db;

SELECT *

FROM users

USE join_example_db;

SELECT *

FROM roles

2. 

USE join_example_db;

SELECT *

FROM users

JOIN roles on users.role_id = roles.id

LEFT JOIN roles on users.role_id = roles.id 
/* SHOWS NULL VALUES FOR 2 EMPLOYEES */

RIGHT JOIN roles on users.role_id = roles.id
/* SHOWS NULL VALUE FOR  ROLE #4 */

3. 
USE join_example_db;
SELECT COUNT(roles.name) AS role_count

FROM users

JOIN roles on users.role_id = roles.id

GROUP BY roles.name

classroom 

SELECT * 
FROM roles;

SELECT roles.name AS role_name,
	COUNT(users.name) AS number_of_employees
FROM users 
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY role_name

Employees Database Problems 

2. write a query that shows each department 
along with the name of the current manager for that department.
USE employees;

SELECT employees.first_name, employees.last_name, 
departments.dept_name, dept_manager.to_date

FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date LIKE '%9999%'

3. Find the name of all departments currently managed by women.

USE employees;

SELECT employees.first_name, employees.last_name, 
departments.dept_name, 
dept_manager.to_date, employees.gender

FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date LIKE '%9999%' AND employees.gender = 'F'

4. Find the current titles of 
employees currently working in the Customer Service department.

USE employees;

SELECT titles.title, COUNT(dept_emp.emp_no)

FROM titles 

JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
WHERE titles.to_date LIKE '%9999%' AND dept_no = 'd009'
GROUP BY title

5. Find the current salary of all current managers.

USE employees;

SELECT departments.dept_name, employees.first_name, employees.last_name, salaries.salary

FROM employees 

JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > curdate() AND salaries.to_date > curdate()



6. Find the number of current employees in each department.

USE employees;

SELECT departments.dept_no, departments.dept_name, 
COUNT(dept_emp.emp_no)

FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date LIKE '%9999%'
GROUP BY departments.dept_name


7.Which department has the highest average salary? 
Hint: Use current not historic information.

USE employees;

SELECT departments.dept_name, 
ROUND(AVG(salaries.salary)) AS average_salary

FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
WHERE salaries.to_date > CURDATE()
GROUP BY departments.dept_name

8. Who is the highest paid employee in the Marketing department?
USE employees;

SELECT employees.first_name, employees.last_name, dept_emp.dept_no, salaries.salary

FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
WHERE dept_emp.dept_no = 'd001' and salaries.to_date LIKE '%9999%'
ORDER BY salaries.salary DESC

9.Which current department manager has the highest salary?
USE employees;

SELECT departments.dept_name, employees.first_name, employees.last_name, 
salaries.salary

FROM employees 

JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > curdate() AND salaries.to_date > curdate()
ORDER BY salary DESC


10. Determine the average salary for each department. 
Use all salary information and round your results.

USE employees;

SELECT departments.dept_name, ROUND(Avg(salaries.salary)) AS average_salary

FROM salaries

JOIN dept_emp on salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY departments.dept_name




11.Bonus Find the names of all current employees, 
their department name, and their current manager's name.

12. Bonus Who is the highest paid employee within each department.
