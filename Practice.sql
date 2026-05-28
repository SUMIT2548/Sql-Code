use user_details;
select * from employees;
select * from empaddress;
-- Join 

-- INNER Join 
SELECT 
    employees.emp_id,
    employees.emp_name,
    employees.gender,
    employees.Salary,
    empaddress.city,
    empaddress.state
FROM
    employees
        INNER JOIN
    empaddress ON employees.emp_id = empaddress.emp_id
    order by employees.salary DESC;
    
-- lEFT Join
sELECT 
    employees.emp_id,
    employees.emp_name,
    employees.gender,
    employees.Salary,
    empaddress.city,
    empaddress.state
FROM
    employees
        left JOIN
    empaddress ON employees.emp_id = empaddress.emp_id
    order by employees.salary DESC;
    
-- Right Join
SELECT 
    employees.Emp_id,
    employees.Emp_Name,
    employees.Salary,
    empaddress.city,
    empaddress.state
FROM
    employees
        RIGHT JOIN
    empaddress ON employees.emp_id = empaddress.emp_id; 
    
-- UNION AND UNION ALL 
select * from employees;
select * from admin_users; 
 
-- Example
--  Remove duplicate Vale
select Emp_id, Emp_name , salary from employees
union
select id, Name, Salary from admin_users;

-- show duplicate Vale
select Emp_id, Emp_name , salary from employees
union all
select id, Name, Salary from admin_users;

-- Showing duplicate value because role are difference. 
select Emp_id, Emp_name , salary, 'User' as role from employees
union
select id, Name, Salary, 'Admin' as role from admin_users;

-- Self JOIN 
-- Example 
 
 select * from employees;
 select * from admin_users; 
 
 -- Update referral id 
update employees set referred_by_id = 5 where Emp_id in (23, 24, 25, 26);

-- show user name and refer employee name 
SELECT 
    a.emp_id, a.emp_name AS username, b.Emp_name AS referred_by
FROM
    employees a
        INNER JOIN
    employees b 
    ON a.referred_by_id = b.emp_id;
 
 use user_details;
 select * from empaddress;
 
 -- MySql Views 
 
 create view Emp_address as select * from empaddress where state = 'West Bengal';
 
 select * from Emp_address;
 
 update empaddress set street = 'Collage Street', city ='kolkata', state = 'West Bengal', pincode = 700020 where id = 3 ;
 select * from Emp_address;
 
 drop view emp_address;
 
 -- MYSQL Indexs
 
 use  user_details;
 select * from employees;
 
 show indexes from employees;
 
 create index Namesal_idx on employees(emp_name, salary);
 show indexes from employees;
 
 select * from employees where salary < 65000; 
 drop index namesal_idx on employees;
  show indexes from employees;
 
 
 -- Subquery MYSQL
 
 select * from employees;
 -- -- find users who have been refer by someone who earns more then 75000.--
 SELECT 
    Emp_id, emp_name, referred_by_id
FROM
    employees
WHERE
    referred_by_id IN (SELECT 
            emp_id
        FROM
            employees
        WHERE
            salary > 74000); 
 
 -- shows each users salary along with overall average. 
SELECT 
    Emp_id,
    emp_name,
    salary,
    (SELECT 
            AVG(salary)
        FROM
            employees) AS avg_salary
FROM
    employees; 
    
  -- -- find users who have been refer by someone who earns more then 74000 and show name .--
  SELECT 
    a.Emp_id,
    a.emp_Name,
    a.referred_by_id,
    b.emp_name AS Referred_Name,
    b.salary AS referred_person_salary
FROM
    employees a
        JOIN
    employees b 
    ON a.referred_by_id = b.emp_id
WHERE
    b.salary > 74000;
    
-- Let say we want to find users who have been referred by someone who earns less than 68000 and show referred person name 
use user_details;
select * from employees;
   
SELECT 
    a.emp_id,
    a.emp_name,
    a.referred_by_id,
    b.salary AS refer_person_salary,
    b.emp_name AS person_name
FROM
    employees a
        INNER JOIN
    employees b ON a.referred_by_id = b.emp_id
WHERE
    a.referred_by_id IN (SELECT emp_id FROM employees
        WHERE salary > 68000);
        
-- example ( show the employees salary difference between avg. salary) 
SELECT 
    Emp_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS total_avg_salary,
    salary - (SELECT AVG(salary) FROM employees) AS difference_salary_every_emp
FROM
    employees;
    
    -- example :  Group by and Having in mysql -- 
    -- Average salary by Gender 
    select gender , avg(salary) as Average_Salary from employees
    group by gender ;
    
	-- Find how many users were referred by each user:
    select referred_by_id, count(emp_id) from employees 
    group by referred_by_id;
    
	-- without Null value 
    select referred_by_id, count(emp_id) from employees
    where referred_by_id is not null 
    group by referred_by_id;
    
