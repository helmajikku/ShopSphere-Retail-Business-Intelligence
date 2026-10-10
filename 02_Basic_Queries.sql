
-- Phase 2 — Business analysis 🔍

-- 1. find all buyers from kochi
select * from buyer_profiles where city = 'Kochi';

-- 2. find all unique cities where buyers are registered
select distinct city from buyer_profiles;

-- 3. show buyers with the most recent registrations first
select * from buyer_profiles order by signup_date desc;

-- 4. show bengaluru buyers with the most recent registration first
select * from buyer_profiles where city = 'Bengaluru' order by signup_date desc;

-- 5. find buyers from kochi or bengaluru
select * from buyer_profiles where city in ('Kochi','Bengaluru');

-- 6. find buyers whose names start with the letter A
select buyer_name from buyer_profiles where buyer_name like 'A%';


-- 7. find buyers whose names end with the letter A
select buyer_name from buyer_profiles where buyer_name like '%A';

-- 8. find buyers whose names contain the letter h
select buyer_name from buyer_profiles where buyer_name like '%h%';

-- 9. find the total number of registered buyers
select count(distinct buyer_id) as total_registered_buyers from buyer_profiles;
