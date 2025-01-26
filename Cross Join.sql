use CompanyDB

--Write a query to generate a list of all possible employee-project pairs.

select name, project_name
from Employees e
cross join Projects p
on e.department_id=p.department_id

--Write a query to pair each department with every project in the database.

select department_name, project_name
from Department d
cross join Projects p
on d.department_id=p.department_id
