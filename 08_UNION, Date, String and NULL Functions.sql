
-- ShopSphere: Retail Business Intelligence
-- 08. UNION, Date, String and NULL Functions


-- 43. Combine buyers from Kochi and Bengaluru
-- UNION removes duplicate rows

select buyer_name, city
from buyer_profiles
where city = 'Kochi'

union

select buyer_name, city
from buyer_profiles
where city = 'Bengaluru';



-- 44. Combine buyer lists using UNION ALL
-- UNION ALL keeps all rows from both queries

select buyer_name, city
from buyer_profiles
where city = 'Kochi'

union all

select buyer_name, city
from buyer_profiles
where city = 'Bengaluru';



-- 45. Display order dates by month and year

select order_id, order_date,
monthname(order_date) as order_month,
year(order_date) as order_year
from sales_orders
order by order_date;


-- 46. Display buyer names in uppercase

select buyer_name, upper(buyer_name) as uppercase_name
from buyer_profiles;


-- 47. Display buyer names with their cities in one column

select concat(buyer_name, ' - ', city) as buyer_location
from buyer_profiles;


-- 48. Identify buyers whose email is missing

select buyer_id, buyer_name, email
from buyer_profiles
where email is null;

