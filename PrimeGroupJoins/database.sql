
--1. 	Get all customers and their addresses. 
SELECT * FROM customers
JOIN addresses ON customer_id = customers.id; 

--2.	Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON order_id = orders.id;

--3.	Which warehouses have cheetos?
SELECT * FROM warehouse
JOIN warehouse_product ON warehouse_id = warehouse.id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.id = 5;

--4.	Which warehouses have diet pepsi?
SELECT * FROM warehouse
JOIN warehouse_product ON warehouse_id = warehouse.id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.id = 6;

--5.	Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT addresses.customer_id, customers.first_name, customers.last_name, count(addresses.customer_id) FROM customers
JOIN addresses ON customer_id = customers.id
JOIN orders ON address_id = addresses.id
GROUP BY addresses.customer_id, customers.first_name, customers.last_name;

--6.	How many customers do we have?
SELECT COUNT(customers.id) FROM customers;

--7.	How many products do we carry?
SELECT COUNT(products.id) FROM products;

--8.	What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) FROM warehouse_product
JOIN products on products.id = warehouse_product.product_id
WHERE products.id = 6
 ;