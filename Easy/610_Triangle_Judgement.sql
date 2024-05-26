-- 610. Triangle Judgement
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- In SQL, (x, y, z) is the primary key column for this table.
-- Each row of this table contains the lengths of three line segments.

select *, 
(case when (
    ((abs(x) + abs(y)) > abs(z))
    and
    ((abs(x) + abs(z)) > abs(y))
    and
    ((abs(y) + abs(z)) > abs(x))
) then 'Yes' else 'No' end) as triangle from Triangle