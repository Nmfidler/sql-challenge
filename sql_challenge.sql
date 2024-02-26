-- Drop the table if it exists
DROP TABLE IF EXISTS department;

-- Create the department table
CREATE TABLE department (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR
);

-- Check data import
SELECT *
FROM department;

-- Create the dept_emp table
CREATE TABLE dept_emp (
	emp_no INT ,
	dept_no VARCHAR(5),
	PRIMARY KEY (emp_no, dept_no)
);

-- Check data import
SELECT *
FROM dept_emp;

-- Create the dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(5),
	emp_no INT,
	PRIMARY KEY (emp_no, dept_no)
);

-- Check data import
SELECT *
FROM dept_manager;


-- Create the employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (5),
	birth_date DATE,
	first_name VARCHAR(50),
	last_name VARCHAR (50),
	sex VARCHAR (1),
	hire_date DATE
);

-- Check data import
SELECT *
FROM employees;

-- Create the salaries table
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT
);

-- Check data import
SELECT *
FROM salaries;


-- Create the titles table
CREATE TABLE titles (
	emp_title_id VARCHAR (5),
	titles VARCHAR (50)
);

-- Check data import
SELECT *
FROM titles;

--List the employee number, last name, first name, sex, and salary of each employee
SELECT 
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
FROM
    employees
JOIN
    salaries ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;
	
--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT 
    dept_manager.dept_no AS department_number,
    department.dept_name AS department_name,
    dept_manager.emp_no AS manager_employee_number,
    employees.last_name AS manager_last_name,
    employees.first_name AS manager_first_name
FROM
    dept_manager
JOIN
    department ON dept_manager.dept_no = department.dept_no
JOIN
    employees ON dept_manager.emp_no = employees.emp_no;


	
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
    dept_emp.emp_no AS employee_number,
    employees.last_name,
    employees.first_name,
    dept_emp.dept_no AS department_number,
    department.dept_name AS department_name
FROM
    dept_emp
JOIN
    employees ON dept_emp.emp_no = employees.emp_no
JOIN
    department ON dept_emp.dept_no = department.dept_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT 
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules' AND last_name LIKE 'B%';
	
--List each employee in the Sales department, including their employee number, last name, and first name
SELECT 
    employees.emp_no AS employee_number,
    employees.last_name,
    employees.first_name
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    department ON dept_emp.dept_no = department.dept_no
WHERE
    department.dept_name = 'Sales';
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
    employees.emp_no AS employee_number,
    employees.last_name,
    employees.first_name,
    department.dept_name AS department_name
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    department ON dept_emp.dept_no = department.dept_no
WHERE
    department.dept_name IN ('Sales', 'Development');
	
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT 
    last_name,
    COUNT(*) AS name_frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    name_frequency DESC;








