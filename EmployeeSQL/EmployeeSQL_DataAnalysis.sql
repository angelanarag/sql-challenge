--Data Analysis
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
-- Create view from query
CREATE VIEW emp_salary_title_view AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, e.emp_title_id, t.title, s.salary
FROM employees e
JOIN title t ON e.emp_title_id = t.title_id
JOIN salaries s ON e.emp_no = s.emp_no;

-- Show the employee number, last name, first name, sex, and salary of each employee
SELECT emp_no, last_name, first_name, sex, salary
FROM emp_salary_title_view
ORDER BY emp_no;

-- Drop view
DROP VIEW emp_salary_title_view;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, dm.emp_no AS manager_emp_no, e.last_name AS manager_last_name, e.first_name AS manager_first_name
FROM department d
  INNER JOIN dept_mgrs dm ON d.dept_no = dm.dept_no
  INNER JOIN employees e ON dm.emp_no = e.emp_no
  INNER JOIN title t ON e.emp_title_id = t.title_id;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.emp_no AS employee_no, e.last_name,e.first_name, d.dept_no, d.dept_name
FROM department d
  INNER JOIN dept_emp de ON d.dept_no = de.dept_no
  INNER JOIN employees e ON de.emp_no = e.emp_no
ORDER BY e.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
  INNER JOIN dept_emp de ON e.emp_no = de.emp_no
  INNER JOIN department d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
 INNER JOIN dept_emp de ON e.emp_no = de.emp_no
 INNER JOIN department d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

