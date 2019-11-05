-- Step 1
CREATE TABLE Employees (
	eid integer PRIMARY KEY,
	ename char(40),
	salary float(20,5)
);

CREATE TABLE Departments (
	did integer PRIMARY KEY,
	dname char(40),
	daddress char(40)
);

CREATE TABLE WorkIn (
	eid integer,
	did integer,
	stime date, 
	FOREIGN KEY (eid) references Employees(eid),
	FOREIGN KEY (did) references Departments(did)
);

-- Step 2
INSERT INTO Employees (eid, ename, salary)
VALUES
(22,'Dustin',10000.0),
(23,'Bob',15000.0),
(24, 'Dustin',20000.0);

INSERT INTO Departments (did, dname, daddress)
VALUES
(101,'cs','keenedy'),
(102,'ee','smith');

INSERT INTO WorkIn(eid, did, stime) 
VALUES
(22,101,'1998-10-10'),
(22,102, '1999-01-10'),
(23,102,'1998-10-15'),
(24,101, '2001-10-10');

-- Question 1
\! echo "Question 1: Name of Employees who work at CS department";
SELECT E.ename
FROM Employees E, WorkIn W
WHERE E.eid = W.eid AND W.did = 101;

-- Question 2
\! echo "Question 2: Name of Employees who have not worked at department 101";
SELECT E.ename
FROM Employees E, WorkIn W
WHERE W.eid NOT IN (
	SELECT W.eid
	FROM  WorkIn W
	WHERE E.eid = W.eid AND W.did = 101
) AND W.eid = E.eid;

-- Insert new values for q3 - q6
INSERT INTO Employees (eid, ename, salary)
VALUES
(3,'Alice',8000.0),
(4,'Mike',7000.0),
(5, 'Alex',10000.0),
(6,'David',20000.0);

INSERT INTO Departments (did, dname, daddress)
VALUES
(103,'sis','carc');

INSERT INTO WorkIn(eid, did, stime) 
VALUES
(3,103,'2000-10-10'),
(4,103, '2000-01-10'),
(5,103,'2000-10-15'),
(6,102, '2001-10-10');

-- Question 3
\! echo "Question 3: Average salary of employees";
SELECT AVG(E.salary)
FROM Employees E;

-- Question 4
\! echo "Question 4: Average salary of employees for each department";
SELECT W.did, AVG(E.salary)
FROM Employees E, WorkIn W
WHERE W.eid = E.eid
GROUP BY W.did;

-- Question 5
\! echo "Question 5: Average salary of employees for each department that has at least 3 employees";
SELECT W.did, AVG(E.salary)
FROM Employees E, WorkIn W
WHERE E.eid = W.eid
GROUP BY W.did
HAVING COUNT(*) > 2;

-- Question 6
\! echo "Question 6: Average salary of employees whose salary is above 9000 for each department that has at least 3 such employees ";
SELECT W.did, AVG(E.salary)
FROM Employees E, WorkIn W
WHERE E.salary > 9000 AND E.eid = W.eid
GROUP BY W.did
HAVING COUNT(*) > 2;

