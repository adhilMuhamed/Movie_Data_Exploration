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



























