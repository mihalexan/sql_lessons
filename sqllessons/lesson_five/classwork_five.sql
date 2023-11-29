--  classwork 5

-- INNER JOIN

use learn;

CREATE TABLE stud (
id integer primary key auto_increment,
name varchar(128) not null,
surname varchar(128) not null
);

CREATE TABLE ages (
student_id integer unique,
age integer
);

INSERT INTO stud (name, surname) VALUES ('Alex', 'Alexeev'), ('Oleg', 'Olegov'), ('Maxim', 'Maximov');

SELECT * 
FROM stud;

/*
Alex Alexeev 20  id 1
Oleg Olegov 34.   id 2
Maxim Maximov 25.  id 3
*/

INSERT INTO ages (student_id, age) VALUES (1,20), (2,34), (3,25);

INSERT INTO ages (student_id, age) VALUES (5,54);

SELECT * 
FROM ages;

INSERT INTO stud (name, surname) VALUES ('Petr', 'Petrov');

SELECT 
t1.id,
t1.name,
t1.surname,
t2.age
FROM stud t1
INNER JOIN ages t2
ON t1.id = t2.student_id;


/*
Alex Alexeev 20  id 1  Algo
Oleg Olegov 34.   id 2. Java
Maxim Maximov 25.  id 3. SQL
*/ 

CREATE TABLE courses (
id integer primary key auto_increment,
name varchar(128)
);

INSERT INTO courses (name) VALUES ('Java'), ('Algo'),('SQL');

INSERT INTO courses (name) VALUES ('JS');

SELECT * FROM courses;

CREATE TABLE course2student (
student_id integer,
course_id integer
);

/*
id 1 - Java, Algo
id 2 - Algo
id 3 - SQL, Algo
*/

INSERT INTO course2student (student_id,course_id) VALUES (1,1),(1,2),(2,2),(3,3),(3,2);

INSERT INTO course2student (student_id,course_id) VALUES (6,4);

SELECT
t1.id,
t1.name,
t1.surname,
t3.name course_name
FROM stud t1
INNER JOIN course2student t2
ON t1.id = t2.student_id
INNER JOIN courses t3
ON t3.id = t2.course_id;

/*
add table contats with phone number for student(one student can has one + phone number)
add 2 numbers for one, and one number for other

print result name, surname, phone

*/

CREATE TABLE contacts (
student_id integer,
phone varchar(128)
);

INSERT INTO contacts (student_id, phone) VALUES (1, '123456-789'),(1, '23456-986'), (3, '4567-346');

SELECT 
t1.name,
t1.surname,
t2.phone
FROM stud t1
INNER JOIN contacts t2
ON t1.id = t2.student_id;

-- LEFT JOIN

SELECT 
t1.name,
t1.surname,
t2.phone
FROM stud t1
LEFT JOIN contacts t2
ON t1.id = t2.student_id;

-- RIGHT JOIN

SELECT 
t1.name,
t1.surname,
t2.phone
FROM stud t1
RIGHT JOIN contacts t2
ON t1.id = t2.student_id;

SELECT 
t1.name,
t1.surname,
t2.age
FROM stud t1
RIGHT JOIN ages t2
ON t1.id = t2.student_id;

--   

use hr;

/*
Task  1 . print name, surname employees and department name where he works
*/

SELECT * FROM employees;

SELECT * 
FROM departments
LIMIT 3;

SELECT 
t1.first_name,
t1.last_name,
t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id;

/*
Task  2 . print name, surname employees and department name where he works,
but deparment must be IT, Treasury, IT Support
*/

SELECT 
t1.first_name,
t1.last_name,
t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id
WHERE t2.department_name IN ('IT', 'Treasury', 'IT Support');


SELECT 
t1.first_name,
t1.last_name,
t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id AND t2.department_name IN ('IT', 'Treasury', 'IT Support');

/*
Task  3 . print name, surname employees and name and surname his manager
*/

SELECT * FROM employees;

-- SELF JOIN
SELECT
t1.first_name,
t1.last_name,
t2.first_name manager_name,
t2.last_name manager_last_name
FROM employees t1
INNER JOIN employees t2
ON t1.manager_id = t2.employee_id;