               --- Set 1 
---Q1. Who is the senior most employee based on job title ?
Select * from employee
ORDER BY levels desc
limit 1

---Q2. Which countries have the most invoices ?
select count(*) as c , billing_country from invoice
group by billing_country
order by c desc 

---Q3. What are top 3 values of total invoice ?
select total from invoice
order by total desc
limit 3

---Q4. Which city has the best customers ? we would like to throw a promotional Music FAestival in the city we made the most money.
---Write a query that returns one city that has the highest sum of invoice totals. Return both the city name and sum of all invoice totals ?
select sum(total) as invoice_total , billing_city from invoice
group by billing_city
order by invoice_total desc
limit 1
---Q5.Who is the best customer ? The customer who has spent the most money will be declared the best customer.
---Write qery that returns the person who has spent the most money.
select customer.customer_id , customer.first_name , customer.last_name , sum(invoice.total) as total from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total Desc
limit 1

           ---Set 2 
---Q1. Write query to return the email , firstname , lastname and Genre all the Rock Music listners.Return your list ordered alphabetically by email starting with A .
select distinct customer.email, customer.first_name, customer.last_name, genre.name as genre
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
order by customer.email asc;

---Q2. Let's invite the artist who have written the most rock music in our dataset.Write a query that return the Artist name and total track count of the top 10 rock band.
select artist.name as artist_name, count(track.track_id) as track_count
from artist
join album on artist.artist_id = album.artist_id
join track on album.album_id = track.album_id
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
group by artist.name
order by track_count desc
limit 10;

---Q3.Return all the track names that have a song length longest than the average song length.Return the Name and Milliseconds for each track.
---Order by the song length with the longest songs listed first.
select name, milliseconds
from track
where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc;
                   Set 3
---Q1.Find how much amount spent by each customer on artist? Write a query to return customer name, artist name and total spent.
select customer.first_name || ' ' || customer.last_name as customer_name,
       artist.name as artist_name,
       sum(invoice_line.unit_price * invoice_line.quantity) as total_spent
from invoice
join customer on invoice.customer_id = customer.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join album on track.album_id = album.album_id
join artist on album.artist_id = artist.artist_id
group by customer_name, artist_name
order by total_spent desc;

---Q2.We want to find out the most popular music Genre for each country.We determine the most popular genre as the genre with the highest amount of purchases.
---Write a query that return return each country along with the top genre.For countries where the maximum number of purchase is shared return all genre. 
select country, genre, total_purchases
from (
    select customer.country,
           genre.name as genre,
           count(invoice_line.quantity) as total_purchases,
           rank() over (partition by customer.country order by count(invoice_line.quantity) desc) as rnk
    from invoice_line
    join invoice on invoice.invoice_id = invoice_line.invoice_id
    join customer on customer.customer_id = invoice.customer_id
    join track on track.track_id = invoice_line.track_id
    join genre on genre.genre_id = track.genre_id
    group by customer.country, genre.name
)
where rnk = 1
order by country;

---Q3.Write a query that determines the customer that has spent the most on music for each country.Write a query that return the country along with the 
---top customer and how much they spent.For countries where the top amount spent is shared,provide all customer who spent this amount.
select country, first_name, last_name, total_spent
from (
    select customer.country,
           customer.first_name,
           customer.last_name,
           sum(invoice.total) as total_spent,
           rank() over (partition by customer.country order by sum(invoice.total) desc) as rnk
    from customer
    join invoice on customer.customer_id = invoice.customer_id
    group by customer.country, customer.customer_id
)
where rnk = 1
order by country;
















































 
