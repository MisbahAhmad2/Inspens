-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2025 at 01:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inspens_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `email`, `password_hash`, `created_at`) VALUES
(3, 'misbah', 'misbah12@example.com', '$2y$10$6ZOO2Tl5GGdjtwekiO8N3Oliuda0sqzePXkSo2TO/CMr63sohqFni', '2025-06-21 10:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `type`, `user_id`) VALUES
(1, 'Salary', 'income', NULL),
(2, 'Bonus', 'income', NULL),
(3, 'Freelance', 'income', NULL),
(4, 'Food', 'expense', NULL),
(5, 'Transport', 'expense', NULL),
(6, 'Entertainment', 'expense', NULL),
(7, 'Utilities', 'expense', NULL),
(8, 'Rent', 'expense', NULL),
(9, 'Salary', 'income', NULL),
(10, 'Freelance', 'income', NULL),
(11, 'Investments', 'income', NULL),
(12, 'Business', 'income', NULL),
(13, 'Gift', 'income', NULL),
(14, 'Other Income', 'income', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`category_id`, `name`, `user_id`) VALUES
(1, 'Food & Dining', NULL),
(2, 'Transportation', NULL),
(3, 'Housing', NULL),
(4, 'Utilities', NULL),
(5, 'Entertainment', NULL),
(6, 'Shopping', NULL),
(7, 'Health & Fitness', NULL),
(8, 'Education', NULL),
(9, 'Travel', NULL),
(10, 'Other', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `faq_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `category` enum('getting_started','account_management','budgeting') NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`faq_id`, `question`, `answer`, `category`, `display_order`, `created_at`) VALUES
(1, 'How do I add my first transaction?', 'To add your first transaction...', 'getting_started', 0, '2025-06-19 15:18:15'),
(2, 'Can I import data from other finance apps?', 'Currently, we support CSV imports...', 'getting_started', 0, '2025-06-19 15:18:15'),
(3, 'How do I change my password?', 'Go to your Profile page...', 'account_management', 0, '2025-06-19 15:18:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `token_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `status` enum('open','in_progress','resolved') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `category` varchar(50) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `user_id`, `amount`, `type`, `category`, `payment_method`, `description`, `transaction_date`, `created_at`) VALUES
(1, 4, 332132.00, 'income', 'Salary', NULL, '', '2025-06-19', '2025-06-19 20:50:42'),
(2, 4, 20000.00, 'expense', 'Housing', 'Bank Transfer', '', '2025-06-19', '2025-06-19 20:58:56'),
(3, 4, 20.00, 'income', 'Bonus', NULL, '', '2025-06-19', '2025-06-19 21:01:47'),
(4, 4, 4000.00, 'expense', 'Entertainment', 'Credit Card', '', '2025-06-19', '2025-06-19 21:32:40'),
(5, 5, 20000.00, 'income', 'Bonus', NULL, '', '2025-06-19', '2025-06-19 21:44:31'),
(6, 7, 2000.00, 'income', 'Freelance', NULL, '', '2025-06-20', '2025-06-20 10:05:39'),
(7, 7, 399999.00, 'income', 'Freelance', NULL, '', '2025-06-20', '2025-06-20 10:06:09'),
(8, 7, 3000.00, 'income', 'Freelance', NULL, '', '2025-06-20', '2025-06-20 10:07:22'),
(9, 7, 4655.00, 'income', 'Salary', NULL, '', '2025-06-20', '2025-06-20 10:11:00'),
(10, 8, 34566.00, 'income', 'Freelance', NULL, '', '2025-06-20', '2025-06-20 10:17:10'),
(11, 9, 20000.00, 'income', 'Bonus', NULL, '', '2025-06-20', '2025-06-20 12:40:36'),
(12, 11, 4543.00, 'income', 'Salary', NULL, '', '2025-06-21', '2025-06-21 09:28:19'),
(13, 11, 4354.00, 'income', 'Freelance', NULL, '', '2025-06-21', '2025-06-21 09:31:55'),
(14, 11, 4325.00, 'income', 'Other Income', NULL, '', '2025-06-21', '2025-06-21 09:32:44'),
(15, 11, 433.00, 'income', 'Gift', NULL, '', '2025-06-21', '2025-06-21 09:42:43'),
(16, 11, 5000.00, 'expense', 'Food & Dining', 'UPI', '', '2025-06-21', '2025-06-21 10:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `first_name`, `last_name`, `phone`, `date_of_birth`, `address`, `avatar_url`, `email`, `password_hash`, `created_at`, `is_admin`) VALUES
(2, 'misbah ahmad', NULL, NULL, NULL, NULL, NULL, NULL, 'misbahahmad@inspens.com', '$2y$10$THNOZQ6A3br5eCZZLvo79OF6WR4pe4K7VcKGpTyYc/LDdhpwgqis2', '2025-06-19 17:20:12', 0),
(3, 'fariha sajid', 'FARIHA', 'SAJID', '+92 1234567890', '2025-06-20', 'DVFF', NULL, 'farihasajid@inspens.com', '$2y$10$v.pRwW1uF4RudtKwx6B.GO6EFCQMlOlZqxw9ACrmFp28P5Ulg17sG', '2025-06-19 18:50:04', 0),
(4, 'arisha nazir', 'arisha', 'nazir', '', '0000-00-00', '', NULL, 'arishanazir@inspens.com', '$2y$10$kIm8GgmaSBsZUx9wSV5NAu69g9zH8755TztLN.3uI.r4Ikc0cMLBG', '2025-06-19 20:05:15', 0),
(5, 'maheen sajad', 'maheen', 'sajid', '', '0000-00-00', '', NULL, 'maheensajad@inspens.com', '$2y$10$Ib6.hT2Tocz0PVXdQG0fY.h4czRdIFayjhk3jsTR3SGpQFvD8bZYO', '2025-06-19 21:43:35', 0),
(7, 'iman', 'iman', 'fatima', '', '0000-00-00', '', NULL, 'iman@inspens.com', '$2y$10$.EFdgozfjScUyNRuFwivS.6sdtY7ZkVtjNnYO/W7PLuzUbfkq4d4i', '2025-06-20 10:02:05', 0),
(8, 'bisma nazir', NULL, NULL, NULL, NULL, NULL, NULL, 'bismanazir@inspens.com', '$2y$10$9PaPmO81oZP0LwgF7kd6YuvjiVqeNDiN50da9kqH.odGKnKm/0dPO', '2025-06-20 10:16:59', 0),
(9, 'maryam', 'maryam', 'batool', '+92 1234567495', '2025-01-01', 'umtt', NULL, 'maryam@inspens.com', '$2y$10$hJhO1Z1qtMYpEhT0J11dSePB2MaPhz8q0vMn7MFyNd1VSP/1xSMIW', '2025-06-20 12:38:23', 0),
(11, 'fiza batool', 'fiza', 'alim', '', '2025-06-02', '', NULL, 'fiza@inspens.com', '$2y$10$TYr.P9p1txm9.b19mP6.OOa/f1o0Y17RkHba0jhWwv7kVMnf8wula', '2025-06-21 09:06:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` text NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout_time` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
