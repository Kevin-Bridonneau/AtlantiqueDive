-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2020 at 10:05 AM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.33-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atlantiqueDiveSite`
--

-- --------------------------------------------------------

--
-- Table structure for table `divesites`
--

CREATE TABLE `divesites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double(8,2) NOT NULL,
  `lng` double(8,2) NOT NULL,
  `depth` int(11) NOT NULL,
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pathtopicture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divesites`
--

INSERT INTO `divesites` (`id`, `name`, `description`, `lat`, `lng`, `depth`, `visibility`, `current`, `pathtopicture`, `verified`) VALUES
(1, 'L\' Afrique', 'L’Afrique est un paquebot appartenant à la ligne maritime des Chargeurs réunis ; construit en 1907, il effectue sa traversée inaugurale le 22 juillet 1908. Il avait pour mission de rallier les différents ports de l\'Afrique française (AOF et AEF).Il fait naufrage le 12 janvier 1920 par gros temps aux abords nord-est du plateau de Rochebonne, à moins de 23 milles (42 km) des Sables-d\'Olonne (Vendée, France) avec à son bord 602 personnes dont 568 périrent dans le naufrage. Cet accident est la plus grande catastrophe maritime française par le nombre de victimes mais a été peu médiatisé à cause de l’élection présidentielle ayant lieu le même mois en 1920.', 46.33, -2.18, 47, 'Bonne', 'Moyen', '/L\' Afrique/l-afrique-1597762601.jpg', 1),
(16, 'Armor 150', 'Il s’agit d’un ponton de servitude : ponton bigue. C’est un catamaran de la société de travaux maritimes Armor, probablement coulé dans les années 70 alors qu’il était en remorque. Il servait à récupérer et soulever en surface les câbles transatlantiques en vue de leur réparation.Lors de son naufrage, le ponton bigue s’est retourné à une profondeur de 40 45 mètres : exposant ses deux coques lisses réunies par un maillage de poutrelles de liaison. Il est possible de passer en plusieurs endroits sous les coques pour rentrer à l’intérieur. Les deux coques en acier sont liaisonnées par des profilés métalliques.Engin de manutention flottant utilisé dans le levage des colis lourds. La partie levage, montée sur un ponton, est constituée d\'une mâture prolongée d\'une fléchette et de treuils commandant le levage et les mouvements d\'affalement et de relevage de la mâture. Les déplacements en plan sont effectués sur le plan d\'eau par des treuils de papillonnage ou par des propulseurs équipant le ponton. L\'équilibrage au renversement est assuré par ballastage du ponton.La hauteur de levage sous crochet varie, selon les engins entre 20 m et 200 m et suivant l\'inclinaison de la mâture qui fixe la portée.', 46.52, -2.16, 42, 'Bonne', 'Moyen', '/Armor 150/armor-150-1597764412.jpg', 1),
(17, 'Allie', 'Parti du Swansea en 1917 pour Bordeaux il est coulé le 5 janvier à l\'explosif par le UB39. L\'équipage est récupéré par l\'Alma-Jeanne des Sables d\'Olonne.', 46.25, -1.76, 31, 'Bonne', 'Faible', '/Allie/allie-1597907328.jpg', 1),
(18, 'Anglo Patagonian', 'Cargo anglais des Nitrate Producers.Naufrage le 11 juillet 1917, il est torpillé par le UC72.', 46.45, -2.17, 45, 'Bonne', 'Moyen', '/Anglo Patagonian/anglo-patagonian-1597907712.jpg', 1),
(19, 'Azie', 'Ce Drague à godets fait nauffrage le 8 octobre 1969, tractée par le remorqueur Anvers, elle rompts sa remorque et coule par mer déchaînée.', 46.45, -2.40, 60, 'Bonne', 'Moyen', '/Azie/azie-1597908090.jpg', 1),
(20, 'Californian', 'Ce cargo à vapeur fait naufrage le 22 juin 1918 à 5h05, il touche une mine et coule à 9h03.', 46.23, -2.20, 46, 'Bonne', 'Moyen', '/Californian/californian-1597908244.jpg', 1),
(21, 'Caroni', 'Ce cargon britannique à vapeur parti de Londres, le 7 septembre 1915 pour Bordeaux, est arraisonnée par le U20 qui le torpille après que l\'équipage ait pris place dans des chaloupes. Le cargo coule en 10 minutes.', 46.07, -1.80, 0, 'Bonne', 'Moyen', '/Caroni/caroni-1597908440.jpg', 1),
(22, 'Cimcour', 'Ce cimentier heurte une mine le 14 octobre 1940, à1h50, et coule 40s plus tard.', 46.03, -2.17, 38, 'Moyenne', 'Moyen', '/Cimcour/cimcour-1597908625.jpg', 1),
(23, 'Cornelis', 'Ce remorqueur à vapeur est réquisitionné en 1940 par les allemands, il devient auxiliaire de dragueur de mines sous le numéro M4227. Le 15 avrile 1942, il coule à 27 milles de La Pallince pour une raison inconnue.', 46.13, -1.68, 33, 'Moyenne', 'Moyen', '/Cornelis/cornelis-1597908928.jpg', 1),
(24, 'Le Frederic Morel', 'Ce charbonnier fait naufrage le 27 octobre 1910, après qu\'un incendie se soit déclaré à bord.', 46.42, -2.05, 38, 'Moyenne', 'Moyen', '/Le Frederic Morel/le-frederic-morel-1597909150.jpg', 1),
(25, 'John G. Mac Cullough', 'Bateau des grands lacs américains, il est torpillé par le UB 74 le 18 mai 1918.', 46.55, -2.27, 47, 'Bonne', 'Moyen', '/John G. Mac Cullough/john-g-mac-cullough-1597909435.jpg', 1),
(26, 'Niobe', 'Ce charbonnier vraquier de la Navan Caennaise est torpillé par le UC 21 le 16 février 1917.', 46.23, -1.80, 38, 'Bonne', 'Moyen', '/Niobe/niobe-1597909591.jpg', 1),
(27, 'Sauerland', 'Ce cargo céréalier transformé en briseur de blocus par les allemands est coulé au cours de l\'opération Kinétic, le 12 août 1944. Il est victime d\'une torpille tirée par le Piorun (bateau polonais).', 46.08, -1.70, 33, 'Bonne', 'Moyen', '/Sauerland/sauerland-1597909896.jpg', 1),
(28, 'Sequana', 'Paquebot de la Compagnie Sud Atlantique, il est torpillé par le UC 72, le 8 juin 1917.', 46.62, -2.37, 47, 'Bonne', 'Moyen', '/Sequana/sequana-1597910055.jpg', 1),
(29, 'Le Ville de Dieppe', 'Trois mâts barque, bateau citerne. En quittant La Palice, le bateau est attaqué au canon par l\'UC 21. Il sombre lentement en s\'inclinant sur tribord le 12 avril 1917. Tout l\'équipage sera receuilli par le sous-marin français Germinal.', 45.98, -1.87, 52, 'Bonne', 'Moyen', '/Le Ville de Dieppe/le-ville-de-dieppe-1597910352.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2014_10_12_000000_create_users_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 1),
(14, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(15, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(16, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(17, '2016_06_01_000004_create_oauth_clients_table', 1),
(18, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2020_08_05_101519_dive_sites', 1),
(21, '2020_08_06_080509_notice', 1),
(22, '2020_08_06_081847_presence', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dive_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `dive_id`, `user_id`, `created_at`, `msg`, `rate`) VALUES
(2, 1, 1, '2020-08-11 12:02:48', 'Un nouveau test', 5),
(3, 1, 2, '2020-08-17 06:06:57', 'Super Site plein de poisson , visi super !', 4),
(4, 1, 1, '2020-08-17 13:21:53', 'Super trop cool j\'ai vu des raies .', 4),
(5, 3, 1, '2020-08-17 13:29:30', 'J\'aime beaucoup les poissons.', 4),
(6, 16, 26, '2020-08-18 11:14:46', 'Super', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presence`
--

