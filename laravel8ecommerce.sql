-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 13, 2021 at 05:55 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel8ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dorthy DuBuque', 'admin@laravel.com', NULL, '$2y$10$UoiaFKFCjNRVV6yzkp4AdOZRpU95t2vqeUXls9dHG7GkJ.XFFpp/m', 'uScdOsiL83RA4iYMQyqgk5Z4RSfkF1DnoMgYU56a5DKSwL23mst72D55mpyJ', '2021-04-07 11:37:00', '2021-04-07 11:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontend_type` enum('select','radio','text','text_area') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `name`, `frontend_type`, `is_filterable`, `is_required`, `created_at`, `updated_at`) VALUES
(1, 'size', 'Size', 'select', 1, 1, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(2, 'color', 'Color', 'select', 1, 1, '2021-04-07 11:37:01', '2021-04-07 11:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'S', NULL, '2021-04-08 14:01:49', '2021-04-08 14:38:33'),
(2, 1, 'M', NULL, '2021-04-08 14:01:57', '2021-04-08 14:38:40'),
(3, 1, 'L', NULL, '2021-04-08 14:02:06', '2021-04-08 14:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'My Code Skills', 'my-code-skills', NULL, '2021-04-08 13:58:46', '2021-04-08 13:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `menu` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `parent_id`, `featured`, `menu`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Root', 'root', 'This is the root category, don\'t delete this one', NULL, 0, 0, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(2, 'Miss Filomena Graham', 'miss-filomena-graham', 'No, there were a Duck and a Dodo, a Lory and an old Crab took the hookah out of a well?\' \'Take.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(3, 'Durward Reichert Sr.', 'durward-reichert-sr', 'Duchess\'s cook. She carried the pepper-box in her pocket) till she fancied she heard a little.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(4, 'Brannon Wilderman', 'brannon-wilderman', 'Let me see--how IS it to his son, \'I feared it might appear to others that what you were or might.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(5, 'Cassandre Hirthe Jr.', 'cassandre-hirthe-jr', 'Lory and an old crab, HE was.\' \'I never said I didn\'t!\' interrupted Alice. \'You must be,\' said the.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(6, 'Velma Hodkiewicz II', 'velma-hodkiewicz-ii', 'NOT!\' cried the Gryphon, and the other arm curled round her head. \'If I eat one of them attempted.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(7, 'Abagail Dibbert', 'abagail-dibbert', 'Queen never left off staring at the top of her skirt, upsetting all the while, till at last she.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(8, 'Tatum Zemlak', 'tatum-zemlak', 'Duchess, who seemed to be a lesson to you how the game was in confusion, getting the Dormouse.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(9, 'Dr. Duane Pacocha DDS', 'dr-duane-pacocha-dds', 'The poor little feet, I wonder what CAN have happened to me! When I used to come once a week: HE.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(10, 'Jacklyn Batz', 'jacklyn-batz', 'And mentioned me to introduce some other subject of conversation. \'Are you--are you fond--of--of.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(11, 'Novella Hayes', 'novella-hayes', 'King put on your head-- Do you think you could manage it?) \'And what are YOUR shoes done with?\'.', 1, 0, 1, NULL, '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(12, 'Test Category', 'test-category', NULL, 2, 1, 1, NULL, '2021-04-07 12:56:41', '2021-04-07 12:56:41'),
(13, 'New Cat', 'new-cat', NULL, 12, 1, 1, NULL, '2021-04-08 13:47:10', '2021-04-08 13:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_03_15_063234_create_admins_table', 1),
(4, '2021_03_16_051650_create_settings_table', 1),
(5, '2021_03_16_071506_create_categories_table', 1),
(6, '2021_03_21_093102_create_attributes_table', 1),
(7, '2021_03_21_095815_create_attribute_values_table', 1),
(8, '2021_03_23_063318_create_brands_table', 1),
(9, '2021_03_23_065901_create_products_table', 1),
(10, '2021_03_23_070240_create_product_images_table', 1),
(11, '2021_03_23_070936_create_product_attributes_table', 1),
(12, '2021_03_23_071248_create_attribute_value_product_attribute_table', 1),
(13, '2021_03_23_084100_create_product_categories_table', 1),
(14, '2021_03_23_121712_drop_attribute_value_product_attribute_table', 1),
(15, '2021_03_23_121826_alter_product_attributes_table', 1),
(16, '2021_04_09_190723_create_orders_table', 2),
(17, '2021_04_09_190938_create_order_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `grand_total` decimal(20,6) NOT NULL,
  `item_count` int(10) UNSIGNED NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 1,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `status`, `grand_total`, `item_count`, `payment_status`, `payment_method`, `first_name`, `last_name`, `address`, `city`, `country`, `post_code`, `phone_number`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'ORD-60715329BD478', 1, 'pending', '35.000000', 1, 0, NULL, 'Yash', 'Pal', 'B-234, Sec-2', 'Noida', 'India', '201301', '123214245', 'test', '2021-04-10 01:56:33', '2021-04-10 01:56:33'),
(2, 'ORD-6071553C98EA3', 1, 'pending', '75.000000', 2, 0, NULL, 'Yash', 'Pal', 'B-234, Sec-2', 'Noida', 'India', '201301', '123214245', 'testtt', '2021-04-10 02:05:24', '2021-04-10 02:05:24'),
(3, 'ORD-6071557B6F3E3', 1, 'pending', '75.000000', 2, 0, NULL, 'Yash', 'Pal', 'B-234, Sec-2', 'Noida', 'India', '201301', '123214245', 'testtt', '2021-04-10 02:06:27', '2021-04-10 02:06:27'),
(4, 'ORD-6071563AA9DD1', 1, 'pending', '75.000000', 2, 0, NULL, 'Yash', 'Pal', 'B-234, Sec-2', 'Noida', 'India', '201301', '123214245', NULL, '2021-04-10 02:09:38', '2021-04-10 02:09:38');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '35.000000', '2021-04-10 01:56:33', '2021-04-10 01:56:33'),
(2, 2, 1, 1, '35.000000', '2021-04-10 02:05:24', '2021-04-10 02:05:24'),
(3, 2, 1, 1, '40.000000', '2021-04-10 02:05:24', '2021-04-10 02:05:24'),
(4, 3, 1, 1, '35.000000', '2021-04-10 02:06:27', '2021-04-10 02:06:27'),
(5, 3, 1, 1, '40.000000', '2021-04-10 02:06:27', '2021-04-10 02:06:27'),
(6, 4, 1, 1, '35.000000', '2021-04-10 02:09:38', '2021-04-10 02:09:38'),
(7, 4, 1, 1, '40.000000', '2021-04-10 02:09:38', '2021-04-10 02:09:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `sku`, `name`, `slug`, `description`, `quantity`, `weight`, `price`, `sale_price`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 'Product-1', 'T Shirts', 't-shirts', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 500, '12.00', '12.00', NULL, 1, 1, '2021-04-08 14:00:10', '2021-04-08 14:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `attribute_id`, `value`, `quantity`, `price`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'S', 100, '12.00', 1, '2021-04-08 14:02:38', '2021-04-08 14:02:38'),
(2, 1, 'M', 200, '23.00', 1, '2021-04-08 14:02:52', '2021-04-08 14:02:52'),
(3, 1, 'L', 200, '28.00', 1, '2021-04-08 14:03:04', '2021-04-08 14:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_id`, `product_id`) VALUES
(1, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'E-Commerce Application', '2021-04-07 11:37:00', '2021-04-07 11:37:00'),
(2, 'site_title', 'E-Commerce', '2021-04-07 11:37:00', '2021-04-07 11:37:00'),
(3, 'default_email_address', 'admin@admin.com', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(4, 'currency_code', 'INR', '2021-04-07 11:37:01', '2021-04-09 14:14:05'),
(5, 'currency_symbol', '₹', '2021-04-07 11:37:01', '2021-04-09 14:14:05'),
(6, 'site_logo', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(7, 'site_favicon', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(8, 'footer_copyright_text', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(9, 'seo_meta_title', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(10, 'seo_meta_description', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(11, 'social_facebook', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(12, 'social_twitter', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(13, 'social_instagram', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(14, 'social_linkedin', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(15, 'google_analytics', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(16, 'facebook_pixels', '', '2021-04-07 11:37:01', '2021-04-07 11:37:01'),
(17, 'stripe_payment_method', '0', '2021-04-07 11:37:01', '2021-04-09 14:08:41'),
(18, 'stripe_key', NULL, '2021-04-07 11:37:01', '2021-04-09 14:08:41'),
(19, 'stripe_secret_key', NULL, '2021-04-07 11:37:01', '2021-04-09 14:08:41'),
(20, 'paypal_payment_method', '1', '2021-04-07 11:37:01', '2021-04-09 14:08:41'),
(21, 'paypal_client_id', 'ATys3IGY9QLFxP-HvkOyMvjl0Ztpxt1tFSaorkXbhR7EFbhG0PLV00Eh7LDwg_NmBT0yeTGB3ZCNrLUw', '2021-04-07 11:37:01', '2021-04-09 14:08:41'),
(22, 'paypal_secret_id', 'EBRpvcKy9BU8-6qHdEewT_ySOeByLRxKg-PMy324yoe0BNZhzQMsAwXjq2cPg8lquErpEeNsOPAISASn', '2021-04-07 11:37:01', '2021-04-09 14:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `address`, `city`, `country`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Yash', 'Pal', 'yashvir.ezrankings01@gmail.com', NULL, '$2y$10$qYGvgavRmQNifIkgLvrmEuznpiVajI1f.ddfrWhe0.tG4aitKVEHS', 'B-234, Sec-2', 'Noida', 'United States', NULL, '2021-04-09 13:49:27', '2021-04-09 13:49:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_index` (`order_id`),
  ADD KEY `order_items_product_id_index` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_index` (`brand_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_category_id_index` (`category_id`),
  ADD KEY `product_categories_product_id_index` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_index` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
