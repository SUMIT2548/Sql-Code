-- Question Practice --- 

use employee_management_system; 

Select * from departments;
select * from employees;
select * from Projects;
select * from employee_projects; 

-- JOIN practice Questions 

-- 1. Show employee name and department name. 
  select employee_name , department_name from 
  employees inner join departments on employees.department_id = departments.department_id;
  
--  show all employees working in the It department. 
  select employee_name , Department_name from employees inner join departments 
  on employees.department_id = departments.Department_id 
  where Department_name = 'IT' ; 
  
-- show project name with department name  
  select 
     project_name , department_name from 
     projects inner join departments
     on projects.Department_id = departments.Department_id;
     
-- Show employee name with project name.
select employee_name, project_name from 
employees inner join projects
on employees.department_id = projects.department_id;