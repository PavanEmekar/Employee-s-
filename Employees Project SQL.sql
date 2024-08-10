#Q 1. Create the “Sales” database. To do this, you’ll have to use one of the two possibilities shown in the lecture, and then execute the code!

CREATE DATABASE IF NOT EXISTS Sales;

# Q 2. select database sales 
use sales;

#Q 3.  Create the “customers” table in the “sales” database. Let it contain the following 5 columns: customer_id, first_name, last_name, email_address, and number_of_complaints. Let the data types of customer_id and number_of_complaints be integer, while the data types of all other columns be VARCHAR of 255
Create table coustomers
(
    customer_id INT,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int
);

# Q 3. Use SELECT statement select all records from the “sales” table. Do it twice – once specifying the name of the database explicitly in the SELECT statement, and once, without that specification.
Select * from sales;
Select * from sales.sales;

# Q 3. drop the ‘sales’ table from the ‘sales’ database. 
DROP TABLE sales;

/* At this stape laoded a Data base from an online resourece:
The dara base is called employees, It has 7 tables 
Depaetments, Dept_emp, Dept_manager, emp_manager, employees, salaries and titles*
the employee table has more than 300,000 rows */

use employees; 

 # Q 1. Select the information from the “dept_no” column of the “departments” table. Select all data from the “departments” table. 
Select dept_no from  departments; 

# Q 2. Select all people from the “employees” table whose first name is “Elvis”.
select * from employees 
where first_name = "Elvis";

# Q 3. Retrieve a list with all employees whose first name is either Kellie or Aruna.
select * from employees 
where first_name = "Kellie" or first_name = "Aruna"; 

# Q 4. Retrieve a list with all female employees whose first name is either Kellie or Aruna.
select * from employees 
where gender = "F" and (First_name = "Kellie" or First_name = "Aruna"); 

# Q 5. Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”
select * from employees 
where first_name in ('elvise', 'Denis');

# Q 6. Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob. 
select * from employees 
where first_name in ('john', 'Mark', 'Jacob'); 

# Q 7. Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters. 
select * from employees
where First_name like ('Mark%'); 

# Q 8. Retrieve a list with all employees who have been hired in the year 2000.
select * from employees
where hire_date like ("20__-__-__"); 

# Q 9. Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
select * from employees 
where emo_no like('1000_'); 

# Q 10.  Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
select * from employees
where first_name like ('%Jack%') ; 

# Q 11. Extract another list containing the names of employees that do not contain “Jack”.
select * from employees
where first_name not like ('%Jack%') ; 

# Q 12. Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
Select * from salaries 
where salary between "66,000" and "70,000"; 

# Q 13. Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
select * from employees 
where emp_no not between '10004' and '10012'; 

# Q 14. Select the names of all departments with numbers between ‘d003’ and ‘d006’.
select dept_name FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

#Q 15. Select the names of all departments whose department number value is not null.
SELECT dept_name FROM departments 
WHERE dept_no IS NOT NULL;

# Q 16. Retrieve a list with data about all female employees who were hired in the year 2000 or after.
select * from employees
where gender = 'F' and hire_date like ("%2000%"); 

# Q 17. Extract a list with all employees’ salaries higher than $150,000 per annum.
select * from salaries 
where  salary > "150,000"; 

# Q 18. Obtain a list with all different “hire dates” from the “employees” table.
select distinct hire_date from employees; 

# Q 19. Expand this list and click on “Limit to 1000 rows”. 
 select distinct hire_date from employees limit 1000; 

# Q 20.  How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
select count(*) from salaries 
where  salary >= "100,000"; 

# Q 21. How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
SELECT COUNT(*) FROM dept_manager;

# Q 22. Select all data from the “employees” table, ordering it by “hire date” in descending order.
 select * from employees 
 order by hire_date desc; 

#Q 23 Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. Lastly, sort the output by the first column.
select salary, count(emp_no)  emps_with_same_salary from salaries 
where  salary > 8000 
group by salary
order by salary;

#Q 24. Select all employees whose average salary is higher than $120,000 per annum.
select  emp_no, avg(salary) avg_sal from salaries
group by emp_no
having avg_sal > 12000;

