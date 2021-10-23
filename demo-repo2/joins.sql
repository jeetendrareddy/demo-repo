USE sql_store;

SELECT order_id,first_name,last_name,orders.customer_id FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id
SELECT * FROM orders 
JOIN customers ON  customers.customer_id = orders.customer_id 
SELECT * FROM orders O 
JOIN customers C ON O.customer_id = C.customer_id


-- problem
SELECT order_id, O.product_id,quantity,O.unit_price FROM order_items O
JOIN products P ON O.product_id = P.product_id  


-- Join acros the data base 
SELECT * FROM order_items O
JOIN sql_inventory.products P ON O.product_id = P.product_id

-- self joins
USE sql_hr;
SELECT E.employee_id,E.first_name,M.first_name AS Manager  FROM employees E
JOIN employees M ON E.reports_to = M.employee_id

-- joing multiple tabled using join
USE sql_store;
SELECT O.order_id,C.first_name,C.last_name,O.order_date,OS.name AS Status FROM orders O 
JOIN customers C ON O.customer_id = C.customer_id 
JOIN order_statuses OS ON O.status = OS.order_status_id
ORDER BY O.order_id
-- practice question
USE sql_invoicing;
SELECT P.payment_id,P.client_id,C.name,PY.name AS payment_method FROM payments P 
JOIN clients C ON P.client_id = C.client_id
JOIN payment_methods PY ON PY.payment_method_id = P.payment_method
ORDER BY client_id,payment_id  


-- compound join condition
USE sql_store;
SELECT * FROM order_items OI
JOIN order_item_notes O ON OI.order_id = O.order_id AND OI.product_id = O.product_id

-- Implicit join 
USE sql_store;
SELECT * FROM orders O,customers C 
WHERE O.customer_id = C.customer_id

-- Outer joins --> These are 2 types 1)INNER JOIN 2)OUTTER JOIN 
USE sql_store;
SELECT C.customer_id,C.first_name,O.order_id FROM orders O 
RIGHT JOIN customers C  ON O.customer_id = C.customer_id 
ORDER BY C.customer_id
-- practice question 
USE sql_store;
SELECT P.product_id,P.name,O.quantity FROM products P 
LEFT JOIN order_items O ON P.product_id = O.product_id

-- Outer joins between multiple tables
USE sql_store;
SELECT c.customer_id,c.first_name,o.order_id,sh.name AS shipper FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN shippers sh ON sh.shipper_id = o.shipper_id
ORDER BY c.customer_id
-- practice question
SELECT o.order_date,o.order_id,c.first_name,sh.name AS shipper,os.name
FROM   orders o
LEFT JOIN customers c ON c.customer_id = o.order_id 
LEFT JOIN shippers sh ON sh.shipper_id = o.shipper_id 
LEFT JOIN order_statuses os ON os.order_status_id = o.status

-- SELF OUTER JOINS
USE sql_hr;
SELECT e.employee_id,e.first_name,m.first_name AS Manger FROM employees e 
LEFT JOIN employees m ON e.reports_to = m.employee_id


-- THE USING CLAUSE
USE sql_store;
SELECT o.order_id,c.first_name,sh.name FROM orders o
JOIN customers c USING (customer_id)
LEFT JOIN shippers sh USING (shipper_id)
SELECT * FROM order_items oi
JOIN order_item_notes oin USING(order_id,product_id)
practice question 
USE sql_invoicing;
SELECT p.date,c.name,p.amount,pm.name AS payment_method FROM payments p
LEFT JOIN clients c USING(client_id)
LEFT JOIN payment_methods pm ON pm.payment_method_id = p.payment_method

-- NATURAL JOINS
USE sql_store;
SELECT o.order_id,c.first_name FROM orders o
NATURAL JOIN customers c

-- CROSS JOINS --> To join every record in the 2 tables
USE sql_store;
SELECT c.first_name AS customer,p.name AS product FROM customers c
CROSS JOIN products p 
ORDER BY c.first_name
practice question 
SELECT * FROM shippers s ,products p 
CROSS JOIN products p      


















