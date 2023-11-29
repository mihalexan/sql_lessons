-- classwork six

/*
Task  2(subselect) . print name, surname employees and department name where he works,
but deparment must be IT, Treasury, IT Support
*/

SELECT 
t1.first_name,
t1.last_name,
t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id 
AND t2.department_name 
IN ('IT', 'Treasury', 'IT Support');

use hr;

SELECT * FROM employees;

SELECT * FROM departments;

SELECT 
t1.first_name,
t1.last_name,
t1.department_id
FROM employees t1
WHERE t1.department_id in (

	SELECT
	department_id
	FROM departments
	WHERE department_name IN ('IT', 'Finance', 'IT Support')
    
    );

   SELECT
   t1.id,
   t1.name
   FROM 
   ( 
		SELECT
		department_id id,
		department_name name
		FROM departments
		WHERE department_name IN ('IT', 'Finance', 'IT Support')
    ) t1 ;
    
-- (60,120, 210)

/*
Task 1. Print departments name without any workers
*/

SELECT 
t1.department_name,
t1.department_id,
t2.employee_id
FROM departments t1
LEFT JOIN employees t2
ON t1.department_id = t2.department_id
WHERE t2.employee_id IS NULL;


SELECT department_name FROM departments
WHERE department_id NOT IN (
	SELECT DISTINCT department_id FROM employees WHERE department_id IS NOT NULL);
    
/*
Task 2. Print name, surname, salary for employees who works in cities 'Oxford', 'San Francisco'
*/    
SELECT 
t1.first_name,
t1.last_name,
t1.salary,
t3.city
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id
INNER JOIN locations t3
ON t3.location_id = t2.location_id
WHERE t3.city IN ('Oxford','South San Francisco');

SELECT 
t1.first_name, t1.last_name, t1.salary
FROM employees t1
WHERE t1.department_id IN (
				SELECT department_id FROM departments 
                WHERE location_id IN (
						SELECT location_id FROM locations 
						WHERE city IN ('Oxford','South San Francisco')));
                        
					
use shop;

select * from customers;

/*
Task 3. Print name all sellers and their boss
*/
SELECT * FROM SELLERS;

SELECT 
t1.SNAME,
t2.SNAME AS BOSS_NAME
FROM SELLERS t1
LEFT JOIN SELLERS t2
ON t1.BOSS_ID = t2.SELL_ID;