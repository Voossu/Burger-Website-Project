-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 21 2016 г., 18:15
-- Версия сервера: 5.7.13
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yrbdjxsf_burger`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE `admins` (
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `admin_login` text NOT NULL,
  `admin_password` text NOT NULL,
  `admin_status` bigint(20) UNSIGNED NOT NULL,
  `admin_name` text NOT NULL,
  `admin_token` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_login`, `admin_password`, `admin_status`, `admin_name`, `admin_token`) VALUES
(1, 'strcat', '96e79218965eb72c92a549dd5a330112', 4, 'Админ', '81b438a95f46e5dbe0e58b1f204c9235'),
(2, 'cook1', '96e79218965eb72c92a549dd5a330112', 2, 'Повар1', '252f579a170a2dcaa8ccfa83811d0969'),
(3, 'cook2', '96e79218965eb72c92a549dd5a330112', 2, 'Повар2', '040b572bf8d6880f3bb2df201833551f'),
(4, 'deliver1', '96e79218965eb72c92a549dd5a330112', 1, 'Доставщик1', 'a56c38127547c6cf4cd47b0143abe501'),
(5, 'deliver2', '96e79218965eb72c92a549dd5a330112', 1, 'Доставщик2', '78253b62361253ade15cdab5be9db4f1');

-- --------------------------------------------------------

--
-- Структура таблицы `cooks`
--

CREATE TABLE `cooks` (
  `cook_id` bigint(20) UNSIGNED NOT NULL,
  `cook_user_id` bigint(20) UNSIGNED NOT NULL,
  `cook_order_id` bigint(20) UNSIGNED NOT NULL,
  `cook_order_closed` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cooks`
--

INSERT INTO `cooks` (`cook_id`, `cook_user_id`, `cook_order_id`, `cook_order_closed`) VALUES
(1, 2, 2, 1),
(2, 2, 3, 1),
(4, 2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `delivers`
--

CREATE TABLE `delivers` (
  `deliver_id` bigint(20) UNSIGNED NOT NULL,
  `deliver_user_id` bigint(20) UNSIGNED NOT NULL,
  `deliver_order_id` bigint(20) UNSIGNED NOT NULL,
  `deliver_order_closed` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delivers`
--

INSERT INTO `delivers` (`deliver_id`, `deliver_user_id`, `deliver_order_id`, `deliver_order_closed`) VALUES
(1, 4, 4, 0),
(2, 4, 5, 0),
(4, 4, 1, 1),
(5, 4, 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_client_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` float UNSIGNED NOT NULL,
  `order_address` text,
  `order_list` text NOT NULL,
  `order_status` enum('added','preparing','cooked','deliver','closed') NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `order_client_id`, `order_amount`, `order_address`, `order_list`, `order_status`, `order_date`) VALUES
(1, 1, 1, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:21:06'),
(2, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'deliver', '2016-10-10 07:34:27'),
(3, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'cooked', '2016-10-10 07:44:23'),
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
(27, 1, 50.5, '{"city":"\\u0413\\u041e\\u0420\\u041e\\u0414","street":"\\u0423\\u041b\\u0418\\u0426\\u0410","house":"\\u0414\\u041e\\u041c","entrance":"\\u041f\\u041e\\u0414\\u042a\\u0415\\u0417\\u0414","floor":"\\u042d\\u0422\\u0410\\u0416","flat":"\\u041a\\u0412\\u0410\\u0420\\u0422\\u0418\\u0420\\u0410","intercom":"\\u0414\\u041e\\u041c\\u041e\\u0424\\u041e\\u041d","comment":"\\u041a\\u041e\\u041c\\u041c\\u0415\\u041d\\u0422\\u0410\\u0420\\u0418\\u0419"}', '[{"name":"\\u0414\\u0420\\u0410\\u041c,\\u041d,\\u0411\\u0415\\u0419\\u0421","count":"5"},{"name":"COCA-COLA","count":"3"},{"name":"\\u041a\\u0410\\u0420\\u0422\\u041e\\u0428\\u041a\\u0410 \\u0424\\u0420\\u0418","count":"2"}]', 'closed', '2016-10-10 07:44:23'),
(28, 1, 350, NULL, '[{"name":"\\u0411\\u0423\\u0420\\u0413\\u0415\\u0420","count":"1"}]', 'added', '2016-12-18 12:36:04'),
(29, 1, 700, '', '[{"name":"\\u0411\\u0423\\u0420\\u0413\\u0415\\u0420","count":2}]', 'added', '2016-12-18 12:40:21'),
(30, 1, 700, '', '[{"name":"\\u0411\\u0423\\u0420\\u0413\\u0415\\u0420","count":2}]', 'added', '2016-12-18 12:40:29'),
(31, 2, 0, '{"city":"Pokrovsk","street":"March 8","house":"66","entrance":"","floor":"","flat":"","comment":""}', '[]', 'added', '2016-12-19 22:27:27'),
(32, 1, 0, '', '[]', 'added', '2016-12-19 22:32:49');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` text NOT NULL,
  `product_info` text NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_image` text NOT NULL,
  `product_description` text NOT NULL,
  `product_created` datetime NOT NULL,
  `product_available` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_info`, `product_price`, `product_image`, `product_description`, `product_created`, `product_available`) VALUES
(1, 'БУРГЕР', 'САМЫЙ ЛУЧШИЙ В МИРЕ БУРГЕР', '350.00', 'burger.jpg', 'Описание', '2018-12-20 16:00:00', 0),
(2, 'бургер 2', 'второй бургер', '200.00', 'burger.jpg', 'описание 2', '2018-12-20 16:00:00', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `sliders`
--

CREATE TABLE `sliders` (
  `slider_id` bigint(20) UNSIGNED NOT NULL,
  `slider_product_id` bigint(20) UNSIGNED NOT NULL,
  `slider_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sliders`
--

INSERT INTO `sliders` (`slider_id`, `slider_product_id`, `slider_image`) VALUES
(1, 1, 'burger.png');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `user_email` text NOT NULL,
  `user_password` text NOT NULL,
  `user_name` text NOT NULL,
  `user_phone` text NOT NULL,
  `user_token` text NOT NULL,
  `user_address` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_name`, `user_phone`, `user_token`, `user_address`) VALUES
(1, 'test@test.com', '96e79218965eb72c92a549dd5a330112', 'Имя', '88005553535', '', ''),
(2, 'test1@test.com', '96e79218965eb72c92a549dd5a330112', 'tets1', '0938555330', '', '{"city":"Pokrovsk","street":"March 8","house":"66","entrance":"","floor":"","flat":"","comment":""}');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `admin_status` (`admin_status`);

--
-- Индексы таблицы `cooks`
--
ALTER TABLE `cooks`
  ADD PRIMARY KEY (`cook_id`),
  ADD KEY `cook_user_id` (`cook_user_id`),
  ADD KEY `cook_order_id` (`cook_order_id`);

--
-- Индексы таблицы `delivers`
--
ALTER TABLE `delivers`
  ADD PRIMARY KEY (`deliver_id`),
  ADD KEY `deliver_user_id` (`deliver_user_id`),
  ADD KEY `deliver_order_id` (`deliver_order_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_client_id` (`order_client_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`slider_id`),
  ADD KEY `slider_product_id` (`slider_product_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `cooks`
--
ALTER TABLE `cooks`
  MODIFY `cook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `delivers`
--
ALTER TABLE `delivers`
  MODIFY `deliver_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `sliders`
--
ALTER TABLE `sliders`
  MODIFY `slider_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
