use CompanyDB

--Write a query to list employees who were hired after at least one of their colleagues in the same department.

select e1.name as Employee_1, e2.name as Employee_2
from Employees e1
inner join Employees e2
on e1.department_id=e2.department_id
where e1.hire_date > e2.hire_date

--Write a query to find employees within the same department who have the same salary.

select e1.name as Employee_1, e2.name as Employee_2
from Employees e1
inner join Employees e2
on e1.department_id=e2.department_id
where e1.salary=e2.salary