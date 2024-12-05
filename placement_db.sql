CREATE DATABASE placement_db;

USE placement_db;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    education VARCHAR(100),
    contact_number VARCHAR(15),
    work_experience INT,
    college VARCHAR(100),
    course_enrolled VARCHAR(100),
    start_date DATE
);

CREATE TABLE Companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    company_type VARCHAR(50),
    location VARCHAR(100),
    technology VARCHAR(100),
    resource VARCHAR(100)
);

CREATE TABLE Requirements (
    requirement_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    technology VARCHAR(100),
    resource_count INT,
    expected_start_date DATE,
    duration INT,
    status VARCHAR(50),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);
INSERT INTO Companies (company_name, company_type, location, technology, resource) VALUES 
('TCS', 'IT Services', 'Mumbai', 'Java, Python', 'Software Developer'),
('Infosys', 'IT Services', 'Bangalore', 'Machine Learning', 'Data Scientist'),
('Wipro', 'IT Services', 'Hyderabad', 'Cloud Computing', 'Cloud Engineer'),
('IBM', 'IT Services', 'Pune', 'Mainframe', 'Mainframe Developer'),
('CGI', 'IT Services', 'Chennai', 'Cyber Security', 'Security Analyst'),
('Accenture', 'Consulting', 'Delhi', 'Data Analysis', 'Data Analyst'),
('Capgemini', 'Consulting', 'Kolkata', 'Full Stack Development', 'Full Stack Developer'),
('Tech Mahindra', 'IT Services', 'Noida', 'Blockchain', 'Blockchain Developer'),
('HCL', 'IT Services', 'Gurgaon', 'IoT', 'IoT Developer'),
('Microsoft', 'Product Development', 'Redmond', 'AI', 'AI Specialist');
INSERT INTO Students (student_name, education, contact_number, work_experience, college, course_enrolled, start_date) VALUES 
('TEENA FAMILA L', 'B.Tech IT', '9345678901', 2, 'ABC College', 'IT', '2023-01-10'),
('GANESH', 'B.Tech IT', '9456789012', 1, 'XYZ College', 'IT', '2023-01-15'),
('SANJIWANI SUBHASHRAO', 'B.Tech CSE', '9567890123', 3, 'DEF College', 'CSE', '2023-01-20'),
('GAYATHRI V', 'B.Tech IT', '9678901234', 2, 'ABC College', 'IT', '2023-01-25'),
('GOKUL', 'B.Tech IT', '9789012345', 1, 'XYZ College', 'IT', '2023-01-30'),
('GOMATHY S', 'B.Tech CSE', '9890123456', 3, 'DEF College', 'CSE', '2023-02-05'),
('B.M.GOPINATH', 'B.Tech IT', '9901234567', 2, 'ABC College', 'IT', '2023-02-10'),
('CHARLES.R', 'B.Tech IT', '9012345678', 1, 'XYZ College', 'IT', '2023-02-15'),
('JANANIE R', 'B.Tech CSE', '8123456789', 3, 'DEF College', 'CSE', '2023-02-20'),
('M. JAYAGURU', 'B.Tech IT', '7234509876', 2, 'ABC College', 'IT', '2023-02-25'),
('KANDULA BHANU', 'B.Tech IT', '6345610987', 1, 'XYZ College', 'IT', '2023-03-01'),
('KARTHIK K', 'B.Tech CSE', '7456721098', 3, 'DEF College', 'CSE', '2023-03-05'),
('KAVIBHARATHY', 'B.Tech IT', '8567832109', 2, 'ABC College', 'IT', '2023-03-10'),
('ARIVIND K.M', 'B.Tech IT', '8678943210', 1, 'XYZ College', 'IT', '2023-03-15'),
('HEMALATHA M', 'B.Tech CSE', '6789054321', 3, 'DEF College', 'CSE', '2023-03-20'),
('Mouleeshvaran', 'B.Tech IT', '7890165432', 2, 'ABC College', 'IT', '2023-03-25'),
('T.Ganeshkumar', 'B.Tech IT', '8901276543', 1, 'XYZ College', 'IT', '2023-03-30'),
('Ullas Niragulan', 'B.Tech CSE', '9012387654', 3, 'DEF College', 'CSE', '2023-04-05'),
('Bhartwaj', 'B.Tech IT', '9123498765', 2, 'ABC College', 'IT', '2023-04-10'),
('Shankar A S', 'B.Tech IT', '9234509876', 1, 'XYZ College', 'IT', '2023-04-15'),
('Dharini Vasu', 'B.Tech CSE', '9345610987', 3, 'DEF College', 'CSE', '2023-04-20'),
('VASEEHARAN A', 'B.Tech IT', '9456721098', 2, 'ABC College', 'IT', '2023-04-25'),
('Taariq Ahmed', 'B.Tech IT', '9567832109', 1, 'XYZ College', 'IT', '2023-04-30'),
('Suriya', 'B.Tech CSE', '9678943210', 3, 'DEF College', 'CSE', '2023-05-05'),
('GOKULANATHAN S', 'B.Tech IT', '9789054321', 2, 'ABC College', 'IT', '2023-05-10');
INSERT INTO Requirements (company_id, technology, resource_count, expected_start_date, duration, status) VALUES 
((SELECT company_id FROM Companies WHERE company_name = 'TCS'), 'Java', 10, '2023-06-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Infosys'), 'Machine Learning', 8, '2023-07-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Wipro'), 'Cloud Computing', 6, '2023-08-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'IBM'), 'Mainframe', 5, '2023-09-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'CGI'), 'Cyber Security', 7, '2023-10-01', 9, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Accenture'), 'Data Analysis', 4, '2023-11-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Capgemini'), 'Full Stack Development', 3, '2023-12-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Tech Mahindra'), 'Blockchain', 2, '2024-01-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'HCL'), 'IoT', 5, '2024-02-01', 9, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Microsoft'), 'AI', 6, '2024-03-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Cognizant'), 'Java', 5, '2023-07-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Kyndryl'), 'Cloud Computing', 3, '2023-08-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'DXC'), 'Data Science', 4, '2023-09-01', 9, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'TCS'), 'Java', 5, '2023-06-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Infosys'), 'Machine Learning', 5, '2023-07-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Wipro'), 'Cloud Computing', 5, '2023-08-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'IBM'), 'Mainframe', 5, '2023-09-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'CGI'), 'Cyber Security', 5, '2023-10-01', 9, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Accenture'), 'Data Analysis', 5, '2023-11-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Capgemini'), 'Full Stack Development', 5, '2023-12-01', 6, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Tech Mahindra'), 'Blockchain', 5, '2024-01-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'HCL'), 'IoT', 5, '2024-02-01', 9, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'Microsoft'), 'AI', 5, '2024-03-01', 12, 'Open'),
((SELECT company_id FROM Companies WHERE company_name = 'TCS'), 'Python', 5, '2024-04-01', 6, 'Open');
CREATE TABLE Training (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    technology VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Training (student_id, technology, start_date, end_date) VALUES
(1, 'Java', '2023-01-10', '2023-03-10'),
(2, 'Python', '2023-01-15', '2023-03-15'),
(3, 'JavaScript', '2023-01-20', '2023-03-20'),
(4, 'Java', '2023-01-25', '2023-03-25'),
(5, 'Python', '2023-01-30', '2023-03-30'),
(6, 'JavaScript', '2023-02-05', '2023-04-05'),
(7, 'Java', '2023-02-10', '2023-04-10'),
(8, 'Python', '2023-02-15', '2023-04-15'),
(9, 'JavaScript', '2023-02-20', '2023-04-20'),
(10, 'Java', '2023-02-25', '2023-04-25');
CREATE TABLE Placements (
    placement_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    company_id INT,
    placement_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);
INSERT INTO Placements (student_id, company_id, placement_date) VALUES
(1, 1, '2023-03-15'),
(2, 2, '2023-03-20'),
(3, 3, '2023-03-25'),
(4, 1, '2023-03-30'),
(5, 2, '2023-04-05'),
(6, 3, '2023-04-10'),
(7, 1, '2023-04-15'),
(8, 2, '2023-04-20'),
(9, 3, '2023-04-25'),
(10, 1, '2023-04-30');
SELECT S.student_name, T.technology, T.start_date, T.end_date
FROM Students S
JOIN Training T ON S.student_id = T.student_id;
SELECT C.company_name, CR.technology, CR.resource_count
FROM Companies C
JOIN Requirements CR ON C.company_id = CR.company_id
GROUP BY C.company_name, CR.technology, CR.resource_count;
SELECT CR.requirement_id, CR.company_id, CR.technology, CR.resource_count, COUNT(P.placement_id) AS fulfilled_count, 
CASE 
    WHEN COUNT(P.placement_id) >= CR.resource_count THEN 'Fulfilled'
    ELSE 'Not Fulfilled'
END AS status
FROM Requirements CR
LEFT JOIN Placements P ON CR.company_id = P.company_id AND CR.technology = (SELECT technology FROM Training WHERE student_id = P.student_id LIMIT 1)
GROUP BY CR.requirement_id, CR.company_id, CR.technology, CR.resource_count;




