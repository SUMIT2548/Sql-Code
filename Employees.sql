-- drop database 
drop database statersql1;

-- create new database 
create database User_details; 
use User_details;
-- Create a Employee table 
create table Employees
(
   Emp_id int auto_increment primary key,
   Emp_Name varchar(100) not null,
   Email_id varchar(100) not null unique,
   Gender enum('male','female','others'),
   Date_of_dirth date,
   create_id timestamp default current_timestamp
);

-- Selecting Data from a Table - Select All Columns
select * from Employees;
-- Select Specific Columns
select Emp_id,Emp_name,Date_of_dirth from Employees;

-- To rename an existing table:
Rename table Employees to Employees_Details; 
select * from Employees_details;
-- To rename it back:
rename table Employees_details to Employees;
select * from employees;


-- Altering a Table ( add column) 
alter table employees add column Salary decimal(10,2);
alter table employees add column Emp_state varchar(100);
select * from employees ;
-- Drop/delete column
alter table employees drop column Emp_state ;
select * from employees;
-- modify column datatype 
alter table employees modify column Email_id varchar(150);
-- rename a column  
alter table employees rename column Date_of_dirth to Date_of_Birth ;
select * from employees;

-- To move a column after another column (e.g., move salary after Gender):
alter table employees modify column Salary decimal(10,2) after Gender;
select * from employees;
-- To move a column first :
alter table employees modify Email_id varchar(150) first ;
select * from employees;
-- To move a column after another column (e.g., move Email_id  after Emp_Name)
alter table employees modify Email_id varchar(150) after Emp_name;

-- Inserting Data into MySQL Tables
insert into employees value ( 1,'Sumit','sumit@email.com','Male','55000','1990-04-25',default);
select * from employees;

insert into employees
(Emp_Name,Email_id,Gender, Salary, Date_of_birth)
values 
('Susmita','susmita@email.com','Female','60000','1992-07-28'),
('Joydeep','joydeep@email.com','Male','50000','1993-08-07'),
('Soumik','soumik@email.com','Male','65000','1991-08-05');
select * from employees;

