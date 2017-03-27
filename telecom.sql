-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2017 at 03:05 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `ID` bigint(20) NOT NULL,
  `customerID` bigint(20) NOT NULL,
  `cycle_year` year(4) NOT NULL,
  `cycle_month` tinyint(4) NOT NULL,
  `description` text NOT NULL,
  `disc_charge` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `onetime_charge`
--

CREATE TABLE `onetime_charge` (
  `cycle_year` year(4) NOT NULL,
  `cycle_month` tinyint(4) NOT NULL,
  `onetimecharge_desc` mediumtext NOT NULL,
  `ID` bigint(20) NOT NULL,
  `customerID` bigint(20) NOT NULL,
  `subscription_ID` bigint(20) NOT NULL,
  `charge` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_charge`
--

CREATE TABLE `recurring_charge` (
  `ID` bigint(20) NOT NULL,
  `customerID` bigint(20) NOT NULL,
  `subscription_ID` bigint(20) NOT NULL,
  `cycle_year` year(4) NOT NULL,
  `cycle_month` tinyint(4) NOT NULL,
  `revenue_charge_desc` mediumtext NOT NULL,
  `charge` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `ID` bigint(20) NOT NULL,
  `customerID` bigint(20) NOT NULL,
  `subscriber_type` varchar(50) NOT NULL,
  `subscription_start` datetime NOT NULL,
  `subscription_end` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usagecharge`
--

CREATE TABLE `usagecharge` (
  `ID` bigint(20) NOT NULL,
  `customerID` bigint(20) NOT NULL,
  `subscription_ID` bigint(20) NOT NULL,
  `cycle_year` year(4) NOT NULL,
  `cycle_month` tinyint(4) NOT NULL,
  `event_type` text NOT NULL,
  `callTo` bigint(20) NOT NULL,
  `charge_amt` double NOT NULL,
  `flag_international` varchar(1) NOT NULL,
  `flag_special` varchar(1) NOT NULL,
  `flag_roaming` varchar(1) NOT NULL,
  `flag_domestic` varchar(1) NOT NULL,
  `flag_samenet` varchar(1) NOT NULL,
  `flag_local` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `customerID` bigint(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `customer_no` bigint(20) NOT NULL,
  `customer_zip` int(11) NOT NULL,
  `customer_addr1` mediumtext NOT NULL,
  `customer_addr2` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `onetime_charge`
--
ALTER TABLE `onetime_charge`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `subscription_ID` (`subscription_ID`);

--
-- Indexes for table `recurring_charge`
--
ALTER TABLE `recurring_charge`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `subscription_ID` (`subscription_ID`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `customerID_2` (`customerID`);

--
-- Indexes for table `usagecharge`
--
ALTER TABLE `usagecharge`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `subscription_ID` (`subscription_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`customerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `onetime_charge`
--
ALTER TABLE `onetime_charge`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recurring_charge`
--
ALTER TABLE `recurring_charge`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usagecharge`
--
ALTER TABLE `usagecharge`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `customerID` bigint(20) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
