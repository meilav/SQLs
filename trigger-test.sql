-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2014 at 10:00 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `toko_kaset`
--

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(3) NOT NULL,
  `title` varchar(20) NOT NULL,
  `stock` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `title`, `stock`) VALUES
(1, 'X-Men', 5);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `description` text NOT NULL,
  `date_time` datetime NOT NULL,
  `user` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`description`, `date_time`, `user`) VALUES
('Penambahan member ID= 91', '2014-11-09 14:56:01', 'root@localhost'),
('Pengubahan pada member ID= 91', '2014-11-09 23:45:32', 'root@localhost'),
('Pengubahan pada member ID= 92', '2014-11-17 10:56:30', 'root@localhost'),
('Pengubahan pada member ID= 91', '2014-11-17 10:57:01', 'root@localhost'),
('Pengubahan pada member ID= 91', '2014-11-17 10:59:01', 'root@localhost');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cp` varchar(12) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name`, `cp`, `address`) VALUES
(92, 'Al Mizfar', '083199605601', 'Binjai Utara');

--
-- Triggers `member`
--
DROP TRIGGER IF EXISTS `insert_log`;
DELIMITER //
CREATE TRIGGER `insert_log` AFTER INSERT ON `member`
 FOR EACH ROW BEGIN

   insert into log values(concat('Penambahan member ID= ',
	NEW.id), now(),user());

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_log`;
DELIMITER //
CREATE TRIGGER `update_log` AFTER UPDATE ON `member`
 FOR EACH ROW BEGIN                                                  							
   	INSERT INTO log VALUES(CONCAT('Pengubahan pada member ID= ', 		
	NEW.id),NOW(), USER());													
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `id_m` int(3) NOT NULL,
  `id_i` int(3) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id_m`, `id_i`, `date_time`) VALUES
(91, 2, '2014-11-09 21:21:32');

--
-- Triggers `transaction`
--
DROP TRIGGER IF EXISTS `restoration`;
DELIMITER //
CREATE TRIGGER `restoration` BEFORE DELETE ON `transaction`
 FOR EACH ROW BEGIN                                                  							
   	UPDATE item JOIN transaction JOIN member SET stock= stock + 1 		
	WHERE item.id=transaction.id_i AND transaction.id_m=member.id ;	
END
//
DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
