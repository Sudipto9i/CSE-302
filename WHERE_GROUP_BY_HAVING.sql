DROP TABLE ENROLLMENT CASCADE CONSTRAINTS;

-- CREATING ENROLLMENT TABLE
CREATE TABLE ENROLLMENT(
    StudentID INT,
	StudentName VARCHAR(30),
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

COMMIT;

SELECT * FROM ENROLLMENT;

-- Understand GROUP BY
-- Think of GROUP BY as putting students into separate boxes based on their course.
SELECT CourseID, AVG(Marks) AS AvgMarks
FROM ENROLLMENT
GROUP BY CourseID;

-- Understand WHERE — filter individual rows
-- Suppose you want to calculate the average for each course 
-- using only students who scored at least 80.
SELECT CourseID , AVG(Marks) AvgMarks
FROM ENROLLMENT
WHERE Marks>=80
GROUP BY CourseID;

-- Understand HAVING — filter groups
-- Now your teacher asks: Show only courses whose average mark is at least 80.
SELECT CourseID, AVG(Marks) AvgMarks
FROM ENROLLMENT
GROUP BY CourseID
HAVING AVG(Marks)>=80;

-- Question-1: Find the average marks for each course.
SELECT CourseID , AVG(Marks) AvgMarks
FROM ENROLLMENT
GROUP BY CourseID;

-- Question 2: Calculate the average marks for each course, 
-- considering only students who scored at least 75.
SELECT CourseID , AVG(Marks) AVGMarks
FROM ENROLLMENT
WHERE Marks>=75
GROUP BY CourseID;

--Question 3: Find courses whose average mark is at least 80,
--but calculate the average using only students who scored at least 75.
SELECT CourseID, AVG(Marks)AvgMarks
FROM ENROLLMENT
WHERE Marks>=75
GROUP BY CourseID
HAVING AVG(Marks)>=80;
-- WHERE filters rows before grouping.
-- HAVING filters groups after grouping.