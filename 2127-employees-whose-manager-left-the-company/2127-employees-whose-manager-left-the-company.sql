
select e2.employee_id as employee_id
from Employees e1
right join Employees e2 on e1.employee_id = e2.manager_id 
where e1.employee_id is null and e2.manager_id is not null and e2.salary < 30000
order by employee_id