SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_items;

#Name of the product that has the highest stock quantity
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity = (SELECT MAX(stock_quantity) FROM products);

#Products with their category and supplier
SELECT
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.unit_price,
    p.stock_quantity
FROM products p
JOIN categories c
ON p.category_id = c.category_id
JOIN suppliers s
ON p.supplier_id = s.supplier_id;

#Total amount of each customer's orders
SELECT 
	o.order_id,
    c.customer_name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

#Products and their supplier
SELECT * FROM products;
SELECT * FROM suppliers;
SELECT s.supplier_id,
	   s.supplier_name,
	   p.product_name,
       p.unit_price
FROM suppliers s
JOIN products p
ON s.supplier_id = s.supplier_id
ORDER BY supplier_id;

SELECT * FROM orders;
#Total sales 
SELECT SUM(total_amount) as total_sales FROM orders;
#How many orders
SELECT COUNT(*) as total_orders FROM orders;

#Total sold of each products
SELECT * FROM products;
SELECT * FROM Order_Items;
SELECT p.product_name,
	   SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY product_name
ORDER BY total_sold DESC;

#Stock quantity of each products
SELECT product_name,
	   stock_quantity
FROM products
WHERE stock_quantity < 50;

#Average product price
SELECT AVG(unit_price) AS average_product_price FROM products;

#Name of the product with the highest unit price
SELECT product_name,
	   unit_price
FROM products
WHERE unit_price = 
(
	SELECT MAX(unit_price) FROM products
);

#Total products of the category have
SELECT c.category_name,
	   COUNT(*) AS total_products
FROM categories c
JOIN products p
ON p.category_id = c.category_id
GROUP BY category_name;

#-------------------------------
#Stock quantity of each product
SELECT * FROM categories;
SELECT * FROM products;
SELECT product_name,
	   stock_quantity
FROM products;

#Order amount of the customers
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customer_name,
	   o.total_amount AS order_amount
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id;

#Total revenue of orders
SELECT * FROM orders;
SELECT SUM(total_amount) AS total_revenue FROM orders;

#The product with the lowest stock quantity
SELECT * FROM products;
SELECT product_name,
	   stock_quantity AS lowest_stock FROM products
WHERE stock_quantity =
(
	SELECT MIN(stock_quantity) FROM products
);

#Total quantity sold of each products
SELECT * FROM order_items;
SELECT * FROM products;
SELECT p.product_name,
	   SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY product_name;

#All customer and their orders
SELECT c.customer_name,
	   o.order_id,
       o.order_date,
       o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_name;

SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM products;
SELECT * FROM customers;
#Show products sold in every order
SELECT o.order_id,
	   c.customer_name,
       p.product_name,
       oi.quantity,
       oi.unit_price,
       oi.subtotal
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;

#The customer that spends the most money
SELECT c.customer_name,
	   SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
	   
#How much revenue does each product generate
SELECT * from products;
SELECT * FROM order_items;
SELECT p.product_name,
	   SUM(oi.subtotal) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY product_name
ORDER BY total_revenue DESC;

SELECT * FROM categories;
SELECT * from products;
SELECT * FROM order_items;
#Category earns the most revenue
SELECT c.category_name,
       SUM(oi.subtotal) AS total_revenue
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;

#How many products does each supplier provide
SELECT * FROM products;
SELECT * FROM suppliers;
SELECT s.supplier_name,
	   COUNT(*) AS total_products
FROM suppliers s
JOIN products p 
ON s.supplier_id = p.supplier_id
GROUP BY supplier_name;

#Average value of an order
SELECT AVG(total_amount) FROM orders;

#which product sold the most units
SELECT * FROM products;
SELECT * FROM order_items;
SELECT p.product_name,
	   SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY product_name
ORDER BY units_sold
LIMIT 1;

#Products have never been sold
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

#How much inventory value is currently stored
SELECT SUM(stock_quantity * unit_price) AS inventory_value
FROM products;

#Order amount the customers has ordered
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customer_name,
	   o.order_id,
       o.total_amount AS order_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

#Total spend of the customers 
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customer_name,
       SUM(o.total_amount) AS total_spending
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_name
ORDER BY total_spending DESC;

#Total revenue of each products
SELECT * FROM products;
SELECT * FROM order_items;
SELECT p.product_name,
       SUM(oi.subtotal) as revenue 
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY product_name
ORDER BY revenue DESC;

#Number of products each suppliers sell
SELECT * FROM suppliers;
SELECT * FROM products;
SELECT s.supplier_name,
	   COUNT(*) AS number_of_products
FROM suppliers s
JOIN products p
ON s.supplier_id = p.supplier_id
GROUP BY supplier_name
ORDER BY number_of_products DESC;

#Top selling product
SELECT * FROM order_items;
SELECT * FROM products;
SELECT p.product_name AS top_selling_product,
	   SUM(quantity) AS quantity
FROM products p 
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY top_selling_product
ORDER BY quantity DESC
LIMIT 1;