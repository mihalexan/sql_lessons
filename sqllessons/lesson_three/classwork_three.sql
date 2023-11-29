
-- classwork three

use learn;


drop table if exists students;

CREATE TABLE students(
name varchar(64),
surname varchar(64),
age integer,
rate numeric(8,3)
);

SELECT * FROM students;

INSERT INTO students VALUES('Alex','Alexeev', 35, 20 );
INSERT INTO students VALUES('Alex','Alexeev', 35, 20);

INSERT INTO students (name, surname, age) VALUES('Alex','Alexeev', 35 ),
												('Oleg','Olegov', 20), 
												('Maxim','Maximov', 40) ; 
                                                
use hr;     

CREATE TABLE students(
name varchar(64),
surname varchar(64),
age integer,
rate numeric(8,3)
);                                           

INSERT INTO students (name, surname) (SELECT 
										first_name,
										last_name 
                                        FROM employees);

SELECT * FROM students;

use learn;

INSERT INTO students SET name = 'Elena', age = 25;

set sql_safe_updates=0;

DELETE FROM students
WHERE rate IS NULL;

TRUNCATE TABLE students;

UPDATE students 
SET rate = 0
WHERE rate IS NULL;

UPDATE students
SET rate = rate + 10;

SELECT * FROM students;

UPDATE students
SET rate = 50, age = 25
WHERE name = 'Oleg';

UPDATE students
SET rate =40, age = 20
WHERE name = 'Alex';


SELECT * FROM students;

INSERT INTO students (name, surname, age) VALUES('Alex','Smirnoff', 35 ),
												('Oleg','Alexeev', 20), 
												('Maxim','Olegov', 15) ; 
                                                
CREATE TABLE new_students AS
SELECT * 
FROM students
WHERE age < 25;

SELECT * FROM new_students;

CREATE TABLE new_students_v2 AS
SELECT name, age 
FROM students
WHERE age < 25;

SELECT * FROM new_students_v2;


CREATE VIEW v_new_students_v2 AS
SELECT name, age 
FROM students
WHERE age < 25;

SELECT * FROM v_new_students_v2;

SELECT * FROM products;

/*
create two views - one with products with price less than 20000,other with price more than 20000
*/

CREATE VIEW v_products_more_20000 AS
SELECT *
FROM products
WHERE price > 20000;

SELECT * FROM v_products_more_20000;

CREATE VIEW v_products_less_20000 AS
SELECT *
FROM products
WHERE price < 20000;

SELECT * FROM v_products_less_20000;

-- -------------
SELECT * FROM students;

ALTER TABLE students
ADD middlename VARCHAR(64);  -- добавит новую колонку в таблицу

ALTER TABLE students
ADD COLUMN middlename VARCHAR(64);  -- добавит новую колонку в таблицу

ALTER TABLE students
DROP COLUMN rate;  -- удалит колонку таблицы

ALTER TABLE students
MODIFY middlename VARCHAR(10); -- изменит тип колонки

ALTER TABLE students
MODIFY COLUMN middlename VARCHAR(128); -- изменит тип колонки

ALTER TABLE students
CHANGE middlename middle VARCHAR(128); -- изменит имя колонки

ALTER TABLE students
RENAME COLUMN middle TO middle2 ; -- изменит имя колонки
