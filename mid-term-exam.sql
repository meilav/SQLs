-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2017 at 01:46 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `gajiterbesar` ()  select name,salary from employees order by salary desc limit 2$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(2) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `manager_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `manager_id`) VALUES
(10, 'Administration', 101),
(20, 'IT', 103);

--
-- Triggers `departments`
--
DELIMITER $$
CREATE TRIGGER `update_id` AFTER UPDATE ON `departments` FOR EACH ROW UPDATE employees SET manager_id=NEW.manager_id, department_id=NEW.id WHERE department_id=NEW.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(3) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `manager_id` int(3) DEFAULT NULL,
  `department_id` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `date_of_joining`, `salary`, `manager_id`, `department_id`) VALUES
(100, 'Anhar', '2010-08-11', 8000, 101, 10),
(101, 'Angga', '2009-08-11', 10000, 101, 10),
(102, 'Nurul', '2009-12-01', 9000, 103, 20),
(103, 'Lestari', '2012-01-02', 11000, 103, 20),
(104, 'Tio', '2014-05-05', 11000, 103, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
