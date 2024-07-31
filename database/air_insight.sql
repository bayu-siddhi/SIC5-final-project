-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2024 at 03:28 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `air_insight`
--

-- --------------------------------------------------------

--
-- Table structure for table `air_quality`
--

CREATE TABLE `air_quality` (
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `temperature` double NOT NULL,
  `humidity` double NOT NULL,
  `mq2` int(11) NOT NULL,
  `mq135` int(11) NOT NULL,
  `category` enum('BAIK','SEDANG','TIDAK SEHAT') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `air_quality`
--

INSERT INTO `air_quality` (`timestamp`, `temperature`, `humidity`, `mq2`, `mq135`, `category`) VALUES
('2024-07-31 00:50:04', 30.8, 66, 491, 1054, 'SEDANG'),
('2024-07-31 00:50:09', 30.8, 66, 492, 1052, 'SEDANG'),
('2024-07-31 00:50:14', 30.8, 66, 491, 1050, 'SEDANG'),
('2024-07-31 00:50:19', 30.8, 66, 487, 1047, 'SEDANG'),
('2024-07-31 00:50:24', 30.8, 65, 487, 1045, 'SEDANG'),
('2024-07-31 00:50:29', 30.8, 65, 488, 1045, 'SEDANG'),
('2024-07-31 00:50:34', 30.8, 65, 478, 1032, 'BAIK'),
('2024-07-31 00:50:39', 30.8, 65, 487, 1043, 'SEDANG'),
('2024-07-31 00:50:44', 30.8, 65, 487, 1044, 'SEDANG'),
('2024-07-31 00:50:49', 30.8, 65, 485, 1044, 'SEDANG'),
('2024-07-31 00:50:54', 30.8, 65, 485, 1045, 'SEDANG'),
('2024-07-31 00:50:59', 30.8, 65, 484, 1044, 'SEDANG'),
('2024-07-31 00:51:04', 30.8, 65, 485, 1041, 'SEDANG'),
('2024-07-31 00:51:09', 30.8, 65, 485, 1043, 'SEDANG'),
('2024-07-31 00:51:14', 30.8, 65, 484, 1041, 'SEDANG'),
('2024-07-31 00:51:19', 30.8, 65, 487, 1043, 'SEDANG'),
('2024-07-31 00:51:24', 31.2, 65, 488, 1043, 'SEDANG'),
('2024-07-31 00:51:29', 31.3, 65, 486, 1040, 'SEDANG'),
('2024-07-31 00:51:34', 31.3, 65, 483, 1053, 'SEDANG'),
('2024-07-31 00:51:39', 31.3, 65, 491, 1053, 'SEDANG'),
('2024-07-31 00:51:44', 31.3, 65, 490, 1048, 'SEDANG'),
('2024-07-31 00:51:49', 31.3, 65, 472, 1033, 'BAIK'),
('2024-07-31 00:51:55', 31.3, 65, 482, 1041, 'BAIK'),
('2024-07-31 00:52:00', 31.3, 65, 482, 1043, 'SEDANG'),
('2024-07-31 00:52:05', 31.3, 65, 483, 1045, 'SEDANG'),
('2024-07-31 00:52:10', 31.3, 65, 482, 1042, 'BAIK'),
('2024-07-31 00:52:15', 31.3, 64, 481, 1041, 'BAIK'),
('2024-07-31 00:52:20', 31.3, 64, 485, 1041, 'SEDANG'),
('2024-07-31 00:52:25', 31.3, 64, 482, 1040, 'BAIK'),
('2024-07-31 00:52:30', 31.3, 64, 480, 1039, 'BAIK'),
('2024-07-31 00:52:35', 31.3, 64, 482, 1039, 'BAIK'),
('2024-07-31 00:52:40', 31.3, 64, 482, 1037, 'BAIK'),
('2024-07-31 00:52:45', 31.3, 64, 482, 1037, 'BAIK'),
('2024-07-31 00:52:50', 31.3, 64, 482, 1040, 'BAIK'),
('2024-07-31 00:52:55', 31.3, 64, 481, 1036, 'BAIK'),
('2024-07-31 00:53:00', 31.3, 64, 481, 1037, 'BAIK'),
('2024-07-31 00:53:05', 31.3, 64, 467, 1029, 'BAIK'),
('2024-07-31 00:53:10', 31.3, 64, 482, 1031, 'BAIK'),
('2024-07-31 00:53:15', 31.3, 64, 483, 1041, 'SEDANG'),
('2024-07-31 00:53:20', 31.3, 64, 479, 1042, 'BAIK'),
('2024-07-31 00:53:25', 31.3, 64, 481, 1043, 'BAIK'),
('2024-07-31 00:53:30', 31.3, 64, 483, 1038, 'BAIK'),
('2024-07-31 00:53:35', 31.3, 64, 483, 1041, 'SEDANG'),
('2024-07-31 00:53:40', 31.3, 64, 478, 1038, 'BAIK'),
('2024-07-31 00:53:45', 31.3, 64, 482, 1041, 'BAIK'),
('2024-07-31 00:53:50', 31.3, 64, 483, 1036, 'BAIK'),
('2024-07-31 00:53:55', 31.3, 64, 477, 1040, 'BAIK'),
('2024-07-31 00:54:00', 31.3, 64, 477, 1036, 'BAIK'),
('2024-07-31 00:54:05', 31.3, 64, 482, 1037, 'BAIK'),
('2024-07-31 00:54:10', 31.3, 64, 480, 1034, 'BAIK'),
('2024-07-31 00:54:15', 31.3, 64, 471, 1026, 'BAIK'),
('2024-07-31 00:54:20', 31.3, 64, 470, 1024, 'BAIK'),
('2024-07-31 00:54:25', 31.3, 64, 482, 1042, 'BAIK'),
('2024-07-31 00:54:30', 31.3, 64, 487, 1042, 'SEDANG'),
('2024-07-31 00:54:35', 31.3, 64, 481, 1042, 'BAIK'),
('2024-07-31 00:54:41', 31.3, 64, 478, 1035, 'BAIK'),
('2024-07-31 00:54:46', 31.3, 64, 482, 1030, 'BAIK'),
('2024-07-31 00:54:51', 31.3, 64, 477, 1033, 'BAIK'),
('2024-07-31 00:54:56', 31.3, 64, 476, 1033, 'BAIK'),
('2024-07-31 00:55:01', 31.3, 64, 478, 1036, 'BAIK'),
('2024-07-31 00:55:06', 31.3, 64, 481, 1027, 'BAIK'),
('2024-07-31 00:55:11', 31.3, 64, 477, 1031, 'BAIK'),
('2024-07-31 00:55:16', 31.3, 64, 479, 1036, 'BAIK'),
('2024-07-31 00:55:21', 31.3, 64, 477, 1034, 'BAIK'),
('2024-07-31 00:55:43', 31.3, 64, 458, 1002, 'BAIK'),
('2024-07-31 00:55:48', 31.3, 63, 472, 1019, 'BAIK'),
('2024-07-31 00:55:57', 31.3, 64, 459, 1008, 'BAIK'),
('2024-07-31 00:56:02', 31.3, 65, 469, 1025, 'BAIK'),
('2024-07-31 00:56:07', 31.3, 64, 469, 1025, 'BAIK'),
('2024-07-31 00:56:12', 31.3, 65, 468, 1021, 'BAIK'),
('2024-07-31 00:56:17', 31.3, 64, 466, 1027, 'BAIK'),
('2024-07-31 00:56:22', 31.3, 64, 466, 1026, 'BAIK'),
('2024-07-31 00:56:27', 31.3, 64, 466, 1024, 'BAIK'),
('2024-07-31 00:56:32', 31.3, 64, 461, 1019, 'BAIK'),
('2024-07-31 00:56:37', 31.3, 64, 464, 1024, 'BAIK'),
('2024-07-31 00:56:42', 31.3, 64, 465, 1024, 'BAIK'),
('2024-07-31 00:56:47', 31.3, 64, 467, 1023, 'BAIK'),
('2024-07-31 00:56:52', 31.3, 64, 470, 1030, 'BAIK'),
('2024-07-31 00:56:57', 31.3, 64, 470, 1027, 'BAIK'),
('2024-07-31 00:57:02', 31.3, 64, 467, 1028, 'BAIK'),
('2024-07-31 00:57:07', 31.3, 64, 467, 1028, 'BAIK'),
('2024-07-31 00:57:12', 31.3, 64, 471, 1030, 'BAIK'),
('2024-07-31 00:57:17', 31.3, 64, 461, 1014, 'BAIK'),
('2024-07-31 00:57:22', 31.3, 64, 469, 1030, 'BAIK'),
('2024-07-31 00:57:27', 31.3, 64, 471, 1029, 'BAIK'),
('2024-07-31 00:57:33', 31.3, 64, 471, 1027, 'BAIK'),
('2024-07-31 00:57:38', 31.3, 64, 469, 1031, 'BAIK'),
('2024-07-31 00:57:43', 31.3, 64, 472, 1025, 'BAIK'),
('2024-07-31 00:57:48', 31.3, 64, 466, 1026, 'BAIK'),
('2024-07-31 00:57:53', 31.3, 64, 467, 1030, 'BAIK'),
('2024-07-31 00:57:58', 31.3, 64, 475, 1034, 'BAIK'),
('2024-07-31 00:58:03', 31.3, 65, 477, 1032, 'BAIK'),
('2024-07-31 00:58:08', 31.3, 65, 477, 1040, 'BAIK'),
('2024-07-31 00:58:13', 31.3, 65, 480, 1034, 'BAIK'),
('2024-07-31 00:58:18', 31.3, 65, 477, 1044, 'BAIK'),
('2024-07-31 00:58:23', 31.3, 65, 476, 1038, 'BAIK'),
('2024-07-31 00:58:28', 31.3, 65, 475, 1034, 'BAIK'),
('2024-07-31 00:58:33', 31.3, 65, 464, 1020, 'BAIK'),
('2024-07-31 00:58:38', 31.3, 64, 468, 1029, 'BAIK'),
('2024-07-31 00:58:43', 31.3, 64, 471, 1035, 'BAIK'),
('2024-07-31 00:58:48', 31.3, 64, 474, 1030, 'BAIK'),
('2024-07-31 00:58:53', 31.3, 64, 468, 1028, 'BAIK'),
('2024-07-31 00:58:58', 31.3, 64, 472, 1030, 'BAIK'),
('2024-07-31 00:59:03', 31.3, 64, 471, 1026, 'BAIK'),
('2024-07-31 00:59:08', 31.3, 64, 469, 1029, 'BAIK'),
('2024-07-31 00:59:13', 31.3, 64, 472, 1029, 'BAIK'),
('2024-07-31 00:59:18', 31.3, 64, 472, 1030, 'BAIK'),
('2024-07-31 00:59:23', 31.3, 64, 471, 1026, 'BAIK'),
('2024-07-31 00:59:28', 31.3, 64, 468, 1026, 'BAIK'),
('2024-07-31 00:59:33', 31.3, 64, 463, 1023, 'BAIK'),
('2024-07-31 00:59:38', 31.3, 64, 470, 1024, 'BAIK'),
('2024-07-31 00:59:43', 31.3, 64, 463, 1026, 'BAIK'),
('2024-07-31 00:59:48', 31.3, 64, 456, 1014, 'BAIK'),
('2024-07-31 00:59:53', 31.3, 64, 471, 1028, 'BAIK'),
('2024-07-31 00:59:58', 31.3, 64, 472, 1033, 'BAIK'),
('2024-07-31 01:00:03', 31.3, 64, 468, 1032, 'BAIK'),
('2024-07-31 01:00:08', 31.3, 64, 470, 1030, 'BAIK'),
('2024-07-31 01:00:13', 31.3, 64, 470, 1030, 'BAIK'),
('2024-07-31 01:00:19', 31.3, 64, 469, 1034, 'BAIK'),
('2024-07-31 01:00:24', 31.3, 64, 472, 1028, 'BAIK'),
('2024-07-31 01:00:29', 31.3, 64, 469, 1030, 'BAIK'),
('2024-07-31 01:00:34', 31.3, 64, 471, 1030, 'BAIK'),
('2024-07-31 01:00:39', 31.3, 64, 468, 1030, 'BAIK'),
('2024-07-31 01:00:44', 31.3, 64, 469, 1033, 'BAIK'),
('2024-07-31 01:00:49', 31.3, 64, 469, 1029, 'BAIK'),
('2024-07-31 01:00:54', 31.3, 64, 472, 1037, 'BAIK'),
('2024-07-31 01:00:59', 31.3, 64, 467, 1029, 'BAIK'),
('2024-07-31 01:01:04', 31.3, 64, 459, 1019, 'BAIK'),
('2024-07-31 01:01:09', 31.3, 64, 466, 1032, 'BAIK'),
('2024-07-31 01:01:14', 31.3, 64, 466, 1031, 'BAIK'),
('2024-07-31 01:01:19', 31.3, 64, 468, 1030, 'BAIK'),
('2024-07-31 01:01:24', 31.3, 64, 466, 1031, 'BAIK'),
('2024-07-31 01:01:29', 31.3, 64, 466, 1029, 'BAIK'),
('2024-07-31 01:01:34', 31.3, 64, 466, 1030, 'BAIK'),
('2024-07-31 01:01:39', 31.3, 64, 471, 1030, 'BAIK'),
('2024-07-31 01:01:44', 31.3, 64, 465, 1027, 'BAIK'),
('2024-07-31 01:01:49', 31.3, 64, 464, 1027, 'BAIK'),
('2024-07-31 01:01:54', 31.3, 64, 469, 1030, 'BAIK'),
('2024-07-31 01:01:59', 31.3, 64, 465, 1029, 'BAIK'),
('2024-07-31 01:02:04', 31.3, 64, 467, 1028, 'BAIK'),
('2024-07-31 01:02:09', 31.3, 64, 469, 1034, 'BAIK'),
('2024-07-31 01:02:14', 31.3, 64, 466, 1030, 'BAIK'),
('2024-07-31 01:02:19', 31.3, 64, 458, 1016, 'BAIK'),
('2024-07-31 01:02:24', 31.3, 64, 467, 1029, 'BAIK'),
('2024-07-31 01:02:29', 31.3, 64, 466, 1025, 'BAIK'),
('2024-07-31 01:02:34', 31.3, 63, 466, 1025, 'BAIK'),
('2024-07-31 01:02:39', 31.3, 63, 462, 1026, 'BAIK'),
('2024-07-31 01:02:44', 31.3, 63, 463, 1024, 'BAIK'),
('2024-07-31 01:02:49', 31.3, 63, 464, 1027, 'BAIK'),
('2024-07-31 01:02:54', 31.3, 63, 469, 1030, 'BAIK'),
('2024-07-31 01:02:59', 31.3, 63, 464, 1027, 'BAIK'),
('2024-07-31 01:03:04', 31.3, 63, 463, 1023, 'BAIK'),
('2024-07-31 01:03:10', 31.3, 63, 466, 1029, 'BAIK'),
('2024-07-31 01:03:15', 31.3, 63, 466, 1025, 'BAIK'),
('2024-07-31 01:03:20', 31.3, 63, 463, 1024, 'BAIK'),
('2024-07-31 01:03:25', 31.3, 63, 466, 1025, 'BAIK'),
('2024-07-31 01:03:30', 31.3, 63, 464, 1023, 'BAIK'),
('2024-07-31 01:03:35', 31.3, 63, 454, 1010, 'BAIK'),
('2024-07-31 01:03:40', 31.3, 63, 466, 1022, 'BAIK'),
('2024-07-31 01:03:45', 31.3, 63, 469, 1022, 'BAIK'),
('2024-07-31 01:03:50', 31.3, 63, 466, 1021, 'BAIK'),
('2024-07-31 01:03:55', 31.3, 63, 463, 1024, 'BAIK'),
('2024-07-31 01:04:00', 31.3, 63, 464, 1029, 'BAIK'),
('2024-07-31 01:04:05', 31.3, 63, 464, 1027, 'BAIK'),
('2024-07-31 01:04:10', 31.3, 63, 466, 1032, 'BAIK'),
('2024-07-31 01:04:15', 31.3, 63, 463, 1026, 'BAIK'),
('2024-07-31 01:04:20', 31.3, 63, 464, 1025, 'BAIK'),
('2024-07-31 01:04:25', 31.3, 63, 468, 1029, 'BAIK'),
('2024-07-31 01:04:30', 31.3, 63, 471, 1030, 'BAIK');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_desc` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `published_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `category`, `title`, `short_desc`, `content`, `image_url`, `published_at`) VALUES
(1, 'kesehatan', 'Pentingnya Udara Bersih untuk Kesehatan Anak', 'Udara bersih sangat penting untuk kesehatan anak, terutama dalam mencegah infeksi saluran pernapasan.', 'Udara bersih memainkan peran penting dalam menjaga kesehatan anak-anak. Anak-anak yang menghirup udara yang tercemar dapat mengalami berbagai masalah kesehatan, termasuk infeksi saluran pernapasan, asma, dan penyakit lainnya. Oleh karena itu, menjaga kualitas udara di rumah sangat penting, terutama di ruang-ruang tempat anak-anak menghabiskan banyak waktu.\r\n\r\nAda beberapa cara yang dapat dilakukan untuk memastikan udara di rumah tetap bersih. Salah satunya adalah dengan menggunakan alat pemurni udara yang dapat menyaring partikel berbahaya dan alergen dari udara. Selain itu, menjaga ventilasi yang baik di rumah dengan sering membuka jendela juga bisa membantu meningkatkan kualitas udara dalam ruangan.', 'https://www.higienis.com/media/wysiwyg/shutterstock_1626276463.webp', '2024-07-27 10:40:01'),
(2, 'kesehatan', 'Cara Meningkatkan Kualitas Udara di Rumah', 'Berbagai cara yang dapat dilakukan untuk meningkatkan kualitas udara di rumah demi kesehatan keluarga.', 'Meningkatkan kualitas udara di rumah adalah salah satu langkah penting dalam menjaga kesehatan seluruh anggota keluarga. Udara yang bersih dan segar dapat mengurangi risiko penyakit pernapasan dan alergi. Ada beberapa langkah sederhana yang bisa dilakukan untuk meningkatkan kualitas udara di rumah.\r\n\r\nPertama, pastikan rumah memiliki ventilasi yang baik. Membuka jendela secara teratur memungkinkan udara segar masuk dan membantu mengeluarkan polutan dari dalam rumah. Kedua, hindari penggunaan produk pembersih yang mengandung bahan kimia berbahaya. Pilihlah produk pembersih yang ramah lingkungan dan bebas dari bahan kimia berbahaya. Selain itu, menambahkan tanaman hias di dalam rumah juga dapat membantu menyaring udara dan menambah oksigen di dalam ruangan.', 'https://akcdn.detik.net.id/visual/2022/06/22/air-purifier-foto-instagramlevoit-philipines_169.jpeg?w=650', '2024-07-27 10:40:01'),
(3, 'kesehatan', 'Dampak Udara Kotor terhadap Anak-Anak', 'Udara kotor dapat memiliki dampak serius terhadap kesehatan anak-anak, termasuk masalah pernapasan dan perkembangan.', 'Udara yang tercemar dapat memiliki dampak serius pada kesehatan anak-anak. Anak-anak yang terpapar udara kotor dalam jangka panjang bisa mengalami berbagai masalah kesehatan, termasuk gangguan pernapasan, penurunan fungsi paru-paru, dan peningkatan risiko infeksi saluran pernapasan. Udara yang tercemar juga dapat mempengaruhi perkembangan fisik dan kognitif anak-anak.\r\n\r\nUntuk mengurangi dampak negatif udara kotor, penting bagi orang tua untuk mengambil langkah-langkah preventif. Salah satu langkah yang bisa diambil adalah memantau kualitas udara di sekitar rumah dan memastikan anak-anak bermain di area yang memiliki udara bersih. Selain itu, menghindari paparan asap rokok dan polusi kendaraan juga sangat penting untuk menjaga kesehatan pernapasan anak-anak.', 'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/106/2023/08/14/jacek-dylag-warzmoxd-q-unsplash-20230807031439-3248181686.jpg', '2024-07-27 10:40:01'),
(4, 'kesehatan', 'Dampak Udara Kotor terhadap Perkembangan Anak', 'Dampak udara kotor tidak hanya terbatas pada masalah pernapasan, tetapi juga mempengaruhi perkembangan fisik dan kognitif anak-anak.', 'Udara yang tercemar dapat berdampak buruk pada perkembangan anak-anak. Paparan jangka panjang terhadap polusi udara dapat menyebabkan masalah pernapasan yang kronis dan menghambat pertumbuhan fisik anak. Selain itu, penelitian menunjukkan bahwa udara kotor juga dapat mempengaruhi perkembangan kognitif anak, mengakibatkan penurunan kemampuan belajar dan konsentrasi.\r\n\r\nLangkah-langkah yang bisa diambil untuk melindungi anak dari dampak buruk udara kotor termasuk mengurangi waktu bermain di luar ruangan pada hari-hari dengan kualitas udara buruk, menggunakan alat pemurni udara di dalam rumah, dan memastikan rumah bebas dari asap rokok. Selain itu, orang tua juga bisa memantau tingkat polusi udara di daerah tempat tinggal mereka menggunakan aplikasi atau layanan pemantauan kualitas udara.', 'https://wri-indonesia.org/sites/default/files/styles/500x300/public/kristen-morith-IWpd8KixceA-unsplash.jpg?h=96c5019e&itok=3erTRaui', '2024-07-27 10:40:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `air_quality`
--
ALTER TABLE `air_quality`
  ADD PRIMARY KEY (`timestamp`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
