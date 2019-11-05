-- Create tables for the bookstore
CREATE TABLE orders (
	orderId integer PRIMARY KEY,
	creationDate char(10),
	orderStatus char(10),
	shippingAddressId integer,
	billingAddressId integer,
	creditId Integer,
      customerId integer,
      employeeId integer
	FOREIGN KEY (shippingAddressId) references addresses,
	FOREIGN KEY (billingaddressId) references addresses,
	FOREIGN KEY (creditId) references creditCards,
      FOREIGN KEY (customerId) references customers,
      FOREIGN KEY (employeeId) references employees
);

CREATE TABLE books (
	isbn integer PRIMARY KEY,
	edition integer,
	category varchar(20),
	title varchar(100),
	year int,
      price float,
	publisher varchar(30),
	authors varchar(200)
);

CREATE TABLE customers(
	customerId int PRIMARY KEY,
	accountId int,
	phone int,
	name char(20),
	email char(20),
	password char(20),
	addressId integer,
	FOREIGN KEY (addressId) references addresses,
);

CREATE TABLE employees (
	employeeId int PRIMARY KEY,
	name varchar(20),
	addressId int,
	salary int,
	isManager boolean,
	FOREIGN KEY (AddressID) references addresses
);

CREATE TABLE addresses(
	addressId integer PRIMARY KEY,
	zip int,
	state char(2),
	city char(20),
	street char(20),
);

CREATE TABLE orderedBooks (
	isbn int,
	orderId int NOT null,
	quantity int NOT null,
      PRIMARY KEY (isbn, orderId),
      FOREIGN KEY (isbn) references books (isbn),
      FOREIGN KEY (OrderId) references orders (orderId)
);

CREATE TABLE creditCards(
	creditCardId int PRIMARY KEY,
	number int,
	ccv int,
	expirationDate date,
	name varchar(30)
);

CREATE TABLE shoppingCart (
	cartId integer PRIMARY KEY,
	name varchar(30),
	accountId integer not null,
	createdDate datetime not null,
	lastUpdatedDate datetime,
	FOREIGN KEY (accountId) references customers (accountId)
);

CREATE TABLE shoppingCartItems(
	cartItemId int PRIMARY KEY,
	quantity int,
	bookId int,
	shoppingCartId int,
	FOREIGN KEY (bookId) references books,
	FOREIGN KEY (shoppingCartId) references shoppingCart (cartId)
);
