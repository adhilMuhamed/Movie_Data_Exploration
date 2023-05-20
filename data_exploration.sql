#List all details of actors
Select * from actor;

#List all customer information from DB
Select * from customer;

#List different countries
select * from countries;

#Display all active customers.
Select * from customer where active=1;

#List of all rental IDs for customer with ID 1
Select rental_id from rental where customer_id=1;

#List the total number of payments whose amount is greater than $5
select count(payment_id) AS count from payment where amount>5;

#Display all the films whose rental duration is greater than 5
select * from film where rental_duration>5;

#List the total number of films whose replacement cost is greater than $15 and less than $20
select count(title) from film where replacement_cost>15 AND replacement_cost<20;

#Find the number of films whose rental rate is less than $1
select count(title) from film where rental_rate<1;


#Display the count of unique first names of actors
select count(distinct(first_name)) from actor;

#Display the first 10 records from customer table
select * from customer limit 10;

#Display the first 3 records from the customer table whose first name starts with ‘b’
select * from customer where first_name like "b%" limit 3;

#Display the names of the first 5 movies which are rated as ‘G’
select * from film where rating='G' limit 5;

#Find all customers whose first name starts with "a"
select * from customer where first_name like "a%";

#Find all customers whose first name ends with "a"
select * from customer where first_name like "%a";

#Display the list of first 4 cities which start and end with ‘a’
select * from city where city like 'a%a' limit 4;

#Find all customers whose first name have "NI" in any position
select * from customer where first_name like "%NI%";

#Find all customers whose first name have "r" in the second position
select * from customer where first_name like "_r%";

#Find all customers whose first name starts with "a" and are at least 5 characters in length
select * from customer where first_name like "a____%";

#Find all customers whose first name starts with "a" and ends with "o"
select * from customer where first_name like "a%o";

#Display the actors name in Capital letters
select upper(first_name) from actor;

#Display all films whose title length is greater than 10 characters
select * from film where length(title)>10;

#Display the first eight characters of the film title
select left(title,8) from film;

#Combine first name and last name of all actors and display with a ‘-’ between them
select concat(first_name,"-",last_name) as concat from actor;

#smallest rental duration
select min(rental_duration) from film;

#the highest replacement cost amongst all the films
select max(replacement_cost) from film;

#What is the average length of the movie
select avg(length) from film;

#How many films did the actor with actor id 1 work in ?
select count(film_id) from film_actor where actor_id=1;

#What is the total replacement cost of the movies whose rating is G
select sum(replacement_cost) from film where rating='G';

#Query to find  the date difference between two given dates '2023-10-19', and '2023-10-23',
SELECT DATEDIFF('2023-10-23', '2023-10-19') AS date_difference;

#Given a date '2023-03-23', write the query to add 10 days to it.
select adddate('2023-03-23',10);

#Given a date '2023-03-23', get the month number from it
select month('2023-03-23');

#Pull a list of the first name, last name, and email of each customer in order to send a mailer to all your staff members to notify them regarding a management change.
select first_name,last_name,email from customer;

#Display all the cities in India
select * from city;
select * from country;

select  c.city from city c join country co on c.country_id=co.country_id where co.country='India';

#Display the names of actors and the names of the films they have acted in.
select * from actor;
select * from film_actor;
select * from film;

select a.first_name, f.title from actor a join film_actor fa on a.actor_id=fa.actor_id join film f on fa.film_id=f.film_id;

#Display the film names and the category of the films they fall into.
select * from film;
select * from film_category;
select * from category;

select f.title, c.name from film f join film_category fc on f.film_id=fc.film_id join category c on fc.category_id=c.category_id;

#Display all number of films in the category ‘Action’
select * from film;
select * from film_category;
select * from category;

select f.title,c.name from film f join film_category fc on f.film_id=fc.film_id join category c on fc.category_id=c.category_id where c.name='action';

#Display the list of films, their actors where the length of the film is greater than 100 mins
select * from film;
select * from film_actor;
select * from actor;

SELECT 
    f.title,a.first_name
FROM
    film f
        JOIN
    film_actor fa ON f.film_id = fa.film_id
    join 
    actor a on fa.actor_id=a.actor_id
       where f.length>100;
       
       
#Display all the actor’s names who worked in either Animation or Children movies
select * from film;
select * from film_category;
select * from category;
select * from film_actor;
select * from actor;

SELECT 
    first_name, last_name
FROM
    film f
        INNER JOIN
    film_actor fa ON f.film_id = fa.film_id
        INNER JOIN
    film_category fc ON f.film_id = fc.film_id
        INNER JOIN
    category c ON fc.category_id = c.category_id
        INNER JOIN
    actor aa ON aa.actor_id = fa.actor_id
WHERE
    name = 'Animation' OR name = 'Children';
    
    
#Display the cities from India whose names start with ‘B’
select  c.city from city c join country co on c.country_id=co.country_id where co.country='India' AND c.city like "B%";

#Display all the customers whose name starts with A and lives in India
select * from customer;
select * from country;
select * from address;

SELECT 
    first_name, last_name, CITY, country
