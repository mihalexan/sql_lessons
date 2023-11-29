-- Больше задач с интервью можно найти по адресу https://leetcode.com/problemset/database/

/*
Задача 1 :
Таблица для задачи:
*/
create table if not exists Employee (id int, name varchar(255), salary int, managerId int);

insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', null);
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', null);

/*
Вывести имя работника, который зарабатывает больше своего менеджера
Пример вывода :
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
*/

-- =============================================

/*
Задача 2 :
Таблица для задачи:
*/

create table if not exists Customers (id int, name varchar(255));
create table if not exists Orders (id int, customerId int);

insert into Customers (id, name) values ('1', 'Joe');
insert into Customers (id, name) values ('2', 'Henry');
insert into Customers (id, name) values ('3', 'Sam');
insert into Customers (id, name) values ('4', 'Max');

insert into Orders (id, customerId) values ('1', '3');
insert into Orders (id, customerId) values ('2', '1');

/*
Вывести имена покупателей, которые никогда ничего не покупали.
Пример вывода :
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
*/

-- =============================================

/*
Задача 3 :
Таблица для задачи:
*/
create table if not exists Sales (sale_id int, product_id int, user_id int, quantity int);
create table if not exists Product (product_id int, price int);

insert into Sales (sale_id, product_id, user_id, quantity) values ('1', '1', '101', '10');
insert into Sales (sale_id, product_id, user_id, quantity) values ('2', '2', '101', '1');
insert into Sales (sale_id, product_id, user_id, quantity) values ('3', '3', '102', '3');
insert into Sales (sale_id, product_id, user_id, quantity) values ('4', '3', '102', '2');
insert into Sales (sale_id, product_id, user_id, quantity) values ('5', '2', '103', '3');

insert into Product (product_id, price) values ('1', '10');
insert into Product (product_id, price) values ('2', '25');
insert into Product (product_id, price) values ('3', '15');

/*
Вывести в данные о том, какой пользователь user_id сколько потратил в общем
Пример вывода: 
+---------+----------+
| user_id | spending |
+---------+----------+
| 101     | 125      |
| 102     | 75       |
| 103     | 75       |
+---------+----------+

*/

-- =============================================

/*
Задача 4 :
Таблица для задачи :
*/

create table if not exists Prices (product_id int, start_date date, end_date date, price int);
create table if not exists UnitsSold (product_id int, purchase_date date, units int);

insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-02-17', '2019-02-28', '5');
insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-03-01', '2019-03-22', '20');
insert into Prices (product_id, start_date, end_date, price) values ('2', '2019-02-01', '2019-02-20', '15');
insert into Prices (product_id, start_date, end_date, price) values ('2', '2019-02-21', '2019-03-31', '30');

insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-02-25', '100');
insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-03-01', '15');
insert into UnitsSold (product_id, purchase_date, units) values ('2', '2019-02-10', '200');
insert into UnitsSold (product_id, purchase_date, units) values ('2', '2019-03-22', '30');

/*
Найти среднюю цену продаж для каждого product_id
Пример вывода :

+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+

Обратите внимание, что продажа осуществляется в каком-то определенном периоде и для этого периода действует своя цена.
*/

-- ================================================

/*
Задача 5 :
Таблица для задачи :
*/

create table if not exists Buses (bus_id int, arrival_time int);
create table if not exists Passengers (passenger_id int, arrival_time int);

insert into Buses (bus_id, arrival_time) values ('1', '2');
insert into Buses (bus_id, arrival_time) values ('2', '4');
insert into Buses (bus_id, arrival_time) values ('3', '7');

insert into Passengers (passenger_id, arrival_time) values ('11', '1');
insert into Passengers (passenger_id, arrival_time) values ('12', '5');
insert into Passengers (passenger_id, arrival_time) values ('13', '6');
insert into Passengers (passenger_id, arrival_time) values ('14', '7');

/*
Дано автобусы и пассажиры, определить количество пассажиров уезжающих в каждом автобусе.

Пример вывода: 
+--------+----------------+
| bus_id | passengers_cnt |
+--------+----------------+
| 1      | 1              |
| 2      | 0              |
| 3      | 3              |
+--------+----------------+
Объяснение :
Пассажир с id 11 прибывает в 1 час в определенную точку.
В 2 часа в эту точку прибывает автобус с id 2 и забирает одного единственного там пассажира с id 11.
В 4 часа прибывает автобус с id 2 , но пассажиров нет и уезжает пустым.
В 5,6,7 часов в эту точку прибывают пассажиры с ids 12,13,14.
Всех трех пассажиров забирает автобус с id 3 , который прибывает в 7 часов.
*/