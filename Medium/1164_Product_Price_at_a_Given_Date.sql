-- 1164. Product Price at a Given Date
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.

select
product_id,
first_value(new_price) over (partition by product_id order by change_date desc) as price 
from Products where change_date <= '2019-08-16'

union

select 
product_id, 
10 as price 
from Products group by product_id having min(change_date) > '2019-08-16'