Section 1 — Basic SELECT and WHERE
-- Q1. How can we display all artists?
SELECT *
FROM artists;

-- Q2. How can we display all tracks?
SELECT *
FROM tracks;

-- Q3. How can we display all customers?
SELECT *
FROM customers;

-- Q4. How can we find tracks with a price greater than 1.00?
SELECT name, unit_price
FROM tracks
WHERE unit_price > 1.00;

-- Q5. How can we find customers from India?
SELECT *
FROM customers
WHERE country = 'India';

-- Q6. How can we find tracks with a price between 0.99 and 1.99?
SELECT name, unit_price
FROM tracks
WHERE unit_price BETWEEN 0.99 AND 1.99;

-- Q7. How can we find tracks whose names contain the word 'Song'?
SELECT *
FROM tracks
WHERE name LIKE '%Song%';

-- Q8. How can we display tracks in descending order of price?
SELECT name, unit_price
FROM tracks
ORDER BY unit_price DESC;

Section 2 — JOIN Queries
-- Q9. How can we display track names with their album titles?
SELECT
    t.name AS track_name,
    al.title AS album_name
FROM tracks t
JOIN albums al
    ON t.album_id = al.album_id;

-- Q10. How can we display track names with their genre names?
SELECT
    t.name AS track_name,
    g.name AS genre_name
FROM tracks t
JOIN genres g
    ON t.genre_id = g.genre_id;

-- Q11. How can we display album titles with artist names?
SELECT
    al.title AS album_name,
    ar.name AS artist_name
FROM albums al
JOIN artists ar
    ON al.artist_id = ar.artist_id;

-- Q12. How can we display customer names with their invoice details?
SELECT
    c.first_name,
    c.last_name,
    i.invoice_id,
    i.total,
    i.billing_country
FROM customers c
JOIN invoices i
    ON c.customer_id = i.customer_id;

-- Q13. How can we display invoice details with track names?
SELECT
    ii.invoice_id,
    t.name AS track_name,
    ii.unit_price,
    ii.quantity
FROM invoice_items ii
JOIN tracks t
    ON ii.track_id = t.track_id;

Section 3 — Aggregate Functions and GROUP BY

-- Q14. How many tracks are available in the store?
SELECT COUNT(*) AS total_tracks
FROM tracks;

-- Q15. What is the total number of customers?
SELECT COUNT(*) AS total_customers
FROM customers;

-- Q16. What is the average price of all tracks?
SELECT ROUND(AVG(unit_price), 2) AS average_track_price
FROM tracks;

-- Q17. What is the highest track price?
SELECT MAX(unit_price) AS highest_track_price
FROM tracks;

-- Q18. What is the lowest track price?
SELECT MIN(unit_price) AS lowest_track_price
FROM tracks;

-- Q19. How many customers are there in each country?
SELECT
    country,
    COUNT(*) AS customer_count
FROM customers
GROUP BY country;

-- Q20. How many tracks belong to each genre?
SELECT
    g.name AS genre_name,
    COUNT(t.track_id) AS total_tracks
FROM genres g
LEFT JOIN tracks t
    ON g.genre_id = t.genre_id
GROUP BY g.genre_id, g.name;

-- Q21. What is the total invoice amount for each country?
SELECT
    billing_country,
    SUM(total) AS total_revenue
FROM invoices
GROUP BY billing_country
ORDER BY total_revenue DESC;

-- Q22. How many tracks are available in each album?
SELECT
    al.title AS album_name,
    COUNT(t.track_id) AS total_tracks
FROM albums al
LEFT JOIN tracks t
    ON al.album_id = t.album_id
GROUP BY al.album_id, al.title;

Section 4 — HAVING Queries

-- Q23. Which countries have more than one customer?
SELECT
    country,
    COUNT(*) AS customer_count
FROM customers
GROUP BY country
HAVING COUNT(*) > 1;

-- Q24. Which genres contain more than one track?
SELECT
    g.name AS genre_name,
    COUNT(t.track_id) AS total_tracks
FROM genres g
JOIN tracks t
    ON g.genre_id = t.genre_id
GROUP BY g.genre_id, g.name
HAVING COUNT(t.track_id) > 1;

