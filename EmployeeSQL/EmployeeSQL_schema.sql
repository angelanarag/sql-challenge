-- Create tables for title, employees, salaries, department, department manager and department employee
CREATE TABLE title (
    title_id VARCHAR NOT NULL,
    title VARCHAR  NOT NULL,
    PRIMARY KEY (title_id));

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES title (title_id),
    PRIMARY KEY (emp_no));

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no));

CREATE TABLE department (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no));

CREATE TABLE dept_mgrs (
    dept_no VARCHAR NOT NULL,
    emp_no INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES department (dept_no),
    PRIMARY KEY (dept_no, emp_no));

CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES department (dept_no),
    PRIMARY KEY (emp_no, dept_no));

-- Check the employee table was created
SELECT * FROM employees;


