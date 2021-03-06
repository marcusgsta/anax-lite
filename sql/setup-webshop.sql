-- ------------------------------------------------------------------------
--
-- For lecture in oophp-v3 kmom03
--
-- CREATE DATABASE oophp;
-- GRANT ALL ON oophp.* TO user@localhost IDENTIFIED BY "pass";
-- USE magi16 (change to this database on the student server)

SET NAMES utf8;



-- ------------------------------------------------------------------------
--
-- Setup tables
--
DROP TABLE IF EXISTS `CartRow`;
DROP TABLE IF EXISTS `Cart`;
DROP TABLE IF EXISTS `Prod2Cat`;
DROP TABLE IF EXISTS `ProdCategory`;
DROP TABLE IF EXISTS `Inventory`;
DROP TABLE IF EXISTS `InvenShelf`;
DROP TABLE IF EXISTS `OrderRow`;
DROP TABLE IF EXISTS `InvoiceRow`;
DROP TABLE IF EXISTS `Invoice`;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS `Product`;
DROP TABLE IF EXISTS `Customer`;



-- ------------------------------------------------------------------------
--
-- Product and product category
--
CREATE TABLE `ProdCategory` (
	`id` INT AUTO_INCREMENT,
	`category` CHAR(10),

	PRIMARY KEY (`id`)
);

-- CREATE TABLE `Product` (
-- 	`id` INT AUTO_INCREMENT,
--     `description` VARCHAR(20),
-- 	`price`INT,
-- 	`image`VARCHAR(20),
-- 
-- 	PRIMARY KEY (`id`)
-- );

CREATE TABLE `Product` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `description` varchar(20) DEFAULT NULL,
	  `price` int(11) DEFAULT NULL,
	  `image` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_description` (`description`)
) 
ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `Prod2Cat` (
	`id` INT AUTO_INCREMENT,
	`prod_id` INT,
	`cat_id` INT,

	PRIMARY KEY (`id`),
    FOREIGN KEY (`prod_id`) REFERENCES `Product` (`id`),
    FOREIGN KEY (`cat_id`) REFERENCES `ProdCategory` (`id`)
);



-- ------------------------------------------------------------------------
--
-- Inventory and shelves
--
CREATE TABLE `InvenShelf` (
    `shelf` CHAR(6),
    `description` VARCHAR(40),

	PRIMARY KEY (`shelf`)
);

-- CREATE TABLE `Inventory` (
-- 	`id` INT AUTO_INCREMENT,
--     `prod_id` INT,
--     `shelf_id` CHAR(6),
--     `items` INT,
-- 
-- 	PRIMARY KEY (`id`),
-- 	FOREIGN KEY (`prod_id`) REFERENCES `Product` (`id`),
-- 	FOREIGN KEY (`shelf_id`) REFERENCES `InvenShelf` (`shelf`)
-- );

CREATE TABLE `Inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `shelf_id` char(6) DEFAULT NULL,
  `items` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_id` (`prod_id`),
  KEY `shelf_id` (`shelf_id`),
  KEY `index_items` (`items`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `Product` (`id`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`shelf_id`) REFERENCES `InvenShelf` (`shelf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



-- ------------------------------------------------------------------------
--
-- Customer
--
CREATE TABLE `Customer` (
	`id` INT AUTO_INCREMENT,
    `firstName` VARCHAR(20),
    `lastName` VARCHAR(20),

	PRIMARY KEY (`id`)
);

-- ------------------------------------------------------------------------
--
-- Cart
--

CREATE TABLE `Cart` (
	`id` INT AUTO_INCREMENT,
	`customer` INT,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`customer`) REFERENCES `Customer` (`id`)
);

CREATE TABLE `CartRow` (
	`id` INT AUTO_INCREMENT,
    `cart` INT,
    `product` INT,
	`items` INT,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`cart`) REFERENCES `Cart` (`id`),
	FOREIGN KEY (`product`) REFERENCES `Product` (`id`)
);


-- ------------------------------------------------------------------------
--
-- Order
--
CREATE TABLE `Order` (
	`id` INT AUTO_INCREMENT,
    `customer` INT,

      -- MySQL version 5.6 and higher
  -- `published` DATETIME DEFAULT CURRENT_TIMESTAMP,
  -- `created` DATETIME DEFAULT CURRENT_TIMESTAMP,
  -- `updated` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  -- MySQL version 5.5 and lower
  `created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated` DATETIME DEFAULT NULL, --  ON UPDATE CURRENT_TIMESTAMP,
  `deleted` DATETIME DEFAULT NULL,
  `delivery` DATETIME DEFAULT NULL,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`customer`) REFERENCES `Customer` (`id`)
);

