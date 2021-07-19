-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT e.emp_no as "Employee Number", e.last_name as "Last Name", 
e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
    FROM employees e 
INNER JOIN salaries s 
    ON e.emp_no = s.emp_no 
ORDER BY e.last_name;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name as "First Name", last_name as "Last Name", 
hire_date as "Hire Date"
	FROM employees
	WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
	ORDER BY hire_date;


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no as "Department Number", d.dept_name as "Department Name", 
dm.emp_no as "Manager Employee Number", e.last_name as "Last Name",  
e.first_name as "First Name"
	FROM departments d 
INNER JOIN dept_manager dm 
	ON d.dept_no = dm.dept_no
INNER JOIN employees e 
	ON dm.emp_no = e.emp_no;


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name",  
e.first_name as "First Name", d.dept_name as "Department Name"
	FROM employees e 
INNER JOIN dept_emp de 
	ON e.emp_no = de.emp_no
INNER JOIN departments d
	ON de.dept_no = d.dept_no ORDER BY "Last Name";

-- 5. List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."

SELECT first_name AS "First Name",last_name AS "Last Name", sex AS "Sex"
FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%' ORDER BY "Sex"

--6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' order by last_name;

--7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'  order by last_name, dept_name;


--8. In descending order, list the frequency count of employee 
-- last names, i.e., how many employees share each last name.

SELECT last_name, count(last_name) as "No of Employees"
FROM employees e 
Group By last_name order by "No of Employees" desc, last_name;

