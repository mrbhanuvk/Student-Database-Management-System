
-- Student Database Management System

-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15)
);

-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert sample data into Students
INSERT INTO Students VALUES (1, 'Alice', 20, 'Computer Science', 'Delhi', '9876543210');
INSERT INTO Students VALUES (2, 'Bob', 22, 'Electronics', 'Mumbai', '9123456780');
INSERT INTO Students VALUES (3, 'Charlie', 21, 'Mechanical', 'Pune', '9988776655');

-- Insert sample data into Courses
INSERT INTO Courses VALUES (101, 'DBMS', 4);
INSERT INTO Courses VALUES (102, 'Data Structures', 3);
INSERT INTO Courses VALUES (103, 'Operating Systems', 4);

-- Insert sample data into Enrollments
INSERT INTO Enrollments VALUES (1, 1, 101);
INSERT INTO Enrollments VALUES (2, 1, 102);
INSERT INTO Enrollments VALUES (3, 2, 101);
INSERT INTO Enrollments VALUES (4, 3, 103);

-- Feature 1: Add a new student
INSERT INTO Students VALUES (4, 'David', 23, 'Civil', 'Chennai', '9011223344');

-- Feature 2: Add a new course
INSERT INTO Courses VALUES (104, 'Computer Networks', 3);

-- Feature 3: Enroll student in a course
INSERT INTO Enrollments VALUES (5, 4, 104);

-- Feature 4: Retrieve student details with enrolled courses
SELECT s.student_id, s.name, s.department, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Feature 5: Update student info (address and phone)
UPDATE Students
SET address = 'Bangalore', phone = '9090909090'
WHERE student_id = 2;

-- Feature 6: Delete students who graduated (example: department = 'Mechanical')
DELETE FROM Students WHERE department = 'Mechanical';
