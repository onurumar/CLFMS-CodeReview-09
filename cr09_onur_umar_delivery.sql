-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Jul 2020 um 14:09
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_onur_umar_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_onur_umar_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_onur_umar_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_customer_adress_id` int(11) DEFAULT NULL,
  `fk_receiving_location_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- Daten für Tabelle `customer`

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_customeradress_id`, `fk_receiving_location_id`, `fk_package_id`, `fk_payment_id`) VALUES
(1212, 'John', 'Rock', 9912, 120, 743, 223),
(1414, 'Charles', 'Brob', 900100, 1232, 473, 2234),
(1515, 'Bob', 'Crob', 1200100, 122, 998, 22345);

--
-- Tabellenstruktur für Tabelle `customeradress`
--

CREATE TABLE `customeradress` (
  `customer_adress_id` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `apartment_number` int(11) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customeradress`
--

INSERT INTO `customeradress` (`customer_adress_id`, `street`, `house_number`, `apartment_number`, `zip`, `city`, `country`) VALUES
(9912, 'Regionalstrasse', 47, 28, 1140, 'Vienna', 'Austria'),
(900100, 'Dondaustrasse', 61, 154, 1010, 'Vienna', 'Austria'),
(1200100, 'Diskostraße', 62, 164, 1020, 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `depositlocation`
--

CREATE TABLE `depositlocation` (
  `depositlocation_id` int(11) NOT NULL,
  `fk_recipient_id` int(11) DEFAULT NULL,
  `fk_pickuptime_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


-- ---------------- Daten für Tabelle `depositlocation`
--

INSERT INTO `depositloction` (`depositlocation_id`, `fk_recipient_id`, `fk_pickuptime_id`, `fk_package_id`) VALUES
(1288, 343, 672, 289),
(1299, 344, 674, 1514),
(1277, 355, 676, 1643);

-- Daten für Tabelle `customeradress`
--

INSERT INTO `customeradress` (`customer_adress_id`, `street`, `house_number`, `apartment_number`, `zip`, `city`, `country`) VALUES
(9912, 'Regionalstrasse', 47, 28, 1140, 'Vienna', 'Austria'),
(900100, 'Dondaustrasse', 61, 154, 1010, 'Vienna', 'Austria'),
(1200100, 'Diskostraße', 62, 164, 1020, 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_processingsystem_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


-- ---------------- Daten für Tabelle `employee`
--

INSERT INTO `depositlocation` (`employee_id`, `first_name`, `last_name`, `fk_processingsystem_id`) VALUES
(128228, 'john', 'omalley', 2892),
(123456, 'Bro', 'Obroley', 15143),
(11223344, 'Seth', 'jenkins', 16434);

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `weightkg` int(11) DEFAULT NULL,
  `form` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_id`, `weightkg`, `form`) VALUES
(3712, 2, 'box'),
(3812, 2, 'box'),
(3912, 2, 'box');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`payment_id`, `amount`, `currency`) VALUES
(121314, 20, 'dollar'),
(131415, 20, 'euro'),
(141516, 30, 'franken');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pickuptime`
--

CREATE TABLE `pickuptime` (
  `pickuptime_id` int(11) NOT NULL,
  `pickuptime_date` date DEFAULT NULL,
  `pickuptime_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `pickuptime`
--

