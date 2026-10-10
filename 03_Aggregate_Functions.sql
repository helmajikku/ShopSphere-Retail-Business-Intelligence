
-- ShopSphere: Retail Business Intelligence
-- 03. Aggregate Functions

-- 10. Count the total number of buyers
select count(*) as total_buyers from buyer_profiles;


-- 11. Calculate the total number of orders
select count(*) as total_orders from sales_orders;


-- 12. Find the average price of all products
select round(avg(unit_price), 2) as average_product_price
from product_catalog;


-- 13. Find the highest-priced product
select product_name, unit_price from product_catalog where 
unit_price = (select max(unit_price) from product_catalog);


-- 14. Find the lowest-priced product
select product_name, unit_price from product_catalog where 
unit_price = (select min(unit_price) from product_catalog);