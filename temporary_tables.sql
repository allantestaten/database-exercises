Using the example from the lesson, create a temporary table called employees_with_departments that 
contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", 
it means that the query was attempting to write a new table to a database that you can only read.

CREATE TEMPORARY TABLE employees_with_departments AS (
SELECT e.emp_no, first_name, last_name, d.dept_no, d.dept_name
FROM employees.employees e  
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
LIMIT 100
);

a. Add a column named full_name to this table. It should be a VARCHAR 
whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE employees_with_departments ADD full_name varchar(100);

b. Update the table so that full name column contains the correct data

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

c. Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name, 
										DROP COLUMN last_name; 
ALTER TABLE employees_with_departments DROP COLUMN emp_no;

D. What is another way you could have ended up with this same table?

USE employees; 

SELECT first_name, last_name, d.dept_name
FROM employees.employees e  
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no

2. Create a temporary table based on the payment table from the sakila database.

USE mirzakhani_1936;

CREATE TEMPORARY TABLE amounts (amount FLOAT UNSIGNED NOT NULL)
SELECT amount
FROM sakila.payment;

SELECT *
FROM amounts;

UPDATE amounts SET amount = amount * 100

3. Find out how the current average pay in each department compares to the overall current pay 
for everyone at the company. In order to make the comparison easier, you should use the Z-score for salaries. 
In terms of salary, what is the best department right now to work for? The worst?
--CLASSROOM SOLUTION
-- Overall current salary stats
select avg(salary), std(salary) from employees.salaries where to_date > now();

-- 72,012 overall average salary
-- 17,310 overall standard deviation

-- Saving my values for later... that's what variables do (with a name)
-- Think about temp tables like variables
create temporary table overall_aggregates as (
    select avg(salary) as avg_salary, std(salary) as std_salary
    from employees.salaries  where to_date > now()
);

-- double check that the values look good.
select * from overall_aggregates;


-- Let's check out our current average salaries for each department
-- If you see "for each" in the English for a query to build..
-- Then, you're probably going to use a group by..
select dept_name, avg(salary) as department_current_average
from employees.salaries
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no)
where employees.dept_emp.to_date > curdate()
and employees.salaries.to_date > curdate()
group by dept_name;

drop table if exists current_info;

# create the temp table using the query above
create temporary table current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name
);

select * from current_info;

-- add on all the columns we'll end up needing:
alter table current_info add overall_avg float(10,2);
alter table current_info add overall_std float(10,2);
alter table current_info add zscore float(10,2);

# peek at the table again
select * from current_info;

-- set the avg and std
update current_info set overall_avg = (select avg_salary from overall_aggregates);
update current_info set overall_std = (select std_salary from overall_aggregates);



-- update the zscore column to hold the calculated zscores
update current_info 
set zscore = (department_current_average - overall_avg) / overall_std;



select * from andrew_king.current_info
order by zscore desc;


SELECT AVG(salary), STDDEV(salary)
FROM employees.salaries;


