-- classwork nine

use hr;

/*
Task one - print count of employees for each manager
*/
SELECT
manager_id,
COUNT(*) as employees_cnt
FROM employees
GROUP BY manager_id;

/*
Task two - print department name, count of employees for each department
*/
SELECT
t1.department_name,
COUNT(t2.employee_id) as employee_cnt
FROM departments t1
LEFT JOIN employees t2
ON t1.department_id = t2.department_id
GROUP BY t1.department_name;

/*
Task three - print max salary in each department, department_id ,max salary
*/
SELECT
department_id,
MAX(salary) as max_salary
FROM employees
GROUP BY department_id;

/*
Task four - print manager name, surname and count of employees for each manager
*/

SELECT
#t1.employee_id,
#t2.employee_id as manager_id,
t2.first_name,
t2.last_name,
#COUNT(t1.employee_id) as employees_cnt
COUNT(*) as employees_cnt
FROM employees t1
INNER JOIN employees t2
ON t1.manager_id = t2.employee_id
GROUP BY t2.first_name, t2.last_name;

/*
Task five - print name. surname for employees with max salary in their departments
*/

SELECT
department_id,
MAX(salary) as max_salary
FROM employees
GROUP BY department_id;

SELECT 
t1.last_name,
t1.first_name,
t2.department_id,
t2.max_salary
FROM employees t1
INNER JOIN (
	SELECT
	department_id,
	MAX(salary) as max_salary
	FROM employees
	GROUP BY department_id) t2
   ON t1.salary = t2.max_salary AND t1.department_id = t2.department_id;
    
    
-- HAVING 

-- print all department_id and max salary where max_salary > 10000
-- department_id > 50

SELECT
department_id,
MAX(salary) as max_salary
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;


SELECT
department_id,
MAX(salary) as max_salary
FROM employees
WHERE department_id > 50
GROUP BY department_id
HAVING MAX(salary) > 13000
ORDER BY department_id;


SELECT
manager_id,
COUNT(*) as employees_cnt
FROM employees
GROUP BY manager_id
HAVING COUNT(*) > 5;

SELECT
manager_id,
COUNT(*) as employees_cnt
FROM employees
GROUP BY manager_id
HAVING employees_cnt > 5;

/*
Task six - print department name where count of employees > 10
*/

SELECT
department_id,
COUNT(*) as employees_cnt
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10;

SELECT 
t1.department_name,
t1.department_id,
t2.employees_cnt
FROM departments t1
INNER JOIN (
			SELECT
			department_id,
			COUNT(*) as employees_cnt
			FROM employees
			GROUP BY department_id
			HAVING COUNT(*) > 10 ) t2
ON t1.department_id = t2.department_id;

--

SELECT
department_name
FROM departments
WHERE department_id IN (
			SELECT
			department_id
			FROM employees
			GROUP BY department_id
			HAVING COUNT(*) > 10
);

/*
Task seven - print department name where count of employee more than average
*/

SELECT 
department_name 
FROM departments
WHERE
department_id IN (
					SELECT
					department_id
					#COUNT(*) as employee_cnt
					FROM employees
					GROUP BY department_id
					HAVING COUNT(*) > (
										SELECT
										AVG(employees_cnt)
										FROM(
											SELECT
											department_id,
											COUNT(*) as employees_cnt
											FROM employees
											GROUP BY department_id) t1)
											);

