use sakila;
select * from staff;

-- 1. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer
WHERE first_name LIKE 'Tammy';

SELECT * FROM staff;

INSERT INTO staff(first_name, last_name, address_id, email, store_id, active, username) -- email TAMMY.SANDERS@sakilacustomer.org address_id 79 and avtive 1
VALUES
('Tammy','Sanders',79,'TAMMY.SANDERS@sakilacustomer.org', '2', '1', 'Tammy');

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.
	--  Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information.
	-- For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
 select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select * from rental;  
select * from film
where title like 'Academy Dinosaur';
select * from inventory
where film_id = 1;

			-- This is the actual code to insert the data into the table
INSERT INTO rental(rental_date, inventory_id, customer_id, staff_id)
VALUES
(current_date(), 1 , 130, 1);
			-- Checking the input
select * from rental
where inventory_id = 1;
