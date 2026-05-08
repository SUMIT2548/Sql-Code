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
    employees b ON a.referred_by_id = b.emp_id;
 