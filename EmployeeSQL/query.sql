--List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.gender from employees
	left join salaries on (employees.emp_no = salaries.emp_no)
	order by employees.emp_no;
	
--List employees who were hired in 1986
select * from employees
where employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
--dept_manager, employees,departments
select * from dept_manager
inner join departments on (dept_manager.dept_no = departments.dept_no)
inner join employees on (dept_manager.emp_no = employees.emp_no);	   

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name
select e.emp_no, e.first_name, e.last_name, departments.dept_name from employees as e
inner join dept_emp on (e.emp_no = dept_emp.emp_no)
inner join departments on (dept_emp.dept_no=departments.dept_no);

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where employees.first_name = 'Hercules'
AND employees.last_name like 'B%';

--List all employees in the Sales department, 
--employee number, last name, first name, and department name.
select e.emp_no, e.first_name, e.last_name, departments.dept_name from employees as e
inner join dept_emp on (e.emp_no = dept_emp.emp_no)
inner join departments on (dept_emp.dept_no=departments.dept_no)
where departments.dept_name ='Sales';

--List all employees in the Sales and Development departments, 
--employee number, last name, first name, and department name
select e.emp_no, e.first_name, e.last_name, departments.dept_name from employees as e
inner join dept_emp on (e.emp_no = dept_emp.emp_no)
inner join departments on (dept_emp.dept_no=departments.dept_no)
where departments.dept_name In ('Sales','Development')
order by e.emp_no;

--In descending order, list the frequency count of employee last names
SELECT last_name,COUNT(last_name) AS "last_name_frequencty" 
FROM employees 
GROUP BY last_name
ORDER BY last_name_frequencty;



