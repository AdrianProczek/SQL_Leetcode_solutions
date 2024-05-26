-- 1789. Primary Department for Each Employee
-- +---------------+---------+
-- | Column Name   |  Type   |
-- +---------------+---------+
-- | employee_id   | int     |
-- | department_id | int     |
-- | primary_flag  | varchar |
-- +---------------+---------+
-- (employee_id, department_id) is the primary key (combination of columns with unique values) for this table.
-- employee_id is the id of the employee.
-- department_id is the id of the department to which the employee belongs.
-- primary_flag is an ENUM (category) of type ('Y', 'N'). If the flag is 'Y', the department is the primary department for the employee. If the flag is 'N', the department is not the primary.

select e1.employee_id, e1.department_id from Employee as e1 group by e1.employee_id having count(e1.department_id) = 1
union distinct
select e2.employee_id, e2.department_id from Employee as e2 where e2.primary_flag = 'Y'