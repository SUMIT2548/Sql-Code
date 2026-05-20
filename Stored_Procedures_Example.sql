use user_details;
select * from employees; 

-- Stored Procedures in Mysql
-- Syntax for creating a stored Procedure 

Delimiter $$
create procedure procedure_name()
begin
    select * from Employees ;
End $$
Delimiter ;    

-- calling the procedure 
call procedure_name();

-- creating a procedure with input parameters

Delimiter $$ 
create procedure addUser (
      in UserName varchar(100),
      in Email varchar(150),
      in gender enum('Malee','Female','Others'),
	  in DOB date,
      in Salary int
      )
      
begin
      insert into employees (Emp_name, Email_id, gender, Date_of_Birth, salary)
      values ( UserName, Email, gender, DOB, Salary);
       select * from Employees ;
End$$
Delimiter ; 

-- calling the procedure 
CALL addUser( 'Susmita saha','susmita@example.com', 'Female','1994-05-15', 75000);

-- Viewing stored Procedures in Database
show procedure status where db = 'user_details'; 

-- Dropping a stored procedure 
Drop procedure Procedure_name;
