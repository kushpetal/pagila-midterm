/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 *
 * Write a SQL query that lists the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 * 4) have never been rented by anyone with an 'F' in their address (at the street, city, or country level).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

SELECT DISTINCT film.title
FROM film
-- join tables
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
LEFT JOIN actor ON film_actor.actor_id = actor.actor_id
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
LEFT JOIN customer ON rental.customer_id = customer.customer_id
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id
-- filter out 'F'
WHERE film.title NOT ILIKE '%F%' 
AND (actor.first_name NOT ILIKE '%F%' AND actor.last_name NOT ILIKE '%F%') 
AND (customer.first_name NOT ILIKE '%F%' AND customer.last_name NOT ILIKE '%F%') 
AND (address.address NOT ILIKE '%F%' AND city.city NOT ILIKE '%F%' AND country.country NOT ILIKE '%F%')
-- group duplicates
GROUP BY film.title
ORDER BY film.title;


