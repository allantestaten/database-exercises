1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' 
that is a 1 if the employee is still with the company and 0 if not.

USE employees; 

SELECT de.emp_no, de.dept_no, de.from_date, de.to_date,
	CASE to_date
		WHEN '9999-01-01' THEN '1'
        ELSE '0'
	END AS is_current_employee
FROM dept_emp AS de

/*2. Write a query that returns all employee names 
(previous and current), and a new column 'alpha_group' 
that returns 'A-H', 'I-Q', or 'R-Z'
 depending on the first letter of their last name.*/
 
USE employees;

SELECT 
	e.first_name, e.last_name, de.emp_no,
	CASE 
		WHEN e.last_name BETWEEN 'A%' AND 'I%' THEN 'A-H'
        WHEN e.last_name BETWEEN 'I%' AND 'R%' THEN 'A-H'
        ELSE 'R-Z'
	END AS 'alpha_group'
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no

3. 
USE employees;

SELECT 
		COUNT(CASE WHEN e.birth_date BETWEEN '1950-01-01' AND '1959-12-31'
			THEN e.birth_date ELSE NULL END) AS '50s',
       COUNT(CASE WHEN e.birth_date BETWEEN '1960-01-01' AND '1969-12-31'
			THEN e.birth_date ELSE NULL END) AS '60s'   
FROM employees e 

4. What is the current average salary for each of the following department groups:
 R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT
    CASE
        WHEN d.dept_name IN ('Research', 'Development') THEN 'R&D'
        WHEN d.dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN d.dept_name IN ('Finance', 'Human Resources') THEN 'Finanace & HR'
        ELSE d.dept_name
    END AS dept_group, AVG(salary)
FROM departments d
JOIN dept_emp de USING (dept_no)
JOIN salaries s USING (emp_no)
WHERE s.to_date > NOW() AND de.to_date > NOW()
GROUP BY dept_group

