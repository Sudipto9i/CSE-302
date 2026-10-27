-- SQL --> Structured Query Language 
-- 1. Introduction to SQL
-- 2. DDL-> Data Definition Language --> CREATE , ALTER , DROP , TRUNCATE
-- 3. DML-> Data Manipulation Language --> INSERT , UPDATE , DELETE
-- 4. DQL-> Data Query Language ->Retrive Data--> SELECT
-- 5. JOIN
-- 6. NATURAL JOIN
-- PART 1 -> What is SQL?
-- SQL --> Structured Query Language 
-- SQL is used to communicate  with relational  database.
-- 1. Create the table
CREATE TABLE Student (
    student_id INT,
    student_name VARCHAR(20), -- Fixed syntax error and expanded size for full names
    department VARCHAR(10),
    cgpa DECIMAL(3,2),
	s_date DATE
);

-- 2. Insert the records
INSERT INTO Student VALUES (101, 'Rahim', 'CSE', 3.80,'2026-10-04','10:30:00',TO_DATE('2026-10-04 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Student VALUES (102, 'Karim', 'EEE', 3.50,'2026-10-05','10:20:00',TO_DATE('2026-10-05 10:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Student VALUES (103, 'Nila', 'CSE', 3.90,'2026-12-16','10:30:58',TO_DATE('2026-12-16 10:30:58', 'YYYY-MM-DD HH24:MI:SS'));


-- 3. Apply Condition
SELECT * FROM Student 
WHERE department = 'CSE';
-- PART 2 --> SQL vs Database
-- Database --> A database stores [organized data].
-- Table --> A table stores [related information].
-- Row --> [One complete record].
-- Column --> [One type of information].
-- DDL --> Data Definition Language --> Structure --> CREATE , ALTER , DROP , TRUNCATE
-- DML --> Data Manipulation Language --> Modify Data --> INSERT , UPDATE , DELETE 
-- DQL --> Data Query Language --> Retrive Data --> SELECT 

-- 4. UPDATE USING CONDITION
UPDATE Student 
SET cgpa = 3.90
WHERE student_id = 103;
COMMIT;
-- DATE --> Date --> '2026-10-04'
-- TIME --> Time --> '10:30:00'

