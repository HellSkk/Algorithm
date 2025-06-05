# Write your MySQL query statement below

select round(sum(case when schedule = 'immediate' then 1 else 0 end) / count(*) * 100, 2) as immediate_percentage
from (
select customer_id
    ,   case
            when min(order_date) - min(customer_pref_delivery_date) = 0 then "immediate"
            else "scheduled" end as schedule
from delivery
group by customer_id
) as a
