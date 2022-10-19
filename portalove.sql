-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1:3308
-- Čas generovania: St 19.Okt 2022, 05:40
-- Verzia serveru: 8.0.18
-- Verzia PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `portalove`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `destination`
--

DROP TABLE IF EXISTS `destination`;
CREATE TABLE IF NOT EXISTS `destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `area` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `destination`
--

INSERT INTO `destination` (`id`, `display_name`, `area`, `description`, `created_at`, `updated_at`) VALUES
(1, 'SWITZERLAND', 'Europe', 'Woox Travel is a professional Bootstrap 5 theme HTML CSS layout for your website. You can use this layout for your commercial work.', '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(2, 'CARIBBEAN', 'North America', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore dolor sit amet, consectetur adipiscing elit, sed do eiusmod.', '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(3, 'FRANCE', 'Europe', 'We hope this WoOx template is useful for you, please support us a small amount of PayPal to info [at] templatemo.com for our survival. We really appreciate your contribution.', '2022-10-12 00:00:00', '2022-10-12 00:00:00');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `destination_attribute`
--

DROP TABLE IF EXISTS `destination_attribute`;
CREATE TABLE IF NOT EXISTS `destination_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `destination_attribute_definition_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_destination_attribute_destination_attribute_definition_idx` (`destination_attribute_definition_id`),
  KEY `fk_destination_attribute_destination1_idx` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `destination_attribute`
--

INSERT INTO `destination_attribute` (`id`, `attribute_value`, `destination_attribute_definition_id`, `destination_id`, `created_at`, `updated_at`) VALUES
(1, '8.66 Mil', 1, 1, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(2, '41.290 km2', 2, 1, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(3, '$1.100.200', 3, 1, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(4, 'assets/images/country-01.jpg', 4, 1, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(5, '44.48 Mil', 1, 2, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(6, '275.400 km2', 2, 2, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(7, '$946.000', 3, 2, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(8, 'assets/images/country-02.jpg', 4, 2, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(9, '67.41 Mil', 1, 3, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(10, '551.500 km2', 2, 3, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(11, '$425.600', 3, 3, '2022-10-12 00:00:00', '2022-10-12 00:00:00'),
(12, 'assets/images/country-03.jpg', 4, 3, '2022-10-12 00:00:00', '2022-10-12 00:00:00');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `destination_attribute_definition`
--

DROP TABLE IF EXISTS `destination_attribute_definition`;
CREATE TABLE IF NOT EXISTS `destination_attribute_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `destination_attribute_definition`
--

INSERT INTO `destination_attribute_definition` (`id`, `name`, `description`) VALUES
(1, 'people', 'people'),
(2, 'size', 'size'),
(3, 'money', 'money'),
(4, 'image', 'image');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `display_name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_name_UNIQUE` (`sys_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `menu`
--

INSERT INTO `menu` (`id`, `sys_name`, `display_name`, `path`, `created_at`, `updated_at`) VALUES
(1, 'home', 'Home', 'index.php', '2022-10-05 06:44:22', '2022-10-05 06:44:22'),
(2, 'about', 'About', 'about.php', '2022-10-05 06:44:22', '2022-10-05 06:44:22'),
(3, 'deals', 'Deals', 'deals.php', '2022-10-05 06:44:22', '2022-10-05 06:44:22'),
(4, 'reservations', 'Reservations', 'reservation.php', '2022-10-05 06:44:22', '2022-10-05 06:44:22'),
(5, 'book', 'Book Yours', 'reservation.php', '2022-10-05 06:44:22', '2022-10-05 06:44:22');

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `destination_attribute`
--
ALTER TABLE `destination_attribute`
  ADD CONSTRAINT `fk_destination_attribute_destination1` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`id`),
  ADD CONSTRAINT `fk_destination_attribute_destination_attribute_definition` FOREIGN KEY (`destination_attribute_definition_id`) REFERENCES `destination_attribute_definition` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
