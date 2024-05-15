-- Create a Database'Library' 
DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
\c library;

DROP TYPE IF EXISTS Status;
CREATE TYPE Status AS ENUM ('Yes', 'No');

--Create table "Books"
DROP TABLE IF EXISTS Books;
CREATE TABLE Books
(
ISBN VARCHAR(25) PRIMARY KEY,
Book_title VARCHAR(80),
Category VARCHAR(80),
Rental_Price DECIMAL(10,2),
Status Status,
Author VARCHAR(80),
Publisher VARCHAR(80)
);

-- create table "Branch"
DROP TABLE IF EXISTS Branch;
CREATE TABLE Branch
(
Branch_no VARCHAR(10) PRIMARY KEY,
Manager_id VARCHAR(10),
Branch_address VARCHAR(30),
Contact_no VARCHAR(15)
);


 --Create table "Employee"
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee
(
Emp_id VARCHAR(10) PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(10,2)
);


--Create table "Customer"
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer
(
Customer_Id VARCHAR(10) PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE
);


--Create table "IssueStatus"
DROP TABLE IF EXISTS IssueStatus;
CREATE TABLE IssueStatus
(
Issue_Id VARCHAR(10) PRIMARY KEY,
Issued_cust VARCHAR(30),
Issued_book_name VARCHAR(80),
Issue_date DATE,
Isbn_book VARCHAR(25),
FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id) on DELETE CASCADE,
FOREIGN KEY (Isbn_book) REFERENCES books(ISBN) on DELETE CASCADE
);

--Create table "ReturnStatus"
DROP TABLE IF EXISTS ReturnStatus;
CREATE TABLE ReturnStatus
(
Return_id VARCHAR(10) PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(80),
Return_date DATE,
isbn_book2 VARCHAR(25),
FOREIGN KEY (isbn_book2) REFERENCES books(ISBN) on DELETE CASCADE
);

\dt;


INSERT INTO Branch (Branch_no, Manager_id, Branch_address, Contact_no)
VALUES
('B007', 'M007', '789 Oak St', '+1122334455'),
('B008', 'M008', '456 Pine St', '+9988776655'),
('B009', 'M009', '123 Maple St', '+1122334466'),
('B010', 'M010', '789 Elm St', '+9988776677'),
('B011', 'M011', '456 Cedar St', '+1122334488'),
('B012', 'M012', '123 Walnut St', '+9988776699'),
('B013', 'M013', '789 Birch St', '+1122334477'),
('B014', 'M014', '456 Spruce St', '+9988776644');

SELECT * FROM branch;

INSERT INTO Employee (Emp_id, Emp_name, Position, Salary)
VALUES
('E007', 'David Johnson', 'Assistant Manager', 40000.00),
('E008', 'Jessica Brown', 'Sales Associate', 30000.00),
('E009', 'Michael Williams', 'Cashier', 25000.00),
('E010', 'Sarah Smith', 'Manager', 50000.00),
('E011', 'Christopher Davis', 'Sales Associate', 30000.00),
('E012', 'Ashley Wilson', 'Cashier', 25000.00),
('E013', 'Matthew Martinez', 'Assistant Manager', 40000.00),
('E014', 'Amanda Jones', 'Sales Associate', 30000.00),
('E015', 'James Garcia', 'Cashier', 25000.00),
('E016', 'Emily Rodriguez', 'Manager', 50000.00);

SELECT * FROM employee;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
('C007', 'John Doe', '123 Main St', '2023-01-05'),
('C008', 'Jane Smith', '456 Elm St', '2023-02-10'),
('C009', 'Michael Johnson', '789 Oak St', '2023-03-15'),
('C010', 'Emily Brown', '101 Pine St', '2023-04-20'),
('C011', 'Christopher Davis', '123 Maple St', '2023-05-25'),
('C012', 'Ashley Wilson', '456 Cedar St', '2023-06-30'),
('C013', 'Matthew Martinez', '789 Elm St', '2023-07-05'),
('C014', 'Amanda Jones', '101 Walnut St', '2023-08-10'),
('C015', 'James Garcia', '123 Birch St', '2023-09-15'),
('C016', 'Emily Rodriguez', '456 Spruce St', '2023-10-20'),
('C017', 'Daniel Taylor', '789 Pine St', '2023-11-25'),
('C018', 'Olivia Martinez', '101 Cedar St', '2023-12-30');

