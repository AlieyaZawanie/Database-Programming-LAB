use classicmodels;

#1
SELECT c.customerName, SUM(p.amount) AS total_spend
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE YEAR(p.paymentDate) = 2003
GROUP BY c.customerName
HAVING total_spend > 50000
ORDER BY total_spend DESC;

#2
SELECT p.productName, p.productVendor, SUM(od.quantityOrdered) quantity_ordered
FROM products p JOIN orderdetails od
ON p.productCode = od.productCode
GROUP BY productName
ORDER BY quantity_ordered DESC
LIMIT 5;

#3
SELECT p.productCode, p.productName , p.productVendor, sum(od.quantityOrdered) AS quantity_ordered, SUM(od.quantityOrdered * od.priceEach) AS total_sale_amount
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders odr ON od.orderNumber = odr.orderNumber
WHERE year(odr.orderDate) = '2005'
GROUP BY p.productCode
ORDER BY total_sale_amount DESC 
LIMIT 1;

#4
SELECT productName
FROM products p
WHERE p.productLine = 'Classic Cars' AND p.MSRP > 150
UNION
SELECT productName
FROM products p
WHERE p.productLine = 'Vintage Cars' AND p.MSRP > 100;


#5
SELECT c.customerNumber, c.customerName
FROM customers c JOIN orders odr
ON c.customerNumber = odr.customerNumber
WHERE YEAR(odr.orderDate) = 2004
INTERSECT
SELECT c.customerNumber, c.customerName
FROM customers c JOIN orders odr
ON c.customerNumber = odr.customerNumber
WHERE YEAR(odr.orderDate) = 2005
ORDER BY customerNumber ASC;

#5
SELECT c.customerNumber, c.customerName
FROM customers c JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE YEAR(p.paymentDate) = 2004
INTERSECT
SELECT c.customerNumber, c.customerName
FROM customers c JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE YEAR(p.paymentDate) = 2005
ORDER BY customerNumber ASC;

#6
SELECT c.customerNumber, c.customerName
FROM customers c
	INNER JOIN orders ordcustomers
	ON c.customerNumber = ord.customerNumber
	INNER JOIN orderdetails od
	ON ord.orderNumber = od.orderNumber
WHERE YEAR(ord.orderDate) = 2003
GROUP BY customerNumber
HAVING SUM(od.quantityOrdered) > 2000
INTERSECT 
SELECT c.customerNumber, c.customerName
FROM customers c
	INNER JOIN orders ord
    ON c.customerNumber = ord.customerNumber
    INNER JOIN orderdetails od
    ON ord.orderNumber = od.orderNumber
WHERE YEAR(ord.orderDate) = 2004
GROUP BY customerNumber
HAVING SUM(od.quantityOrdered) > 2000;

#6
SELECT c.customerNumber, c.customerName
FROM customers c
	INNER JOIN payments p ON c.customerNumber = p.customerNumber
	INNER JOIN orders ord ON c.customerNumber = ord.customerNumber
	INNER JOIN orderdetails od ON ord.orderNumber = od.orderNumber
WHERE YEAR(ord.orderDate) = 2003
GROUP BY customerNumber
HAVING SUM(od.quantityOrdered) > 2000
INTERSECT 
SELECT c.customerNumber, c.customerName
FROM customers c
	INNER JOIN payments p ON c.customerNumber = p.customerNumber
	INNER JOIN orders ord ON c.customerNumber = ord.customerNumber
	INNER JOIN orderdetails od ON ord.orderNumber = od.orderNumber
WHERE YEAR(ord.orderDate) = 2004
GROUP BY customerNumber
HAVING SUM(od.quantityOrdered) > 2000;

#TRY
SELECT c.customerNumber, c.customerName
FROM customers c
WHERE c.customerNumber IN (
    SELECT ord.customerNumber
    FROM orders ord
    INNER JOIN orderdetails od ON ord.orderNumber = od.orderNumber
    WHERE YEAR(ord.orderDate) = 2003
    GROUP BY ord.customerNumber
    HAVING SUM(od.quantityOrdered) > 2000
)
AND c.customerNumber IN (
    SELECT ord.customerNumber
    FROM orders ord
    INNER JOIN orderdetails od ON ord.orderNumber = od.orderNumber
    WHERE YEAR(ord.orderDate) = 2004
    GROUP BY ord.customerNumber
    HAVING SUM(od.quantityOrdered) > 2000
);

