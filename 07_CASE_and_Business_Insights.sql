
-- ShopSphere: Retail Business Intelligence
-- 07. CASE Statements and Business Insights

-- 40. Classify products by price

select product_name, unit_price,
case
	when unit_price >= 2000 then 'High Price'
	when unit_price >= 1000 then 'Medium Price'
	else 'Budget Friendly'
    end as price_category
from product_catalog;


-- 41. Classify orders by their current status

select order_id, order_status,
case
	when order_status = 'delivered' then 'Completed'
	when order_status = 'shipped' then 'In Transit'
	when order_status = 'processing' then 'Being Prepared'
	when order_status = 'cancelled' then 'Cancelled'
	else 'Other'
    end as order_category
from sales_orders;


-- 42. Classify payments by payment status

select order_id, payment_method, payment_status, paid_amount,
case
	when payment_status = 'paid' then 'Successful'
	when payment_status = 'pending' then 'Awaiting Payment'
	when payment_status = 'failed' then 'Unsuccessful'
	else 'Other'
    end as payment_category
from payment_records;