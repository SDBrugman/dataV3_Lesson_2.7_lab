Use sakila;

-- Part 1 --

drop table if exists films_2020;

CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

show variables like 'local_infile';
set global local_infile = 1;
set global local_infile=true;

#Delete films_2020 from sakila;
load data local infile 'C:/Users/ROB3942/ironhack/unit2/day4/dataV3_Lesson_2.7_lab/files_for_part1/films_2020.csv'
into table films_2020
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(film_id,title,description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating);

show global variables like 'local_infile';

select *
from films_2020;

select *
from film;

-- Update empty columns --
update films_2020
set rental_duration = 3, rental_rate = '2.99', replacement_cost = '8.99';

-- Part 2 --
-- 1 --
SELECT first_name, last_name
from actor
group by last_name;

-- 2 --
SELECT first_name, last_name
from actor
order by last_name;

-- 3 --
SELECT staff_id, count(rental_id) AS NrOfRentals
from rental
group by staff_id;

-- 4 --
SELECT release_year, title, count(film_id) AS FilmEachYear
from film;

-- 5 --
SELECT *
from film;

SELECT rating, count(film_id) AS NrOfFilmsEachRating
from film
Group by rating
Order by rating;

-- 6 --
SELECT rating, round(avg(length),2) AS AvgLengthRating
from film
Group by rating
Order by rating;

-- 7 --
SELECT rating, round(avg(length),2) AS AvgLengthRating
from film
Group by rating
having AvgLengthRating > 120
Order by rating;