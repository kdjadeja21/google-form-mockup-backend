-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2021 at 05:45 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `google_form_mockup`
--

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`id`, `name`, `slug`, `deleted`, `created_at`, `updated_at`) VALUES
(7, 'Test form', 'wvbf052vzy', 0, '2021-05-16 16:00:30', '2021-05-16 16:00:30'),
(9, 'test form 2', 'f9rtgy3pwog', 0, '2021-05-17 03:27:48', '2021-05-17 03:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE `form_fields` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_key` varchar(255) NOT NULL,
  `input_type` varchar(64) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_fields`
--

INSERT INTO `form_fields` (`id`, `form_id`, `title`, `field_key`, `input_type`, `required`, `options`, `deleted`) VALUES
(11, 7, 'question 1', 'iy9zsoxukck', 'text', 1, '[]', 0),
(12, 7, 'question 2', 'ybbl0ywjck', 'radioButton', 0, '[\"Option 1\",\"Option 2\"]', 0),
(13, 7, 'question 3', 'bfpemo64wg7', 'checkbox', 1, '[\"Option 1\",\"Option 2\",\"Option 3\"]', 0),
(14, 7, 'question 4 ', '6b8t9zzvyaa', 'dropdown', 0, '[\"Option 1\",\"Option 2\",\"Option 3\",\"Option 4\"]', 0),
(15, 9, 'question 1', 'ab78mquzqno', 'radioButton', 1, '[\"opti\",\" adaas\"]', 0);

-- --------------------------------------------------------

--
-- Table structure for table `form_response`
--

CREATE TABLE `form_response` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `response` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_response`
--

INSERT INTO `form_response` (`id`, `form_id`, `response`, `deleted`) VALUES
(2, 7, '{\"iy9zsoxukck\":\"asdsad\",\"ybbl0ywjck\":\"Option 1\",\"Option 2\":[\"Option 2\",\"Option 2\"],\"Option 1\":[\"Option 1\",\"Option 1\"],\"6b8t9zzvyaa\":\"Option 3\"}', 0),
(4, 7, '{\"ybbl0ywjck\":\"Option 1\",\"bfpemo64wg7\":[\"bfpemo64wg7\",\"bfpemo64wg7\",\"bfpemo64wg7\",\"bfpemo64wg7\"],\"6b8t9zzvyaa\":\"Option 3\"}', 0),
(6, 7, '{\"iy9zsoxukck\":\"test 123\",\"ybbl0ywjck\":\"Option 1\",\"Option 1\":[\"Option 1\",\"Option 1\"],\"Option 2\":[\"Option 2\",\"Option 2\"],\"6b8t9zzvyaa\":\"Option 3\"}', 0),
(7, 7, '{\"iy9zsoxukck\":\"sadsad\",\"ybbl0ywjck\":\"Option 1\",\"Option 1\":[\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\"],\"Option 2\":[\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\"],\"6b8t9zzvyaa\":\"Option 3\"}', 0),
(8, 7, '{\"iy9zsoxukck\":\"asdasdsadasdas\",\"ybbl0ywjck\":\"Option 1\",\"Option 1\":[\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\"],\"Option 2\":[\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\"],\"6b8t9zzvyaa\":\"Option 3\"}', 0),
(9, 7, '{\"iy9zsoxukck\":\"asdas\",\"ybbl0ywjck\":\"Option 1\",\"Option 1\":[\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\"],\"Option 2\":[\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\"],\"6b8t9', 0),
(10, 7, '{\"iy9zsoxukck\":\"asdsadsadsadas\",\"ybbl0ywjck\":\"Option 1\",\"Option 1\":[\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\",\"Option 1\"],\"Option 2\":[\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2\",\"Option 2', 0),
(11, 7, '{\"iy9zsoxukck\":\"asdasd\"}', 0),
(12, 7, '{\"iy9zsoxukck\":\"aseqw\"}', 0),
(13, 7, '{\"iy9zsoxukck\":\",n,n,n,m,n,mn,\"}', 0),
(14, 9, '{\"ab78mquzqno\":\" adaas\"}', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_response`
--
ALTER TABLE `form_response`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `form_response`
--
ALTER TABLE `form_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
