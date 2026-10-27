DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE ENROLLMENT CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE COURSE CASCADE CONSTRAINTS;
-- 1. Student Table is created.
CREATE TABLE STUDENT(
    StudentID INT,
	Name VARCHAR(20),
	DeptID INT
);
-- 2. Department Table is created.
CREATE TABLE DEPARTMENT(
    DeptID INT,
	DeptName VARCHAR(20)
);
-- 3. Enrollment Table is created.
CREATE TABLE ENROLLMENT(
    StudentID INT,
	CourseID INT
);
-- 4. Employee Table is created.
CREATE TABLE EMPLOYEE(
    EmpID INT,
	EmpName VARCHAR(20),
	DeptID INT
);
-- 5. Course Table is created.
CREATE TABLE COURSE(
    CourseID INT,
	CourseName VARCHAR(20)
);

-- Insert data into the STUDENT table.
INSERT INTO STUDENT VALUES(1,'Rahim',10);
INSERT INTO STUDENT VALUES(2,'Karim',20);
INSERT INTO STUDENT VALUES(3,'Nila',30);
INSERT INTO STUDENT VALUES(4,'Sakib',10);

-- Insert data into the DEPARTMENT table.
-- INSERT INTO DEPARTMENT VALUES (10, 'CSE');
-- INSERT INTO DEPARTMENT VALUES (20, 'EEE');
-- INSERT INTO DEPARTMENT VALUES (30, 'BBA');

-- Insert data into EMPLOYEE table.
INSERT INTO EMPLOYEE VALUES(101,'Arif',1);
INSERT INTO EMPLOYEE VALUES(102,'Mina',2);
INSERT INTO EMPLOYEE VALUES(103,'Rafi',3);
INSERT INTO EMPLOYEE VALUES(104,'Tania',2);
INSERT INTO EMPLOYEE VALUES(105,'Joya',5);

-- For Practice Problem 2: Department Data Insert.
INSERT INTO DEPARTMENT VALUES(1,'HR');
INSERT INTO DEPARTMENT VALUES(2,'IT');
INSERT INTO DEPARTMENT VALUES(3,'Finance');
INSERT INTO DEPARTMENT VALUES(4,'Marketing');

-- For Practice Problem 3: COURSE Data Insert.
INSERT INTO COURSE VALUES(101,'Database');
INSERT INTO COURSE VALUES(102,'Java');
INSERT INTO COURSE VALUES(103,'Algorithms');

-- For Practice Problem 3: ENROLLMENT Data Insert.
INSERT INTO ENROLLMENT VALUES(1,101);
INSERT INTO ENROLLMENT VALUES(1,102);
INSERT INTO ENROLLMENT VALUES(2,103);
INSERT INTO ENROLLMENT VALUES(4,101);
INSERT INTO ENROLLMENT VALUES(5,102);

-- Practice 1->Task: Write an INNER JOIN query to display each student's name and department name.
-- INNER JOIN: Only Matching Rows.
-- SELECT s.name, d.DeptName
-- FROM STUDENT s
-- INNER JOIN DEPARTMENT d 
-- ON s.DeptID = d.DeptID;

-- Practice 2: Employee and Department(Medium)
SELECT e.EmpName , d.DeptName , e.EmpID
FROM EMPLOYEE e 
INNER JOIN DEPARTMENT d 
ON e.DeptID = d.DeptID;


-- Practice 3->Task: Write a query to display student names and their course names using two INNER JOINs.
SELECT s.Name, c.CourseName
FROM STUDENT s 
INNER JOIN ENROLLMENT e 
    ON s.StudentID = e.StudentID
INNER JOIN COURSE c 
    ON e.CourseID = c.CourseID;