CREATE TABLE `OrderRow` (
	`id` INT AUTO_INCREMENT,
    `order` INT,
    `product` INT,
	`items` INT,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`order`) REFERENCES `Order` (`id`),
	FOREIGN KEY (`product`) REFERENCES `Product` (`id`)
);



-- ------------------------------------------------------------------------
--
-- Invoice
--
CREATE TABLE `Invoice` (
	`id` INT AUTO_INCREMENT,
    `order` INT,
    `customer` INT,
	`created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`order`) REFERENCES `Order` (`id`),
	FOREIGN KEY (`customer`) REFERENCES `Customer` (`id`)
);

CREATE TABLE `InvoiceRow` (
	`id` INT AUTO_INCREMENT,
    `invoice` INT,
    `product` INT,
	`items` INT,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`invoice`) REFERENCES `Invoice` (`id`),
	FOREIGN KEY (`product`) REFERENCES `Product` (`id`)
);


--
-- Inventory Log table
--
DROP TABLE IF EXISTS InventoryLog;
CREATE TABLE InventoryLog
(
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `what` VARCHAR(20),
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `prod_id` INT,
	`old_amount` NUMERIC,
    `new_amount` NUMERIC
);

--
-- Trigger for logging updating inventory
--
DROP TRIGGER IF EXISTS LogInventoryUpdate;
DELIMITER //

CREATE TRIGGER LogInventoryUpdate
AFTER UPDATE
ON Inventory
	FOR EACH ROW
BEGIN
	IF NEW.items < 5 THEN
		INSERT INTO InventoryLog (`what`, `prod_id`, `old_amount`, `new_amount`)
        VALUES ("trigger", NEW.prod_id, OLD.items, NEW.items);
END IF;
	END
//
DELIMITER ;

-- ------------------------------------------------------------------------
-- View VinventoryLog

DROP VIEW IF EXISTS VInventoryLog;
CREATE VIEW VInventoryLog AS
SELECT
 Product.description,
 InventoryLog.prod_id,
 InventoryLog.when,
 InventoryLog.old_amount,
 InventoryLog.new_amount
 FROM InventoryLog
	INNER JOIN Product
		ON InventoryLog.prod_id = Product.id
;

SELECT * FROM VInventoryLog;
-- ------------------------------------------------------------------------
--
-- Buy some stuff to get it up and running,
-- the first truck has arrived and you need to
-- insert the details into you database.
--

-- ------------------------------------------------------------------------
--
-- Start with the product catalogue
--
INSERT INTO `ProdCategory` (`category`) VALUES
("kitchen"), ("utensils"), ("plates"), ("egg-cups")
;


INSERT INTO `Product` (`id`, `description`, `price`, `image`) VALUES
(1, 'Blender', 90, 'blender.jpg'),
(2, 'Egg Cup 1', 90, 'egg-cup-1.jpg'),
(3, 'Cheese Slicer', 90, 'cheese-slicer.jpg'),
(4, 'Egg Cup 2', 90, 'egg-cup-2.jpg'),
(5, 'Kitchen Utensils', 400, 'utensils-kitchen.jpg');

INSERT INTO `Prod2Cat` (`id`, `prod_id`, `cat_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 3, 1),
(4, 3, 2),
(5, 2, 4),
(6, 2, 1),
(7, 4, 4),
(8, 4, 1),
(9, 5, 1),
(10, 5, 2);

DROP VIEW IF EXISTS VProduct;
CREATE VIEW VProduct AS
SELECT
	P.id,
    P.description,
	P.image,
    GROUP_CONCAT(DISTINCT category) AS category,
	P.price,
	I.items
FROM Product AS P
	LEFT OUTER JOIN Prod2Cat AS P2C
		ON P.id = P2C.prod_id
	LEFT OUTER JOIN ProdCategory AS PC
		ON PC.id = P2C.cat_id
	LEFT OUTER JOIN Inventory AS I
		ON P.id = I.prod_id
GROUP BY P.id
ORDER BY P.description
;



-- ------------------------------------------------------------------------
--
-- The truck has arrived, put the stuff into shelfs and update the database
--
INSERT INTO `InvenShelf` (`shelf`, `description`) VALUES
("AAA101", "House A, aisle A, part A, shelf 101"),
("AAA102", "House A, aisle A, part A, shelf 102")
;

INSERT INTO `Inventory` (`prod_id`, `shelf_id`, `items`) VALUES
(1, "AAA101", 100), (2, "AAA102", 100),
(3, "AAA101", 100), (4, "AAA102", 100), (5, "AAA102", 100)
;

