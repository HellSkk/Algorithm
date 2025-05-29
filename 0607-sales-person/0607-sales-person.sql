# Write your MySQL query statement below
SELECT name
FROM SalesPerson
WHERE NAME NOT IN (
    SELECT SP.name
FROM SalesPerson SP
JOIN Orders O ON SP.sales_id = O.sales_id
JOIN Company C ON O.com_id = C.com_id and C.name = 'RED'
)