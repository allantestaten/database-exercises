--2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
Enter a comment with the number of records returned.

SELECT first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
	--709 records returned

--3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
--but use OR instead of IN. Enter a comment with the number of records returned. 
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya') OR ('Maya'); INCORRECT 473

SELECT first_name 
FROM employees
WHERE first_name IN ('Irena','Vidya') OR first_name = ('Maya'); CORRECT 709

--Does it match number of rows from Q2? YES, 709 rows returned

--4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and 
--who is male. 

SELECT first_name, gender
FROM employees
WHERE gender = 'm'
	AND (first_name IN ('Irena','Vidya')
    OR first_name = 'Maya');
    --Enter a comment with the number of records returned. 441 records returned

    --5. Find all current or previous employees whose last name starts with 'E'. 
    --Enter a comment with the number of employees whose last name starts with E. 7330 Records returned
SELECT last_name, gender
FROM employees
WHERE last_name LIKE 'e%';

--6. Find all current or previous employees whose last name starts or ends with 'E'. 
--Enter a comment with the number of employees whose last name starts or ends with E. --30,723
SELECT last_name
FROM employees
WHERE last_name Like '%E' or last_name Like 'E%'

--How many employees have a last name that ends with E, but does not start with E? --23,393

SELECT last_name
FROM employees
WHERE last_name Like '%E' AND last_name NOT LIKE 'E%'

--7. Find all current or previous employees whose last name starts and ends with 'E'. 
--Enter a comment with the number of employees whose last name starts and ends with E. --899 
SELECT last_name
FROM employees
WHERE last_name Like '%E' and last_name Like 'E%'

--How many employees' last names end with E, regardless of whether they start with E? --24,292
SELECT last_name
FROM employees
WHERE last_name LIKE '%E'; 

--8. Find all current or previous employees hired in the 90s. 
SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
--Enter a comment with the number of employees returned. -- 135,214

--9. Find all current or previous employees born on Christmas.
SELECT last_name, hire_date
FROM employees
WHERE hire_datE LIKE '%12-25%';
--Enter a comment with the number of employees returned. --789 

--10. Find all current or previous employees hired in the 90s and born on Christmas. 
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '%12-25%' AND 
	hire_date BETWEEN '1990-01-01' AND '1999-12-31';
--Enter a comment with the number of employees returned. -- 346

--11. Find all current or previous employees with a 'q' in their last name. 
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'; 
--Enter a comment with the number of records returned. -- 1873

--12. Find all current or previous employees with a 'q' in their last name but not 'qu'. 
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
--How many employees are found? --547