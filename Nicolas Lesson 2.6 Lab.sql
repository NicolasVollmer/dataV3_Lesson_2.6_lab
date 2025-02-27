#### Lab | SQL Queries - Lesson 2.6

# 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
-- tried to make this work, but couldn't get the answer

# 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
-- tried to make this work, but couldn't get the answer

# 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(rental_id) AS 'processed rentals' FROM sakila.rental
GROUP BY staff_id
ORDER by staff_id ASC;

# 4. Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(film_id) AS 'films released that year' FROM sakila.film
GROUP BY release_year
ORDER BY release_year;

# 5. Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(film_id) AS 'films with that rating' FROM sakila.film
GROUP BY rating
ORDER BY rating;

# 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, ROUND(AVG(length),2) AS 'average duration' FROM sakila.film
GROUP BY rating
ORDER BY rating;

# 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, ROUND(AVG(length),2) AS 'average duration' FROM sakila.film
WHERE AVG(length) >= 120
GROUP BY rating
ORDER BY rating;
-- cannot get the above to work

# 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length, RANK() OVER (
	PARTITION BY length
    ORDER BY length ASC
	) rank
 FROM sakila.film;
 -- pretty sure I'd have to use the Partition by that Jan mentioned, but cannot get it to work
