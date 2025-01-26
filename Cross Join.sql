use CompanyDB

--Write a query to generate a list of all possible employee-project pairs.

select name, project_name
from Employees
cross join Projects

--Write a query to pair each department with every project in the database.

select department_name, project_name
from Department
cross join Projects

