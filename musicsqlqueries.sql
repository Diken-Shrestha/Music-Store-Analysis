-- Basic SQL queries

-- 1. List of all the customers
select * from customer;

-- 2. Find all tracks by a specific composer (e.g., "AC/DC")
select * from track
where composer = 'AC/DC';

-- 3. Find all tracks by a specific artist (e.g., "Aerosmith")
select * from track
join album2 on album2.album_id = track.album_id
join artist on artist.artist_id = album2.artist_id
where artist.Name = 'Aerosmith';


-- 4. Shows all invoice with a total greater than 
select * from invoice
where total > 10
order by total desc;

-- 5. Shows the country with total number of customers
select country, count(*) as NumberofCustomer from customer
group by country
order by NumberofCustomer desc;

-- 6. Total number of tracks in the database
SELECT COUNT(*) AS total_tracks 
FROM track;

-- 7. Names of all artist 
select name from artist;

-- 8. Find customers from a specific country
select * from customer 
where country = 'USA';


-- 9. All employes and their title
select first_name, last_name, title from employee;

-- 10. Total revenue of each invoice
SELECT invoice_id, total 
FROM invoice;


-- 11. List of tracks in a specific playlist
select * from track
join playlist_track on track.track_id = playlist_track.track_id
join playlist on playlist.playlist_id = playlist_track.playlist_id
where playlist.name = 'Heavy Metal Classic';


-- 12. Find all unique billing countries
SELECT DISTINCT billing_country 
FROM invoice;


-- Intermediate SQL Queries

-- List all employees and the number of customers they manage
SELECT e.first_name, e.last_name, COUNT(c.customer_id) AS managed_customers
FROM employee e
LEFT JOIN customer c ON e.employee_id = c.support_rep_id
GROUP BY e.employee_id, e.first_name, e.last_name;


-- Total revenue by country
select billing_country, round(sum(total), 2) as Total_Revenue from invoice 
group by billing_country
order by Total_Revenue desc;


-- Identify the most popular genre by the number of tracks sold
SELECT g.name AS genre, COUNT(il.track_id) AS tracks_sold 
FROM invoice_line il 
JOIN track t ON il.track_id = t.track_id 
JOIN genre g ON t.genre_id = g.genre_id 
GROUP BY g.name 
ORDER BY tracks_sold DESC;

-- Customers who have spent more than $50
select first_name, last_name, sum(i.total) as total_spent from customer c
join invoice i on i.customer_id = c.customer_id
GROUP BY c.customer_id,first_name, last_name 
HAVING total_spent > 50
order by total_spent desc;
 
 
 -- List the total duration of all tracks in each playlist
SELECT p.name AS playlist, SUM(t.milliseconds / 60000) AS total_duration_minutes 
FROM playlist p 
JOIN playlist_track pt ON p.playlist_id = pt.playlist_id 
JOIN track t ON pt.track_id = t.track_id 
GROUP BY p.name;


-- Employees with no customer assigned
SELECT e.first_name, e.last_name 
FROM employee e 
LEFT JOIN customer c ON e.employee_id = c.support_rep_id 
WHERE c.customer_id IS NULL;



-- Advanced SQL 
-- Most profitable genre in terms of revenue

select g.name as GenreName, sum(il.unit_price * il.quantity) as total_revenue from genre g
join track t on t.genre_id = g.genre_id
join invoice_line il on il.track_id = t.track_id 
group by g.name
ORDER BY total_revenue DESC ;

-- Revenue contribution of each employee's customers and how many customers they worked with
select e.first_name, e.last_name, count(e.first_name), sum(i.total) as total_revenue from employee e
join customer c on e.employee_id = c.support_rep_id
join invoice i on c.customer_id = i.customer_id
group by e.employee_id,e.first_name, e.last_name
order by total_revenue desc;


-- Identify customers who purchased tracks from more than 3 different genres
select c.first_name, c.last_name, count(Distinct g.genre_id) as DifferentGenre from customer c
join invoice i on i.customer_id = c.customer_id
join invoice_line il on il.invoice_id = i.invoice_id
join track t on t.track_id = il.track_id
join genre g on g.genre_id = t.genre_id
group by c.customer_id, c.first_name, c.last_name
having DifferentGenre > 3
order by DifferentGenre desc;

-- Top selling track in each genre
SELECT g.name AS genre, t.name AS track, SUM(il.quantity) AS total_sold from genre g
join track t on t.genre_id = g.genre_id
join invoice_line il on il.track_id = t.track_id 
group by g.name, t.name
ORDER BY g.name, total_sold DESC;


-- % of revenue contributed by each genre 
SELECT g.name AS genre, 
       SUM(il.unit_price * il.quantity) AS genre_revenue, 
       (SUM(il.unit_price * il.quantity) / (SELECT SUM(unit_price * quantity) FROM invoice_line) * 100) AS percentage_revenue 
FROM invoice_line il 
JOIN track t ON il.track_id = t.track_id 
JOIN genre g ON t.genre_id = g.genre_id 
GROUP BY g.name 
ORDER BY percentage_revenue DESC;





