-- What is a nested subquery?
-- A subquery is a SQL query inside another SQL query.
DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE ENROLLMENT CASCADE CONSTRAINTS;

CREATE TABLE STUDENT (
    StudentID NUMBER,
    StudentName VARCHAR2(30),
    DeptID NUMBER
);

CREATE TABLE DEPARTMENT (
    DeptID NUMBER,
    DeptName VARCHAR2(20)
);

CREATE TABLE ENROLLMENT(
    StudentID INT,
	StudentName VARCHAR(10),
	CourseID VARCHAR(10),
	Marks INT
);

INSERT INTO ENROLLMENT VALUES (1, 'Rahim', 'CSE101', 85);
INSERT INTO ENROLLMENT VALUES (2, 'Karim', 'CSE101', 70);
INSERT INTO ENROLLMENT VALUES (3, 'Nila',  'CSE101', 95);

INSERT INTO ENROLLMENT VALUES (4, 'Sakib', 'CSE102', 60);
INSERT INTO ENROLLMENT VALUES (5, 'Mina',  'CSE102', 80);
INSERT INTO ENROLLMENT VALUES (6, 'Rafi',  'CSE102', 70);

INSERT INTO ENROLLMENT VALUES (7, 'Joya',  'CSE103', 90);
INSERT INTO ENROLLMENT VALUES (8, 'Arif',  'CSE103', 85);
INSERT INTO ENROLLMENT VALUES (9, 'Tania', 'CSE103', 95);

INSERT INTO DEPARTMENT VALUES (10, 'CSE');
INSERT INTO DEPARTMENT VALUES (20, 'EEE');
INSERT INTO DEPARTMENT VALUES (30, 'BBA');
INSERT INTO DEPARTMENT VALUES (40, 'English');

INSERT INTO STUDENT VALUES (1, 'Rahim', 10);
INSERT INTO STUDENT VALUES (2, 'Karim', 20);
INSERT INTO STUDENT VALUES (3, 'Nila', 10);
INSERT INTO STUDENT VALUES (4, 'Sakib', 30);
INSERT INTO STUDENT VALUES (5, 'Mina', NULL);
INSERT INTO STUDENT VALUES (6, 'Rafi', 50);

COMMIT;

-- Think of it as asking two questions:
--  1. Inner query: Find the average marks.
--  2. Outer query: Find students whose marks are greater than that average.
SELECT StudentID, CourseID ,Marks
FROM ENROLLMENT
WHERE Marks>(
    SELECT AVG(Marks)
	FROM ENROLLMENT
);

-- Co-related subquery
SELECT e.StudentID, e.StudentName,e.CourseID,e.Marks
FROM ENROLLMENT e 
WHERE e.Marks>(
    SELECT AVG(e2.Marks)
	FROM ENROLLMENT e2
	WHERE e2.CourseID = e.CourseID
);
  
  
-- IN — Match any value in a list
-- Task: Find students who belong to a 
-- department that exists in the DEPARTMENT table.
SELECT StudentID, StudentName , DeptID 
FROM STUDENT
WHERE DeptID IN(
    SELECT DeptID
	FROM DEPARTMENT
)

-- EXISTS — Check whether a matching row exists
-- Task: Find students whose department has a matching record in DEPARTMENT.
SELECT s.StudentID,s.StudentName,s.DeptID
FROM STUDENT s 
WHERE EXISTS(
    SELECT 1
	FROM DEPARTMENT d 
	WHERE d.DeptID = s.DeptID
);
-- NOT EXISTS — Find rows with no match
-- Task: Find students whose department 
-- does not have a matching department record.
SELECT s.StudentID, s.StudentName,s.DeptID
FROM STUDENT s 
WHERE NOT EXISTS(
    SELECT 1
	FROM DEPARTMENT d 
	WHERE d.DeptID = s.DeptID
);
-- ALL — Compare with every value
-- Task: Find students 
-- whose marks are greater than every mark in CSE102.
SELECT StudentID,StudentName,Marks
FROM ENROLLMENT
WHERE Marks > ALL(
  SELECT Marks 
  FROM ENROLLMENT
  WHERE CourseID = 'CSE102'
);

-- For positive comparisons, you can remember:
-- - > ALL (...) means greater than every returned value.
-- - < ALL (...) means less than every returned value.

-- ANY or SOME — Compare with at least one value
SELECT StudentName , CourseID , Marks
FROM ENROLLMENT
WHERE Marks>ANY(
    SELECT Marks
	FROM ENROLLMENT
	WHERE CourseID = 'CSE102'
);

-- NOT IN and the NULL problem
SELECT StudentName 
FROM STUDENT
WHERE DeptID NOT IN(
    SELECT DeptID
	FROM DEPARTMENT
);

-- NOT EXIST USE MUCH MORE SAFER THAN NOT IN 
SELECT s.StudentName
FROM STUDENT s 
WHERE NOT EXISTS(
    SELECT 1 
	FROM DEPARTMENT d 
	WHERE d.DeptID = s.DeptID
);