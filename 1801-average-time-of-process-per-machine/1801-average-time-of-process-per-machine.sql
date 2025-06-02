select machine_id
    ,   round(avg(a.total_processing_time), 3) as processing_time
from (
select machine_id
    ,   process_id
    ,   round(
        MAX(case when activity_type = 'end' then timestamp end) - 
        MIN(case when activity_type = 'start' then timestamp end)
        , 3)
         as total_processing_time
from activity 
group by machine_id, process_id 
) as a
group by machine_id