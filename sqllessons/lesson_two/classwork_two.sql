
-- classwork two---

 use hr;
 
 select * from locations;
 
 use learn;
 
 
select 
title 
, price
-- , discount 
from products 
where title is not null;

SELECT 
title, 
price,
discount 
FROM products 
WHERE title IS NOT NULL
AND price > 20000;

-- =====================

SELECT * FROM products;

SELECT 
title,
price,
CASE
	WHEN price <= 10000
    THEN 1
	WHEN price <= 20000
    THEN 2
	WHEN price <= 30000
    THEN 3
    ELSE 4
END AS price_group,
discount
FROM products;


use hr;

SELECT 
first_name,
last_name,
salary,
CASE
	WHEN salary <= 10000
    THEN 0
    ELSE 1
END AS salary_group
FROM employees;

-- 

use learn;

SELECT 
title,
price,
price * (CASE 
			WHEN discount IS NULL
            THEN 1
            ELSE discount
            END) as price_with_discount
FROM products;


SELECT 
title,
price,
price * COALESCE(discount, 1)  as price_with_discount
FROM products;

-- ORDER BY 
SELECT 
title,
price,
price * COALESCE(discount, 1)  as price_with_discount
FROM products
ORDER BY price DESC, title;

use hr;

SELECT * 
FROM employees;

SELECT DISTINCT
job_id
FROM employees;

SELECT 
first_name,
last_name
FROM employees
ORDER BY first_name DESC, last_name DESC;

/*
print all employees in deparments 60,90,110 and sort by last_name
*/
SELECT 
*
FROM employees
WHERE department_id IN (60,90, 110)
ORDER BY last_name;

--
use learn;

-- math

SELECT 
SQRT(price),
price * 2 as double_price,
price - 5000 as price_one,
price + 5000 as price_two,
price / 5000 as price_three,
price % 2 as price_four,
price * discount as new_price
FROM 
products;

-- base function

SELECT -1 as value;  -- вывод константы
SELECT ABS(-2) as value; -- выводит абсолютное значение числа(по модулю)
SELECT POW(3,2) as value; -- возведение в степень
SELECT SQRT(144) as value; -- квадрат числа
SELECT ROUND(3.2) as value; -- округление

-- string function

SELECT CONCAT('Hello', ' ', 'World'); --  соединение слов

SELECT CONCAT_WS('-', 'hello', 'world', 2023); --  соединение множества слов с использованием разделителя

SELECT LENGTH('Hello'); -- длина строки
SELECT LENGTH('Привет'); -- длина строки, для кириллицы * на 2

SELECT TRIM('    hello world     '); -- обрезка пробелов слева и справа

SELECT LTRIM('    hello world     '); -- обрезка пробелов слева
SELECT RTRIM('    hello world     '); -- обрезка пробелов справа

SELECT LOWER('HeLLoe'); -- перевод в нижний регистр
SELECT UPPER('HeLLoe'); -- перевод в верхний регистр

SELECT SUBSTRING('hello world',7,3);  -- взятие подстроки из строки - первый параметр, второй-начало, третий количество

SELECT REPLACE('49-555-666-777','-',''); -- замена значений в строке

SELECT INSERT('hello world',7,5,'class'); -- вставка значений в строку

-- airport database 

use airport;

SELECT * 
FROM airliners;

/*
add new column category , 
where liners with distance from 1000 to 2500 - short 
where liners with distance from 2500 to 6000 - medium 
where liners with distance from 6000 to -- - long 
*/


SELECT 
model_name,
production_year,
distance,

CASE

	WHEN distance < 1000
    THEN 'walk'  

	WHEN distance > 1000 
		 AND distance <= 2500
    THEN 'short'     

	WHEN distance > 2500 
		 AND distance <= 6000
    THEN 'medium' 
	ELSE 'long'
-- 	WHEN distance > 6000
--     THEN 'long' 

END as category
FROM airliners;