-- Q25. Which customers have a total invoice amount greater than 20?
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
FROM customers c
JOIN invoices i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(i.total) > 20;

Section 5 — Subqueries

-- Q26. Which tracks have the highest price?
SELECT name, unit_price
FROM tracks
WHERE unit_price = (
    SELECT MAX(unit_price)
    FROM tracks
);

-- Q27. Which tracks have a price greater than the average track price?
SELECT name, unit_price
FROM tracks
WHERE unit_price > (
    SELECT AVG(unit_price)
    FROM tracks
);

-- Q28. Which customers have an invoice greater than the average invoice amount?
SELECT
    c.first_name,
    c.last_name,
    i.total
FROM customers c
JOIN invoices i
    ON c.customer_id = i.customer_id
WHERE i.total > (
    SELECT AVG(total)
    FROM invoices
);

Section 6 — Common Table Expressions (CTEs)
-- Q29. How can we calculate the total spending of each customer using a CTE?
WITH CustomerSpending AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(i.total) AS total_spent
    FROM customers c
    JOIN invoices i
        ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM CustomerSpending
ORDER BY total_spent DESC;

-- Q30. How can we find tracks priced above the average using a CTE?
WITH AveragePrice AS (
    SELECT AVG(unit_price) AS avg_price
    FROM tracks
)
SELECT
    t.name,
    t.unit_price
FROM tracks t
CROSS JOIN AveragePrice ap
WHERE t.unit_price > ap.avg_price;

Section 7 — Window Functions
-- Q31. How can we rank tracks from highest to lowest price using ROW_NUMBER?
SELECT
    name AS track_name,
    unit_price,
    ROW_NUMBER() OVER (
        ORDER BY unit_price DESC
    ) AS row_number
FROM tracks;

-- Q32. How can we rank tracks by price using RANK?
SELECT
    name AS track_name,
    unit_price,
    RANK() OVER (
        ORDER BY unit_price DESC
    ) AS price_rank
FROM tracks;

-- Q33. How can we display each invoice with the overall total invoice amount?
SELECT
    invoice_id,
    total,
    SUM(total) OVER () AS overall_invoice_total
FROM invoices;

-- Q34. How can we rank customers' invoices within each country?
SELECT
    c.first_name,
    c.last_name,
    c.country,
    i.total,
    RANK() OVER (
        PARTITION BY c.country
        ORDER BY i.total DESC
    ) AS country_invoice_rank
FROM customers c
JOIN invoices i
    ON c.customer_id = i.customer_id;

Section 8 — Business Analysis Questions

-- Q35. Which customers spend the most money?
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
FROM customers c
JOIN invoices i
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- Q36. Which country generates the highest invoice revenue?
SELECT
    billing_country,
    SUM(total) AS total_revenue
FROM invoices
GROUP BY billing_country
ORDER BY total_revenue DESC;

-- Q37. Which tracks sell the most units?
SELECT
    t.name AS track_name,
    SUM(ii.quantity) AS units_sold,
    SUM(ii.unit_price * ii.quantity) AS sales_amount
FROM invoice_items ii
JOIN tracks t
    ON ii.track_id = t.track_id
GROUP BY t.track_id, t.name
ORDER BY units_sold DESC, sales_amount DESC;

-- Q38. Which music genre is the most popular based on units sold?
SELECT
    g.name AS genre_name,
    SUM(ii.quantity) AS units_sold
FROM invoice_items ii
JOIN tracks t
    ON ii.track_id = t.track_id
JOIN genres g
    ON t.genre_id = g.genre_id
GROUP BY g.genre_id, g.name
ORDER BY units_sold DESC;

-- Q39. Which artists generate the highest track sales?
SELECT
    ar.name AS artist_name,
    SUM(ii.unit_price * ii.quantity) AS sales_amount
FROM invoice_items ii
JOIN tracks t
    ON ii.track_id = t.track_id
JOIN albums al
    ON t.album_id = al.album_id
JOIN artists ar
    ON al.artist_id = ar.artist_id
GROUP BY ar.artist_id, ar.name
ORDER BY sales_amount DESC;
