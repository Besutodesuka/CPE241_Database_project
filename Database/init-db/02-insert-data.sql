-- Insert data into user_info
INSERT INTO user_info (user_role, username, first_name, last_name, email, dob, phone_number, user_password)
VALUES
('buyer', 'john_doe', 'John', 'Doe', 'john.doe@example.com', '1990-01-01', '1234567890', 'password123'),
('seller', 'jane_smith', 'Jane', 'Smith', 'jane.smith@example.com', '1985-05-15', '0987654321', 'password123'),
('buyer', 'alice_jones', 'Alice', 'Jones', 'alice.jones@example.com', '1992-07-07', '1112223333', 'password123'),
('buyer', 'bob_brown', 'Bob', 'Brown', 'bob.brown@example.com', '1988-03-12', '4445556666', 'password123'),
('seller', 'charlie_clark', 'Charlie', 'Clark', 'charlie.clark@example.com', '1978-11-22', '7778889999', 'password123'),
('buyer', 'david_davis', 'David', 'Davis', 'david.davis@example.com', '1991-02-10', '2223334444', 'password123'),
('buyer', 'emma_evans', 'Emma', 'Evans', 'emma.evans@example.com', '1986-08-08', '5556667777', 'password123'),
('seller', 'fiona_frank', 'Fiona', 'Frank', 'fiona.frank@example.com', '1982-09-15', '9990001111', 'password123'),
('buyer', 'george_green', 'George', 'Green', 'george.green@example.com', '1993-06-18', '8887776666', 'password123'),
('buyer', 'hannah_hall', 'Hannah', 'Hall', 'hannah.hall@example.com', '1990-10-30', '6665554444', 'password123'),
('buyer', 'ian_ives', 'Ian', 'Ives', 'ian.ives@example.com', '1989-04-14', '3332221111', 'password123'),
('seller', 'julia_jones', 'Julia', 'Jones', 'julia.jones@example.com', '1987-07-27', '5554443333', 'password123'),
('buyer', 'kyle_kelly', 'Kyle', 'Kelly', 'kyle.kelly@example.com', '1983-12-19', '2221110000', 'password123'),
('buyer', 'laura_lee', 'Laura', 'Lee', 'laura.lee@example.com', '1992-03-09', '4443332222', 'password123'),
('seller', 'michael_morris', 'Michael', 'Morris', 'michael.morris@example.com', '1980-01-23', '7776665555', 'password123'),
('buyer', 'nancy_nichols', 'Nancy', 'Nichols', 'nancy.nichols@example.com', '1991-05-15', '8889990000', 'password123'),
('buyer', 'oliver_owen', 'Oliver', 'Owen', 'oliver.owen@example.com', '1984-08-28', '1110009999', 'password123'),
('seller', 'paul_peters', 'Paul', 'Peters', 'paul.peters@example.com', '1979-02-12', '2223334445', 'password123'),
('buyer', 'quinn_quinn', 'Quinn', 'Quinn', 'quinn.quinn@example.com', '1985-11-20', '5556667778', 'password123'),
('buyer', 'rachel_ryan', 'Rachel', 'Ryan', 'rachel.ryan@example.com', '1990-06-11', '4443332223', 'password123');

-- Insert data into product
INSERT INTO product (seller_id, product_name, product_description, quantity, price)
VALUES
(2, 'Laptop', 'A high-performance laptop', 10, 999.99),
(2, 'Smartphone', 'A latest model smartphone', 20, 699.99),
(2, 'Headphones', 'Noise-cancelling headphones', 30, 199.99),
(5, 'Tablet', 'A versatile tablet', 15, 499.99),
(5, 'Smartwatch', 'A modern smartwatch', 25, 299.99),
(8, 'Camera', 'A high-resolution camera', 12, 799.99),
(8, 'Printer', 'A wireless printer', 18, 149.99),
(12, 'Monitor', 'A 4K monitor', 22, 349.99),
(12, 'Keyboard', 'A mechanical keyboard', 40, 89.99),
(15, 'Mouse', 'A wireless mouse', 35, 49.99),
(15, 'Speaker', 'A Bluetooth speaker', 28, 129.99),
(15, 'Router', 'A high-speed router', 16, 159.99),
(15, 'SSD', 'A 1TB SSD', 20, 199.99),
(18, 'RAM', 'A 16GB RAM', 25, 99.99),
(18, 'External Hard Drive', 'A 2TB external hard drive', 18, 119.99),
(18, 'Webcam', 'A 1080p webcam', 22, 79.99),
(18, 'Microphone', 'A USB microphone', 30, 99.99),
(18, 'Gaming Chair', 'An ergonomic gaming chair', 10, 199.99),
(18, 'Graphics Card', 'A high-end graphics card', 8, 599.99),
(18, 'Power Bank', 'A 10000mAh power bank', 50, 39.99);

