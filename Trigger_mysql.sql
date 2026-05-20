use user_details;
select * from employees;
update employees set emp_id = 30 where emp_name = 'sumit';
update employee set emp_id = 31 where emp_name = 'susmita';

-- Triggers in Mysql ---
-- create log table 

create table user_log (
      id int auto_increment primary key,
      user_id int,
      name varchar(100),
      created_on timestamp default current_timestamp
      );
      
-- create the trigger --
      