#Q 25.  Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
select emp_no from dept_emp
where from_date  > '2000-01-01'
group by emp_no
having count(from_date) > 1 
order by emp_no; 

#Q 26. Select the first 100 rows from the ‘dept_emp’ table. 
select * from dept_emp
limit 100;


-- SQL INSERT STATEMENT-- 


#Q 27. Select titles in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
insert into employees values (999903, '1977-09-14', 'Johnathan', 'Creek', 'M', '1999-01-01' );

#Q 28. Insert information about the individual with employee number 999903 into the “dept_emp” table. He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.

select * From dept_em 
order by emp_no desc limit 10; 
insert into dept_emp (emp_no, dept_no, from_date, to_date ) 
values ( 999903, 'd005','1997-10-01', '9999-01-01' );

#Q 29.  Create a new department called “Business Analysis”. Register it under number ‘d010’.
insert into  departments values ('d010', 'Business Analysis');


-- UPDATE STATEMENT--


#Q 30.  Change the “Business Analysis” department name to “Data Analysis”.
UPDATE departments SET dept_name = 'Data Analysis' WHERE dept_no = 'd010';


-- DELETE STATEMENT--


#Q 31. Remove the department number 10 record from the “departments” table.
delete FROM departments 
where dept_no = 'd010';


-- AGGREGATE FUNCTION-- 


#Q 32.  How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
select count(distinct dept_no) from dept_emp;

#Q 33 What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
select sum(salary) from salaries 
where from_date > '1997-01-01'; 

#Q 34. Which is the lowest employee number in the database?
select min(emp_no) from employess; 

#Q 35.  Which is the highest employee number in the database? 
 select max(emp_no) from employess; 

#Q 36. What is the average annual salary paid to employees who started after the 1st of January 1997?
select Avg(salary) from employees 
where from_date  > '1997-01-01';

#Q 38. Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
select round(avg(salary)) from salaries 
where from_date  > '1997-01-01'; 

#Q 39. Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.
select dept_no, dept_name, coalesce(dept_no, dept_name) DeptInfo from departments_dup
order by dept_no asc ; 

#Q 40.  Modify the code obtained from the previous qustion in the following way. Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
select  IFNULL(dept_no, 'N/A') as dept_no, 
IFNULL(dept_name, 'Department name not provided') AS dept_name, 
coalesce(dept_no, dept_name) AS dept_info FROM departments_dup
order by dept_no ASC;


-- SQL JOINS --  


#Q 41. Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
select  e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date from employees e
join dept_manager dm ON e.emp_no = dm.emp_no;

#Q 42. Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  
select e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date  from employees e
left join  dept_manager DM on e.emp_no = dm.emp_no
where e.last_name = 'Markovitch'; 

#Q 43 Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.
 select  e.first_name, e.last_name, e.hire_date, t.title from employees e
 join titles t on t.emp_no = e.emp_no
 where e.first_name = 'Margareta' and e.last_name = 'Markovitch'; 
 
#Q 44 Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
SELECT dm.*, d.*   FROM   departments d   CROSS JOIN  dept_manager dm   
WHERE   d.dept_no = 'd009' ORDER BY d.dept_no;

#Q 45. Return a list with the first 10 employees with all the departments they can be assigned to.
SELECT e.*, d.* FROM employees e CROSS JOIN departments d 
WHERE e.emp_no < 10011 ORDER BY e.emp_no, d.dept_name;

#Q 46. Select all managers’ first and last name, hire date, job title, start date, and department name.

 SELECT e.first_name, e.last_name, e.hire_date, t.title, m.from_date, d.dept_name FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no
JOIN titles t ON e.emp_no = t.emp_no 
AND m.from_date = t.from_date ORDER BY e.emp_no;

#Q 47 How many male and how many female managers do we have in the ‘employees’ database?
SELECT e.gender, COUNT(dm.emp_no) FROM  employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

#Q 48 What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)? 
SELECT * FROM
(SELECT e.emp_no, e.first_name, e.last_name,
NULL AS dept_no,
NULL AS from_date FROM employees e
WHERE last_name = 'Denis' UNION SELECT
NULL AS emp_no,
NULL AS first_name,
NULL AS last_name, dm.dept_no, dm.from_date FROM dept_manager dm) as a
ORDER BY -a.emp_no DESC;


