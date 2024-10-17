-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 17, 2024 at 07:11 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_img`
--

CREATE TABLE `bank_img` (
  `bill_id` int(255) NOT NULL,
  `bill_name` varchar(255) NOT NULL,
  `bill_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_img`
--

INSERT INTO `bank_img` (`bill_id`, `bill_name`, `bill_image`) VALUES
(1, 'x', 'cap_inde.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(10, 2, 'test', 'test@gmail.com', '1111111', 'testlog frome antifailxxxx'),
(11, 2, 'kuy', 'aa@gmail.com', '123123', 'fk store'),
(12, 4, 'aaa', 'test@gmail.com', '123123', 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(10, 2, 'test', '123456789', 'test@gmail.com', 'cash on delivery', 'flat no. 111, 111, Chiangrai, Thailand - 5555', ', travis_stussy (1) ', 9999, '09-Jan-2024', 'completed'),
(11, 2, 'test', '123456789', 'testlog@gmail.com', 'banking', 'flat no. 222, 222, Chiangrai, Thailand - 33333', ', travis_stussy (1) ', 9999, '09-Jan-2024', 'pending'),
(12, 2, 'test', '213123123', 'admin@gmail.com', 'banking', 'flat no. 1111, 111, Chiangrai, Thailand - 3123312', ', ESSENTIALS VELVET LOGO HOODIE - LIGHT OATMEAL (1) ', 9990, '10-Jan-2024', 'pending'),
(13, 2, 'log', '123123213', 'testlog@gmail.com', 'banking', 'flat no. 222, 333, Chiangrai, Thailand - 4124124', ', Palm Angels Kids logo-print Cotton Blend Track Jacket (1) ', 8545, '10-Jan-2024', 'pending'),
(14, 2, 'testlog', '32123', 'Antif9ail@gmail.com', 'banking', 'flat no. 123, 123, 4, Thailand - 123123', ', Palm Angels Kids logo-print Cotton Blend Track Jacket (1) ', 8545, '10-Jan-2024', 'completed'),
(15, 4, 'log', '12312323123', 'testlog@gmail.com', 'banking', 'flat no. 111, 3123, Chiangrai, Thailand - 3123213', ', Vlone T-Shirt (1) ', 5500, '10-Jan-2024', 'completed'),
(16, 1, 'k', '1111111111', 'k@gmail.com', 'banking', 'flat no. 111, k, k, none - 11111', ', Stussy T-Shirt Black Vintage Dice (1) ', 3500, '16-Oct-2024', 'pending'),
(17, 1, 'z', '111111', 'x@gmail.com', 'cash on delivery', 'flat no. 111, 111, x, x - 1234', ', Stussy T-Shirt Black Vintage Dice (1) ', 3500, '16-Oct-2024', 'completed'),
(18, 1, 'testlog', '1111111', 'log@gmail.com', 'cash on delivery', 'flat no. 11, 11, x, x - 1234', ', Trasher T-Shirt (1) , Vlone T-Shirt (2) ', 12800, '16-Oct-2024', 'pending'),
(19, 2, 'x', '1', 'x@gmail.com', 'banking', 'flat no. 1, 1, x, x1 - 123', ', Vlone T-Shirt (1) , Supreme Box Logo hoodie (1) ', 30500, '16-Oct-2024', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`) VALUES
(1, 'Stussy Ball logo', 6500, 'stuss_ab.jpg'),
(2, 'Vlone T-Shirt', 5500, 'vlone.jpg'),
(3, 'Palm Angels logo-print hoodie', 7700, 'palm5.jpg'),
(4, 'Palm Angels Kids logo-print Cotton Blend Track Jacket', 8545, 'palm2.jpg'),
(5, 'ESSENTIALS VELVET LOGO HOODIE - LIGHT OATMEAL', 9990, 'es1.jpg'),
(6, 'Supreme Box Logo hoodie', 25000, 'product_sup.jpg'),
(7, 'A BATHING APE® logo-print Cotton T-shirt', 6799, 'product_bape.jpg'),
(8, 'Nike Airforce 1 Men', 3700, 'product_airf.png'),
(9, 'Nike Air Force 1 Low SP Tiffany And Co', 40000, 'product_tf3.jpeg'),
(10, 'Stussy T-Shirt Black Vintage Dice', 3500, 'stuss_12-removebg-preview.png'),
(12, 'Polo Ralph Lauren half zip', 4600, 'polo_half.jpg'),
(13, 'arc\'teryx', 9400, 'ARCT01243_01.jpg'),
(14, 'Trasher T-Shirt', 1800, 'trasher.jpeg'),
(15, 'Independent Cap', 2400, 'cap_inde.jpg'),
(16, 'Burberry Vintage-Shirt', 12300, 'burberry_shirt.jpg'),
(17, 'Oakley Sleeve-Shirt', 6700, 'oakley_grid.jpg'),
(18, 'Zara jacket', 3700, 'zara-jacket.jpg'),
(19, 'Ferrari Jacket', 7800, 'ferrari-jacket.jpeg'),
(20, 'Lacost cardigan', 18000, 'lacost-cardigan.jpg'),
(22, 'Mizuno baseball jersey', 1899, 'mizuno_jp.jpg'),
(23, 'Billie eillish shirt', 2589, 'billie-shirt.jpg'),
(24, 'Rick Owens Shirts', 12090, 'rick-owens.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(1, 'trinai_admin', 'trinai_admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'test', 'test@gmail.com', '098f6bcd4621d373cade4e832627b4f6', 'user'),
(3, 'champ_worathun', 'champ_wora@gmail.com', '098f6bcd4621d373cade4e832627b4f6', 'admin'),
(4, 'testlog', 'testlog@gmail.com', '098f6bcd4621d373cade4e832627b4f6', 'user'),
(5, 'test', 'test_admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_img`
--
ALTER TABLE `bank_img`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
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
-- AUTO_INCREMENT for table `bank_img`
--
ALTER TABLE `bank_img`
  MODIFY `bill_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
