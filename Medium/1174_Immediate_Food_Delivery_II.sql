-- 1174. Immediate Food Delivery II
-- +-----------------------------+---------+
-- | Column Name                 | Type    |
-- +-----------------------------+---------+
-- | delivery_id                 | int     |
-- | customer_id                 | int     |
-- | order_date                  | date    |
-- | customer_pref_delivery_date | date    |
-- +-----------------------------+---------+
-- delivery_id is the column of unique values of this table.
-- The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).

with cte as
(select customer_id, min(order_date) as order_date, min(customer_pref_delivery_date) as customer_pref_delivery_date 
from Delivery group by customer_id)
select round(cast(count(case when order_date = customer_pref_delivery_date then 1 end) as float) / cast(count(*) as float) * 100, 2) as immediate_percentage 
from cte