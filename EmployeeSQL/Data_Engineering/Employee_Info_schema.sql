Drop table if exists titles cascade;
CREATE TABLE titles (
    title_id char(5) PRIMARY KEY NOT NULL,
    title varchar(64)   NOT NULL
);


Drop table if exists departments cascade;
CREATE TABLE departments (
    dept_no char(4) PRIMARY KEY NOT NULL,
    dept_name varchar(64)   NOT NULL
);

Drop table if exists employees cascade;
CREATE TABLE employees (
    emp_no int PRIMARY KEY NOT NULL,
    emp_title_id char(5) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(32) NOT NULL,
    last_name varchar(32) NOT NULL,
    sex char(1) NOT NULL,
    hire_date date NOT NULL,
    FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

Drop table if exists dept_emp cascade;
CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no char(4)   NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

Drop table if exists dept_manager cascade;
CREATE TABLE dept_manager (
    dept_no char(4)   NOT NULL,
    emp_no int   NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

Drop table if exists salaries cascade;
CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary decimal   NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);