SELECT * FROM InvenShelf;

--
-- View connecting products with their place in the inventory
-- and offering reports for inventory and sales personal.
--
DROP VIEW IF EXISTS VInventory;
CREATE VIEW VInventory AS
SELECT
	S.shelf,
    S.description AS location,
    I.items,
    P.description
FROM Inventory AS I
	INNER JOIN InvenShelf AS S
		ON I.shelf_id = S.shelf
	INNER JOIN Product AS P
		ON P.id = I.prod_id
ORDER BY S.shelf
;

SELECT * FROM VInventory;
SELECT description, items, shelf, description FROM VInventory;


-- Create a view for products

-- DROP VIEW IF EXISTS VProducts;
-- CREATE VIEW VProducts AS
-- SELECT
-- 	S.shelf,
--     S.description AS location,
--     I.items,
--     P.description
-- FROM Inventory AS I
-- 	INNER JOIN InvenShelf AS S
-- 		ON I.shelf_id = S.shelf
-- 	INNER JOIN Product AS P
-- 		ON P.id = I.prod_id
-- ORDER BY S.shelf
-- ;

-- ------------------------------------------------------------------------
--
-- The customers are arriving
--
INSERT INTO `Customer` (`firstName`, `lastName`) VALUES
("Mumin", "Trollet"),
("Mamma", "Mumin"),
("Pappa", "Mumin")
;



INSERT INTO `Cart` (`customer`) VALUES
(1), (2)
;

INSERT INTO `CartRow` (`cart`, `product`, `items`) VALUES
(1, 3, 2),
(1, 4, 2),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 96)
;


-- ------------------------------------------------------------------------------
-- PROCEDURE createCart


DROP PROCEDURE IF EXISTS createCart;

DELIMITER //

CREATE PROCEDURE createCart(
	thisCustomer CHAR
)
BEGIN
START TRANSACTION;
INSERT INTO Cart
SET
customer = thisCustomer;
COMMIT;

END
//
DELIMITER ;
-- USAGE:
-- CALL createCart(customerId);
-- Example:
-- CALL createCart(2);
--
-- ------------------------------------------------------------------------------
-- PROCEDURE addToCart


DROP PROCEDURE IF EXISTS addToCart;

DELIMITER //

CREATE PROCEDURE addToCart(
	cartId INT,
	thisProductId NUMERIC,
	amount NUMERIC
)
BEGIN
START TRANSACTION;

INSERT INTO CartRow
SET
cart = cartId,
product = thisProductId,
items = amount;
COMMIT;

END
//
DELIMITER ;
-- USAGE:
-- CALL addToCart(cartId, productId, amound)
-- Example:
-- CALL addToCart(1, 2, 300);

-- ------------------------------------------------------------------------------
-- PROCEDURE removeFromCart
-- Remove product from cart
DROP PROCEDURE IF EXISTS removeFromCart;

DELIMITER //

CREATE PROCEDURE removeFromCart(
	cartId NUMERIC,
    productId NUMERIC
)
BEGIN
START TRANSACTION;

DELETE FROM CartRow
WHERE product = productId AND cart = cartId;
COMMIT;

END
//
DELIMITER ;
-- USAGE:
-- CALL removeFromCart(cartId, productId)
-- Example:
-- CALL removeFromCart(4, 2);
--

-- ------------------------------------------------------------------------------
-- PROCEDURE makeOrder
-- Make an order from a cart
DROP PROCEDURE IF EXISTS makeOrder;

DELIMITER //

CREATE PROCEDURE makeOrder(
	cartId INT
)
BEGIN
DECLARE amount INT;
DECLARE i INT DEFAULT 0;
DECLARE n INT DEFAULT 0;
DECLARE productId INT;
DECLARE orderNr INT;
DECLARE currentAmount NUMERIC;

START TRANSACTION;

INSERT INTO `Order` (customer)
SELECT customer FROM Cart
WHERE id = cartId;
SET orderNr = LAST_INSERT_ID();

SELECT COUNT(*) FROM CartRow WHERE cart = cartId INTO n;
SET i = 0;
aLoop: WHILE i < n DO
	SELECT items FROM CartRow WHERE cart = cartId LIMIT i,1
    INTO amount;
	SELECT product FROM CartRow WHERE cart = cartId LIMIT i,1
    INTO productId;

INSERT INTO OrderRow
(`order`, `product`, `items`)
SELECT
	orderNr, `product`, `items`
FROM CartRow
	WHERE cart = cartId
		LIMIT i,1;

