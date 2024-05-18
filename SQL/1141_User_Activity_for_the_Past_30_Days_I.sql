-- -- 1141. User Activity for the Past 30 Days I
-- -- +---------------+---------+
-- -- | Column Name   | Type    |
-- -- +---------------+---------+
-- -- | user_id       | int     |
-- -- | session_id    | int     |
-- -- | activity_date | date    |
-- -- | activity_type | enum    |
-- -- +---------------+---------+
-- -- This table may have duplicate rows.
-- -- The activity_type column is an ENUM (category) of type ('open_session', 'end_session', 'scroll_down', 'send_message').
-- -- The table shows the user activities for a social media website. 
-- -- Note that each session belongs to exactly one user.

declare @final_date as date = '2019-07-27'
select max(activity_date) as day, count(distinct user_id) as active_users from Activity
group by activity_date having max(activity_date) between dateadd(day, -29, @final_date) and @final_date

