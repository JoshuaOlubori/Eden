-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hft46T

DROP TABLE IF EXISTS dept_emp,
                   dept_manager,
                     titles,
                     salaries, 
                     employees, 
                     departments;

CREATE TABLE `employees` (
    `emp_no` bigint  NOT NULL ,
    `birth_date` date  NOT NULL ,
    `first_name` varchar(14)  NOT NULL ,
    `last_name` varchar(16)  NOT NULL ,
    `gender` enum('M','F')  NOT NULL ,
    `hire_date` date  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    )
);

CREATE TABLE `departments` (
    `dept_no` varchar(4)  NOT NULL ,
    `dept_name` varchar(40)  NOT NULL ,
    PRIMARY KEY (
        `dept_no`
    ),
    CONSTRAINT `uc_departments_dept_name` UNIQUE (
        `dept_name`
    )
);

CREATE TABLE `dept_manager` (
    `emp_no` bigint  NOT NULL ,
    `dept_no` char(4)  NOT NULL ,
    `from_date` date  NOT NULL ,
    `to_date` date  NOT NULL ,
    PRIMARY KEY (
        `emp_no`,`dept_no`
    )
);

CREATE TABLE `dept_emp` (
    `emp_no` bigint  NOT NULL ,
    `dept_no` char(4)  NOT NULL ,
    `from_date` date  NOT NULL ,
    `to_date` date  NOT NULL ,
    PRIMARY KEY (
        `emp_no`,`dept_no`
    )
);

CREATE TABLE `titles` (
    `emp_no` bigint  NOT NULL ,
    `title` varchar(50)  NOT NULL ,
    `from_date` date  NOT NULL ,
    `to_date` date  NOT NULL ,
    PRIMARY KEY (
        `emp_no`,`title`,`from_date`
    )
);

CREATE TABLE `salaries` (
    `emp_no` bigint  NOT NULL ,
    `salary` bigint  NOT NULL ,
    `from_date` date  NOT NULL ,
    `to_date` date  NOT NULL ,
    PRIMARY KEY (
        `emp_no`,`from_date`
    )
);

ALTER TABLE `dept_manager` ADD CONSTRAINT `fk_dept_manager_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`) ON DELETE CASCADE;

ALTER TABLE `dept_manager` ADD CONSTRAINT `fk_dept_manager_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `departments` (`dept_no`) ON DELETE CASCADE;

ALTER TABLE `dept_emp` ADD CONSTRAINT `fk_dept_emp_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`) ON DELETE CASCADE;

ALTER TABLE `dept_emp` ADD CONSTRAINT `fk_dept_emp_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `departments` (`dept_no`) ON DELETE CASCADE;

ALTER TABLE `titles` ADD CONSTRAINT `fk_titles_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`) ON DELETE CASCADE;

ALTER TABLE `salaries` ADD CONSTRAINT `fk_salaries_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`) ON DELETE CASCADE;