FROM
    customer c
        INNER JOIN
    address a ON c.address_id = a.address_id
        INNER JOIN
    city ON a.city_id = city.city_id
        INNER JOIN
    country ON city.country_id = country.country_id
WHERE
    country = 'INDIA'
        AND first_name LIKE 'A%';
        
#Display the count of addresses in Australia
SELECT 
    COUNT(*) as count
FROM
    address a
        INNER JOIN
    city ci ON a.city_id = ci.city_id
        INNER JOIN
    country co ON ci.country_id = co.country_id
WHERE
    country = 'Australia';
    
#Display the names of customers who are from France
select * from customer;
select * from address;
select * from city;
select * from country;

SELECT 
    c.first_name
FROM
    customer c
        JOIN
    address a ON c.address_id = a.address_id
        JOIN
    city ci ON a.city_id = ci.city_id
        JOIN
    country co ON ci.country_id = co.country_id
WHERE
    co.country = 'france';


#Display all cities from India which start with the letter A
select * from city;
select  c.city from city c join country co on c.country_id=co.country_id where co.country='India' and c.city like "A%";

#Display the names and addresses of the customer whose first name starts with ‘A’ from countries which starts with the letter ‘C‘ and are active.
select * from customer;
select * from address;
select * from city;
select * from country;

SELECT 
    c.first_name, a.address
FROM
    customer c
        JOIN
    address a ON c.address_id = a.address_id
        JOIN
    city ci ON a.city_id = ci.city_id
        JOIN
    country co ON ci.country_id = co.country_id
WHERE
    co.country LIKE 'C%'
        AND c.first_name LIKE 'A%';


#Create a quick reference of a list of distinct titles and their descriptions available in inventory at store 2 to provide easy information about titles.
select * from film_text;
select * from inventory;

select distinct(f.title),f.description from film_text f join inventory i on f.film_id=i.film_id where store_id=2;

#List down the managers’ names at each store with the full address of each property
select * from store;
select * from staff;

select * from store st join staff sa on st.store_id=sa.store_id join address a on sa.address_id=a.address_id;

#Provide list of each inventory item, including store_id, inventory_id, title, film’s rating, rental rate, and replacement cost
select * from inventory;


select * from inventory i join film f on i.film_id=f.film_id;

#List of all customer names, which store they go to, active or inactive, full address
SELECT 
    *
FROM
    customer c
        INNER JOIN
    store s ON c.store_id = s.store_id
        INNER JOIN
    address a ON a.address_id = c.address_id;
    
    
/*Understand the replacement cost of your film — Identify replacement costs for films that are
1) least expensive to replace,
2) most expensive to replace, and
3) the average replacement cost of all the films in store.*/

select min(replacement_cost) as least,max(replacement_cost) as most,avg(replacement_cost) as average from film;

select title from film where replacement_cost=(select min(replacement_cost) from film);

select title from film where replacement_cost=(select max(replacement_cost) from film);

select title from film where replacement_cost=(select avg(replacement_cost) from film);


#Write a SQL query to count the number of characters except for the spaces for each actor.Return the first 10 actors' name lengths along with their names.
Select concat(first_name,' ',last_name) as Actor_Name, length(concat(trim(first_name),trim(last_name))) as lengths from actor limit 10;



#List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.
select * from actor_award;
Select concat(first_name,' ',last_name) as Actor_Name, length(concat(first_name,last_name)) as lengths from actor_award where awards not LIKE "%oscar%";
Select concat(first_name,' ',last_name) as Actor_Name, awards from actor_award where awards LIKE "%,%";
Select concat(first_name,' ',last_name) as Actor_Name,  awards from actor_award where awards like "%oscar%" or awards like "%emmy%";

#Find the actors who have acted in the film ‘Frost Head.’
select * from film where title='frost head';
select * from film_actor where film_id=341;
Select * from actor;

select concat(first_name,' ',last_name) as Actor_Name from film f join film_actor fa on f.film_id=fa.film_id join actor a on fa.actor_id=a.actor_id where title='frost head';

#Pull all the films acted by the actor ‘Will Wilson.’
select * from actor where first_name='will';
select * from film_actor where actor_id=168;
select * from film;

select title  from film f join film_actor fa on f.film_id=fa.film_id join actor a on fa.actor_id=a.actor_id where first_name='will' AND last_name='wilson';

#Pull all the films which were rented and return them in the month of May.
select * from rental;
select * from film;
select * from inventory;

select title from rental r join inventory i on r.inventory_id=i.inventory_id join film f on i.film_id=f.film_id where month(rental_date)=5 and month(return_date)=5;


#Pull all the films with ‘Comedy’ category.
select * from film;
select * from category;
select * from film_category;

select title,name from film f join film_category fc on f.film_id=fc.film_id join category c on fc.category_id=c.category_id where name='Comedy';

#Get the customers whose first name starts with a vowel and ends with a consonant. 
select first_name from customer where first_name regexp '^[aeiou]' and first_name regexp '[^aeiou]$';

##Get the movies which has gold in its title. 
select * from film where title regexp 'gold';

#Get the customer first and last name whose postal code starts with 9 and ends with 5. 
select * from address;
select * from customer;

