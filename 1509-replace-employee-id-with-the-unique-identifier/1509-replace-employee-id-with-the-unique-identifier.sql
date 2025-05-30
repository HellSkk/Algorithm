# Write your MySQL query statement below

SELECT EUNI.unique_id
    ,   E.name
FROM Employees E
LEFT JOIN EmployeeUNI EUNI on E.id = EUNI.id