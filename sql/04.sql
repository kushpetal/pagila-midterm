/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */

SELECT film.title 
FROM film
JOIN film_actor ON film_actor.film_id = film.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id IN (
    -- actors in 'AMERICAN CIRCUS'
    SELECT actor.actor_id FROM actor
    JOIN film_actor ON film_actor.actor_id = actor.actor_id
    JOIN film ON film.film_id = film_actor.film_id
    WHERE film.title = 'AMERICAN CIRCUS'
) AND film.title != 'AMERICAN CIRCUS'
GROUP BY film.title
-- at least 2 actors from 'AMERICAN CIRCUS'
HAVING count(actor.actor_id) >= 2
ORDER BY film.title



