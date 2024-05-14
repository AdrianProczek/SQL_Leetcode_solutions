-- 197. Rising Temperature
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- There are no different rows with the same recordDate.
-- This table contains information about the temperature on a certain day.

select a.id from weather as a, weather as b 
where datediff(a.recordDate, b.recordDate) = 1 
and a.temperature > b.temperature