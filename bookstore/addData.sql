-- Add data to the tables

INSERT INTO books (isbn, edition, category, title, year, price, publisher, authors)
VALUES
(1, 1, 'Horror', 'Nightmare in Seattle', 2018, 19.99, 'American Books', 'Tyler Tracy, Luke Brandon, Marshall Richards'),
(2, 1, 'Mystery', 'I Spy', 2019, 24.99, 'Mystery Books R Us', 'Mr. Mystery'),
(3, 4, 'Non-Fiction', 'The Science of Reproduction', 2015, 29.99, 'Science Books Inc', 'Bill Nye');

INSERT INTO addresses (addressId, zip, state, city, street)
VALUES
(1, 72712, "AR", "Bentonville", "13732 Goose Drive"),
(2, 72704, "AR", "Fayetteville", "1139 W Drive LN"),
(3, 48439, "MI", "Grand Blanc", "9th Jay ST");

INSERT INTO creditCards (creditCardId, number, ccv, expirationDate, name) 
VALUES
(1, 217659609430, 534, '2020-10-09', 'Marshal Ricard'),
(2, 217659609431, 833, '2021-11-11', 'Tyler isaRa'),
(3, 217659609999, 123, '2024-03-11', 'Luke Boogaloobo');

INSERT INTO customers (customerId, accountId, phone, name, email, password, addressId)
VALUES
(1, 111, 4791231234, 'Marshal Ricard', 'marpoo@poopoo.com', 'insecurePassword', 1),
(2, 222, 4799700223, 'Tyler isaRacist', 'typoo@poopoo.com', 'insecurePassword', 2),
(3, 333, 4795762837, 'Luke Boogaloobo', 'lupoo@poopoo.com', 'insecurePassword', 3);

INSERT INTO employees (employeeId, name, addressId, salary, isManager)
VALUES
(1, "Troy Pipalle", 1, 98000, 1),
(2, "Jeff Rodgers", 2, 24000, 0),
(3, "Steven Tyler", 3, 1450000, 0);

INSERT INTO shoppingCart(cartId, cartName, customerId, createdDate, lastUpdatedDate)
VALUES
(1, 'Summer Reading', 1, '2019-11-02', '2019-11-02'),
(2, 'For Grandma', 2, '2019-11-03', '2019-11-03'),
(3, 'Good stuff', 3, '2019-11-04', '2019-11-04');

INSERT INTO shoppingCartItems(cartItemId, quantity, isbn, cartId)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 2),
(4, 1, 3, 3);

INSERT INTO orders (orderId, creationDate, orderStatus, shippingAddressId, billingAddressId, creditCardId, employeeId, customerId)
VALUES
(1, '2019-11-02', 'Shipped', 1, 1, 1, 1, 1),
(4, '2019-11-04', 'Pending', 3, 3, 3, 1, 3),
(5, '2019-11-04', 'Pending', 3, 3, 3, 1, 3),
(2, '2019-11-03', 'Shipped', 2, 2, 2, 2, 2),
(3, '2019-11-04', 'Pending', 3, 3, 3, 3, 3);

INSERT INTO orderedBooks(isbn, orderId, quantity)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);
