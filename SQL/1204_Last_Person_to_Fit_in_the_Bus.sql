-- 1204. Last Person to Fit in the Bus
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | person_id   | int     |
-- | person_name | varchar |
-- | weight      | int     |
-- | turn        | int     |
-- +-------------+---------+
-- person_id column contains unique values.
-- This table has the information about all people waiting for a bus.
-- The person_id and turn columns will contain all numbers from 1 to n, where n is the number of rows in the table.
-- turn determines the order of which the people will board the bus, where turn=1 denotes the first person to board and turn=n denotes the last person to board.
-- weight is the weight of the person in kilograms.

with cte as (
    select
    turn,
    person_id,
    person_name,
    weight,
    sum(weight) over (order by turn) as total_weight
    from Queue
)
select top(1) person_name from cte
where total_weight <= 1000
order by turn desc