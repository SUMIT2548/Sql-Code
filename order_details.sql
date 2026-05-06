Create database SqlProject;
use sqlproject;

create table order_details 
(
order_details_id int  not null primary key,
order_id int not null,
pizza_id text not null,
quantity int not null
);

Select * from order_details;

select count(quantity) from order_details where quantity =1;