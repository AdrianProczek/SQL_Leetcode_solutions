-- 1978. Employees Whose Manager Left the Company
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | manager_id  | int      |
-- | salary      | int      |
-- +-------------+----------+
-- In SQL, employee_id is the primary key for this table.
-- This table contains information about the employees, their salary, and the ID of their manager. Some employees do not have a manager (manager_id is null). 

select employee_id from Employees as e1 where salary < 30000 and 
e1.manager_id not in (select employee_id from Employees as e2) 
order by employee_id