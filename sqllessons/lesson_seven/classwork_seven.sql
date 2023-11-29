-- classwork seven

-- Date 20.10.2023
-- Time 19:06
-- Year 2023
-- DateTime date+time
-- Timestamp 

use shop;

SELECT curdate(); -- only date

SELECT now(); -- date + time when run script

SELECT sysdate(); -- date + time function run

-- convert string to date 

SELECT str_to_date("2023-10-20 19:20:55", "%Y-%m-%d %H:%i:%s");

SELECT str_to_date("2023-10-20 19:20:55", "%Y-%m-%d");

SELECT str_to_date("20-10-23 19:20:55", "%d-%m-%Y");

-- extract data from date

SELECT extract(hour from "2023-10-20 19:20:55");
SELECT extract(year from "2023-10-20 19:20:55");
SELECT extract(month from "2023-10-20 19:20:55");

SELECT extract(month from "2023-10-20");

SELECT date_add("2023-10-20 19:20:55", interval 5 day); -- add some interval to date

SELECT date_add("2023-10-20 19:20:55", interval -5 day); -- substract some interval from date

SELECT date_add("2023-10-20 19:20:55", interval -5 month);

SELECT datediff("2023-10-20", "2023-10-05"); -- difference between to dates in days

-- use database shop;
/*
 1. print all orders in march
*/

SELECT * FROM ORDERS;

SELECT * 
FROM ORDERS
WHERE MONTH(ODATE) = 3;

/*
2. print all orders from 10.04.2022 to 10.05.2022
*/

SELECT *
FROM ORDERS 
WHERE ODATE between '2022-04-10' and '2022-05-10';

/*
3. print count of orders in June
*/

-- COUNT(*) - count all lines in result table

SELECT COUNT(*)
FROM ORDERS
WHERE MONTH(ODATE) = 6;     

/*
4. print average amount for orders in march
*/ 

-- AVG - count average for column

SELECT AVG(AMT) 
FROM ORDERS
WHERE MONTH(ODATE) = 3;

-- SELECT AVG(ODATE) 
-- FROM ORDERS;
-- WHERE MONTH(ODATE) = 3;

/*
5. print all orders in tuesday
*/
SELECT *
FROM ORDERS
WHERE WEEKDAY(ODATE) = 1;

/*
6,7 example with group
*/

-- ------------------------------

-- drop database uni;

create database uni;
use uni;

create table Students(
  id integer primary key auto_increment,
    name varchar(128) not null,
    age integer
);

create table Teachers(
  id integer primary key auto_increment,
    name varchar(128) not null,
    age integer
);

create table Competencies(
  id integer primary key auto_increment,
    title varchar(128) not null
);

create table Teachers2Competencies(
  id integer primary key auto_increment,
    teacher_id integer,
    competencies_id integer
);

create table Courses(
  id integer primary key auto_increment,
    teacher_id integer,
    title varchar(128) not null,
    headman_id integer
);

create table Students2Courses(
  id integer primary key auto_increment,
    student_id integer,
    course_id integer
);

insert into students (name, age) values ('Анатолий', 29);
insert into students (name, age) values ('Олег', 25);
insert into students (name, age) values ('Семен', 27);
insert into students (name, age) values ('Олеся', 28);
insert into students (name, age) values ('Ольга', 31);
insert into students (name, age) values ('Иван', 22);

insert into teachers (name, age) values ('Петр', 39);
insert into teachers (name, age) values ('Максим', 35);
insert into teachers (name, age) values ('Антон', 37);
insert into teachers (name, age) values ('Всеволод', 38);
insert into teachers (name, age) values ('Егор', 41);
insert into teachers (name, age) values ('Светлана', 32);

insert into Competencies (title) values ('Математика');
insert into Competencies (title) values ('Информатика');
insert into Competencies (title) values ('Программирование');
insert into Competencies (title) values ('Графика');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title, headman_id) values (1, 'Алгебра логики', 2);
insert into courses (teacher_id, title, headman_id) values (2, 'Математическая статистика', 3);
insert into courses (teacher_id, title, headman_id) values (4, 'Высшая математика', 5);
insert into courses (teacher_id, title, headman_id) values (5, 'Javascript', 1);
insert into courses (teacher_id, title, headman_id) values (5, 'Базовый Python', 1);

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);
                  
                  
SELECT *
FROM Students;

SELECT * 
FROM Teachers;

SELECT *
FROM Courses;              

SELECT *
FROM Competencies;

SELECT *
FROM Students2Courses;    

SELECT *
FROM Teachers2Competencies;

/*
1. print students name and their courses
*/
 SELECT 
 t1.name,
 t3.title
 FROM Students t1
 INNER JOIN Students2Courses t2
 ON t1.id = t2.student_id
 INNER JOIN Courses t3
 ON t3.id = t2.course_id;
 
/*
2. print all teachers name with their competencies
*/ 
SELECT
t1.name,
t3.title
FROM Teachers t1
LEFT JOIN Teachers2Competencies t2
ON t1.id = t2.teacher_id
LEFT JOIN Competencies t3
ON t2.competencies_id = t3.id;

/*
3. print teacher name without any competencies
*/

SELECT 
t1.name
FROM teachers t1
LEFT JOIN Teachers2Competencies t2
ON t1.id = t2.teacher_id
WHERE t2.competencies_id IS NULL;

/*
4. print student name without any courses
*/
SELECT 
-- t1.*,
-- t2.*
t1.name
FROM students t1
LEFT JOIN Students2Courses t2
ON t1.id = t2.student_id
WHERE t2.course_id IS NULL;

/*
5.print courses without any students
*/
SELECT 
t1.title
FROM Courses t1
LEFT JOIN Students2Courses t2
ON t1.id = t2.course_id
WHERE t2.student_id IS NULL;

/*
6.print competencies without any teachers
*/
SELECT
t1.title
FROM Competencies t1
LEFT JOIN Teachers2Competencies t2
ON t1.id = t2.competencies_id
WHERE t2.teacher_id IS NULL;

/*
7.print course name and headman name
*/

SELECT
t1.title,
t2.name
FROM Courses t1
INNER JOIN Students t2
ON t1.headman_id = t2.id;

/*

Make it as part of homework

8.Вывести имя студента и имена  старост, которые есть на курсах, которые он проходит
"Display the name of the student and the names of the headman representatives 
who are present in the courses that he is taking."
*/





