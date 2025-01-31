SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM members;
SELECT * FROM return_status;


-- Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO books (isbn,book_title,category,rental_price,status,author,publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')
SELECT * FROM books;

-- Update an Existing Member's Address
UPDATE members
SET member_address = '185 jump St'
WHERE member_id = 'C108';
SELECT * FROM members;

-- Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
SELECT * FROM issued_status WHERE issued_id = 'IS121';
DELETE FROM issued_status WHERE issued_id = 'IS121';

-- Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';

-- List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT ist.issued_emp_id,e.emp_name,COUNT(ist.issued_id) AS issued_count
FROM issued_status AS ist
JOIN employees AS e
ON e.emp_id = ist.issued_emp_id
GROUP BY 1, 2
HAVING COUNT(ist.issued_id) > 1;


-- CTAS (Create Table As Select)
-- Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
CREATE TABLE book_cnts
AS    
SELECT b.isbn, b.book_title,
COUNT(ist.issued_id) as no_issued
FROM books as b
JOIN
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;

SELECT * FROM
book_cnts;

-- Retrieve All Books in a Specific Category:
SELECT * FROM books
WHERE category = 'Classic'

-- Find Total Rental Income by Category:
SELECT b.category, SUM(b.rental_price),COUNT(*)
FROM books as b
JOIN
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1

-- List Members Who Registered in the Last 180 Days:
SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180' DAY;

INSERT INTO members (member_id, member_name, member_address, reg_date)
VALUES
('C118', 'Sam', '145 Main St', '2024-06-01'),
('C119', 'John', '133 Main St', '2024-05-01');

-- List Employees with Their Branch Manager's Name and their branch details:
SELECT e1.*,b.manager_id,e2.emp_name as manager
FROM employees as e1
JOIN  
branch as b
ON b.branch_id = e1.branch_id
JOIN
employees as e2
ON b.manager_id = e2.emp_id

--Create a Table of Books with Rental Price Above a Certain Threshold 7USD:
CREATE TABLE books_price_greater_than_seven AS    
SELECT * FROM Books
WHERE rental_price > 7;

SELECT * FROM 
books_price_greater_than_seven


-- Retrieve the List of Books Not Yet Returned
SELECT DISTINCT ist.issued_book_name
FROM issued_status as ist
LEFT JOIN
return_status as rs
ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL;
  
SELECT * FROM return_status;