select c.first_name,c.last_name from customer c join address a on c.address_id=a.address_id where a.postal_code regexp '^9' and a.postal_code regexp '5$' ;

#Get the films which are based on the subject ‘student’ 

select * from film where description regexp 'student';

#Find the customers whose last name does not contain w, j and b characters 

select last_name from customer where last_name regexp '[^wjb]';

#ind the customers whose address starts with 1 and ends with parkway 

select * from address;

select c.first_name,c.last_name,a.address from customer c join address a on c.address_id=a.address_id where a.address regexp '^1' and a.address regexp 'parkway$' ;

select c.first_name,c.last_name,a.address from customer c join address a on c.address_id=a.address_id where a.address regexp '^1.*parkway$' ;


#Write a query to group the rental data by customer_id. 

select customer_id,count(rental_id) as count from rental group by customer_id;

#Modify the above query to order the customers based on the number of rentals in descending order. 

select customer_id,count(rental_id) as rental_count from rental group by customer_id order by rental_count desc;

# Write a query to count the number of payments made by each customer. Show the customer id, the number of rentals and the total amount paid for each customer. 

select customer_id,count(rental_id) as rental_count , sum(amount) as total_amount from payment group by customer_id;

# Modify the above query to include only those customers who have made at least 20 payments. 

select customer_id,(rental_id) as rental_count , sum(amount) as total_amount from payment group by customer_id having count(payment_id)>20;

#Write a query to find the number of films acted by each actor_id using film_actor table

select actor_id,count(film_id) as film_count from film_actor group by actor_id;

#Write a query to find the total number of films acted by each actor grouped by the film rating. 
select * from film_actor;
select * from actor;
select * from film;

select a.actor_id,rating,count(f.film_id) as rating_count from film f join film_actor fa on f.film_id=fa.film_id join actor a on fa.actor_id=a.actor_id group by f.rating,a.actor_id order by actor_id;


#Using roll up, modify the above query to find the total count for each distinct actor i.e. find the total number of films each actor has acted along with the count of different ratings. 


select actor_id,rating,count(*) from film_actor fa join film f on fa.film_id=f.film_id group by actor_id,rating with rollup;

#Write a query to group the rentals by year and count them.

select year(rental_date),rental_date,count(*) from rental group by year(rental_date),date(rental_date) with rollup;


#Construct a query against the film table that uses a filter condition with a noncorrelated subquery against the category table to find all Horror films.

select * from film;
select * from category;
select * from film_category;

select title from film where film_id IN (select film_id from film_category where category_id IN(select category_id from category where name='horror'));


# Write a query that returns all cities that are not in China. 

select * from city;
select * from country;

select * from city where country_id != (select country_id from country where country='china');

#Write a query that returns all cities that are in India or Pakistan.

select * from city where country_id IN (select country_id from country where country='india' or country='pakistan');

# Write a query to find all customers who have never gotten a free film rental. (ie the zero amount paid for a rental). Use the all operator. 

select * from rental;
select * from customer;
select * from film;
select * from payment;
 
select * from customer where customer_id not in (select customer_id from payment where amount=0);

#Write a query to count the number of film rentals for each customer and the containing query then retrieves those customers who have rented exactly 30 films.

select * from rental;
select * from customer;
select * from film;
select * from payment;

select * from customer where customer_id in
(select customer_id from (select customer_id,count(rental_id) as rental_count from rental group by customer_id having rental_count=30) as t);

select * from customer c
where (select count(*) from rental r where r.customer_id = c.customer_id) = 30;

#Write a query to find all customers whose total payments for all film rentals are between 100 and 150 dollars.
select * from payment;
select * from customer;

select * from customer c
where (select sum(amount) from payment p where p.customer_id = c.customer_id) 
between 100 and 150;

# Write a query to find all the customers who rented at least one film prior to June 01 2005 without regard for how many films were rented. 

select * from rental;


select * from customer c
where exists  (select * from rental r where r.customer_id = c.customer_id and date(r.rental_date)< '2005-06-01');

#Construct a query against the film table that uses a filter condition with a correlated subquery against the category table to find all Horror films.

Select f.title
From film f
Where exists
(select 1
From film_category fc inner join category c
On fc.category_id = c.category_id
Where c.name = 'Horror'
And fc.film_id = f.film_id);


#Write a query to generate a list of customer IDs along with the number of film rentals and the total payments.

Select c.first_name, c.last_name, pymnt.num_rentals, pymnt.tot_payments
From customer c
Inner join
(select customer_id,
count(*) num_rentals, sum(amount) tot_payments from payment
Group by customer_id
) pymnt
On c.customer_id = pymnt.customer_id;


#Write a query to find the titles of all the films that have never been rented out.

select * from film f
where film_id not in
(select distinct film_id from inventory);

#Write a query to find the names of all the customers who rented out a film that was also rented out by the customer with customer_id 20.
select * from inventory;

select first_name, last_name from customer where customer_id in(
select customer_id from rental r join inventory i on r.inventory_id=i.inventory_id
where film_id in (
select film_id from rental r join inventory i on r.inventory_id=i.inventory_id
where customer_id=20
) and customer_id<>20
);























