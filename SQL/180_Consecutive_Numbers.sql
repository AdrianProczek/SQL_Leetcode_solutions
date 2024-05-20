-- 180. Consecutive Numbers
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column.

select distinct l1.num as ConsecutiveNums  from Logs as l1
join Logs as l2 on l1.id = l2.id + 1
join Logs as l3 on l1.id = l3.id + 2
where l1.num = l2.num and l1.num = l3.num
