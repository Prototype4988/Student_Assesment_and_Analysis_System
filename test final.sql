-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2022 at 03:14 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_ID` varchar(50) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` varchar(50) NOT NULL,
  `Staff_ID` varchar(50) DEFAULT NULL,
  `Course_Code` varchar(50) DEFAULT NULL,
  `Course_Name` varchar(50) DEFAULT NULL,
  `Semester` int(15) DEFAULT NULL,
  `Year` int(15) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Regulation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Staff_ID`, `Course_Code`, `Course_Name`, `Semester`, `Year`, `Department`, `Regulation`) VALUES
('CS8651CSE201711111', '11111', 'CS8651', 'Cloud Computing', 6, 2020, 'CSE', '2017'),
('GE8151CSE201716200', '16200', 'GE8151', 'Problem Solving and Python Programming', 1, 2018, 'CSE', '2017'),
('MA8251CSE201711111', '11111', 'MA8251', 'Engineering Mathematics II', 1, 2018, 'CSE', '2017');

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

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Name` varchar(50) NOT NULL,
  `Staff_ID` varchar(50) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Name`, `Staff_ID`, `Department`, `Role`, `Username`, `password`) VALUES
('carnage', '123123', 'CSE', '0', 'carnage@gmail.com', '12345'),
('George', '11111', 'CSE', '0', 'geoffrick@gmail.com', 'coin'),
('Silas', '12345', 'It', '1', 'george@gmail.com', 'cat'),
('Victor', '16200', 'Mech', '0', 'victor@gmail.com', 'claw');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Roll_no` varchar(50) NOT NULL,
  `student_name` varchar(50) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Semester` int(15) DEFAULT NULL,
  `Year_of_study` int(15) DEFAULT NULL,
  `Register_No` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`);

--
-- Indexes for table `exammarks`
--
ALTER TABLE `exammarks`
  ADD PRIMARY KEY (`Course_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Roll_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
