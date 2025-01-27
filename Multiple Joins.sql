use CompanyDB

--Find all departments and their projects along with the employees working in each department. 
--Include departments with no employees or projects.

select d.*, project_name, name
from Department d
left join Employees e
on d.department_id=e.department_id
left join Projects p
on d.department_id = p.department_id

--Retrieve a list of employees who are part of departments that have projects assigned. 
--Include employees from departments with no projects.

select e.*, department_name, project_name
from Employees e
inner join Department d
on e.department_id=d.department_id
left join Projects p
on d.department_id=p.department_id

--List all departments and the number of employees in each department. Include departments with no employees.

select d.department_name, count(employee_id)
from Department d
left join Employees e
on d.department_id=e.department_id
group by department_name

--Find all employees and display their department names along with project names, 
--even if the department or project is missing.

select e.*, department_name, project_name
from Employees e
left join Department d
on e.department_id=d.department_id
left join Projects p
on d.department_id=p.department_id

--List all employees, their department names, and the total budget of projects in their department.
--Include employees without a department or a department without projects.

select e.employee_id,e.name, department_name, sum(budget) as Total_budget
from Employees e
left join Department d
on e.department_id=d.department_id
left join Projects p
on d.department_id=p.department_id
group by e.employee_id,e.name, department_name

--Retrieve a list of projects and their assigned departments, 
--including projects with no department and departments with no projects.

select p.*, department_name
from Projects p
full outer join Department d
on p.department_id=d.department_id

--Display all departments and their employees, including departments with no employees.

select d.*, name
from Department d
left join Employees e
on d.department_id=e.department_id

--Find all employees along with their department names and the projects they are working on. 
--Include employees who are not assigned a department or project.

select e.*, department_name, project_name
from Employees e
left join Department d
on e.department_id=d.department_id
left join Projects p
on d.department_id=p.department_id;

--List all projects along with the department names. Include projects that are not linked to any department.

select p.*, department_name
from Projects p
left join Department d
on p.department_id=d.department_id

--Find all employees along with their department names. Include employees without a department.

select e.*, department_name
from Employees e
left join Department d
on e.department_id=d.department_id