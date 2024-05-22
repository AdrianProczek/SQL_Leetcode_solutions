-- 1907. Count Salary Categories
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | account_id  | int  |
-- | income      | int  |
-- +-------------+------+
-- account_id is the primary key (column with unique values) for this table.
-- Each row contains information about the monthly income for one bank account.

select 
'Low Salary' as category,
sum(case when income < 20000 then 1 else 0 end) as accounts_count 
from Accounts

union 

select 
'Average Salary' as category, 
sum(case when income >= 20000 and income <= 50000 then 1 else 0 end) as accounts_count 
from Accounts

union 

select 
'High Salary' as category, 
sum(case when income > 50000 then 1 else 0 end) as accounts_count 
from Accounts
