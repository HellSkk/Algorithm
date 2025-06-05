# Write your MySQL query statement below
select round(count(distinct a2.player_id) / count(distinct a1.player_id) , 2) as fraction
from (
    select player_id, min(event_date) as event_date
    from activity
    group by player_id
) as a1
left join activity a2 on a1.event_date = a2.event_date - INTERVAL 1 day and a1.player_id = a2.player_id