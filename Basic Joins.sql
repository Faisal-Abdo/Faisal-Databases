use CompanyDB

--Write a query to fetch the employee's name along with their respective department name.

select name, Department_name 
from Employees e, Department d
where e.department_id=d.department_id

--Write a query to list all projects with their department's location.

select project_name, location
from Projects p, Department d
where p.department_id=d.department_id

--Write a query to find employees who do not belong to any department.

select *
from Employees e
where e.department_id is null

--Write a query to list each project name and the name of the department it is assigned to. 
--Include projects that are not assigned to any department.

select project_name, department_name
from Projects p, Department d
where p.department_id=d.department_id or p.department_id is null

