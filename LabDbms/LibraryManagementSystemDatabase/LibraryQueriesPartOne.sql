-- Library Management System: Part-I Queries

-- 1. Retrieve the Name of Book and Cost who has Maximum cost.
SELECT Book_Name, Cost FROM BOOKS WHERE Cost = (SELECT MAX(Cost) FROM BOOKS);

-- 2. Calculate the Minimum, Average, and Total cost value, with renamed attributes.
SELECT MIN(Cost) AS Min_Cost, AVG(Cost) AS Avg_Cost, SUM(Cost) AS Total_Cost FROM BOOKS;

-- 3. Retrieve Name and ID of Members who issued book between 26th Jan 2011 and 14th April 2011.
SELECT DISTINCT M.Member_Name, M.Member_Id 
FROM Member M JOIN ISSUE I ON M.Member_Id = I.Member_Id 
WHERE I.Issue_Date BETWEEN '26-Jan-11' AND '14-Apr-11';

-- 4. Retrieve Book Name, Author Name and Category where Category is not 'Others'.
SELECT Book_Name, Author_name, Category FROM BOOKS WHERE Category != 'Others';

-- 5. Retrieve Book name and Author Name where 5th letter of Author name is 't'.
SELECT Book_Name, Author_name FROM BOOKS WHERE SUBSTR(Author_name, 5, 1) = 't';

-- 6. How many Books are available whose Cost is greater than 350.
SELECT COUNT(*) FROM BOOKS WHERE Cost > 350;

-- 7. How many different Authors name are available in BOOKS table.
SELECT COUNT(DISTINCT Author_name) FROM BOOKS;

-- 8. Numeric functions
SELECT ABS(-167) FROM DUAL;           -- a
SELECT POWER(8, 6) FROM DUAL;         -- b
SELECT ROUND(134.56789, 2) FROM DUAL; -- c
SELECT SQRT(144) FROM DUAL;           -- d
SELECT FLOOR(13.15), CEIL(13.15) FROM DUAL; -- e

-- 9. Extract Year, Month, Day from System Date.
SELECT EXTRACT(YEAR FROM SYSDATE), EXTRACT(MONTH FROM SYSDATE), EXTRACT(DAY FROM SYSDATE) FROM DUAL;

-- 10. Greatest value between 4, 5 and 17.
SELECT GREATEST(4, 5, 17) FROM DUAL;

-- 11. Least value between 4, 5 and 17.
SELECT LEAST(4, 5, 17) FROM DUAL;

-- 12. Extract 4 letters from 3rd position of 'INFOSYS'.
SELECT SUBSTR('INFOSYS', 3, 4) FROM DUAL;

-- 13. ASCII value of 'a' and 'S'.
SELECT ASCII('a'), ASCII('S') FROM DUAL;

-- 14. Length of 'INFOSYS' AND change 'S' with 'T'.
SELECT LENGTH('INFOSYS'), REPLACE('INFOSYS', 'S', 'T') FROM DUAL;

-- 15. Members who belong to Kolkata.
SELECT Member_Name, Member_address FROM Member WHERE Member_address = 'Kolkata';

-- 16. Books where Cost is between 300 and 500.
SELECT Book_Name FROM BOOKS WHERE Cost BETWEEN 300 AND 500;

-- 17. Members with "Half Yearly" membership type.
SELECT Member_Name FROM Member WHERE Membership_type = 'Half Yearly';

-- 18. Members who opened account in 2011.
SELECT Member_Name FROM Member WHERE EXTRACT(YEAR FROM Acc_Open_Date) = 2011;

-- 19. Penalty Amount of Members who took "Let us C".
SELECT M.Penalty_Amount FROM Member M JOIN ISSUE I ON M.Member_Id = I.Member_Id 
JOIN BOOKS B ON I.Book_No = B.Book_No WHERE B.Book_Name = 'Let us C';

-- 20. Max books allowed to a Member who issued books in January.
SELECT DISTINCT M.Max_Books_Allowed FROM Member M JOIN ISSUE I ON M.Member_Id = I.Member_Id 
WHERE EXTRACT(MONTH FROM I.Issue_Date) = 1;

-- 21. Members who have not issued any books.
SELECT Member_Name FROM Member WHERE Member_Id NOT IN (SELECT Member_Id FROM ISSUE);

-- 22. Name and Category of books whose cost is not recorded (NULL check).
SELECT Book_Name, Category FROM BOOKS WHERE Cost IS NULL;

-- 23. Books written by "Loni" with Price < 600.
SELECT Book_Name FROM BOOKS WHERE Author_name = 'Loni' AND Cost < 600;

-- 24. Issue details for Books not returned yet (Assuming Return date is same as Issue date when not returned).
SELECT * FROM ISSUE WHERE Issue_Date = Return_date;

-- 25. Books belonging to Science or Database categories.
SELECT * FROM BOOKS WHERE Category IN ('Science', 'Database');

-- 26. Members in descending order of Penalty.
SELECT * FROM Member ORDER BY Penalty_Amount DESC;

-- 27. Books in ascending order of category and descending order of price.
SELECT * FROM BOOKS ORDER BY Category ASC, Cost DESC;

-- 28. Books that contain 'SQL' in the name.
SELECT * FROM BOOKS WHERE Book_Name LIKE '%SQL%';

-- 29. Members whose Name starts with S.
SELECT * FROM Member WHERE Member_Name LIKE 'S%';

-- 30. Members whose Name starts with S or A and contains T.
SELECT * FROM Member WHERE (Member_Name LIKE 'S%' OR Member_Name LIKE 'A%') AND Member_Name LIKE '%t%';

-- 31. Init Cap Book name and Upper Case Author in descending order of Book Name.
SELECT INITCAP(Book_Name), UPPER(Author_name) FROM BOOKS ORDER BY Book_Name DESC;

-- 32. Category mapping.
SELECT Book_Name, DECODE(Category, 'Database', 'D', 'Science', 'S', 'System', 'R', 'O') AS Category_Code FROM BOOKS;

-- 33. Members who became members in 2011.
SELECT * FROM Member WHERE EXTRACT(YEAR FROM Acc_Open_Date) = 2011;