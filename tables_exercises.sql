
#Save your work in a file named tables_exercises.sql
-- 1. Use the employees database. Write the SQL code necessary to do this.
USE employees;

-- 2. List all the tables in the database. Write the SQL code necessary to accomplish this.
SHOW TABLES;

-- 3. Explore the employees table. What different data types are present on this table?
DESCRIBE employees;
	-- 3. integers, date, strings - varchar
    
-- 4. Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
	-- 4. Each table that contains the employee number: dept_emp, dept_manager, employees, salaries,titles
    
-- 5. Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
	-- 5. Titles, employees, dept_emp, dept_manager, departments
    
-- 6. Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
	-- 6. employees, dept_manager, dept_emp, departments
    
-- 7. What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
	-- 7. They are both tables in the employees database
    
-- 8. Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager; 