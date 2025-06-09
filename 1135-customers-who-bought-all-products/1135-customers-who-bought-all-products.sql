# Write your MySQL query statement below
with total_product as 
(
    select count(*) as cnt
    from Product 
)

select customer_id
from Customer c
join Product p on c.product_key = p.product_key
join total_product tp on 1=1
group by customer_id, tp.cnt
having count(distinct c.product_key) = tp.cnt
