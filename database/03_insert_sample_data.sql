INSERT INTO roles(role_name)
VALUES
('Admin'),
('Inventory Manager'),
('Sales Staff');

SELECT * FROM roles;

INSERT INTO users
(role_id, full_name, email, password)
VALUES
(1, 'John Admin', 'john@cloudshop.com', 'admin123'),
(2, 'Mary Inventory', 'mary@cloudshop.com', 'inventory123'),
(3, 'Peter Sales', 'peter@cloudshop.com', 'sales123');

INSERT INTO categories(category_name)
VALUES
('Electronics'),
('Accessories'),
('Office Supplies');

INSERT INTO suppliers
(supplier_name, contact_person, phone, email)
VALUES
('TechSource Inc.', 'Michael Tan', '09123456789', 'contact@techsource.com'),
('OfficeHub', 'Sarah Cruz', '09987654321', 'sales@officehub.com');    

INSERT INTO products
(
category_id,
supplier_id,
product_name,
description,
unit_price,
stock_quantity
)
VALUES
(1,1,'Laptop','Business Laptop',45000,25),
(1,1,'Monitor','24 Inch Monitor',8000,30),
(2,1,'Mouse','Wireless Mouse',500,100),
(2,1,'Keyboard','Mechanical Keyboard',1500,80),
(3,2,'Notebook','A5 Notebook',50,200),
(3,2,'Ballpen','Blue Ink Pen',20,500);

INSERT INTO customers
(customer_name, phone, email)
VALUES
('Juan Dela Cruz', '09111111111', 'juan@email.com'),
('Maria Santos', '09222222222', 'maria@email.com'),
('Pedro Reyes', '09333333333', 'pedro@email.com');

INSERT INTO orders
(customer_id, user_id, total_amount)
VALUES
(1,3,46000),
(2,3,1000),
(3,3,1600);

#Order 1
#Laptop
INSERT INTO order_items
(order_id, product_id, quantity, unit_price, subtotal)
VALUES
(1,1,1,45000,45000);
#Mouse
INSERT INTO order_items
(order_id, product_id, quantity, unit_price, subtotal)
VALUES
(1,3,2,500,1000);

#Order 2
INSERT INTO order_items
(order_id, product_id, quantity, unit_price, subtotal)
VALUES
(2,3,2,500,1000);

#Order 3
INSERT INTO order_items
(order_id, product_id, quantity, unit_price, subtotal)
VALUES
(3,4,1,1500,1500),
(3,6,5,20,100);

INSERT INTO inventory_transactions
(
product_id,
user_id,
transaction_type,
quantity
)
VALUES
(1,2,'Stock In',25),
(2,2,'Stock In',30),
(3,2,'Stock In',100),
(4,2,'Stock In',80),
(5,2,'Stock In',200),
(6,2,'Stock In',500);