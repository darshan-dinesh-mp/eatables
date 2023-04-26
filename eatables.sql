-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 05:40 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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
-- Table structure for table `bot`
--

CREATE TABLE `bot` (
  `is_default` int(11) DEFAULT NULL,
  `option_text` varchar(50) DEFAULT NULL,
  `prev_option_text` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bot`
--

INSERT INTO `bot` (`is_default`, `option_text`, `prev_option_text`) VALUES
(1, 'yes', NULL),
(1, 'no', NULL),
(NULL, 'right', 'yes'),
(NULL, 'left', 'yes'),
(NULL, 'right', 'yes'),
(NULL, 'left', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `drops`
--

CREATE TABLE `drops` (
  `drop_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `video_url` varchar(150) NOT NULL,
  `hotel_name` varchar(100) NOT NULL,
  `drop_date` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drops`
--

INSERT INTO `drops` (`drop_id`, `uid`, `video_url`, `hotel_name`, `drop_date`) VALUES
(35, 2, 'video-644929e72dcbc5.96383174.mp4', 'Laziz Pizza', '20-04-23 08:03:00'),
(36, 2, 'video-6449297623a7a5.88147750.mp4', 'Hamburg Street Food Cafe', '20-04-23 08:05:20');

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `fav_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`fav_id`, `uid`, `item_id`) VALUES
(18, 2, 2),
(19, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(30) NOT NULL,
  `hotel_loc` varchar(100) DEFAULT NULL COMMENT 'lat and long',
  `loc_name` varchar(30) NOT NULL,
  `ratings` varchar(10) DEFAULT NULL,
  `links` varchar(300) DEFAULT NULL,
  `disc` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_loc`, `loc_name`, `ratings`, `links`, `disc`) VALUES
(1, 'Laziz Pizza', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/laziz-pizza-attavar/order', NULL),
(2, 'Hamburg Street Food Cafe', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/hamburg-street-food-cafe-kankanady/order', NULL),
(3, 'Bamboo Restaurant', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/bamboo-restaurant-kankanady/order', NULL),
(4, 'CKK Kitchens Of Maharaja', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/ckk-kitchens-of-maharaja-lalbagh/order', NULL),
(5, 'Hotel Sai Palace', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/hotel-sai-palace-hampankatta/order', NULL),
(6, 'Grameen Kulfi', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/grameen-kulfi-kottara/order', NULL),
(7, 'Momos Hut', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/momos-hut-kankanady/order', NULL),
(8, 'Keventers - Milkshakes & Desse', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/keventers-milkshakes-desserts-balmatta/order', NULL),
(9, 'Danish Bamboo House', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/danish-bamboo-house-kankanady/order', NULL),
(10, 'Aladdin Shawarma', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/aladdin-shawarma-kankanady/order', NULL),
(11, 'Hotel Sai Tudar', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/hotel-sai-tudar-lalbagh/order', NULL),
(12, 'Baskin Robbins', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/baskin-robbins-hampankatta/order', NULL),
(13, 'BT Devrali', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/bt-devrali-kankanady/order', NULL),
(14, 'Sharaabi Bar & Family Restaura', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/sharaabi-bar-family-restaurant-kadri/order', NULL),
(15, 'Taste of Parika', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/taste-of-parika-kapikad/order', NULL),
(16, 'Urban House', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/urban-house-bendoor/order', NULL),
(17, 'Pavman', NULL, 'Manglore', '4', 'https://www.zomato.com/mangalore/pavman-mallikatte/order', 'khk'),
(18, 'Andhra House', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/andhra-house-kadri/order', NULL),
(19, 'Wholesome Kitchen', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/wholesome-kitchen-mallikatte/order', NULL),
(20, 'Mangala', '', 'Manglore', '4', 'https://www.zomato.com/mangalore/mangala-bendoor/order', NULL),
(22, 'Taco Street', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/taco-street-kodailbail/order', NULL),
(23, 'Kaati Zone Rolls And Wraps', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/kaati-zone-rolls-and-wraps-kodailbail/order', NULL),
(24, 'Burger Shack', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/burger-shack-bendoor/order', NULL),
(25, 'Wine And Dine', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/wine-and-dine-thokottu/order', NULL),
(26, 'Frozen Scoops', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/frozen-scoops-1-hampankatta/order', NULL),
(27, 'Sizzlers Ranch', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/sizzlers-ranch-hampankatta/order', NULL),
(28, 'The Good Bowl', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/the-good-bowl-hampankatta/order', NULL),
(29, 'Sri Durga Lunch Home', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/sri-durga-lunch-home-attavar/order', NULL),
(30, 'Pure Veg Meals By LunchBox', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/pure-veg-meals-by-lunchbox-hampankatta/order', NULL),
(32, 'Gajalee Sea Food', '', 'Manglore', '4.1', 'https://www.zomato.com/mangalore/gajalee-sea-food-kadri/order', NULL),
(33, 'Hao Ming', '', 'Manglore', '4.2', 'https://www.zomato.com/mangalore/hao-ming-balmatta/order', NULL),
(34, 'WarmOven Cake & Desserts', '', 'Manglore', '4.2', 'https://www.zomato.com/mangalore/warmoven-cake-desserts-kodailbail/order', NULL),
(35, 'Behrouz Biryani', '', 'Manglore', '4.2', 'https://www.zomato.com/mangalore/behrouz-biryani-hampankatta/order', NULL),
(37, 'Sundae Everyday Ice Creams', '', 'Manglore', '4.2', 'https://www.zomato.com/mangalore/sundae-everyday-ice-creams-kodailbail/order', NULL),
(38, 'Gauji Gammath', '', 'Manglore', '4.2', 'https://www.zomato.com/mangalore/gauji-gammath-hampankatta/order', NULL),
(39, 'Olive Street Food Cafe', '', 'Manglore', '4.3', 'https://www.zomato.com/mangalore/olive-street-food-cafe-kodailbail/order', NULL),
(40, 'Crave Desserts & Bakes', '', 'Manglore', '4.3', 'https://www.zomato.com/mangalore/crave-desserts-bakes-balmatta/order', NULL),
(41, 'Raslaffan Ice Cream Parlour', '', 'Manglore', '4.3', 'https://www.zomato.com/mangalore/raslaffan-ice-cream-parlour-pumpwell/order', NULL),
(42, 'New Kudla', '', 'Manglore', '4.3', 'https://www.zomato.com/mangalore/new-kudla-ashok-nagar/order', NULL),
(43, 'Rathna s Wine Gate', '', 'Manglore', '4.3', 'https://www.zomato.com/mangalore/rathnas-wine-gate-kodailbail/order', NULL),
(44, 'Machali', '', 'Manglore', '4.3', 'https://www.zomato.com/mangalore/machali-kodailbail/order', NULL),
(45, 'G Food Fun', '', 'Manglore', '4.3', 'https://www.zomato.com/mangalore/g-food-n-fun-bendoor/order', NULL),
(46, 'Ideal Cafe', '', 'Manglore', '4.4', 'https://www.zomato.com/mangalore/ideal-cafe-hampankatta/order', NULL),
(47, 'Chandus Biryani Spot', '', 'Manglore', '4.4', 'https://www.zomato.com/mangalore/chandus-biryani-spot-kavoor/order', NULL),
(48, 'Meisterwurst', '', 'Manglore', '4.4', 'https://www.zomato.com/mangalore/meisterwurst-kodailbail/order', NULL),
(49, 'Pabbas', '', 'Manglore', '4.5', 'https://www.zomato.com/mangalore/pabbas-lalbagh/order', NULL),
(50, 'Drood Cafe', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/drood-cafe-kankanady/order', NULL),
(51, 'Biryani Express', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/biryani-express-kavoor/order', NULL),
(52, 'Parika Bakes', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/parika-bakes-marnamikatte/order', NULL),
(53, 'The Juice Dude', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/the-juice-dude-kankanady/order', NULL),
(54, 'Nomou - Vegan Gelato', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/nomou-vegan-gelato-attavar/order', NULL),
(56, 'Kling Krishna Cafe', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/kling-krishna-cafe-hampankatta/order', NULL),
(57, 'Jumbos Kitchen', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/jumbos-kitchen-kodailbail/order', NULL),
(58, 'Taj Mahal Restaurant', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/taj-mahal-restaurant-hampankatta/order', NULL),
(59, 'Kottara 70 Surprise', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/kottaras-70-surprise-kottara/order', NULL),
(60, 'Cafe Margarita', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/cafe-margarita-lalbagh/order', NULL),
(61, 'The Grand Kitchen By AJ Grand ', '', 'Manglore', '-', 'https://www.zomato.com/mangalore/the-grand-kitchen-by-aj-grand-hotel-balmatta/order', NULL),
(63, 'Bapama s Cafe', '', 'Manglore', 'New', 'https://www.zomato.com/mangalore/bapamas-cafe-kadri/order', NULL),
(64, 'Ferns & Martins', '', 'Manglore', 'New', 'https://www.zomato.com/mangalore/ferns-martins-kavoor/order', NULL),
(65, 'The Waffle Man - House of Cook', '', 'Manglore', 'New', 'https://www.zomato.com/mangalore/the-waffle-man-house-of-cookie-man-attavar/order', NULL),
(66, 'Frankie Delight', '', 'Manglore', 'New', 'https://www.zomato.com/mangalore/frankie-delight-kottara/order', NULL),
(68, 'The Hungry Birds', '', 'Manglore', 'New', 'https://www.zomato.com/mangalore/the-hungry-birds-hampankatta/order', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_rating` int(11) DEFAULT NULL,
  `item_img` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `hotel_id`, `item_name`, `item_price`, `item_rating`, `item_img`) VALUES
