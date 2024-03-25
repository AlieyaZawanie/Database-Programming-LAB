use employees;

#1
SELECT YEAR(hire_date), COUNT(*)
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY YEAR(hire_date) ASC;

#2
SELECT MIN(YEAR(hire_date))
FROM employees;

#3
SELECT gender, COUNT(*)
FROM employees
GROUP BY gender;

#4
SELECT d.dept_no, d.dept_name, COUNT(de.emp_no) as no_of_staff
FROM departments d 
JOIN dept_emp de 
ON d.dept_no = de.dept_no
WHERE (YEAR(de.to_date) = 9999)
GROUP BY d.dept_no, d.dept_name
ORDER BY no_of_staff DESC;

#5
SELECT COUNT(emp_no) as no_of_active_staff
FROM dept_emp
WHERE (YEAR(to_date) = 9999);

#6
SELECT de.dept_no, AVG(s.salary) AS average_salary, MAX(s.salary) AS max_annual_salary, MIN(s.salary) AS min_annual_salary
FROM dept_emp de 
JOIN salaries s 
ON de.emp_no = s.emp_no
WHERE YEAR(s.to_date) = 9999 AND YEAR(de.to_date) = 9999
GROUP BY de.dept_no
ORDER BY de.dept_no ASC;

#7
SELECT de.dept_no, e.gender, COUNT(de.dept_no) AS no_of_staff
FROM dept_emp de
JOIN employees e 
ON de.emp_no = e.emp_no
WHERE (YEAR(de.to_date) = 9999)
GROUP BY de.dept_no, e.gender
ORDER BY de.dept_no ASC, e.gender DESC;

#8
SELECT d.dept_name AS department,
SUM(CASE WHEN s.salary >= 100000 THEN 1 ELSE 0 END) AS High,
SUM(CASE WHEN s.salary >= 50000 AND s.salary < 100000 THEN 1 ELSE 0 END) AS Mid,
SUM(CASE WHEN s.salary < 50000 THEN 1 ELSE 0 END) AS Low
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE YEAR(de.to_date) = 9999 
GROUP BY d.dept_name;

#9
SELECT de.dept_no , t.title AS job_titles, COUNT(*) AS number_of_staff
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN titles t ON e.emp_no = t.emp_no
WHERE YEAR(de.to_date) = 9999
GROUP BY de.dept_no, t.title
ORDER BY de.dept_no ASC, number_of_staff DESC;

#10
SELECT t.title AS job_title, AVG(s.salary) AS average_anual_salary
FROM titles t
JOIN salaries s 
ON t.emp_no = s.emp_no
WHERE YEAR(t.to_date) = 9999
GROUP BY t.title;