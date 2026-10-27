-- NATURAL JOIN
-- Automatically joins on all identically named columns and returns one copy of each common join column.
-- CAUTION: NATURAL JOIN uses every same-named column, 
-- which may not be what you intend. 
-- Explicit JOIN ... ON is often safer.
DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE ENROLLMENT CASCADE CONSTRAINTS;

-- 1. CREATE TABLE STUDENT
CREATE TABLE STUDENT(
    StudentID INT,
    StudentName VARCHAR(10)
);

-- 2. CREATE TABLE DEPARTMENT 
CREATE TABLE DEPARTMENT(
    DeptID INT,
	DeptName VARCHAR(10)
);

-- 3. CREATE TABLE EMPLOYEE
CREATE TABLE EMPLOYEE(
    EmpID INT,
	EmpName VARCHAR(20),
	DeptID INT,
	Salary INT
);

-- 4. CREATE TABLE ENROLLMENT
CREATE TABLE ENROLLMENT(
    StudentID INT,
	CourseID INT,
	Marks INT
);

-- Practice ->1:INSERT VALUES INTO STUDENT
-- INSERT INTO STUDENT VALUES(1,'Rahim',10);
-- INSERT INTO STUDENT VALUES(2,'Karim',20);
-- INSERT INTO STUDENT VALUES(3,'Nila',30);
-- INSERT INTO STUDENT VALUES(4,'Sakib',10);

-- Practice ->2:INSERT VALUES INTO DEPARTMENT
-- INSERT INTO DEPARTMENT VALUES( 10 , 'CSE');
-- INSERT INTO DEPARTMENT VALUES( 20 , 'EEE');
-- INSERT INTO DEPARTMENT VALUES( 40 , 'BBA');

-- Practice 1 — Student and Department (Easy)
-- Goal: Display student names and department names.
-- Write a NATURAL JOIN query to display:
--   Name
--   DeptName
-- Then answer: How many rows will appear?

-- SELECT NAME , DeptName
-- FROM STUDENT
-- NATURAL JOIN DEPARTMENT;

-- Practice 2 —> Employee and Department (Medium)
-- Goal: Display employee names, salaries, and department names.

-- Practice ->2:INSERT VALUES INTO EMPLOYEE
-- INSERT INTO EMPLOYEE VALUES (101, 'Arif', 1, 30000);
-- INSERT INTO EMPLOYEE VALUES (102, 'Mina', 2, 40000);
-- INSERT INTO EMPLOYEE VALUES (103, 'Rafi', 3, 35000);
-- INSERT INTO EMPLOYEE VALUES (104, 'Tania', 2, 45000);
-- INSERT INTO EMPLOYEE VALUES (105, 'Joya', 5, 32000);

-- Practice ->2: INSERT VALUES INTO DEPARTMENT
-- INSERT INTO DEPARTMENT VALUES (1, 'HR');
-- INSERT INTO DEPARTMENT VALUES (2, 'IT');
-- INSERT INTO DEPARTMENT VALUES (3, 'Finance');
-- INSERT INTO DEPARTMENT VALUES (4, 'Marketing');

-- Answer these questions:
-- 1. How many rows will appear?
-- 2. Which employee will not appear?
-- 3. Why do Mina and Tania both appear?
-- SELECT EmpName , Salary , DeptName 
-- FROM EMPLOYEE
-- NATURAL JOIN DEPARTMENT;

-- Practice 3 — Student and Enrollment (Challenge)
-- Goal: Display student names and their enrolled course IDs.
INSERT INTO STUDENT VALUES (1, 'Rahim');
INSERT INTO STUDENT VALUES (2, 'Karim');
INSERT INTO STUDENT VALUES (3, 'Nila');
INSERT INTO STUDENT VALUES (4, 'Sakib');

INSERT INTO ENROLLMENT VALUES (1, 101, 85);
INSERT INTO ENROLLMENT VALUES (1, 102, 90);
INSERT INTO ENROLLMENT VALUES (2, 103, 75);
INSERT INTO ENROLLMENT VALUES (4, 101, 88);
INSERT INTO ENROLLMENT VALUES (5, 104, 70);
-- Step 2: Your task
-- Write a NATURAL JOIN query to display:
-- - StudentName
-- - CourseID
-- - Marks
-- Answer these questions:
--  1. How many rows will appear?
--  2. Why does Rahim appear twice?
--  3. Why doesn't StudentID 5 appear?
SELECT StudentName , CourseID , Marks
FROM STUDENT
NATURAL JOIN ENROLLMENT;