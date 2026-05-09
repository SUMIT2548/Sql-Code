Create database SqlProject;
use sqlproject;

-- 1) Retrieve the total number of orders placed.

select Count(order_id) from orders;

-- 2)Calculate the total revenue generated from pizza sales.  (press ctrl+B with select code) 
SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id; 
    
-- 3) Identify the highest-priced pizza.
SELECT 
    pizza_types.name, pizzas.price AS highest_priced
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- 4)Identify the most common pizza size ordered
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS totalorder
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY totalorder DESC;
 
 
-- 5)Identify the most common pizza name
SELECT 
    pizza_types.name,
    SUM(order_details.quantity) AS total_quantity
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_quantity DESC;


-- 6) List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name,
    count(order_details.quantity) AS totalquantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.name
ORDER BY totalquantity DESC
LIMIT 5;
