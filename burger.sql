-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 17, 2016 at 02:37 PM
-- Server version: 5.5.50
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `burger`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_login` text NOT NULL,
  `admin_password` text NOT NULL,
  `admin_status` int(11) NOT NULL,
  `admin_name` text NOT NULL,
  `admin_token` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_login`, `admin_password`, `admin_status`, `admin_name`, `admin_token`) VALUES
(1, 'strcat', '96e79218965eb72c92a549dd5a330112', 4, 'Админ', 'a9742564f7886ddf77efbfc04d00dc9d'),
(2, 'cook1', '96e79218965eb72c92a549dd5a330112', 2, 'Повар1', '0ff80554ac16f52d823068e729e6ac80'),
(3, 'cook2', '96e79218965eb72c92a549dd5a330112', 2, 'Повар2', '040b572bf8d6880f3bb2df201833551f'),
(4, 'deliver1', '96e79218965eb72c92a549dd5a330112', 1, 'Доставщик1', 'a56c38127547c6cf4cd47b0143abe501'),
(5, 'deliver2', '96e79218965eb72c92a549dd5a330112', 1, 'Доставщик2', '78253b62361253ade15cdab5be9db4f1');

-- --------------------------------------------------------

--
-- Table structure for table `cooks`
--

CREATE TABLE IF NOT EXISTS `cooks` (
  `cook_id` int(11) NOT NULL,
  `cook_user_id` int(11) NOT NULL,
  `cook_order_id` int(11) NOT NULL,
  `cook_order_closed` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cooks`
--

INSERT INTO `cooks` (`cook_id`, `cook_user_id`, `cook_order_id`, `cook_order_closed`) VALUES
(1, 2, 2, 1),
(2, 2, 3, 0),
(4, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivers`
--

CREATE TABLE IF NOT EXISTS `delivers` (
  `deliver_id` int(11) NOT NULL,
  `deliver_user_id` int(11) NOT NULL,
  `deliver_order_id` int(11) NOT NULL,
  `deliver_order_closed` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivers`
--

INSERT INTO `delivers` (`deliver_id`, `deliver_user_id`, `deliver_order_id`, `deliver_order_closed`) VALUES
(1, 4, 4, 0),
(2, 4, 5, 0),
(4, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL,
  `order_client_id` int(11) NOT NULL,
  `order_amount` float unsigned NOT NULL,
  `order_address` text NOT NULL,
  `order_list` text NOT NULL,
  `order_status` enum('added','preparing','cooked','deliver','closed') NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_client_id`, `order_amount`, `order_address`, `order_list`, `order_status`, `order_date`) VALUES
(1, 1, 1, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:21:06'),
(2, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'cooked', '2016-10-10 07:34:27'),
(3, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'preparing', '2016-10-10 07:44:23'),
(4, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'deliver', '2016-10-10 07:44:23'),
(5, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'deliver', '2016-10-10 07:44:23'),
(6, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'cooked', '2016-10-10 07:44:23'),
(7, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(8, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(9, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(10, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(11, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(12, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(13, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(14, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(15, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(16, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(17, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(18, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(19, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(20, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(21, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(22, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(23, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(24, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(25, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(26, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(27, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `product_info` text NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_image` text NOT NULL,
  `product_description` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_info`, `product_price`, `product_image`, `product_description`) VALUES
(1, 'БУРГЕР', 'САМЫЙ ЛУЧШИЙ В МИРЕ БУРГЕР', '350.00', 'burger.jpg', 'Описание'),
(2, 'бургер 2', 'второй бургер', '200.00', 'burger.jpg', 'описание 2');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE IF NOT EXISTS `sliders` (
  `slider_id` int(11) NOT NULL,
  `slider_product_id` int(11) NOT NULL,
  `slider_image` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`slider_id`, `slider_product_id`, `slider_image`) VALUES
(1, 1, 'burger.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `user_email` text NOT NULL,
  `user_password` text NOT NULL,
  `user_name` text NOT NULL,
  `user_phone` text NOT NULL,
  `user_token` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_name`, `user_phone`, `user_token`) VALUES
(1, 'test@test.com', '96e79218965eb72c92a549dd5a330112', 'Имя', '88005553535', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cooks`
--
ALTER TABLE `cooks`
  ADD PRIMARY KEY (`cook_id`);

--
-- Indexes for table `delivers`
--
ALTER TABLE `delivers`
  ADD PRIMARY KEY (`deliver_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cooks`
--
ALTER TABLE `cooks`
  MODIFY `cook_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `delivers`
--
ALTER TABLE `delivers`
  MODIFY `deliver_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
