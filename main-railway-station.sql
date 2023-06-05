DROP TABLE IF EXISTS `employees`;
DROP TABLE IF EXISTS `schedules`;
DROP TABLE IF EXISTS `carriers`;
DROP TABLE IF EXISTS `trains`;
DROP TABLE IF EXISTS `tickets`;
DROP TABLE IF EXISTS `passengers`;
DROP TABLE IF EXISTS `routes`;
DROP TABLE IF EXISTS `city_route`;
DROP TABLE IF EXISTS `cities`;

DROP PROCEDURE IF EXISTS `create_ticket`;
DROP PROCEDURE IF EXISTS `cancel_ticket`;
DROP PROCEDURE IF EXISTS `get_available_seats`;

CREATE TABLE `employees` (
  `id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255) UNIQUE,
  `carrier_id` int
);

CREATE TABLE `schedules` (
  `id` int PRIMARY KEY,
  `start_time` time,
  `route_id` int
);

CREATE TABLE `carriers` (
  `id` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `trains` (
  `id` int PRIMARY KEY,
  `number_of_seats` int,
  `model` varchar(255),
  `carrier_id` int,
  `schedule_id` int
);

CREATE TABLE `tickets` (
  `train_id` int,
  `passenger_id` int
);

CREATE TABLE `passengers` (
  `id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `discount` int
);

CREATE TABLE `routes` (
  `id` int PRIMARY KEY
);

CREATE TABLE `city_route` (
  `route_id` int,
  `city_id` int,
  `city_order` int
);

CREATE TABLE `cities` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `latitude` float,
  `longitude` float
);

ALTER TABLE `tickets` ADD FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`) ON DELETE CASCADE;
ALTER TABLE `tickets` ADD FOREIGN KEY (`train_id`) REFERENCES `trains` (`id`) ON DELETE CASCADE;
ALTER TABLE `trains` ADD FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`) ON DELETE CASCADE;
ALTER TABLE `employees` ADD FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`) ON DELETE CASCADE;
ALTER TABLE `schedules` ADD FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE;
ALTER TABLE `trains` ADD FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;
ALTER TABLE `city_route` ADD FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE;
ALTER TABLE `city_route` ADD FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;


DELIMITER $$
CREATE PROCEDURE create_ticket(IN p_passenger_id INT, IN p_train_id INT)
BEGIN
    INSERT INTO tickets (passenger_id, train_id) VALUES (p_passenger_id, p_train_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cancel_ticket(IN p_passenger_id INT, IN p_train_id INT)
BEGIN
    DELETE FROM tickets WHERE passenger_id = p_passenger_id AND train_id = p_train_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_available_seats(IN p_train_id INT)
BEGIN
    SELECT number_of_seats - COUNT(*) as available_seats
    FROM trains
    JOIN tickets ON trains.id = tickets.train_id
    WHERE trains.id = p_train_id;
END$$
DELIMITER ;