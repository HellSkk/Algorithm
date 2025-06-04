# Write your MySQL query statement below

select r.contest_id
    ,   round(count(*) / max(a.users) * 100, 2) as percentage
from users u 
join register r on r.user_id = u.user_id
join (
    select count(user_id) as users
    from users
) as a 
group by r.contest_id
order by percentage desc, r.contest_id asc