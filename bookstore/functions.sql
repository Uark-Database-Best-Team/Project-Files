-- User register address
\! echo "Customer Function: Insert address";
INSERT INTO addresses (addressId, zip, state, city, street)
VALUES (42, 72704, "AR", "Bentonville", "111 Main St.");

-- User update address
\! echo "Customer Function: Update address";
UPDATE addresses SET street = "1 Main St." WHERE addressId=42;
UPDATE addresses SET state = "NotAR" WHERE addressId=42;
UPDATE addresses SET zip = "123456" WHERE addressId=42;
UPDATE addresses SET city = "NotBVille" WHERE addressId=42;

-- Register a new account
\! echo "Customer Function: Register a new account";
INSERT INTO customers (customerId, accountId, phone, name, email, password, addressId)
VALUES(42, 444, 4791235678, "New Customer", "new@customer.com", "password", 42);

-- User login
\! echo "Customer Function: Login";
SELECT password FROM customers WHERE accountId=444;

-- User create empty order or shopping car
\! echo "Customer Function: Create empty order/shopping cart";
INSERT INTO orders (orderId, creationDate, orderStatus, shippingAddressId, billingAddressId, customerId, employeeId) VALUES (42, "2019-11-7", "Pending", 42, 42, 42, 2);
INSERT INTO shoppingCart (cartId, cartName, customerId, createdDate, lastUpdatedDate) VALUES (42, "Christmas Shopping Cart", 42, "2019-11-7", "2019-11-7");

-- Merge shopping carts
\! echo "Customer Function: Merge shopping cards";
UPDATE shoppingCartItems SET cartId=42 WHERE cartId=1;

-- Insert new books
\! echo "Employee Function: Insert new books";
INSERT INTO books (isbn, title, category, edition, price, publisher, authors, year) VALUES (42, "Murder Mystery", "Mystery", 1, 12.99, "Myster Publishers", "Nancy Drew", 2018);

-- List book information
\! echo "Employee Function: List all book information";
SELECT * FROM books WHERE title="Murder Mystery" AND authors="Nancy Drew";

-- List information about those orders assigned to him or her (given employeeId ‘a’)
\! echo "Employee Function: List information about orders assigned to employeeId 1";
SELECT * FROM orders WHERE employeeId=1;

-- Update order status
\! echo "Employee Function: Updating order with id 42 to status Delivered";
UPDATE orders SET orderStatus="Delivered" WHERE orderId=4;

