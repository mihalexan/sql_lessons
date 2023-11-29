create database learn;


use learn;

create table products (
id integer primary key auto_increment,
title varchar(128),
price integer,
discount decimal(2,1)
);

insert into products (title,price,discount) 
values ('bike',50000,0.9),
('skates',15000,0.1),
('skis',25000,null),
('board',30000,0.9),
('scooter',10000,0.8);

select * 
from products;

select 
	title, 
	price,
    discount
from products;    

select 
	title as name, 
	price as cena,
    discount
from products;    

select 
	title as name, 
	price as original_price,
    discount,
    price * discount as price_with_discount,
    'new year action' as sale
from products;  


select 
	title, 
	price,
    discount
from products
where title = 'bike'  ;  

select 
	title, 
	price,
    discount
from products
where price > 20000; 

select 
	title, 
	price,
    discount
from products
where title = 'bike' or title = 'board' or title = 'skis'; 

select 
	title, 
	price,
    discount
from products
where title in ('bike' ,'board','skis');  

select 
	title, 
	price,
    discount
from products
where title not in ('bike' ,'board','skis');  

select * from products;

select 
	title, 
	price,
    discount
from products
where title in ('bike' ,'board','skis') and price >= 30000;  

select 
	title, 
	price,
    discount
from products
where price <= 30000 and price >=15000;  

select 
	title, 
	price,
    discount
from products
where price between 15000 and 30000;  

select 
	title, 
	price,
    discount
from products
where price not between 15000 and 30000; 

select * from products;

select 
	title, 
	price,
    discount
from products
where title like 'b%';

select 
	title, 
	price,
    discount
from products
where title like '%sk%';

select 
	title, 
	price,
    discount
from products
where title like '%t%';

select 
	title, 
	price,
    discount
from products
where title like '%i_';

insert into products (title,price,discount) 
values (null,45000,0.9);

insert into products (title,price,discount) 
values ('',35000,0.9);

select * from products;

select *
from products
where title = '';

select *
from products
where title is null;

select *
from products
where title is not null;

insert into products (title) 
values ('skates');

use hr;

select * from countries;


