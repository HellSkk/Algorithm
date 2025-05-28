# Write your MySQL query statement below
SELECT E1.name as Employee
FROM Employee E1
JOIN Employee E2 on E2.id = E1.managerId
WHERE E1.salary > E2.salary