use CompanyDB

--Write a query to fetch the names of employees working in the IT department.

select name, department_name
from Employees e
inner join Department d
on e.department_id = 2             -- "2" is dept_id for IT

--Write a query to list the names of employees who are part of a department that is assigned to any project.

select name
from Employees e
inner join Projects p
on e.department_id=p.department_id

--Write a query to fetch employees along with project names they are indirectly associated with (based on their department).

select name, project_name
from Employees e
inner join Projects p
on e.department_id=p.department_id 