CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    message TEXT,
    signup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cart(
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(255) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    shipping_address TEXT NOT NULL,
    message TEXT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE placeorder (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dress_code VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)



--------PROCEDURE STARTTTTTTT------------

DELIMITER //
CREATE PROCEDURE add_to_cart(
    IN user_id INT,
    IN product_id INT,
    IN quantity INT
)
BEGIN
    INSERT INTO Cart (user_id, product_id, quantity, total_price)
    VALUES (user_id, product_id, quantity, (SELECT price FROM Products WHERE id = product_id) * quantity);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE update_cart(
    IN cart_id INT,
    IN new_quantity INT
)
BEGIN
    UPDATE Cart
    SET quantity = quantity + new_quantity
    WHERE id = cart_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE delete_from_cart(
    IN cart_id INT
)
BEGIN
    DELETE FROM Cart
    WHERE id = cart_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE buy_now(
    IN user_id INT,
    IN product_id INT,
    IN quantity INT
)
BEGIN
    INSERT INTO Buy_Now (user_id, product_id, quantity, total_price, order_date, status)
    VALUES (user_id, product_id, quantity, (SELECT price FROM Products WHERE id = product_id) * quantity, NOW(), 'pending');
    UPDATE Products
    SET quantity = quantity - quantity
    WHERE id = product_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE get_cart(
    IN user_id INT
)
BEGIN
    SELECT *
    FROM Cart
    WHERE user_id = user_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE get_buy_now(
    IN user_id INT
)
BEGIN
    SELECT *
    FROM Buy_Now
    WHERE user_id = user_id;
END //

DELIMITER ;


