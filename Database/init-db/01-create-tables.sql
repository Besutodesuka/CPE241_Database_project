CREATE DATABASE IF NOT EXISTS online_shop;
USE online_shop;

CREATE TABLE user_info (
    user_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_role VARCHAR(50),
    username VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    phone_number VARCHAR(15),
    user_password VARCHAR(255)
);

CREATE TABLE product (
    product_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    seller_id INT(11),
    product_name VARCHAR(100),
    product_description TEXT,
    quantity INT(11),
    price FLOAT(10,2),
    FOREIGN KEY (seller_id) REFERENCES user_info(user_id)
);

CREATE TABLE cart (
    cart_id INT(11) PRIMARY KEY,
    buyer_id INT(11),
    product_id INT(11),
    quantity INT(11),
    FOREIGN KEY (buyer_id) REFERENCES user_info(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE delivery_provider (
    delivery_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    delivery_name VARCHAR(50)
);

CREATE TABLE transaction (
    transaction_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    paid_amount FLOAT(10,2),
    payment_method VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT(11),
    product_id INT(11),
    quantity INT(11),
    transaction_id INT(11),
    total_price FLOAT(10,2),
    order_date TIMESTAMP,
    order_status VARCHAR(50),
    delivery_date TIMESTAMP,
    delivery_id INT(11),
    FOREIGN KEY (buyer_id) REFERENCES user_info(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (transaction_id) REFERENCES transaction(transaction_id),
    FOREIGN KEY (delivery_id) REFERENCES delivery_provider(delivery_id)
);

CREATE TABLE review_product (
    review_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    product_id INT(11),
    buyer_id INT(11),
    rating INT(11),
    comment TEXT,
    date TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (buyer_id) REFERENCES user_info(user_id)
);

CREATE TABLE user_address (
    address_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11),
    address TEXT,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);

CREATE TABLE user_card (
    user_id INT(11),
    card_type VARCHAR(15),
    bank_name VARCHAR(30),
    card_front_number VARCHAR(255),
    card_back_number VARCHAR(255),
    PRIMARY KEY (user_id, card_type),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);

CREATE TABLE wishlist (
    wishlist_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11),
    product_id INT(11),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
