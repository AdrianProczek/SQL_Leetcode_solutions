-- 1211. Queries Quality and Percentage
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | query_name  | varchar |
-- | result      | varchar |
-- | position    | int     |
-- | rating      | int     |
-- +-------------+---------+
-- This table may have duplicate rows.
-- This table contains information collected from some queries on a database.
-- The position column has a value from 1 to 500.
-- The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.

select q1.query_name, 
round(avg(q1.rating / q1.position), 2) as quality,
round(count(case when q1.rating < 3 then 1 end) / count(q1.rating) * 100, 2) as poor_query_percentage
from Queries as q1
group by q1.query_name having q1.query_name is not null