--Movies
--PartB. question2.1 How many movies are there in each genre?
SELECT genre, COUNT(*) AS genre_count
FROM movies
GROUP BY genre
ORDER BY genre_count DESC;

--PartB. question2.2 How much revenue was there in each year in the film industry?
SELECT year, SUM(revenue) AS total_revenue
FROM movies
GROUP BY year
ORDER BY year DESC;

--PartB. question2.3 What is the average revenue for each genre?
SELECT genre, ROUND(AVG(revenue)::NUMERIC, 2) AS AVG_revenue
FROM movies
GROUP BY genre
ORDER BY genre ASC;

--PartB. question2.4 What is the average revenue for each genre for each language separately?
SELECT genre, language, ROUND(AVG(revenue)::NUMERIC, 2) AS AVG_revenue
FROM movies
GROUP BY genre, language
ORDER BY genre ASC;

--PartB. question2.5 In which language are there the fewest movies?
-- Hint: Sort the groups in ascending order and select the first one.
SELECT language, COUNT(*) AS movie_count
FROM movies
GROUP BY language
ORDER BY movie_count ASC
LIMIT 1;

--PartB. question2.6 Which country has the most movies?
-- Hint: Sort the groups in descending order and select the first one.
SELECT country, COUNT(*) AS country_count
FROM movies
GROUP BY country
ORDER BY country_count DESC
LIMIT 1;

--PartB. question2.7 Show the genres that have more than 2 movies.
SELECT genre, COUNT(*) AS genre_count
FROM movies
GROUP BY genre
HAVING COUNT(*) > 2
ORDER BY genre_count DESC;

--PartB. question2.8 Show the years in which the total revenue was greater than 1,000.
SELECT year, SUM(revenue) AS total_revenue
FROM movies
GROUP BY year
HAVING SUM(revenue) >1000
ORDER BY year DESC;

--PartB. question2.9 Show the languages with at least 3 movies.
SELECT language, count(*) AS count_languages_movies
FROM movies
GROUP BY language
HAVING count(*) > 3
ORDER BY language ASC;











