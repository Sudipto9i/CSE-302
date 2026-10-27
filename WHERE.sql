DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;

CREATE TABLE STUDENT(
    StudentID INT,
	Name VARCHAR(10),
	DeptID INT,
	Marks INT
);

CREATE TABLE DEPARTMENT(
    DeptID INT,
	DeptName VARCHAR(20)
);


INSERT INTO STUDENT VALUES (1,'Rahim',10,85);
INSERT INTO STUDENT VALUES (2,'Karim',20,65);
INSERT INTO STUDENT VALUES (3,'Nila',10,90);
INSERT INTO STUDENT VALUES (4,'Sakib',30,55);
INSERT INTO STUDENT VALUES (5,'Mina',20,75);

INSERT INTO DEPARTMENT VALUES(103,'CSE');
INSERT INTO DEPARTMENT VALUES(104,'EEE');
INSERT INTO DEPARTMENT VALUES(105,'BBA');


-- Practice 1 : Easy
-- Task: Display the names and marks of students whose marks are greater than 70.
-- Think about which condition you should write after WHERE.
SELECT Name , Marks
FROM STUDENT
WHERE Marks>70;

-- Practice 2 — Medium
-- Use the same STUDENT table.

-- Task: Display all columns of students who belong to department 10 
-- and have marks greater than or equal to 85.
SELECT Name
FROM STUDENT
WHERE DeptID = 10 AND Marks >= 85;

-- Practice 3 — Hard
-- Use the same STUDENT table.

-- Task: Display the names and marks of students who satisfy either condition:
-- - Their department ID is 10, or
-- - Their marks are less than 60.
--Sort the result by marks from highest to lowest.
SELECT Name , Marks 
FROM STUDENT
WHERE DeptID = 10 OR Marks > 60
ORDER BY Marks DESC;

-- To find students with no matching department:
-- WHERE NULL PRACTICE:
-- NULL values
-- NULL means a value is missing, unknown or not applicable.
-- It is not the same as zero or an empty string.
SELECT s.*
FROM  STUDENT s 
LEFT JOIN DEPARTMENT d 
    ON s.DeptID = d. DeptID
WHERE d.DeptID IS NOT NULL;

-- Remember these exam points:
-- - COUNT(*) counts rows.
-- - COUNT(Marks) counts rows where Marks is not NULL.
-- - Most aggregate functions ignore NULL values.
-- - Use COALESCE(Marks, 0) when you intentionally want 
-- NULL to be treated as zero.