INSERT INTO Employees (Emp_name, email_id, gender, date_of_birth, salary) VALUES
('Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00),
('Ananya', 'ananya@example.com', 'Female', '1990-11-23', 72000.00),
('Raj', 'raj@example.com', 'Male', '1988-02-17', 58000.00),
('Sneha', 'sneha@example.com', 'Female', '2000-08-09', 50000.00),
('Farhan', 'farhan@example.com', 'Male', '1993-12-30', 61000.00),
('Priyanka', 'priyanka@example.com', 'Female', '1985-07-12', 84000.00),
('Aisha', 'aisha@example.com', 'Female', '1997-03-25', 56000.00),
('Aditya', 'aditya@example.com', 'Male', '1992-06-17', 69000.00),
('Meera', 'meera@example.com', 'Female', '1989-09-05', 77000.00),
('Ishaan', 'ishaan@example.com', 'Male', '2001-10-02', 45000.00),
('Tanvi', 'tanvi@example.com', 'Female', '1994-04-18', 62000.00),
('Rohan', 'rohan@example.com', 'Male', '1986-12-01', 75000.00),
('Zoya', 'zoya@example.com', 'Female', '1998-01-15', 54000.00),
('Karan', 'karan@example.com', 'Male', '1990-08-22', 68000.00),
('Nikita', 'nikita@example.com', 'Female', '1987-03-10', 71000.00),
('Manav', 'manav@example.com', 'Male', '1996-11-29', 61000.00),
('Divya', 'divya@example.com', 'Female', '1991-02-28', 57000.00),
('Harshit', 'harshit@example.com', 'Male', '1993-09-09', 65000.00),
('Ritika', 'ritika@example.com', 'Female', '1999-05-05', 52000.00),
('Imran', 'imran@example.com', 'Male', '1995-07-30', 63000.00),
('Juhi', 'juhi@example.com', 'Female', '1992-10-14', 59000.00),
('Tushar', 'tushar@example.com', 'Male', '1990-01-08', 73000.00),
('Lata', 'lata@example.com', 'Female', '1984-11-11', 78000.00),
('Yash', 'yash@example.com', 'Male', '1997-06-06', 64000.00),
('Fatima', 'fatima@example.com', 'Female', '1993-03-03', 55000.00);
select * from employees;

-- Querying Data in MySQL using SELECT
select * from employees;
select Emp_name,Email_id,Salary from employees;

-- Filtering Rows with WHERE
-- Equal
select * from employees where gender = 'male';
-- Not Equal
select * from employees where gender != 'Male';
-- Greater Than / Less Than
select * from employees where salary >57000.00;
select * from employees where salary < 60000.00;
-- Greater Than or Equal / Less Than or Equal
select * from employees where salary >= 65000.00; 
select * from employees where salary <= 57000.00; 
 -- Working with NULL
 -- IS NULL/ equal null
 select * from employees where gender = null ; 
 select * from employees where gender is null ;
 -- IS not NULL / not equal null 
 select * from employees where salary != null;
 select * from employees where salary is not null;
 -- between 
 select * from employees where salary between  65000.00 and 70000.00;
 select * from employees where date_of_birth between '1990-01-01' and '1995-12-31';
 -- IN 
 select * from employees where salary in (65000.00);
 select * from employees where gender in ('male'); 
 select * from employees where gender in ('Female'); 
 select * from employees;
 -- AND 
 Select * from employees where date_of_birth <'1991-01-01' and salary >65000;
-- OR
select * from employees where date_of_birth > '1995-01-01' or salary > 70000;
-- ASC AND DESC Order by
Select * from employees where date_of_birth <'1991-01-01' and salary >65000 order by salary ASC ; 
select * from employees where gender = 'male' order by salary desc;
select * from employees where date_of_birth > '1995-01-01' or salary >= 70000 order by date_of_birth ASC ; 

-- LIKE (Pattern Matching) 
select * from employees;
select * from employees where Emp_name like 'a%';  -- start with A
select * from employees where Emp_name like '%n';  -- End with N 
select * from employees where Emp_name like '%it%'; -- contains 
-- LIMIT
select * from employees where salary > 65000 limit 5 ;  
select * from employees where salary > 65000 order by salary desc limit 5 ;  

SELECT * FROM employees LIMIT 5; -- Top 5 rows
SELECT * FROM Employees LIMIT 10 OFFSET 5; -- Skip first 5 rows, then get next 10


-- UPDATE - Modifying Existing Data
-- basic Syntax -- update table name set column = values where column = values;   
use user_details;
select * from employees ;

--  changes the name of the user with id = 1 to “Alicia”.
update employees set Emp_name = 'Alicia' where Emp_id = 1;
select * from Employees;
update employees set Email_id = 'Alicia@example.com' where Emp_id = 1 ;

--  changes the name Multiple Columns 'Robert' and 'robert@example.com' with id = 2 .  
update employees set Emp_name = 'Robert' , Email_id = 'robert@example.com' where Emp_id = 2;

update employees set Gender = 'male' where Emp_id = 2;
update employees set gender = 'Female' where Emp_id = 1;
Select * from Employees;

-- Update the salary of user with id = 5 to ₹70,000.
update employees set salary = 70000.00 where emp_id = 5;
select * from Employees;

-- Change the name of the user with email alicia@example.com to Alicia Khan . 
Update Employees set Emp_name = 'Alicia Khan' where Email_id = 'Alicia@example.com';
select * from Employees;

-- Increase salary by ₹10,000 for all Employees whose salary is less than ₹60,000.
-- select * from employees where salary <= 55000;
update Employees set salary = salary + 10000.00  where salary <= 55000.00;
Select * from employees;

-- Set the gender of user Ishaan to Other  .
update employees set gender = 'Others' where Emp_Name = 'Ishaan';
update employees set gender = 'Others' where Emp_id = 11;
select * from employees where gender in ('others');
Select * from employees;

-- DELETE - Removing Data from a Table
-- Basic Syntax - delete form table name where condition ;
-- Delete One Row
delete from Employees where salary = null ;
delete from employees where Emp_id = 30;
-- Delete Multiple Rows
-- delete from employees where gender = 'Male'; 
-- Delete All Rows (but keep table structure)
-- delete from employees;
-- Drop the Entire Table (use with caution)
-- drop table employees ;  


-- SQL Functions (MySQL)

-- 1. Aggregate Functions
-- COUNT() 
-- Count total number of employees:
select count(*) from employees;
 -- Count employees who are Female:
 select count(gender) As female from employees where gender = 'female';
 
-- MIN() and MAX() 
-- Get the minimum and maximum salary
select * from employees;
select max(salary) as Maxsalary , min(salary) as Minsalary from employees;
-- get the maximum salary and minimum salary as per gender 
select gender, max(salary) as Maxsalary , min(salary) as MinSalary from Employees group by gender ; 

-- SUM()
-- Calculate total salary payout:
select sum(salary) as Sumofsalary from  employees;
-- calculate total salary as per gender
select gender, sum(salary) as sumofsalary from employees group by gender;
 
-- AVG()
-- Find average salary:
select avg(salary) as Sumofsalary from  employees;

-- Grouping with GROUP BY
-- Average salary by gender:
select gender, avg(salary) from employees group by gender;

-- 2. String Functions
-- LENGTH()
select Emp_Name , length(Emp_name) as NameLength from Employees ;

-- LOWER() and UPPER()
-- Convert names to lowercase or uppercase:
select Emp_name , lower(Emp_Name) as LowerName from Employees;
select Emp_name , gender, upper(Emp_name) as upperName from employees where gender = 'male';

-- CONCAT()
-- Combine name and email:
select Emp_id, Emp_Name , lower(Emp_name) as Username , CONCAT(lower(Emp_name), '4747') AS NewUsername from Employees;
select Emp_id, CONCAT(emp_name, '<', Email_id , '>' ) as Empdetails from Employees;

-- 3. Date Functions

-- NOW()
-- Current date and time:
select Emp_name, Gender, now() as Currentdatetime from Employees;

-- YEAR() , MONTH() , DAY()
-- Extract parts of date_of_birth
select Emp_name, year(Date_of_birth) as Dateofyear , month(date_of_birth) as Monthofbirth, day(date_of_birth) as dayofbirth from employees;
select Emp_name, year(Date_of_birth) as Dateofyear from employees;
select Emp_name,  month(date_of_birth) as Monthofbirth  from employees;

-- DATEDIFF()
-- Find number of days between today and birthdate:
select emp_name, datediff(CURDATE(), date_of_birth) as agedays from Employees;

-- TIMESTAMPDIFF()
-- Calculate age in years:
SELECT Emp_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age FROM Employees;

-- 4. Mathematical Functions
-- ROUND() , FLOOR() , CEIL()
select emp_name, 
     round(salary) as Roundsalary,
     floor(salary) as Floorsalary,
     ceil(Salary) as Ceilsalary 
 From employees;    
 
 -- MOD()
 -- Find even or odd user IDs:
 SELECT Emp_id, Emp_name, MOD(Emp_id, 2) AS remainder FROM Employees;
 
--  5. Conditional Functions
-- IF() 
SELECT Emp_name, gender,
     IF(gender = 'Female', 'Yes', 'No') AS is_female
FROM Employees;
select Emp_id, emp_name, gender,
    if(gender = 'male', 'yes', 'No') AS Malegander
from Employees;

-- MySQL Transactions and AutoCommit 
-- insert into employees ( Emp_name, email_id, gender, salary, Date_of_birth) values('Amaal', 'amaal@example.com', 'male', '68000.00','2000-12-04');
-- select * from Employees;

-- 1. Disabling AutoCommit :
 set autocommit = 0;
 
--  2) ROLLBACK — Revert Changes to the Last Safe Point 
 delete from employees where Emp_id = 30;
 ROLLBACK;
 select * from employees;
 
 --  3. COMMIT — Save Changes to the Database
