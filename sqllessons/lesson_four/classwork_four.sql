-- classwork four

use learn;

drop table if exists students;

-- not null
-- check
-- unique
-- primary key (not null + unique)

CREATE TABLE students(
id integer primary key auto_increment, 
name varchar(64) not null,
surname varchar(64) not null default '',
age integer check (age between 18 and 120),
phone varchar(32) unique
);  

INSERT INTO students (name, surname, age,phone) VALUES('Alex','Alexeev', 35, '777-888-999' ) ; 

SELECT *
FROM students;

INSERT INTO students ( name, surname, age,phone) VALUES('Alex','Alexeev', 35, '777-888-000' ) ; 

INSERT INTO students ( name, surname, age,phone) VALUES('Alex', 'Alexeev', 40, '777-888-001' ) ; 

set sql_safe_updates=0;

DELETE FROM students
WHERE age = 40;

DELETE FROM students;

TRUNCATE TABLE students;

INSERT INTO students ( name, age,phone) VALUES('Alex', 40, '777-888-002' ) ; 

INSERT INTO students ( name, surname, age,phone) VALUES('Alex', 'Olegov',40, '777-888-002' ) ; 

/* Task 1
students :
name, lastname - ne null
avg_mark - from 0 to 5.   numeric(2,1)
gender varchar 128 "M" "F" 
*/

CREATE TABLE students(
name varchar(128) not null,
lastname varchar(128) not null,
avg_mark numeric(2,1) check (avg_mark between 0 and 5),
gender varchar(128) check(gender in ('M','F'))
);  

/* Task2 
add data : 
Олег Петров 4.3 M

Семен Степанов 3.1 M 

Ольга Семенова 4.7 F 

Игорь Романов 3.1 M 

Ирина Иванова 2.2 F
*/

INSERT INTO students (name, lastname, avg_mark, gender) VALUES('Oleg','Petrov',4.3,'M'),
                                                              ('Semen','Stepanov',3.1,'M'),
                                                              ('Olga','Semenova',4.7,'F'),
                                                              ('Igor','Romanov',3.1,'M'),
                                                              ('Irina','Ivanova', 2.2 ,'F');
                                                              
SELECT *
FROM students;	

													
/*
Task3 
id integer primary key , auto increment
*/

ALTER TABLE students
ADD COLUMN id integer primary key auto_increment;

-- next 9 task move to homework

-- UNION , UNION ALL (add new strings to end of the table)

CREATE TABLE goods(
id integer primary key auto_increment,
title varchar(32),
quantity integer check (quantity > 0),
in_stock char(1) check (in_stock in ('Y','N'))
);

CREATE TABLE goods_two(
id integer primary key auto_increment,
title varchar(32),
quantity integer check (quantity > 0),
price integer,
in_stock char(1) check (in_stock in ('Y','N'))
);

insert into goods (title,quantity,in_stock) 
		values ('bike',2,'Y'),
				('skates',4,'Y'),
				('skis',2,'Y'),
				('board',7,'N'),
				('scooter',1,'N'),
                ('bicycle',5,'Y');


insert into goods_two (title,quantity,price,in_stock) 
		values ('bike',2,500,'Y'),
			('skis',2,100,'Y'),
				('board',7,300,'N'),
				('scooter',1,200,'N'),
                ('form',10,35,'Y');


SELECT * 
FROM goods;

SELECT * 
FROM goods_two;

SELECT title
FROM goods
UNION ALL -- get all strings with duplicates
SELECT title
FROM goods_two;

SELECT title
FROM goods
UNION  -- get all strings without duplicates
SELECT title
FROM goods_two;

SELECT  title, id ,0.0 as new_price, quantity FROM goods
UNION ALL
SELECT  title, id ,price, quantity FROM goods_two;

SELECT  title, id ,price, quantity FROM goods_two
UNION ALL
SELECT  title, id ,null, quantity FROM goods
UNION ALL
SELECT  title, id ,null, quantity FROM goods;


