-- SQL SELECT STATEMENTS
-- Explore the department, employees and dept_emp tables
select * from departments;
select * from employees;
select * from dept_emp;

-- Select the information from the “dept_no” column of the “departments” table.
select dept_no from departments;

-- Select all data from the “departments” table.
select * from departments;

-- Select all people from the “employees” table whose first name is “Elvis”.
select * from employees where first_name = "Elvis";

-- Retrieve a list with all female employees whose first name is Kellie. 
select * from employees where gender = 'F' and first_name = "Kellie";
-- OR
select * from
(select * from employees where gender = "F") ab
where ab.first_name = "Kellie";

-- Retrieve a list with all employees whose first name is either Kellie or Aruna.
select * from employees where first_name = 'Aruna' or first_name = "Kellie";

-- Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
select * from employees where first_name in ("Denis", "Elvis");

/*Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.*/
select * from employees where first_name or last_name not in ('John', 'Mark', 'Jacob');

/*Working with the “employees” table, use the LIKE operator to select the data about all individuals, 
whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.*/
select * from employees where first_name like "Mark%";

/*Retrieve a list with all employees who have been hired in the year 2000.*/
select * from employees where year(hire_date) = '2000';

/*Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. */
select * from employees where emp_no like "1000_"
 




