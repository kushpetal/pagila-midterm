/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

SELECT country 
FROM country
JOIN city ON country.country_id = city.country_id
JOIN address ON address.city_id = city.city_id
JOIN customer ON customer.address_id = address.address_id
GROUP BY country
-- order by unique customers in descending order
ORDER BY count(DISTINCT customer_id) DESC
-- filter highest
LIMIT 1;


