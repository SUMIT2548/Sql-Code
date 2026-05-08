-- SQL UNION and UNION ALL
use User_details;

-- Step 1: Create the admin_users Table

create table admin_users (
id int primary key auto_increment,
Name varchar(150) not null,
Email_id varchar(200) not null unique,
Gender enum('Male','Female','Others'),
Date_of_Birth Date ,
Salary decimal(10,2)
) ;

-- Id will to 100 .
ALTER TABLE admin_users AUTO_INCREMENT = 100;

-- Step 2: Insert Sample Data into admin_users

insert into admin_users( Name , Email_id, Gender, Date_of_birth , Salary) values
('Anil Kumar', 'anil@example.com', 'Male', '1985-04-12', 60000),
('Pooja Sharma', 'pooja@example.com', 'Female', '1992-09-20', 58000),
('Rakesh Yadav', 'rakesh@example.com', 'Male', '1989-11-05', 54000),
('Fatima Begum', 'fatima@example.com', 'Female', '1990-06-30', 62000);

select * from admin_users;

-- Step 1 : Use UNION to Combine Data

select Emp_name,gender, salary from employees
union
select name , gender , salary from admin_users;

-- Using Order By with UNION

select Emp_id , Emp_Name,salary, 'user' as role from employees 
union 
select id , name, salary,'admin' as role from admin_users
order by salary desc;


use user_details;
select * from admin_users;
insert into admin_users value ( 104, 'Sumit Saha','sumit@example.com','Male','1998-06-30','65000.00');
update admin_users 
set id = 30
where name = 'sumit saha'; 

-- UNION ALL Example ( duplicat value showing)
select Emp_name,gender, salary from employees
union all
select name , gender , salary from admin_users;

-- UNION      -   Combines results, removes duplicates
-- UNION ALL  -   Combines results, keeps duplicates

use user_details;
update admin_users set id = 31 where Name = 'sumit saha';
