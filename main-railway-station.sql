CREATE TABLE `employees` (
  `id` integer PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` unique varchar(255),
  `carrier_id` integer
);

CREATE TABLE `schedules` (
  `id` integer PRIMARY KEY,
  `start_time` time,
  `route_id` integer
);

CREATE TABLE `carriers` (
  `id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `trains` (
  `id` integer PRIMARY KEY,
  `number_of_seats` integer,
  `model` varchar(255),
  `carrier_id` integer,
  `schedule_id` integer
);

CREATE TABLE `tickets` (
  `train_id` integer,
  `passenger_id` integer
);

CREATE TABLE `passengers` (
  `id` integer PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `discount` integer
);

CREATE TABLE `routes` (
  `id` integer PRIMARY KEY
);

CREATE TABLE `city_route` (
  `route_id` integer,
  `city_id` integer,
  `city_order` integer
);

CREATE TABLE `cities` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `latitude` float,
  `longitude` float,  
);

ALTER TABLE `tickets` ADD FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`);

ALTER TABLE `tickets` ADD FOREIGN KEY (`train_id`) REFERENCES `trains` (`id`);

ALTER TABLE `trains` ADD FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`);

ALTER TABLE `employees` ADD FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`);

ALTER TABLE `routes` ADD FOREIGN KEY (`id`) REFERENCES `city_route` (`route_id`);

ALTER TABLE `cities` ADD FOREIGN KEY (`id`) REFERENCES `city_route` (`city_id`);

ALTER TABLE `routes` ADD FOREIGN KEY (`id`) REFERENCES `schedules` (`route_id`);

ALTER TABLE `trains` ADD FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`);
