CREATE TABLE Student(
    student_id INT,
	name VARCHAR(10),
	department VARCHAR(10),
	cgpa FLOAT
);

INSERT INTO Student
VALUES(101,'Rahim','CSE',3.80);
INSERT INTO Student
VALUES(102,'Karim','EEE',3.50);
INSERT INTO Student
VALUES(103,'Nila','CSE',3.90);
COMMIT;
--SQL : Structured Query Language
--SQL is used to communicate with relational database.
SELECT * FROM Student 
WHERE department = 'CSE';

SELECT name , cgpa 
FROM student;