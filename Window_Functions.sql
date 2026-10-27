DROP TABLE ENROLLMENT CASCADE CONSTRAINTS;

-- CREATING ENROLLMENT TABLE
CREATE TABLE ENROLLMENT(
    StudentID INT,
	StudentName VARCHAR(10),
	CourseID VARCHAR(10),
	Marks INT
);

-- INSERTING VALUES INTO ENROLLMENT
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


-- RANK(): tied marks share a rank, and the next rank skips numbers.
-- DENSE_RANK(): tied marks share a rank, but the next rank does not skip numbers.
-- ROW_NUMBER(): every row receives a unique number, even when marks tie.

SELECT StudentName, CourseID, Marks,
    RANK() OVER(
	    ORDER BY Marks DESC
    )AS RNK,
    DENSE_RANK() OVER(
	    ORDER BY Marks DESC
    )AS DRNK,
    ROW_NUMBER() OVER(
	    ORDER BY Marks DESC, StudentID
    )AS RNUM
FROM ENROLLMENT;
-- PARTITION BY divides rows into groups.
-- ORDER BY determines the order within each group.
-- RANK() leaves gaps after ties.
-- DENSE_RANK() does not leave gaps.
-- ROW_NUMBER() assigns a different row number to each row.