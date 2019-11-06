-- Create tables for the bookstore
CREATE TABLE books (
	isbn bigint PRIMARY KEY,
	edition integer,
	category varchar(20),
	title varchar(100),
	year int,
    	price float,
	publisher varchar(30),
	authors varchar(200)
);

CREATE TABLE addresses(
	addressId integer PRIMARY KEY,
	zip int,
	state char(2),
	city char(20),
	street char(20)
);

CREATE TABLE creditCards(
	creditCardId int PRIMARY KEY,
	number bigint,
	ccv int,
	expirationDate date,
	name varchar(30)
);

CREATE TABLE customers(
	customerId int PRIMARY KEY,
	accountId int,
	phone bigint,
	name char(20),
	email char(20),
	password char(20),
	addressId integer,
	FOREIGN KEY (addressId) references addresses(addressId)
);

CREATE TABLE employees (
	employeeId int PRIMARY KEY,
	name varchar(20),
	addressId int,
	salary int,
	isManager boolean,
	FOREIGN KEY (addressID) references addresses(addressId)
);

CREATE TABLE shoppingCart (
	cartId integer PRIMARY KEY,
	name varchar(30),
	customerId integer not null,
	createdDate datetime not null,
	lastUpdatedDate datetime,
	FOREIGN KEY (customerId) references customers(customerId)
);

CREATE TABLE shoppingCartItems(
	cartItemId int PRIMARY KEY,
	quantity int,
	isbn bigint,
	cartId int,
	FOREIGN KEY (isbn) references books(isbn),
	FOREIGN KEY (cartId) references shoppingCart(cartId)
);

CREATE TABLE orders (
	orderId integer PRIMARY KEY,
	creationDate char(10),
	orderStatus char(10),
	shippingAddressId integer,
	billingAddressId integer,
	creditCardId Integer,
	customerId integer,
	employeeId integer,
	FOREIGN KEY (shippingAddressId) references addresses(addressId),
	FOREIGN KEY (billingaddressId) references addresses(addressId),
	FOREIGN KEY (creditCardId) references creditCards(creditCardId),
	FOREIGN KEY (customerId) references customers(customerId),
	FOREIGN KEY (employeeId) references employees(employeeId)
);

CREATE TABLE orderedBooks (
	isbn bigint,
	orderId int NOT null,
	quantity int NOT null,
	PRIMARY KEY (isbn, orderId),
	FOREIGN KEY (isbn) references books(isbn),
	FOREIGN KEY (orderId) references orders(orderId)
);
