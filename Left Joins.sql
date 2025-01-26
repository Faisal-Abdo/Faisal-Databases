--Write a query to list all department names along with their employees, 
--ensuring that departments without employees are also included.

select department_name, employee_id
from Department d
left join Employees e
on d.department_id=e.department_id 

--Write a query to find all projects that do not have any associated department

select *
from Projects p
left join Department d
on p.department_id=d.department_id where p.department_id is null

--Write a query to list departments that currently have no employees assigned.

select *
from Department d
left join Employees e
on d.department_id=e.department_id where e.department_id is null
