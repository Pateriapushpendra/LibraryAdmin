-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2020 at 10:28 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_books`
--

CREATE TABLE `tbl_books` (
  `id` int(11) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_auther` varchar(100) NOT NULL,
  `purchased_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `book_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_books`
--

INSERT INTO `tbl_books` (`id`, `book_title`, `book_auther`, `purchased_on`, `book_status`) VALUES
(1, 'Middlemarch', 'George Eliot', '2020-12-21 16:39:50', 1),
(2, 'To the Lighthouse', 'Virginia Woolf', '2020-12-21 16:39:50', 1),
(3, 'Mrs Dalloway', 'Virginia Woolf', '2020-12-21 16:39:51', 1),
(4, 'Great Expectations', 'Charles Dickens', '2020-12-21 16:39:51', 1),
(5, 'Jane Eyre', 'Charlotte Bronte', '2020-12-21 16:39:51', 1),
(6, 'Bleak House', 'Charles Dickens', '2020-12-22 19:31:54', 1),
(7, 'Wuthering Heights', 'Emily Bronte', '2020-12-21 16:39:51', 1),
(8, 'David Copperfield', 'Charles Dickens', '2020-12-21 16:39:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_book_logs`
--

CREATE TABLE `tbl_book_logs` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issued_on` datetime NOT NULL,
  `returned_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `user_type` int(1) NOT NULL DEFAULT 1,
  `user_email` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `name`, `user_type`, `user_email`, `status`) VALUES
(1, 'Pushpendra', 2, 'pateria83@mail.lcl', 1),
(2, 'User1', 1, 'User1@mail.lcl', 1),
(3, 'User2', 1, 'User2@mail.lcl', 1),
(4, 'User3', 1, 'User3@mail.lcl', 1),
(5, 'User4', 1, 'User4@mail.lcl', 1),
(6, 'User5', 1, 'User5@mail.lcl', 1),
(7, 'User6', 1, 'User6@mail.lcl', 1),
(8, 'User7', 1, 'User7@mail.lcl', 1),
(9, 'User8', 1, 'User8@mail.lcl', 1),
(10, 'User9', 1, 'User9@mail.lcl', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_books`
--
ALTER TABLE `tbl_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_book_logs`
--
ALTER TABLE `tbl_book_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkey_book_id` (`book_id`),
  ADD KEY `fkey_user_id` (`user_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_books`
--
ALTER TABLE `tbl_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_book_logs`
--
ALTER TABLE `tbl_book_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_book_logs`
--
ALTER TABLE `tbl_book_logs`
  ADD CONSTRAINT `fkey_book_id` FOREIGN KEY (`book_id`) REFERENCES `tbl_books` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkey_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
