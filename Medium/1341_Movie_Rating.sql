-- 1341. Movie Rating
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key (column with unique values) for this table.
-- title is the name of the movie.
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key (column with unique values) for this table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date. 
with 
cte1 as (
    select top(1) u.name as results from MovieRating as mv1
    left join Users as u on mv1.user_id = u.user_id
    group by u.name
    order by count(rating) desc, u.name
),
cte2 as (
    select top(1) m.title as results from MovieRating as mv2
    left join Movies as m on mv2.movie_id = m.movie_id
    where mv2.created_at between '2020-02-01' and '2020-02-29'
    group by m.title
    order by avg(cast(rating as float)) desc, m.title
)
select * from cte1
union all
select * from cte2
