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





