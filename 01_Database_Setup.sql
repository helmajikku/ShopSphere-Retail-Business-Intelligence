
-- Phase 1 — Database setup 

-- create the database
create database shopsphere_insights;

-- select the database
use shopsphere_insights;


-- create buyer profiles table
create table buyer_profiles (
    buyer_id int primary key,
    buyer_name varchar(20),
    email varchar(30),
    city varchar(20),
    signup_date date
);



-- insert buyer details
insert into buyer_profiles
(buyer_id, buyer_name, email, city, signup_date)
values
(101, 'Ananya Menon', 'ananya@shopsphere.com', 'Kochi', '2025-01-15'),
(102, 'Rahul Nair', 'rahul@shopsphere.com', 'Bengaluru', '2025-03-22'),
(103, 'Meera Thomas', 'meera@shopsphere.com', 'Chennai', '2025-05-10'),
(104, 'Arjun Pillai', 'arjun@shopsphere.com', 'Kochi', '2025-06-18'),
(105, 'Diya Joseph', 'diya@shopsphere.com', 'Hyderabad', '2025-08-05'),
(106, 'Vishnu Raj', 'vishnu@shopsphere.com', 'Thiruvananthapuram', '2025-09-27'),
(107, 'Neha Varma', 'neha@shopsphere.com', 'Bengaluru', '2026-01-12'),
(108, 'Adithya Kumar', 'adithya@shopsphere.com', 'Coimbatore', '2026-02-28'),
(109, 'Sneha Mathew', 'sneha@shopsphere.com', 'Kochi', '2026-04-14'),
(110, 'Kiran Das', 'kiran@shopsphere.com', 'Kozhikode', '2026-06-09');

select * from buyer_profiles;

-- create product groups table
create table product_groups (
    group_id int primary key,
    group_name varchar(20));

-- insert product groups
insert into product_groups
(group_id, group_name)
values
(201, 'Electronics'),
(202, 'Fashion'),
(203, 'Home & Living'),
(204, 'Beauty'),
(205, 'Sports');

select * from product_groups;

-- create product catalog table
-- group_id is the foreign key connects each product to a product group
create table product_catalog (
    product_id int primary key,
    product_name varchar(30),
    group_id int,
    unit_price decimal(10,2),
    foreign key (group_id) references product_groups(group_id)
);


-- insert product catalog
insert into product_catalog
(product_id, product_name, group_id, unit_price)
values
(301, 'smart watch', 201, 3499.00),
(302, 'wireless earbuds', 201, 2199.00),
(303, 'office backpack', 202, 1599.00),
(304, 'cotton kurti', 202, 1299.00),
(305, 'study lamp', 203, 899.00),
(306, 'storage basket', 203, 749.00),
(307, 'face serum', 204, 699.00),
(308, 'sunscreen lotion', 204, 549.00),
(309, 'yoga mat', 205, 999.00),
(310, 'water bottle', 205, 599.00);

select * from product_catalog;

-- create sales orders table
-- buyer_id is the foreign key connects each order to a buyer
create table sales_orders (
    order_id int primary key,
    buyer_id int,
    order_date date,
    order_status varchar(20),
    foreign key (buyer_id) references buyer_profiles(buyer_id)
);

-- insert sales order details
insert into sales_orders
(order_id, buyer_id, order_date, order_status)
values
(5001, 101, '2026-06-15', 'delivered'),
(5002, 102, '2026-06-18', 'delivered'),
(5003, 103, '2026-06-22', 'shipped'),
(5004, 101, '2026-07-02', 'delivered'),
(5005, 104, '2026-07-08', 'cancelled'),
(5006, 105, '2026-07-14', 'delivered'),
(5007, 106, '2026-07-20', 'shipped'),
(5008, 107, '2026-08-01', 'delivered'),
(5009, 108, '2026-08-09', 'processing'),
(5010, 109, '2026-08-17', 'delivered'),
(5011, 110, '2026-08-25', 'shipped'),
(5012, 104, '2026-09-03', 'processing');

select * from sales_orders;

-- create order lines table
create table order_lines (
    line_id int primary key,
    order_id int,
    product_id int,
    quantity int,

    foreign key (product_id) references product_catalog(product_id),
    foreign key (order_id) references sales_orders(order_id)
);

-- insert order line details
insert into order_lines
(line_id, order_id, product_id, quantity)
values
(7001, 5001, 301, 1),
(7002, 5001, 308, 2),
(7003, 5002, 303, 1),
(7004, 5003, 302, 1),
(7005, 5003, 310, 2),
(7006, 5004, 304, 2),
(7007, 5005, 305, 1),
(7008, 5006, 307, 1),
(7009, 5006, 309, 1),
(7010, 5007, 306, 3),
(7011, 5008, 301, 1),
(7012, 5009, 310, 2),
(7013, 5010, 308, 1),
(7014, 5010, 304, 1),
(7015, 5011, 302, 2),
(7016, 5012, 305, 1);

select * from order_lines;

-- create payment records table
create table payment_records (
    payment_id int primary key,
    order_id int,
    payment_method varchar(20),
    payment_status varchar(20),
    paid_amount decimal(10,2),
    foreign key (order_id) references sales_orders(order_id)
);

-- insert payment records
insert into payment_records
(payment_id, order_id, payment_method, payment_status, paid_amount)
values
(9001, 5001, 'upi', 'paid', 4597.00),
(9002, 5002, 'card', 'paid', 1599.00),
(9003, 5003, 'upi', 'paid', 3397.00),
(9004, 5004, 'card', 'paid', 2598.00),
(9005, 5005, 'upi', 'failed', 899.00),
(9006, 5006, 'net banking', 'paid', 1698.00),
(9007, 5007, 'cash', 'paid', 2247.00),
(9008, 5008, 'upi', 'paid', 3499.00),
(9009, 5009, 'card', 'pending', 1198.00),
(9010, 5010, 'upi', 'paid', 1848.00),
(9011, 5011, 'card', 'paid', 4398.00),
(9012, 5012, 'upi', 'pending', 899.00);

select * from payment_records;

-- view all tables in the database
show tables;

