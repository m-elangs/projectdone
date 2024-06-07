-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2024 at 08:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(6, 1, 1, 'Beras', 12000, 1, 'beras.jpg'),
(7, 1, 21, 'Tomat', 15000, 1, 'tomat.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `image`) VALUES
(1, 'Sayuran dan Buah', 'Produk sayuran dan buah-buahan segar', 'buahsayur.png'),
(2, 'Protein Hewani', 'Produk protein hewani seperti daging dan telur', 'proteinhewani.png'),
(3, 'Produk Susu', 'Produk susu seperti susu cair dan keju', 'susu.png'),
(4, 'Minyak dan Lemak', 'Produk minyak dan lemak seperti minyak goreng dan mentega', 'minyaklemak.png'),
(5, 'Kacang-Kacangan', 'Produk kacang-kacangan seperti kacang tanah dan kacang hijau', 'kacangan.png'),
(6, 'Bumbu dan Rempah', 'Produk bumbu dan rempah seperti bawang dan cabai', 'rempah.png'),
(7, 'Bahan Pokok', 'Produk bahan pokok seperti beras dan gula', 'bahanpokok.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'kodko', '312313313', 'babi@gmail.com', 'cash on delivery', 'flat no. ketintang, mesir, iraq, bagdad, Indonesia - 63388', 'Beras (12000 x 1) - ', 12000, '2024-05-30', 'completed'),
(2, 1, 'w', '121122112', 'babi@gmail.com', 'cash on delivery', 'flat no. ketintang, mesir, iraq, bagdad, Indonesia - 63388', 'Gula Pasir (15000 x 1) - Garam (5000 x 1) - ', 20000, '2024-05-30', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_01` varchar(255) DEFAULT NULL,
  `image_02` varchar(255) DEFAULT NULL,
  `image_03` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`, `category_id`) VALUES
(1, 'Bahan Pokok', 'Beras', 'Beras kualitas premium, wangi dan pulen', 12000.00, 'beras.jpg', NULL, NULL, 7),
(2, 'Bahan Pokok', 'Gula Pasir', 'Gula pasir putih kristal, cocok untuk memasak dan minuman', 15000.00, 'gula.jpg', NULL, NULL, 7),
(3, 'Bahan Pokok', 'Garam', 'Garam halus, ideal untuk bumbu masakan', 5000.00, 'garam.jpg', NULL, NULL, 7),
(4, 'Bahan Pokok', 'Tepung Terigu', 'Tepung terigu serbaguna, cocok untuk membuat kue dan roti', 7000.00, 'terigu.jpg', NULL, NULL, 7),
(5, 'Minyak dan Lemak', 'Minyak Goreng', 'Minyak goreng sawit kemasan 1 liter', 12000.00, 'minyak.jpg', NULL, NULL, 4),
(6, 'Minyak dan Lemak', 'Mentega', 'Mentega premium, ideal untuk memasak dan memanggang', 25000.00, 'mentega.jpg', NULL, NULL, 4),
(7, 'Minyak dan Lemak', 'Margarine', 'Margarine serbaguna, cocok untuk memasak dan olesan roti', 15000.00, 'margarine.jpg', NULL, NULL, 4),
(8, 'Protein Hewani', 'Daging Ayam', 'Daging ayam segar potong per kg', 35000.00, 'ayam.jpg', NULL, NULL, 2),
(9, 'Protein Hewani', 'Daging Sapi', 'Daging sapi kualitas premium per kg', 95000.00, 'sapi.jpg', NULL, NULL, 2),
(10, 'Protein Hewani', 'Telur Ayam', 'Telur ayam kampung per butir', 2000.00, 'telur.jpg', NULL, NULL, 2),
(11, 'Produk Susu', 'Susu Cair', 'Susu cair murni 1 liter', 18000.00, 'susu.jpg', NULL, NULL, 3),
(12, 'Produk Susu', 'Keju', 'Keju cheddar 250 gram', 45000.00, 'keju.jpg', NULL, NULL, 3),
(13, 'Bumbu dan Rempah', 'Santan Kelapa', 'Santan kelapa kental kemasan 200 ml', 8000.00, 'santan.jpg', NULL, NULL, 6),
(14, 'Bumbu dan Rempah', 'Kecap Manis', 'Kecap manis botol 600 ml', 12000.00, 'kecap.jpg', NULL, NULL, 6),
(15, 'Bumbu dan Rempah', 'Saus Tomat', 'Saus tomat botol 500 ml', 10000.00, 'toamt.jpg', NULL, NULL, 6),
(16, 'Bumbu dan Rempah', 'Saus Sambal', 'Saus sambal botol 500 ml', 10000.00, 'sambal.jpg', NULL, NULL, 6),
(17, 'Bumbu dan Rempah', 'Bawang Merah', 'Bawang merah segar per kg', 30000.00, 'bawang merah.jpg', NULL, NULL, 6),
(18, 'Bumbu dan Rempah', 'Bawang Putih', 'Bawang putih segar per kg', 40000.00, 'bawang putih.jpg', NULL, NULL, 6),
(19, 'Bumbu dan Rempah', 'Cabe Merah', 'Cabe merah besar per kg', 50000.00, 'cabe merah.jpg', NULL, NULL, 6),
(20, 'Bumbu dan Rempah', 'Cabe Rawit', 'Cabe rawit hijau per kg', 60000.00, 'rawit.jpg', NULL, NULL, 6),
(21, 'Sayuran dan Buah', 'Tomat', 'Tomat merah segar per kg', 15000.00, 'tomat.jpg', NULL, NULL, 1),
(22, 'Sayuran dan Buah', 'Kentang', 'Kentang segar per kg', 12000.00, 'kentang.jpg', NULL, NULL, 1),
(23, 'Sayuran dan Buah', 'Wortel', 'Wortel segar per kg', 18000.00, 'wortel.jpg', NULL, NULL, 1),
(24, 'Kacang-Kacangan', 'Kacang Tanah', 'Kacang tanah kupas per kg', 25000.00, 'kcang tanah.jpg', NULL, NULL, 5),
(25, 'Kacang-Kacangan', 'Kacang Hijau', 'Kacang hijau segar per kg', 30000.00, 'kacang ijo.jpg', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'kodok', 'babi@gmail.com', '601f1889667efaebb33b8c12572835da3f027f78');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
