-- classwork eight

-- count(column_name) - count not null values
-- count(*) - all lines in result table 

-- max(column_name) - max value in this column
-- min(column_name) - min value in this column
-- avg(column_name) - average value in this column
-- sum(column_name) - sum values in this column

use hr;

SELECT * 
FROM employees;

SELECT 
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary,
sum(salary) as sum_salary,
count(salary) as count_employees
FROM employees;

SELECT 
count(commission_pct) as count_commission,
count(*) as count_employees
FROM employees;

-- print count employees without manager

SELECT 
COUNT(*) as count_employees_without_manager
FROM employees
WHERE manager_id IS NULL;

SELECT 
COUNT(manager_id) as count_employees_with,
COUNT(*) as count_employees_without
FROM employees;


/*
Task one -  print max salary
*/

SELECT
	MAX(salary) as max_salary
	FROM employees;    
    
/*
Tast two - print count of employees
*/    
SELECT 
COUNT(*) as count_employees_without
FROM employees;

/*
Task three print name , surname employee(s) with max salary
*/
SELECT
first_name as name,
last_name as surname,
salary as salary
FROM employees
WHERE salary = (
	SELECT
	MAX(salary) as max_salary
	FROM employees );

/*
Task four - print average salary by company
*/
SELECT
AVG(salary) average_salary
FROM employees;

/*
Task five - print name, surname , salary from employees who get salary less than average by comp
*/

SELECT
first_name as name,
last_name as surname,
salary 
FROM employees
WHERE salary < (
	SELECT
	AVG(salary) average_salary
	FROM employees );
    
/*
Task six - print count of departments
*/
SELECT 
COUNT(*) as departments_count
FROM departments;

/*
Task seven - print count of departments without any workers
*/
SELECT
-- t1.department_name,
-- t1.department_id,
-- t2.first_name,
-- t2.department_id
COUNT(*) as department_cnt_without_workers
FROM departments t1
LEFT JOIN employees t2
ON t1.department_id = t2.department_id
WHERE t2.department_id IS NULL;


SELECT
COUNT(*) as department_cnt_without_workers
FROM departments
WHERE department_id NOT IN ( SELECT department_id FROM employees WHERE department_id IS NOT NULL );


SELECT department_id FROM employees;
    
SELECT 
COUNT(DISTINCT department_id)
FROM employees; 

/*
Task eight - print average salary in department with id = 90
*/
SELECT
AVG(salary) as average_salary
FROM employees
WHERE department_id = 90;

/*
Task nine - print max salary in departments with id 70,80
*/

SELECT
MAX(salary) as max_salary
FROM employees
WHERE department_id IN (70,80);

/*
Task ten - print count employees from departments with id 100 who earn more than 5000
*/
SELECT
-- first_name,
-- salary
-- COUNT(*) as count_employees
COUNT(salary) as count_employees
FROM employees
WHERE department_id = 100 and salary > 5000;

/*
Task eleven - print count of employees from department with id 60 who earn more than average salary by company
*/

SELECT
 -- COUNT(employee_id) as employees_cnt
 COUNT(*) as employees_cnt
FROM employees
WHERE department_id = 60 AND salary > (
	SELECT 
	AVG(salary) as avg_salary
	FROM employees);
    
  --   GROUP BY  
    
/*
s   d_id
100 (90)
200 (70)
300 (100)
100 (90)
50  (70)
10  (100)

SELECT sum(s) from table

sum(s) -> 760

-------------------------

SELECT d_id, sum(s) from table group by d_id

100 (90)  sum -> 200
100 (90)

200(70)  sum -> 250
50 (70)

300(100) sum ->310
10 (100)

d_id  | sum(s) 
90.     200
70.     250
100.  |310

*/    

/*
Task one - print count of employees for each department
*/

SELECT
department_id,
COUNT(*) employees_cnt
FROM employees
GROUP BY department_id;

use shop;
SELECT * FROM ORDERS;

/*
Task two - print count of orders for each customer (use db shop)
*/

SELECT 
CUST_ID,
COUNT(*) orders_cnt
FROM ORDERS
GROUP BY CUST_ID;

/*
Task three - print name, id and count of orders for each customer
*/    

SELECT
t1.CNAME,
t1.CUST_ID,
t2.orders_cnt
FROM CUSTOMERS t1
INNER JOIN (
	SELECT 
	CUST_ID as cid,
	COUNT(*) orders_cnt
	FROM ORDERS
	GROUP BY CUST_ID
	) t2
ON t1.CUST_ID = t2.cid;