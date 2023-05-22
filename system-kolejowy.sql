CREATE TABLE `pracownicy` (
  `id` integer PRIMARY KEY,
  `imie` varchar(255),
  `nazwisko` varchar(255),
  `przewoznik_id` integer
);

CREATE TABLE `harmonogramy` (
  `id` integer PRIMARY KEY,
  `godzina_startu` time,
  `trasa_id` integer
);

CREATE TABLE `przewoznicy` (
  `id` integer PRIMARY KEY,
  `nazwa` varchar(255)
);

CREATE TABLE `pociagi` (
  `id` integer PRIMARY KEY,
  `ilosc_miejsc` integer,
  `model` varchar(255),
  `przewoznik_id` integer,
  `harmonogram_id` integer
);

CREATE TABLE `bilety` (
  `pociag_id` integer,
  `pasazer_id` integer
);

CREATE TABLE `pasazerowie` (
  `id` integer PRIMARY KEY,
  `imie` varchar(255),
  `nazwisko` varchar(255),
  `ulga` integer
);

CREATE TABLE `trasy` (
  `id` integer PRIMARY KEY
);

CREATE TABLE `miasto_trasa` (
  `trasa_id` integer,
  `miasto_id` integer,
  `kolejnosc_miasta` integer
);

CREATE TABLE `miasta` (
  `id` integer PRIMARY KEY,
  `nazwa` varchar(255),
  `latitute` float,
  `longitute` float
);

ALTER TABLE `bilety` ADD FOREIGN KEY (`pasazer_id`) REFERENCES `pasazerowie` (`id`);

ALTER TABLE `bilety` ADD FOREIGN KEY (`pociag_id`) REFERENCES `pociagi` (`id`);

ALTER TABLE `pociagi` ADD FOREIGN KEY (`przewoznik_id`) REFERENCES `przewoznicy` (`id`);

ALTER TABLE `pracownicy` ADD FOREIGN KEY (`przewoznik_id`) REFERENCES `przewoznicy` (`id`);

ALTER TABLE `trasy` ADD FOREIGN KEY (`id`) REFERENCES `miasto_trasa` (`trasa_id`);

ALTER TABLE `miasta` ADD FOREIGN KEY (`id`) REFERENCES `miasto_trasa` (`miasto_id`);

ALTER TABLE `trasy` ADD FOREIGN KEY (`id`) REFERENCES `harmonogramy` (`trasa_id`);

ALTER TABLE `pociagi` ADD FOREIGN KEY (`harmonogram_id`) REFERENCES `harmonogramy` (`id`);
