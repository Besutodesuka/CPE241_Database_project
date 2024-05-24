CREATE DATABASE IF NOT EXISTS online_shop;
USE online_shop;

CREATE TABLE IF NOT EXISTS USER_INFO (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_role VARCHAR(50),
    username VARCHAR(50) ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    contact_number VARCHAR(15),
    user_password VARCHAR(255),
    UNIQUE (username, email)
);

CREATE TABLE IF NOT EXISTS PRODUCT_INFO (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_description TEXT,
    price DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS STOCK (
    seller_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (seller_id, product_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT_INFO(product_id)
);

CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    buyer_id INT,
    seller_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10, 2),
    order_date DATE,
    order_status VARCHAR(50),
    FOREIGN KEY (buyer_id) REFERENCES USER_INFO(user_id),
    FOREIGN KEY (seller_id) REFERENCES USER_INFO(user_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT_INFO(product_id)
);

CREATE TABLE IF NOT EXISTS BUYER_INFO (
    user_id INT PRIMARY KEY,
    wishlist_id INT,
    cart_id INT,
    FOREIGN KEY (user_id) REFERENCES USER_INFO(user_id)
);

CREATE TABLE IF NOT EXISTS WISHLIST (
    wishlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES USER_INFO(user_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT_INFO(product_id)
);

CREATE TABLE IF NOT EXISTS CART (
    buyer_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    FOREIGN KEY (buyer_id) REFERENCES USER_INFO(user_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT_INFO(product_id)
);

CREATE TABLE IF NOT EXISTS DELIVERY (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    delivery_date DATE,
    deliver_status VARCHAR(50),
    carrier VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
);

CREATE TABLE IF NOT EXISTS TRANSACTIONS (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
);

CREATE TABLE IF NOT EXISTS REVIEW_PRODUCT (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    seller_id INT,
    buyer_id INT,
    rating INT,
    comment TEXT,
    FOREIGN KEY (product_id) REFERENCES PRODUCT_INFO(product_id),
    FOREIGN KEY (seller_id) REFERENCES USER_INFO(user_id),
    FOREIGN KEY (buyer_id) REFERENCES USER_INFO(user_id)
);

CREATE TABLE IF NOT EXISTS DISCOUNT_REDEEM_CODE (
    discount_id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50),
    discount_description VARCHAR(255),
    amount DECIMAL(10, 2),
    expiration_date DATE
);

CREATE TABLE IF NOT EXISTS ACTIVITY_LOG (
    user_id INT,
    user_action VARCHAR(255),
    act_timestamp TIMESTAMP,
    PRIMARY KEY (user_id, act_timestamp)
);
