-- 1. List books with exactly one available copy
SELECT * FROM Books
WHERE Available_Copies=1;

-- 2. List Authors whose name starts with a specific letter Eg:J
SELECT Author_Name  FROM Authors 
WHERE Author_Name LIKE 'J%;

-- 3. List Members with no address recorded
Select Member_Name FROM Members 
WHERE ADDRESS IS NULL;

-- 4.List Borrowings with a Specific Borrow date
SELECT * FROM Borrowings
WHERE Borrow_Date=TO_DATE('2025-10-01','YYYY-MM-DD');

-- 5.List books with a publication year after 2000
SELECT title FROM BOOKS
WHERE Publication_Year>2000;

-- 6. List Borrowings with no fines
SELECT * FROM Borrowings
WHERE fine =0;

-- 7. List members sorted by membership_date in descending order
SELECT Member_name FROM Members
ORDER BY Member_Name DESC;

-- 8. Count the total number of authors
SELECT COUNT(*) FROM Authors;

-- 9. list books with titles containing a specific word
SELECT title from Books
WHERE Title LIKE '%potter%';

-- 10. List the borrowing returned on specific date
SELECT COUNT(*) FROM Authors;

-- 11. List Members with specific area code in their phone 
SELECT * FROM Members
WHERE phone LIKE '111%';

-- 12. List books sorted by the title Alphabetically
SELECT * FROM books
ORDER BY title;

-- 13. Sum the total available copies across all the books
SELECT SUM(Available_copies) FROM books;


-- 14. List borrowings with due date in a specific month 
SELECT * FROM Borrowings
WHERE TO_CHAR(due_date,'YYYY-MM')='2025-10';

-- 15. list authors with names longer than 10 characters
SELECT * FROM Authors
WHERE LENGTH(Author_name)>10;

