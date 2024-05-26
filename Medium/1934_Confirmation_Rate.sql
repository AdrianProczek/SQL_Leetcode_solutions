-- 1934. Confirmation Rate
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | user_id        | int      |
-- | time_stamp     | datetime |
-- +----------------+----------+
-- user_id is the column of unique values for this table.
-- Each row contains information about the signup time for the user with ID user_id.
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | user_id        | int      |
-- | time_stamp     | datetime |
-- | action         | ENUM     |
-- +----------------+----------+
-- (user_id, time_stamp) is the primary key (combination of columns with unique values) for this table.
-- user_id is a foreign key (reference column) to the Signups table.
-- action is an ENUM (category) of the type ('confirmed', 'timeout')
-- Each row of this table indicates that the user with ID user_id requested a confirmation message at time_stamp and that confirmation message was either confirmed ('confirmed') or expired without confirming ('timeout').

select sig.user_id,
(CASE WHEN con.action is NULL THEN 0 ELSE round(count(CASE WHEN con.action = 'confirmed' THEN 1 END) / count(CASE WHEN con.action in ('confirmed', 'timeout') THEN 1 END), 2) END) as confirmation_rate
from Signups as sig
left join Confirmations as con on sig.user_id = con.user_id
group by sig.user_id