delete from employees where Emp_id = 30;
 commit;
 select * from employees;
 
--  4. Enabling AutoCommit Again 
set autocommit = 1;

-- MySQL Transactions and AutoCommit example
set autocommit =0;          -- 1. Disabling AutoCommit :
update employees set salary = '75000.00', email_id = 'soumik@gmail.com' where emp_id = 4; -- update salary , email_id where id = 4.
rollback;                   --  2) ROLLBACK — Revert Changes to the Last Safe Point 
select * from employees;
update employees set salary = '75000.00', email_id = 'soumik@gmail.com' where emp_id = 4; -- again update salary , email_id where id = 4.
commit;                     --  3. COMMIT — Save Changes to the Database
select * from employees;     
set autocommit =1;          --  4. Enabling AutoCommit Again


--- Foreign Keys in MySQL

use User_details;
select * from employees;
--  for foregin key we have create empaddress table and with foregin key we linked this employees and empaddress tables.
-- foregin key deletetion example
delete from employees where emp_id =  27 ; --  Delete id = 27 related rows data in presents(Employees) and child(empaddress) table


-- SQL JOINs in MySQL
use user_details;
select * from empaddress;
select * from employees;

-- 1. INNER JOIN - Returns only the matching rows from both tables.
-- Note: emp_id is a foreign key that reference employees.emp_id .