(1, 1, 'BBQ Pizza', 210, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(2, 1, 'Special Spicy Pizza', 220, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(3, 1, 'Lions Appetite Pizza', 245, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(4, 1, 'Paneer Ghee Roast Pizza', 240, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(5, 1, 'Cheese N Cheese Pizza', 145, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(6, 1, 'Pizza Box for One [Veg]', 299, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(7, 1, 'Pizza Box for One [Non-Veg]', 325, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(8, 1, 'Family pizza box [Veg]', 745, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(9, 1, 'Family pizza box [Non-Veg]', 799, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(10, 1, 'Pizza Party Box', 1050, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(11, 1, 'Laziz Special Combo', 799, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(12, 1, 'Margherita Pizza', 145, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(13, 1, 'Cheese N Cheese Pizza', 145, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(14, 1, 'Pomidor Pizza', 145, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(15, 1, 'Laziz Desi Veg Pizza', 180, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(16, 1, 'Corn Golden Pizza', 175, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(17, 1, 'Vegetariana Pizza', 180, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(18, 1, 'Garden Fresh Pizza', 190, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(19, 1, 'Veg Paprika Pizza', 190, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(20, 1, 'Paneer Tikka Pizza', 190, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(21, 1, 'Fiery Paneer Pizza', 195, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(22, 1, 'Mushroom Paprika Pizza', 195, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(23, 1, 'Veg Schezwan Pizza', 190, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(24, 1, 'Paneer Chilli Pizza', 195, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(25, 1, 'Carnival Veg Pizza', 210, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(26, 1, 'Mexican Veg Pizza', 215, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(27, 1, 'Corn Exotica Pizza', 215, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(28, 1, 'Veg Extra Delight Pizza', 215, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(29, 1, 'Achari Veg Pizza', 210, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(30, 1, 'Yum Dum Pizza', 210, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(31, 1, 'Curry Veg Pizza', 210, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(32, 1, 'Special Spicy Pizza', 220, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(33, 1, 'Mushroom Garlic Delight Pizza', 215, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(34, 1, 'Pepper Paneer Pizza', 215, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(35, 1, 'Paneer Ghee Roast Pizza', 240, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(36, 1, 'Jamaican Veg Pizza', 240, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(37, 1, 'Veg Extraveganza Pizza', 250, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(38, 1, 'Egg Scrambled Pizza', 230, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(39, 1, 'Egg Hot and Spicy Pizza', 230, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(40, 1, 'Peppy Egg Pizza', 230, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(41, 1, 'Chicken Tikka Pizza', 195, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(42, 1, 'Chicken Schezwan Pizza', 195, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(43, 1, 'Chicken Seekh Kabab Pizza', 195, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(44, 1, 'Tandoori Chicken Pizza', 195, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(45, 1, 'Chicken Hawaiian Pizza', 190, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(46, 1, 'Chicken Keema Pizza', 195, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(47, 1, 'Mexican Chicken Pizza', 210, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(48, 1, 'Carnival Chicken Pizza', 210, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(49, 1, 'BBQ Pizza', 210, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(50, 1, 'Butter Chicken Pizza', 210, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(177, 2, 'Vanilla Milkshake', 63, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(178, 2, 'Classic Veggie Salad', 76, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(179, 2, 'Classic Chicken Salad', 89, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(180, 2, 'Egg Chips Burger', 89, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(181, 2, 'Omelette Cheese Burger', 97, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(182, 2, 'Steak Chicken Burger', 110, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(183, 2, 'Mughlai Chicken Burger', 115, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(184, 2, 'OMG Chicken Burger', 150, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(185, 2, 'Mexi Chicken Burger', 162, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(186, 2, 'Ham Chicken Burger', 167, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(187, 2, 'King of Chicken Burger', 175, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(188, 2, 'Veggie Burger', 76, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(189, 2, 'Veggie Cheese Burger', 84, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(190, 2, 'Paneer Burger', 102, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(191, 2, 'Mushroom Burger', 102, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(192, 2, 'Paneer Cheese Burger', 115, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(193, 2, 'Mushroom Cheese Burger', 115, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(194, 2, 'Mixed Veggie Hot Dog    Burger', 141, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(195, 2, 'Steak Club Sandwich', 167, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(196, 2, 'Mughlai Club Sandwich', 175, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(197, 2, 'Veg Sandwich', 76, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(198, 2, 'Veg Cheese Sandwich', 84, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(199, 2, 'Veggies Salad Sandwich', 89, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(200, 2, 'Paneer Sandwich', 97, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(201, 2, 'Mushroom Sandwich', 97, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(202, 2, 'Veggie Club Sandwich', 136, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(203, 2, 'Hamburg Mixed Veg Club    Sand', 175, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(204, 2, 'Egg Sandwich', 76, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(205, 2, 'Steak Chicken Sandwich', 97, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(206, 2, 'Mughlai Chicken    Sandwich', 102, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(207, 2, 'Veggie Chips Wrap', 39, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(208, 2, 'Fried Parotta Wrap', 50, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(209, 2, 'Mixed Veggie Chips Wrap', 63, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(210, 2, 'Grilled Mix Veg Chips', 71, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(211, 2, 'Paneer Parotta Wrap', 84, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(212, 2, 'Mushroom Parotta Wrap', 84, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(213, 2, 'Grilled Paneer Parotta', 97, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(214, 2, 'Grilled Mushroom    Parotta', 97, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(215, 2, 'French Fries', 76, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(216, 2, 'Omelette Chips Wrap', 58, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(217, 2, 'Steak Chicken Wrap', 84, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(218, 2, 'Special Chicken Kothu    Parot', 89, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(219, 2, 'Mughlai Chicken Wrap', 89, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(220, 2, 'Mughlai Cheese Chicken    Wrap', 102, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(221, 2, 'Kathi Grilled Parotta    Wrap', 110, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(222, 2, 'Mumbai Wala Mixed Wrap', 113, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(223, 2, 'Fatty Grilled Parotta', 115, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(224, 2, 'Banana Milkshake', 63, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(225, 2, 'Oreo Milkshake', 63, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(493, 3, 'Chicken Biryani', 150, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(494, 3, 'Bamboo Chicken Biryani', 330, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(495, 3, 'Bamboo Tikka Biriyani', 380, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(496, 3, 'Mutton Biriyani', 160, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(497, 3, 'Drums Of Heaven', 280, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(498, 3, 'Chicken Lollipop', 230, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(499, 3, 'Alfaham Mandi', 480, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(500, 3, 'Bamboo Mutton Biryani', 440, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(501, 3, 'Mojito', 80, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(502, 3, 'Boneless Butter Chicken', 310, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(503, 3, 'Chicken Rara', 290, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(504, 3, 'Dragon Chicken', 290, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(505, 3, 'Chicken Pepper', 280, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(506, 3, 'Chicken Tikka', 280, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(507, 3, 'Chicken ManchurianGravy', 280, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(508, 3, 'Paneer Butter Masala', 240, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(509, 3, 'Chicken Fried Rice', 200, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(510, 3, 'French Fries', 170, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(511, 3, 'Lime Juice', 60, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(512, 3, 'Lime Soda', 60, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(513, 3, 'Fruit Salad', 110, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(514, 3, 'Chicken Tikka [1 Piece]', 90, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(515, 3, 'Grape Juice', 80, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(516, 3, 'Butter Naan', 35, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(517, 3, 'Lime Minit', 60, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(518, 3, 'Lime With Mint + Ginger', 60, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(519, 3, 'Butter Kulcha', 30, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(520, 3, 'Ginger Lime', 60, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(521, 3, 'Raita', 10, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(522, 3, 'Tandoori Chicken', 230, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(523, 3, 'Chicken Ghee Roast Dry', 320, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(524, 3, 'Alfaham', 160, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(525, 3, 'Chicken Hot And SourSoup', 120, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(526, 3, 'Chicken Manchow Soup', 120, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(527, 3, 'Coriander Lemon Soup', 100, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(528, 3, 'Cream of Mushroom Soup', 120, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(529, 3, 'Mutton Hot And Sour', 0, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(530, 3, 'Mutton Manchow Soup', 140, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(531, 3, 'Prawns Soup', 140, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(532, 3, 'Veg Hot And Sour Soup', 100, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(533, 3, 'Veg Manchow Soup', 100, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(534, 3, 'Baby Corn ManchurianDry', 200, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(535, 3, 'French Fries', 170, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(536, 3, 'Gobi Manchurian Dry', 200, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(537, 3, 'Mushroom 65', 220, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(538, 3, 'Paneer Tikka 6 Pieces', 240, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(539, 3, 'Paneer Manchurian', 220, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(540, 3, 'Mushroom Manchurian', 220, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(541, 3, 'Mushroom Pepper', 220, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(542, 3, 'Baby Corn Pepper', 220, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');

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
(6, 'Manglore');

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
(43, 2, 178, 'nice', '2023-04-13 06:56:30'),
(44, 2, 1, 'kiehrg', '2023-04-16 18:04:31'),
(45, 2, 1, 'huh', '2023-04-16 18:04:35'),
(46, 2, 15, 'ljdgb', '2023-04-17 12:06:27'),
(48, 2, 1, 'very good', '2023-04-22 11:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `suggestion`
--

CREATE TABLE `suggestion` (
  `hotel_id` int(11) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `hotel_name` varchar(30) NOT NULL,
  `hotel_loc` varchar(100) DEFAULT NULL COMMENT 'lat and long',
  `loc_name` varchar(30) NOT NULL,
  `ratings` varchar(10) DEFAULT NULL,
  `links` varchar(300) DEFAULT NULL,
  `desc` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `reset_expiration` varchar(30) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `verified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `fullname`, `uname`, `email`, `password`, `user_type`, `reset_token`, `reset_expiration`, `img`, `verified`) VALUES
(1, 'admin', 'admin', 'dreamographer.akv@gmail.com', '$2y$10$foY4R1/RA1y5CH2G8CnCOuvgLaRxqdCj1Dz/fhMt3.Ao6N8aSHVNW', 0, NULL, NULL, 'eatables.png', NULL),
(2, 'richu', 'user', 'ebinwaynad@gmail.com', '$2y$10$uTvZAPkwl7TJ4gyiDkmWx.lsh0pDDFVqUMMwDKomOrWNGw/eomuc.', 1, NULL, NULL, NULL, NULL),
(3, 'ashwin kv', 'ashwin', 'assg@gmail.com', '$2y$10$4iAZ1/RYHI2c7xCK6iRDL.K/dTcenNkchF7ZMsWx6wf20tNHPz2aS', 1, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drops`
--
ALTER TABLE `drops`
  ADD PRIMARY KEY (`drop_id`),
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
-- Indexes for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD PRIMARY KEY (`hotel_id`);

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
-- AUTO_INCREMENT for table `drops`
--
ALTER TABLE `drops`
  MODIFY `drop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=543;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `suggestion`
--
ALTER TABLE `suggestion`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drops`
--
ALTER TABLE `drops`
  ADD CONSTRAINT `drops_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourite_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`loc_name`) REFERENCES `location` (`loc_name`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
