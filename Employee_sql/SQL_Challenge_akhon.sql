--List the employee number, last name, first name, sex, and salary of each employee.

create view emp_salary as
select e.emp_no, last_name, first_name, sex, salary
from employees e
join salary s on e.emp_no = s.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.
-- create view emp_salary as
select emp_no, last_name, first_name, sex, hire_date
from employees 
where hire_date between 1986-01-01 and 1986-12-31;
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
create view department_managers as
select dm.dept_no,dept_name, dm.emp_no, last_name, first_name
from department_manager dm
join departments d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
create view emp_dept as
select de.dept_no,e.emp_no,last_name, first_name, dept_name
from employees e
join department_employees de on de.emp_no = e.emp_no
join departments d on de.dept_no = d.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select *
from employees
where first_name = 'Hercules' and last_name like 'B%'
--List each employee in the Sales department, including their employee number, last name, and first name.
select emp_no,last_name,first_name, dept_name
from emp_dept
where dept_name = 'Sales'
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp_no,last_name,first_name, dept_name
from emp_dept
where dept_name = 'Sales' or dept_name = 'Development'
order by last_name
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(*)
from emp_dept
group by last_name
order by count desc