-- Creates Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Inserts sample data into the Departments
INSERT INTO 
	Departments (name)  
VALUES 
('Computer Science'),
('Mathematics'),
('Physics');

-- Creates Students Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Inserts sample data into Students table
INSERT INTO 
	Students(first_name, last_name, email, date_of_birth, department_id) 
VALUES 
('John', 'Doe', 'john.doe@example.com', '2000-05-15', 1),
('Jane', 'Smith', 'jane.smith@example.com', '1999-11-20', 2),
('Mike', 'Brown', 'mike.brown@example.com', '2001-02-10', 3);

-- Create Instructors Table
CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Inserts sample data into the Instructors table
INSERT INTO 
	Instructors(name, email, department_id) 
VALUES 
('Alice Johnson', 'alice.johnson@example.com', 1),
('Bob Smith', 'bob.smith@example.com', 2),
('Carol Lee', 'carol.lee@example.com', 3);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    department_id INT,
    instructor_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- Inserts sample data into the Courses table
INSERT INTO 
	Courses(course_name, credits, department_id, instructor_id) 
VALUES 
('Intro to Programming', 3, 1, 1),
('Calculus I', 4, 2, 2),
('Quantum Mechanics', 3, 3, 3);

-- Creates Enrollments Table for the (Many-to-Many relationship between Students and Courses)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE(student_id, course_id)  -- Prevents duplicate enrollments
);

-- Inserts sample data into the Enrollments table
INSERT INTO 
	Enrollments(student_id, course_id, enrollment_date, grade) 
VALUES 
(1, 1, '2024-01-10', 'A'),
(2, 2, '2024-01-12', 'B'),
(3, 3, '2024-01-15', 'A'),
(1, 2, '2024-01-18', 'C');
