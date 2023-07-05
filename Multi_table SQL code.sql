#1.manager's name at easch store , with full address of each property
SELECT
	 staff.first_name AS manager_first_name,
     staff.last_name AS manager_last_name,
     address.address AS street_address,
     address.district AS district,
     city.city AS city,
     country.country AS country
     
FROM store
INNER JOIN staff ON store.store_id=staff.store_id
INNER JOIN address ON staff.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id;

#2. Pull together a list of each inventory item you have stocked including the store_id number, the inventory_id, the name of the film, the film's rating, its rental rate, and replacement cost

SELECT
	inventory.inventory_id,
	inventory.store_id,
    film.title,
    film.rating,
    film.rental_rate,
    film.replacement_cost
    
FROM inventory
LEFT JOIN film
ON inventory.film_id = film.film_id
ORDER BY inventory_id
LIMIT 5000;


#3. total number of inventory items with each rating at each store
SELECT
	inventory.store_id,
    film.rating,
    count(inventory.inventory_id) as inventory_items
FROM inventory
LEFT JOIN film
ON inventory.film_id = film.film_id
GROUP BY rating,
store_id
LIMIT 5000;

#4. total numbers of films, average replacement cost, and total replacement cost sliced by strore and category.

SELECT 
	inventory.store_id as store,
    category.name as category,
	count(inventory.film_id) as total_numbers_of_films,
	-- category.category
    avg(film.replacement_cost) as average_replacement_cost,
    sum(film.replacement_cost) as total_replacement_cost
    
    
FROM inventory
LEFT JOIN film 
ON inventory.film_id = film.film_id
LEFT JOIN film_category
ON film.film_id = film_category.film_id
LEFT JOIN category
ON category.category_id = film_category.category_id

GROUP BY store_id, name
LIMIT 5000;

#5. list of all customers name, stores they go to, whether or not they are active, and their full address- street sddress, city, and country

SELECT
	customer.first_name,
    customer.last_name,
    customer.store_id,
    case
    when customer.active = 1 then 'active' 
    when customer.active = 0 then 'inactive' 
    else null end as status,
    address.address as street_address,
    city.city,
    country.country 
    
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id;



#6. list of custmers name, their total lifetime rentals, and the sum of all payments collected from them with the most spending customers on the top

SELECT
	 customer.first_name,
     customer.last_name,
     count(payment.rental_id) as total_rentals,
     sum(payment.amount) as total_spent
     
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name
ORDER BY total_spent DESC;

-- or

SELECT
customer.first_name,
customer.last_name,
COUNT(rental.rental_id) AS lifetime_rentals,
SUM(payment.amount) AS total_lifetime_value

FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
LEFT JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY
customer.first_name,
customer.last_name
ORDER BY SUM(payment.amount) DESC;




#7. list of advisor and investor in one table with thier role and and which company does the investors work with

SELECT 
	    'advisor' as type,
        advisor.first_name,
        advisor.last_name,
        'N/A' as company_name
        
FROM advisor
UNION
SELECT 
		'investor' as type,
        investor.first_name,
        investor.last_name,
        investor.company_name
FROM investor;
        

#8. out of all the actors with three types of award, for what % of them do we carry a film, same thing with two types of awards, and only one award?

SELECT
	CASE
    WHEN actor_award.awards ='Emmy, Oscar, Tony ' THEN '3 awards'
    WHEN actor_award.awards IN ('Emmy, Oscar','Oscar, Tony',' Emmy, Tony' ) THEN '2 awards'
    ELSE '1 award'
    END AS number_of_awards,
    AVG(CASE WHEN actor_award.actor_id IS NULL THEN 0 ELSE 1 END) AS pct_w_1_film
FROM actor_award
GROUP BY 
CASE 
    WHEN actor_award.awards ='Emmy, Oscar, Tony ' THEN '3 awards'
    WHEN actor_award.awards IN ('Emmy, Oscar','Oscar, Tony',' Emmy, Tony' ) THEN '2 awards'
    ELSE '1 award'
END;



	


     
     
     









    
    
    
    
    
   
	





















    
	



    
    
 
    
    
    
	










     
     
 