-- SQL SUBQUERIS --


#Q 49. Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

select * from dept_manager 
where emp_no in (
select emp_no from employees 
where hire_date between '1990-01-01' and '1995-01-01'
) ;

#Q 50 Select the entire information for all employees whose job title is “Assistant Engineer”. 
SELECT * FROM employees e 
WHERE EXISTS( SELECT * FROM titles t 
WHERE t.emp_no = e.emp_no AND title = 'Assistant Engineer'); 
 #solution 2 
select e.* from employees e 
join   titles t  on t.emp_no = E.emp_no 
where title = 'Assistant Engineer' ;


-- SQL Viwes--

#Q 51. Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.
CREATE OR REPLACE VIEW 
v_manager_avg_salary AS 
SELECT ROUND(AVG(salary), 2) FROM salaries s 
JOIN dept_manager m ON s.emp_no = m.emp_no;


-- Stored Routines-- 


#Q 52. Create a procedure that will provide the average salary of all employees.
DELIMITER $$

CREATE PROCEDURE avg_salary()
BEGIN
SELECT AVG(salary) FROM salaries; 
END
$$ DELIMITER ; 
CALL avg_salary;
CALL avg_salary();
CALL employees.avg_salary;
CALL employees.avg_salary();

#Q 53 Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

DELIMITER $$
CREATE PROCEDURE 
emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN 
SELECT
e.emp_no
INTO p_emp_no FROM 
employees e 
WHERE e.first_name = p_first_name
AND e.last_name = p_last_name;
END$$

DELIMITER ;

#Q 54 Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.
# Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
# Finally, select the obtained output.
SET @v_emp_no = 0;
CALL emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

#Q55  Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.

DELIMITER $$
CREATE FUNCTION emp_info
(p_first_name varchar(255), 
p_last_name varchar(255)) 
RETURNS decimal(10,2)

DETERMINISTIC NO SQL READS SQL DATA

BEGIN
DECLARE v_max_from_date date; 
DECLARE v_salary decimal(10,2); SELECT MAX(from_date) INTO v_max_from_date FROM employees e 
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name; 
SELECT s.salary INTO v_salary FROM employees e  
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name
AND e.last_name = p_last_name 
AND s.from_date = v_max_from_date;
RETURN v_salary;
END$$
DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');


#Q 57 Create a procedure that will provide the average salary of all employees. Then, call the procedure.

DELIMITER $$

CREATE PROCEDURE avg_salary()
BEGIN 
SELECT AVG(salary) FROM salaries;
END$$
DELIMITER ;
CALL avg_salary;
CALL avg_salary();
CALL employees.avg_salary; 
CALL employees.avg_salary();

# Q58. Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN
SELECT e.emp_no INTO p_emp_no FROM employees e
WHERE
e.first_name = p_first_name
AND e.last_name = p_last_name;
END$$

DELIMITER ;

# Q59. Write a query containing a window function to obtain all salary values that employee number 10560 has ever signed a contract for. Order and display the obtained salary values from highest to lowest.
SELECT  emp_no, salary,  ROW_NUMBER() OVER w AS row_num 
FROM  salaries 
WHERE emp_no = 10560 
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Q60 Write a query that upon execution, displays the number of salary contracts that each manager has ever signed while working in the company.
SELECT dm.emp_no, (COUNT(salary)) AS no_of_salary_contracts FROM
dept_manager dm
JOIN
salaries s ON dm.emp_no = s.emp_no 
GROUP BY emp_no 
ORDER BY emp_no;

# 61 Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are allowed.
SELECT emp_no, salary, RANK() OVER w AS rank_num FROM
salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# 62 Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.
SELECT emp_no, salary, 
DENSE_RANK() OVER w AS rank_num FROM salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# 63 Write a query that ranks the salary values in descending order of all contracts signed by employees numbered between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank. Also, allow gaps in the ranks obtained for their subsequent rows.
# Use a join on the “employees” and “salaries” tables to obtain the desired result.
SELECT e.emp_no, RANK() OVER w as employee_salary_ranking, s.salary FROM employees e
JOIN
salaries s ON s.emp_no = e.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);

