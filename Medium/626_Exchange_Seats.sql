-- 626. Exchange Seats

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | student     | varchar |
-- +-------------+---------+
-- id is the primary key (unique value) column for this table.
-- Each row of this table indicates the name and the ID of a student.
-- id is a continuous increment.

with cte as (
    select
    (case
        when id % 2 = 0 
            then id - 1
        when id % 2 = 1 and id = (select max(id) from Seat)
            then id
        else 
            id + 1
    end) as new_id,
    id as original_id,
    student
    from Seat
)
select s1.new_id as id, s1.student from cte as s1
left join cte as s2 on s1.new_id = s2.original_id
order by s1.new_id
