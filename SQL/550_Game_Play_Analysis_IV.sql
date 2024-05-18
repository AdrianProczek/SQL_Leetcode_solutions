-- 550. Game Play Analysis IV
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

with cte as (
    select 
        player_id, 
        min(event_date) as first_login_date 
    from Activity group by player_id
)
select
    round(
        cast(
            (select count(*) from cte 
            where dateadd(day, 1, first_login_date) in (select event_date from Activity where Activity.player_id = cte.player_id)
        ) as float) 
        / 
        cast(
            (select count(*) from cte
        ) as float
    ), 2) as fraction
