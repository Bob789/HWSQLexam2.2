--A. Show the list of tourists along with the countries they came from. Hint: INNER JOIN
SELECT first_name,
	last_name,
	passport_number,
	date_of_birth,
	gender,
	email,
	phone,
	c.country_name AS country
FROM tourists t
JOIN countries c ON c.id = t.country_id
ORDER BY first_name;

--B. Show the list of tourists and the tour details only for tourists who are registered.
SELECT first_name,
	last_name,
	passport_number,
	date_of_birth,
	gender,
	email,
	phone,
	ts.tour_name,
	ts.description,
	ts.start_date,
	ts.end_date,
	ts.price,
	ts.max_participants,
	ts.guide_name,
	ts.difficulty_level,
	ts.pickup_location
FROM tourists t
JOIN tours ts ON ts.id = t.tour_id
WHERE t.tour_id IS NOT NULL
ORDER BY first_name;

--C. Show the list of all tourists and the tour details, where if a tourist is not registered, NULL will appear in the tour details columns.
SELECT first_name,
	last_name,
	passport_number,
	date_of_birth,
	gender,
	email,
	phone,
	ts.tour_name,
	ts.description,
	ts.start_date,
	ts.end_date,
	ts.price,
	ts.max_participants,
	ts.guide_name,
	ts.difficulty_level,
	ts.pickup_location
FROM tourists t
LEFT JOIN tours ts ON ts.id = t.tour_id
ORDER BY first_name;

--D. Show the list of all tourists and the tour details + all tour details, where if there are no tourists registered for a tour, NULL will appear in the tourist columns. Hint: FULL JOIN
SELECT first_name,
	last_name,
	passport_number,
	date_of_birth,
	gender,
	email,
	phone,
	ts.tour_name,
	ts.description,
	ts.start_date,
	ts.end_date,
	ts.price,
	ts.max_participants,
	ts.guide_name,
	ts.difficulty_level,
	ts.pickup_location
FROM tourists t
FULL JOIN tours ts ON ts.id = t.tour_id
ORDER BY first_name;

--E. Show the list of tourists who are not registered for any tour.
SELECT first_name,
	last_name,
	passport_number,
	date_of_birth,
	gender,
	email,
	phone
FROM tourists t
WHERE tour_id IS NULL
ORDER BY first_name;

--F. Show the list of tours where there is no tourist registered.
SELECT
    ts.tour_name,
    ts.description,
    ts.start_date,
    ts.end_date,
    ts.price,
    ts.max_participants,
    ts.guide_name,
    ts.difficulty_level,
    ts.pickup_location
FROM tours ts
LEFT JOIN tourists t ON ts.id = t.tour_id
WHERE t.id IS NULL
ORDER BY ts.tour_name;

--G. Count the number of tours where there is no tourist registered (even one).
SELECT
    ts.tour_name,
    COUNT(*) AS tours_without_tourists
FROM tours ts
LEFT JOIN tourists t ON ts.id = t.tour_id
WHERE t.id IS NULL
GROUP BY ts.tour_name
ORDER BY ts.tour_name;

--H. Show all possible combinations of tourists against all tours.
SELECT
    t.first_name,
    t.last_name,
    t.passport_number,
    t.date_of_birth,
    t.gender,
    t.email,
    t.phone,
    ts.tour_name,
    ts.description,
    ts.start_date,
    ts.end_date,
    ts.price,
    ts.max_participants,
    ts.guide_name,
    ts.difficulty_level,
    ts.pickup_location
FROM tourists t
CROSS JOIN tours ts
ORDER BY t.first_name, ts.tour_name;










