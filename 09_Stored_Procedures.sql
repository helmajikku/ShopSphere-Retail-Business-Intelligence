
-- ShopSphere: Retail Business Intelligence
-- 09. Stored Procedures

-- 49. Create a procedure to find products above a given price

delimiter //
create procedure products_above_price(in min_price decimal(10,2))
begin
    select product_id, product_name, unit_price
    from product_catalog
    where unit_price > min_price
    order by unit_price desc;
end //
delimiter ;

-- Display products priced above ₹1,000
call products_above_price(1000);



-- 50. Create a procedure to display products by category

delimiter //
create procedure products_by_category(in category_name varchar(100))
begin
    select pg.group_name, p.product_id, p.product_name, p.unit_price
    from product_groups as pg
    inner join product_catalog as p
	on pg.group_id = p.group_id
    where pg.group_name = category_name
    order by p.unit_price desc;
end //
delimiter ;

-- Display all products in the Electronics category

call products_by_category('Electronics');

-- Display all products in the Fashion category

call products_by_category('Fashion');