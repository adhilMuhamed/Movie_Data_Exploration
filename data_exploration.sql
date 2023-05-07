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
































