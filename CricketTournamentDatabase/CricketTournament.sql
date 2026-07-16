-- 1. Create Tables
CREATE TABLE MATCH (
    Match_Id INT PRIMARY KEY,
    Team1 VARCHAR(50),
    Team2 VARCHAR(50),
    Ground VARCHAR(50),
    Play_Date DATE,
    Winner VARCHAR(50)
);

CREATE TABLE PLAYER (
    Player_Id INT PRIMARY KEY,
    Lname VARCHAR(50),
    Fname VARCHAR(50),
    Country VARCHAR(50),
    Yborn INT,
    Bplace VARCHAR(50),
    Ftest INT
);

CREATE TABLE BOWLING (
    Match_Id INT,
    Player_Id INT,
    Novers INT,
    Maidens INT,
    Nrun_rev INT,
    Nwickets INT,
    FOREIGN KEY (Match_Id) REFERENCES MATCH(Match_Id),
    FOREIGN KEY (Player_Id) REFERENCES PLAYER(Player_Id)
);

CREATE TABLE BATTING (
    Match_Id INT,
    Player_Id INT,
    Nrun_sc INT,
    FOREIGN KEY (Match_Id) REFERENCES MATCH(Match_Id),
    FOREIGN KEY (Player_Id) REFERENCES PLAYER(Player_Id)
);

-- 2. Insert Data
INSERT INTO MATCH VALUES (2475, 'Austrilia', 'India', 'Melbourn', '2008-02-10', 'Team2');
INSERT INTO MATCH VALUES (2576, 'India', 'Srilanka', 'Adeliaide', '2008-02-19', 'Team 1');
INSERT INTO MATCH VALUES (2677, 'Austrilia', 'India', 'Sydney', '2008-03-02', 'Team1');
INSERT INTO MATCH VALUES (2778, 'Austrilia', 'Srilanka', 'Brisbane', '2008-03-04', 'Team2');
INSERT INTO MATCH VALUES (2879, 'Srilanka', 'India', 'Colombo', '2008-08-27', 'Team2');

INSERT INTO PLAYER VALUES (49001, 'Tendulkar', 'Sachin', 'India', 1973, 'Mumbai', 1986);
INSERT INTO PLAYER VALUES (49002, 'Dravid', 'Rahul', 'India', 1973, 'Indore', 1996);
INSERT INTO PLAYER VALUES (59001, 'Vass', 'Chaminda', 'Srilanka', 1974, 'Mattumagala', 1994);
INSERT INTO PLAYER VALUES (59002, 'Jayasuriya', 'Sanath', 'Srilanka', 1969, 'Matara', 1991);
INSERT INTO PLAYER VALUES (69001, 'Lee', 'Brett', 'Austrilia', 1976, 'Wollongong', 1999);
INSERT INTO PLAYER VALUES (69002, 'Symonds', 'Andrew', 'Austrilia', 1975, 'Birminghum', 2004);

INSERT INTO BOWLING VALUES (2576, 59001, 8, 3, 58, 1);
INSERT INTO BOWLING VALUES (2677, 69001, 10, 1, 27, 3);
INSERT INTO BOWLING VALUES (2879, 49002, 7, 0, 44, 0);
INSERT INTO BOWLING VALUES (2576, 49001, 3, 2, 15, 1);
INSERT INTO BOWLING VALUES (2778, 59001, 7, 1, 20, 5);

INSERT INTO BATTING VALUES (2677, 49001, 60);
INSERT INTO BATTING VALUES (2778, 59002, 71);
INSERT INTO BATTING VALUES (2879, 59001, 60);
INSERT INTO BATTING VALUES (2778, 69002, 17);
INSERT INTO BATTING VALUES (2879, 59002, 45);
INSERT INTO BATTING VALUES (2576, 49001, 36);
INSERT INTO BATTING VALUES (2475, 49002, 72);