# Q64 Write a query that ranks the salary values in descending order of the following contracts from the "employees" database: 
/* contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
 contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.
In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks obtained for their subsequent rows.
Use a join on the “employees” and “salaries” tables to obtain the desired result. */ 

SELECT  e.emp_no, DENSE_RANK() OVER w as employee_salary_ranking, s.salary, e.hire_date, s.from_date, 
(YEAR(s.from_date) - YEAR(e.hire_date)) AS years_from_start FROM employees e
JOIN
salaries s ON s.emp_no = e.emp_no 
AND YEAR(s.from_date) - YEAR(e.hire_date) >= 5
WHERE e.emp_no BETWEEN 10500 AND 10600 
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);

# Q65 Create a query that upon execution returns a result set containing the employee numbers, contract salary values, start, and end dates of the first ever contracts that each employee signed for the company.
# To obtain the desired output, refer to the data stored in the "salaries" table.
SELECT s1.emp_no, s.salary, s.from_date, s.to_date FROM salaries s 
JOIN (SELECT emp_no, MIN(from_date) AS from_date FROM salaries
GROUP BY emp_no)  
s1 ON s.emp_no = s1.emp_no
WHERE
s.from_date = s1.from_date;
 # Q 66 Consider the employees' contracts that have been signed after the 1st of January 2000 and terminated before the 1st of January 2002 (as registered in the "dept_emp" table).

