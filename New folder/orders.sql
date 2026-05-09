Create database SqlProject;
use sqlproject;

create table orders (
order_id int not null primary key,
order_date date not null, 
order_time time not null
);

select * from orders;