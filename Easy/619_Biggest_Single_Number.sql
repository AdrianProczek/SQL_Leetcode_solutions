-- 619. Biggest Single Number
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- This table may contain duplicates (In other words, there is no primary key for this table in SQL).
-- Each row of this table contains an integer.

with cte as (
    select num from MyNumbers
    group by num having count(*) = 1
)
select max(num) as num from cte