use user_details;
select * from employees;
update employees set emp_id = 30 where emp_name = 'sumit';
update employees set emp_id = 31 where emp_name = 'susmita';

-- Triggers in Mysql ---

-- create log table 
create table user_log (
      id int auto_increment primary key,
      user_id int,
      name varchar(100),
      created_on timestamp default current_timestamp
      );
      
-- create the trigger --
DELIMITER $$ 

create trigger after_user_insert 
after insert on Employees 
for each row
begin 
   insert into user_log (user_id,name)
   values(new.Emp_id, new.Emp_name);
End$$

DELIMITER ;

-- Test the trigger--

insert into employees( emp_name, email_id, gender, salary, date_of_birth) 
values ( 'debanjan',' debanjan@example.com', 'male','72000.00','1993-05-12') ;

select * from user_log;

-- Viewing stored trigger in Database
show triggers from user_details; 

-- dropping a trigger
drop trigger if exists after_user_insert