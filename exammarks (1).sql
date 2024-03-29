-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2022 at 09:23 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `exammarks`
--

CREATE TABLE `exammarks` (
  `Course_Code` varchar(50) DEFAULT NULL,
  `Regulation` varchar(50) DEFAULT NULL,
  `Register_No` varchar(50) DEFAULT NULL,
  `student_name` varchar(50) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Semester` int(15) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Mark` bigint(20) DEFAULT NULL,
  `Staff_ID` varchar(50) DEFAULT NULL,
  `Course_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exammarks`
--

INSERT INTO `exammarks` (`Course_Code`, `Regulation`, `Register_No`, `student_name`, `Department`, `Semester`, `Category`, `Mark`, `Staff_ID`, `Course_ID`) VALUES
('CS8602', '2017', '311118104016', 'EEE', 'CSE', 1, 'CAT1', 55, '11111', 'CS8602CSE17111118016'),
('CS8651', '2017', '311118104004', 'AAA', 'CSE', 6, NULL, 66, '11111', 'CS8651CSE171111118004'),
('CS8651', '2017', '311118104007', 'BBB', 'CSE', 6, NULL, 80, '11111', 'CS8651CSE171111118007'),
('CS8651', '2017', '311118104010', 'CCC', 'CSE', 6, NULL, 34, '11111', 'CS8651CSE171111118010'),
('CS8651', '2017', '311118104013', 'DDD', 'CSE', 6, NULL, 35, '11111', 'CS8651CSE171111118013'),
('CS8651', '2017', '311118104016', 'EEE', 'CSE', 6, NULL, 87, '11111', 'CS8651CSE171111118016'),
('CS8651', '2017', '311118104019', 'FFF', 'CSE', 6, NULL, 97, '11111', 'CS8651CSE171111118019'),
('CS8651', '2017', '311118104022', 'GGG', 'CSE', 6, NULL, 50, '11111', 'CS8651CSE171111118022'),
('CS8651', '2017', '311118104024', 'HHH', 'CSE', 6, NULL, 49, '11111', 'CS8651CSE171111118024'),
('CS8651', '2017', '311118104033', 'III', 'CSE', 6, NULL, 22, '11111', 'CS8651CSE171111118033'),
('CS8651', '2017', '311118104016', 'EEE', 'CSE', 1, 'CAT1', 77, '11111', 'CS8651CSE17111118016'),
('GE8151', '2017', '311118104004', 'AAA', 'CSE', 1, NULL, 90, '16200', 'GE8151CSE171620018004'),
('GE8151', '2017', '311118104007', 'BBB', 'CSE', 1, NULL, 80, '16200', 'GE8151CSE171620018007'),
('GE8151', '2017', '311118104010', 'CCC', 'CSE', 1, NULL, 87, '16200', 'GE8151CSE171620018010'),
('GE8151', '2017', '311118104013', 'DDD', 'CSE', 1, NULL, 90, '16200', 'GE8151CSE171620018013'),
('GE8151', '2017', '311118104016', 'EEE', 'CSE', 1, NULL, 87, '16200', 'GE8151CSE171620018016'),
('GE8151', '2017', '311118104019', 'FFF', 'CSE', 1, NULL, 56, '16200', 'GE8151CSE171620018019'),
('GE8151', '2017', '311118104022', 'GGG', 'CSE', 1, NULL, 34, '16200', 'GE8151CSE171620018022'),
('GE8151', '2017', '311118104024', 'HHH', 'CSE', 1, NULL, 44, '16200', 'GE8151CSE171620018024'),
('GE8151', '2017', '311118104033', 'III', 'CSE', 1, NULL, 80, '16200', 'GE8151CSE171620018033'),
('MA8251', '2017', '311118104004', 'AAA', 'CSE', 2, NULL, 95, '11111', 'MA8251CSE171111118004'),
('MA8251', '2017', '311118104007', 'BBB', 'CSE', 2, NULL, 80, '11111', 'MA8251CSE171111118007'),
('MA8251', '2017', '311118104010', 'CCC', 'CSE', 2, NULL, 87, '11111', 'MA8251CSE171111118010'),
('MA8251', '2017', '311118104013', 'DDD', 'CSE', 2, NULL, 88, '11111', 'MA8251CSE171111118013'),
('MA8251', '2017', '311118104016', 'EEE', 'CSE', 2, NULL, 87, '11111', 'MA8251CSE171111118016'),
('MA8251', '2017', '311118104019', 'FFF', 'CSE', 2, NULL, 85, '11111', 'MA8251CSE171111118019'),
('MA8251', '2017', '311118104022', 'GGG', 'CSE', 2, NULL, 90, '11111', 'MA8251CSE171111118022'),
('MA8251', '2017', '311118104024', 'HHH', 'CSE', 2, NULL, 87, '11111', 'MA8251CSE171111118024'),
('MA8251', '2017', '311118104033', 'III', 'CSE', 2, NULL, 80, '11111', 'MA8251CSE171111118033'),
('MA8251', '2017', '311118104016', 'EEE', 'CSE', 1, 'CAT1', 60, '11111', 'MA8251CSE17111118016');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exammarks`
--
ALTER TABLE `exammarks`
  ADD PRIMARY KEY (`Course_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
