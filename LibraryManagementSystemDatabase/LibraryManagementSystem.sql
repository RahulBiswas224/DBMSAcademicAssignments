-- Library Management System Database Setup
-- Academic Session: 2024-25

-- 1. Create Tables
CREATE TABLE Member (
    Member_Id NUMBER(5) PRIMARY KEY,
    Member_Name VARCHAR2(30) NOT NULL,
    Member_address VARCHAR2(50),
    Acc_Open_Date DATE,
    Membership_type VARCHAR2(20),
    Fees_paid NUMBER(4),
    Max_Books_Allowed NUMBER(2),
    Penalty_Amount NUMBER(7,2)
);

CREATE TABLE BOOKS (
    Book_No NUMBER(6) PRIMARY KEY,
    Book_Name VARCHAR2(30) NOT NULL,
    Author_name VARCHAR2(30),
    Cost NUMBER(7,2),
    Category CHAR(10)
);

CREATE TABLE ISSUE (
    Lib_Issue_Id NUMBER(10) PRIMARY KEY,
    Book_No NUMBER(6),
    Member_Id NUMBER(5),
    Issue_Date DATE,
    Return_date DATE,
    FOREIGN KEY (Book_No) REFERENCES BOOKS(Book_No),
    FOREIGN KEY (Member_Id) REFERENCES Member(Member_Id)
);

-- 2. Insert Data into Member
INSERT INTO Member VALUES (1, 'Sayantan Sinha', 'Pune', '10-Dec-10', 'Lifetime', 2000, 6, 50);
INSERT INTO Member VALUES (2, 'Abhirup Sarkar', 'Kolkata', '19-Jan-11', 'Annual', 1400, 3, 0);
INSERT INTO Member VALUES (3, 'Ritesh Bhuniya', 'Gujarat', '20-Feb-11', 'Quarterly', 350, 2, 100);
INSERT INTO Member VALUES (4, 'Paresh sen', 'Tripura', '21-Mar-11', 'Half yearly', 700, 1, 200);
INSERT INTO Member VALUES (5, 'Sohini Haldar', 'Birbhum', '11-Apr-11', 'Lifetime', 2000, 6, 10);
INSERT INTO Member VALUES (6, 'Suparna Biswas', 'Kolkata', '12-Apr-11', 'Half Yearly', 700, 1, 0);
INSERT INTO Member VALUES (7, 'Suranjana Basu', 'Purulia', '30-Jun-11', 'Annual', 1400, 3, 50);
INSERT INTO Member VALUES (8, 'Arpita Roy', 'Kolkata', '31-Jul-11', 'Half yearly', 700, 1, 0);

-- 3. Insert Data into BOOKS
INSERT INTO BOOKS VALUES (101, 'Let us C', 'Denis Ritchie', 450, 'Others');
INSERT INTO BOOKS VALUES (102, 'Oracle Complete Ref', 'Loni', 550, 'Database');
INSERT INTO BOOKS VALUES (103, 'Visual Basic 10', 'BPB', 700, 'Others');
INSERT INTO BOOKS VALUES (104, 'Mastering SQL', 'Loni', 450, 'Database');
INSERT INTO BOOKS VALUES (105, 'PL SQL-Ref', 'Scott Urman', 750, 'Database');
INSERT INTO BOOKS VALUES (106, 'UNIX', 'Sumitava Das', 300, 'System');
INSERT INTO BOOKS VALUES (107, 'Optics', 'Ghatak', 600, 'Science');
INSERT INTO BOOKS VALUES (108, 'Data Structure', 'G.S. Baluja', 350, 'Others');

-- 4. Insert Data into ISSUE
INSERT INTO ISSUE VALUES (7001, 101, 1, '10-Jan-11', '10-Jan-11');
INSERT INTO ISSUE VALUES (7002, 102, 2, '25-Jan-11', '29-Jan-11');
INSERT INTO ISSUE VALUES (7003, 104, 1, '01-Feb-11', '15-Mar-11');
INSERT INTO ISSUE VALUES (7004, 104, 2, '15-Mar-11', '04-Apr-11');
INSERT INTO ISSUE VALUES (7005, 101, 4, '04-Apr-11', '04-Apr-11');
INSERT INTO ISSUE VALUES (7006, 108, 5, '12-Apr-11', '01-Aug-11');
INSERT INTO ISSUE VALUES (7007, 101, 8, '01-Aug-11', '01-Aug-11');

COMMIT;