-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2023 at 04:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eatables`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `blog_img` varchar(30) NOT NULL,
  `blog_date` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `fav_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(30) NOT NULL,
  `hotel_loc` varchar(50) NOT NULL COMMENT 'lat and long',
  `loc_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_loc`, `loc_name`) VALUES
(1, 'sai', 'kan', 'kan');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `hotel_id`, `item_name`, `item_price`, `item_rating`) VALUES
(1, 1, 'bir', 30, 5);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `loc_id` int(11) NOT NULL,
  `loc_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`loc_id`, `loc_name`) VALUES
(4, 'kan');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `review_content` varchar(150) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `uid`, `item_id`, `review_content`, `review_date`) VALUES
(9, 3, 1, 'jn', '2023-04-08 00:00:00'),
(10, 3, 1, 'ug', '2023-04-08 00:00:00'),
(11, 2, 1, 'hghg', '2023-04-08 00:00:00'),
(12, 4, 1, 'good food', '2023-04-08 00:00:00'),
(13, 4, 1, 'hgzxfctzsfc', '2023-04-08 00:00:00'),
(14, 4, 1, 'hgzxfctzsfc', '2023-04-08 16:47:09'),
(15, 4, 1, 'uhyu', '2023-04-08 16:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 1,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_expiration` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `fullname`, `uname`, `email`, `password`, `user_type`, `reset_token`, `reset_expiration`) VALUES
(1, 'darshan', 'darshan', 'darshan@gmail.com', '$2y$10$TQOMzbyY9rDjl5LaZbaWF.Auw13FdOcGyeTxJkItqSMuBc/Y.hQam', 0, NULL, NULL),
(2, 'ashwin', 'ashwin', 'ashwinkv.akv@gmail.com', '$2y$10$dcdkPt8NKUnRAOupyrN1ruOzCb.8mZXuG4jZOfHaGnM9YSlDILjCi', 1, '2657fe91cb99a056e65f19fd6f6a800218b82ebb89c64d01f21a841e142bb135', '2023-04-08 11:48:03'),
(3, 'delbin', 'delbin', 'delbin@gmail.com', '$2y$10$NjV23hQaywVkh3WoBrYLee.I/TuNz2wwQGsufCjnAacru66yH1AlG', 1, NULL, NULL),
(4, 'maya v', 'mayavi', 'mayavakkadavath27@gmail.com', '$2y$10$Dv57Q9y/CPvWpJRM3uFrgONfEvWa7fW.aJVxuNGuQvcVazvRWK.1u', 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`fav_id`),
  ADD KEY `favourite_ibfk_1` (`item_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `loc_name` (`loc_name`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`loc_name`),
  ADD UNIQUE KEY `loc_id` (`loc_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uid_2` (`uid`),
  ADD KEY `review_ibfk_1` (`item_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`,`uname`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`loc_name`) REFERENCES `location` (`loc_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