INSERT INTO `pickuptime` (`pickuptime_id`, `pickuptime_date`, `pickuptime_time`) VALUES
(911, '2020-05-05', '00:13:00'),
(1011, '2020-06-06', '00:14:00'),
(1211, '2020-07-07', '00:15:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processingsystem`
--

CREATE TABLE `processingsystem` (
  `processingsystem_id` int(11) NOT NULL,
  `fk_processingsystem_adress_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_depositlocation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- ---------------- Daten für Tabelle `processingsystem`
--

INSERT INTO `processingsystem` (`processingsystem_id`, `fk_processingsystem_adress_id`, `fk_package_id`, `fk_depositlocation_id`) VALUES
(1222, 1122, 009, 289222),
(1256, 1133, 0010, 1514322),
(113344, 1144, 0011, 1643422);

--
-- Tabellenstruktur für Tabelle `processingsystemadress`
--

CREATE TABLE `processingsystemadress` (
  `processingsystem_adress_id` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `processingsystemadress`
--

INSERT INTO `processingsystemadress` (`processingsystem_adress_id`, `street`, `house_number`, `zip`, `city`, `country`) VALUES
(1213, 'Jumbogürtel', 18, 1180, 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `receivinglocation`
--

CREATE TABLE `receivinglocation` (
  `receiving_location_id` int(11) NOT NULL,
  `fk_receiving_location_adress_id` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_payment_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `receivinglocationadress`
--

CREATE TABLE `receivinglocationadress` (
  `receiving_location_adress_id` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `receivinglocationadress`
--

INSERT INTO `receivinglocationadress` (`receiving_location_adress_id`, `street`, `house_number`, `zip`, `city`, `country`) VALUES
(555, 'Kennedybrücke', 15, 1110, 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_recipient_adress_id` int(11) DEFAULT NULL,
  `fk_pickuptime_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- ---------------- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `fk_recipient_adress_id`, 'fk_pickuptime_id', 'fk_package_id') VALUES
(12338, 'onur', 'onalley', 2892, 3399,9876),
(111333444555, 'chonur', 'osoney', 15143, 009988,8880),
(114455, 'jek', 'nejj', 16434, 9876,99887766);

--
-- Tabellenstruktur für Tabelle `recipientadress`
--

CREATE TABLE `recipientadress` (
  `recipient_adress_id` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `apartment_number` int(11) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipientadress`
--

INSERT INTO `recipientadress` (`recipient_adress_id`, `street`, `house_number`, `apartment_number`, `zip`, `city`, `country`) VALUES
(9, 'Hamburgerstraße', 99, 9, 1090, 'VIENNA', 'AUSTRIA'),
(10, 'FAVORITENSTRASSE', 100, 10, 1010, 'VIENNA', 'AUSTRIA'),
(12, 'MEIDLING', 122, 12, 1120, 'VIENNA', 'AUSTRIA');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customer_adress_id` (`fk_customer_adress_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`),
  ADD KEY `fk_receiving_location_id` (`fk_receiving_location_id`);

--
-- Indizes für die Tabelle `customeradress`
--
ALTER TABLE `customeradress`
  ADD PRIMARY KEY (`customer_adress_id`);

--
-- Indizes für die Tabelle `depositlocation`
--
ALTER TABLE `depositlocation`
  ADD PRIMARY KEY (`depositlocation_id`),
  ADD KEY `fk_recipient_id` (`fk_recipient_id`),
  ADD KEY `fk_pickuptime_id` (`fk_pickuptime_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_processingsystem_id` (`fk_processingsystem_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indizes für die Tabelle `pickuptime`
--
ALTER TABLE `pickuptime`
  ADD PRIMARY KEY (`pickuptime_id`);

--
-- Indizes für die Tabelle `processingsystem`
--
ALTER TABLE `processingsystem`
  ADD PRIMARY KEY (`processingsystem_id`),
  ADD KEY `fk_processingsystem_adress_id` (`fk_processingsystem_adress_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_depositlocation_id` (`fk_depositlocation_id`);

--
-- Indizes für die Tabelle `processingsystemadress`
--
ALTER TABLE `processingsystemadress`
  ADD PRIMARY KEY (`processingsystem_adress_id`);

--
-- Indizes für die Tabelle `receivinglocation`
--
ALTER TABLE `receivinglocation`
  ADD PRIMARY KEY (`receiving_location_id`),
  ADD KEY `fk_receiving_location_adress_id` (`fk_receiving_location_adress_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `receivinglocationadress`
--
ALTER TABLE `receivinglocationadress`
  ADD PRIMARY KEY (`receiving_location_adress_id`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_recipient_adress_id` (`fk_recipient_adress_id`),
  ADD KEY `fk_pickuptime_id` (`fk_pickuptime_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `recipientadress`
--
ALTER TABLE `recipientadress`
  ADD PRIMARY KEY (`recipient_adress_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_customer_adress_id`) REFERENCES `customeradress` (`customer_adress_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_customer_adress_id`) REFERENCES `receivinglocation` (`receiving_location_id`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`),
  ADD CONSTRAINT `customer_ibfk_5` FOREIGN KEY (`fk_receiving_location_id`) REFERENCES `receivinglocation` (`receiving_location_id`);

--
-- Constraints der Tabelle `depositlocation`
--
ALTER TABLE `depositlocation`
  ADD CONSTRAINT `depositlocation_ibfk_1` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`),
  ADD CONSTRAINT `depositlocation_ibfk_2` FOREIGN KEY (`fk_pickuptime_id`) REFERENCES `pickuptime` (`pickuptime_id`),
  ADD CONSTRAINT `depositlocation_ibfk_3` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_processingsystem_id`) REFERENCES `processingsystem` (`processingsystem_id`);

--
-- Constraints der Tabelle `processingsystem`
--
ALTER TABLE `processingsystem`
  ADD CONSTRAINT `processingsystem_ibfk_1` FOREIGN KEY (`fk_processingsystem_adress_id`) REFERENCES `processingsystemadress` (`processingsystem_adress_id`),
  ADD CONSTRAINT `processingsystem_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `processingsystem_ibfk_3` FOREIGN KEY (`fk_depositlocation_id`) REFERENCES `depositlocation` (`depositlocation_id`);

--
-- Constraints der Tabelle `receivinglocation`
--
ALTER TABLE `receivinglocation`
  ADD CONSTRAINT `receivinglocation_ibfk_1` FOREIGN KEY (`fk_receiving_location_adress_id`) REFERENCES `receivinglocationadress` (`receiving_location_adress_id`),
  ADD CONSTRAINT `receivinglocation_ibfk_2` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`),
  ADD CONSTRAINT `receivinglocation_ibfk_3` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `receivinglocation_ibfk_4` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `receivinglocation_ibfk_5` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_recipient_adress_id`) REFERENCES `recipientadress` (`recipient_adress_id`),
  ADD CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`fk_pickuptime_id`) REFERENCES `pickuptime` (`pickuptime_id`),
  ADD CONSTRAINT `recipient_ibfk_3` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;






/*!Joins */


SELECT processingsystem.*, employee.* from processingsystem
right join employee ON
processingsystem.processingsystem_id = employee.fk_processingsystem_id

SELECT customeradress.*, customer.* from customeradress
inner join customer ON
customeradress.customer_adress_id = customer.fk_customeradress_id

SELECT customer.*, receivinglocation.* from customer
left join receivinglocation ON
customer.customer_id = receivinglocation.fk_customer_id

SELECT package.*, recipient.* from package
inner join recipient ON
package.package_id = recipient.fk_package_id






