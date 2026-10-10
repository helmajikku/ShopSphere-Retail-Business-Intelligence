
-- ShopSphere: Retail Business Intelligence
-- 05. JOINs and Sales Analysis

-- 20. Show each buyer with their orders
select b.buyer_name,s.order_id, s.order_date, s.order_status
from buyer_profiles as b
inner join sales_orders as s
on b.buyer_id = s.buyer_id;


-- 21. Calculate the total value of each order
select o.order_id, sum(p.unit_price * o.quantity) as order_total
from order_lines as o
inner join product_catalog as p
on o.product_id = p.product_id
group by o.order_id;


-- 22. Calculate total product sales value
select p.product_name, sum(p.unit_price * o.quantity) as total_sales
from product_catalog as p
inner join order_lines as o
on p.product_id = o.product_id
group by p.product_id, p.product_name
order by total_sales desc;


-- 23. Find the total quantity sold for each product
select p.product_name, sum(o.quantity) as total_quantity_sold
from product_catalog as p
inner join order_lines as o
on p.product_id = o.product_id
group by p.product_id, p.product_name
order by total_quantity_sold desc;


-- 24. Calculate product sales value by category
select pg.group_name, sum(p.unit_price * o.quantity) as category_sales
from product_groups as pg
inner join product_catalog as p
on pg.group_id = p.group_id
inner join order_lines as o
on p.product_id = o.product_id
group by pg.group_id, pg.group_name
order by category_sales desc;


-- 25. Find the product generating the highest sales value
select p.product_name, sum(p.unit_price * o.quantity) as total_sales
from product_catalog as p
inner join order_lines as o
on p.product_id = o.product_id
group by p.product_id, p.product_name
order by total_sales desc
limit 1;


-- 26. Show each buyer's total order value
select b.buyer_name, sum(p.unit_price * o.quantity) as total_purchase_value
from buyer_profiles as b
inner join sales_orders as s
on b.buyer_id = s.buyer_id
inner join order_lines as o
on s.order_id = o.order_id
inner join product_catalog as p
on o.product_id = p.product_id
group by b.buyer_id, b.buyer_name
order by total_purchase_value desc;



-- 27. display all buyers and their orders,
-- including buyers who have not placed any orders

select b.buyer_id, b.buyer_name, b.city, s.order_id, s.order_status
from buyer_profiles as b
left join sales_orders as s
on b.buyer_id = s.buyer_id;


-- 28. find buyers who have never placed an order

select b.buyer_id, b.buyer_name, b.city
from buyer_profiles as b
left join sales_orders as s
on b.buyer_id = s.buyer_id
where s.order_id is null;



-- 29. display all orders and their buyer details

select b.buyer_id, b.buyer_name, s.order_id, s.order_date, s.order_status
from buyer_profiles as b
right join sales_orders as s
on b.buyer_id = s.buyer_id;

-- 30. display complete buyer and order details, including unmatched records

select b.buyer_id, b.buyer_name, s.order_id, s.order_status
from buyer_profiles as b
left join sales_orders as s
on b.buyer_id = s.buyer_id

union

select b.buyer_id, b.buyer_name, s.order_id, s.order_status
from buyer_profiles as b
right join sales_orders as s
on b.buyer_id = s.buyer_id;



