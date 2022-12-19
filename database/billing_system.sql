-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2022 at 06:41 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Database: `billing_system`
--
-- --------------------------------------------------------
--
-- Table structure for table `invoices`
--
CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `product` varchar(255) NOT NULL,
  `quantity` int(50) NOT NULL,
  `price` double(10, 2) NOT NULL,
  `total_cost` double(10, 2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `paid_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `invoices`
--
-- --------------------------------------------------------
--
-- Table structure for table `orders`
--
CREATE TABLE `orders` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `customer_id` int(50) NOT NULL,
  `product` varchar(255) NOT NULL,
  `price` double(10, 2) NOT NULL,
  `quantity` int(20) NOT NULL,
  `total_cost` double(10, 2) NOT NULL,
  `status` varchar(50) NOT NULL COMMENT 'delivered;shipped;cancelled;pending;',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ac_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `orders`
--
-- --------------------------------------------------------
--
-- Table structure for table `payments`
--
CREATE TABLE `payments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `invoice_id` int(50) NOT NULL,
  `account` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `payments`
--
-- --------------------------------------------------------
--
-- Table structure for table `products`
--
CREATE TABLE `products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(10, 2) NOT NULL,
  `quantity` int(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `products`
--
INSERT INTO `products` (
    `id`,
    `image`,
    `name`,
    `price`,
    `quantity`,
    `status`
  )
VALUES (
    1,
    'Antibiotics_Chickens_1500x900.jpg',
    'Antibiotics Chickens',
    15000.00,
    0,
    'Latest'
  ),
  (
    2,
    '81625405-hintergrund-von-getrockneten-maissamen-landwirtschaftliches-produkt.jpg',
    'Hintergrund Maissamen',
    10000.00,
    NULL,
    NULL
  ),
  (
    3,
    'BabyCarobTrees.jpg',
    'Carob Trees',
    7000.00,
    NULL,
    'Latest'
  ),
  (
    4,
    'cassava_stakes.jpg',
    'Cassava Stakes',
    6000.00,
    NULL,
    NULL
  ),
  (
    5,
    'sweet-potato-marguerite-500.jpg',
    'Sweet Potato Marguerite',
    4000.00,
    NULL,
    'Latest'
  ),
  (6, 'images.jpg', 'Cow', 75000.00, NULL, NULL);
-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(55) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `location` varchar(50) NOT NULL,
  `userType` int(5) NOT NULL COMMENT '0 = administrator; 1 = customer;',
  `password` varchar(255) NOT NULL,
  `signindate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Dumping data for table `users`
--
INSERT INTO `users` (
    `id`,
    `firstname`,
    `surname`,
    `email`,
    `phone`,
    `location`,
    `userType`,
    `password`,
    `signindate`
  )
VALUES (
    2,
    'Wongani Harry',
    'Mkandawire',
    'wonganiharry@gmail.com',
    '0992166825',
    'Area 25',
    0,
    '8fb94b2d0886944db4e446bd535cf767',
    '2022-04-25 00:52:02'
  );
--
-- Indexes for dumped tables
--
--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `products`
--
ALTER TABLE `products`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `users`
--
ALTER TABLE `users`
ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(25) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;