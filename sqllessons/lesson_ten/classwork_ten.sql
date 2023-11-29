-- classwork ten

use shop;

SELECT * FROM CUSTOMERS;

SELECT * FROM ORDERS;

create database test_school;

-- 1 : 1 (with unique on FK)
-- 1 : M (when unique not exists on FK)

create table student (
id int primary key auto_increment,
name varchar(255),
surname varchar(255)
);

create table passport(
id int primary key auto_increment,
number varchar(10),
student_id int unique,
foreign key (student_id) references student (id)
);

INSERT INTO student(name, surname) VALUES ('Alex','Alexeev'), ('Oleg', 'Olegov');

SELECT * FROM STUDENT;

INSERT INTO passport(number, student_id ) VALUES ('555555', 2);
INSERT INTO passport(number, student_id ) VALUES ('333333', 1);
-- INSERT INTO passport(number, student_id ) VALUES ('222222', 1);

SELECT t1.*, t2.*
FROM student t1
INNER JOIN passport t2 
ON t1.id = t2.student_id;

-- M : M

create table shop (
id int primary key auto_increment,
name varchar(100)
);

create table customer (
id int primary key auto_increment,
name varchar(128),
surname varchar(128)
);

create table shop2customer(
shop_id int,
customer_id int,
foreign key (shop_id) references shop (id),
foreign key (customer_id) references customer (id)
);

INSERT INTO shop(name) VALUES ('Amazon'),('Wallmart'),('EBAY');

INSERT INTO customer(name, surname) VALUES ('Alex','Alexeev'), 
											('Oleg', 'Olegov'),
                                            ('Maxim','Maximov');
                                            
SELECT * FROM shop;

SELECT * FROM customer;   

INSERT INTO shop2Customer(shop_id, customer_id) VALUES (1,1),(3,1);

INSERT INTO shop2Customer(shop_id, customer_id) VALUES (1,2),(3,2),(2,2);

SELECT t1.*, t3.name, t3.surname
FROM shop t1
INNER JOIN shop2Customer t2
ON t1.id = t2.shop_id
INNER JOIN customer t3
ON t3.id = t2.customer_id
WHERE t1.id = 3;

SELECT t1.name, t1.surname, t3.name
FROM customer t1
INNER JOIN shop2Customer t2
ON t1.id = t2.customer_id
INNER JOIN shop t3
ON t3.id = t2.shop_id
WHERE t1.id = 1;

-- 
create table studentTwo (
id int primary key auto_increment,
name varchar(255),
surname varchar(255)
);

create table passportTwo (
id int primary key auto_increment,
number varchar(10),
student_id int unique,
foreign key (student_id) references studentTwo (id) on delete cascade
);                                         

INSERT INTO studentTwo(name, surname) VALUES ('Alex','Alexeev'), ('Oleg', 'Olegov');

INSERT INTO passportTwo(number, student_id ) VALUES ('555555', 2);
INSERT INTO passportTWo(number, student_id ) VALUES ('333333', 1);

SELECT * FROM studentTwo;
SELECT * FROM passportTwo;

DELETE FROM studentTwo
WHERE id = 2;
--  
SELECT * FROM student;
SELECT * FROM passport;

DELETE FROM student
WHERE id = 1;

-- NF
/*
| Mark | Model
----------------------
|BMW   | M5, X5, X1
|NISSAN| GT-R, SkyLine
|BMW   | M5, X5, X1

-----------------------
1NF (atomic value , unique lines)
| Mark | Model
-----------------------
|BMW   | M5
|BMW   | X1
|BMW   | X5
|NISSAN| GT-R
|NISSAN| SkyLine
------------------------

| Mark | Model. | Price | Discount
-----------------------
|BMW   | M5.    | 10000 | 5
|BMW   | X1.    | 20000 | 5
|BMW   | X5.    | 15000 | 5
|NISSAN| GT-R.  | 1000  | 10
|NISSAN| SkyLine| 30000 | 10
------------------------

2NF (1NF + PK + nekluchevye stolbcy dolgny zavicet ot PK)
ID| Mark | Model. | Price|				ID | Mark | Discount
-------------------------					--------------------
1|BMW   | M5.    | 10000 |				1. | BMW. | 5
2|BMW   | X1.    | 20000 |				2. |NISSAN| 10
3|BMW   | X5.    | 15000 |
4|NISSAN| GT-R.  | 1000  |
5|NISSAN| SkyLine| 30000 |
-------------------------

Contact
1| 1 | +9055454554 | TurkTelecom | 1950 | Istanbul

id|st_id|. Tel		  | provider_id |.                  id|
1 | 1   | +9055454554 | 1	        |                    1| TurkTelecom | 1950 | Istanbul

id|st_id|
1 | 255 |    10                                          10| Java | UNIX | 1972        


3NF (2NF + otsutsvie transitivnyh zavisimostey m/d ne klychevymi stolbcamy)

ID| Mark   | SHOP | PHONE |	
1 | BMW.   | One. | 555    
2 | Nissan | Two  | 333

ID| Mark   | SHOP |								SHOP | PHONE |		
1 | BMW.   | One. |   			                One. | 555
2 | Nissan | Two  |								Two  | 333

---------------------------------------------------------------------------

*/