-- Insert data into delivery_provider
INSERT INTO delivery_provider (delivery_name)
VALUES
('DHL'),
('FedEx'),
('UPS'),
('USPS'),
('Amazon Logistics'),
('TNT'),
('Hermes'),
('DPD'),
('Yodel'),
('Royal Mail'),
('Canada Post'),
('Australia Post'),
('GLS'),
('La Poste'),
('China Post'),
('Japan Post'),
('Singapore Post'),
('India Post'),
('Korea Post'),
('Brazil Post');

-- Insert data into user_address
INSERT INTO user_address (user_id, address)
VALUES
(1, '123 Main St, Anytown, USA'),
(2, '456 Elm St, Othertown, USA'),
(3, '789 Oak St, Sometown, USA'),
(4, '101 Pine St, Newtown, USA'),
(5, '202 Maple St, Oldtown, USA'),
(6, '303 Birch St, Smalltown, USA'),
(7, '404 Cedar St, Largetown, USA'),
(8, '505 Willow St, Centertown, USA'),
(9, '606 Aspen St, Midtown, USA'),
(10, '707 Fir St, Uptown, USA'),
(11, '808 Spruce St, Downtown, USA'),
(12, '909 Cherry St, Greentown, USA'),
(13, '100 Apple St, Bluetown, USA'),
(14, '200 Banana St, Yellowtown, USA'),
(15, '300 Grape St, Purpletown, USA'),
(16, '400 Orange St, Orangetown, USA'),
(17, '500 Peach St, Peachtown, USA'),
(18, '600 Plum St, Plumtown, USA'),
(19, '700 Pear St, Peartown, USA'),
(20, '800 Lime St, Limetown, USA');

-- Insert data into user_card
INSERT INTO user_card (user_id, card_type, bank_name, card_front_number, card_back_number)
VALUES
(1, 'Visa', 'Bank A', '1111222233334444', '123'),
(2, 'MasterCard', 'Bank B', '5555666677778888', '456'),
(3, 'Visa', 'Bank C', '9999000011112222', '789'),
(4, 'MasterCard', 'Bank D', '3333444455556666', '012'),
(5, 'Visa', 'Bank E', '7777888899990000', '345'),
(6, 'MasterCard', 'Bank F', '1111333344445555', '678'),
(7, 'Visa', 'Bank G', '2222444466667777', '901'),
(8, 'MasterCard', 'Bank H', '8888999900001111', '234'),
(9, 'Visa', 'Bank I', '4444666688889999', '567'),
(10, 'MasterCard', 'Bank J', '0000111122223333', '890'),
(11, 'Visa', 'Bank K', '5555777799991111', '123'),
(12, 'MasterCard', 'Bank L', '6666888800002222', '456'),
(13, 'Visa', 'Bank M', '9999111133334444', '789'),
(14, 'MasterCard', 'Bank N', '0000222244445555', '012'),
(15, 'Visa', 'Bank O', '2222444455556666', '345'),
(16, 'MasterCard', 'Bank P', '7777888800001111', '678'),
(17, 'Visa', 'Bank Q', '1111222244445555', '901'),
(18, 'MasterCard', 'Bank R', '3333444466667777', '234'),
(19, 'Visa', 'Bank S', '8888999911112222', '567'),
(20, 'MasterCard', 'Bank T', '4444555577778888', '890');