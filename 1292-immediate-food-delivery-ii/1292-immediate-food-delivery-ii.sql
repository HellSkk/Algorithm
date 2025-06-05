# Write your MySQL query statement below

select round(sum(case when schedule = 'immediate' then 1 else 0 end) / count(*) * 100, 2) as immediate_percentage
from (
select customer_id
    ,   min(order_date) as order_date
    ,   min(customer_pref_delivery_date) as customer_pref_delivery_date
    ,   case
            when min(order_date) - min(customer_pref_delivery_date) = 0 then "immediate"
            else "scheduled" end as schedule
from delivery
group by customer_id
order by order_date
) as a
