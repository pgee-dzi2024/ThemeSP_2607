-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране: 15 март 2026 в 15:56
-- Версия на сървъра: 10.4.32-MariaDB
-- Версия на PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `dzi_sp_2607`
--

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Компютър', 7, 'add_computer'),
(26, 'Can change Компютър', 7, 'change_computer'),
(27, 'Can delete Компютър', 7, 'delete_computer'),
(28, 'Can view Компютър', 7, 'view_computer'),
(29, 'Can add WOL Лог', 8, 'add_wakelog'),
(30, 'Can change WOL Лог', 8, 'change_wakelog'),
(31, 'Can delete WOL Лог', 8, 'delete_wakelog'),
(32, 'Can view WOL Лог', 8, 'view_wakelog');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$RPc7DYruFlSjPWr3HZlQad$W+EjKh0ecNUq1tGEUCaFRaj1hldlcSw1QTe6WkERKNI=', '2026-02-12 08:27:30.074853', 1, 'user_26', '', '', '', 1, 1, '2026-02-12 08:27:02.320540');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'computer'),
(8, 'main', 'wakelog'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-02-12 08:25:54.536933'),
(2, 'auth', '0001_initial', '2026-02-12 08:25:54.939909'),
(3, 'admin', '0001_initial', '2026-02-12 08:25:55.033195'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-02-12 08:25:55.038148'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-02-12 08:25:55.043146'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-02-12 08:25:55.089101'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-02-12 08:25:55.133725'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-02-12 08:25:55.145651'),
(9, 'auth', '0004_alter_user_username_opts', '2026-02-12 08:25:55.151703'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-02-12 08:25:55.188568'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-02-12 08:25:55.192835'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-02-12 08:25:55.198674'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-02-12 08:25:55.208757'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-02-12 08:25:55.219470'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-02-12 08:25:55.230583'),
(16, 'auth', '0011_update_proxy_permissions', '2026-02-12 08:25:55.236710'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-02-12 08:25:55.253060'),
(18, 'sessions', '0001_initial', '2026-02-12 08:25:55.299525'),
(19, 'main', '0001_initial', '2026-03-15 10:32:27.701853');

-- --------------------------------------------------------

--
-- Структура на таблица `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('lvp6odsav8yiyw6rlnp4hxmsrubxccjp', '.eJxVjEEOwiAQRe_C2hCGMoAu3XsGMsAgVUOT0q6Md7dNutDtf-_9twi0LjWsnecwZnERIE6_W6T05LaD_KB2n2Sa2jKPUe6KPGiXtynz63q4fweVet3qAsWBKT6i9lkZwASQAJmN9aC0QkaiTbDkcoGUz4U9KjPoIbEDZcXnC9IrN18:1vqS2s:n0Ns9a0gt8hFsZPG3fepKF6aphM7CckJMd_LiNtyfh4', '2026-02-26 08:27:30.079272');

-- --------------------------------------------------------

--
-- Структура на таблица `main_computer`
--

CREATE TABLE `main_computer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mac_address` varchar(17) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_computer`
--

INSERT INTO `main_computer` (`id`, `name`, `mac_address`, `ip_address`, `created_at`) VALUES
(2, 'test', '50:65:F3:40:03:92', '192.168.100.255', '2026-03-15 13:58:50.306377');

-- --------------------------------------------------------

--
-- Структура на таблица `main_wakelog`
--

CREATE TABLE `main_wakelog` (
  `id` bigint(20) NOT NULL,
  `target_mac` varchar(17) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  `message` longtext DEFAULT NULL,
  `computer_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_wakelog`
--

INSERT INTO `main_wakelog` (`id`, `target_mac`, `timestamp`, `status`, `message`, `computer_id`, `user_id`) VALUES
(1, '74:d4:dd:38:a1:0e', '2026-03-15 10:52:16.197989', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(2, '74:d4:dd:38:a1:0e', '2026-03-15 12:05:16.217091', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(3, '74:d4:dd:38:a1:0e', '2026-03-15 12:19:42.422869', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(4, '74:d4:dd:38:a1:0e', '2026-03-15 12:28:19.398186', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(5, '74:d4:dd:38:a1:0e', '2026-03-15 12:32:19.035875', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(6, '74:d4:dd:38:a1:0e', '2026-03-15 12:38:18.546346', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(7, '74:d4:dd:38:a1:0e', '2026-03-15 12:38:48.382418', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(8, '50:65:F3:40:03:92', '2026-03-15 13:01:56.310926', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(9, '50:65:F3:40:03:92', '2026-03-15 13:03:48.148200', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(10, '50:65:F3:40:03:92', '2026-03-15 13:13:11.818821', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(11, '50:65:F3:40:03:92', '2026-03-15 13:13:39.114651', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(12, '50:65:F3:40:03:92', '2026-03-15 13:13:53.528434', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(13, '50:65:F3:40:03:92', '2026-03-15 13:14:03.834394', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(14, '50:65:F3:40:03:92', '2026-03-15 13:14:20.602371', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(15, '50:65:F3:40:03:92', '2026-03-15 13:16:36.090167', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(16, '50:65:F3:40:03:92', '2026-03-15 13:17:05.048494', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(17, '50:65:F3:40:03:92', '2026-03-15 13:20:07.841352', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(18, '50:65:F3:40:03:92', '2026-03-15 13:24:14.463277', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(19, '50:65:F3:40:03:92', '2026-03-15 13:24:58.985230', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(20, '50:65:F3:40:03:92', '2026-03-15 13:26:56.576606', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(21, '50:65:F3:40:03:92', '2026-03-15 13:27:20.645950', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(22, '50:65:F3:40:03:92', '2026-03-15 13:33:27.687665', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(23, '50:65:F3:40:03:92', '2026-03-15 13:33:46.622855', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(24, '50:65:F3:40:03:92', '2026-03-15 13:35:17.231303', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(25, '50:65:F3:40:03:92', '2026-03-15 13:36:02.577300', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(26, '50:65:F3:40:03:92', '2026-03-15 13:36:23.573271', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(27, '50:65:F3:40:03:92', '2026-03-15 13:49:16.548593', 'success', 'WOL пакетът е изпратен успешно.', NULL, NULL),
(28, '50:65:F3:40:03:92', '2026-03-15 13:58:54.184239', 'success', 'WOL пакетът е изпратен успешно.', 2, NULL),
(29, '50:65:F3:40:03:92', '2026-03-15 14:16:39.216372', 'success', 'WOL пакетът е изпратен успешно.', 2, NULL),
(30, '50:65:F3:40:03:92', '2026-03-15 14:19:18.398897', 'success', 'WOL пакетът е изпратен успешно.', 2, NULL);

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индекси за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индекси за таблица `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индекси за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индекси за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индекси за таблица `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индекси за таблица `main_computer`
--
ALTER TABLE `main_computer`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_wakelog`
--
ALTER TABLE `main_wakelog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_wakelog_computer_id_b2657592_fk_main_computer_id` (`computer_id`),
  ADD KEY `main_wakelog_user_id_bc222ac2_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `main_computer`
--
ALTER TABLE `main_computer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `main_wakelog`
--
ALTER TABLE `main_wakelog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `main_wakelog`
--
ALTER TABLE `main_wakelog`
  ADD CONSTRAINT `main_wakelog_computer_id_b2657592_fk_main_computer_id` FOREIGN KEY (`computer_id`) REFERENCES `main_computer` (`id`),
  ADD CONSTRAINT `main_wakelog_user_id_bc222ac2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
