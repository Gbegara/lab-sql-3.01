CREATE TABLE `payment` (
  `payment_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `rental_id` mediumint UNIQUE,
  `amount` float,
  `payment_date` timestamp,
  `last_update` timestamp
);

CREATE TABLE `rental` (
  `rental_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `inventory_id` mediumint,
  `customer_id` mediumint,
  `rental_date` timestamp,
  `return_date` timestamp,
  `last_update` timestamp
);

CREATE TABLE `inventory` (
  `inventory_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `film_id` mediumint,
  `store_id` mediumint,
  `last_update` timestamp
);

CREATE TABLE `customer` (
  `customer_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `address_id` mediumint,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `active` boolean,
  `create_date` timestamp,
  `last_update` timestamp
);

CREATE TABLE `city` (
  `city_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `country_id` mediumint,
  `city` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `country` (
  `country_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `country` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `staff` (
  `staff_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `address_id` mediumint,
  `store_id` mediumint,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `username` varchar(255),
  `password` varchar(255),
  `email` varchar(255),
  `picture` blob,
  `active` boolean,
  `last_update` timestamp
);

CREATE TABLE `language` (
  `language_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `last_update` timestamp
);

CREATE TABLE `language_film` (
  `language_id` mediumint,
  `film_id` mediumint,
  `last_update` timestamp
);

CREATE TABLE `film` (
  `film_id` mediumint PRIMARY KEY,
  `category_id` mediumint,
  `original_language_id` mediumint,
  `title` varchar(255),
  `description` blob,
  `release_year` varchar(4),
  `length` mediumint,
  `replacement_cost` mediumint,
  `rating` varchar(10),
  `special_features` varchar(100),
  `last_update` timestamp
);

CREATE TABLE `actor` (
  `actor_id` mediumint PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(45),
  `last_name` varchar(45),
  `last_update` timestamp
);

CREATE TABLE `film_actor` (
  `actor_id` mediumint,
  `film_id` mediumint,
  `last_update` timestamp
);

CREATE TABLE `address` (
  `address_id` int PRIMARY KEY AUTO_INCREMENT,
  `city_id` int,
  `address` varchar(50),
  `address2` varchar(50),
  `district` varchar(20),
  `postal_code` varchar(10),
  `phone` varchar(20),
  `last_update` timestamp
);

CREATE TABLE `store` (
  `store_id` int PRIMARY KEY AUTO_INCREMENT,
  `manager_staff_id` int,
  `address_id` int,
  `last_update` timestamp
);

CREATE TABLE `category` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(20),
  `last_update` timestamp
);

ALTER TABLE `payment` ADD FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

ALTER TABLE `customer` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `city` ADD FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

ALTER TABLE `staff` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `staff` ADD FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

ALTER TABLE `language_film` ADD FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`);

ALTER TABLE `language_film` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `film` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

ALTER TABLE `film` ADD FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`);

ALTER TABLE `film_actor` ADD FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`);

ALTER TABLE `film_actor` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `address` ADD FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`manager_staff_id`) REFERENCES `staff` (`staff_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);
