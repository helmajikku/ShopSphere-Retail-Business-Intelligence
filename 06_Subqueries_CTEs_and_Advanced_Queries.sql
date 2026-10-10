
-- ShopSphere: Retail Business Intelligence
-- 06. Subqueries_CTEs_and_Advanced_Queries

-- 31. find products priced above the average product price

select product_name, unit_price from product_catalog
where unit_price > (select avg(unit_price) from product_catalog);

-- 32. find buyers who have placed at least one order

select buyer_name from buyer_profiles where 
buyer_id in (select buyer_id from sales_orders);

-- 33. find products priced above the average electronics product price

select product_name, unit_price from product_catalog where 
unit_price > (select avg(unit_price) from product_catalog where
group_id = 201);

-- 34. find all orders with failed payments

select s.order_id, s.order_date, s.order_status,
p.payment_method, p.payment_status, p.paid_amount
from sales_orders as s
inner join payment_records as p
on s.order_id = p.order_id
where p.payment_status = 'failed';


-- 35. find products priced above 1000 using a cte

with expensive_products_cte as 
(select product_name, unit_price from product_catalog
where unit_price > 1000)
select * from expensive_products_cte;


-- 36. find buyers from kochi using a cte

with buyers_cte as 
(select buyer_name from buyer_profiles
where city = 'Kochi')
select * from buyers_cte;


-- 37. rank products by price from highest to lowest

select product_name, unit_price,
rank() over (order by unit_price desc) as price_rank
from product_catalog;


-- 38. rank all products by price using dense_rank

select product_name, unit_price,
dense_rank() over (order by unit_price desc) as price_rank
from product_catalog;


-- 39. create a view for product names and prices

create view product_data as
select product_name, unit_price
from product_catalog;

-- To verify the view

select * from product_data;