SELECT * FROM customer;
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('9780307474278', 'The Goldfinch', 'Fiction', 20.99, 'Yes', 'Donna Tartt', 'Little, Brown and Company'),
('9780316015844', 'The Catcher in the Rye', 'Fiction', 16.99, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
('9780679764029', 'Into the Wild', 'Biography', 14.99, 'Yes', 'Jon Krakauer', 'Anchor Books'),
('9780671027346', 'Angela''s Ashes', 'Biography', 12.99, 'Yes', 'Frank McCourt', 'Scribner'),
('9780451524935', '1984', 'Classic', 10.99, 'Yes', 'George Orwell', 'Signet Classic'),
('9780141439563', 'Jane Eyre', 'Classic', 11.99, 'Yes', 'Charlotte Brontë', 'Penguin Classics'),
('9780743273564', 'The Da Vinci Code', 'Mystery', 14.99, 'Yes', 'Dan Brown', 'Anchor'),
('9780142410399', 'The Book Thief', 'Historical Fiction', 13.99, 'Yes', 'Markus Zusak', 'Knopf Books for Young Readers'),
('9780140449297', 'Pride and Prejudice', 'Classic', 9.99, 'Yes', 'Jane Austen', 'Penguin Classics'),
('9780316769488', 'The Catcher in the Rye', 'Fiction', 12.99, 'Yes', 'J.D. Salinger', 'Back Bay Books'),
('9780385484511', 'To Kill a Mockingbird', 'Fiction', 11.99, 'Yes', 'Harper Lee', 'Harper Perennial'),
('9780679746041', 'Midnight''s Children', 'Fiction', 13.99, 'Yes', 'Salman Rushdie', 'Random House'),
('9780802138251', 'The Shipping News', 'Fiction', 10.99, 'Yes', 'Annie Proulx', 'Scribner'),
('9780547928210', 'The Hobbit', 'Fantasy', 14.99, 'Yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt'),
('9780007491568', 'A Game of Thrones', 'Fantasy', 18.99, 'Yes', 'George R.R. Martin', 'Harper Voyager'),
('9780345538376', 'The Night Circus', 'Fantasy', 16.99, 'Yes', 'Erin Morgenstern', 'Anchor'),
('9780812976717', 'Water for Elephants', 'Historical Fiction', 13.99, 'Yes', 'Sara Gruen', 'Algonquin Books'),
('9780060959039', 'The Secret Life of Bees', 'Fiction', 11.99, 'Yes', 'Sue Monk Kidd', 'Penguin Books'),
('9780316055437', 'The Help', 'Historical Fiction', 12.99, 'Yes', 'Kathryn Stockett', 'Berkley Books'),
('9780143105426', 'The Road', 'Fiction', 14.99, 'Yes', 'Cormac McCarthy', 'Vintage Books'),
('9780262033848', 'Artificial Intelligence: A Modern Approach', 'Computer Science', 39.99, 'Yes', 'Stuart Russell', 'Prentice Hall');


SELECT * FROM books;

UPDATE books SET status = 'No' WHERE isbn in ('9780307588371','9780141441716','9780743273571');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
('IS007', 'C007', 'The Road', '2023-05-01', '9780143105426'),
('IS008', 'C008', 'Artificial Intelligence: A Modern Approach', '2023-05-02', '9780262033848'),
('IS009', 'C009', 'Water for Elephants', '2023-05-03', '9780812976717'),
('IS010', 'C010', 'To Kill a Mockingbird', '2023-05-04', '9780385484511'),
('IS011', 'C011', '1984', '2023-05-05', '9780451524935'),
('IS012', 'C012', 'The Goldfinch', '2023-05-06', '9780307474278');

SELECT * FROM issuestatus;

SELECT * FROM issuestatus;

INSERT INTO ReturnStatus (Return_id, Return_cust, Return_book_name, Return_date, isbn_book2)
VALUES
('RS001', 'C007', 'The Road', '2023-06-01', '9780143105426'),
('RS002', 'C008', 'Artificial Intelligence: A Modern Approach', '2023-06-02', '9780262033848'),
('RS003', 'C010', 'To Kill a Mockingbird', '2023-06-03', '9780385484511'),
('RS004', 'C011', '1984', '2023-06-04', '9780451524935'),
('RS005', 'C012', 'The Goldfinch', '2023-06-05', '9780307474278');

SELECT * FROM returnstatus;



/*Queries*/


SELECT book_title, category, rental_price FROM books WHERE Status = 'Yes';


SELECT emp_name, salary FROM employee ORDER BY Salary;
SELECT issuestatus.Issued_book_name, customer.Customer_name FROM issuestatus INNER JOIN
customer on issuestatus.Issued_cust = customer.Customer_Id;


SELECT Category, COUNT(Book_title) FROM books GROUP BY Category;


SELECT emp_name, position FROM employee WHERE Salary > 30000;

SELECT customer_name FROM customer WHERE Reg_date < '2023-11-25' AND Customer_Id NOT IN
(SELECT issued_cust FROM issuestatus);


ALTER TABLE employee ADD COLUMN branch_no VARCHAR(50);

UPDATE employee SET branch_no = 'B007' WHERE emp_id ='E007';
UPDATE employee SET branch_no = 'B008' WHERE emp_id ='E008';
UPDATE employee SET branch_no = 'B009' WHERE emp_id ='E009';
UPDATE employee SET branch_no = 'B010' WHERE emp_id ='E010';
UPDATE employee SET branch_no = 'B011' WHERE emp_id ='E011';
UPDATE employee SET branch_no = 'B012' WHERE emp_id ='E012';
UPDATE employee SET branch_no = 'B013' WHERE emp_id ='E013';
UPDATE employee SET branch_no = 'B014' WHERE emp_id ='E014';
UPDATE employee SET branch_no = 'B015' WHERE emp_id ='E015';
UPDATE employee SET branch_no = 'B016' WHERE emp_id ='E016';


SELECT * FROM employee;

SELECT branch_no, COUNT(emp_id) FROM employee GROUP BY branch_no;


SELECT customer.Customer_name FROM customer INNER JOIN issuestatus ON 
customer.Customer_Id = issuestatus.Issued_cust WHERE issuestatus.Issue_date >= '2023-05-01' AND 
issuestatus.Issue_date <= '2023-05-03';


SELECT book_title FROM books WHERE Category = 'Fiction';


SELECT branch_no, COUNT(Emp_id) AS EmployeeCount
FROM Employee
GROUP BY branch_no
HAVING COUNT(Emp_id) >1;



