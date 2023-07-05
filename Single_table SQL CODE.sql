#1. list of all staff members with their first name, last name, emaill-addresses and store where they work

SELECT
	first_name,
    last_name,
    email,
    store_id
FROM staff

#2. Seperate counts of inventory at each store

SELECT
	store_id,
    count(inventory_id) as inventory_in_stores
FROM inventory
GROUP BY store_id;

#3. Active customers in each stores
SELECT 
	store_id,
    COUNT(CASE WHEN ACTIVE = 1 THEN store_id else NULL END)  as activecustomer_1
 FROM customer
 GROUP BY store_id
 
 
 #4. Count of all customer's email to avoid data breach
 SELECT distinct
	 count(email) as total_number_of_email
 FROM customer
 where email is not null
 
#5. Unique Film category and  title
SELECT 
	store_id,
    count(distinct film_id) as uniques_film	
FROM inventory
GROUP BY store_id;
 
 SELECT 
    count(distinct category_id) as uniques_categories
FROM category

 
 #6films least expensive, most expensive for replacement and avearage of all the movies
SELECT
	min(replacement_cost) as least_expensive,
    max(replacement_cost)as most_expensive,
   avg(replacement_cost) as average_cost
 FROM film
 
 
 #7 Average payment processed and the maximum payment processed
 
 SELECT 
    avg(amount)as average_payment,
    max(amount) as maximum_payment
 FROM payment

 #8 All customers identifications with counts of rentals made and place the highest volume customer on the top
 
 SELECT
	customer_id,
	COUNT(rental_id) As number_of_rentals
 FROM rental
 GROUP BY customer_id
 ORDER BY number_of_rentals DESC;
 
 
 
 
 
 
 

 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
	
    






