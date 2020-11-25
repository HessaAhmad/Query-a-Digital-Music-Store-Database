
/*Query 1-Query used for first Insight:Top 5 Total AmountSpent based on Customer.*/
SELECT  Customer.CustomerId, Customer.FirstName, sum (Invoice.Total)
FROM Invoice
JOIN Customer
ON Invoice.CustomerId=Customer.CustomerId
GROUP BY Customer.CustomerId
ORDER BY sum (Invoice.Total) DESC
LIMIT 5

/*Query 2-Query used for second Insight: Is there a trend for the quantity of that track were purchased on invoice based on a year? */
SELECT STRFTIME('%Y',Invoice.InvoiceDate),count(InvoiceLine.Quantity)
FROM Invoice
JOIN InvoiceLine
ON Invoice.InvoiceId = InvoiceLine.InvoiceId
GROUP BY 1
ORDER BY 1 ;

/*Query 3-Query used for third Insight:What is the price of most music type in USD?*/
select Genre.Name, count (Track.TrackId)*Track.UnitPrice
 from track
 join Genre
 on Track.GenreId = Genre.GenreId
group by 1
order by 2 desc 



/*Query 4-Query used for the fourth Insight:The top ten of artists to produce albums */
select Artist.Name , count(Album.ArtistId) 
from Album
join Artist
on Album.ArtistId=Artist.ArtistId
group by Album.ArtistId 
order by  count(Album.ArtistId) DESC
LIMIT 10;