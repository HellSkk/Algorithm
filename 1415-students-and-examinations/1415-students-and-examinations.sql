# Write your MySQL query statement below

with subject_student as(
    select *
    from students st
    join subjects sb
)

select ss.student_id
    ,   ss.student_name
    ,   ss.subject_name
    ,   count(e.subject_name) as attended_exams 
from subject_student ss
left join examinations e
on ss.subject_name = e.subject_name 
and ss.student_id = e.student_id
group by student_id, ss.subject_name
order by 1, 3