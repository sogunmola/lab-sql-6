/* 1) Add new films from films_2020 table to films Table
*/
-- Set database to be used
USE sakila;

-- Insert table value from film_2020 to film table [DON'T RERUN]
INSERT INTO film (film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update) 
SELECT NULL, title, description, release_year, language_id, NULL, 3, 2.99, length, 8.99, rating, special_features, curdate() 
FROM film_2020;

-- film check
SELECT * FROM film
WHERE film_id >= 1001;

/* 2)  Update inventory
*/
-- Move all current films in inventory to store 1
-- Inventory check
SELECT * FROM inventory
WHERE film_id <= 1001 AND store_id = 2;

-- Updating old inventory in store_id 2 to new store_id 1 [DON'T RERUN]
UPDATE inventory
SET store_id = 1
WHERE store_id = 2;

-- Inventory check
SELECT * FROM inventory
WHERE store_id = 2;

-- Adding new films from films_2020 to inventory [DON'T RERUN]
INSERT INTO inventory (inventory_id, film_id, store_id, last_update)
SELECT NULL, film_id, 2, CURDATE()
FROM film
WHERE film_id >= 1001;

-- Inventory check
SELECT * FROM inventory
WHERE store_id = 2;




