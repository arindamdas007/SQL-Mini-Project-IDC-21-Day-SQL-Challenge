# Total quantity of pizzas sold (`SUM`).
SELECT SUM(quantity) AS total_pizzas_sold
FROM order_details;
# Average pizza price (`AVG`).
SELECT ROUND(AVG(price),2) AS Average_pizza_price
FROM pizzas;
# Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
SELECT od.order_details_id,
       od.order_id,
       SUM(od.quantity*p.price) AS total_order_value
FROM order_details od
JOIN pizzas p
ON od.pizza_id=p.pizza_id
GROUP BY od.order_id;
# Total quantity sold per pizza category (`JOIN`, `GROUP BY`).
SELECT pt.category AS pizza_category,
       SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN pizzas p
ON od.pizza_id=p.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id=pt.pizza_type_id  
GROUP BY pt.category
ORDER BY total_quantity_sold DESC;  
# Categories with more than 5,000 pizzas sold (`HAVING`).
SELECT pt.category,
       SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
HAVING SUM(od.quantity) > 5000;
# Pizzas never ordered (`LEFT/RIGHT JOIN`).
# Price differences between different sizes of the same pizza (`SELF JOIN`).