-- 1193. Monthly Transactions I
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | country       | varchar |
-- | state         | enum    |
-- | amount        | int     |
-- | trans_date    | date    |
-- +---------------+---------+
-- id is the primary key of this table.
-- The table has information about incoming transactions.
-- The state column is an enum of type ["approved", "declined"].

select 
left(cast(trans_date as nvarchar), 7) as month,
country,
count(state) as trans_count,
count(case when state = 'approved' then 1 end) as approved_count,
sum(amount) as trans_total_amount,
sum(case when state = 'approved' then amount else 0 end) approved_total_amount 
from Transactions
group by LEFT(CAST(trans_date AS  nvarchar), 7), country
order by month, country desc