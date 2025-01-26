use CompanyDB

create table Department (
department_id INT identity(1,1) PRIMARY KEY,
department_name VARCHAR(50) NOT NULL,
location VARCHAR(50) NOT NULL
)

create table Employees (
employee_id INT identity(1,1) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
salary DECIMAL(10, 2) NOT NULL,
department_id int,
foreign key (department_id) references Department(department_id),
hire_date  DATE NOT NULL
)

Create table Projects (
project_id INT identity(1,1) PRIMARY KEY,
project_name VARCHAR(100) NOT NULL,
department_id  INT,
foreign key (department_id) references Department(department_id),
budget DECIMAL(10, 2) NOT NULL
)

insert into Department 
	values ('HR','2nd floor'),
	('IT', '3rd floor'),
	('Finance','1st floor'),
	('Marketing','9th floor');

insert into Employees
values ('Mohsin Darwish', '1000.20',1,'2025-01-04'),
		('Mahmood Abbas', 1000000.39, null,'2004-05-14')

insert into Projects 
values ('Project 101', 4, 1000000.1),
		('Cloud management system',2,5900.00)
