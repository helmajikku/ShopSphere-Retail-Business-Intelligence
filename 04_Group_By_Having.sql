
-- ShopSphere: Retail Business Intelligence
-- 04. GROUP BY and HAVING

-- 15. Count the number of buyers in each city
select city, count(*) as total_buyers
from buyer_profiles
group by city;


-- 16. Find the number of orders placed by each buyer
select buyer_id, count(*) as total_orders
from sales_orders
group by buyer_id;


-- 17. Find the total quantity sold for each product
select product_id, sum(quantity) as total_quantity_sold
from order_lines
group by product_id;


-- 18. Find cities with more than one registered buyer
select city, count(*) as total_buyers
from buyer_profiles
group by city
having count(*) > 1;


-- 19. Find products with a total quantity sold greater than one
select product_id, sum(quantity) as total_quantity_sold
from order_lines
group by product_id
having sum(quantity) > 1;