CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    PRIMARY KEY ("dept_no"),
	UNIQUE ("dept_name")
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    PRIMARY KEY ("emp_no","dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES employees(emp_no),
	FOREIGN KEY ("dept_no") REFERENCES departments(dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    PRIMARY KEY ("dept_no","emp_no"),
	FOREIGN KEY ("emp_no") REFERENCES employees(emp_no),
	FOREIGN KEY ("dept_no") REFERENCES departments(dept_no)
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    PRIMARY KEY ("emp_no")
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    PRIMARY KEY ("emp_no"),
	FOREIGN KEY ("emp_no") REFERENCES employees(emp_no)
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   ,
    PRIMARY KEY ("emp_no", "title", "from_date"),
	FOREIGN KEY ("emp_no") REFERENCES employees(emp_no)
);

--List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.gender from employees
	left join salaries on (employees.emp_no = salaries.emp_no)
	order by employees.emp_no;
	
