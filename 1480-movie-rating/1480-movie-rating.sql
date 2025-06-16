# Write your MySQL query statement below
with greatest_number_of_movie_rating as (
    select u.name
    , count(*)
    from MovieRating mr
    join Users u on mr.user_id = u.user_id
    group by u.name
    order by count(*) desc, u.name
    limit 1
), highest_average_rating as (
    select  m.title
        ,   avg(mr.rating) as avg_rating
    from MovieRating mr
    join Movies m on mr.movie_id = m.movie_id
    join Users u on mr.user_id  = u.user_id
    where DATE_FORMAT(created_at, "%Y-%m") = '2020-02'
    group by m.title
    order by avg_rating desc , m.title asc
    limit 1
)

select name as results
from greatest_number_of_movie_rating
union all
select title
from highest_average_rating