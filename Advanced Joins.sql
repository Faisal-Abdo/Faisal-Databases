use CompanyDB

--Write a query to fetch the names of employees 
--working in departments that have at least one project with a budget exceeding 5000.

select name
from Employees e
inner join Department d
on e.department_id=d.department_id
inner join Projects p
on d.department_id=p.department_id 
where p.budget > 5000

--Write a query to fetch employee names, project names, department names, and department locations.

select  name, department_name, project_name, location
from Employees e
inner join Department d
on e.department_id=d.department_id 
inner join Projects p
on d.department_id = p.department_id 

--Write a query to calculate the total budget of projects managed by each department and 
--list the department name, location, and the employees working in it.

select  d.department_name, sum(p.budget) as Total_Budget, d.location, e.name as Employees
from Projects p
inner join Department d
on p.department_id=d.department_id
inner join Employees e
on d.department_id=e.department_id
group by d.department_name, d.location, e.name


--Write a query to find the names of departments that have more than two employees assigned.

select department_name, count(employee_id)
from Department d
inner join Employees e
on d.department_id=e.department_id
group by department_name
having count(employee_id) > 2

--Write a query to list employees working in departments that share the same location.

select e.*, d.location
from Employees e
inner join Department d
on e.department_id=d.department_id
where d.location in (select location from Department group by location having count(location)>1)