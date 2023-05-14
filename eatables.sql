-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 09:59 PM
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
  `prev_option_text` varchar(50) DEFAULT NULL,
  `qid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bot`
--

INSERT INTO `bot` (`is_default`, `option_text`, `prev_option_text`, `qid`) VALUES
(1, 'yes', NULL, 1),
(1, 'no', NULL, 2),
(NULL, 'price', 'yes', 3),
(NULL, 'type', 'yes', 4);

-- --------------------------------------------------------

--
-- Table structure for table `drops`
--

CREATE TABLE `drops` (
  `drop_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `video_url` varchar(150) NOT NULL,
  `hotel_name` varchar(100) NOT NULL,
  `drop_date` varchar(20) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drops`
--

INSERT INTO `drops` (`drop_id`, `uid`, `video_url`, `hotel_name`, `drop_date`, `likes`) VALUES
(35, 2, 'video-644929e72dcbc5.96383174.mp4', 'Laziz Pizza', '20-04-23 08:03:00', 0),
(36, 2, 'video-6449297623a7a5.88147750.mp4', 'Hamburg Street Food Cafe', '20-04-23 08:05:20', 1);

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
(19, 2, 1),
(20, 2, 493),
(21, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(50) NOT NULL,
  `hotel_loc` varchar(300) DEFAULT NULL COMMENT 'lat and long',
  `loc_name` varchar(30) NOT NULL,
  `ratings` varchar(10) DEFAULT NULL,
  `links` varchar(300) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_loc`, `loc_name`, `ratings`, `links`, `desc`, `contact`) VALUES
(1, 'Laziz Pizza', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.090446804848!2d74.84311011744384!3d12.901905400000016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35bf8ecc6fbeb%3A0xfa77acb61322f9c3!2sLaziz%20Pizza!5e0!3m2!1sen!2sin!4v1683912436019!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/laziz-pizza-attavar/order', 'Laziz Pizza™ – Place where taste never ends. We are proud to Introduce ourselves as Laziz Pizza™ brand run by Laziz Food & Beverages based at Kolhapur, Western Maharashtra. Founded on 15th August 2013. Laziz Pizza™ is known for its Taste & Variety of Pizza. Laziz Pizza has a wide product portfolio of pizza to savor customers taste buds.', '+917337796181'),
(2, 'Hamburg Street Food Cafe', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.572443789852!2d74.85458027481332!3d12.870868887435286!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35b11eec783ed%3A0x2afa25d580156460!2sHAMBURG%20STREET%20FOOD%20CAFE!5e0!3m2!1sen!2sin!4v1683913161766!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/hamburg-street-food-cafe-kankanady/order', 'CAFE, HOME DELIVERY, CITY LIMIT, TIMINGS : 10.30AM TO 10.30PM', '9539253069'),
(3, 'Bamboo Restaurant', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.5821181520846!2d74.85390977499098!3d12.870245187435943!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35bafaaaaaaa5%3A0xd69591714a600234!2sBamboo%20Restaurant!5e0!3m2!1sen!2sin!4v1683916143058!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/bamboo-restaurant-kankanady/order', 'Relaxed restaurant serving regional meat, fish & vegetarian dishes in bamboo-lined surrounds.  Service options:  No-contact delivery, Delivery, Takeaway, Dine-in.  Opening hours: Monday - 12:00am, Sunday - 12:00pm', '8244258283'),
(5, 'Hotel Sai Palace', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.5596228425597!2d74.83972211744384!3d12.87169539999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35b58f6f28523%3A0xa5122c5bad177c6f!2sHotel%20Sai%20Palace!5e0!3m2!1sen!2sin!4v1683916706609!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/hotel-sai-palace-hampankatta/order', 'Hotel Sai Palace is a F&B-Casual Dining outlet located in the heart of the city. It offers a wide variety of delicious and mouth-watering dishes from all over the world. The restaurant has a cozy and inviting atmosphere, perfect for a casual dining experience. The staff is friendly and attentive, ensuring that all guests have a pleasant experience. The menu features a variety of dishes from Indian, Chinese, and Continental cuisines. The restaurant also offers a selection of beverages, including ', '9930809900'),
(6, 'Grameen Kulfi', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31116.488424787854!2d74.80463937431641!3d12.871603200000012!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35be620eb8651%3A0x9d392b2e4a294974!2sBombay%20Kapoor%20kulfi!5e0!3m2!1sen!2sin!4v1683919503365!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/grameen-kulfi-kottara/order', 'Ice Cream Shop in Hampankatta. Opening time: 11:00am.  ', '8073889206'),
(7, 'Momos Hut', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.714303743556!2d74.85358417499086!3d12.861720287443644!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35bdb2843c7fb%3A0x4ba9bc19bb8031ab!2sMomos%20hut!5e0!3m2!1sen!2sin!4v1683920065221!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/momos-hut-kankanady/order', 'This restaurant is an all-time favorite of all momo-lovers. It is a pocket-friendly restaurant and is a must-visit place for folks who get those hunger pangs for delicious food end of the month but cannot afford to miss out on tasty food just because they are short of money. Opening hours: (Monday-Sunday)10:00am.', '8971435109'),
(8, 'Keventers-Milkshakes and Desserts', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.502635744258!2d74.84599727499106!3d12.875368487431192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35ba492a41373%3A0xb8ce09e616ec3fb4!2sKeventers%20Mangalore!5e0!3m2!1sen!2sin!4v1683921628240!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/keventers-milkshakes-desserts-balmatta/order', 'Being an iconic milkshake brand, our core brand values lies in celebrating our past of making authentic and delicious milkshakes and desserts, while bringing in the ﬂavors of  today to the world. Available service: Home Delivery, Desserts and Bakes, Indoor Seating. Opening Hours: (Mon-Sun) 10:00am-11:00pm', '8244113300'),
(9, 'Danish Bamboo House', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.617439542714!2d74.84710427499095!3d12.867967787437967!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35ba34e066b27%3A0x48f375053f600a08!2sDanish%20Bamboo%20restaurant!5e0!3m2!1sen!2sin!4v1683922360654!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/danish-bamboo-house-kankanady/order', 'Danish Bamboo House is a F&B Casual Dining outlet that offers a unique dining experience. It serves a variety of delicious dishes from around the world, including Chinese, Thai, and Indian cuisines. The restaurant has a cozy atmosphere with comfortable seating and a warm ambiance. The menu features a wide selection of appetizers, main courses, and desserts. Opening Hours: (Mon-Thu,Sat-Sun)-12:15pm–10:45pm. Fri-1:45pm-10:45pm', '7899567777'),
(10, 'Aladdin Shawarma', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.713638759316!2d74.85362927499091!3d12.86176318744361!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35bd44919d465%3A0x7e8d91a26b1ef0ff!2sAladdin%20shawarma!5e0!3m2!1sen!2sin!4v1683922997517!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/aladdin-shawarma-kankanady/order', 'The Best Shawarma Arround. Aladdin shawarma is a pioneer in bringing International street-food to India, serving the best Middle-Eastern street delicacies. Opening Hours: Mon-Sun: 3:45pm – 9:45pm', '8792596387'),
(11, 'Hotel Sai Tudar', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3889.4001979158747!2d74.8372249!3d12.8819685!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35b1c9830a179%3A0x1f69aa4e1c75960a!2sHotel%20Sai%20tudar%20Sea%20Food%20Family%20Restaurant!5e0!3m2!1sen!2sin!4v1683924860392!5m2!1sen!2sin', 'mangaluru', '4', 'https://www.zomato.com/mangalore/hotel-sai-tudar-lalbagh/order', 'Offering: South Indian, North Indian, Chinese, Fresh juice, Milk shakes. Opening Hours: Mon-Sun:11am – 10:30pm', '9341303933'),
(12, 'Baskin Robbins', '', 'mangaluru', '4', 'https://www.zomato.com/mangalore/baskin-robbins-hampankatta/order', NULL, ''),
(13, 'BT Devrali', '', 'mangaluru', '4', 'https://www.zomato.com/mangalore/bt-devrali-kankanady/order', NULL, ''),
(14, 'Sharaabi Bar & Family Restaura', '', 'mangaluru', '4', 'https://www.zomato.com/mangalore/sharaabi-bar-family-restaurant-kadri/order', NULL, ''),
(15, 'Taste of Parika', '', 'mangaluru', '4', 'https://www.zomato.com/mangalore/taste-of-parika-kapikad/order', NULL, ''),
(16, 'Urban House', '', 'mangaluru', '4', 'https://www.zomato.com/mangalore/urban-house-bendoor/order', NULL, ''),
(17, 'Pavman', NULL, 'mangaluru', '4', 'https://www.zomato.com/mangalore/pavman-mallikatte/order', 'khk', ''),
(18, 'Andhra House', '', 'mangaluru', '4', 'https://www.zomato.com/mangalore/andhra-house-kadri/order', NULL, ''),
(19, 'Wholesome Kitchen', '', 'mangaluru', '4', 'https://www.zomato.com/mangalore/wholesome-kitchen-mallikatte/order', NULL, ''),
(20, 'Mangala', '', 'mangaluru', '4', 'https://www.zomato.com/mangalore/mangala-bendoor/order', NULL, ''),
(22, 'Taco Street', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/taco-street-kodailbail/order', NULL, ''),
(23, 'Kaati Zone Rolls And Wraps', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/kaati-zone-rolls-and-wraps-kodailbail/order', NULL, ''),
(24, 'Burger Shack', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/burger-shack-bendoor/order', NULL, ''),
(25, 'Wine And Dine', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/wine-and-dine-thokottu/order', NULL, ''),
(26, 'Frozen Scoops', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/frozen-scoops-1-hampankatta/order', NULL, ''),
(27, 'Sizzlers Ranch', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/sizzlers-ranch-hampankatta/order', NULL, ''),
(28, 'The Good Bowl', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/the-good-bowl-hampankatta/order', NULL, ''),
(29, 'Sri Durga Lunch Home', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/sri-durga-lunch-home-attavar/order', NULL, ''),
(30, 'Pure Veg Meals By LunchBox', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/pure-veg-meals-by-lunchbox-hampankatta/order', NULL, ''),
(32, 'Gajalee Sea Food', '', 'mangaluru', '4.1', 'https://www.zomato.com/mangalore/gajalee-sea-food-kadri/order', NULL, ''),
(33, 'Hao Ming', '', 'mangaluru', '4.2', 'https://www.zomato.com/mangalore/hao-ming-balmatta/order', NULL, ''),
(34, 'WarmOven Cake & Desserts', '', 'mangaluru', '4.2', 'https://www.zomato.com/mangalore/warmoven-cake-desserts-kodailbail/order', NULL, ''),
(35, 'Behrouz Biryani', '', 'mangaluru', '4.2', 'https://www.zomato.com/mangalore/behrouz-biryani-hampankatta/order', NULL, ''),
(37, 'Sundae Everyday Ice Creams', '', 'mangaluru', '4.2', 'https://www.zomato.com/mangalore/sundae-everyday-ice-creams-kodailbail/order', NULL, ''),
(38, 'Gauji Gammath', '', 'mangaluru', '4.2', 'https://www.zomato.com/mangalore/gauji-gammath-hampankatta/order', NULL, ''),
(39, 'Olive Street Food Cafe', '', 'mangaluru', '4.3', 'https://www.zomato.com/mangalore/olive-street-food-cafe-kodailbail/order', NULL, ''),
(40, 'Crave Desserts & Bakes', '', 'mangaluru', '4.3', 'https://www.zomato.com/mangalore/crave-desserts-bakes-balmatta/order', NULL, ''),
(41, 'Raslaffan Ice Cream Parlour', '', 'mangaluru', '4.3', 'https://www.zomato.com/mangalore/raslaffan-ice-cream-parlour-pumpwell/order', NULL, ''),
(42, 'New Kudla', '', 'mangaluru', '4.3', 'https://www.zomato.com/mangalore/new-kudla-ashok-nagar/order', NULL, ''),
(43, 'Rathna s Wine Gate', '', 'mangaluru', '4.3', 'https://www.zomato.com/mangalore/rathnas-wine-gate-kodailbail/order', NULL, ''),
(44, 'Machali', '', 'mangaluru', '4.3', 'https://www.zomato.com/mangalore/machali-kodailbail/order', NULL, ''),
(45, 'G Food Fun', '', 'mangaluru', '4.3', 'https://www.zomato.com/mangalore/g-food-n-fun-bendoor/order', NULL, ''),
(46, 'Ideal Cafe', '', 'mangaluru', '4.4', 'https://www.zomato.com/mangalore/ideal-cafe-hampankatta/order', NULL, ''),
(47, 'Chandus Biryani Spot', '', 'mangaluru', '4.4', 'https://www.zomato.com/mangalore/chandus-biryani-spot-kavoor/order', NULL, ''),
(48, 'Meisterwurst', '', 'mangaluru', '4.4', 'https://www.zomato.com/mangalore/meisterwurst-kodailbail/order', NULL, ''),
(49, 'Pabbas', '', 'mangaluru', '4.5', 'https://www.zomato.com/mangalore/pabbas-lalbagh/order', NULL, ''),
(50, 'Drood Cafe', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/drood-cafe-kankanady/order', NULL, ''),
(51, 'Biryani Express', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/biryani-express-kavoor/order', NULL, ''),
(52, 'Parika Bakes', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/parika-bakes-marnamikatte/order', NULL, ''),
(53, 'The Juice Dude', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/the-juice-dude-kankanady/order', NULL, ''),
(54, 'Nomou - Vegan Gelato', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/nomou-vegan-gelato-attavar/order', NULL, ''),
(56, 'Kling Krishna Cafe', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/kling-krishna-cafe-hampankatta/order', NULL, ''),
(57, 'Jumbos Kitchen', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/jumbos-kitchen-kodailbail/order', NULL, ''),
(58, 'Taj Mahal Restaurant', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/taj-mahal-restaurant-hampankatta/order', NULL, ''),
(59, 'Kottara 70 Surprise', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/kottaras-70-surprise-kottara/order', NULL, ''),
(60, 'Cafe Margarita', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/cafe-margarita-lalbagh/order', NULL, ''),
(61, 'The Grand Kitchen By AJ Grand ', '', 'mangaluru', '-', 'https://www.zomato.com/mangalore/the-grand-kitchen-by-aj-grand-hotel-balmatta/order', NULL, ''),
(63, 'Bapama s Cafe', '', 'mangaluru', 'New', 'https://www.zomato.com/mangalore/bapamas-cafe-kadri/order', NULL, ''),
(64, 'Ferns & Martins', '', 'mangaluru', 'New', 'https://www.zomato.com/mangalore/ferns-martins-kavoor/order', NULL, ''),
(65, 'The Waffle Man - House of Cook', '', 'mangaluru', 'New', 'https://www.zomato.com/mangalore/the-waffle-man-house-of-cookie-man-attavar/order', NULL, ''),
(66, 'Frankie Delight', '', 'mangaluru', 'New', 'https://www.zomato.com/mangalore/frankie-delight-kottara/order', NULL, ''),
(68, 'The Hungry Birds', '', 'mangaluru', 'New', 'https://www.zomato.com/mangalore/the-hungry-birds-hampankatta/order', NULL, ''),
(402, 'Chicken hut', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.652920696616!2d74.85620347499088!3d12.865679687440007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35bccce033b3d%3A0x35fdffaa9921e9b2!2sHotel%20Chicken%20Hut!5e0!3m2!1sen!2sin!4v1683926408334!5m2!1sen!2sin', 'mangaluru', '3.8', 'https://www.zomato.com/mangalore/hotel-chicken-hut-marnamikatte/menu', 'Variety of delicious dishes. Services: Home delivery, Indoor seating', '08242430404'),
(403, 'Hotel Chicken Hut', 'akjhivhlsdkvnanajk', 'mangaluru', '4', 'https//:www.google.com', 'ahghdfvbslb', '9483768372'),
(404, 'Hotel Chicken Hut', 'akjhivhlsdkvnanajk', 'mangaluru', '4', 'https//:www.google.com', 'ahghdfvbslb', '9483768372');

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
(1, 1, 'BBQ Pizza', 210, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(2, 1, 'Special Spicy Pizza', 220, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(3, 1, 'Lions Appetite Pizza', 245, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(4, 1, 'Paneer Ghee Roast Pizza', 240, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(5, 1, 'Cheese N Cheese Pizza', 145, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(6, 1, 'Pizza Box for One [Veg]', 299, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(7, 1, 'Pizza Box for One [Non-Veg]', 325, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(8, 1, 'Family pizza box [Veg]', 745, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(9, 1, 'Family pizza box [Non-Veg]', 799, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(10, 1, 'Pizza Party Box', 1050, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(11, 1, 'Laziz Special Combo', 799, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(12, 1, 'Margherita Pizza', 145, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(13, 1, 'Cheese N Cheese Pizza', 145, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(14, 1, 'Pomidor Pizza', 145, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(15, 1, 'Laziz Desi Veg Pizza', 180, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(16, 1, 'Corn Golden Pizza', 175, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(17, 1, 'Vegetariana Pizza', 180, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(18, 1, 'Garden Fresh Pizza', 190, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(19, 1, 'Veg Paprika Pizza', 190, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(20, 1, 'Paneer Tikka Pizza', 190, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(21, 1, 'Fiery Paneer Pizza', 195, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(22, 1, 'Mushroom Paprika Pizza', 195, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(23, 1, 'Veg Schezwan Pizza', 190, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(24, 1, 'Paneer Chilli Pizza', 195, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(25, 1, 'Carnival Veg Pizza', 210, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(26, 1, 'Mexican Veg Pizza', 215, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(27, 1, 'Corn Exotica Pizza', 215, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(28, 1, 'Veg Extra Delight Pizza', 215, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(29, 1, 'Achari Veg Pizza', 210, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(30, 1, 'Yum Dum Pizza', 210, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(31, 1, 'Curry Veg Pizza', 210, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(32, 1, 'Special Spicy Pizza', 220, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(33, 1, 'Mushroom Garlic Delight Pizza', 215, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(34, 1, 'Pepper Paneer Pizza', 215, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(35, 1, 'Paneer Ghee Roast Pizza', 240, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(36, 1, 'Jamaican Veg Pizza', 240, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(37, 1, 'Veg Extraveganza Pizza', 250, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(38, 1, 'Egg Scrambled Pizza', 230, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(39, 1, 'Egg Hot and Spicy Pizza', 230, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(40, 1, 'Peppy Egg Pizza', 230, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(41, 1, 'Chicken Tikka Pizza', 195, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(42, 1, 'Chicken Schezwan Pizza', 195, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(43, 1, 'Chicken Seekh Kabab Pizza', 195, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(44, 1, 'Tandoori Chicken Pizza', 195, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(45, 1, 'Chicken Hawaiian Pizza', 190, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(46, 1, 'Chicken Keema Pizza', 195, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(47, 1, 'Mexican Chicken Pizza', 210, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(48, 1, 'Carnival Chicken Pizza', 210, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(49, 1, 'BBQ Pizza', 210, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(50, 1, 'Butter Chicken Pizza', 210, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(177, 2, 'Vanilla Milkshake', 63, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(178, 2, 'Classic Veggie Salad', 76, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(179, 2, 'Classic Chicken Salad', 89, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(180, 2, 'Egg Chips Burger', 89, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(181, 2, 'Omelette Cheese Burger', 97, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(182, 2, 'Steak Chicken Burger', 110, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(183, 2, 'Mughlai Chicken Burger', 115, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(184, 2, 'OMG Chicken Burger', 150, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(185, 2, 'Mexi Chicken Burger', 162, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(186, 2, 'Ham Chicken Burger', 167, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(187, 2, 'King of Chicken Burger', 175, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(188, 2, 'Veggie Burger', 76, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(189, 2, 'Veggie Cheese Burger', 84, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(190, 2, 'Paneer Burger', 102, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(191, 2, 'Mushroom Burger', 102, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(192, 2, 'Paneer Cheese Burger', 115, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(193, 2, 'Mushroom Cheese Burger', 115, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(194, 2, 'Mixed Veggie Hot Dog    Burger', 141, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(195, 2, 'Steak Club Sandwich', 167, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(196, 2, 'Mughlai Club Sandwich', 175, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(197, 2, 'Veg Sandwich', 76, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(198, 2, 'Veg Cheese Sandwich', 84, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(199, 2, 'Veggies Salad Sandwich', 89, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(200, 2, 'Paneer Sandwich', 97, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(201, 2, 'Mushroom Sandwich', 97, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(202, 2, 'Veggie Club Sandwich', 136, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(203, 2, 'Hamburg Mixed Veg Club    Sand', 175, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(204, 2, 'Egg Sandwich', 76, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(205, 2, 'Steak Chicken Sandwich', 97, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(206, 2, 'Mughlai Chicken    Sandwich', 102, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(207, 2, 'Veggie Chips Wrap', 39, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(208, 2, 'Fried Parotta Wrap', 50, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(209, 2, 'Mixed Veggie Chips Wrap', 63, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(210, 2, 'Grilled Mix Veg Chips', 71, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(211, 2, 'Paneer Parotta Wrap', 84, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(212, 2, 'Mushroom Parotta Wrap', 84, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(213, 2, 'Grilled Paneer Parotta', 97, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(214, 2, 'Grilled Mushroom    Parotta', 97, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(215, 2, 'French Fries', 76, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(216, 2, 'Omelette Chips Wrap', 58, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(217, 2, 'Steak Chicken Wrap', 84, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(218, 2, 'Special Chicken Kothu    Parot', 89, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(219, 2, 'Mughlai Chicken Wrap', 89, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(220, 2, 'Mughlai Cheese Chicken    Wrap', 102, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(221, 2, 'Kathi Grilled Parotta    Wrap', 110, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(222, 2, 'Mumbai Wala Mixed Wrap', 113, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(223, 2, 'Fatty Grilled Parotta', 115, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(224, 2, 'Banana Milkshake', 63, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(225, 2, 'Oreo Milkshake', 63, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(493, 3, 'Chicken Biryani', 150, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(494, 3, 'Bamboo Chicken Biryani', 330, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(495, 3, 'Bamboo Tikka Biriyani', 380, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(496, 3, 'Mutton Biriyani', 160, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(497, 3, 'Drums Of Heaven', 280, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(498, 3, 'Chicken Lollipop', 230, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(499, 3, 'Alfaham Mandi', 480, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(500, 3, 'Bamboo Mutton Biryani', 440, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(501, 3, 'Mojito', 80, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(502, 3, 'Boneless Butter Chicken', 310, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(503, 3, 'Chicken Rara', 290, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(504, 3, 'Dragon Chicken', 290, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(505, 3, 'Chicken Pepper', 280, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(506, 3, 'Chicken Tikka', 280, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(507, 3, 'Chicken ManchurianGravy', 280, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(508, 3, 'Paneer Butter Masala', 240, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(509, 3, 'Chicken Fried Rice', 200, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(510, 3, 'French Fries', 170, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(511, 3, 'Lime Juice', 60, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(512, 3, 'Lime Soda', 60, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(513, 3, 'Fruit Salad', 110, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(514, 3, 'Chicken Tikka [1 Piece]', 90, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(515, 3, 'Grape Juice', 80, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(516, 3, 'Butter Naan', 35, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(517, 3, 'Lime Minit', 60, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(518, 3, 'Lime With Mint + Ginger', 60, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(519, 3, 'Butter Kulcha', 30, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(520, 3, 'Ginger Lime', 60, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(521, 3, 'Raita', 10, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(522, 3, 'Tandoori Chicken', 230, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(523, 3, 'Chicken Ghee Roast Dry', 320, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(524, 3, 'Alfaham', 160, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(525, 3, 'Chicken Hot And SourSoup', 120, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(526, 3, 'Chicken Manchow Soup', 120, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(527, 3, 'Coriander Lemon Soup', 100, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(528, 3, 'Cream of Mushroom Soup', 120, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(529, 3, 'Mutton Hot And Sour', 0, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(530, 3, 'Mutton Manchow Soup', 140, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(531, 3, 'Prawns Soup', 140, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(532, 3, 'Veg Hot And Sour Soup', 100, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(533, 3, 'Veg Manchow Soup', 100, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(534, 3, 'Baby Corn ManchurianDry', 200, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(535, 3, 'French Fries', 170, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(536, 3, 'Gobi Manchurian Dry', 200, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(537, 3, 'Mushroom 65', 220, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(538, 3, 'Paneer Tikka 6 Pieces', 240, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(539, 3, 'Paneer Manchurian', 220, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(540, 3, 'Mushroom Manchurian', 220, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(541, 3, 'Mushroom Pepper', 220, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(542, 3, 'Baby Corn Pepper', 220, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(547, 5, 'Veg Grilled Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(548, 5, 'Chicken Grilled Sandwich', 143, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(549, 5, 'Dharwad Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(550, 5, 'Oreo Pastry', 132, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(551, 5, 'Chicken Sandwich', 121, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(552, 5, 'Motichur Laddo [100Grm]', 57, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(553, 5, 'Cheese Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(554, 5, 'Veg Club Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(555, 5, 'Chocolate Brownie[2Pcs]', 110, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(556, 5, 'Muskmelon Juice', 105, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(557, 5, 'Watermelon Juice', 105, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(558, 5, 'Kesar Kaju Katli[ 100Grm]', 97, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(559, 5, 'Donut [3Pcs]', 88, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(560, 5, 'Gulab Jamum [4Pcs]', 88, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(561, 5, 'Ghee Mysour Pak [100grm]', 77, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(562, 5, 'Angoor Rabdi [100Grm]', 68, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(563, 5, 'Sweet Lassi', 66, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(564, 5, 'Milk Cake [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(565, 5, 'Coconut Peda [100Grm]', 59, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(566, 5, 'Moongdal Halwa [100Grm]', 57, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(567, 5, 'Fresh Lime Water', 39, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(568, 5, 'Veg Sandwich', 88, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(569, 5, 'Cheese Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(570, 5, 'Veg Club Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(571, 5, 'Veg Grilled Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(572, 5, 'Chicken Sandwich', 121, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(573, 5, 'Chicken Grilled Sandwich', 143, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(574, 5, 'Chicken Club Sandwich', 143, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(575, 5, 'Fresh Fruit Juice', 105, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(576, 5, 'Fresh Lime Water', 39, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(577, 5, 'Cold Coffee', 121, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(578, 5, 'Peach Iced Tea', 77, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(579, 5, 'Lemon Iced Tea', 77, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(580, 5, 'Mineral Water', 33, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(581, 5, 'Salted Lassi', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(582, 5, 'Sweet Lassi', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(583, 5, 'Guava Mary', 154, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(584, 5, 'Pineapple Paradise', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(585, 5, 'Apple Pie Mocktail', 154, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(586, 5, 'Express Martini', 154, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(587, 5, 'Dune Runner', 154, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(588, 5, 'Frozen Feast', 154, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(589, 5, 'Blue Moon', 154, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(590, 5, 'The Coladas', 154, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(591, 5, 'Pineapple Juice', 105, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(592, 5, 'Watermelon Juice', 105, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(593, 5, 'Papaya Juice', 105, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(594, 5, 'Muskmelon Juice', 105, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(595, 5, 'Chikoo Milkshake', 143, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(596, 5, 'Chocolate Milkshake', 143, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(597, 5, 'Vanilla Milkshake', 143, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(598, 5, 'Rose Milkshake', 143, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(599, 5, 'Apple Milkshake', 187, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(600, 5, 'Gulkand Laddo [100Grm]', 88, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(601, 5, 'Rawa Laddo[ 100Grm]', 68, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(602, 5, 'Besan Laddo [100Grm]', 77, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(603, 5, 'Mumbai Ice Halwa Mix[ 500Grm]', 638, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(604, 5, 'Special Mysour Pak [100grm]', 59, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(605, 5, 'Ghee Mysour Pak [100grm]', 77, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(606, 5, 'Motichur Laddo [100Grm]', 57, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(607, 5, 'Dharwad Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(608, 5, 'Amrith Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(609, 5, 'Coconut Peda [100Grm]', 59, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(610, 5, 'Kalakand Barfi [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(611, 5, 'Anjeer Malai Barfi [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(612, 5, 'Mango Barfi [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(613, 5, 'Milk Cake [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(614, 5, 'Malai Sandwich [4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(615, 5, 'Rasgulla [4Pcs]', 110, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(616, 5, 'Gulab Jamum [4Pcs]', 88, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(617, 5, 'Chikku Halwa 100Grm', 72, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(618, 5, 'Rasm Malai [4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(619, 5, 'Mango Malai Sandwich[ 4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(620, 5, 'Vanilla Malai Sandwich [4pcs]', 154, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(621, 5, 'Malai Chamcham[4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(622, 5, 'Ras Khadam [4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(623, 5, 'Angoor Rabdi [100Grm]', 68, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(624, 5, 'Moongdal Halwa [100Grm]', 57, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(625, 5, 'Oreo Pastry [2Pcs]', 132, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(626, 5, 'Pastry [2Pcs]', 120, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(627, 5, 'Chocolate Brownie[2Pcs]', 110, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(628, 5, 'Oreo Delight Cake [1/2kg]', 440, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(629, 5, 'Black Foreast Cake [1/2kg]', 418, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(630, 5, 'White Foreast Cake [1/2kg]', 418, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(631, 5, 'Swiss Chocolate Cake [1/2kg]', 418, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(632, 5, 'Dark Chocolate Cake [1/2kg]', 418, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(633, 5, 'Hand Made Chocolate [100grm]', 110, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(634, 5, 'Carmeal Custurd [1pcs]', 61, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80');
INSERT INTO `item` (`item_id`, `hotel_id`, `item_name`, `item_price`, `item_rating`, `item_img`) VALUES
(635, 5, 'Oreo Pastry', 132, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(636, 5, 'Pastry', 110, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(637, 5, 'Chocolate Brownie', 110, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(638, 5, 'Oreo Delight Cake', 440, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(639, 5, 'Newyork Truffle Cake', 418, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(640, 5, 'Black Forest Cake', 418, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(641, 5, 'White Forest Cake', 418, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(642, 5, 'Swiss Chocolate Cake', 418, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(643, 5, 'Dark Chocolate Cake', 418, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(644, 5, 'Handmade Chocolate', 110, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(645, 5, 'Caramel Custurd', 61, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(646, 5, 'Strawberry Kaju Katli [100grm]', 97, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(647, 5, 'Kaju Katli [100Grm ]', 92, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(648, 5, 'Dry Fruit Mix Sweets[ 100Grm]', 145, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(649, 5, 'Fancy Dryfruit Sweets Box(500g', 880, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(650, 5, 'Milk Sweets Mix Box(500grm)', 418, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(651, 5, 'Kesar Kaju Katli[ 100Grm]', 97, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(652, 5, 'Dharwad Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(653, 5, 'Amrith Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(654, 5, 'Coconut Peda [100Grm]', 59, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(655, 5, 'Kalakand Barfi [100grm]', 66, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(656, 5, 'Anjeer Malai Barfi [100grm]', 66, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(657, 5, 'Mango Barfi [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(658, 5, 'Milk Cake [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(659, 5, 'Donut [3Pcs]', 88, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(660, 5, 'Moong Dal Kachuri [250grm]', 132, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(661, 5, 'Special Bhakarwadi [200grm]', 77, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(674, 10, 'Shawarma Roll [Jumbo]', 159, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(675, 10, 'Crispy Roll [Mini]', 129, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(676, 10, 'Full Meat Roll', 139, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(677, 10, 'Mini Classic Cheese Shawarma', 139, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(678, 10, 'Regular Meat Shawarma Roll', 159, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(679, 10, 'Mini Classic Cheese Shawarma', 139, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(680, 10, 'Regular Meat Shawarma Roll', 159, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(681, 10, 'Mini Classic Spicy Shawarma', 139, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(682, 10, 'Shawarma Roll [Jumbo]', 159, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(683, 10, 'Crispy Roll [Mini]', 129, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(684, 10, 'Full Meat Roll', 139, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(685, 10, 'Falafel Chicken Roll', 159, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(686, 10, 'Veg Regular Falafel Shawarma R', 110, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(687, 10, 'Veg Spicy Falafel Shawarma Rol', 119, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(688, 10, 'Fillet Burger', 99, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(689, 10, 'Shawarma Burger', 89, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(690, 10, 'Falafel Veg Burger', 69, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(691, 10, 'French Fries', 90, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(705, 9, 'Dragon Chicken [8 Pieces]', 310, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(706, 9, 'Chicken Tandoori', 255, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(707, 9, 'Chicken Fried Rice', 210, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(708, 9, 'Al Faham Chicken Kuzhi Mandi', 290, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(709, 9, 'Chicken Noodles', 210, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(710, 9, 'Veg Fried Rice', 245, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(711, 9, 'Chicken Schezwan Fried Rice', 225, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(712, 9, 'Mutton Pepper', 570, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(713, 9, 'Chicken Lollipop [8 Pieces]', 260, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(714, 9, 'Egg Fried Rice', 245, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(715, 9, 'Arabic Al Faham Chicken', 160, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(716, 9, 'Chicken Schezwan Noodles', 225, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(717, 9, 'Butter Naan', 50, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(718, 9, 'Mutton Kuzhi Mandi', 360, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(719, 9, 'Butter Garlic Chicken', 345, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(720, 9, 'Chicken Tandoori Masala [4 Pie', 325, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(721, 9, 'Chicken Lara [4 Pieces]', 325, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(722, 9, 'Gobi Manchurian', 160, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(723, 9, 'Chicken Garlic', 299, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(724, 9, 'Drums of Heaven [8 Pieces]', 299, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(725, 9, 'Veg Punjabi', 220, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(726, 9, 'Dal Tadka', 175, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(727, 9, 'Mint Lime Juice', 60, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(728, 9, 'Mango Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(729, 9, 'Mango Tamarind Kulukki', 105, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(730, 9, 'Green Salad', 105, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(731, 9, 'Chicken Tikka', 90, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(732, 9, 'Mosambi Juice', 80, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(733, 9, 'Orange Juice', 80, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(734, 9, 'Naan', 40, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(735, 9, 'Spicy Al Faham Chicken', 160, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(736, 9, 'Arabic Al Faham Chicken', 160, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(737, 9, 'Paneer Tikka', 295, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(738, 9, 'Chicken Lollipop [8 Pieces]', 260, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(739, 9, 'Chicken Kebab [8 Pieces]', 280, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(740, 9, 'Chicken 65', 295, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(741, 9, 'Chicken Ghee Roast', 415, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(742, 9, 'Mutton Ghee Roast', 580, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(743, 9, 'Prawns Ghee Roast', 390, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(744, 9, 'Boneless Chicken Hariyali Keba', 390, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(745, 9, 'Boneless Chicken Reshmi Kebab ', 415, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(746, 9, 'Boneless Chicken Angara Kebab ', 390, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(747, 9, 'Boneless Chicken Lasooni Malai', 390, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(748, 9, 'Chicken Tandoori', 255, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(749, 9, 'Chicken Tikka', 90, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(750, 9, 'Danish Special Boneless Tikka ', 399, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(751, 9, 'Veg Bamboo Biryani', 310, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(752, 9, 'Chicken Bamboo Biryani', 380, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(753, 9, 'Mutton Bamboo Biryani', 495, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(754, 9, 'Prawns Bamboo Biryani [8 Piece', 480, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(755, 9, 'Tikka Bamboo Biryani', 430, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(756, 9, 'Al Faham Chicken Kuzhi Mandi', 290, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(757, 9, 'Mutton Kuzhi Mandi', 360, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(758, 9, 'Veg Punjabi', 220, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(759, 9, 'Mix Veg Curry', 220, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(760, 9, 'Paneer Tikka Masala', 240, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(761, 9, 'Paneer Butter Masala', 240, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(762, 9, 'Dal Fry', 150, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(763, 9, 'Dal Palak', 185, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(764, 9, 'Dal Kolhapuri', 185, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(765, 9, 'Dal Tadka', 175, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(766, 9, 'Chicken Lara [4 Pieces]', 325, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(767, 9, 'Chicken Mughlai [4 Pieces]', 325, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(768, 9, 'Chicken Tandoori Masala [4 Pie', 325, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(769, 9, 'Chicken Tikka Masala [4 Pieces', 325, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(770, 9, 'Boneless Strips Butter Chicken', 345, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(771, 9, 'Chicken Peshawari [4 Pieces]', 325, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(772, 9, 'Danish Special Chicken', 530, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(773, 9, 'Mutton Lara [4 Pieces]', 390, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(774, 9, 'Mutton Mughlai [4 Pieces]', 390, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(775, 9, 'Mutton Peshawari [4 Pieces]', 390, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(776, 9, 'Danish Special Mutton [4 Piece', 660, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(777, 9, 'Veg Soup', 120, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(778, 9, 'Chicken Soup', 140, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(779, 9, 'Mutton Soup', 160, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(780, 9, 'Arabian Salad', 160, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(781, 9, 'Roti', 30, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(782, 9, 'Butter Roti', 40, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(783, 9, 'Naan', 40, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(784, 9, 'Butter Naan', 50, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(785, 9, 'Kulcha', 35, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(786, 9, 'Butter Kulcha', 45, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(787, 9, 'Garlic Naan', 60, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(788, 9, 'Cheese Butter Naan', 95, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(789, 9, 'Gobi Manchurian', 160, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(790, 9, 'Gobi Chilli', 160, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(791, 9, 'Mushroom Manchurian', 185, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(792, 9, 'Mushroom Chilli', 185, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(793, 9, 'Paneer Manchurian', 220, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(794, 9, 'Paneer Chilli', 220, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(795, 9, 'Thai Style Boneless Chicken Le', 299, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(796, 9, 'Chicken Chilli', 299, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(797, 9, 'Chicken Ginger', 299, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(798, 9, 'Chicken Garlic', 299, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(799, 9, 'Chicken Manchurian', 299, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(800, 9, 'Butter Garlic Chicken', 345, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(801, 9, 'Dragon Chicken [8 Pieces]', 310, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(802, 9, 'Mutton Pepper', 570, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(803, 9, 'Drums of Heaven [8 Pieces]', 299, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(804, 9, 'Veg Fried Rice', 245, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(805, 9, 'Egg Fried Rice', 245, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(806, 9, 'Chicken Fried Rice', 210, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(807, 9, 'Chicken Schezwan Fried Rice', 225, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(808, 9, 'Mutton Fried Rice', 230, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(809, 9, 'Mutton Schezwan Fried Rice', 245, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(810, 9, 'Prawns Fried Rice', 240, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(811, 9, 'Mixed Fried Rice', 255, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(812, 9, 'Veg Noodles', 185, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(813, 9, 'Egg Noodles', 185, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(814, 9, 'Chicken Noodles', 210, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(815, 9, 'Chicken Schezwan Noodles', 225, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(816, 9, 'Mutton Noodles', 230, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(817, 9, 'Mutton Schezwan Noodles', 245, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(818, 9, 'Mayonnaise', 50, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(819, 9, 'Green Salad', 105, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(820, 9, 'Chikoo Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(821, 9, 'Pomegranate Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(822, 9, 'Papaya Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(823, 9, 'Shamam Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(824, 9, 'Mango Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(825, 9, 'Oreo Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(826, 9, 'Chocolate Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(827, 9, 'Strawberry Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(828, 9, 'Dates & Honey Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(829, 9, 'Special Sharjah Milkshake', 115, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(830, 9, 'Danish Special Milkshake', 120, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(831, 9, 'Lime Juice', 50, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(832, 9, 'Mint Lime Juice', 60, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(833, 9, 'Mosambi Juice', 80, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(834, 9, 'Orange Juice', 80, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(835, 9, 'Watermelon Juice', 80, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(836, 9, 'Pineapple Juice', 80, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(837, 9, 'Strawberry Lassi', 70, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(838, 9, 'Pista Lassi', 70, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(839, 9, 'Vanilla Lassi', 70, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(840, 9, 'Chocolate Lassi', 70, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(841, 9, 'Mango Lassi', 70, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(842, 9, 'Lime Soda', 60, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(843, 9, 'Ginger Lime Soda', 60, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(844, 9, 'Chilli Lime Soda', 60, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(845, 9, 'Blue Lemon Soda', 70, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(846, 9, 'Mint Lime Soda', 60, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(847, 9, 'Lime Mint Kulukki', 70, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(848, 9, 'Lemon Kulukki', 70, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(849, 9, 'Ginger Kulukki', 70, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(850, 9, 'Pineapple Kulukki', 80, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(851, 9, 'Raw Mango Kulukki', 80, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(852, 9, 'Tamarind Kulukki', 80, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(853, 9, 'Mango Pineapple Kulukki', 105, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(854, 9, 'Pineapple Mint Kulukki', 105, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(855, 9, 'Mango Tamarind Kulukki', 105, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(856, 9, 'Mojito', 90, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(960, 6, 'Dry Fruit Matka Kulfi (pack Of', 161, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(961, 6, 'Kesar Pista Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(962, 6, 'Choco+malai Jugalbandi Slice K', 178, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(963, 6, 'Shahi Gulkand Slice (pack Of 3', 178, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(964, 6, 'Gud Badaam Matka Kulfi (pack O', 161, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(965, 6, 'Thandai Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(966, 6, 'Combo 2', 99, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(967, 6, 'Chocolate Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(968, 6, 'Gud Badaam Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(969, 6, 'Anjeer Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(970, 6, 'Butterscotch Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(971, 6, 'Choco+aam Jugalbandi Slice Kul', 178, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(972, 6, 'Gulkand+ Malai Jugalbandi Slic', 178, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(973, 6, 'Kesar Pista Matka Kulfi (pack ', 161, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(974, 6, 'Kesar Pista Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(975, 6, 'Thandai Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(976, 6, 'Anjeer Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(977, 6, 'Gud Badaam Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(978, 6, 'Butterscotch Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(979, 6, 'Chocolate Stick Kulfi', 55, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(980, 6, 'Dry Fruit Matka Kulfi (pack Of', 161, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(981, 6, 'Kesar Pista Matka Kulfi (pack ', 161, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(982, 6, 'Shahi Gulkand Matka Kulfi (pac', 161, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(983, 6, 'Gud Badaam Matka Kulfi (pack O', 161, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(984, 6, 'Shahi Gulkand Slice (pack Of 3', 178, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(985, 6, 'Gulkand+ Malai Jugalbandi Slic', 178, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(986, 6, 'Choco+aam Jugalbandi Slice Kul', 178, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(987, 6, 'Choco+malai Jugalbandi Slice K', 178, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(991, 8, 'Hot Chocolate Classic', 159, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(992, 8, 'Classic Cold Coffee', 199, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(993, 8, 'Thick - Thicker - Thickest Com', 747, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(994, 8, 'Hot Chocolate Tiramisu', 189, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(995, 8, 'After Dark Fantasy Sundae', 259, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(996, 8, 'Butterscotch Milkshake', 199, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(997, 8, 'Christmas Hot Chocolate', 189, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(998, 8, 'Tiramisu Ice Cream [100 ml]', 92, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(999, 8, 'Chocolate Oreo Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1000, 8, 'Nutella Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1001, 8, 'Chocolate Hazelnut Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80');
INSERT INTO `item` (`item_id`, `hotel_id`, `item_name`, `item_price`, `item_rating`, `item_img`) VALUES
(1002, 8, 'Kit-Kat Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1003, 8, 'Guilty Pleasure Sundae', 259, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1004, 8, 'Original Vanilla Blended Ice C', 254, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1005, 8, 'Mango Milkshake', 249, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1006, 8, 'Rasmalai Milkshake', 244, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1007, 8, 'Sitaphal Milkshake', 244, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1008, 8, 'Rage x Keventers - Hazelnut Co', 224, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1009, 8, 'Classic Strawberry Milkshake', 199, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1010, 8, 'Vanilla Milkshake', 189, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1011, 8, 'Cookies & Cream Ice Cream [100', 84, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1012, 8, 'Crinkle Fries - Classic', 99, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1013, 8, 'Triple Chocolate Ice cream [10', 84, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1014, 8, 'Alphonso Mango Ice Cream [100 ', 84, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1015, 8, 'Original Vanilla Ice Cream [10', 84, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1016, 8, 'Chikoo Ice Cream [100 ml]', 75, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1017, 8, 'Makino Corn Chips Cream \'n\' On', 45, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1018, 8, 'Chikoo Ice Cream [450 ml]', 270, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1019, 8, 'Makino Corn Twist Pizza', 45, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1020, 8, 'Alphonso Mango Ice Cream [450 ', 279, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1021, 8, 'Choco Chip Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1022, 8, 'Spiced Chai', 179, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1023, 8, 'Chocolate Oreo Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1024, 8, 'Mint Oreo Crumble Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1025, 8, 'Chocolate Hazelnut Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1026, 8, 'Mocha Mania Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1027, 8, 'Nutella Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1028, 8, '5 Star Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1029, 8, 'Chocolate Chip Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1030, 8, 'Rasmalai Thick Shake', 269, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1031, 8, 'Strawberry Special Thick Shake', 269, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1032, 8, 'Kit Kat Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1033, 8, 'BubbleGum Thick Shake', 269, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1034, 8, 'Peanut Butter Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1035, 8, 'Kesar Badam Thick Shake', 269, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1036, 8, 'Sitafal Thick Shake', 269, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1037, 8, 'Snickers Thick Shake', 279, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1038, 8, 'Exotic Mango Thick Shake', 269, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1039, 8, 'Double Trouble Combo', 575, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1040, 8, 'Coolest Comfort Combo', 445, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1041, 8, 'Thick - Thicker - Thickest Com', 747, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1042, 8, 'The Chill Zone', 491, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1043, 8, 'Sugar, Spice and Everything Ni', 602, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1044, 8, 'Summer Sundae-ing', 583, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1045, 8, 'Kit-Kat Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1046, 8, 'Chocolate Oreo Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1047, 8, 'Choco Chip Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1048, 8, 'Chocolate Hazelnut Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1049, 8, 'Nutella Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1050, 8, 'Mocha Mania Milkshake', 249, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1051, 8, 'Mint Oreo Crumble Milkshake', 244, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1052, 8, 'Peanut Butter Milkshake', 249, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1053, 8, 'Snicker Milkshake', 244, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1054, 8, '5 Star Milkshake', 259, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1055, 8, 'Kesar Badam Milkshake', 249, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1056, 8, 'Keventers Strawberry Special M', 249, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1057, 8, 'Mango Milkshake', 249, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1058, 8, 'Rasmalai Milkshake', 244, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1059, 8, 'Bubblegum Milkshake', 249, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1060, 8, 'Sitaphal Milkshake', 244, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1061, 8, 'Vanilla Milkshake', 189, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1062, 8, 'Classic Strawberry Milkshake', 199, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1063, 8, 'Pineapple Milkshake', 169, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1064, 8, 'Butterscotch Milkshake', 199, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1065, 8, 'Coconut Blended Ice Cream Shak', 254, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1066, 8, 'Chikoo Blended Ice Cream Shake', 254, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1067, 8, 'Tutti Frutti Blended Ice Cream', 254, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1068, 8, 'Cookies & Cream Blended Ice Cr', 254, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1069, 8, 'Mocha Almond Fudge Brownie Ble', 254, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1070, 8, 'Original Vanilla Blended Ice C', 254, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1071, 8, 'Butterscotch Crunch Blended Ic', 254, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1072, 8, 'Triple Chocolate Blended Ice C', 254, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1073, 8, 'Rage x Keventers - Hazelnut Co', 224, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1074, 8, 'Caramel Cold Coffee', 224, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1075, 8, 'Cinnamon Cold Coffee', 224, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1076, 8, 'Classic Cold Coffee', 199, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1077, 8, 'Coconut Ice Cream [100 ml]', 92, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1078, 8, 'Vegan Dark Chocolate Ice Cream', 92, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1079, 8, 'Vegan Strawberry Ice Cream [10', 92, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1080, 8, 'Tutti Frutti Ice Cream [100 ml', 75, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1081, 8, 'Cookies & Cream Ice Cream [100', 84, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1082, 8, 'Tiramisu Ice Cream [100 ml]', 92, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1083, 8, 'Chikoo Ice Cream [100 ml]', 75, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1084, 8, 'Belgian Chocolate Ice Cream [1', 84, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1085, 8, 'Blueberry Cheesecake Ice Cream', 92, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1086, 8, 'Original Vanilla Ice Cream [10', 84, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1087, 8, 'Triple Chocolate Ice cream [10', 84, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1088, 8, 'Alphonso Mango Ice Cream [100 ', 84, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1089, 8, 'Mocha Almond Fudge Brownie Ice', 92, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1090, 8, 'Coconut Ice Cream [450 ml]', 313, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1091, 8, 'Tutti Frutti Ice Cream [450 ml', 253, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1092, 8, 'Vegan Strawberry Ice Cream [45', 296, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1093, 8, 'Cookies & Cream Ice Cream [450', 279, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1094, 8, 'Chikoo Ice Cream [450 ml]', 270, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1095, 8, 'Original Vanilla Ice Cream [45', 279, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1096, 8, 'Alphonso Mango Ice Cream [450 ', 279, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1097, 8, 'Exotic Strawberry Ice Cream [4', 296, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1098, 8, 'Paan Gulkand Sundae', 249, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1099, 8, 'Rose Falooda Sundae', 249, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1100, 8, 'Guilty Pleasure Sundae', 259, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1101, 8, 'Dark Conspiracy Sundae', 259, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1102, 8, 'Unicorn Candy Sundae', 249, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1103, 8, 'After Dark Fantasy Sundae', 259, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1104, 8, 'Crinkle Fries - Classic', 99, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1105, 8, 'Crinkle Fries - Peri Peri', 109, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1106, 8, 'Opera Chips Piri Piri', 89, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1107, 8, 'Makino Corn Chips Cream \'n\' On', 45, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1108, 8, 'Makino Corn Twist Pizza', 45, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1109, 8, 'Hot Chocolate Classic', 159, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1110, 8, 'Hot Chocolate Tiramisu', 189, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1111, 8, 'Hot Chocolate Midnight', 189, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1112, 8, 'Christmas Hot Chocolate', 189, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1118, 7, 'Chicken Ghee Roast Momos [7 Pi', 180, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1119, 7, 'Chicken Steamed Momos [7 Piece', 140, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1120, 7, 'Chicken Crispy Momos [7 Pieces', 200, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1121, 7, 'Chicken Peri Peri Momos [7 Pie', 180, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1122, 7, 'Chicken Malai Momos [7 Pieces]', 180, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1123, 7, 'Veg Ghee Roast Momos [8 Pieces', 160, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1124, 7, 'Veg Steamed Momos [8 Pieces]', 120, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1125, 7, 'Veg Fried Momos [8 Pieces]', 140, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1126, 7, 'Veg Chilli Momos [8 Pieces]', 160, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1127, 7, 'Veg Peri Peri Momos [8 Pieces]', 160, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1128, 7, 'Veg Butter Garlic Momos [8 Pie', 160, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1129, 7, 'Veg Ghee Roast Momos [8 Pieces', 160, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1130, 7, 'Veg Malai Momos [8 Pieces]', 160, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1131, 7, 'Chicken Steamed Momos [7 Piece', 140, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1132, 7, 'Chicken Fried Momos [7 Pieces]', 160, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1133, 7, 'Chicken Chilli Momos [7 Pieces', 180, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1134, 7, 'Chicken Peri Peri Momos [7 Pie', 180, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1135, 7, 'Chicken Butter Garlic Momos [7', 180, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1136, 7, 'Chicken Ghee Roast Momos [7 Pi', 180, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1137, 7, 'Chicken Malai Momos [7 Pieces]', 180, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1138, 7, 'Chicken Crispy Momos [7 Pieces', 200, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1149, 5, 'Veg Grilled Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1150, 5, 'Chicken Grilled Sandwich', 143, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1151, 5, 'Dharwad Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1152, 5, 'Oreo Pastry', 132, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1153, 5, 'Chicken Sandwich', 121, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1154, 5, 'Motichur Laddo [100Grm]', 57, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1155, 5, 'Cheese Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1156, 5, 'Veg Club Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1157, 5, 'Chocolate Brownie[2Pcs]', 110, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1158, 5, 'Muskmelon Juice', 105, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1159, 5, 'Watermelon Juice', 105, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1160, 5, 'Kesar Kaju Katli[ 100Grm]', 97, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1161, 5, 'Donut [3Pcs]', 88, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1162, 5, 'Gulab Jamum [4Pcs]', 88, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1163, 5, 'Ghee Mysour Pak [100grm]', 77, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1164, 5, 'Angoor Rabdi [100Grm]', 68, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1165, 5, 'Sweet Lassi', 66, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1166, 5, 'Milk Cake [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1167, 5, 'Coconut Peda [100Grm]', 59, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1168, 5, 'Moongdal Halwa [100Grm]', 57, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1169, 5, 'Fresh Lime Water', 39, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1170, 5, 'Veg Sandwich', 88, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1171, 5, 'Cheese Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1172, 5, 'Veg Club Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1173, 5, 'Veg Grilled Sandwich', 110, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1174, 5, 'Chicken Sandwich', 121, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1175, 5, 'Chicken Grilled Sandwich', 143, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1176, 5, 'Chicken Club Sandwich', 143, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1177, 5, 'Fresh Fruit Juice', 105, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1178, 5, 'Fresh Lime Water', 39, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1179, 5, 'Cold Coffee', 121, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1180, 5, 'Peach Iced Tea', 77, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1181, 5, 'Lemon Iced Tea', 77, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1182, 5, 'Mineral Water', 33, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1183, 5, 'Salted Lassi', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1184, 5, 'Sweet Lassi', 66, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1185, 5, 'Guava Mary', 154, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1186, 5, 'Pineapple Paradise', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1187, 5, 'Apple Pie Mocktail', 154, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1188, 5, 'Express Martini', 154, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1189, 5, 'Dune Runner', 154, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1190, 5, 'Frozen Feast', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1191, 5, 'Blue Moon', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1192, 5, 'The Coladas', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1193, 5, 'Pineapple Juice', 105, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1194, 5, 'Watermelon Juice', 105, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1195, 5, 'Papaya Juice', 105, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1196, 5, 'Muskmelon Juice', 105, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1197, 5, 'Chikoo Milkshake', 143, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1198, 5, 'Chocolate Milkshake', 143, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1199, 5, 'Vanilla Milkshake', 143, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1200, 5, 'Rose Milkshake', 143, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1201, 5, 'Apple Milkshake', 187, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1202, 5, 'Gulkand Laddo [100Grm]', 88, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1203, 5, 'Rawa Laddo[ 100Grm]', 68, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1204, 5, 'Besan Laddo [100Grm]', 77, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1205, 5, 'Mumbai Ice Halwa Mix[ 500Grm]', 638, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1206, 5, 'Special Mysour Pak [100grm]', 59, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1207, 5, 'Ghee Mysour Pak [100grm]', 77, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1208, 5, 'Motichur Laddo [100Grm]', 57, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1209, 5, 'Dharwad Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1210, 5, 'Amrith Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1211, 5, 'Coconut Peda [100Grm]', 59, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1212, 5, 'Kalakand Barfi [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1213, 5, 'Anjeer Malai Barfi [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1214, 5, 'Mango Barfi [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1215, 5, 'Milk Cake [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1216, 5, 'Malai Sandwich [4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1217, 5, 'Rasgulla [4Pcs]', 110, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1218, 5, 'Gulab Jamum [4Pcs]', 88, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1219, 5, 'Chikku Halwa 100Grm', 72, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1220, 5, 'Rasm Malai [4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1221, 5, 'Mango Malai Sandwich[ 4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1222, 5, 'Vanilla Malai Sandwich [4pcs]', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1223, 5, 'Malai Chamcham[4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1224, 5, 'Ras Khadam [4Pcs]', 154, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1225, 5, 'Angoor Rabdi [100Grm]', 68, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1226, 5, 'Moongdal Halwa [100Grm]', 57, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1227, 5, 'Oreo Pastry [2Pcs]', 132, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1228, 5, 'Pastry [2Pcs]', 120, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1229, 5, 'Chocolate Brownie[2Pcs]', 110, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1230, 5, 'Oreo Delight Cake [1/2kg]', 440, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1231, 5, 'Black Foreast Cake [1/2kg]', 418, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1232, 5, 'White Foreast Cake [1/2kg]', 418, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1233, 5, 'Swiss Chocolate Cake [1/2kg]', 418, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1234, 5, 'Dark Chocolate Cake [1/2kg]', 418, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1235, 5, 'Hand Made Chocolate [100grm]', 110, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1236, 5, 'Carmeal Custurd [1pcs]', 61, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1237, 5, 'Oreo Pastry', 132, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1238, 5, 'Pastry', 110, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1239, 5, 'Chocolate Brownie', 110, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1240, 5, 'Oreo Delight Cake', 440, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1241, 5, 'Newyork Truffle Cake', 418, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1242, 5, 'Black Forest Cake', 418, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1243, 5, 'White Forest Cake', 418, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1244, 5, 'Swiss Chocolate Cake', 418, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1245, 5, 'Dark Chocolate Cake', 418, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1246, 5, 'Handmade Chocolate', 110, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1247, 5, 'Caramel Custurd', 61, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
INSERT INTO `item` (`item_id`, `hotel_id`, `item_name`, `item_price`, `item_rating`, `item_img`) VALUES
(1248, 5, 'Strawberry Kaju Katli [100grm]', 97, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1249, 5, 'Kaju Katli [100Grm ]', 92, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1250, 5, 'Dry Fruit Mix Sweets[ 100Grm]', 145, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1251, 5, 'Fancy Dryfruit Sweets Box(500g', 880, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1252, 5, 'Milk Sweets Mix Box(500grm)', 418, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1253, 5, 'Kesar Kaju Katli[ 100Grm]', 97, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1254, 5, 'Dharwad Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1255, 5, 'Amrith Peda [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1256, 5, 'Coconut Peda [100Grm]', 59, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1257, 5, 'Kalakand Barfi [100grm]', 66, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1258, 5, 'Anjeer Malai Barfi [100grm]', 66, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1259, 5, 'Mango Barfi [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1260, 5, 'Milk Cake [100Grm]', 66, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1261, 5, 'Donut [3Pcs]', 88, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1262, 5, 'Moong Dal Kachuri [250grm]', 132, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1263, 5, 'Special Bhakarwadi [200grm]', 77, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1307, 11, 'Veg Tawa Masala', 270, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1308, 11, 'Veg Chilli Milli', 270, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1309, 11, 'Veg Hariyali', 270, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1310, 11, 'Veg Rangila', 300, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1311, 11, 'Veg Kofta', 250, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1312, 11, 'Sai Tudar Special Veg', 325, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1313, 11, 'Paneer Lasooni', 270, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1314, 11, 'Paneer Chatpata', 270, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1315, 11, 'Paneer Kofta', 250, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1316, 11, 'Paneer Sfuffed Masala', 270, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1317, 11, 'Paneer Koliwada', 270, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1318, 11, 'Paneer Lajawab', 270, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1319, 11, 'Mushroom Matar', 200, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1320, 11, 'Chicken Chapata', 290, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1321, 11, 'Chicken Rangila', 350, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1322, 11, 'Chicken Lajawab', 290, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1323, 11, 'Chicken Salami', 290, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1324, 11, 'Chicken Junglee', 290, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1325, 11, 'Chicken Anguli', 290, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1326, 11, 'Chicken Maharaja', 290, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1327, 11, 'Chicken Patiala', 280, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1328, 11, 'Cream of Veg Soup', 130, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1329, 11, 'Cream of Tomato Soup', 130, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1330, 11, 'Ceram of Mushroom Soup', 130, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1331, 11, 'Veg Manchow Soup', 130, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1332, 11, 'Veg Noodles Soup', 130, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1333, 11, 'Veg Clear Soup', 120, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1334, 11, 'Veg Lemon Coriander Soup', 130, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1335, 11, 'Sweet Corn Veg Soup', 130, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1336, 11, 'Mushroom Soup', 135, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1337, 11, 'Chicken Sweet Corn Soup', 135, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1338, 11, 'Chicken Manchow Soup', 135, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1339, 11, 'Chicken Clear Soup', 130, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1340, 11, 'Chicken Lemon Coriander Soup', 130, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1341, 11, 'Chicken Hot and Sour Soup', 135, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1342, 11, 'Chicken Tikka', 100, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1343, 11, 'Baby Corn Pepper Fry', 165, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1344, 11, 'Baby Corn Ghee Roast', 200, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1345, 11, 'Paneer Pepper Fry', 190, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1346, 11, 'Paneer Ghee Roast', 200, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1347, 11, 'Gobi Urval', 150, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1348, 11, 'Paneer Urval', 170, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1349, 11, 'Mushroom Urval', 190, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1350, 11, 'Paneer Manchurian', 190, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1351, 11, 'Paneer Chilli', 180, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1352, 11, 'Paneer 65', 170, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1353, 11, 'Mushroom Manchurian', 160, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1354, 11, 'Mushroom Chilli', 160, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1355, 11, 'Mushroom 65', 160, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1356, 11, 'Baby Corn Manchurian', 160, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1357, 11, 'Baby Corn Chilli', 160, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1358, 11, 'Gobi Manchurian', 120, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1359, 11, 'Gobi Chilli', 120, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1360, 11, 'Gobi 65', 120, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1361, 11, 'Egg Pepper Fry', 125, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1362, 11, 'Egg Chilli', 125, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1363, 11, 'Egg Manchurian', 120, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1364, 11, 'Egg Roast', 110, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1365, 11, 'Chicken Chilli Dry', 210, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1366, 11, 'Chicken Manchurian', 210, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1367, 11, 'Chicken 65', 225, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1368, 11, 'Chicken Crispy', 250, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1369, 11, 'Chicken Hong Kong', 240, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1370, 11, 'Chicken Ginger Dry', 230, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1371, 11, 'Chicken Garlic Dry', 230, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1372, 11, 'Chicken Schezwan Dry', 210, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1373, 11, 'Lemon Chicken', 210, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1374, 11, 'Chicken Urval', 250, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1375, 11, 'Chicken Ghee Roast', 250, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1376, 11, 'Chicken Pepper Fry', 230, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1377, 11, 'Chicken Garlic Kabab', 250, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1378, 11, 'Dal Fry', 130, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1379, 11, 'Dal Tadka', 150, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1380, 11, 'Butter Dal Fry', 165, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1381, 11, 'Dal Kolhapuri', 165, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1382, 11, 'Green Peas Masala', 150, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1383, 11, 'Paneer Masala', 190, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1384, 11, 'Paneer Matar', 190, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1385, 11, 'Paneer Butter Masala', 200, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1386, 11, 'Paneer Kadai', 210, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1387, 11, 'Paneer Hyderabadi', 205, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1388, 11, 'Paneer Tikka Masala', 210, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1389, 11, 'Paneer Handi', 200, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1390, 11, 'Veg Kurma', 150, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1391, 11, 'Baby Corn Masala', 150, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1392, 11, 'Baby Corn Kadai', 175, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1393, 11, 'Baby Corn Handi', 175, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1394, 11, 'Mushroom Masala', 175, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1395, 11, 'Mushroom Kadai', 205, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1396, 11, 'Mushroom Handi', 205, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1397, 11, 'Mix Veg Curry', 150, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1398, 11, 'Veg Kolhapuri', 165, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1399, 11, 'Veg Kadai', 165, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1400, 11, 'Veg Handi', 165, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1401, 11, 'Veg Hyderabadi', 165, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1402, 11, 'Kaju Masala', 250, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1403, 11, 'Kaju Paneer', 260, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1404, 11, 'Chicken Masala', 185, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1405, 11, 'Chicken Kadai', 220, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1406, 11, 'Chicken Handi', 220, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1407, 11, 'Chicken Hyderabadi', 220, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1408, 11, 'Chicken Kolhapuri', 210, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1409, 11, 'Chicken Mughlai', 220, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1410, 11, 'Chicken Pepper Masala', 215, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1411, 11, 'Chicken Tikka Masala', 300, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1412, 11, 'Butter Chicken', 300, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1413, 11, 'Chicken Ginger', 220, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1414, 11, 'Chicken Garlic', 220, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1415, 11, 'Egg Pulimunchi', 160, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1416, 11, 'Chicken Sukka', 190, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1417, 11, 'Chicken Pulimunchi', 190, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1418, 11, 'Chapati', 20, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1419, 11, 'Roti', 25, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1420, 11, 'Butter Roti', 30, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1421, 11, 'Naan', 30, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1422, 11, 'Butter Naan', 50, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1423, 11, 'Tandoori Parotta', 35, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1424, 11, 'Tandoori Butter Parotta', 50, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1425, 11, 'Kulcha', 45, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1426, 11, 'Butter Kulcha', 50, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1427, 11, 'Butter Garlic Naan', 55, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1428, 11, 'Cheese Garlic Naan', 60, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1429, 11, 'Kuttu Parotta', 160, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1430, 11, 'Curd Rice', 100, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1431, 11, 'Jeera Rice', 100, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1432, 11, 'Steamed Rice', 100, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1433, 11, 'Veg Pulav', 100, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1434, 11, 'Green Peas Pulav', 110, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1435, 11, 'Paneer Pulav', 150, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1436, 11, 'Kushka Rice', 125, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1437, 11, 'Veg Biryani', 150, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1438, 11, 'Paneer Biryani', 210, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1439, 11, 'Mushroom Biryani', 210, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1440, 11, 'Tandoor Biryani', 210, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1441, 11, 'Tikka Biryani', 230, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1442, 11, 'Ambur Chicken Biryani', 210, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1443, 11, 'Egg Biryani', 150, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1444, 11, 'Chicken Biryani', 200, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1445, 11, 'Chicken Hyderabadi Biryani', 200, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1446, 11, 'Egg Fried Rice', 150, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1447, 11, 'Egg Schezwan Rice', 160, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1448, 11, 'Chicken Fried Rice', 160, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1449, 11, 'Chicken Schezwan Fried Rice', 180, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1450, 11, 'Chicken Manchurian Fried Rice', 200, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1451, 11, 'Chicken Triple Schezwan Fried ', 200, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1452, 11, 'Chicken Topping Fried Rice', 200, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1453, 11, 'Chicken Singapore Fried Rice', 160, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1454, 11, 'Chicken Hong Kong Fried Rice', 160, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1455, 11, 'Chicken Combination Fried Rice', 160, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1456, 11, 'Egg Noodles', 150, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1457, 11, 'Egg Schezwan Noodles', 160, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1458, 11, 'Chicken Noodles', 160, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1459, 11, 'Chicken Schezwan Noodles', 170, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1460, 11, 'Chicken Manchurian Noodles', 180, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1461, 11, 'Chicken Triple Noodles', 190, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1462, 11, 'Chicken Topping Noodles', 190, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1463, 11, 'Veg Fried Rice', 150, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1464, 11, 'Veg Schezwan Fried Rice', 160, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1465, 11, 'Veg Manchurian Fried Rice', 180, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1466, 11, 'Veg Triple Schezwan Fried Rice', 180, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1467, 11, 'Veg Topping Fried Rice', 180, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1468, 11, 'Paneer Fried Rice', 170, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1469, 11, 'Paneer Schezwan Fried Rice', 180, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1470, 11, 'Mushroom Fried Rice', 170, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1471, 11, 'Mushroom Schezwan Fried Rice', 180, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1472, 11, 'Veg Singapore Fried Rice', 160, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1473, 11, 'Veg Hong Kong Fried Rice', 160, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1474, 11, 'Veg Combination Fried Rice', 160, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1475, 11, 'Veg Noodles', 150, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1476, 11, 'Veg Schezwan Noodles', 160, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1477, 11, 'Veg Manchurian Noodles', 180, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1478, 11, 'Veg Triple Schezwan Noodles', 180, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1479, 11, 'Paneer Noodles', 170, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1480, 11, 'Paneer Schezwan Noodles', 180, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1481, 11, 'Mushroom Noodles', 170, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1482, 11, 'Mushroom Schezwan Noodles', 180, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1483, 11, 'Veg Singapore Noodles', 160, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1484, 11, 'Veg Hong Kong Noodles', 160, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1485, 11, 'Veg Roll', 80, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1486, 11, 'Paneer Roll', 110, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1487, 11, 'Veg Pakoda', 100, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1488, 11, 'Paneer Pakoda', 165, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1489, 11, 'Plain Omelette', 60, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1490, 11, 'Masala Omelette', 63, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1491, 11, 'Cheese Omelette', 80, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1492, 11, 'Boiled Egg', 25, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1493, 11, 'Egg Pakoda', 100, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1494, 11, 'Chicken Spring Roll', 150, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1495, 11, 'Green Salad', 100, NULL, 'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
(1496, 11, 'Onion Salad', 100, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1497, 11, 'Fruit Salad', 90, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1498, 11, 'Fruit Salad Ice Cream', 130, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1499, 11, 'Royal Falooda', 140, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1500, 11, 'Gadbad', 170, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1501, 11, 'Single Sundae', 70, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1502, 11, 'Double Sundae', 140, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1503, 11, 'Triple Sundae', 170, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1504, 11, 'Banana Split', 170, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1505, 11, 'Sweet Lassi', 60, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1506, 11, 'Salt Lassi', 60, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1507, 11, 'Mango Lassi', 60, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1508, 11, 'Chocolate Lassi', 60, NULL, 'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
(1509, 11, 'Strawberry Lassi', 60, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1510, 11, 'Lime Soda', 45, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1511, 11, 'Lima Juice', 40, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1512, 11, 'Orange Juice', 60, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1513, 11, 'Grape Juice', 60, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1514, 11, 'Watermelon Juice', 60, NULL, 'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'),
(1515, 11, 'Pineapple Juice', 60, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1516, 11, 'Mosambi Juice', 60, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1517, 11, 'Apple Juice', 70, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1518, 11, 'Anar Juice', 70, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1519, 11, 'Banana Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1520, 11, 'Chikku Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1521, 11, 'Apple Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1522, 11, 'Strawberry Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1523, 11, 'Mango Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80'),
(1524, 11, 'Vanilla Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1525, 11, 'Chocolate Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(1526, 11, 'Anar Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
(1527, 11, 'Oreo Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80'),
(1528, 11, 'Rose Milkshake', 100, NULL, 'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');

-- --------------------------------------------------------

--
-- Table structure for table `item_suggestion`
--

CREATE TABLE `item_suggestion` (
  `s_id` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `drop_id` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `u_id`, `drop_id`, `likes`) VALUES
(4, 1, 36, 0),
(5, 2, 36, 1),
(6, 2, 35, 0),
(7, 1, 35, 0);

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
(6, 'mangaluru');

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
(48, 2, 1, 'very good', '2023-04-22 11:48:43'),
(49, 2, 1, 'not nice', '2023-04-26 17:50:09'),
(50, 2, 493, 'nice food', '2023-04-26 19:07:05'),
(51, 1, 15, 'jk', '2023-05-04 09:57:30');

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
  `desc` varchar(150) DEFAULT NULL,
  `contact` varchar(15) NOT NULL
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
(2, 'richu', 'user', 'ebinwaynad@gmail.com', '$2y$10$uTvZAPkwl7TJ4gyiDkmWx.lsh0pDDFVqUMMwDKomOrWNGw/eomuc.', 1, NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bot`
--
ALTER TABLE `bot`
  ADD PRIMARY KEY (`qid`);

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
-- Indexes for table `item_suggestion`
--
ALTER TABLE `item_suggestion`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`);

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
-- AUTO_INCREMENT for table `bot`
--
ALTER TABLE `bot`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `drops`
--
ALTER TABLE `drops`
  MODIFY `drop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1566;

--
-- AUTO_INCREMENT for table `item_suggestion`
--
ALTER TABLE `item_suggestion`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `suggestion`
--
ALTER TABLE `suggestion`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
