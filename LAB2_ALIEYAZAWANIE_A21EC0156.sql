USE sakila;

SELECT *FROM customer;
SELECT first_name, last_name
FROM customer
WHERE last_name LIKE '_E%w%D' ;

SELECT * FROM sakila.film;
SELECT title,rental_rate,rating
FROM film
WHERE (rental_rate = 2.99 OR rental_rate =0.99)
AND rating NOT IN( 'R' , 'PG-13',  'NC-17'); 



SELECT Customer_id, COUNT(payment_id) AS num_payment  , SUM(amount) AS tot_amount_of_payment,
	CASE
        WHEN COUNT(payment_id) < 15 THEN 'Occasional'
        WHEN COUNT(payment_id) > 35 THEN 'Frequent'
        ELSE 'Regular'
    END AS category
    FROM payment
GROUP BY customer_id;

SELECT amount,customer_id, COUNT(payment_id) AS num_payment  , SUM(amount) AS tot_amount_of_payment,
	CASE
        WHEN COUNT(payment_id) < 15 THEN 'Occasional'
        WHEN COUNT(payment_id) > 35 THEN 'Frequent'
        ELSE 'Regular'
    END AS category
    FROM payment
GROUP BY customer_id
ORDER BY tot_amount_of_payment DESC
LIMIT 10;

SELECT title,length,
	CASE
        WHEN length < 90 THEN 'Cat A'
        WHEN length BETWEEN 90 AND 120 THEN 'Cat B'
        WHEN length BETWEEN 120 AND 150 THEN 'Cat C'
        ELSE "Cat D"
    END AS fcategory,
    COUNT(*) AS number_movie
FROM film
GROUP BY fcategory;

SELECT title,length,
	CASE
        WHEN length < 90 THEN 'Cat A'
        WHEN length BETWEEN 90 AND 120 THEN 'Cat B'
        WHEN length BETWEEN 120 AND 150 THEN 'Cat C'
        ELSE "Cat D"
    END AS fcategory
FROM film
GROUP BY fcategory;

