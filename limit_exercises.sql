--2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. 
--For example, to find all the unique titles within the company, we could run the following query:
--List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT title 
FROM titles
LIMIT 10 

# Senior Engineer'
'Staff'
'Engineer'
'Senior Staff'
'Assistant Engineer'
'Technique Leader'
'Manager'

--3. Find all previous or current employees hired in the 90s and born on Christmas. 
--Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results 
--to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
