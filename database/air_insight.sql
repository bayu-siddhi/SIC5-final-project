-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2024 at 09:38 PM
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
  `mq136` int(11) NOT NULL,
  `category` enum('BAIK','SEDANG','TIDAK SEHAT') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
