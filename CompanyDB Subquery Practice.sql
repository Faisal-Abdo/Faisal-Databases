use CompanyDB

--Find all employees earning a salary higher than the average salary of all employees.
select name from Employees where salary > (select AVG(salary) from Employees); 

-- List the names of employees working in departments located in 'New York'.
select name from Employees where department_id in 
(select department_id from Department where location = 'New York')


--Find employees whose salaries are greater than the average salary of their respective department.
select e.name, e.salary 
from Employees e
where salary > (select AVG(salary) from Employees where e.department_id= Department.department_id)  --skeptical


--using Inner join:
select AVG(salary), Department.department_name
from Employees 
inner join Department on Department.department_id = Employees.department_id
group by Department.department_name, Employees.name

--Retrieve the names of employees who are not assigned to any department.
select name from Employees where department_id is null;

--using LEFT JOIN:
select  DISTINCT(Employees.name)
from Employees
left join Department on Department.department_id = Employees.department_id
where Department.department_id is null;

--List the names of departments that do not have any associated projects.
select department_name from Department where  department_id not in (select department_id from Projects)

select d.department_name , p.project_id
from Department d
left join Projects p on p.department_id = d.department_id
where p.project_id is null;

--Identify the department name with the highest number of employees.
SELECT TOP 1 y.department_id, y.c AS "num_of_emp"
FROM (
    SELECT e.department_id, COUNT(e.employee_id) AS c
    FROM employees e
    GROUP BY e.department_id
) y
ORDER BY y.c DESC;

select d.department_name
from Department d
left join Employees e on e.department_id = d.department_id
group by d.department_name
order by count(e.department id)

--List the names and salaries of the highest-paid employees in each department.
select name, salary from Employees e where salary in (
SELECT  MAX(salary) FROM Employees GROUP BY department_id)

--Find projects whose budgets exceed the total salaries of all employees in their respective departments.
select budget, project_name from Projects where budget in 
(select  sum(salary) from Employees group by department_id)

--Find the names of employees working in departments that manage projects with a budget greater than $200,000.
select name from Employees where department_id in
( select department_id from Projects where budget >200000.00)

--List the names of employees who work in departments located in 'San Francisco'.
select name from Employees where department_id in 
(select department_id from Department where location = 'San Francisco')

--Identify employees who earn more than the average salary across all departments.
select name from Employees where salary >
(select AVG(salary) from Employees)

--Retrieve the name of the department that manages the project with the highest budget.
select department_name name from Department where department_id in (select department_id from Projects where budget in 
(select Max(budget) from Projects))

--Display the department ID and the total number of employees in each department.
select count(Employees.employee_id), department_id from Employees Group by department_id having department_id is not null

--List employees who are in departments that do not have any projects.
select name FROM Employees where department_id in
(select department_id from Projects where NOT EXISTS  (select project_id from Projects))

--List the names of projects that have a budget higher than the average project budget.
select project_name from Projects where budget > (select AVG(budget) from Projects)

--Find the department IDs of departments that have fewer than three employees.
select department_id from Employees  group by department_id having count(Employees.employee_id) < 3

--Find the name of the employee with the highest salary in the company.
select name from Employees where salary =
(select max(salary) from Employees)

--Find the names of departments that manage projects with a budget of less than $100,000.
select department_name name from Department where department_id in 
(select department_id from Projects where budget < 100000 )

--Identify the name and hire date of the most recently hired employee.
select distinct name from Employees where hire_date in (select min(hire_date) from Employees)