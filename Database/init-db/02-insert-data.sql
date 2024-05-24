USE online_shop;

INSERT INTO USER_INFO (user_role, username, first_name, last_name, email, contact_number, user_password)
VALUES
('admin', 'admin', 'Admin', 'User', 'admin@gmail.com', '123456789', 'admin_password'),
('buyer', 'buyer1', 'Alice', 'Smith', 'alice.smith@gmail.com', '111111111', 'buyer1_password'),
('buyer', 'buyer2', 'Emma', 'Johnson', 'emma.johnson@hotmail.com', '222222222', 'buyer2_password'),
('buyer', 'buyer3', 'Michael', 'Williams', 'michael.williams@hotmail.com', '333333333', 'buyer3_password'),
('buyer', 'buyer4', 'Olivia', 'Brown', 'olivia.brown@gmail.com', '444444444', 'buyer4_password'),
('buyer', 'buyer5', 'William', 'Jones', 'william.jones@hotmail.com', '555555555', 'buyer5_password'),
('seller', 'seller1', 'John', 'Doe', 'john.doe@gmail.com', '666666666', 'seller1_password'),
('seller', 'seller2', 'Emma', 'Davis', 'emma.davis@gmail.com', '777777777', 'seller2_password'),
('seller', 'seller3', 'Daniel', 'Miller', 'daniel.miller@hotmail.com', '888888888', 'seller3_password'),
('seller', 'seller4', 'Sophia', 'Wilson', 'sophia.wilson@hotmail.com', '999999999', 'seller4_password');

INSERT INTO PRODUCT_INFO (product_name, product_description, price)
VALUES
('Laptop', 'High-performance laptop with Intel Core i7 processor and 16GB RAM.', 25000.00),
('Smartphone', 'Latest smartphone with a 6.5-inch display and dual-camera setup.', 10000.00),
('Headphones', 'Premium noise-canceling headphones with Bluetooth connectivity.', 3000.00),
('Tablet', '10-inch tablet with high-resolution display and quad-core processor.', 500.00),
('Smart Watch', 'Smartwatch with heart rate monitor, GPS, and activity tracking features.', 5000.00)
;

INSERT INTO STOCK (seller_id, product_id, quantity)
VALUES
(7, 1, 15),
(8, 2, 20),
(7, 3, 25),
(9, 4, 10),
(10, 5, 30)
;
