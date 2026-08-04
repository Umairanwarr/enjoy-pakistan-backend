-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2026 at 07:26 PM
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
-- Database: `enjoy_pakistan_tour`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT 'admin',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@enjoypakistantour.com', '$2y$10$gdAFUlclml.REQ9joig40OvCcHFbUiM22lKZ6d0i4KTTAgBVMw9za', 'admin', '2026-08-02 05:57:40', '2026-08-02 05:57:40');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `item_type` enum('tour','car') NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('new','contacted','confirmed','cancelled') DEFAULT 'new',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `item_type`, `item_id`, `item_name`, `customer_name`, `customer_phone`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tour', 1, 'karachi visit', NULL, NULL, 'Hello, I\'m interested in booking the karachi visit.', 'new', '2026-08-02 06:02:38', '2026-08-02 06:02:38'),
(2, 'car', 1, 'car', NULL, NULL, 'Hello, I\'m interested in renting the car.', 'new', '2026-08-02 06:04:22', '2026-08-02 06:04:22'),
(3, 'car', 1, 'car', NULL, NULL, 'Hello, I\'m interested in renting the car.', 'new', '2026-08-02 06:04:58', '2026-08-02 06:04:58'),
(4, 'tour', 1, 'karachi visit', NULL, NULL, 'Hello, I\'m interested in booking the karachi visit.', 'new', '2026-08-02 06:07:00', '2026-08-02 06:07:00'),
(5, 'tour', 1, 'karachi visit', NULL, NULL, 'Hello, I\'m interested in booking the karachi visit.', 'new', '2026-08-02 06:07:52', '2026-08-02 06:07:52');

-- --------------------------------------------------------

--
-- Table structure for table `car_images`
--

CREATE TABLE `car_images` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_images`
--

INSERT INTO `car_images` (`id`, `car_id`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 1, '/uploads/cars/1785650650313-230073055.png', '2026-08-02 06:04:10', '2026-08-02 06:04:10'),
(2, 2, '/uploads/rent_cars/Altisblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(3, 3, '/uploads/rent_cars/Altiswhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(4, 4, '/uploads/rent_cars/Gliblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(5, 5, '/uploads/rent_cars/Gliwhite.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(6, 6, '/uploads/rent_cars/brvblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(7, 7, '/uploads/rent_cars/brvwhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(8, 8, '/uploads/rent_cars/civicblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(9, 9, '/uploads/rent_cars/civicwhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(10, 10, '/uploads/rent_cars/pradoblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(11, 11, '/uploads/rent_cars/pradowhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(12, 12, '/uploads/rent_cars/revoblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(13, 13, '/uploads/rent_cars/revowhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(14, 14, '/uploads/rent_cars/v8black.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(15, 15, '/uploads/rent_cars/v8white.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(16, 16, '/uploads/rent_cars/cabinblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(17, 17, '/uploads/rent_cars/cabinwhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(18, 18, '/uploads/rent_cars/coasterwhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(19, 2, '/uploads/cars/1785747608348-90923455.png', '2026-08-03 09:00:08', '2026-08-03 09:00:08'),
(20, 2, '/uploads/cars/1785748617423-234135192.png', '2026-08-03 09:16:57', '2026-08-03 09:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rental_cars`
--

CREATE TABLE `rental_cars` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT 'Sedan',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(255) DEFAULT NULL,
  `availability` enum('available','unavailable') DEFAULT 'available',
  `status` enum('active','inactive') DEFAULT 'active',
  `featured` tinyint(1) DEFAULT 0,
  `cover_image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rental_cars`
--

