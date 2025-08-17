CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(100),
location VARCHAR(100)
);

INSERT INTO departments VALUES
(1, 'HR', 'New York'),
(2, 'Finance', 'London'),
(3, 'IT', 'San Francisco'),
(4, 'Marketing', 'Chicago'),
(5, 'Sales', 'Los Angeles'),
(6, 'Operations', 'Toronto'),
(7, 'Legal', 'Washington'),
(8, 'R&D', 'Berlin'),
(9, 'Support', 'Dubai'),
(10, 'Logistics', 'Tokyo');

SELECT * FROM departments

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
salary DECIMAL(10,2),
dept_id INT,
hire_date DATE,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Alice Johnson', 60000, 1, '2020-01-15'),
(102, 'Bob Smith', 75000, 2, '2019-03-20'),
(103, 'Charlie Brown', 85000, 3, '2018-07-10'),
(104, 'Diana Prince', 95000, 3, '2021-09-01'),
(105, 'Ethan Hunt', 55000, 4, '2022-02-14'),
(106, 'Fiona Gallagher', 72000, 5, '2020-06-05'),
(107, 'George Miller', 80000, NULL, '2017-11-30'), 
(108, 'Hannah Lee', 67000, 6, '2021-12-25'),
(109, 'Ian Curtis', 90000, 7, '2019-05-18'),
(110, 'Julia Roberts', 78000, NULL, '2023-01-11'); 

SELECT * FROM employees

CREATE TABLE projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(100),
budget DECIMAL(12,2),
start_date DATE,
end_date DATE
);

INSERT INTO projects VALUES
(201, 'ERP Implementation', 200000, '2022-01-01', '2022-12-31'),
(202, 'Mobile App Development', 150000, '2022-03-01', '2022-10-30'),
(203, 'Website Redesign', 80000, '2022-05-01', '2022-09-15'),
(204, 'Digital Marketing Campaign', 120000, '2022-07-01', '2022-11-30'),
(205, 'Data Migration', 95000, '2022-02-01', '2022-06-30'),
(206, 'Cybersecurity Upgrade', 180000, '2021-08-01', '2022-04-30'),
(207, 'AI Research Project', 300000, '2022-09-01', '2023-08-31'),
(208, 'Customer Support System', 110000, '2022-04-01', '2022-12-15'),
(209, 'E-commerce Expansion', 250000, '2021-11-01', '2022-12-31'),
(210, 'Logistics Optimization', 175000, '2022-06-01', '2023-01-31');


SELECT * FROM projects

CREATE TABLE employee_projects (
emp_id INT,
project_id INT,
hours_worked INT,
PRIMARY KEY (emp_id, project_id),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employee_projects VALUES
(101, 201, 120),
(102, 202, 90),
(103, 203, 150),
(104, 204, 200),
(105, 205, 75),
(106, 206, 130),
(108, 207, 160),
(109, 208, 100),
(101, 209, 140),
(103, 210, 80);


SELECT * FROM employee_projects

SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d 
    ON e.dept_id = d.dept_id;

SELECT d.dept_id, d.dept_name, e.emp_id, e.emp_name
FROM departments d
LEFT JOIN employees e 
    ON d.dept_id = e.dept_id;

SELECT emp_id, emp_name
FROM employees
WHERE dept_id IS NULL;

SELECT p.project_id, p.project_name, e.emp_id, e.emp_name
FROM projects p
LEFT JOIN employee_projects ep 
    ON p.project_id = ep.project_id
LEFT JOIN employees e 
    ON ep.emp_id = e.emp_id;


SELECT d.dept_id, d.dept_name, 
       COALESCE(SUM(ep.hours_worked), 0) AS total_hours
FROM departments d
LEFT JOIN employees e 
    ON d.dept_id = e.dept_id
LEFT JOIN employee_projects ep 
    ON e.emp_id = ep.emp_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_id;

SELECT e.emp_id, e.emp_name
FROM employees e
LEFT JOIN employee_projects ep 
    ON e.emp_id = ep.emp_id
WHERE ep.project_id IS NULL;

--1. Difference between INNER JOIN and LEFT JOIN:
--INNER JOIN only gives you the rows that match in both tables. 
--If there’s no match, the row is skipped.
-- Eg:If I want to see only employees who actually belong to a department,
--I’d use INNER JOIN.
--LEFT JOIN gives you all the rows from the first (left) table, and then
--adds matches from the second table if they exist. If there’s no match,
--it just shows NULL.
-- Eg: If I want to see all employees, even those who don’t belong to a 
--department,I’d use LEFT JOIN.
--So,INNER JOIN = strict matching
--LEFT JOIN = keep everything from left side + matches if available

--2. Why is RIGHT JOIN less common?
--A RIGHT JOIN is basically the same as a LEFT JOIN, but reversed.Since
--most people think of the first table as the “main” one, we usually write
--queries with LEFT JOIN instead of flipping everything around.That’s why
--you’ll rarely see RIGHT JOIN in practice — it’s just a readability thing.
