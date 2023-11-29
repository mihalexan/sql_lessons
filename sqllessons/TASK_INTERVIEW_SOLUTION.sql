-- Task 1

select t1.name
from employee t1
inner join employee t2
on t1.managerId = t2.id and t1.salary > t2.salary;

-- Task 2

select t1.name as Customers
from Customers t1 
left join orders t2
on t2.customerId = t1.id
where t2.customerId is null;

-- Task 3

select t3.user_id , sum(t3.spend) as spending
from
	    (select 
		t1.user_id as user_id,
		t1.quantity * t2.price as spend
		from sales t1
		inner join product t2
		on t2.product_id = t1.product_id ) t3
group by t3.user_id;

-- Task 4

SELECT 
t1.product_id,
ROUND(SUM(t2.units * t1.price) / SUM(t2.units),2) as average_price
FROM Prices as t1
INNER JOIN UnitsSold as t2
ON t1.product_id = t2.product_id AND (t2.purchase_date BETWEEN t1.start_date AND t1.end_date)
GROUP BY product_id;

-- Task 5

select 
bus_id,
count(used_bus.m) as passengers_cnt
from buses 
left join 
			(select 
			passenger_id, 
			min(b.arrival_time) as m
			from passengers p 
            left join buses b 
			on p.arrival_time <= b.arrival_time
			group by passenger_id) as used_bus
            
on (used_bus.m = buses.arrival_time)
group by bus_id
order by bus_id;