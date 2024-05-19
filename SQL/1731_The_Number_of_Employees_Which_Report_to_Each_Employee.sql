-- 1731. The Number of Employees Which Report to Each Employee
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | reports_to  | int      |
-- | age         | int      |
-- +-------------+----------+
-- employee_id is the column with unique values for this table.
-- This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 

select e2.employee_id, e2.name, count(e1.reports_to) as reports_count, round(avg(cast(e1.age as float)), 0) as average_age
from Employees as e1
left join Employees as e2 on e1.reports_to = e2.employee_id
where e1.reports_to = e2.employee_id
group by e2.employee_id, e2.name
order by e2.employee_id
