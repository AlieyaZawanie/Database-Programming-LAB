USE classicmodels;

#1
SELECT country, COUNT(customerNumber) AS no_of_customers
FROM classicmodels.customers
GROUP BY country
ORDER BY no_of_customers DESC;

#2
SELECT officeCode, COUNT(employeeNumber) AS total_employees
FROM classicmodels.employees
GROUP BY officeCode
ORDER BY officeCode ASC;

#3
SELECT e.officeCode, o.city , e.jobTitle, count(e.employeeNumber) as no_of_employee
FROM employees e
	INNER JOIN offices o
    ON e.officeCode = o.officeCode
GROUP BY officeCode,jobTitle;

#4
SELECT e.firstname, c.salesRepEmployeeNumber , COUNT(customerNumber) as no_of_customer
FROM employees e
	INNER JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY firstName,salesRepEmployeeNumber
HAVING count(customerNumber) >= 7
ORDER BY no_of_customer DESC;

#5
SELECT c.customerNumber,c.customerName
FROM customers c
WHERE 
	(SELECT SUM(p.amount) AS total_spend
    FROM payments p 
    WHERE c.customerNumber = p.customerNumber
    HAVING total_spend > 100000)
ORDER BY 1;
    
#6
SELECT country, total_amount
FROM  
	(SELECT country, SUM(p.amount) AS total_amount
    FROM payments p 
    join customers c
	on c.customerNumber = p.customerNumber
    GROUP BY country) as newTable
ORDER BY total_amount DESC;