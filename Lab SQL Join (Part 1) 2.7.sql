-- Lab SQL Join (Part 1) 2.7
USE sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name as 'category_name', COUNT(f.film_id) as 'numer_of_films'
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.name;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, SUM(amount) as 'total_amount_rung_up'
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
GROUP BY s.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT first_name, last_name, COUNT(film_id) as 'number of films'
FROM sakila.film_actor f
JOIN sakila.actor a
ON a.actor_id = f.actor_id
GROUP BY f.actor_id
ORDER BY COUNT(f.actor_id) DESC;
-- Gina Degeneres with 42??? but others got Susan Davis

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT first_name, last_name, count(r.rental_id) as 'rentals'
FROM sakila.rental r
JOIN sakila.customer c
ON c.customer_id = r.customer_id
GROUP BY r.customer_id
ORDER BY rentals DESC;
-- Eleanor Hunt 46 with 46 films rented.

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id
GROUP BY staff_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT title, COUNT(fa.actor_id) as 'number_of_actors'
FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY fa.film_id
ORDER BY number_of_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT last_name, first_name, SUM(amount) as 'total_paid'
FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name asc, first_name asc;

-- 8. List number of films per category.
SELECT c.name as 'category_name', COUNT(f.film_id) as 'numer_of_films'
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.name;
