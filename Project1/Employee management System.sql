create database Employee_Management_System;
use Employee_Management_System;


-- table : Departments 

create table departments 
( 
Department_id int primary key auto_increment,
Department_name varchar(150) not null
); 

insert into departments (department_name) value
('HR'),
('IT'),
('Sales'),
('Finance');

select * from departments;


-- table : Employees

create table employeees
(
Employee_id int primary key auto_increment,
department_id int ,
employee_name varchar(150) not null,
Salary decimal(10,2) not null,
Manager_id int null ,
hire_date date,
constraint Fk foreign key(department_id) references departments(department_id)
);

-- change table name 
rename table employeees to employees;

alter table employees auto_increment = 100;
-- add Foreign Key 
alter table employees add CONSTRAINT fk_manager FOREIGN KEY (Manager_id) REFERENCES employees(Employee_id);

insert into employees ( department_id, employee_name, salary, Manager_id, Hire_date)
values
( 2 , 'Alice', '70000', null , '2020-01-15'),
( 2 , 'Bob' , '50000', 101 , '2021-04-10'),
( 2 , 'Charlie', '45000', 100 , '2022-02-18'),
( 3 ,  'David' , '65000', null , '2019-09-20'),
( 3 ,  'Eva' , '40000' , 103 , '2023-03-15'),
( 3 , 'Frank' , '38000' , 103 , '2023-07-10'),
( 1 , 'Grace' , '60000' , null , '2021-01-05'),
( 1 , 'Henry' , '42000' , 106 , '2022-11-01'),
( 4 , 'Ivy' , '75000' ,  Null , '2018-06-25'),
( 4 , 'Jack' , '48000' , 108 , '2024-01-10');

select * from employees;

-- In this employees table Cannot delete or update a parent row: a foreign key constraint fails 
-- so, You can temporarily disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

-- Update manager_id 
update employees set manager_id = 100 where Employee_id = 101;



-- Table : Projects

create table Projects 
(
Project_id   int primary key auto_increment,
project_name varchar(100) not null ,
department_id int
);

insert into projects ( Project_name , Department_id) values 
( 'Payroll System' , 1 ),
( 'Website Redesign' , 2),
( 'CRM Upgrade' , 3 ),
( 'Accounting Tool' , 4 ),
( 'AI Chatbot' , 2);

select * from projects;  


-- Table : Employee_Projects 

Create table Employee_Projects 
(
Employee_id int , 
Project_id int 
);

insert into Employee_Projects (Employee_id , Project_id) values
( 100 , 2 ),
( 100 , 5 ),
( 101 , 2 ),
( 102 , 5 ),
( 103 , 3 ),
( 104 , 3 ),
( 105 , 3 ),
( 106 , 1 ),
( 107 , 1 ),
( 108 , 4 ),
( 109 , 4 );

select * from Employee_Projects;