select employees.Emp_name , employees.Gender, empaddress.city, empaddress.state 
from employees inner join empaddress 
on employees.emp_id = empaddress.emp_id ;

-- 2. LEFT JOIN - All rows from left table + matching from right.
-- Returns all rows from the left table(employees), and matching rows from the right table(empaddresses). If no match is found, NULLs are returned.
 
select Employees.Emp_name, employees.salary, employees.date_of_birth , empaddress.city , empaddress.id as addressid 
from employees left join empaddress 
on employees.emp_id = empaddress.emp_id;

-- 3. RIGHT JOIN All rows from right table + matching from left
-- Returns all rows from the right table(empaddress),and matching rows from the left table(employees). If no match is found, NULLs are returned.

select Employees.Emp_name, employees.gender, employees.email_id , empaddress.city , empaddress.id as addressid 
from employees right join empaddress 
on employees.emp_id = empaddress.emp_id;

-- Pratice 
-- use user_details;
-- select * from employees;
-- select * from empaddress; 
-- INNER JOIN
-- select  employees.emp_id as Emp_id , employees.emp_name, empaddress.id as empadds_id , empaddress.city , empaddress.state from employees inner join empaddress on employees.emp_id = empaddress.emp_id; 

-- LEFT JOIN 
-- select employees.emp_id as empid , employees.emp_name , empaddress.id as addsid ,empaddress.state from employees left join empaddress on employees.emp_id = empaddress.emp_id;

-- RIGHT JOIN
-- select employees.emp_id as empid , employees.emp_name , empaddress.id as addsid ,empaddress.state from employees right join empaddress on employees.emp_id = empaddress.emp_id;

-- SQL UNION and UNION ALL joins
-- Step 1: Create the admin_users Table

-- use User_details;
 use user_details;
 select * from employees ;
 select * from admin_users;

-- Step 1 : Use UNION Example
select Emp_name from employees
union
select name from admin_users;

-- UNION ALL Example
select Emp_name from employees
union all
select Name from admin_users;

-- Using More Than One Column

select Emp_name,gender, salary from employees
union
select name , gender , salary from admin_users;

select Emp_name,gender, salary from employees
union all
select name , gender , salary from admin_users;

-- Adding separate roles
select Emp_name , salary , 'users' as role from employees 
union 
select Name, salary , 'admin' as role from admin_users;

select Emp_name , salary , 'users' as role from employees 
union  all
select Name, salary , 'admin' as role from admin_users;

-- Using Order By with UNION

select Emp_name , salary , 'users' as role from employees  
union  
select name, salary, 'admin' as role from admin_users 
order by salary desc ;

-- pratice union and unionall 
-- use user_details;
-- select * from employees;
-- add duplicate data both table (emoloyees and admin_users)
insert into employees ( Emp_name, Email_id, Gender, Salary, Date_of_Birth) value ('Sumit saha','Sumit@example.com','Male','65000.00','1998-06-30');

-- UNION -   Combines results, removes duplicates
select Emp_id , Emp_name, salary, 'Employees' as role from Employees
union
select id  , name, salary, 'Admin' as role from Admin_users
order by salary;

-- UNION ALL  -   Combines results, keeps duplicates
Select Emp_id, Emp_name, date_of_birth , 'employee' as role from employees
union all
select id, name, date_of_birth ,'admin' as role from admin_users;


-- Self JOIN in MySQL
-- A Self JOIN is a regular join, but the table is joined with itself.

-- Step 1: Add a referred_by_id Column
use user_details;
alter table employees add column referred_by_id int;

-- Step 2: Insert Referral Data
update employees set referred_by_id = 1 where emp_id in (3,5,7,9,11,13,15,17) ; 
update employees set referred_by_id = 4 where emp_id in(10,16,18,20,22); -- Emp 4 referred emp 10,16,18,......
update employees set referred_by_id = 20 where emp_id = 28; -- Emp 20 referred emp 28
select * from employees;

-- Step 3: Use a Self JOIN to Get Referrer Names using inner join 
Select 
a.Emp_id,
a.Emp_Name as EmpName,
b.emp_Name as Referred_by_Name 
from 
employees a inner join employees b
on a.referred_by_id = b.Emp_id;

-- Use a Self JOIN to Get Referrer Names using inner join 
select 
a.Emp_id,
a.emp_Name as name,
a.emp_name as referred_by_name,
a.referred_by_id as Empid 
from 
employees a inner join employees b
on a.referred_by_id = b.Emp_id;



