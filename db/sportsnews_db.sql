-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2024 at 02:46 PM
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
-- Database: `sync_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:5:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:5:\"title\";s:1:\"d\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:9:{i:0;a:5:{s:1:\"a\";i:14;s:1:\"b\";s:11:\"create_news\";s:1:\"c\";s:11:\"Create News\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}i:1;a:5:{s:1:\"a\";i:15;s:1:\"b\";s:9:\"edit_news\";s:1:\"c\";s:9:\"Edit News\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}i:2;a:5:{s:1:\"a\";i:16;s:1:\"b\";s:11:\"delete_news\";s:1:\"c\";s:11:\"Delete News\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}i:3;a:5:{s:1:\"a\";i:17;s:1:\"b\";s:11:\"create_tags\";s:1:\"c\";s:11:\"Create Tags\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}i:4;a:5:{s:1:\"a\";i:18;s:1:\"b\";s:9:\"edit_tags\";s:1:\"c\";s:9:\"Edit Tags\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}i:5;a:5:{s:1:\"a\";i:19;s:1:\"b\";s:11:\"delete_tags\";s:1:\"c\";s:11:\"Delete Tags\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}i:6;a:5:{s:1:\"a\";i:20;s:1:\"b\";s:17:\"create_categories\";s:1:\"c\";s:17:\"Create Categories\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}i:7;a:5:{s:1:\"a\";i:21;s:1:\"b\";s:15:\"edit_categories\";s:1:\"c\";s:15:\"Edit Categories\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}i:8;a:5:{s:1:\"a\";i:22;s:1:\"b\";s:17:\"delete_categories\";s:1:\"c\";s:17:\"Delete Categories\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:6;i:1;i:7;i:2;i:8;}}}s:5:\"roles\";a:3:{i:0;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:11:\"Super Admin\";s:1:\"d\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:5:\"Admin\";s:1:\"d\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:8;s:1:\"b\";s:6:\"Member\";s:1:\"d\";s:3:\"web\";}}}', 1718846176);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'FOOTBALL', 'Football News', '2024-05-25 10:32:22', '2024-06-15 13:45:30'),
(2, 'Basketball', 'Basketball News', '2024-05-25 10:32:22', '2024-06-15 13:48:13'),
(3, 'Tennis', 'Tennis News', '2024-05-25 10:32:22', '2024-06-15 13:49:33'),
(5, 'Volleyball', 'Volleyball News', '2024-06-15 13:50:34', '2024-06-15 13:50:34'),
(6, 'F1', 'F1 News', '2024-06-15 13:51:11', '2024-06-15 13:51:11'),
(7, 'Handball', 'Handball News', '2024-06-15 13:51:34', '2024-06-15 13:51:34'),
(8, 'Rugby', 'Rugby News', '2024-06-15 13:51:50', '2024-06-15 13:51:50'),
(9, 'Table Tennis', 'Table Tennis News', '2024-06-15 13:52:03', '2024-06-15 13:52:03'),
(10, 'Euro 2024', 'Euro 2024 News', '2024-06-15 13:52:28', '2024-06-15 13:52:28'),
(11, 'Copa America 2024', 'Copa America 2024 News', '2024-06-15 13:52:47', '2024-06-15 13:52:47'),
(12, 'Paris 2024', 'Paris Olympics 2024', '2024-06-15 13:53:28', '2024-06-15 13:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(9, 'Joey', 'joey-j-mansour@hotmail.com', 'test1', 'Red Bull\'s Sergio Perez (34) has apologised after a second successive retirement in Canada on Sunday left the Mexican 87 points behind triple Formula One champion, team mate and race winner Max Verstappen (26).', '2024-06-18 15:22:43', '2024-06-18 15:22:43'),
(10, 'Joey', 'jimmy@example.com', 'test2', 'Red Bull\'s Sergio Perez (34) has apologised after a second successive retirement in Canada on Sunday left the Mexican 87 points behind triple Formula One champion, team mate and race winner Max Verstappen (26).\r\n\r\nPerez remained fifth overall in the world championship and a point behind Ferrari\'s Carlos Sainz, who also failed to finish as did his teammate and Verstappen\'s closest rival Charles Leclerc in a big blow for the Italian outfit.\r\n\r\n\"I\'m very sorry for my team, I let them down today. But we will come back no doubt. There’s a very long way to go,\" Perez, who has scored only four points from the last three races, said on social media.', '2024-06-18 15:36:28', '2024-06-18 15:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(11) DEFAULT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `file_name`, `mime_type`, `size`, `disk`, `conversions_disk`, `collection_name`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `model_type`, `model_id`, `uuid`, `created_at`, `updated_at`) VALUES
(26, 'i', 'i.jpg', 'image/jpeg', 36322, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 2, '604fc9d7-1c2c-4915-8ebd-ccb3feee2a9b', '2024-05-27 22:09:05', '2024-05-27 22:09:05'),
(27, 'xavi', 'xavi.jpg', 'image/jpeg', 41378, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 2, 'App\\Models\\News', 2, 'ec9c6dcc-b765-4263-816c-5933f79a5dd9', '2024-05-28 05:37:32', '2024-05-28 05:37:32'),
(82, '6655ba39591ec', '6655ba39591ec.jpeg', 'image/jpeg', 43246, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 3, 'App\\Models\\News', 2, '0a16b511-2d4b-44ca-9015-0b9cce43f313', '2024-05-28 18:14:49', '2024-05-28 18:14:49'),
(84, '6655ba3af0a9c', '6655ba3af0a9c.jpeg', 'image/jpeg', 67141, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 16, 'e6697278-33d1-4033-8c68-89b6f9aad1e0', '2024-05-28 18:41:40', '2024-05-28 18:41:40'),
(183, 'xavi', 'xavi.jpg', 'image/jpeg', 41378, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 39, 'b3d1c83f-4faf-4720-8334-6ebd7295c108', '2024-06-14 16:54:22', '2024-06-14 16:54:22'),
(184, 'sRZyjc1BVnVFnTkeU33TG9C6Djd', 'sRZyjc1BVnVFnTkeU33TG9C6Djd.jpg', 'image/jpeg', 200724, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 2, 'App\\Models\\News', 39, '5672f0c9-0b94-4b57-ae00-ad3082bf0f8e', '2024-06-14 16:54:22', '2024-06-14 16:54:22'),
(185, 'andy-robertson-lfc-scaled-e1697801575777', 'andy-robertson-lfc-scaled-e1697801575777.jpeg', 'image/jpeg', 125942, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 40, '903fd4c5-d56e-4ccc-9f15-2fa7359172cf', '2024-06-14 16:58:33', '2024-06-14 16:58:33'),
(186, 'fbl-euro-2024-fra-training', 'fbl-euro-2024-fra-training.webp', 'image/webp', 137540, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 41, '62288702-2a1b-4de2-941b-6b749c2c5a7b', '2024-06-14 16:59:56', '2024-06-14 16:59:56'),
(187, 'skysports-barcelona-xavi_6564722', 'skysports-barcelona-xavi_6564722.jpg', 'image/jpeg', 253101, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 3, 'App\\Models\\News', 39, 'adfea0a7-08bc-48dc-aa24-52f575ee4487', '2024-06-14 23:28:20', '2024-06-14 23:28:20'),
(188, 'germany_v_scotland_-_uefa_euro_2024_-_group_a_-_munich_football_arena', 'germany_v_scotland_-_uefa_euro_2024_-_group_a_-_munich_football_arena.webp', 'image/webp', 50424, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 42, '4ba9b128-5fc2-4717-8a1d-eaefa543237e', '2024-06-15 10:34:13', '2024-06-15 10:34:13'),
(189, 'germany_v_scotland_group_a_-_uefa_euro_2024', 'germany_v_scotland_group_a_-_uefa_euro_2024.jpeg', 'image/jpeg', 67350, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 2, 'App\\Models\\News', 42, '00c92674-5e31-4f34-84cf-fca39f6f73d6', '2024-06-15 10:34:13', '2024-06-15 10:34:13'),
(190, '3963790-80470508-2560-1440', '3963790-80470508-2560-1440.jpg', 'image/jpeg', 228629, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 44, '64ab0887-07b4-4767-a23b-117929973df7', '2024-06-15 12:22:28', '2024-06-15 12:22:28'),
(191, 'UMSQEVCBONKLTE5TTOUIMN4ZFQ', 'UMSQEVCBONKLTE5TTOUIMN4ZFQ.jpg', 'image/jpeg', 6095488, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 45, '012c53fe-ca7d-42ee-bfb7-6262a2bc4237', '2024-06-15 12:51:21', '2024-06-15 12:51:21'),
(192, 'naglesmann', 'naglesmann.jpg', 'image/jpeg', 75809, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 46, '872b5730-7ed1-47b2-90e3-6f04c2f30955', '2024-06-15 13:34:16', '2024-06-15 13:34:16'),
(193, 'rvn2r948_virgil-van-dijk-afp_625x300_17_October_23', 'rvn2r948_virgil-van-dijk-afp_625x300_17_October_23.jpg', 'image/jpeg', 160816, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 47, '6f37bc36-82f8-4cf9-893d-a654101dd4ed', '2024-06-15 13:59:04', '2024-06-15 13:59:04'),
(194, 'skysports-southgate-england_6362986', 'skysports-southgate-england_6362986.jpg', 'image/jpeg', 219453, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 48, '55085650-4b90-42cd-b1ec-e905e317825f', '2024-06-16 10:39:48', '2024-06-16 10:39:48'),
(195, 'Yamal', 'Yamal.jpg', 'image/jpeg', 73833, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 49, '4ef07e2c-7816-4e38-9691-8cf807ece8ee', '2024-06-16 10:44:02', '2024-06-16 10:44:02'),
(196, 'embolo', 'embolo.jpg', 'image/jpeg', 59127, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 50, 'f9f56a7b-7c22-4d32-9f7a-e4716d489d11', '2024-06-16 10:46:10', '2024-06-16 10:46:10'),
(197, 'christian-eriksen-denmark-celebrates-scoring-910023834', 'christian-eriksen-denmark-celebrates-scoring-910023834.jpg', 'image/jpeg', 4182143, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 51, '5007c287-8a3a-4348-b47d-b1fdbb61f00c', '2024-06-16 17:14:27', '2024-06-16 17:14:27'),
(198, 'netherlands', 'netherlands.jpg', 'image/jpeg', 94888, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 52, 'eefa8849-c0af-49b6-9053-0c363efac6a7', '2024-06-16 17:17:23', '2024-06-16 17:17:23'),
(199, 'NQGTGRULQ5MOBEESAAPMQ7QKYE', 'NQGTGRULQ5MOBEESAAPMQ7QKYE.jpg', 'image/jpeg', 468386, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 53, '1a0dde5a-993f-4f4e-b29d-9a1954328a13', '2024-06-16 17:19:37', '2024-06-16 17:19:37'),
(200, 'ap24168452877759', 'ap24168452877759.jpg', 'image/jpeg', 278578, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 54, 'b036e398-7888-467a-bf37-f1c536ca8b50', '2024-06-16 17:21:34', '2024-06-16 17:21:34'),
(204, 'JOR01310', 'JOR01310.jpg', 'image/jpeg', 44850, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 58, '127f3416-69e6-4a08-b7cc-157e006cc07c', '2024-06-16 18:33:14', '2024-06-16 18:33:14'),
(205, 'buffon', 'buffon.jpg', 'image/jpeg', 3536240, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 59, '00887e40-ba6b-45ff-a46c-c2e288ecf9fe', '2024-06-16 20:25:25', '2024-06-16 20:25:25'),
(206, 'slovakia', 'slovakia.jpg', 'image/jpeg', 3561821, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 60, '442e976b-5be6-4a78-848d-b1be20414547', '2024-06-17 09:37:48', '2024-06-17 09:37:48'),
(207, 'cristiano', 'cristiano.jpeg', 'image/jpeg', 54945, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 61, 'c8412d37-ec41-4d99-9ac6-e3556186652f', '2024-06-17 09:40:55', '2024-06-17 09:40:55'),
(208, 'mbappe', 'mbappe.jpg', 'image/jpeg', 111028, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 62, '53580c66-09a2-403b-bdd5-f26c3361750e', '2024-06-17 09:43:16', '2024-06-17 09:43:16'),
(209, 'belly', 'belly.jpg', 'image/jpeg', 952957, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 63, '6b917bea-61f8-49c8-b373-da47536ceaf9', '2024-06-17 09:45:13', '2024-06-17 09:45:13'),
(210, '126952-fetjsvjohv-1567821640', '126952-fetjsvjohv-1567821640.jpg', 'image/jpeg', 108410, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 64, 'e97de71f-3839-4689-9fa9-8a716429f26d', '2024-06-17 10:06:12', '2024-06-17 10:06:12'),
(211, 'aryna', 'aryna.jpg', 'image/jpeg', 63842, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 65, '981ac8b5-d311-4e4d-af34-0190cb0330b1', '2024-06-17 14:43:43', '2024-06-17 14:43:43'),
(212, 'nadal', 'nadal.jpg', 'image/jpeg', 40068, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 66, 'da29d6ad-cb7d-4e7d-ba91-662bbe29296f', '2024-06-17 14:53:11', '2024-06-17 14:53:11'),
(214, 'riyadi', 'riyadi.jpg', 'image/jpeg', 313018, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 68, '5ffa39a5-6629-4b27-a0fd-2fd45d8a4ede', '2024-06-17 15:11:07', '2024-06-17 15:11:07'),
(215, 'wael', 'wael.jpg', 'image/jpeg', 352338, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 67, '2baca167-4dba-407a-95d1-d828ae04278c', '2024-06-17 15:11:34', '2024-06-17 15:11:34'),
(216, 'volley', 'volley.jpg', 'image/jpeg', 250705, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 69, '502a3452-4cda-49ab-99ac-b52c302fd5c3', '2024-06-17 15:36:13', '2024-06-17 15:36:13'),
(217, 'f1', 'f1.jpg', 'image/jpeg', 165585, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 70, 'c3c2f001-6755-47fe-a92f-e304b98137f2', '2024-06-17 15:48:26', '2024-06-17 15:48:26'),
(218, 'perez', 'perez.jpg', 'image/jpeg', 219685, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 71, '5dbf702a-817c-4197-a897-07750dcc8524', '2024-06-17 15:50:38', '2024-06-17 15:50:38'),
(219, 'Springbok-captain-Siya-Kolisi-celebrates', 'Springbok-captain-Siya-Kolisi-celebrates.jpg', 'image/jpeg', 260795, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 72, '18e29b1d-1222-47a5-887f-04a4f6b582fd', '2024-06-17 15:59:31', '2024-06-17 15:59:31'),
(220, 'rugby', 'rugby.jpg', 'image/jpeg', 92849, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 73, '0b6c7e66-0f0f-4dac-9875-016708c8d232', '2024-06-17 16:02:13', '2024-06-17 16:02:13'),
(221, 'handball', 'handball.jpg', 'image/jpeg', 140862, 'public', 'public', 'images', '[]', '[]', '[]', '[]', 1, 'App\\Models\\News', 74, 'b761bd89-f395-4809-bdad-2ef8c9b0b317', '2024-06-17 16:06:42', '2024-06-17 16:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_05_24_100651_create_news_table', 1),
(2, '2024_05_24_141435_create_categories_table', 2),
(3, '2024_05_25_101637_create_news_table', 3),
(4, '2024_05_25_102104_create_tags_table', 4),
(5, '2024_05_25_102216_create_news_tags_table', 4),
(6, '2024_05_25_102406_create_categories_table', 4),
(7, '2024_05_27_201627_create_media_table', 5),
(8, '2024_05_28_090619_add_main_image_id_to_news_table', 6),
(9, '2024_05_29_170717_create_members_table', 7),
(10, '2024_06_02_131925_add_last_login_date_to_users_table', 8),
(11, '2024_06_03_170737_create_cache_table', 9),
(12, '2024_06_04_034157_create_role_user_table', 10),
(13, '2024_06_18_160236_create_contacts_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(14, 'App\\Models\\User', 1),
(14, 'App\\Models\\User', 2),
(14, 'App\\Models\\User', 23),
(15, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 2),
(16, 'App\\Models\\User', 1),
(16, 'App\\Models\\User', 2),
(17, 'App\\Models\\User', 1),
(18, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 1),
(20, 'App\\Models\\User', 1),
(21, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(6, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 2),
(8, 'App\\Models\\User', 23);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `custom_date` date NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `main_image_id`, `title`, `description`, `custom_date`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 26, 'Chelsea make approach for Leicester\'s Enzo Maresca - sources', '<p><a href=\"https://www.espn.com/soccer/team?id=363\">Chelsea</a> have approached <a href=\"https://www.espn.com/football/team/_/id/375/leicester-city\">Leicester City</a> for permission to speak to manager Enzo Maresca, sources have told ESPN, after identifying the Italian as the preferred candidate to succeed Mauricio Pochettino at Stamford Bridge.</p><p>Maresca, 44, guided Leicester to promotion back to the <a href=\"https://www.espn.com/soccer/league/_/name/ENG.1\">Premier League</a> as winners of the Championship in his first campaign in charge this season and his success has prompted Chelsea\'s owners to make a formal move to hire Pep Guardiola\'s former assistant at <a href=\"https://www.espn.com/soccer/team?id=382\">Manchester City</a>.</p>', '2024-06-15', 1, 1, '2024-05-27 17:11:57', '2024-06-15 13:47:17'),
(16, 84, 'Alexia Putellas: \"I wanna keep playing until I\'m like 37 or 38 years old\"', '<p><strong>Alexia Putellas, in an interview with Barça One on the occasion of her recent renewal with FC Barcelona until 2026, which has seen the light today, talks about how she sees herself in the future: \"I see myself playing football for quite a few years because I love my job very much. This passion, I think, gives me energy every day. If I have to put a number on it, I would like to play until I am 37 or 38 years old. The Barça midfielder and captain turned 30 on February 4.</strong></p><p><strong>Asked if she saw herself as a child being anything other than a soccer player, she noted that \"I wouldn\'t know what to tell you.. I think I am designed to be a soccer player, I opted for it since I was little and I think it has turned out well.\"</strong></p><p><strong>The Barça captain signed her renewal just before the Champions League final won against Lyon in San Mamés, where she was the protagonist by achieving the final 2-0 in added time after coming on in the last minutes.</strong></p>', '2024-05-29', 1, 1, '2024-05-28 18:41:39', '2024-06-15 13:47:11'),
(39, 187, 'Les Bleus avec Adrien Rabiot et William Saliba d\'entrée face à l\'Autriche pour leurs débuts à l\'Euro ?', '<h2><strong>INFO L\'ÉQUIPE.</strong> Lors de la mise en place ce vendredi après-midi, Adrien Rabiot et William Saliba faisaient partie de l\'équipe titulaire.</h2>', '2024-06-05', 1, 1, '2024-06-14 16:54:22', '2024-06-15 13:47:00'),
(40, 185, 'Robertson: \'We\'ve waited a long time for this day\'', '<p><strong>Scotland captain Andy Robertson spoke to UEFA.com ahead of participating in the EURO 2024 opener against hosts Germany.</strong></p>', '2024-06-14', 1, 1, '2024-06-14 16:58:33', '2024-06-15 13:46:53'),
(41, 186, 'Close to 2.3 million EURO 2024 tickets allocated to fans', '<p><strong>With more than 50 million ticket requests in the two application phases, UEFA EURO 2024 is officially the most demanded UEFA European Championship of all time. In order to accommodate the high number of requests, close to 2.3 million tickets (or 85%) of the 2.7 million tickets were made available to the general public and to fans of the teams. So far, 93,147 more tickets than originally planned have been made available, meaning more supporters than ever will get the opportunity to cheer on their team from the stands.</strong></p><p><strong>The additional number of seats available resulted from ticket returns and the finalisation of stadium configurations. As part of the Fans First programme, these tickets were offered to and purchased by fans who were initially unsuccessful in the ballot.</strong></p>', '2024-06-13', 1, 1, '2024-06-14 16:59:56', '2024-06-15 13:46:46'),
(42, 188, 'Germany 5-1 Scotland: Hosts hit ground running in Munich', '<p><strong>Julian Nagelsmann\'s side were too strong for ten-man Scotland in the opening game of EURO 2024.</strong><br><br><br><strong>Germany hit the ground running in the opening game of EURO 2024 as Julian Nagelsmann\'s side overpowered ten-man Scotland in Munich.</strong></p><p>&nbsp;</p><h3>Match in brief: Germany begin with a bang</h3><p>Florian Wirtz, Leverkusen\'s talisman in their march to a maiden Bundesliga title last season, tested Scotland goalkeeper Angus Gunn inside the opening 60 seconds, only to be ruled offside from Antonio Rüdiger\'s pass. Wirtz was on the scoresheet less than ten minutes later, however, his first-time shot from Joshua Kimmich\'s ball finding the bottom corner via the inside of the post.</p><p>Spurred on by their vociferous supporters, Germany continued to pin Scotland pack and doubled their advantage midway through the first half. An incisive passing move ended with Kai Havertz picking out Musiala, who fashioned space inside a crowded penalty area before lashing the ball into the roof of the net. Things went from bad to worse for Steve Clarke\'s team shortly before the interval, when Ryan Porteous was dismissed for a foul on İlkay Gündoğan inside the area – and Havertz made no mistake from the resulting spot kick.</p>', '2024-06-15', 1, 1, '2024-06-15 10:34:13', '2024-06-15 13:46:38'),
(44, 190, 'EURO 2024 Preview: After 2021 fiasco, France seek glory in Germany', '<p><strong>Didier Deschamps\' France travel to Germany with the firm intention of going as far as possible. World champions in 2018 and runners-up in 2022, the French team missed out in their last Euro trip and will be keen to make up for it this summer.</strong></p>', '2024-06-15', 1, 1, '2024-06-15 12:22:28', '2024-06-15 13:46:32'),
(45, 191, 'HUNGARY V SWITZERLAND - EURO 2024 LATEST AS BOTH SIDES LOOK TO CATCH GERMANY IN GROUP A', '<p><strong>SWITZERLAND\'S ROUTE TO THE FINALS</strong></p><p>Switzerland\'s route to Euro 2024 wasn\'t straightforward and they battled to gain four wins and five draws to finish second in their qualifying group behind Romania.</p><p>They have got the better of Hungary on several occasions before, winning six of their last nine encounters.<br><br><strong>HUNGARY\'S ROUTE TO THE FINALS</strong></p><p>Hungary went unbeaten through Euro 2024 qualifying, winning five and drawing three games out of eight to top their group.</p><p>They are expected to qualify for the knockout stages having previously missed out back in Euro 2020.</p>', '2024-06-15', 1, 1, '2024-06-15 12:51:21', '2024-06-15 13:46:26'),
(46, 192, 'EURO 2024: JULIAN NAGELSMANN PLEASED WITH GERMANY\'S REACTION TO CONCEDING LATE GOAL IN WIN OVER SCOTLAND', '<p><strong>Julian Nagelsmann got off to a winning start to Euro 2024, as Germany dismantled Scotland 5-1 at the Allianz Arena. But it was the reaction of his players when Antonio Rudiger conceded a late own goal that impressed him as much as their lightning-fast start. The former Bayern Munich boss admitted he was surprised by the lack of aggression shown by the opposition, a view shared by Roy Keane.</strong></p><p><br>Julian Nagelsmann even took positives from Germany conceding, as his side romped to <a href=\"https://www.tntsports.co.uk/football/euro/2024/germany-v-scotland-euro-2024-live_sto10191416/story.shtml\">a stunning 5-1 win over Scotland</a> in the curtain raiser of Euro 2024.</p><p>Germany did not wilt under the pressure of hosting Euro 2024’s opening match in Munich, as Florian Wirtz, Jamal Musiala and a Kai Havertz penalty put them 3-0 up by half-time.</p><p>Watford centre back Ryan Porteous was shown a red card for a two-footed challenge on Ilkay Gundogan to give away a penalty, before Niclas Fullkrug slammed in a fourth.</p>', '2024-06-15', 1, 1, '2024-06-15 13:34:16', '2024-06-15 13:46:17'),
(47, 193, 'EURO 2024 Preview: Can the Netherlands repeat their historic 1988 triumph?', '<p><strong>The Dutch have been in the World Cup finals three times, but have only managed to claim the European Cup once in the end. That happened in 1988, when the tournament was also played on German soil. Can Ronald Koeman\'s men repeat that feat this summer or will they be kicked out of the tournament early on? In this article, we take a closer look at the Orange Lions.</strong></p><h2>The road to the Championship</h2><p><a href=\"https://www.flashscore.com/team/netherlands/WYintcWb/\">The Dutch</a> were in a relatively tough qualifying group, in which they were paired with France, among others, as they were in the group stage. The Dutch lost both matches to the World Cup finalist, but managed to win the other six matches, qualifying as the second-placed team from the pool for the European Championship.</p><p>Overall, the Netherlands has been in good form in recent months. Although they lost 2-1 in a friendly against Germany in March, they have won all six of their last seven matches without conceding a goal. In the last four wins, the difference with the opponent was also at least four goals: 6-0 against Gibraltar, 4-0 against Scotland, 4-0 against Canada and 4-0 against Iceland.</p>', '2024-06-15', 10, 1, '2024-06-15 13:59:04', '2024-06-15 13:59:04'),
(48, 194, '\'I UNDERSTAND THE LANDSCAPE\' - SOUTHGATE ON JOB SCRUTINY, REVEALS NEW LEADERSHIP GROUP', '<p>Gareth Southgate has opened up on feeling \"more relaxed\" amid the scrutiny around his position as England prepare to launch their bid to win Euro 2024.</p><p>Southgate\'s side take on Serbia on Sunday, with the England manager having seen all of his squad fit to train ahead of the encounter in Gelsenkirchen.</p><p>Speaking at his pre-match press conference, Southgate responded to questions surrounding his tenure as he seeks to take his men one step further than Euro 2020, where they lost on penalties in the final to Italy.</p>', '2024-06-16', 10, 1, '2024-06-16 10:39:48', '2024-06-16 10:39:48'),
(49, 195, 'SPAIN 3-0 CROATIA: ALVARO MORATA AND DANI CARVAJAL IN THE GOALS AS LA ROJA START EURO 2024 STRONGLY', '<p><strong>Spain laid down a marker in their first outing of Euro 2024 with a 3-0 cruise past Croatia. La Roja\'s goals came from Alvaro Morata, Fabian Ruiz and Dani Carvajal - all in the first half as they turned in an impressive opening period. Croatia had a late goal ruled out but struggled to create many presentable openings despite their stellar cast of midfield schemers.</strong></p>', '2024-06-16', 10, 1, '2024-06-16 10:44:02', '2024-06-16 10:44:02'),
(50, 196, 'HUNGARY 1-3 SWITZERLAND: BREEL EMBOLO SCORES ON EMOTIONAL RETURN TO NATIONAL TEAM AS SWITZERLAND BEAT HUNGARY', '<p><strong>Breel Embolo had not played for the Switzerland national team since the 2022 Qatar World Cup but he made an emotional return coming off the bench in his country’s opening Euro 2024 game, scoring the final goal in a 3-1 win over Hungary. The strike came after Hungary had peppered Switzerland, desperately trying to find an equaliser in the second half until Embolo\'s late intervention.</strong></p>', '2024-06-16', 10, 1, '2024-06-16 10:46:10', '2024-06-16 10:46:10'),
(51, 197, 'EURO 2024 Tracker: Denmark probing for second against Slovenia after Eriksen opener', '<p><strong>Heavyweights Netherlands and England enter the tournament on Day Three as both Group C and Group D get underway. Follow all the action with Flashscore.</strong></p><p><a href=\"https://www.flashscore.com/match/rZpKouzM/#/match-summary/\"><strong>Follow Slovenia vs Denmark with our live audio commentary from 17:55 CET</strong></a></p><p><strong>19:03 CET -</strong> Both teams are unchanged after the break and we\'re back underway for the second half!</p><p><strong>18:48 CET -&nbsp;</strong>We\'ve reached the halfway stage in Stuttgart, and <a href=\"https://www.flashscore.com/player/eriksen-christian/nBRuYbqs/\">Christian Eriksen</a>\'s 17th-minute strike is all that separates the two sides. Can <a href=\"https://www.flashscore.com/team/denmark/0KUdxQVi/\">Denmark</a> press home their advantage in the second period or will <a href=\"https://www.flashscore.com/team/slovenia/tfMf3PoO/\">Slovenia</a> mount a comeback? Stay tuned to find out!</p>', '2024-06-16', 1, 1, '2024-06-16 17:14:27', '2024-06-16 17:14:27'),
(52, 198, 'Wout Weghorst strikes late to hand Netherlands narrow opening win over Poland', '<p><strong>Poland were defeated under the management of Michał Probierz for the first time, as a late Wout Weghorst winner gave the Netherlands a 2-1 win in Hamburg in Group D’s opening match at the 2024 UEFA European Championship.</strong></p><p>Looking to capitalise on the absence of <a href=\"https://www.flashscore.com/team/poland/2HzmcynI/\">Poland</a>’s talisman <a href=\"https://www.flashscore.com/player/lewandowski-robert/MVC8zHZD/\">Robert Lewandowski</a>, the <a href=\"https://www.flashscore.com/team/netherlands/WYintcWb/\">Netherlands</a> began brightly, and tested Polish goalkeeper <a href=\"https://www.flashscore.com/player/szczesny-wojciech/6NtwHZ7F/\">Wojciech Szczęsny</a> within two minutes of kick-off, when <a href=\"https://www.flashscore.com/player/gakpo-cody/pWyuBud0/\">Cody Gakpo</a> tried to catch him out at his near post.</p><p><a href=\"https://www.flashscore.com/player/reijnders-tijani/f17EnPl3/\">Tijjani Reijnders</a> then should have done better with the next opportunity, but after meeting <a href=\"https://www.flashscore.com/player/schouten-jerdy/lYVHp6x4/\">Jerdy Schouten</a>’s square pass inside the box, he failed to connect cleanly and his strike trickled narrowly wide.</p><p>Having soaked up the early pressure, Poland took the lead in the 16th minute through the man tasked with replacing Lewandowski.</p><p><a href=\"https://www.flashscore.com/player/buksa-adam/UBJAAEJh/\"><strong>Adam Buksa</strong></a><strong> climbed highest at the near post to head </strong><a href=\"https://www.flashscore.com/player/zielinski-piotr/dlFNZSvb/\"><strong>Piotr Zieliński</strong></a><strong>’s corner beyond </strong><a href=\"https://www.flashscore.com/player/verbruggen-bart/6PChQYLj/\"><strong>Bart Verbruggen</strong></a><strong>’s reach for his seventh international goal.</strong></p>', '2024-06-16', 10, 1, '2024-06-16 17:17:23', '2024-06-16 17:17:23'),
(53, 199, 'UEFA starts disciplinary proceedings against Albania over pitch invasion', '<p><strong>UEFA is starting disciplinary proceedings against the Albanian Football Federation (FSHF) over incidents including a pitch invasion and the throwing of objects during the country\'s 2-1 defeat by Italy in Dortmund at EURO 2024 on Saturday.</strong></p><p><strong>The european governing body said in a statement on Sunday that it had also begun proceedings over the lighting of fireworks by </strong><a href=\"https://www.flashscore.com/team/albania/ELP2K4oB/\"><strong>Albania</strong></a><strong> fans during the Group B game, as well as \"transmitting a provocative message unfit for a sports event\".</strong></p><p>UEFA did not provide any further details about the message alleged to have been transmitted.</p><p>The organisation said UEFA\'s Control, Ethics and Disciplinary Body will decide on the matter in due course.</p>', '2024-06-16', 10, 1, '2024-06-16 17:19:37', '2024-06-16 17:19:37'),
(54, 200, 'Hamburg police fire shots at axe-wielding person at Euro 2024 fan parade', '<p><strong>German police fired shots at a person who threatened officers with a pickaxe and an incendiary device on the sidelines of a Euro 2024 fan parade in central Hamburg on Sunday, according to a police post on social media platform X.</strong></p><p>The attacker was injured in the leg and was receiving medical care but his condition is not life-threatening, the spokesperson said.</p><p><strong>\"He apparently tried to set fire to this Molotov cocktail and then approached several people including police officers, and the police officers then had to make use of their firearms,\"</strong> said Hamburg police spokesperson Sandra Levgruen.</p><p>The incident occurred in the St Pauli district of the city as <a href=\"https://www.flashscore.com/team/poland/2HzmcynI/\">Poland</a> and the <a href=\"https://www.flashscore.com/team/netherlands/WYintcWb/\">Netherlands</a> prepared to play against each other in Hamburg\'s Volksparkstadion.</p><p>There was no evidence that the man had any connection to the football tournament, Levgruen said, while the motivation for his attack was not clear.</p>', '2024-06-16', 10, 1, '2024-06-16 17:21:34', '2024-06-16 17:21:34'),
(58, 204, 'How can Serbia stop England\'s Jude Bellingham?', '<p><strong>Jude Bellingham (20) delivered stellar performances in his first season at Real Madrid, proving himself week after week on the world’s biggest stage and proving the doubters that said he wouldn’t make it at Real Madrid wrong. In his 42 games for the Galacticos in all competitions, the England international scored 23 goals and assisted 13, collecting 36 direct goal involvements.</strong></p><p><a href=\"https://www.flashscore.com/player/bellingham-jude/QNvlPm7s/\">Bellingham</a> finished his first season in Spain with three titles, winning the Champions League and LaLiga, as well as the Spanish Supercopa with <a href=\"https://www.flashscore.com/team/real-madrid/W8mj7MDD/\">Real Madrid</a>. Now, the superstar is headed to his third big tournament with the <a href=\"https://www.flashscore.com/team/england/j9N9ZNFA/\">English national team</a>, after EURO 2020 and the 2022 World Cup, and the youngster from Stourbridge is more than ready for it.</p><p>Bellingham made his debut for the English national team in November 2020 aged 17 years, four months and 14 days in a friendly game against Ireland, since then, he played 29 games for England and is now set to play at his second European Championship, after EURO 2020, when the Three Lions lost against Italy in the final.</p><p>In the EURO qualifiers, Bellingham only played in four of the eight games, with England winning three of the four games the youngster appeared in. In his 29 games for the English national team, Bellingham has scored a total of three goals and assisted another three, collecting four of his six goal contributions with the national team in his last four games.</p><p>With this and his outstanding season with Real Madrid, Bellingham is rightly considered as one of England’s biggest assets at the tournament and one of the biggest stars in Germany.</p><p>His numbers for the national team may not be as astonishing as on a club level at first sight, but his impact on England’s game is immense. In his 29 games for the Three Lions, Bellingham has a passing accuracy of 89%, winning 57% of his duels and recording 76 touches per 90 minutes when on the pitch. When taking a closer look at his heat map in competitive games for England, you can clearly see how important Bellingham is for England’s game.&nbsp;</p>', '2024-06-16', 10, 1, '2024-06-16 18:33:14', '2024-06-16 18:33:14'),
(59, 205, 'Italy legend Buffon calls for killer instinct after defending champions\' narrow win', '<p><strong>Legendary goalkeeper Gianluigi Buffon (46) praised Italy for starting their tournament with a victory but believes they need to show a more ruthless edge going forward in EURO 2024.</strong></p><p><a href=\"https://www.flashscore.com/team/italy/hlKvieGH/\">Italy</a> managed to get a crucial 2-1 win in their opening EURO 2024 game against <a href=\"https://www.flashscore.com/team/albania/ELP2K4oB/\">Albania</a> on Saturday but their former goalkeeper <a href=\"https://www.flashscore.com/player/buffon-gianluigi/xKQMi1qO/\">Gianluigi Buffon</a> wants to see them learn to kill off games after they risked conceding a late equaliser.</p><p>Luciano Spalletti\'s side fell behind to Nedim Bajrami\'s goal in the first minute, the fastest ever scored at a European Championship, but within 15 minutes they had overturned the deficit through Alessandro Bastoni and Nicolo Barella.</p><p>\"We did well, we showed that we\'re a balanced national team, which has awareness,\" Buffon, serving as head of delegation with the national team at the Euros, said at Italy\'s training base in Iserlohn.</p><p><strong>\"Despite a shocking start that could have been destabilising, we continued to grind the game. As the coach said, our strength is to stick to the game plan, we fully deserved the victory.</strong></p><p>\"Spalletti always tries to get the most out of what he has at his disposal, sometimes he uses the stick and sometimes the carrot, I think they are inevitable tools when you have to get the most out of the boys.\"</p>', '2024-06-16', 10, 1, '2024-06-16 20:25:25', '2024-06-16 20:25:25'),
(60, 206, 'How can Slovakia beat Belgium in their Group E opener?', '<p><strong>Slovakia is one of the more under-the-radar teams at EURO 2024. In a group with Romania and Ukraine, there appear to be opportunities to reach the next round. However, they face a tough opening match against Belgium. Let\'s use statistics to examine where the opportunities lie for the Slovaks.</strong></p><h2>Strong set pieces</h2><p><a href=\"https://www.flashscore.com/team/slovakia/KpLb2q1U/\">Slovakia</a> managed to qualify for the European Championship for the third consecutive time by finishing second behind <a href=\"https://www.flashscore.com/team/portugal/WvJrjFVN/\">Portugal</a> in a group that also included <a href=\"https://www.flashscore.com/team/luxembourg/2cnFSaNj/\">Luxembourg</a>, <a href=\"https://www.flashscore.com/team/iceland/6TsAIrGN/\">Iceland</a>, <a href=\"https://www.flashscore.com/team/bosnia-herzegovina/fqe7WYTr/\">Bosnia &amp; Herzegovina</a>, and <a href=\"https://www.flashscore.com/team/liechtenstein/8KIf01Ed/\">Liechtenstein</a>. Although they lost twice to Portugal, they remained unbeaten in their other eight matches (W7 D1).&nbsp;</p><p>One of Slovakia\'s key strengths is their proficiency with set pieces. In the EURO 2024 qualifiers, they scored more goals from corner situations than any other team (5). Only Portugal and <a href=\"https://www.flashscore.com/team/poland/2HzmcynI/\">Poland</a> attempted more shots from corners, with Slovakia making 23.1% of their attempts from corner kicks - second only to <a href=\"https://www.flashscore.com/team/serbia/8Kl6iq0i/\">Serbia</a>, who attempted 24.1% of their shots after a corner. Facing&nbsp;<a href=\"https://www.flashscore.com/team/belgium/GbB957na/\">Belgium</a>, Slovakia encounters a team that conceded only four goals in the qualifiers, but one of which was from a corner (the 0-1 home loss against <a href=\"https://www.flashscore.com/team/austria/naHiWdnt/\">Austria</a>.&nbsp;</p>', '2024-06-17', 10, 1, '2024-06-17 09:37:48', '2024-06-17 09:37:48'),
(61, 207, 'EURO 2024 Preview: Is it time for Portugal to live up to their potential?', '<p><strong>After a perfect qualifying round, Portugal arrive in Germany with high expectations. Repeating their 2016 triumph is something that\'s fresh in the minds of the Portuguese, who are dreaming of another continental trophy this summer.</strong></p><p>European champions in 2016 and winners of the Nations League in 2019, <a href=\"https://www.flashscore.com/team/portugal/WvJrjFVN/\">Portugal</a> have cemented their place among the elite of continental football this century.</p><p>They haven\'t missed the group stage of a major competition since 2002 and, despite some mixed results at the World Cups, they haven\'t failed at the European Championships, always making it past the group stage.</p><p>It is also in continental competitions that the national team has experienced its greatest disappointments and its greatest joys.</p><p>Platini\'s extra-time goal in the semi-finals of EURO 1984, Zidane\'s penalty in 2000, which left Portugal on the brink of history, and Andreas Charisteas\' header in the 2004 final, which silenced a packed Estadio da Luz, were all left behind when Eder decided to kick a ball from the edge of the box and put it beyond the reach of Hugo Lloris in the 2016 final.</p>', '2024-06-17', 10, 1, '2024-06-17 09:40:55', '2024-06-17 09:40:55'),
(62, 208, 'Mbappe rules out returning to Paris to play in Olympics after Real Madrid move', '<p><strong>Kylian Mbappe (25) confirmed on Sunday he will not play for France\'s Olympic team at the Paris Games as his new club Real Madrid are against the idea.</strong></p><p>The 25-year-old said in March that he was keen on playing at his home Games but since the Olympic tournament is not on FIFA’s calendar, clubs are not obliged to release their players.</p><p><a href=\"https://www.flashscore.com/player/mbappe-kylian/Wn6E2SED/\">Mbappe</a> was not included in a 25-man preliminary squad for the Olympics earlier this month, though head coach Thierry Henry left the door open.</p><p><strong>\"My club\'s position was very clear, so from that moment on, I think I (knew) I won\'t be taking part in the Games,\"</strong> Mbappe told reporters ahead of Monday\'s Group D match against Austria at Euro 2024.</p><p><strong>\"That\'s just the way it is, and I understand that too. I\'m joining a new team in September, so it\'s not the best way to start an adventure.</strong></p><p><strong>\"I\'m going to wish this French team all the best. I\'m going to watch every game. I hope they\'ll win the gold medal.\"</strong></p><p>The men\'s Olympic football competition begins on July 24, 10 days after the European Championships final, and ends on August 9.</p>', '2024-06-17', 10, 1, '2024-06-17 09:43:16', '2024-06-17 09:43:16'),
(63, 209, 'Bellingham heads England to opening Euro victory over Serbia', '<p><strong>Jude Bellingham’s first-half header proved the difference in Gelsenkirchen, as pre-tournament favourites England got off to a tension-packed start at Euro 2024, withstanding heavy second-half pressure from a spirited Serbia side to run out 1-0 winners.</strong></p><p>Finalists in 2021, Gareth Southgate’s charges enjoyed a dominant first 10 minutes with a sizable English contingent in full voice, and they deservedly drew first blood just short of the quarter-hour mark.</p><p><a href=\"https://www.flashscore.com/player/saka-bukayo/08NLEo06/\">Bukayo Saka</a> tormented the Serbians down the right throughout the first half, and after being released by <a href=\"https://www.flashscore.com/player/walker-kyle/QeLg6KGD/\">Kyle Walker</a>, his cross was fortuitously deflected into the path of <a href=\"https://www.flashscore.com/player/bellingham-jude/QNvlPm7s/\">Bellingham</a>, who arrived at the perfect time to power a header into the top corner.</p><p><a href=\"https://www.flashscore.com/team/serbia/8Kl6iq0i/\">Serbia</a> had barely had a kick before conceding the opener, but they were almost gifted a highly unlikely equaliser on the 20-minute mark.</p><p><a href=\"https://www.flashscore.com/player/alexander-arnold-trent/CEVJy6Bc/\">Trent Alexander-Arnold</a>, who was selected in midfield alongside <a href=\"https://www.flashscore.com/player/rice-declan/zkQ8Cm6n/\">Declan Rice</a>, sloppily lost possession in his own third and <a href=\"https://www.flashscore.com/player/mitrovic-aleksandar/OYOr8rkm/\">Aleksandar Mitrović</a> let fly from the edge of the area, but his strike whistled wide of <a href=\"https://www.flashscore.com/player/pickford-jordan/SKTJdUtH/\">Jordan Pickford</a>’s goal.</p><p>The <a href=\"https://www.flashscore.com/team/crystal-palace/AovF1Mia/\">Eagles</a> certainly established more of a foothold from that point onwards, but clear-cut chances remained at a premium, though <a href=\"https://www.flashscore.com/team/england/j9N9ZNFA/\">England</a> themselves struggled for openings up to half-time.</p><p>That meant the contest sat finely poised at the interval, and Dragan Stojkovic’s men emerged a changed force after the break.</p>', '2024-06-17', 10, 1, '2024-06-17 09:45:13', '2024-06-17 09:45:13'),
(64, 210, 'Tennis Tracker: Dimitrov getting Queen\'s underway, Medvedev in action in Halle', '<p><strong>It\'s one of the biggest days of the grass-court season with Queen\'s and Halle getting underway along with WTA tournaments in Berlin and Birmingham.</strong></p><p><strong>10:00 CET -&nbsp;</strong>Hello and welcome to Flashscore\'s coverage of today\'s tennis!</p>', '2024-06-17', 3, 1, '2024-06-17 10:06:11', '2024-06-17 10:06:12'),
(65, 211, 'Aryna Sabalenka to skip Paris Olympics to focus on hardcourt swing', '<p><strong>World number three Aryna Sabalenka (26) will not play at the Paris Olympics in order to focus on her health and prepare for the hardcourt tournaments, the twice Grand Slam champion said on Monday.</strong></p><p>The Belarusian won the Australian Open in January, but was knocked out by 17-year-old Russian <a href=\"https://www.flashscore.com/player/andreeva-mirra/lI6fOOat/\">Mirra Andreeva</a> in the French Open quarter-finals this month.</p><p>\"<strong>Especially with all the struggles I\'ve been struggling with the last months, I feel I have to take care of my health</strong>,\" <a href=\"https://www.flashscore.com/player/sabalenka-aryna/vyhksgUB/\">Sabalenka</a> told reporters at the Berlin Ladies Open.</p>', '2024-06-17', 3, 1, '2024-06-17 14:43:43', '2024-06-17 14:43:43'),
(66, 212, 'Rafael Nadal to skip upcoming Wimbledon to prepare for Paris Olympics', '<p><strong>Rafael Nadal (38) will skip Wimbledon in July in order to prepare for the Olympic Games in Paris which will be played on the clay courts at Roland Garros, the Spaniard said on Thursday.</strong></p><p><a href=\"https://www.flashscore.com/player/nadal-rafael/xUwlUnRK/\">Nadal</a>, a record 14-times winner of the French Open, has been far from his best after returning from injuries and he exited the tournament at Roland Garros in the first round this year, losing in straight sets to eventual runner-up Alexander Zverev.</p><p>He missed almost all of 2023 with a hip problem and his comeback earlier this year was stalled by a muscle tear before small niggles affected his preparation for the claycourt major.</p><p><strong>\"During my post-match press conference at Roland Garros, I was asked about my summer calendar and since then I have been practising on clay. It was announced yesterday that I will play at the summer Olympics in Paris, my last Olympics,\" </strong>Nadal said.</p><p><strong>\"With this goal, we believe that the best for my body is not to change surface and keep playing on clay until then. It\'s for this reason that I will miss playing at the championships this year at Wimbledon.</strong></p><p>\"I am saddened not to be able to live this year the great atmosphere of that amazing event that will always be in my heart, and be with all the British fans that always gave me great support. I will miss you all.\"</p><p><br>&nbsp;</p>', '2024-06-13', 12, 1, '2024-06-17 14:53:11', '2024-06-17 14:53:11'),
(67, 215, 'Wael Arakji named Basketball Champions League Asia 2024 MVP', '<p>DUBAI (UAE) - Wael Arakji performed phenomenally at the Basketball Champions League Asia 2024 to be awarded as MVP and get Al Riyadi their title.<br>Arakji had his best game of the competition in the Final where he poured in 31 points including 22 in the third quarter. Arakji also finished the title-clinching game with 9 assists and only one turnover while shooting 11-13 from the field and making 6 three-pointers. The 29-year-old led the competition in assists with 42 in total.</p><p>For the tournament, he averaged 21.0 points on 75.5 percent field-goal shooting and 71.4 percent three-point shooting to go with 4.0 rebounds and 8.4 assists per game.</p><p>Earlier in the Semi-Finals, he dished out a tournament-high 14 assists against the Hiroshima Dragonflies.</p><p>Arakji was also the TISSOT MVP of FIBA Asia Cup 2022 where Lebanon finished in second.</p><p>Arakji was joined on the Tournament Top Five by Riyadi teammate Thon Maker, Marcus Georges-Hunt and Travin Thibodeaux from Shabab Al Ahli, and Sina Vahedi from Shahrdary Gorgan.</p>', '2024-06-15', 2, 1, '2024-06-17 15:08:42', '2024-06-17 15:11:39'),
(68, 214, 'Riyadi win first-ever BCL Asia with tournament-high points and three-pointers in title game', '<p>DUBAI (UAE) - Al Riyadi complete a dominating run to win the first-ever BCL Asia, 122-96, over host Shabab Al Ahli on June 15 at the sold-out Sheikh Saeed Bin Maktoum Sports Hall.</p><p>The title victory also means <a href=\"https://www.fiba.basketball/news/fiba-intercontinental-cup-global-expansion-peaks-with-inclusion-of-oceania\">Al Riyadi have now booked a ticket to the FIBA Intercontinental Cup 2024 as a representative of Asia</a>.</p><p>This is Al Riyadi\'s third title in Asia\'s flagship club competition, having won the Asia Champions Cup in 2011 and 2017.</p><p>The drums and cheers of the supporters for both squads were at war even before tip-off creating a loud atmosphere in the first-ever BCL Asia championship game.</p><p>Marcus Georges-Hunt came out of the gates on fire, scoring 13 points in the first quarter alone. Riyadi were prepared, however, as their two stars Asia Cup 2022 TISSOT MVP Wael Arakji and WASL Final 8 MVP Thon Maker combined for 15 points in the first period.</p><p>Maker continued his dominance in the second quarter, adding on 14 more point to total for 22 points in the first half. Early in that quarter, Shabab Al Ahli sprung a run by bring in Sir\'Dominic Pointer off the bench. This resulted in the hosts going up 41-34 after two back-to-back threes from Hamid Lateef.</p><p>Then came the run.</p><p>Powered by Maker\'s advantage inside and three-pointers by Amir Saoud, Riyadi went on a 13-1 run leading towards the end of the half. Shabab Al Ahli tried to respond with big three-pointers from both Pointer and Mohammad Alajmani, but Riyadi always had a counter.</p><p>First, it was a showtime throw down by Hayk Gyokchyan, but the piercing dagger was a near full-court heave by Zach Lofton that beat the halftime buzzer by mere fractions of a second to keep the deficit at nine points in favor of Riyadi.</p><p>Lofton continued by knocking down Riyadi\'s first three-pointer of the second half, setting the tone for the squad building up their lead up until the final buzzer. Arakji added on five more consecutive points, eventually leading to a 13-0 run that more or less sealed the deal for the eventual champions.</p><p>If the early run in the second half wasn\'t enough of a blow to Shabab Al Ahli\'s hope, Arakji\'s four consecutive three-pointers in the span of two minutes to close out a massive 44-16 quarter.</p><p>All right players fielded got on the scoreboard for Riyadi led by Wael Arakji who scored 31 points on 11-13 shooting to go with 9 assists.</p><p>Sir\'Dominic Pointer led Shabab Al Ahli in scoring with 25 points while also getting 7 rebounds and 9 assists.</p><p><strong>Turning Point: </strong>It\'s tough to pick a defining moment for Riyadi in this championship game. Lofton\'s buzzer-beater at halftime certainly dampened the hopes of Shabab Al Ahli heading into the locker room, but Arakji\'s spitfire three-point shooting at the end of the third quarter was just as heartbreaking for the hosts.</p>', '2024-06-15', 2, 1, '2024-06-17 15:11:07', '2024-06-17 15:11:07'),
(69, 216, 'Manila welcomes eight strong teams as race for VNL Finals heats up', '<p>Brazil, Canada, France, Germany, Iran, Japan, Netherlands and USA to play their third VNL competition week in the Filipino capital<br><br>Eight of the world’s strongest men’s volleyball national teams - Brazil, Canada, France, Germany, Iran, Japan, the Netherlands and the United States – have arrived in Manila to delight the Filipino fans with their matches in competition week three of the men’s 2024 Volleyball Nations League Preliminary Phase, at the end of which all the participants in next week’s VNL Finals in Lodz, Poland will be known. With six of these teams already booked for the Paris 2024 Olympics and one running a distant shot at qualifying, the spotlights in Manila will fall mainly on the heated race for the berths in the VNL quarterfinals.</p>', '2024-06-17', 5, 1, '2024-06-17 15:36:13', '2024-06-17 15:36:13'),
(70, 217, 'Formula 1 Focus: Mercedes join the mix as mayhem reigns in Montreal', '<p><strong>There\'s always plenty to talk about in the non-stop world of Formula 1 and Flashscore\'s Finley Crebolder gives his thoughts on the biggest stories going around the paddock in this regular column.</strong></p><p>Well, that was fun, wasn\'t it?&nbsp;</p><p>The Canadian Grand Prix has always been one of my favourites on the calendar, partly because the famous race of 2011 was one that really cemented my love affair with F1, and as was the case back then, a rainy Montreal treated us to some marvellous mayhem this year.</p><p>While the roles were reversed with a Red Bull beating a McLaren to the win this time around rather than vice-versa, it wasn\'t a <a href=\"https://www.flashscore.com/player/verstappen-max/UV3mgeXB/\">Max Verstappen</a> win that we\'ve grown so tired of seeing, with the Dutchman having to produce his brilliant best to claim victory.&nbsp;</p><p>Here are my main takeaways from round nine of the Formula 1 season.&nbsp;</p><h2>Mercedes upgrades make it a four-way fight</h2><p>Life was already getting harder for Red Bull with Ferrari and McLaren closing in, and not even the Italian team having an off-weekend eased the pressure on the reigning champions in round nine, because in Canada, the Silver Arrows joined the hunt.</p><p>Mercedes brought a new front wing to Montreal, one that they hoped would stabilise their temperamental car and make it easier to find the right setup, and boy did it work. <a href=\"https://www.flashscore.com/player/russell-george/xxF56RaN/\">George Russell</a> claimed pole position and he and teammate <a href=\"https://www.flashscore.com/player/hamilton-lewis/tI5Vpe1h/\">Lewis Hamilton</a> were the two fastest drivers for most of the weekend.</p>', '2024-06-10', 6, 1, '2024-06-17 15:48:26', '2024-06-17 15:48:26'),
(71, 218, 'Sergio Perez apologises after Canadian weekend to forget', '<p><strong>Red Bull\'s Sergio Perez (34) has apologised after a second successive retirement in Canada on Sunday left the Mexican 87 points behind triple Formula One champion, team mate and race winner Max Verstappen (26).</strong></p><p><a href=\"https://www.flashscore.com/player/perez-sergio/foV8RteD/\">Perez</a> remained fifth overall in the world championship and a point behind Ferrari\'s <a href=\"https://www.flashscore.com/player/sainz-carlos-jr/l6kEzjTF/\">Carlos Sainz</a>, who also failed to finish as did his teammate and <a href=\"https://www.flashscore.com/player/verstappen-max/UV3mgeXB/\">Verstappen</a>\'s closest rival <a href=\"https://www.flashscore.com/player/leclerc-charles/KlCOSRub/\">Charles Leclerc</a> in a big blow for the Italian outfit.</p><p><strong>\"I\'m very sorry for my team, I let them down today. But we will come back no doubt. There’s a very long way to go,\" Perez, who has scored only four points from the last three races, said on social media.</strong></p>', '2024-06-10', 6, 1, '2024-06-17 15:50:38', '2024-06-17 15:50:38'),
(72, 219, 'Kolisi to miss Twickenham Test as weakened Springboks face Wales', '<p><strong>South Africa captain Siya Kolisi (32) is one of 12 players from the matchday 23 who won the Rugby World Cup last year who will not be considered for a one-off Test against Wales at Twickenham on June 22nd, SA Rugby announced on Sunday.</strong></p><p>Just 11 of the side that edged <a href=\"https://www.flashscore.com/team/new-zealand/6kV5bUef/\">New Zealand</a> 12-11 at the Stade de France in October will be available after injuries, club commitments and retirement ruled out the other 12.</p><p><strong>\"Players based in Europe, the UK and Ireland will not be considered for the Boks\' first Test of the season against </strong><a href=\"https://www.flashscore.com/team/wales/bgcmqxS1/\"><strong>Wales</strong></a><strong> at Twickenham,\"</strong> SA Rugby said in a statement.</p><p>Kolisi moved to Paris after the World Cup triumph to join <a href=\"https://www.flashscore.com/team/racing-92/Kb8M6OUo/\">Racing 92</a> who on Saturday qualified for next week\'s Top 14 play-offs, with the semi-finals on the same weekend as the Wales Test.</p><p>The match is taking place outside the international window so teams beyond <a href=\"https://www.flashscore.com/team/south-africa/bHmPcrZk/\">South Africa</a> do not have to release players.</p><p>With the Japanese season completed, however, eight South Africans based there were selected by head coach Rassie Erasmus on Sunday.</p>', '2024-06-09', 8, 1, '2024-06-17 15:59:31', '2024-06-17 15:59:31'),
(73, 220, 'Fly-half Ford ruled out of England\'s summer tour due to Achilles injury', '<p><strong>George Ford (31) has been ruled out of England\'s tour to Japan and New Zealand because of an Achilles injury, rugby chiefs announced on Sunday.</strong></p><p>Ford started at fly-half throughout this year\'s Six Nations but, having completed the club season with <a href=\"https://www.flashscore.com/team/sale-sharks/2H6cWQkf/\">Sale</a>, it has been decided he needs time to recover from the pre-existing condition.</p><p><strong>\"Naturally we\'re disappointed that George won\'t be with us in Japan and New Zealand, but, following specialist medical advice, and in consultation with George himself, we have decided this is the best course of action,\" </strong>said <a href=\"https://www.flashscore.com/team/england/SlDs7uK8/\">England</a> head coach Steve Borthwick.</p><p><strong>\"George is a big part of the England team and is an excellent professional who I know will rehab diligently to ensure he gets himself right as soon as he can.\"</strong></p>', '2024-06-09', 8, 1, '2024-06-17 16:02:13', '2024-06-17 16:02:13'),
(74, 221, 'THIS IS ME: KAROLINA KUDLACZ-GLOC', '<p>In 2006, Polish back Karolina Kudlacz-Gloc broke the individual record for most goals scored in one EHF EURO match — 17, and still stands atop that ranking joint with Swede Nathalie Hagman. In 2024, her season total of 91 goals in the EHF Champions League had her among the top scorers of the competition. A consistent career like hardly any other and no sign of slowing down yet for the 39-year-old, who is still breaking stereotypes. She spoke with us ahead of the quarter-finals, just a few weeks before making her first appearance in an EHF Champions League final, with SG BBM Bietigheim.</p>', '2024-06-17', 7, 1, '2024-06-17 16:06:42', '2024-06-17 16:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `news_tags`
--

CREATE TABLE `news_tags` (
  `news_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_tags`
--

INSERT INTO `news_tags` (`news_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, NULL),
(16, 2, NULL, NULL),
(39, 2, NULL, NULL),
(40, 1, NULL, NULL),
(41, 1, NULL, NULL),
(42, 1, NULL, NULL),
(44, 3, NULL, NULL),
(45, 3, NULL, NULL),
(46, 4, NULL, NULL),
(47, 4, NULL, NULL),
(48, 4, NULL, NULL),
(49, 4, NULL, NULL),
(50, 4, NULL, NULL),
(51, 5, NULL, NULL),
(52, 5, NULL, NULL),
(53, 5, NULL, NULL),
(54, 5, NULL, NULL),
(58, 6, NULL, NULL),
(59, 6, NULL, NULL),
(60, 6, NULL, NULL),
(61, 6, NULL, NULL),
(62, 6, NULL, NULL),
(63, 3, NULL, NULL),
(64, 6, NULL, NULL),
(65, 1, NULL, NULL),
(66, 2, NULL, NULL),
(67, 2, NULL, NULL),
(68, 2, NULL, NULL),
(69, 4, NULL, NULL),
(70, 4, NULL, NULL),
(71, 5, NULL, NULL),
(72, 6, NULL, NULL),
(73, 6, NULL, NULL),
(74, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `title`, `guard_name`, `created_at`, `updated_at`) VALUES
(14, 'create_news', 'Create News', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04'),
(15, 'edit_news', 'Edit News', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04'),
(16, 'delete_news', 'Delete News', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04'),
(17, 'create_tags', 'Create Tags', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04'),
(18, 'edit_tags', 'Edit Tags', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04'),
(19, 'delete_tags', 'Delete Tags', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04'),
(20, 'create_categories', 'Create Categories', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04'),
(21, 'edit_categories', 'Edit Categories', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04'),
(22, 'delete_categories', 'Delete Categories', 'web', '2024-06-04 09:25:04', '2024-06-04 09:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(6, 'Super Admin', 'web', '2024-06-04 09:24:15', '2024-06-04 09:24:15'),
(7, 'Admin', 'web', '2024-06-04 09:24:16', '2024-06-04 09:24:16'),
(8, 'Member', 'web', '2024-06-04 09:24:16', '2024-06-04 09:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(14, 6),
(14, 7),
(14, 8),
(15, 6),
(15, 7),
(15, 8),
(16, 6),
(16, 7),
(16, 8),
(17, 6),
(17, 7),
(17, 8),
(18, 6),
(18, 7),
(18, 8),
(19, 6),
(19, 7),
(19, 8),
(20, 6),
(20, 7),
(20, 8),
(21, 6),
(21, 7),
(21, 8),
(22, 6),
(22, 7),
(22, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Main Carousel', '2024-05-25 10:32:32', '2024-06-15 11:12:11'),
(2, 'Secondary News', '2024-05-25 10:32:32', '2024-06-15 11:12:30'),
(3, 'Announcement', '2024-05-25 10:32:32', '2024-06-15 11:12:39'),
(4, 'Featured News', '2024-06-15 13:14:17', '2024-06-15 13:14:17'),
(5, 'Latest News', '2024-06-16 13:41:24', '2024-06-16 13:41:24'),
(6, 'Trending News', '2024-06-16 15:27:20', '2024-06-16 15:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_super_admin`, `role_id`, `last_login_date`, `profile_picture`) VALUES
(1, 'Joey', 'john.doe@example.com', '$2y$12$2YjuDyI2HRQK738.ARTkW.TLNluLkVQmnHDt2Iu621ORlA9UmnfF.', NULL, '2024-05-23 14:14:12', '2024-06-19 12:11:58', 1, 6, '2024-06-19 12:11:58', 'profile_pictures/d58Du3Nxh6aimPNolTlhBvuh2kgyVLvvjtiuHowD.jpg'),
(2, 'joey', 'joey@example.com', '$2y$12$jCK2dowg7ly9qYCTO7ejIOyZwi/AhtM8yaAxAZB5X/jIfqkXNx/NK', NULL, '2024-06-01 08:42:39', '2024-06-10 23:09:54', 0, 7, '2024-06-10 23:09:54', NULL),
(23, 'jimmy', 'jimmy@example.com', '$2y$12$xlUJBqJqD6YhGSxPUXVwU.p1inJF3GFvnFM9PtfTkBYe55LOdSft2', NULL, '2024-06-10 23:44:25', '2024-06-19 12:11:17', 0, 8, '2024-06-19 12:11:17', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_category_id_foreign` (`category_id`);

--
-- Indexes for table `news_tags`
--
ALTER TABLE `news_tags`
  ADD PRIMARY KEY (`news_id`,`tag_id`),
  ADD KEY `news_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_tags`
--
ALTER TABLE `news_tags`
  ADD CONSTRAINT `news_tags_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