/* Create a MySQL query that will extract the following information about these employees:

- Their employee number

- The salary values of the latest contracts they have signed during the suggested time period

- The department they have been working in (as specified in the latest contract they've signed during the suggested time period)

- Use a window function to create a fourth field containing the average salary paid in the department the employee was last working in during the suggested time period. Name that field "average_salary_per_department".
*/
SELECT de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department
FROM (SELECT de.emp_no, de.dept_no, de.from_date, de.to_date FROM dept_emp de
JOIN (SELECT emp_no, MAX(from_date) AS from_date FROM dept_emp
GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
WHERE de.to_date < '2002-01-01'
AND de.from_date > '2000-01-01' 
AND de.from_date = de1.from_date) de2 
JOIN 
(SELECT s1.emp_no, s.salary, s.from_date, s.to_date FROM salaries s 
JOIN
(SELECT emp_no, MAX(from_date) AS from_dat FROM salaries
GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE 
s.to_date < '2002-01-01'
AND s.from_date > '2000-01-01'
AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
JOIN
departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no, salary;

# Q67. Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in a query to find out how many male employees have never signed a contract with a salary value higher than or equal to the all-time company salary average.
 
 WITH cte AS 
(  SELECT AVG(salary) AS avg_salary FROM salaries ) 
SELECT
SUM(CASE WHEN s.salary < c.avg_salary THEN 1 ELSE 0 END) AS no_salaries_below_avg,
COUNT(s.salary) AS no_of_salary_contracts
FROM salaries s JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M' JOIN cte c;

# Q68 Use a CTE (a Common Table Expression) and (at least one) COUNT() function in the SELECT statement of a query to find out how many male employees have never signed a contract with a salary value higher than or equal to the all-time company salary average.
WITH cte AS 
( SELECT AVG(salary) AS avg_salary FROM salaries )
SELECT
COUNT(CASE WHEN s.salary < c.avg_salary THEN s.salary ELSE NULL END) AS no_salaries_below_avg_w_count,
COUNT(s.salary) AS no_of_salary_contracts
FROM salaries s JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M' JOIN cte c;

# Q69 Use MySQL joins (and don’t use a Common Table Expression) in a query to find out how many male employees have never signed a contract with a salary value higher than or equal to the all-time company salary average (i.e. to obtain the same result as in the previous exercise).
SELECT SUM(CASE
 WHEN s.salary < a.avg_salary THEN 1 ELSE 0 END) AS no_salaries_below_avg, 
COUNT(s.salary) AS no_of_salary_contracts
FROM (SELECT
AVG(salary) AS avg_salary
 FROM salaries s) a JOIN salaries s
JOIN
employees e ON e.emp_no = s.emp_no AND e.gender = 'M';

# Q70 Use a cross join in a query to find out how many male employees have never signed a contract with a salary value higher than or equal to the all-time company salary average (i.e. to obtain the same result as in the previous exercise).
WITH cte AS 
( SELECT AVG(salary) AS avg_salary FROM salaries )
SELECT
SUM(CASE WHEN s.salary < c.avg_salary THEN 1 ELSE 0 END) AS no_salaries_below_avg_w_sum,
# COUNT(CASE WHEN s.salary < c.avg_salary THEN s.salary ELSE NULL END) AS no_salaries_below_avg_w_count,
COUNT(s.salary) AS no_of_salary_contracts
FROM salaries s JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M' CROSS JOIN cte c;

# Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain the number of male employees whose highest salaries have been below the all-time average.
WITH cte1 AS ( SELECT AVG(salary) AS avg_salary FROM salaries ),
cte2 AS ( SELECT s.emp_no, MAX(s.salary) AS max_salary
FROM salaries s
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no )
SELECT
SUM(CASE WHEN c2.max_salary < c1.avg_salary THEN 1 ELSE 0 END) AS highest_salaries_below_avg
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
JOIN cte1 c1;

# Q71 Use two common table expressions and a COUNT() function in the SELECT statement of a query to obtain the number of male employees whose highest salaries have been below the all-time average.
WITH cte_avg_salary AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte_m_highest_salary AS  
(SELECT s.emp_no, MAX(s.salary) AS max_salary
FROM salaries s JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no)
SELECT
COUNT(CASE WHEN c2.max_salary < c1.avg_salary THEN c2.max_salary ELSE NULL END) AS max_salary
FROM employees e
JOIN cte_m_highest_salary c2 ON c2.emp_no = e.emp_no
JOIN cte_avg_salary c1;

# Q72 Does the result from the previous exercise change if you used the Common Table Expression (CTE) for the male employees' highest salaries in a FROM clause, as opposed to in a join?
WITH cte_avg_salary AS ( SELECT AVG(salary) AS avg_salary FROM salaries ),
cte_m_highest_salary AS 
(SELECT s.emp_no, MAX(s.salary) AS max_salary
FROM salaries s JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no)
SELECT
COUNT(CASE WHEN c2.max_salary < c1.avg_salary THEN c2.max_salary ELSE NULL END) AS max_salary
FROM cte_m_highest_salary c2
JOIN cte_avg_salary c1;


# Q73  Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.
CREATE TEMPORARY TABLE male_max_salaries
SELECT s.emp_no, MAX(s.salary) FROM salaries s
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no;

# Q74 Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries temporary table you created in the previous exercise.
SELECT * FROM male_max_salaries;

# Q75 Create a temporary table called dates containing the following three columns:
/* one displaying the current date and time,
- another one displaying two months earlier than the current date and time, and a
- third column displaying two years later than the current date and time. */ 
CREATE TEMPORARY TABLE dates
SELECT
NOW(), 
DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_months_earlier,
DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_years_later;

# Q76 Write a query that, upon execution, allows you to check the result set contained in the dates temporary table you created in the previous exercise.
SELECT * FROM dates dates;
WITH cte AS (SELECT NOW(), 
DATE_SUB(NOW(), INTERVAL 2 MONTH) AS cte_a_month_earlier, 
DATE_SUB(NOW(), INTERVAL -2 YEAR) AS cte_a_year_later) SELECT * FROM dates d1 JOIN cte c;

# Q77 Again, create a query joining the result sets from the dates temporary table you created during the previous lecture with a new Common Table Expression (CTE) containing the same columns. This time, combine the two sets vertically.
WITH cte AS (SELECT NOW(), DATE_SUB(NOW(), INTERVAL 1 MONTH) AS cte_a_month_earlier, DATE_SUB(NOW(), INTERVAL -1 YEAR) AS cte_a_year_later)
SELECT * FROM dates UNION SELECT * FROM cte;
 
# Q 78 Drop the male_max_salaries and dates temporary tables you recently created.
DROP TABLE IF EXISTS male_max_salaries;
DROP TABLE IF EXISTS dates;




