INSERT INTO `rental_cars` (`id`, `name`, `slug`, `description`, `location`, `category`, `price`, `duration`, `availability`, `status`, `featured`, `cover_image`, `created_at`, `updated_at`) VALUES
(1, 'car', 'car', 'qwertyui', 'islamabad', 'suv', 22.00, 'Per Day', 'available', 'active', 0, '/uploads/cars/1785650650313-230073055.png', '2026-08-02 06:04:10', '2026-08-02 06:04:10'),
(2, 'Toyota Corolla Altis - Black Edition', 'toyota-corolla-altis-black-edition', 'Toyota Corolla Altis available for rent with professional driver service.', 'Islamabad', 'Sedan', 10000.00, 'Per Day', 'available', 'active', 0, '/uploads/cars/1785748617423-234135192.png', '2026-08-02 11:40:28', '2026-08-03 09:16:57'),
(3, 'Toyota Corolla Altis - White Edition', 'toyota-corolla-altis-white-edition', 'Toyota Corolla Altis available for rent with professional driver service.', 'Islamabad', 'Sedan', 10000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/Altiswhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(4, 'Toyota Corolla GLi - Black Edition', 'toyota-corolla-gli-black-edition', 'Toyota Corolla GLi available for rent with professional driver service.', 'Islamabad', 'Sedan', 8500.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/Gliblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(5, 'Toyota Corolla GLi - White Edition', 'toyota-corolla-gli-white-edition', 'Toyota Corolla GLi available for rent with professional driver service.', 'Islamabad', 'Sedan', 8500.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/Gliwhite.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(6, 'Honda BRV - Black Edition', 'honda-brv-black-edition', 'Honda BRV available for rent with professional driver service.', 'Islamabad', 'Sedan', 9000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/brvblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(7, 'Honda BRV - White Edition', 'honda-brv-white-edition', 'Honda BRV available for rent with professional driver service.', 'Islamabad', 'Sedan', 9000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/brvwhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(8, 'Honda Civic - Black Edition', 'honda-civic-black-edition', 'Honda Civic available for rent with professional driver service.', 'Islamabad', 'Sedan', 11000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/civicblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(9, 'Honda Civic - White Edition', 'honda-civic-white-edition', 'Honda Civic available for rent with professional driver service.', 'Islamabad', 'Sedan', 11000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/civicwhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(10, 'Toyota Prado - Black Edition', 'toyota-prado-black-edition', 'Toyota Prado available for rent with professional driver service.', 'Islamabad', 'Sedan', 25000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/pradoblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(11, 'Toyota Prado - White Edition', 'toyota-prado-white-edition', 'Toyota Prado available for rent with professional driver service.', 'Islamabad', 'Sedan', 25000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/pradowhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(12, 'Toyota Revo - Black Edition', 'toyota-revo-black-edition', 'Toyota Revo available for rent with professional driver service.', 'Islamabad', 'Sedan', 18000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/revoblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(13, 'Toyota Revo - White Edition', 'toyota-revo-white-edition', 'Toyota Revo available for rent with professional driver service.', 'Islamabad', 'Sedan', 18000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/revowhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(14, 'Land Cruiser V8 - Black Edition', 'land-cruiser-v8-black-edition', 'Land Cruiser V8 available for rent with professional driver service.', 'Islamabad', 'Sedan', 40000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/v8black.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(15, 'Land Cruiser V8 - White Edition', 'land-cruiser-v8-white-edition', 'Land Cruiser V8 available for rent with professional driver service.', 'Islamabad', 'Sedan', 40000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/v8white.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(16, 'Grand Cabin - Black Edition', 'grand-cabin-black-edition', 'Grand Cabin available for rent with professional driver service.', 'Islamabad', 'Sedan', 15000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/cabinblack.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(17, 'Grand Cabin - White Edition', 'grand-cabin-white-edition', 'Grand Cabin available for rent with professional driver service.', 'Islamabad', 'Sedan', 15000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/cabinwhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(18, 'Coaster 4C & 5C - White Edition', 'coaster-4c-5c-white-edition', 'Coaster 4C & 5C available for rent with professional driver service.', 'Islamabad', 'Sedan', 22000.00, 'Per Day', 'available', 'active', 0, '/uploads/rent_cars/coasterwhite.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Enjoy Pakistan Tour', '2026-08-02 05:57:40', '2026-08-02 06:07:46'),
(2, 'whatsapp_number', '923026015432', '2026-08-02 05:57:40', '2026-08-02 06:07:46'),
(3, 'contact_email', 'info@enjoypakistantour.com', '2026-08-02 05:57:40', '2026-08-02 06:07:46'),
(4, 'contact_phone', '+92 302 6015432', '2026-08-02 05:57:40', '2026-08-02 06:07:46'),
(5, 'address', 'Islamabad, Pakistan', '2026-08-02 05:57:40', '2026-08-02 06:07:46'),
(6, 'facebook_url', '', '2026-08-02 05:57:40', '2026-08-02 06:07:46'),
(7, 'instagram_url', '', '2026-08-02 05:57:40', '2026-08-02 06:07:46'),
(8, 'hero_headline', 'Discover the Beauty of Pakistan', '2026-08-02 05:57:40', '2026-08-02 06:07:46'),
(9, 'hero_subheadline', 'Unforgettable tours & reliable rental cars across Pakistan', '2026-08-02 05:57:40', '2026-08-02 06:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT 'General',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(255) DEFAULT NULL,
  `availability` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') DEFAULT 'active',
  `featured` tinyint(1) DEFAULT 0,
  `cover_image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`id`, `name`, `slug`, `description`, `location`, `category`, `price`, `duration`, `availability`, `status`, `featured`, `cover_image`, `created_at`, `updated_at`) VALUES
(1, 'karachi visit', 'karachi-visit', 'wertyui', 'karachi', 'test', 400.00, '1', 3, 'active', 0, '/uploads/tours/1785650528128-732950181.png', '2026-08-02 06:02:08', '2026-08-02 06:02:08'),
(2, 'Abbottabad Standard Tour', 'abbottabad-standard-tour', 'Explore the beauty of Abbottabad with sightseeing and comfortable stay.', 'Abbottabad', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/tours/1785747589851-669748181.png', '2026-08-02 11:40:28', '2026-08-03 08:59:49'),
(3, 'Abbottabad Premium Tour', 'abbottabad-premium-tour', 'Luxury experience in Abbottabad with premium stay and exclusive services.', 'Abbottabad', 'Premium', 0.00, '7', 0, 'active', 0, '/uploads/locations/abbottabad.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(4, 'Mansehra Standard Tour', 'mansehra-standard-tour', 'Explore the beauty of Mansehra with sightseeing and comfortable stay.', 'Mansehra', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/mansehra.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(5, 'Mansehra Premium Tour', 'mansehra-premium-tour', 'Luxury experience in Mansehra with premium stay and exclusive services.', 'Mansehra', 'Premium', 0.00, '7', 0, 'active', 0, '/uploads/locations/mansehra.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(6, 'Balakot Standard Tour', 'balakot-standard-tour', 'Explore the beauty of Balakot with sightseeing and comfortable stay.', 'Balakot', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/balakot.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(7, 'Balakot Premium Tour', 'balakot-premium-tour', 'Luxury experience in Balakot with premium stay and exclusive services.', 'Balakot', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/balakot.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(8, 'Naran Standard Tour', 'naran-standard-tour', 'Explore the beauty of Naran with sightseeing and comfortable stay.', 'Naran', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/naran.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(9, 'Naran Premium Tour', 'naran-premium-tour', 'Luxury experience in Naran with premium stay and exclusive services.', 'Naran', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/naran.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(10, 'Babusar Pass Standard Tour', 'babusar-pass-standard-tour', 'Explore the beauty of Babusar Pass with sightseeing and comfortable stay.', 'Babusar Pass', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/babusar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(11, 'Babusar Pass Premium Tour', 'babusar-pass-premium-tour', 'Luxury experience in Babusar Pass with premium stay and exclusive services.', 'Babusar Pass', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/babusar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(12, 'Besham Standard Tour', 'besham-standard-tour', 'Explore the beauty of Besham with sightseeing and comfortable stay.', 'Besham', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/besham.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(13, 'Besham Premium Tour', 'besham-premium-tour', 'Luxury experience in Besham with premium stay and exclusive services.', 'Besham', 'Premium', 0.00, '7', 0, 'active', 0, '/uploads/locations/besham.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(14, 'Batgram Standard Tour', 'batgram-standard-tour', 'Explore the beauty of Batgram with sightseeing and comfortable stay.', 'Batgram', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/batgram.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(15, 'Batgram Premium Tour', 'batgram-premium-tour', 'Luxury experience in Batgram with premium stay and exclusive services.', 'Batgram', 'Premium', 0.00, '7', 0, 'active', 0, '/uploads/locations/batgram.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(16, 'Dasu Standard Tour', 'dasu-standard-tour', 'Explore the beauty of Dasu with sightseeing and comfortable stay.', 'Dasu', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/dasu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(17, 'Dasu Premium Tour', 'dasu-premium-tour', 'Luxury experience in Dasu with premium stay and exclusive services.', 'Dasu', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/dasu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(18, 'Chilas Standard Tour', 'chilas-standard-tour', 'Explore the beauty of Chilas with sightseeing and comfortable stay.', 'Chilas', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/chilas.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(19, 'Chilas Premium Tour', 'chilas-premium-tour', 'Luxury experience in Chilas with premium stay and exclusive services.', 'Chilas', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/chilas.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(20, 'Raikot Bridge Standard Tour', 'raikot-bridge-standard-tour', 'Explore the beauty of Raikot Bridge with sightseeing and comfortable stay.', 'Raikot Bridge', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/raikot.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(21, 'Raikot Bridge Premium Tour', 'raikot-bridge-premium-tour', 'Luxury experience in Raikot Bridge with premium stay and exclusive services.', 'Raikot Bridge', 'Premium', 0.00, '7', 0, 'active', 0, '/uploads/locations/raikot.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(22, 'Hunza Standard Tour', 'hunza-standard-tour', 'Explore the beauty of Hunza with sightseeing and comfortable stay.', 'Hunza', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/hunza.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(23, 'Hunza Premium Tour', 'hunza-premium-tour', 'Luxury experience in Hunza with premium stay and exclusive services.', 'Hunza', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/hunza.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(24, 'Attabad Lake Standard Tour', 'attabad-lake-standard-tour', 'Explore the beauty of Attabad Lake with sightseeing and comfortable stay.', 'Attabad Lake', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/attabad.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(25, 'Attabad Lake Premium Tour', 'attabad-lake-premium-tour', 'Luxury experience in Attabad Lake with premium stay and exclusive services.', 'Attabad Lake', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/attabad.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(26, 'Passu Standard Tour', 'passu-standard-tour', 'Explore the beauty of Passu with sightseeing and comfortable stay.', 'Passu', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/passu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(27, 'Passu Premium Tour', 'passu-premium-tour', 'Luxury experience in Passu with premium stay and exclusive services.', 'Passu', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/passu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(28, 'Khunjerab Pass Standard Tour', 'khunjerab-pass-standard-tour', 'Explore the beauty of Khunjerab Pass with sightseeing and comfortable stay.', 'Khunjerab Pass', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/khunjerab.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(29, 'Khunjerab Pass Premium Tour', 'khunjerab-pass-premium-tour', 'Luxury experience in Khunjerab Pass with premium stay and exclusive services.', 'Khunjerab Pass', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/khunjerab.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(30, 'Skardu Standard Tour', 'skardu-standard-tour', 'Explore the beauty of Skardu with sightseeing and comfortable stay.', 'Skardu', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/skardu.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(31, 'Skardu Premium Tour', 'skardu-premium-tour', 'Luxury experience in Skardu with premium stay and exclusive services.', 'Skardu', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/skardu.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(32, 'Shigar Standard Tour', 'shigar-standard-tour', 'Explore the beauty of Shigar with sightseeing and comfortable stay.', 'Shigar', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/shigar.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(33, 'Shigar Premium Tour', 'shigar-premium-tour', 'Luxury experience in Shigar with premium stay and exclusive services.', 'Shigar', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/shigar.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(34, 'Upper Kachura Standard Tour', 'upper-kachura-standard-tour', 'Explore the beauty of Upper Kachura with sightseeing and comfortable stay.', 'Upper Kachura', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/upperkachura.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(35, 'Upper Kachura Premium Tour', 'upper-kachura-premium-tour', 'Luxury experience in Upper Kachura with premium stay and exclusive services.', 'Upper Kachura', 'Premium', 0.00, '7', 0, 'active', 0, '/uploads/locations/upperkachura.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(36, 'Shangrila Standard Tour', 'shangrila-standard-tour', 'Explore the beauty of Shangrila with sightseeing and comfortable stay.', 'Shangrila', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/shangrila.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(37, 'Shangrila Premium Tour', 'shangrila-premium-tour', 'Luxury experience in Shangrila with premium stay and exclusive services.', 'Shangrila', 'Premium', 0.00, '7', 0, 'active', 0, '/uploads/locations/shangrila.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(38, 'Deosai Standard Tour', 'deosai-standard-tour', 'Explore the beauty of Deosai with sightseeing and comfortable stay.', 'Deosai', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/deosai.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(39, 'Deosai Premium Tour', 'deosai-premium-tour', 'Luxury experience in Deosai with premium stay and exclusive services.', 'Deosai', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/deosai.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(40, 'Astore Standard Tour', 'astore-standard-tour', 'Explore the beauty of Astore with sightseeing and comfortable stay.', 'Astore', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/astore.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(41, 'Astore Premium Tour', 'astore-premium-tour', 'Luxury experience in Astore with premium stay and exclusive services.', 'Astore', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/astore.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(42, 'Rama Lake Standard Tour', 'rama-lake-standard-tour', 'Explore the beauty of Rama Lake with sightseeing and comfortable stay.', 'Rama Lake', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/ramalake.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(43, 'Rama Lake Premium Tour', 'rama-lake-premium-tour', 'Luxury experience in Rama Lake with premium stay and exclusive services.', 'Rama Lake', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/locations/ramalake.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(44, 'Minimerg Standard Tour', 'minimerg-standard-tour', 'Explore the beauty of Minimerg with sightseeing and comfortable stay.', 'Minimerg', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/minimerg.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(45, 'Minimerg Premium Tour', 'minimerg-premium-tour', 'Luxury experience in Minimerg with premium stay and exclusive services.', 'Minimerg', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/locations/minimerg.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(46, 'Domel Standard Tour', 'domel-standard-tour', 'Explore the beauty of Domel with sightseeing and comfortable stay.', 'Domel', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/domel.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(47, 'Domel Premium Tour', 'domel-premium-tour', 'Luxury experience in Domel with premium stay and exclusive services.', 'Domel', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/locations/domel.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(48, 'Kamri Standard Tour', 'kamri-standard-tour', 'Explore the beauty of Kamri with sightseeing and comfortable stay.', 'Kamri', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/kamri.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(49, 'Kamri Premium Tour', 'kamri-premium-tour', 'Luxury experience in Kamri with premium stay and exclusive services.', 'Kamri', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/locations/kamri.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(50, 'Gilgit Standard Tour', 'gilgit-standard-tour', 'Explore the beauty of Gilgit with sightseeing and comfortable stay.', 'Gilgit', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/gilgit.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(51, 'Gilgit Premium Tour', 'gilgit-premium-tour', 'Luxury experience in Gilgit with premium stay and exclusive services.', 'Gilgit', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/gilgit.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(52, 'Naltar Standard Tour', 'naltar-standard-tour', 'Explore the beauty of Naltar with sightseeing and comfortable stay.', 'Naltar', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/naltar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(53, 'Naltar Premium Tour', 'naltar-premium-tour', 'Luxury experience in Naltar with premium stay and exclusive services.', 'Naltar', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/naltar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(54, 'Nomal Standard Tour', 'nomal-standard-tour', 'Explore the beauty of Nomal with sightseeing and comfortable stay.', 'Nomal', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/nomal.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(55, 'Nomal Premium Tour', 'nomal-premium-tour', 'Luxury experience in Nomal with premium stay and exclusive services.', 'Nomal', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/nomal.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(56, 'Alam Bridge Standard Tour', 'alam-bridge-standard-tour', 'Explore the beauty of Alam Bridge with sightseeing and comfortable stay.', 'Alam Bridge', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/alambridge.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(57, 'Alam Bridge Premium Tour', 'alam-bridge-premium-tour', 'Luxury experience in Alam Bridge with premium stay and exclusive services.', 'Alam Bridge', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/alambridge.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(58, 'Ghizer Standard Tour', 'ghizer-standard-tour', 'Explore the beauty of Ghizer with sightseeing and comfortable stay.', 'Ghizer', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/ghizar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(59, 'Ghizer Premium Tour', 'ghizer-premium-tour', 'Luxury experience in Ghizer with premium stay and exclusive services.', 'Ghizer', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/ghizar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(60, 'Khalti Lake Standard Tour', 'khalti-lake-standard-tour-69d72f286a44e', 'Explore the beauty of Khalti Lake with sightseeing and comfortable stay.', 'Khalti Lake', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/tours/A2fJGwGi3iZSq4qHcu1gnjmVgRNfgqyhkeIusCm2.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(61, 'Khalti Lake Premium Tour', 'khalti-lake-premium-tour-69d72f395a589', 'Luxury experience in Khalti Lake with premium stay and exclusive services.', 'Khalti Lake', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/tours/WMqWtl20VfKTgVDK1YlAzbkmHzo3qmqXrXen2StW.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(62, 'Yasin Standard Tour', 'yasin-standard-tour', 'Explore the beauty of Yasin with sightseeing and comfortable stay.', 'Yasin', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/locations/yasin.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(63, 'Yasin Premium Tour', 'yasin-premium-tour', 'Luxury experience in Yasin with premium stay and exclusive services.', 'Yasin', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/yasin.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(64, 'Shandur Standard Tour', 'shandur-standard-tour', 'Explore the beauty of Shandur with sightseeing and comfortable stay.', 'Shandur', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/locations/shandur.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(65, 'Shandur Premium Tour', 'shandur-premium-tour', 'Luxury experience in Shandur with premium stay and exclusive services.', 'Shandur', 'Premium', 0.00, '8', 0, 'active', 0, '/uploads/locations/shandur.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(66, 'Chitral Standard Tour', 'chitral-standard-tour', 'Explore the beauty of Chitral with sightseeing and comfortable stay.', 'Chitral', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/locations/chitral.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(67, 'Chitral Premium Tour', 'chitral-premium-tour', 'Luxury experience in Chitral with premium stay and exclusive services.', 'Chitral', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/locations/chitral.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(68, 'Islamabad Standard Tour', 'islamabad-standard-tour-69d72cef4569a', 'Explore Islamabad with comfortable stay and sightseeing.', 'Islamabad', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/tours/I0lN0SHd7y4VzogE0fA8sLjuETMooq8fVNVcweDA.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(69, 'Islamabad Premium Tour', 'islamabad-premium-tour-69d72d518e6b0', 'Luxury Islamabad tour with premium hotel.', 'Islamabad', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/tours/UZbVTgWU0YWXuEonsCBFo66hAbNmk6fcu21IdOON.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(70, 'Swabi Standard Tour', 'swabi-standard-tour-69d72d9c5cd53', 'Explore Swabi with sightseeing.', 'Swabi', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/tours/lSWBjuof6gUBX23vazC7I3ZaolGH8ixcBNRD5hBk.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(71, 'Swabi Premium Tour', 'swabi-premium-tour-69d72dac93fa2', 'Luxury Swabi experience.', 'Swabi', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/tours/wXWTub7t7OEyUs3cJTO0JHL7EaTWzVan16ni7STP.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(72, 'Mardan Standard Tour', 'mardan-standard-tour-69d72dbea4833', 'Explore Mardan.', 'Mardan', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/tours/NH0kyUnROwJCNXrx241h4VAb0rfKyxGv7tOLVBWx.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(73, 'Mardan Premium Tour', 'mardan-premium-tour-69d72dcbb3f05', 'Luxury Mardan tour.', 'Mardan', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/tours/lO9gj6hFD2Qi9uX8NEt3Xy8nsFwAIxrVc21vQkgu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(74, 'Malakand Standard Tour', 'malakand-standard-tour-69d72df3ee978', 'Explore Malakand Pass.', 'Malakand', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/tours/KEr6CjYKVfD3QWZIEsJDpCQesKhdNV6Lxh6jyRxh.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(75, 'Malakand Premium Tour', 'malakand-premium-tour-69d72e017b5d1', 'Luxury Malakand.', 'Malakand', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/tours/Uv7fz5AHgMXVkgjBYxJMnYU3llduiM6WwQKMDuyG.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(76, 'Chakdara Standard Tour', 'chakdara-standard-tour-69d72e1cccc00', 'Explore Chakdara.', 'Chakdara', 'Standard', 0.00, '3', 0, 'active', 0, '/uploads/tours/rr8DgjgzuGsNtzHq3ixsILxVyNBpWtIY3E3u5Tm1.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(77, 'Chakdara Premium Tour', 'chakdara-premium-tour-69d72e362ae0a', 'Luxury Chakdara.', 'Chakdara', 'Premium', 0.00, '5', 0, 'active', 0, '/uploads/tours/efLX9cT84hNRzF9JeiowVyn7GO4XLVDOQQR4RPxP.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(78, 'Mingora Standard Tour', 'mingora-standard-tour-69d72e6bbb1cf', 'Explore Mingora Swat.', 'Mingora', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/tours/VDZOqS7qgGr9WDFMSH7EULPaAOHZLY8FF11jlKs9.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(79, 'Mingora Premium Tour', 'mingora-premium-tour-69d72e7f4307c', 'Luxury Mingora.', 'Mingora', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/tours/Q7HYnhEYnvdhPMU0sF5zIxk0bQRnsp2SXOx2ZPD0.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(80, 'Bahrain Standard Tour', 'bahrain-standard-tour-69d72eb2b9878', 'Explore Bahrain Swat.', 'Bahrain', 'Standard', 0.00, '4', 0, 'active', 0, '/uploads/tours/r1l5ZsNx4UilcIZXbWj0yx1B8Vp7mDMYHAoruuuu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(81, 'Bahrain Premium Tour', 'bahrain-premium-tour-69d72ec9efcac', 'Luxury Bahrain.', 'Bahrain', 'Premium', 0.00, '6', 0, 'active', 0, '/uploads/tours/Vs1CLZvWtdM9y4LqjwLuxCR0eWgrvBqP1kdo1XZC.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(82, 'Kalam Standard Tour', 'kalam-standard-tour-69d72edbab1bf', 'Explore Kalam Valley.', 'Kalam', 'Standard', 0.00, '5', 0, 'active', 0, '/uploads/tours/s7KbEyvU8nx7DSH79CUTgHcCnN648rRcew61paFT.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(83, 'Kalam Premium Tour', 'kalam-premium-tour-69d72eeab398d', 'Luxury Kalam experience.', 'Kalam', 'Premium', 0.00, '7', 0, 'active', 0, '/uploads/tours/QQKqFrRhtgFnW5cv0kjrFXfBilfTkGq2z1gJfk65.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `tour_images`
--

CREATE TABLE `tour_images` (
  `id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour_images`
--

INSERT INTO `tour_images` (`id`, `tour_id`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 1, '/uploads/tours/1785650528128-732950181.png', '2026-08-02 06:02:08', '2026-08-02 06:02:08'),
(2, 2, '/uploads/locations/abbottabad.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(3, 3, '/uploads/locations/abbottabad.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(4, 4, '/uploads/locations/mansehra.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(5, 5, '/uploads/locations/mansehra.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(6, 6, '/uploads/locations/balakot.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(7, 7, '/uploads/locations/balakot.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(8, 8, '/uploads/locations/naran.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(9, 9, '/uploads/locations/naran.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(10, 10, '/uploads/locations/babusar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(11, 11, '/uploads/locations/babusar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(12, 12, '/uploads/locations/besham.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(13, 13, '/uploads/locations/besham.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(14, 14, '/uploads/locations/batgram.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(15, 15, '/uploads/locations/batgram.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(16, 16, '/uploads/locations/dasu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(17, 17, '/uploads/locations/dasu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(18, 18, '/uploads/locations/chilas.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(19, 19, '/uploads/locations/chilas.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(20, 20, '/uploads/locations/raikot.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(21, 21, '/uploads/locations/raikot.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(22, 22, '/uploads/locations/hunza.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(23, 23, '/uploads/locations/hunza.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(24, 24, '/uploads/locations/attabad.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(25, 25, '/uploads/locations/attabad.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(26, 26, '/uploads/locations/passu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(27, 27, '/uploads/locations/passu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(28, 28, '/uploads/locations/khunjerab.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(29, 29, '/uploads/locations/khunjerab.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(30, 30, '/uploads/locations/skardu.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(31, 31, '/uploads/locations/skardu.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(32, 32, '/uploads/locations/shigar.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(33, 33, '/uploads/locations/shigar.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(34, 34, '/uploads/locations/upperkachura.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(35, 35, '/uploads/locations/upperkachura.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(36, 36, '/uploads/locations/shangrila.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(37, 37, '/uploads/locations/shangrila.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(38, 38, '/uploads/locations/deosai.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(39, 39, '/uploads/locations/deosai.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(40, 40, '/uploads/locations/astore.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(41, 41, '/uploads/locations/astore.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(42, 42, '/uploads/locations/ramalake.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(43, 43, '/uploads/locations/ramalake.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(44, 44, '/uploads/locations/minimerg.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(45, 45, '/uploads/locations/minimerg.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(46, 46, '/uploads/locations/domel.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(47, 47, '/uploads/locations/domel.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(48, 48, '/uploads/locations/kamri.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(49, 49, '/uploads/locations/kamri.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(50, 50, '/uploads/locations/gilgit.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(51, 51, '/uploads/locations/gilgit.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(52, 52, '/uploads/locations/naltar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(53, 53, '/uploads/locations/naltar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(54, 54, '/uploads/locations/nomal.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(55, 55, '/uploads/locations/nomal.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(56, 56, '/uploads/locations/alambridge.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(57, 57, '/uploads/locations/alambridge.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(58, 58, '/uploads/locations/ghizar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(59, 59, '/uploads/locations/ghizar.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(60, 60, '/uploads/tours/A2fJGwGi3iZSq4qHcu1gnjmVgRNfgqyhkeIusCm2.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(61, 61, '/uploads/tours/WMqWtl20VfKTgVDK1YlAzbkmHzo3qmqXrXen2StW.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(62, 62, '/uploads/locations/yasin.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(63, 63, '/uploads/locations/yasin.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(64, 64, '/uploads/locations/shandur.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(65, 65, '/uploads/locations/shandur.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(66, 66, '/uploads/locations/chitral.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(67, 67, '/uploads/locations/chitral.png', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(68, 68, '/uploads/tours/I0lN0SHd7y4VzogE0fA8sLjuETMooq8fVNVcweDA.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(69, 69, '/uploads/tours/UZbVTgWU0YWXuEonsCBFo66hAbNmk6fcu21IdOON.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(70, 70, '/uploads/tours/lSWBjuof6gUBX23vazC7I3ZaolGH8ixcBNRD5hBk.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(71, 71, '/uploads/tours/wXWTub7t7OEyUs3cJTO0JHL7EaTWzVan16ni7STP.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(72, 72, '/uploads/tours/NH0kyUnROwJCNXrx241h4VAb0rfKyxGv7tOLVBWx.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(73, 73, '/uploads/tours/lO9gj6hFD2Qi9uX8NEt3Xy8nsFwAIxrVc21vQkgu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(74, 74, '/uploads/tours/KEr6CjYKVfD3QWZIEsJDpCQesKhdNV6Lxh6jyRxh.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(75, 75, '/uploads/tours/Uv7fz5AHgMXVkgjBYxJMnYU3llduiM6WwQKMDuyG.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(76, 76, '/uploads/tours/rr8DgjgzuGsNtzHq3ixsILxVyNBpWtIY3E3u5Tm1.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(77, 77, '/uploads/tours/efLX9cT84hNRzF9JeiowVyn7GO4XLVDOQQR4RPxP.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(78, 78, '/uploads/tours/VDZOqS7qgGr9WDFMSH7EULPaAOHZLY8FF11jlKs9.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(79, 79, '/uploads/tours/Q7HYnhEYnvdhPMU0sF5zIxk0bQRnsp2SXOx2ZPD0.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(80, 80, '/uploads/tours/r1l5ZsNx4UilcIZXbWj0yx1B8Vp7mDMYHAoruuuu.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(81, 81, '/uploads/tours/Vs1CLZvWtdM9y4LqjwLuxCR0eWgrvBqP1kdo1XZC.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(82, 82, '/uploads/tours/s7KbEyvU8nx7DSH79CUTgHcCnN648rRcew61paFT.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(83, 83, '/uploads/tours/QQKqFrRhtgFnW5cv0kjrFXfBilfTkGq2z1gJfk65.jpg', '2026-08-02 11:40:28', '2026-08-02 11:40:28'),
(84, 2, '/uploads/tours/1785747354887-318640115.png', '2026-08-03 08:55:54', '2026-08-03 08:55:54'),
(85, 2, '/uploads/tours/1785747402618-865095140.png', '2026-08-03 08:56:42', '2026-08-03 08:56:42'),
(87, 2, '/uploads/tours/1785747589851-669748181.png', '2026-08-03 08:59:49', '2026-08-03 08:59:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `email_14` (`email`),
  ADD UNIQUE KEY `email_15` (`email`),
  ADD UNIQUE KEY `email_16` (`email`),
  ADD UNIQUE KEY `email_17` (`email`),
  ADD UNIQUE KEY `email_18` (`email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_images`
--
ALTER TABLE `car_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rental_cars`
--
ALTER TABLE `rental_cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `slug_2` (`slug`),
  ADD UNIQUE KEY `slug_3` (`slug`),
  ADD UNIQUE KEY `slug_4` (`slug`),
  ADD UNIQUE KEY `slug_5` (`slug`),
  ADD UNIQUE KEY `slug_6` (`slug`),
  ADD UNIQUE KEY `slug_7` (`slug`),
  ADD UNIQUE KEY `slug_8` (`slug`),
  ADD UNIQUE KEY `slug_9` (`slug`),
  ADD UNIQUE KEY `slug_10` (`slug`),
  ADD UNIQUE KEY `slug_11` (`slug`),
  ADD UNIQUE KEY `slug_12` (`slug`),
  ADD UNIQUE KEY `slug_13` (`slug`),
  ADD UNIQUE KEY `slug_14` (`slug`),
  ADD UNIQUE KEY `slug_15` (`slug`),
  ADD UNIQUE KEY `slug_16` (`slug`),
  ADD UNIQUE KEY `slug_17` (`slug`),
  ADD UNIQUE KEY `slug_18` (`slug`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `key_2` (`key`),
  ADD UNIQUE KEY `key_3` (`key`),
  ADD UNIQUE KEY `key_4` (`key`),
  ADD UNIQUE KEY `key_5` (`key`),
  ADD UNIQUE KEY `key_6` (`key`),
  ADD UNIQUE KEY `key_7` (`key`),
  ADD UNIQUE KEY `key_8` (`key`),
  ADD UNIQUE KEY `key_9` (`key`),
  ADD UNIQUE KEY `key_10` (`key`),
  ADD UNIQUE KEY `key_11` (`key`),
  ADD UNIQUE KEY `key_12` (`key`),
  ADD UNIQUE KEY `key_13` (`key`),
  ADD UNIQUE KEY `key_14` (`key`),
  ADD UNIQUE KEY `key_15` (`key`),
  ADD UNIQUE KEY `key_16` (`key`),
  ADD UNIQUE KEY `key_17` (`key`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `slug_2` (`slug`),
  ADD UNIQUE KEY `slug_3` (`slug`),
  ADD UNIQUE KEY `slug_4` (`slug`),
  ADD UNIQUE KEY `slug_5` (`slug`),
  ADD UNIQUE KEY `slug_6` (`slug`),
  ADD UNIQUE KEY `slug_7` (`slug`),
  ADD UNIQUE KEY `slug_8` (`slug`),
  ADD UNIQUE KEY `slug_9` (`slug`),
  ADD UNIQUE KEY `slug_10` (`slug`),
  ADD UNIQUE KEY `slug_11` (`slug`),
  ADD UNIQUE KEY `slug_12` (`slug`),
  ADD UNIQUE KEY `slug_13` (`slug`),
  ADD UNIQUE KEY `slug_14` (`slug`),
  ADD UNIQUE KEY `slug_15` (`slug`),
  ADD UNIQUE KEY `slug_16` (`slug`),
  ADD UNIQUE KEY `slug_17` (`slug`),
  ADD UNIQUE KEY `slug_18` (`slug`);

--
-- Indexes for table `tour_images`
--
ALTER TABLE `tour_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `car_images`
--
ALTER TABLE `car_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_cars`
--
ALTER TABLE `rental_cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tour_images`
--
ALTER TABLE `tour_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_images`
--
ALTER TABLE `car_images`
  ADD CONSTRAINT `car_images_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `rental_cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tour_images`
--
ALTER TABLE `tour_images`
  ADD CONSTRAINT `tour_images_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