SET currentAmount =
(SELECT items FROM Inventory
WHERE prod_id = productId);
	IF currentAmount - amount < 0 THEN
		ROLLBACK;
		SELECT "Amount in the inventory is not enough for purchase";
        LEAVE aLoop;
	ELSE

	UPDATE Inventory
SET
	items = items - amount
WHERE
	prod_id = productId
;
SET i = i + 1;
END IF;
END WHILE;

COMMIT;

END
//
DELIMITER ;
-- USAGE:
-- CALL makeOrder(cartId)
-- Example:
CALL makeOrder(2);
--

-- ------------------------------------------------------------------------------
-- PROCEDURE showOrder
-- Show order rows from cart with a certain ID
DROP PROCEDURE IF EXISTS showOrder;

DELIMITER //

CREATE PROCEDURE showOrder(
	orderId NUMERIC
)
BEGIN
START TRANSACTION;

SELECT
*
FROM OrderRow AS R
INNER JOIN `Order` AS O
	ON O.id = R.order
WHERE O.id = orderId
;

COMMIT;

END
//
DELIMITER ;
-- USAGE:
-- CALL showOrder(orderId)
-- Example:
-- CALL showOrder(3);
--

-- PROCEDURE removeOrder
-- Assigns order with certain orderId to DELETED
DROP PROCEDURE IF EXISTS removeOrder;

DELIMITER //

CREATE PROCEDURE removeOrder(
	orderId NUMERIC
)
BEGIN
START TRANSACTION;

UPDATE
`Order`
SET
deleted = NOW()
WHERE
id = orderId;
COMMIT;

END
//
DELIMITER ;
-- USAGE:
-- CALL removeOrder(orderId)
-- Example:
-- CALL removeOrder(3);
--
-- ------------------------------------------------------------------------------
-- PROCEDURE showCart
-- Show cart rows from cart with a certain ID
DROP PROCEDURE IF EXISTS showCart;

DELIMITER //

CREATE PROCEDURE showCart(
	cartId NUMERIC
)
BEGIN
START TRANSACTION;

SELECT
*
FROM CartRow AS R
INNER JOIN Cart AS C
	ON C.id = R.cart
WHERE C.id = cartId;

COMMIT;

END
//
DELIMITER ;
-- USAGE:
-- CALL showCart(cartId)
-- Example:
-- CALL showCart(2);
--

-- FUNCTION TO CALCULATE "MOMS" ON PRODUCT PRICE

DELIMITER //

DROP FUNCTION IF EXISTS Moms //
CREATE FUNCTION Moms(
	price NUMERIC
)
RETURNS NUMERIC
BEGIN
	RETURN price * 0.20;
END
//

DELIMITER ;

-- USAGE:
SELECT price,
Moms(price) AS 'Moms 20%'
FROM Product;

-- INDEXES

-- Denna kan jag använda. Från full table scan med 9 rader, till 
-- att scanna 3 rader. type:range.
-- jag lade till ett index (icke unikt) på title-kolumnen.
-- SELECT * FROM content WHERE title LIKE "Nu%";
-- EXPLAIN SELECT * FROM content WHERE title LIKE "Nu%";
-- 
-- CREATE INDEX index_title ON content (title);
-- 
-- EXPLAIN content;
-- -- ett index på en varchar-kolumn kan vara en bra ide
-- -- men bara på delsträngar där man vet vänstra/första delen på strängen.
-- 
-- -- index för numeriska värden
-- 
-- EXPLAIN Inventory;
-- 
-- SELECT * FROM Inventory WHERE items < 50;
-- EXPLAIN SELECT * FROM Inventory WHERE items < 50;
-- 
-- SELECT * FROM Inventory;
-- 
-- CREATE INDEX index_items ON Inventory(items);
-- -- detta var också effektivt. Om jag vill hämta alla rader där det finns färre än ex. 50 enheter
-- -- från lagret Inventory, så kan jag lägga till ett index på kolumnen items.
-- -- Resultatet blev att gå från full table scan till att bara hämta en rad, vilket också är 
-- -- resultatet.
-- 
-- SHOW INDEX FROM Inventory;
-- 
-- SHOW CREATE TABLE Inventory;
-- SHOW CREATE TABLE Product;
-- 
-- EXPLAIN Product;
-- SELECT * FROM Product;
-- SELECT * FROM Product WHERE description LIKE "%gg%";
-- EXPLAIN SELECT * FROM Product WHERE description LIKE "%gg%";
-- EXPLAIN SELECT * FROM Product WHERE description LIKE "Egg%";
-- CREATE INDEX index_description ON Product(description);
-- 