CREATE TABLE `presence` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dive_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presence`
--

INSERT INTO `presence` (`id`, `dive_id`, `club_id`) VALUES
(2, 1, 4),
(3, 1, 3),
(4, 3, 3),
(5, 16, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `type`, `adress`, `phone`, `website`, `created_at`, `updated_at`) VALUES
(1, 'KevinBridonneau', 'bridonneau.kevin@gmail.com', NULL, '$2y$10$9o.w/Hu60Zv3APCYr1aBxe2W6lKD9JEUx.CI0PmkUggl0FSWiLen.', 'GcBh5M8kjaUNgr8ZPm8pL5bRMTJK2WTyDeKJmmYYxx6yryhq5wIc0RfT4ciV', 'plongeur', NULL, NULL, NULL, '2020-08-11 08:31:04', '2020-08-11 08:31:04'),
(2, 'Jean Claude', 'test@gmail.com', NULL, '$2y$10$Z8ws/C25wjgdczObB591R.m7wOcvTDsbBeG8rYpbIMzEegr6ctpZG', NULL, 'plongeur', NULL, NULL, NULL, '2020-08-11 12:28:39', '2020-08-11 12:28:39'),
(3, 'SCY85', 'scy85@gmail.com', NULL, '$2y$10$NXZG.9sV18zLJAMD363pwOAlV7Zatv/iqrFXMct1znaLBiiwGlU.u', '8RymgFGRMdM2dzyXIhTqGA9CohXUXshX0LTBr3FLr4H27DBBqmbVT816MfBL', 'club', 'La Roche Sur Yon', '02 40 56 56 56', 'http://www.scy85.fr/', '2020-08-11 12:39:21', '2020-08-11 12:39:21'),
(4, 'SCPT', 'scptt@gmail.com', NULL, '$2y$10$FKkHVjScnSgLPpJM7LWyS.mnb1ZSQlm/jJzovm5CC.Iw1VJDQsE3S', NULL, 'club', 'Nantes', '02 40 40 40 40', 'scptt.org', '2020-08-11 13:03:05', '2020-08-11 13:03:05'),
(5, 'admin', 'admin@admin.com', NULL, '$2y$10$vCioRAiGDO.GVJP871ZsaeMbtZwFZLuHkmI8Kn7M9Yr/HUwhiJOQ6', 'PpEKzY4GnYiBWrYy3FDSrbFsB4z5hFhHnGm8FH3WJPRAjoOdBlJxLNVpRthe', 'admin', NULL, NULL, NULL, '2020-08-12 16:27:07', '2020-08-12 16:27:07'),
(6, 'theadmin', 'theadmin@gmail.com', NULL, '$2y$10$YBzXBir0jONEB9BsbX7g3OQmgX.s/fL3zZGRWrGF.1FKR7m0Me06m', NULL, 'admin', NULL, NULL, NULL, '2020-08-13 11:19:46', '2020-08-13 11:19:46'),
(10, 'pixi', 'pixi@gmail.com', NULL, '$2y$10$Z8ws/C25wjgdczObB591R.m7wOcvTDsbBeG8rYpbIMzEegr6ctpZG', NULL, 'plongeur', NULL, NULL, NULL, '2020-08-11 12:28:39', '2020-08-11 12:28:39'),
(12, 'AdminCréeparAdmin', 'admintest@gmail.com', NULL, '$2y$10$hQVgKpnhXrGDPMpDfawL.eejosHmuo8KBGDvUIJ6ameW/DPNN8zE.', NULL, 'admin', NULL, NULL, NULL, '2020-08-14 10:49:57', '2020-08-14 10:49:57'),
(13, 'Super Agent', 'superA@gmail.com', NULL, '$2y$10$ASyVj0Vi/aNm58TQiQi4.uTlACRXHXKgdAFreKCprR2hLX8hukHGu', NULL, 'admin', NULL, NULL, NULL, '2020-08-14 10:50:49', '2020-08-14 10:50:49'),
(16, 'Jean Test', 'js@gmail.com', NULL, '$2y$10$5Er7mxBav4W.eV8S1a8eXOIeafODAkgoXGrgWefKspFtY5VnxdbG6', NULL, 'plongeur', NULL, NULL, NULL, '2020-08-14 10:55:47', '2020-08-14 10:55:47'),
(25, 'Paul', 'paul@gmail.com', NULL, '$2y$10$fcw.N6HkVX7rwhJII8chSOUSBQlpyPqYssrFAvGE2VGe.qUWNGIc.', NULL, 'plongeur', NULL, NULL, NULL, '2020-08-15 07:21:57', '2020-08-15 07:21:57'),
(26, 'Marie', 'marie@gmail.com', NULL, '$2y$10$z/t99wNd3K5kWp/dpzUGm.uZzPbi03k.tGM53smZrTJ5TqX6ZnIDq', NULL, 'plongeur', NULL, NULL, NULL, '2020-08-15 08:08:58', '2020-08-15 08:08:58'),
(27, 'JeanMichel', 'jm@gmail.com', NULL, '$2y$10$5Lq9MGUQSIb4863Jc/paZeD/YGdIncxoJF/l27AyExIdXXjeOltJe', NULL, 'plongeur', NULL, NULL, NULL, '2020-08-18 04:51:21', '2020-08-18 04:51:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `divesites`
--
ALTER TABLE `divesites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `presence`
--
ALTER TABLE `presence`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `divesites`
--
ALTER TABLE `divesites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `presence`
--
ALTER TABLE `presence`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
