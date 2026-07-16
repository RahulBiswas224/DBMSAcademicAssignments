-- (a) Find the ground of the matches batted by player whose Fname is starting from ‘S’.
SELECT DISTINCT M.Ground 
FROM MATCH M 
JOIN BATTING B ON M.Match_Id = B.Match_Id 
JOIN PLAYER P ON B.Player_Id = P.Player_Id 
WHERE P.Fname LIKE 'S%';

-- (b) Find Id’s of player that have bowled in the match 2576 but not have batted.
SELECT Player_Id FROM BOWLING WHERE Match_Id = 2576
EXCEPT
SELECT Player_Id FROM BATTING WHERE Match_Id = 2576;

-- (c) Find the batting average of each Indian player along with the Player_Id
SELECT Player_Id, AVG(Nrun_sc) AS Batting_Average 
FROM BATTING 
WHERE Player_Id IN (SELECT Player_Id FROM PLAYER WHERE Country = 'India')
GROUP BY Player_Id;

-- (d) Find the name of that player who has bowled highest number of overs and also find the ground where he has bowled.
SELECT P.Fname, M.Ground 
FROM PLAYER P 
JOIN BOWLING B ON P.Player_Id = B.Player_Id 
JOIN MATCH M ON B.Match_Id = M.Match_Id 
WHERE B.Novers = (SELECT MAX(Novers) FROM BOWLING);

-- 2. a) Find the total run scored by a player who played First Test in 1991.
SELECT SUM(B.Nrun_sc) 
FROM BATTING B 
JOIN PLAYER P ON B.Player_Id = P.Player_Id 
WHERE P.Ftest = 1991;

-- 2. b) Find the name and the number of wickets taken by the youngest player in the data base.
SELECT P.Fname, B.Nwickets 
FROM PLAYER P 
JOIN BOWLING B ON P.Player_Id = B.Player_Id 
WHERE P.Yborn = (SELECT MAX(Yborn) FROM PLAYER);

-- 2. c) Find the names of the players who batted in only one match.
SELECT P.Fname 
FROM PLAYER P 
JOIN BATTING B ON P.Player_Id = B.Player_Id 
GROUP BY P.Player_Id, P.Fname 
HAVING COUNT(B.Match_Id) = 1;

-- 2. d) Find the name of the player who has taken the highest wickets in a particular match and also find the ground where the player has taken the wickets.
SELECT P.Fname, M.Ground 
FROM PLAYER P 
JOIN BOWLING B ON P.Player_Id = B.Player_Id 
JOIN MATCH M ON B.Match_Id = M.Match_Id 
WHERE B.Nwickets = (SELECT MAX(Nwickets) FROM BOWLING);

-- 3. a) Find the ground where Sachin Tendulkar has scored his highest run.
SELECT M.Ground 
FROM MATCH M 
JOIN BATTING B ON M.Match_Id = B.Match_Id 
JOIN PLAYER P ON B.Player_Id = P.Player_Id 
WHERE P.Fname = 'Sachin' AND P.Lname = 'Tendulkar' 
ORDER BY B.Nrun_sc DESC LIMIT 1;

-- 3. b) Find out the name of a Srilankan bowler who has delivered at least 2 maiden overs.
SELECT DISTINCT P.Fname 
FROM PLAYER P 
JOIN BOWLING B ON P.Player_Id = B.Player_Id 
WHERE P.Country = 'Srilanka' AND B.Maidens >= 2;

-- 3. c) Find the Number of wickets of that player whose Birth place is Mattumagala.
SELECT SUM(B.Nwickets) 
FROM BOWLING B 
JOIN PLAYER P ON B.Player_Id = P.Player_Id 
WHERE P.Bplace = 'Mattumagala';

-- 3. d) Find the names of the players who played in more than one match.
SELECT P.Fname 
FROM PLAYER P 
JOIN BATTING B ON P.Player_Id = B.Player_Id 
GROUP BY P.Player_Id, P.Fname 
HAVING COUNT(B.Match_Id) > 1;