SELECT * FROM top5000;
select * from top_albums;

DROP DATABASE IF EXISTS bamazon;
CREATE database bamazon;
USE bamazon;

CREATE TABLE products (
position INT NOT NULL,
item_id INT NULL,
product_name VARCHAR(50) NULL,
department_name VARCHAR(50) NULL ,
price DECIMAL(6,2) NULL,
stock_quantity INT NULL,
PRIMARY KEY (position)
);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (1, "iPhone X", "Electronics", 799.99, 50);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (2, "Car Tire", "Automobile", 39.99, 60);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (3, "SAT Book", "Education", 29.99, 20);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (4, "Dog Food", "Food", 24.99, 10);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (5, "Shampoo", "Hygiene", 19.99, 80);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (6, "Piano", "Music", 999.99, 5);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (7, "Shoes", "Fitness", 99.99, 25);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (8, "Television", "Electronics", 249.99, 15);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (9, "Car Battery", "Automobile", 89.99, 55);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) VALUES (10, "Printer", "Electronics", 59.99, 9);

SELECT * FROM products;