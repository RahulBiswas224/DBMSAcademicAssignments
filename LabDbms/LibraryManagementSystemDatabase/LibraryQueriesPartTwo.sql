-- Library Management System: Part-II Queries

-- 1. List various CATEGORIES and COUNT OF BOOKS in each category.
SELECT Category, COUNT(*) FROM BOOKS GROUP BY Category;

-- 2. List BOOK_NO and the NUMBER OF TIMES issued in descending order of count.
SELECT Book_No, COUNT(*) AS Issue_Count 
FROM ISSUE 
GROUP BY Book_No 
ORDER BY Issue_Count DESC;

-- 3. Display MEMBER ID and NO OF BOOKS for each member that has issued more than 1 book.
SELECT Member_Id, COUNT(*) 
FROM ISSUE 
GROUP BY Member_Id 
HAVING COUNT(*) > 1;

-- 4. Display MEMBER ID, BOOK NO and NO OF TIMES the same book is issued by the MEMBER.
SELECT Member_Id, Book_No, COUNT(*) AS Times_Issued 
FROM ISSUE 
GROUP BY Member_Id, Book_No 
ORDER BY Times_Issued DESC;

-- 5. Select all information of Book with 2nd Maximum Cost.
SELECT * FROM BOOKS 
WHERE Cost = (SELECT MAX(Cost) FROM BOOKS WHERE Cost < (SELECT MAX(Cost) FROM BOOKS));

-- 6. Copy the MEMBER, BOOKS and ISSUE tables to _COPY tables.
CREATE TABLE MEMBER_COPY AS SELECT * FROM Member;
CREATE TABLE BOOKS_COPY AS SELECT * FROM BOOKS;
CREATE TABLE ISSUE_COPY AS SELECT * FROM ISSUE;

-- 7. Create QUERY1 with BOOK_NO and ISSUE_DATE from ISSUE table.
CREATE TABLE QUERY1 AS SELECT Book_No, Issue_Date FROM ISSUE;

-- 8. Create QUERY2 with BOOK_NAME, AUTHOR_NAME and COST where cost > 300.
CREATE TABLE QUERY2 AS SELECT Book_Name, Author_name, Cost FROM BOOKS WHERE Cost > 300;

-- 9. Insert remaining records (cost < 300) to QUERY2 table.
INSERT INTO QUERY2 SELECT Book_Name, Author_name, Cost FROM BOOKS WHERE Cost < 300;

-- 10. ADD attribute AVAILABLE to BOOKS_COPY and fill it.
ALTER TABLE BOOKS_COPY ADD Available NUMBER(5);
-- Assuming 'Available' is a placeholder for stock count
UPDATE BOOKS_COPY SET Available = 1; 

-- 11. Change Data type of CATEGORY to VARCHAR2(15) in BOOKS_COPY.
ALTER TABLE BOOKS_COPY MODIFY Category VARCHAR2(15);