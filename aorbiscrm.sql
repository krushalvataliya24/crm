-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2024 at 08:43 AM
-- Server version: 10.6.7-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aorbiscrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causeable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causeable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `timelineable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timelineable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `recordable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recordable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `modified` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`modified`)),
  `ip_address` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressable_id` bigint(20) UNSIGNED NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address_types`
--

CREATE TABLE `address_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address_types`
--

INSERT INTO `address_types` (`id`, `team_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Current', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(2, NULL, 'Previous', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(3, NULL, 'Postal', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(4, NULL, 'Business', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(5, NULL, 'Billing', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(6, NULL, 'Shipping', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Label', 1, '[]', '{\"id\":1,\"name\":\"Hot\",\"hex\":\"dc3545\",\"external_id\":\"2fbea252-24e1-43af-a5c5-f454a2498a8c\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(2, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Label', 2, '[]', '{\"id\":2,\"name\":\"Cold\",\"hex\":\"007bff\",\"external_id\":\"996ba5ec-2669-46d4-b3cf-a3a5e1e5b3c1\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(3, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Label', 3, '[]', '{\"id\":3,\"name\":\"Warm\",\"hex\":\"ffc107\",\"external_id\":\"47385263-8e5d-4a02-b002-6d37133c68e8\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(4, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 1, '[]', '{\"global\":1,\"name\":\"db_seeded_labels\",\"value\":1,\"id\":1}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(5, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\LeadStatus', 1, '[]', '{\"id\":1,\"name\":\"Lead In\",\"external_id\":\"e58fc012-e195-4113-884c-8be0fda09de3\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(6, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\LeadStatus', 2, '[]', '{\"id\":2,\"name\":\"Contacted\",\"external_id\":\"2fdbb112-40e2-4794-824c-57ec05597609\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(7, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 2, '[]', '{\"global\":1,\"name\":\"db_seeded_lead_statuses\",\"value\":1,\"id\":2}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(8, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\OrganisationType', 1, '[]', '{\"id\":1,\"name\":\"Sole Trader\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(9, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\OrganisationType', 2, '[]', '{\"id\":2,\"name\":\"Partnership\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(10, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\OrganisationType', 3, '[]', '{\"id\":3,\"name\":\"Company\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(11, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\OrganisationType', 4, '[]', '{\"id\":4,\"name\":\"Trust\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(12, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 3, '[]', '{\"global\":1,\"name\":\"db_seeded_organisation_types\",\"value\":1,\"id\":3}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(13, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\AddressType', 1, '[]', '{\"id\":1,\"name\":\"Current\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(14, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\AddressType', 2, '[]', '{\"id\":2,\"name\":\"Previous\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(15, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\AddressType', 3, '[]', '{\"id\":3,\"name\":\"Postal\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(16, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\AddressType', 4, '[]', '{\"id\":4,\"name\":\"Business\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(17, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\AddressType', 5, '[]', '{\"id\":5,\"name\":\"Billing\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(18, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\AddressType', 6, '[]', '{\"id\":6,\"name\":\"Shipping\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(19, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 4, '[]', '{\"global\":1,\"name\":\"db_seeded_address_types\",\"value\":1,\"id\":4}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(20, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\ContactType', 1, '[]', '{\"id\":1,\"name\":\"Primary\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(21, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\ContactType', 2, '[]', '{\"id\":2,\"name\":\"Secondary\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(22, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 5, '[]', '{\"global\":1,\"name\":\"db_seeded_contact_types\",\"value\":1,\"id\":5}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(23, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 1, '[]', '{\"id\":1,\"name\":\"New\",\"percent\":1,\"external_id\":\"fc3d47dc-1b4a-47f5-8237-c47c768594a0\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(24, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 2, '[]', '{\"id\":2,\"name\":\"10%\",\"percent\":10,\"external_id\":\"b8d1a5ec-27c1-4dfa-a56d-719398cbed1c\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(25, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 3, '[]', '{\"id\":3,\"name\":\"20%\",\"percent\":20,\"external_id\":\"ad2a2a08-0e39-4198-8154-4cce64d59556\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(26, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 4, '[]', '{\"id\":4,\"name\":\"30%\",\"percent\":30,\"external_id\":\"2480589c-c670-4536-b881-53f0ff11fa5a\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(27, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 5, '[]', '{\"id\":5,\"name\":\"40%\",\"percent\":40,\"external_id\":\"66a65a11-0aaf-414d-9975-a68f66a7c172\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(28, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 6, '[]', '{\"id\":6,\"name\":\"50%\",\"percent\":50,\"external_id\":\"81b76610-79e0-45ab-b853-835747c809ca\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(29, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 7, '[]', '{\"id\":7,\"name\":\"60%\",\"percent\":60,\"external_id\":\"0ac55cb7-c668-4638-929e-f6748362f016\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(30, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 8, '[]', '{\"id\":8,\"name\":\"70%\",\"percent\":70,\"external_id\":\"9f73be43-d905-4ff9-a475-1d73d68eedf0\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(31, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 9, '[]', '{\"id\":9,\"name\":\"80%\",\"percent\":80,\"external_id\":\"7528d3b0-4b8e-4169-baf8-11b36ef8f063\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(32, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 10, '[]', '{\"id\":10,\"name\":\"90%\",\"percent\":90,\"external_id\":\"e5f2b57a-1592-4891-9565-3fdcaaa4c984\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(33, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 11, '[]', '{\"id\":11,\"name\":\"Won\",\"percent\":100,\"external_id\":\"5c66d045-ebf8-42c6-8d09-1559e9a42963\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(34, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStageProbability', 12, '[]', '{\"id\":12,\"name\":\"Lost\",\"percent\":0,\"external_id\":\"a446a496-3f24-4cee-9819-faf8683beecd\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(35, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 6, '[]', '{\"global\":1,\"name\":\"db_seeded_pipeline_probabilities\",\"value\":1,\"id\":6}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(36, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Pipeline', 1, '[]', '{\"id\":1,\"name\":\"Lead Pipeline\",\"model\":\"VentureDrake\\\\LaravelCrm\\\\Models\\\\Lead\",\"external_id\":\"f1fee5ce-73ea-4e12-97fe-69382f7ed9a9\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(37, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Pipeline', 2, '[]', '{\"id\":2,\"name\":\"Deal Pipeline\",\"model\":\"VentureDrake\\\\LaravelCrm\\\\Models\\\\Deal\",\"external_id\":\"8b4b240b-0705-4a04-9826-c45daaf8c5be\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(38, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Pipeline', 3, '[]', '{\"id\":3,\"name\":\"Quote Pipeline\",\"model\":\"VentureDrake\\\\LaravelCrm\\\\Models\\\\Quote\",\"external_id\":\"6bd3e761-6cc4-46f2-b210-c45819780dd8\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(39, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Pipeline', 4, '[]', '{\"id\":4,\"name\":\"Order Pipeline\",\"model\":\"VentureDrake\\\\LaravelCrm\\\\Models\\\\Order\",\"external_id\":\"3d7d5a9c-d4fb-411b-9d99-35407ec80f15\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(40, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Pipeline', 5, '[]', '{\"id\":5,\"name\":\"Invoice Pipeline\",\"model\":\"VentureDrake\\\\LaravelCrm\\\\Models\\\\Invoice\",\"external_id\":\"c3d88a9d-abf7-4e52-8548-6535b70dbc36\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(41, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Pipeline', 6, '[]', '{\"id\":6,\"name\":\"Delivery Pipeline\",\"model\":\"VentureDrake\\\\LaravelCrm\\\\Models\\\\Delivery\",\"external_id\":\"b0ed9ece-785b-4ca2-bce4-7999a3cb67e3\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(42, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Pipeline', 7, '[]', '{\"id\":7,\"name\":\"Purchase Order Pipeline\",\"model\":\"VentureDrake\\\\LaravelCrm\\\\Models\\\\PurchaseOrder\",\"external_id\":\"9a6643f9-05d8-4529-bb8d-8da6209f9aa3\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(43, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 7, '[]', '{\"global\":1,\"name\":\"db_seeded_pipelines\",\"value\":1,\"id\":7}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(44, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 1, '[]', '{\"id\":1,\"name\":\"New\",\"pipeline_id\":1,\"pipeline_stage_probability_id\":1,\"external_id\":\"946dec58-1897-41ea-8e73-1ab4f3d2202b\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(45, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 2, '[]', '{\"id\":2,\"name\":\"Appointment Scheduled\",\"pipeline_id\":1,\"pipeline_stage_probability_id\":3,\"external_id\":\"1482ac16-59f9-4242-ae3b-9042d6471e86\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(46, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 3, '[]', '{\"id\":3,\"name\":\"Qualified To Buy\",\"pipeline_id\":1,\"pipeline_stage_probability_id\":5,\"external_id\":\"85cf581e-b657-4c8e-8536-262fddefe3ec\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(47, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 4, '[]', '{\"id\":4,\"name\":\"Presentation Scheduled\",\"pipeline_id\":1,\"pipeline_stage_probability_id\":7,\"external_id\":\"e299437e-3f65-4abe-8565-e8bf98a346fe\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(48, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 5, '[]', '{\"id\":5,\"name\":\"Decision Maker Bought-In\",\"pipeline_id\":1,\"pipeline_stage_probability_id\":9,\"external_id\":\"d840919f-7e6a-455a-a635-06b5d7b20e89\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(49, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 6, '[]', '{\"id\":6,\"name\":\"Contract Sent\",\"pipeline_id\":1,\"pipeline_stage_probability_id\":10,\"external_id\":\"e405af3f-dcd1-4817-8a22-ebcdfec37a36\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(50, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 7, '[]', '{\"id\":7,\"name\":\"Closed Won\",\"pipeline_id\":1,\"pipeline_stage_probability_id\":11,\"external_id\":\"bccff32d-fbca-4822-9a0e-143adb30d289\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(51, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 8, '[]', '{\"id\":8,\"name\":\"Closed Lost\",\"pipeline_id\":1,\"pipeline_stage_probability_id\":12,\"external_id\":\"5259ad55-785f-4781-a78b-59180d9ad579\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(52, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 9, '[]', '{\"id\":9,\"name\":\"Draft\",\"pipeline_id\":2,\"pipeline_stage_probability_id\":1,\"external_id\":\"100f7fd2-b209-4839-ad46-b8308a4d3304\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(53, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 10, '[]', '{\"id\":10,\"name\":\"Pending\",\"pipeline_id\":2,\"pipeline_stage_probability_id\":9,\"external_id\":\"e4554721-75e5-49f1-bbb9-034d6d3fa528\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(54, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 11, '[]', '{\"id\":11,\"name\":\"Closed Won\",\"pipeline_id\":2,\"pipeline_stage_probability_id\":11,\"external_id\":\"afbe1218-e5eb-4d49-a4ab-a82538009894\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(55, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 12, '[]', '{\"id\":12,\"name\":\"Closed Lost\",\"pipeline_id\":2,\"pipeline_stage_probability_id\":12,\"external_id\":\"e2c603b1-7333-4b5e-b877-0c915221742c\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(56, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 13, '[]', '{\"id\":13,\"name\":\"Draft\",\"pipeline_id\":3,\"pipeline_stage_probability_id\":1,\"external_id\":\"0ac5ccfd-8c51-4b30-931d-0a44091d58e5\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(57, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 14, '[]', '{\"id\":14,\"name\":\"Sent\",\"pipeline_id\":3,\"pipeline_stage_probability_id\":9,\"external_id\":\"650a7576-1813-48e5-9fd1-785880c432c7\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(58, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 15, '[]', '{\"id\":15,\"name\":\"Accepted\",\"pipeline_id\":3,\"pipeline_stage_probability_id\":11,\"external_id\":\"d622b0bf-5bb1-430f-b946-b71dadb2c27f\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(59, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 16, '[]', '{\"id\":16,\"name\":\"Rejected\",\"pipeline_id\":3,\"pipeline_stage_probability_id\":12,\"external_id\":\"c5d30c36-4581-427f-a8c5-860cfdf06c2e\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(60, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 17, '[]', '{\"id\":17,\"name\":\"Ordered\",\"pipeline_id\":3,\"pipeline_stage_probability_id\":11,\"external_id\":\"f4d4ac40-61e7-4891-86d9-ae7f64ec036d\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(61, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 18, '[]', '{\"id\":18,\"name\":\"Draft\",\"pipeline_id\":4,\"pipeline_stage_probability_id\":1,\"external_id\":\"3d316fab-465f-4a3a-8e49-5a45d5521392\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(62, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 19, '[]', '{\"id\":19,\"name\":\"Open\",\"pipeline_id\":4,\"pipeline_stage_probability_id\":9,\"external_id\":\"df46868b-20ea-453d-83cb-a15e4158022b\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(63, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 20, '[]', '{\"id\":20,\"name\":\"Invoiced\",\"pipeline_id\":4,\"pipeline_stage_probability_id\":11,\"external_id\":\"08714670-daa8-442e-b719-d70bbbebd138\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(64, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 21, '[]', '{\"id\":21,\"name\":\"Delivered\",\"pipeline_id\":4,\"pipeline_stage_probability_id\":11,\"external_id\":\"4e971f0b-369a-4c90-a47a-76c1821ae455\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(65, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 22, '[]', '{\"id\":22,\"name\":\"Completed\",\"pipeline_id\":4,\"pipeline_stage_probability_id\":11,\"external_id\":\"d7451379-91ba-4c38-a9cb-09bd89d68493\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(66, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 23, '[]', '{\"id\":23,\"name\":\"Draft\",\"pipeline_id\":5,\"pipeline_stage_probability_id\":1,\"external_id\":\"4be92c35-75f7-4e2d-a2c1-7502f9035ddc\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(67, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 24, '[]', '{\"id\":24,\"name\":\"Awaiting Approval\",\"pipeline_id\":5,\"pipeline_stage_probability_id\":5,\"external_id\":\"41351822-7fa9-43c2-82cd-909d6faa9df8\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(68, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 25, '[]', '{\"id\":25,\"name\":\"Awaiting Payment\",\"pipeline_id\":5,\"pipeline_stage_probability_id\":9,\"external_id\":\"213168b6-6b2a-4ea6-980b-dc6e639c55bd\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(69, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 26, '[]', '{\"id\":26,\"name\":\"Paid\",\"pipeline_id\":5,\"pipeline_stage_probability_id\":11,\"external_id\":\"66f43e90-e956-46ed-84b8-213ea08a28ef\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(70, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 27, '[]', '{\"id\":27,\"name\":\"Draft\",\"pipeline_id\":6,\"pipeline_stage_probability_id\":1,\"external_id\":\"2a201fef-7e8d-4873-b06f-9412f9783755\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(71, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 28, '[]', '{\"id\":28,\"name\":\"Packed\",\"pipeline_id\":6,\"pipeline_stage_probability_id\":9,\"external_id\":\"41440781-f01e-4433-bf9e-26754098d616\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(72, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 29, '[]', '{\"id\":29,\"name\":\"Sent\",\"pipeline_id\":6,\"pipeline_stage_probability_id\":11,\"external_id\":\"d6633114-1692-4f24-ae93-41af34f04b4f\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(73, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 30, '[]', '{\"id\":30,\"name\":\"Delivered\",\"pipeline_id\":6,\"pipeline_stage_probability_id\":11,\"external_id\":\"894b5d05-c3ac-4954-ba5d-5b0d1a843b34\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(74, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 31, '[]', '{\"id\":31,\"name\":\"Draft\",\"pipeline_id\":7,\"pipeline_stage_probability_id\":1,\"external_id\":\"5e7d0285-3720-4adc-a13e-9db68ee81aef\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(75, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 32, '[]', '{\"id\":32,\"name\":\"Awaiting Approval\",\"pipeline_id\":7,\"pipeline_stage_probability_id\":5,\"external_id\":\"d7c2c04a-59d6-461d-97ae-105162145702\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(76, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 33, '[]', '{\"id\":33,\"name\":\"Approved\",\"pipeline_id\":7,\"pipeline_stage_probability_id\":9,\"external_id\":\"41c4ecb9-6b40-4c4b-9754-15c042c9f309\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(77, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\PipelineStage', 34, '[]', '{\"id\":34,\"name\":\"Paid\",\"pipeline_id\":7,\"pipeline_stage_probability_id\":11,\"external_id\":\"4a83b457-f4d3-498f-800e-7f893452cc9a\"}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(78, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 8, '[]', '{\"global\":1,\"name\":\"db_seeded_pipelines_stages\",\"value\":1,\"id\":8}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(79, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 1, '[]', '{\"name\":\"Africa\\/Abidjan\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":1}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(80, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 2, '[]', '{\"name\":\"Africa\\/Accra\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":2}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(81, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 3, '[]', '{\"name\":\"Africa\\/Addis_Ababa\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":3}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(82, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 4, '[]', '{\"name\":\"Africa\\/Algiers\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":4}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(83, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 5, '[]', '{\"name\":\"Africa\\/Asmara\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":5}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(84, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 6, '[]', '{\"name\":\"Africa\\/Bamako\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":6}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(85, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 7, '[]', '{\"name\":\"Africa\\/Bangui\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":7}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(86, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 8, '[]', '{\"name\":\"Africa\\/Banjul\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":8}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(87, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 9, '[]', '{\"name\":\"Africa\\/Bissau\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":9}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(88, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 10, '[]', '{\"name\":\"Africa\\/Blantyre\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":10}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(89, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 11, '[]', '{\"name\":\"Africa\\/Brazzaville\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":11}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(90, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 12, '[]', '{\"name\":\"Africa\\/Bujumbura\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":12}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(91, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 13, '[]', '{\"name\":\"Africa\\/Cairo\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":13}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(92, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 14, '[]', '{\"name\":\"Africa\\/Casablanca\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":14}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(93, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 15, '[]', '{\"name\":\"Africa\\/Ceuta\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":15}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(94, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 16, '[]', '{\"name\":\"Africa\\/Conakry\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":16}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(95, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 17, '[]', '{\"name\":\"Africa\\/Dakar\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":17}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(96, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 18, '[]', '{\"name\":\"Africa\\/Dar_es_Salaam\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":18}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(97, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 19, '[]', '{\"name\":\"Africa\\/Djibouti\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":19}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(98, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 20, '[]', '{\"name\":\"Africa\\/Douala\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":20}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(99, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 21, '[]', '{\"name\":\"Africa\\/El_Aaiun\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":21}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(100, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 22, '[]', '{\"name\":\"Africa\\/Freetown\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":22}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(101, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 23, '[]', '{\"name\":\"Africa\\/Gaborone\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":23}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(102, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 24, '[]', '{\"name\":\"Africa\\/Harare\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":24}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(103, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 25, '[]', '{\"name\":\"Africa\\/Johannesburg\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":25}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(104, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 26, '[]', '{\"name\":\"Africa\\/Juba\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":26}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(105, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 27, '[]', '{\"name\":\"Africa\\/Kampala\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":27}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(106, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 28, '[]', '{\"name\":\"Africa\\/Khartoum\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":28}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(107, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 29, '[]', '{\"name\":\"Africa\\/Kigali\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":29}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(108, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 30, '[]', '{\"name\":\"Africa\\/Kinshasa\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":30}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(109, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 31, '[]', '{\"name\":\"Africa\\/Lagos\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":31}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(110, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 32, '[]', '{\"name\":\"Africa\\/Libreville\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":32}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(111, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 33, '[]', '{\"name\":\"Africa\\/Lome\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":33}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(112, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 34, '[]', '{\"name\":\"Africa\\/Luanda\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":34}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(113, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 35, '[]', '{\"name\":\"Africa\\/Lubumbashi\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":35}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(114, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 36, '[]', '{\"name\":\"Africa\\/Lusaka\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":36}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(115, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 37, '[]', '{\"name\":\"Africa\\/Malabo\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":37}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(116, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 38, '[]', '{\"name\":\"Africa\\/Maputo\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":38}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(117, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 39, '[]', '{\"name\":\"Africa\\/Maseru\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":39}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(118, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 40, '[]', '{\"name\":\"Africa\\/Mbabane\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":40}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(119, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 41, '[]', '{\"name\":\"Africa\\/Mogadishu\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":41}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(120, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 42, '[]', '{\"name\":\"Africa\\/Monrovia\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":42}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(121, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 43, '[]', '{\"name\":\"Africa\\/Nairobi\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":43}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(122, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 44, '[]', '{\"name\":\"Africa\\/Ndjamena\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":44}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(123, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 45, '[]', '{\"name\":\"Africa\\/Niamey\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":45}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(124, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 46, '[]', '{\"name\":\"Africa\\/Nouakchott\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":46}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(125, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 47, '[]', '{\"name\":\"Africa\\/Ouagadougou\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":47}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(126, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 48, '[]', '{\"name\":\"Africa\\/Porto-Novo\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":48}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(127, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 49, '[]', '{\"name\":\"Africa\\/Sao_Tome\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":49}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(128, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 50, '[]', '{\"name\":\"Africa\\/Tripoli\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":50}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(129, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 51, '[]', '{\"name\":\"Africa\\/Tunis\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":51}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(130, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 52, '[]', '{\"name\":\"Africa\\/Windhoek\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":52}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(131, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 53, '[]', '{\"name\":\"America\\/Adak\",\"offset\":\"-09:00\",\"diff_from_gtm\":\"UTC\\/GMT -09:00\",\"id\":53}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 01:08:28', '2024-11-01 01:08:28'),
(132, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 54, '[]', '{\"name\":\"America\\/Anchorage\",\"offset\":\"-08:00\",\"diff_from_gtm\":\"UTC\\/GMT -08:00\",\"id\":54}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(133, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 55, '[]', '{\"name\":\"America\\/Anguilla\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":55}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(134, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 56, '[]', '{\"name\":\"America\\/Antigua\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":56}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(135, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 57, '[]', '{\"name\":\"America\\/Araguaina\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":57}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(136, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 58, '[]', '{\"name\":\"America\\/Argentina\\/Buenos_Aires\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":58}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(137, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 59, '[]', '{\"name\":\"America\\/Argentina\\/Catamarca\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":59}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(138, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 60, '[]', '{\"name\":\"America\\/Argentina\\/Cordoba\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":60}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(139, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 61, '[]', '{\"name\":\"America\\/Argentina\\/Jujuy\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":61}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(140, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 62, '[]', '{\"name\":\"America\\/Argentina\\/La_Rioja\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":62}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(141, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 63, '[]', '{\"name\":\"America\\/Argentina\\/Mendoza\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":63}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(142, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 64, '[]', '{\"name\":\"America\\/Argentina\\/Rio_Gallegos\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":64}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(143, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 65, '[]', '{\"name\":\"America\\/Argentina\\/Salta\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":65}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(144, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 66, '[]', '{\"name\":\"America\\/Argentina\\/San_Juan\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":66}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(145, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 67, '[]', '{\"name\":\"America\\/Argentina\\/San_Luis\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":67}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(146, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 68, '[]', '{\"name\":\"America\\/Argentina\\/Tucuman\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":68}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(147, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 69, '[]', '{\"name\":\"America\\/Argentina\\/Ushuaia\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":69}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(148, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 70, '[]', '{\"name\":\"America\\/Aruba\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":70}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(149, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 71, '[]', '{\"name\":\"America\\/Asuncion\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":71}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(150, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 72, '[]', '{\"name\":\"America\\/Atikokan\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":72}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(151, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 73, '[]', '{\"name\":\"America\\/Bahia\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":73}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(152, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 74, '[]', '{\"name\":\"America\\/Bahia_Banderas\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":74}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(153, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 75, '[]', '{\"name\":\"America\\/Barbados\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":75}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(154, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 76, '[]', '{\"name\":\"America\\/Belem\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":76}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(155, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 77, '[]', '{\"name\":\"America\\/Belize\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":77}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(156, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 78, '[]', '{\"name\":\"America\\/Blanc-Sablon\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":78}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(157, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 79, '[]', '{\"name\":\"America\\/Boa_Vista\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":79}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(158, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 80, '[]', '{\"name\":\"America\\/Bogota\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":80}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(159, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 81, '[]', '{\"name\":\"America\\/Boise\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":81}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(160, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 82, '[]', '{\"name\":\"America\\/Cambridge_Bay\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":82}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(161, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 83, '[]', '{\"name\":\"America\\/Campo_Grande\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":83}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(162, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 84, '[]', '{\"name\":\"America\\/Cancun\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":84}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(163, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 85, '[]', '{\"name\":\"America\\/Caracas\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":85}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(164, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 86, '[]', '{\"name\":\"America\\/Cayenne\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":86}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(165, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 87, '[]', '{\"name\":\"America\\/Cayman\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":87}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(166, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 88, '[]', '{\"name\":\"America\\/Chicago\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":88}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(167, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 89, '[]', '{\"name\":\"America\\/Chihuahua\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":89}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(168, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 90, '[]', '{\"name\":\"America\\/Ciudad_Juarez\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":90}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(169, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 91, '[]', '{\"name\":\"America\\/Costa_Rica\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":91}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(170, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 92, '[]', '{\"name\":\"America\\/Creston\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":92}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(171, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 93, '[]', '{\"name\":\"America\\/Cuiaba\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":93}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(172, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 94, '[]', '{\"name\":\"America\\/Curacao\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":94}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(173, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 95, '[]', '{\"name\":\"America\\/Danmarkshavn\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":95}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(174, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 96, '[]', '{\"name\":\"America\\/Dawson\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":96}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(175, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 97, '[]', '{\"name\":\"America\\/Dawson_Creek\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":97}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(176, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 98, '[]', '{\"name\":\"America\\/Denver\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":98}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(177, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 99, '[]', '{\"name\":\"America\\/Detroit\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":99}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(178, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 100, '[]', '{\"name\":\"America\\/Dominica\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":100}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(179, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 101, '[]', '{\"name\":\"America\\/Edmonton\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":101}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(180, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 102, '[]', '{\"name\":\"America\\/Eirunepe\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":102}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(181, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 103, '[]', '{\"name\":\"America\\/El_Salvador\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":103}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(182, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 104, '[]', '{\"name\":\"America\\/Fort_Nelson\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":104}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(183, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 105, '[]', '{\"name\":\"America\\/Fortaleza\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":105}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(184, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 106, '[]', '{\"name\":\"America\\/Glace_Bay\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":106}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(185, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 107, '[]', '{\"name\":\"America\\/Goose_Bay\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":107}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(186, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 108, '[]', '{\"name\":\"America\\/Grand_Turk\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":108}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(187, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 109, '[]', '{\"name\":\"America\\/Grenada\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":109}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(188, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 110, '[]', '{\"name\":\"America\\/Guadeloupe\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":110}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(189, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 111, '[]', '{\"name\":\"America\\/Guatemala\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":111}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(190, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 112, '[]', '{\"name\":\"America\\/Guayaquil\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":112}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(191, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 113, '[]', '{\"name\":\"America\\/Guyana\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":113}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(192, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 114, '[]', '{\"name\":\"America\\/Halifax\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":114}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(193, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 115, '[]', '{\"name\":\"America\\/Havana\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":115}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(194, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 116, '[]', '{\"name\":\"America\\/Hermosillo\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":116}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(195, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 117, '[]', '{\"name\":\"America\\/Indiana\\/Indianapolis\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":117}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(196, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 118, '[]', '{\"name\":\"America\\/Indiana\\/Knox\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":118}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(197, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 119, '[]', '{\"name\":\"America\\/Indiana\\/Marengo\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":119}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(198, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 120, '[]', '{\"name\":\"America\\/Indiana\\/Petersburg\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":120}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(199, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 121, '[]', '{\"name\":\"America\\/Indiana\\/Tell_City\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":121}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(200, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 122, '[]', '{\"name\":\"America\\/Indiana\\/Vevay\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":122}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(201, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 123, '[]', '{\"name\":\"America\\/Indiana\\/Vincennes\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":123}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(202, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 124, '[]', '{\"name\":\"America\\/Indiana\\/Winamac\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":124}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(203, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 125, '[]', '{\"name\":\"America\\/Inuvik\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":125}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(204, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 126, '[]', '{\"name\":\"America\\/Iqaluit\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":126}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(205, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 127, '[]', '{\"name\":\"America\\/Jamaica\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":127}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(206, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 128, '[]', '{\"name\":\"America\\/Juneau\",\"offset\":\"-08:00\",\"diff_from_gtm\":\"UTC\\/GMT -08:00\",\"id\":128}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(207, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 129, '[]', '{\"name\":\"America\\/Kentucky\\/Louisville\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":129}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(208, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 130, '[]', '{\"name\":\"America\\/Kentucky\\/Monticello\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":130}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(209, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 131, '[]', '{\"name\":\"America\\/Kralendijk\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":131}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(210, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 132, '[]', '{\"name\":\"America\\/La_Paz\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":132}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(211, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 133, '[]', '{\"name\":\"America\\/Lima\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":133}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(212, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 134, '[]', '{\"name\":\"America\\/Los_Angeles\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":134}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(213, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 135, '[]', '{\"name\":\"America\\/Lower_Princes\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":135}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(214, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 136, '[]', '{\"name\":\"America\\/Maceio\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":136}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(215, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 137, '[]', '{\"name\":\"America\\/Managua\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":137}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(216, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 138, '[]', '{\"name\":\"America\\/Manaus\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":138}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(217, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 139, '[]', '{\"name\":\"America\\/Marigot\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":139}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(218, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 140, '[]', '{\"name\":\"America\\/Martinique\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":140}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(219, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 141, '[]', '{\"name\":\"America\\/Matamoros\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":141}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(220, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 142, '[]', '{\"name\":\"America\\/Mazatlan\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":142}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(221, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 143, '[]', '{\"name\":\"America\\/Menominee\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":143}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(222, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 144, '[]', '{\"name\":\"America\\/Merida\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":144}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(223, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 145, '[]', '{\"name\":\"America\\/Metlakatla\",\"offset\":\"-08:00\",\"diff_from_gtm\":\"UTC\\/GMT -08:00\",\"id\":145}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(224, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 146, '[]', '{\"name\":\"America\\/Mexico_City\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":146}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(225, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 147, '[]', '{\"name\":\"America\\/Miquelon\",\"offset\":\"-02:00\",\"diff_from_gtm\":\"UTC\\/GMT -02:00\",\"id\":147}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 08:08:28', '2024-11-01 08:08:28'),
(226, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 148, '[]', '{\"name\":\"America\\/Moncton\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":148}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(227, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 149, '[]', '{\"name\":\"America\\/Monterrey\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":149}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(228, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 150, '[]', '{\"name\":\"America\\/Montevideo\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":150}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(229, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 151, '[]', '{\"name\":\"America\\/Montserrat\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":151}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(230, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 152, '[]', '{\"name\":\"America\\/Nassau\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":152}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(231, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 153, '[]', '{\"name\":\"America\\/New_York\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":153}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(232, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 154, '[]', '{\"name\":\"America\\/Nome\",\"offset\":\"-08:00\",\"diff_from_gtm\":\"UTC\\/GMT -08:00\",\"id\":154}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(233, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 155, '[]', '{\"name\":\"America\\/Noronha\",\"offset\":\"-02:00\",\"diff_from_gtm\":\"UTC\\/GMT -02:00\",\"id\":155}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 08:08:28', '2024-11-01 08:08:28'),
(234, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 156, '[]', '{\"name\":\"America\\/North_Dakota\\/Beulah\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":156}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(235, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 157, '[]', '{\"name\":\"America\\/North_Dakota\\/Center\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":157}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(236, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 158, '[]', '{\"name\":\"America\\/North_Dakota\\/New_Salem\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":158}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(237, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 159, '[]', '{\"name\":\"America\\/Nuuk\",\"offset\":\"-02:00\",\"diff_from_gtm\":\"UTC\\/GMT -02:00\",\"id\":159}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 08:08:28', '2024-11-01 08:08:28'),
(238, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 160, '[]', '{\"name\":\"America\\/Ojinaga\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":160}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(239, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 161, '[]', '{\"name\":\"America\\/Panama\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":161}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(240, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 162, '[]', '{\"name\":\"America\\/Paramaribo\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":162}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(241, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 163, '[]', '{\"name\":\"America\\/Phoenix\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":163}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(242, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 164, '[]', '{\"name\":\"America\\/Port-au-Prince\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":164}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(243, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 165, '[]', '{\"name\":\"America\\/Port_of_Spain\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":165}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(244, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 166, '[]', '{\"name\":\"America\\/Porto_Velho\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":166}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(245, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 167, '[]', '{\"name\":\"America\\/Puerto_Rico\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":167}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(246, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 168, '[]', '{\"name\":\"America\\/Punta_Arenas\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":168}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(247, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 169, '[]', '{\"name\":\"America\\/Rankin_Inlet\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":169}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(248, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 170, '[]', '{\"name\":\"America\\/Recife\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":170}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(249, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 171, '[]', '{\"name\":\"America\\/Regina\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":171}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(250, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 172, '[]', '{\"name\":\"America\\/Resolute\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":172}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(251, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 173, '[]', '{\"name\":\"America\\/Rio_Branco\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":173}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(252, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 174, '[]', '{\"name\":\"America\\/Santarem\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":174}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(253, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 175, '[]', '{\"name\":\"America\\/Santiago\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":175}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(254, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 176, '[]', '{\"name\":\"America\\/Santo_Domingo\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":176}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(255, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 177, '[]', '{\"name\":\"America\\/Sao_Paulo\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":177}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(256, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 178, '[]', '{\"name\":\"America\\/Scoresbysund\",\"offset\":\"-01:00\",\"diff_from_gtm\":\"UTC\\/GMT -01:00\",\"id\":178}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 09:08:28', '2024-11-01 09:08:28'),
(257, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 179, '[]', '{\"name\":\"America\\/Sitka\",\"offset\":\"-08:00\",\"diff_from_gtm\":\"UTC\\/GMT -08:00\",\"id\":179}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(258, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 180, '[]', '{\"name\":\"America\\/St_Barthelemy\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":180}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(259, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 181, '[]', '{\"name\":\"America\\/St_Johns\",\"offset\":\"-02:30\",\"diff_from_gtm\":\"UTC\\/GMT -02:30\",\"id\":181}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:38:28', '2024-11-01 07:38:28'),
(260, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 182, '[]', '{\"name\":\"America\\/St_Kitts\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":182}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(261, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 183, '[]', '{\"name\":\"America\\/St_Lucia\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":183}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(262, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 184, '[]', '{\"name\":\"America\\/St_Thomas\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":184}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(263, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 185, '[]', '{\"name\":\"America\\/St_Vincent\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":185}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(264, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 186, '[]', '{\"name\":\"America\\/Swift_Current\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":186}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(265, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 187, '[]', '{\"name\":\"America\\/Tegucigalpa\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":187}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(266, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 188, '[]', '{\"name\":\"America\\/Thule\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":188}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(267, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 189, '[]', '{\"name\":\"America\\/Tijuana\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":189}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(268, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 190, '[]', '{\"name\":\"America\\/Toronto\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":190}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(269, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 191, '[]', '{\"name\":\"America\\/Tortola\",\"offset\":\"-04:00\",\"diff_from_gtm\":\"UTC\\/GMT -04:00\",\"id\":191}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(270, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 192, '[]', '{\"name\":\"America\\/Vancouver\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":192}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(271, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 193, '[]', '{\"name\":\"America\\/Whitehorse\",\"offset\":\"-07:00\",\"diff_from_gtm\":\"UTC\\/GMT -07:00\",\"id\":193}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(272, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 194, '[]', '{\"name\":\"America\\/Winnipeg\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":194}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(273, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 195, '[]', '{\"name\":\"America\\/Yakutat\",\"offset\":\"-08:00\",\"diff_from_gtm\":\"UTC\\/GMT -08:00\",\"id\":195}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(274, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 196, '[]', '{\"name\":\"Antarctica\\/Casey\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":196}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(275, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 197, '[]', '{\"name\":\"Antarctica\\/Davis\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":197}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(276, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 198, '[]', '{\"name\":\"Antarctica\\/DumontDUrville\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":198}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(277, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 199, '[]', '{\"name\":\"Antarctica\\/Macquarie\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":199}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(278, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 200, '[]', '{\"name\":\"Antarctica\\/Mawson\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":200}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(279, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 201, '[]', '{\"name\":\"Antarctica\\/McMurdo\",\"offset\":\"+13:00\",\"diff_from_gtm\":\"UTC\\/GMT +13:00\",\"id\":201}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 23:08:28', '2024-11-01 23:08:28'),
(280, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 202, '[]', '{\"name\":\"Antarctica\\/Palmer\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":202}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(281, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 203, '[]', '{\"name\":\"Antarctica\\/Rothera\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":203}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(282, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 204, '[]', '{\"name\":\"Antarctica\\/Syowa\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":204}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(283, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 205, '[]', '{\"name\":\"Antarctica\\/Troll\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":205}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(284, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 206, '[]', '{\"name\":\"Antarctica\\/Vostok\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":206}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(285, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 207, '[]', '{\"name\":\"Arctic\\/Longyearbyen\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":207}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(286, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 208, '[]', '{\"name\":\"Asia\\/Aden\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":208}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(287, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 209, '[]', '{\"name\":\"Asia\\/Almaty\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":209}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(288, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 210, '[]', '{\"name\":\"Asia\\/Amman\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":210}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(289, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 211, '[]', '{\"name\":\"Asia\\/Anadyr\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":211}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:28', '2024-11-01 22:08:28'),
(290, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 212, '[]', '{\"name\":\"Asia\\/Aqtau\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":212}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(291, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 213, '[]', '{\"name\":\"Asia\\/Aqtobe\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":213}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(292, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 214, '[]', '{\"name\":\"Asia\\/Ashgabat\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":214}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(293, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 215, '[]', '{\"name\":\"Asia\\/Atyrau\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":215}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(294, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 216, '[]', '{\"name\":\"Asia\\/Baghdad\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":216}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(295, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 217, '[]', '{\"name\":\"Asia\\/Bahrain\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":217}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(296, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 218, '[]', '{\"name\":\"Asia\\/Baku\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":218}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(297, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 219, '[]', '{\"name\":\"Asia\\/Bangkok\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":219}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(298, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 220, '[]', '{\"name\":\"Asia\\/Barnaul\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":220}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(299, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 221, '[]', '{\"name\":\"Asia\\/Beirut\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":221}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(300, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 222, '[]', '{\"name\":\"Asia\\/Bishkek\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":222}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(301, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 223, '[]', '{\"name\":\"Asia\\/Brunei\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":223}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(302, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 224, '[]', '{\"name\":\"Asia\\/Chita\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":224}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(303, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 225, '[]', '{\"name\":\"Asia\\/Choibalsan\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":225}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(304, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 226, '[]', '{\"name\":\"Asia\\/Colombo\",\"offset\":\"+05:30\",\"diff_from_gtm\":\"UTC\\/GMT +05:30\",\"id\":226}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:38:28', '2024-11-01 15:38:28'),
(305, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 227, '[]', '{\"name\":\"Asia\\/Damascus\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":227}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(306, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 228, '[]', '{\"name\":\"Asia\\/Dhaka\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":228}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(307, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 229, '[]', '{\"name\":\"Asia\\/Dili\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":229}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(308, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 230, '[]', '{\"name\":\"Asia\\/Dubai\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":230}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(309, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 231, '[]', '{\"name\":\"Asia\\/Dushanbe\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":231}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(310, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 232, '[]', '{\"name\":\"Asia\\/Famagusta\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":232}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(311, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 233, '[]', '{\"name\":\"Asia\\/Gaza\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":233}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(312, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 234, '[]', '{\"name\":\"Asia\\/Hebron\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":234}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(313, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 235, '[]', '{\"name\":\"Asia\\/Ho_Chi_Minh\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":235}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(314, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 236, '[]', '{\"name\":\"Asia\\/Hong_Kong\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":236}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(315, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 237, '[]', '{\"name\":\"Asia\\/Hovd\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":237}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(316, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 238, '[]', '{\"name\":\"Asia\\/Irkutsk\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":238}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(317, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 239, '[]', '{\"name\":\"Asia\\/Jakarta\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":239}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(318, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 240, '[]', '{\"name\":\"Asia\\/Jayapura\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":240}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(319, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 241, '[]', '{\"name\":\"Asia\\/Jerusalem\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":241}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(320, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 242, '[]', '{\"name\":\"Asia\\/Kabul\",\"offset\":\"+04:30\",\"diff_from_gtm\":\"UTC\\/GMT +04:30\",\"id\":242}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:38:28', '2024-11-01 14:38:28'),
(321, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 243, '[]', '{\"name\":\"Asia\\/Kamchatka\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":243}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:28', '2024-11-01 22:08:28'),
(322, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 244, '[]', '{\"name\":\"Asia\\/Karachi\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":244}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(323, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 245, '[]', '{\"name\":\"Asia\\/Kathmandu\",\"offset\":\"+05:45\",\"diff_from_gtm\":\"UTC\\/GMT +05:45\",\"id\":245}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:53:28', '2024-11-01 15:53:28'),
(324, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 246, '[]', '{\"name\":\"Asia\\/Khandyga\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":246}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(325, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 247, '[]', '{\"name\":\"Asia\\/Kolkata\",\"offset\":\"+05:30\",\"diff_from_gtm\":\"UTC\\/GMT +05:30\",\"id\":247}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:38:28', '2024-11-01 15:38:28'),
(326, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 248, '[]', '{\"name\":\"Asia\\/Krasnoyarsk\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":248}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(327, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 249, '[]', '{\"name\":\"Asia\\/Kuala_Lumpur\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":249}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(328, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 250, '[]', '{\"name\":\"Asia\\/Kuching\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":250}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(329, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 251, '[]', '{\"name\":\"Asia\\/Kuwait\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":251}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(330, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 252, '[]', '{\"name\":\"Asia\\/Macau\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":252}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(331, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 253, '[]', '{\"name\":\"Asia\\/Magadan\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":253}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(332, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 254, '[]', '{\"name\":\"Asia\\/Makassar\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":254}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(333, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 255, '[]', '{\"name\":\"Asia\\/Manila\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":255}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(334, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 256, '[]', '{\"name\":\"Asia\\/Muscat\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":256}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(335, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 257, '[]', '{\"name\":\"Asia\\/Nicosia\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":257}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(336, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 258, '[]', '{\"name\":\"Asia\\/Novokuznetsk\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":258}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(337, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 259, '[]', '{\"name\":\"Asia\\/Novosibirsk\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":259}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(338, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 260, '[]', '{\"name\":\"Asia\\/Omsk\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":260}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(339, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 261, '[]', '{\"name\":\"Asia\\/Oral\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":261}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(340, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 262, '[]', '{\"name\":\"Asia\\/Phnom_Penh\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":262}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(341, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 263, '[]', '{\"name\":\"Asia\\/Pontianak\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":263}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(342, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 264, '[]', '{\"name\":\"Asia\\/Pyongyang\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":264}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(343, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 265, '[]', '{\"name\":\"Asia\\/Qatar\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":265}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(344, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 266, '[]', '{\"name\":\"Asia\\/Qostanay\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":266}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(345, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 267, '[]', '{\"name\":\"Asia\\/Qyzylorda\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":267}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(346, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 268, '[]', '{\"name\":\"Asia\\/Riyadh\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":268}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(347, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 269, '[]', '{\"name\":\"Asia\\/Sakhalin\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":269}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(348, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 270, '[]', '{\"name\":\"Asia\\/Samarkand\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":270}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(349, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 271, '[]', '{\"name\":\"Asia\\/Seoul\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":271}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(350, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 272, '[]', '{\"name\":\"Asia\\/Shanghai\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":272}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(351, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 273, '[]', '{\"name\":\"Asia\\/Singapore\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":273}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(352, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 274, '[]', '{\"name\":\"Asia\\/Srednekolymsk\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":274}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(353, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 275, '[]', '{\"name\":\"Asia\\/Taipei\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":275}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(354, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 276, '[]', '{\"name\":\"Asia\\/Tashkent\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":276}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(355, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 277, '[]', '{\"name\":\"Asia\\/Tbilisi\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":277}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(356, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 278, '[]', '{\"name\":\"Asia\\/Tehran\",\"offset\":\"+03:30\",\"diff_from_gtm\":\"UTC\\/GMT +03:30\",\"id\":278}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:38:28', '2024-11-01 13:38:28'),
(357, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 279, '[]', '{\"name\":\"Asia\\/Thimphu\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":279}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(358, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 280, '[]', '{\"name\":\"Asia\\/Tokyo\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":280}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(359, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 281, '[]', '{\"name\":\"Asia\\/Tomsk\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":281}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(360, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 282, '[]', '{\"name\":\"Asia\\/Ulaanbaatar\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":282}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(361, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 283, '[]', '{\"name\":\"Asia\\/Urumqi\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":283}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(362, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 284, '[]', '{\"name\":\"Asia\\/Ust-Nera\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":284}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(363, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 285, '[]', '{\"name\":\"Asia\\/Vientiane\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":285}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(364, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 286, '[]', '{\"name\":\"Asia\\/Vladivostok\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":286}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(365, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 287, '[]', '{\"name\":\"Asia\\/Yakutsk\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":287}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(366, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 288, '[]', '{\"name\":\"Asia\\/Yangon\",\"offset\":\"+06:30\",\"diff_from_gtm\":\"UTC\\/GMT +06:30\",\"id\":288}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:38:28', '2024-11-01 16:38:28'),
(367, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 289, '[]', '{\"name\":\"Asia\\/Yekaterinburg\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":289}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(368, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 290, '[]', '{\"name\":\"Asia\\/Yerevan\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":290}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(369, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 291, '[]', '{\"name\":\"Atlantic\\/Azores\",\"offset\":\"-01:00\",\"diff_from_gtm\":\"UTC\\/GMT -01:00\",\"id\":291}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 09:08:28', '2024-11-01 09:08:28'),
(370, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 292, '[]', '{\"name\":\"Atlantic\\/Bermuda\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":292}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(371, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 293, '[]', '{\"name\":\"Atlantic\\/Canary\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":293}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(372, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 294, '[]', '{\"name\":\"Atlantic\\/Cape_Verde\",\"offset\":\"-01:00\",\"diff_from_gtm\":\"UTC\\/GMT -01:00\",\"id\":294}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 09:08:28', '2024-11-01 09:08:28'),
(373, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 295, '[]', '{\"name\":\"Atlantic\\/Faroe\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":295}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(374, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 296, '[]', '{\"name\":\"Atlantic\\/Madeira\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":296}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(375, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 297, '[]', '{\"name\":\"Atlantic\\/Reykjavik\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":297}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(376, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 298, '[]', '{\"name\":\"Atlantic\\/South_Georgia\",\"offset\":\"-02:00\",\"diff_from_gtm\":\"UTC\\/GMT -02:00\",\"id\":298}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 08:08:28', '2024-11-01 08:08:28'),
(377, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 299, '[]', '{\"name\":\"Atlantic\\/St_Helena\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":299}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(378, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 300, '[]', '{\"name\":\"Atlantic\\/Stanley\",\"offset\":\"-03:00\",\"diff_from_gtm\":\"UTC\\/GMT -03:00\",\"id\":300}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(379, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 301, '[]', '{\"name\":\"Australia\\/Adelaide\",\"offset\":\"+10:30\",\"diff_from_gtm\":\"UTC\\/GMT +10:30\",\"id\":301}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:38:28', '2024-11-01 20:38:28'),
(380, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 302, '[]', '{\"name\":\"Australia\\/Brisbane\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":302}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(381, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 303, '[]', '{\"name\":\"Australia\\/Broken_Hill\",\"offset\":\"+10:30\",\"diff_from_gtm\":\"UTC\\/GMT +10:30\",\"id\":303}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:38:28', '2024-11-01 20:38:28'),
(382, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 304, '[]', '{\"name\":\"Australia\\/Darwin\",\"offset\":\"+09:30\",\"diff_from_gtm\":\"UTC\\/GMT +09:30\",\"id\":304}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:38:28', '2024-11-01 19:38:28'),
(383, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 305, '[]', '{\"name\":\"Australia\\/Eucla\",\"offset\":\"+08:45\",\"diff_from_gtm\":\"UTC\\/GMT +08:45\",\"id\":305}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:53:28', '2024-11-01 18:53:28'),
(384, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 306, '[]', '{\"name\":\"Australia\\/Hobart\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":306}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(385, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 307, '[]', '{\"name\":\"Australia\\/Lindeman\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":307}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(386, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 308, '[]', '{\"name\":\"Australia\\/Lord_Howe\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":308}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(387, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 309, '[]', '{\"name\":\"Australia\\/Melbourne\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":309}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(388, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 310, '[]', '{\"name\":\"Australia\\/Perth\",\"offset\":\"+08:00\",\"diff_from_gtm\":\"UTC\\/GMT +08:00\",\"id\":310}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(389, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 311, '[]', '{\"name\":\"Australia\\/Sydney\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":311}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(390, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 312, '[]', '{\"name\":\"Europe\\/Amsterdam\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":312}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(391, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 313, '[]', '{\"name\":\"Europe\\/Andorra\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":313}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(392, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 314, '[]', '{\"name\":\"Europe\\/Astrakhan\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":314}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(393, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 315, '[]', '{\"name\":\"Europe\\/Athens\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":315}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(394, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 316, '[]', '{\"name\":\"Europe\\/Belgrade\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":316}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(395, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 317, '[]', '{\"name\":\"Europe\\/Berlin\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":317}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(396, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 318, '[]', '{\"name\":\"Europe\\/Bratislava\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":318}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(397, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 319, '[]', '{\"name\":\"Europe\\/Brussels\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":319}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(398, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 320, '[]', '{\"name\":\"Europe\\/Bucharest\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":320}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(399, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 321, '[]', '{\"name\":\"Europe\\/Budapest\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":321}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(400, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 322, '[]', '{\"name\":\"Europe\\/Busingen\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":322}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(401, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 323, '[]', '{\"name\":\"Europe\\/Chisinau\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":323}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(402, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 324, '[]', '{\"name\":\"Europe\\/Copenhagen\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":324}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(403, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 325, '[]', '{\"name\":\"Europe\\/Dublin\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":325}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(404, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 326, '[]', '{\"name\":\"Europe\\/Gibraltar\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":326}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(405, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 327, '[]', '{\"name\":\"Europe\\/Guernsey\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":327}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(406, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 328, '[]', '{\"name\":\"Europe\\/Helsinki\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":328}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(407, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 329, '[]', '{\"name\":\"Europe\\/Isle_of_Man\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":329}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(408, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 330, '[]', '{\"name\":\"Europe\\/Istanbul\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":330}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(409, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 331, '[]', '{\"name\":\"Europe\\/Jersey\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":331}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(410, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 332, '[]', '{\"name\":\"Europe\\/Kaliningrad\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":332}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(411, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 333, '[]', '{\"name\":\"Europe\\/Kirov\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":333}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(412, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 334, '[]', '{\"name\":\"Europe\\/Kyiv\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":334}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(413, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 335, '[]', '{\"name\":\"Europe\\/Lisbon\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":335}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(414, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 336, '[]', '{\"name\":\"Europe\\/Ljubljana\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":336}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(415, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 337, '[]', '{\"name\":\"Europe\\/London\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":337}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(416, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 338, '[]', '{\"name\":\"Europe\\/Luxembourg\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":338}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(417, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 339, '[]', '{\"name\":\"Europe\\/Madrid\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":339}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(418, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 340, '[]', '{\"name\":\"Europe\\/Malta\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":340}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(419, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 341, '[]', '{\"name\":\"Europe\\/Mariehamn\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":341}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(420, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 342, '[]', '{\"name\":\"Europe\\/Minsk\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":342}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(421, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 343, '[]', '{\"name\":\"Europe\\/Monaco\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":343}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(422, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 344, '[]', '{\"name\":\"Europe\\/Moscow\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":344}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(423, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 345, '[]', '{\"name\":\"Europe\\/Oslo\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":345}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(424, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 346, '[]', '{\"name\":\"Europe\\/Paris\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":346}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(425, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 347, '[]', '{\"name\":\"Europe\\/Podgorica\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":347}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(426, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 348, '[]', '{\"name\":\"Europe\\/Prague\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":348}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(427, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 349, '[]', '{\"name\":\"Europe\\/Riga\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":349}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(428, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 350, '[]', '{\"name\":\"Europe\\/Rome\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":350}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(429, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 351, '[]', '{\"name\":\"Europe\\/Samara\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":351}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(430, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 352, '[]', '{\"name\":\"Europe\\/San_Marino\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":352}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(431, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 353, '[]', '{\"name\":\"Europe\\/Sarajevo\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":353}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(432, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 354, '[]', '{\"name\":\"Europe\\/Saratov\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":354}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(433, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 355, '[]', '{\"name\":\"Europe\\/Simferopol\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":355}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(434, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 356, '[]', '{\"name\":\"Europe\\/Skopje\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":356}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(435, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 357, '[]', '{\"name\":\"Europe\\/Sofia\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":357}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(436, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 358, '[]', '{\"name\":\"Europe\\/Stockholm\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":358}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(437, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 359, '[]', '{\"name\":\"Europe\\/Tallinn\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":359}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(438, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 360, '[]', '{\"name\":\"Europe\\/Tirane\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":360}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(439, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 361, '[]', '{\"name\":\"Europe\\/Ulyanovsk\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":361}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(440, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 362, '[]', '{\"name\":\"Europe\\/Vaduz\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":362}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(441, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 363, '[]', '{\"name\":\"Europe\\/Vatican\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":363}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(442, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 364, '[]', '{\"name\":\"Europe\\/Vienna\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":364}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(443, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 365, '[]', '{\"name\":\"Europe\\/Vilnius\",\"offset\":\"+02:00\",\"diff_from_gtm\":\"UTC\\/GMT +02:00\",\"id\":365}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(444, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 366, '[]', '{\"name\":\"Europe\\/Volgograd\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":366}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(445, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 367, '[]', '{\"name\":\"Europe\\/Warsaw\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":367}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(446, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 368, '[]', '{\"name\":\"Europe\\/Zagreb\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":368}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(447, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 369, '[]', '{\"name\":\"Europe\\/Zurich\",\"offset\":\"+01:00\",\"diff_from_gtm\":\"UTC\\/GMT +01:00\",\"id\":369}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(448, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 370, '[]', '{\"name\":\"Indian\\/Antananarivo\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":370}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(449, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 371, '[]', '{\"name\":\"Indian\\/Chagos\",\"offset\":\"+06:00\",\"diff_from_gtm\":\"UTC\\/GMT +06:00\",\"id\":371}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:08:29', '2024-11-01 16:08:29'),
(450, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 372, '[]', '{\"name\":\"Indian\\/Christmas\",\"offset\":\"+07:00\",\"diff_from_gtm\":\"UTC\\/GMT +07:00\",\"id\":372}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 17:08:29', '2024-11-01 17:08:29'),
(451, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 373, '[]', '{\"name\":\"Indian\\/Cocos\",\"offset\":\"+06:30\",\"diff_from_gtm\":\"UTC\\/GMT +06:30\",\"id\":373}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 16:38:29', '2024-11-01 16:38:29'),
(452, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 374, '[]', '{\"name\":\"Indian\\/Comoro\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":374}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(453, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 375, '[]', '{\"name\":\"Indian\\/Kerguelen\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":375}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:29', '2024-11-01 15:08:29'),
(454, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 376, '[]', '{\"name\":\"Indian\\/Mahe\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":376}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(455, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 377, '[]', '{\"name\":\"Indian\\/Maldives\",\"offset\":\"+05:00\",\"diff_from_gtm\":\"UTC\\/GMT +05:00\",\"id\":377}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 15:08:29', '2024-11-01 15:08:29'),
(456, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 378, '[]', '{\"name\":\"Indian\\/Mauritius\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":378}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(457, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 379, '[]', '{\"name\":\"Indian\\/Mayotte\",\"offset\":\"+03:00\",\"diff_from_gtm\":\"UTC\\/GMT +03:00\",\"id\":379}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(458, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 380, '[]', '{\"name\":\"Indian\\/Reunion\",\"offset\":\"+04:00\",\"diff_from_gtm\":\"UTC\\/GMT +04:00\",\"id\":380}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(459, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 381, '[]', '{\"name\":\"Pacific\\/Apia\",\"offset\":\"+13:00\",\"diff_from_gtm\":\"UTC\\/GMT +13:00\",\"id\":381}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(460, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 382, '[]', '{\"name\":\"Pacific\\/Auckland\",\"offset\":\"+13:00\",\"diff_from_gtm\":\"UTC\\/GMT +13:00\",\"id\":382}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(461, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 383, '[]', '{\"name\":\"Pacific\\/Bougainville\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":383}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(462, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 384, '[]', '{\"name\":\"Pacific\\/Chatham\",\"offset\":\"+13:45\",\"diff_from_gtm\":\"UTC\\/GMT +13:45\",\"id\":384}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 23:53:29', '2024-11-01 23:53:29'),
(463, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 385, '[]', '{\"name\":\"Pacific\\/Chuuk\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":385}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:29', '2024-11-01 20:08:29'),
(464, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 386, '[]', '{\"name\":\"Pacific\\/Easter\",\"offset\":\"-05:00\",\"diff_from_gtm\":\"UTC\\/GMT -05:00\",\"id\":386}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 05:08:29', '2024-11-01 05:08:29'),
(465, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 387, '[]', '{\"name\":\"Pacific\\/Efate\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":387}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(466, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 388, '[]', '{\"name\":\"Pacific\\/Fakaofo\",\"offset\":\"+13:00\",\"diff_from_gtm\":\"UTC\\/GMT +13:00\",\"id\":388}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(467, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 389, '[]', '{\"name\":\"Pacific\\/Fiji\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":389}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(468, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 390, '[]', '{\"name\":\"Pacific\\/Funafuti\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":390}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(469, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 391, '[]', '{\"name\":\"Pacific\\/Galapagos\",\"offset\":\"-06:00\",\"diff_from_gtm\":\"UTC\\/GMT -06:00\",\"id\":391}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 04:08:29', '2024-11-01 04:08:29'),
(470, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 392, '[]', '{\"name\":\"Pacific\\/Gambier\",\"offset\":\"-09:00\",\"diff_from_gtm\":\"UTC\\/GMT -09:00\",\"id\":392}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 01:08:29', '2024-11-01 01:08:29'),
(471, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 393, '[]', '{\"name\":\"Pacific\\/Guadalcanal\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":393}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(472, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 394, '[]', '{\"name\":\"Pacific\\/Guam\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":394}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:29', '2024-11-01 20:08:29'),
(473, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 395, '[]', '{\"name\":\"Pacific\\/Honolulu\",\"offset\":\"-10:00\",\"diff_from_gtm\":\"UTC\\/GMT -10:00\",\"id\":395}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 00:08:29', '2024-11-01 00:08:29'),
(474, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 396, '[]', '{\"name\":\"Pacific\\/Kanton\",\"offset\":\"+13:00\",\"diff_from_gtm\":\"UTC\\/GMT +13:00\",\"id\":396}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(475, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 397, '[]', '{\"name\":\"Pacific\\/Kiritimati\",\"offset\":\"+14:00\",\"diff_from_gtm\":\"UTC\\/GMT +14:00\",\"id\":397}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-02 00:08:29', '2024-11-02 00:08:29'),
(476, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 398, '[]', '{\"name\":\"Pacific\\/Kosrae\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":398}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(477, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 399, '[]', '{\"name\":\"Pacific\\/Kwajalein\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":399}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(478, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 400, '[]', '{\"name\":\"Pacific\\/Majuro\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":400}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(479, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 401, '[]', '{\"name\":\"Pacific\\/Marquesas\",\"offset\":\"-09:30\",\"diff_from_gtm\":\"UTC\\/GMT -09:30\",\"id\":401}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 00:38:29', '2024-11-01 00:38:29'),
(480, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 402, '[]', '{\"name\":\"Pacific\\/Midway\",\"offset\":\"-11:00\",\"diff_from_gtm\":\"UTC\\/GMT -11:00\",\"id\":402}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-10-31 23:08:29', '2024-10-31 23:08:29'),
(481, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 403, '[]', '{\"name\":\"Pacific\\/Nauru\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":403}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(482, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 404, '[]', '{\"name\":\"Pacific\\/Niue\",\"offset\":\"-11:00\",\"diff_from_gtm\":\"UTC\\/GMT -11:00\",\"id\":404}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-10-31 23:08:29', '2024-10-31 23:08:29'),
(483, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 405, '[]', '{\"name\":\"Pacific\\/Norfolk\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":405}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(484, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 406, '[]', '{\"name\":\"Pacific\\/Noumea\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":406}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(485, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 407, '[]', '{\"name\":\"Pacific\\/Pago_Pago\",\"offset\":\"-11:00\",\"diff_from_gtm\":\"UTC\\/GMT -11:00\",\"id\":407}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-10-31 23:08:29', '2024-10-31 23:08:29'),
(486, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 408, '[]', '{\"name\":\"Pacific\\/Palau\",\"offset\":\"+09:00\",\"diff_from_gtm\":\"UTC\\/GMT +09:00\",\"id\":408}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 19:08:29', '2024-11-01 19:08:29'),
(487, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 409, '[]', '{\"name\":\"Pacific\\/Pitcairn\",\"offset\":\"-08:00\",\"diff_from_gtm\":\"UTC\\/GMT -08:00\",\"id\":409}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 02:08:29', '2024-11-01 02:08:29'),
(488, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 410, '[]', '{\"name\":\"Pacific\\/Pohnpei\",\"offset\":\"+11:00\",\"diff_from_gtm\":\"UTC\\/GMT +11:00\",\"id\":410}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(489, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 411, '[]', '{\"name\":\"Pacific\\/Port_Moresby\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":411}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:29', '2024-11-01 20:08:29'),
(490, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 412, '[]', '{\"name\":\"Pacific\\/Rarotonga\",\"offset\":\"-10:00\",\"diff_from_gtm\":\"UTC\\/GMT -10:00\",\"id\":412}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 00:08:29', '2024-11-01 00:08:29'),
(491, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 413, '[]', '{\"name\":\"Pacific\\/Saipan\",\"offset\":\"+10:00\",\"diff_from_gtm\":\"UTC\\/GMT +10:00\",\"id\":413}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 20:08:29', '2024-11-01 20:08:29'),
(492, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 414, '[]', '{\"name\":\"Pacific\\/Tahiti\",\"offset\":\"-10:00\",\"diff_from_gtm\":\"UTC\\/GMT -10:00\",\"id\":414}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 00:08:29', '2024-11-01 00:08:29'),
(493, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 415, '[]', '{\"name\":\"Pacific\\/Tarawa\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":415}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(494, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 416, '[]', '{\"name\":\"Pacific\\/Tongatapu\",\"offset\":\"+13:00\",\"diff_from_gtm\":\"UTC\\/GMT +13:00\",\"id\":416}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(495, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 417, '[]', '{\"name\":\"Pacific\\/Wake\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":417}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(496, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 418, '[]', '{\"name\":\"Pacific\\/Wallis\",\"offset\":\"+12:00\",\"diff_from_gtm\":\"UTC\\/GMT +12:00\",\"id\":418}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(497, NULL, NULL, 'created', 'VentureDrake\\LaravelCrm\\Models\\Timezone', 419, '[]', '{\"name\":\"UTC\",\"offset\":\"+00:00\",\"diff_from_gtm\":\"UTC\\/GMT +00:00\",\"id\":419}', 'artisan laravelcrm:install', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(498, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 9, '[]', '{\"name\":\"app_name\",\"value\":\"AorbisCRM\",\"global\":1,\"id\":9}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(499, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 10, '[]', '{\"name\":\"app_env\",\"value\":\"local\",\"global\":1,\"id\":10}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(500, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 11, '[]', '{\"name\":\"app_url\",\"value\":\"http:\\/\\/laravelcrm.test\",\"global\":1,\"id\":11}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(501, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 12, '[]', '{\"name\":\"version\",\"value\":\"1.2.2\",\"global\":1,\"id\":12}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(502, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 13, '[]', '{\"name\":\"team\",\"value\":\"related\",\"id\":13}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(503, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 14, '[]', '{\"name\":\"organisation_name\",\"value\":\"AorbisCRM\",\"id\":14}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(504, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 15, '[]', '{\"name\":\"currency\",\"value\":\"USD\",\"id\":15}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(505, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 16, '[]', '{\"name\":\"country\",\"value\":\"United States\",\"id\":16}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(506, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 17, '[]', '{\"name\":\"language\",\"value\":\"english\",\"id\":17}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(507, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 18, '[]', '{\"name\":\"timezone\",\"value\":\"UTC\",\"id\":18}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(508, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 19, '[]', '{\"name\":\"date_format\",\"value\":\"Y-m-d\",\"id\":19}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(509, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 20, '[]', '{\"name\":\"time_format\",\"value\":\"g:i A\",\"id\":20}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(510, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 21, '[]', '{\"name\":\"tax_name\",\"value\":\"Tax\",\"id\":21}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(511, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 22, '[]', '{\"name\":\"tax_rate\",\"value\":0,\"id\":22}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(512, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 23, '[]', '{\"name\":\"lead_prefix\",\"value\":\"LD-\",\"id\":23}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(513, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 24, '[]', '{\"name\":\"deal_prefix\",\"value\":\"DL-\",\"id\":24}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(514, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 25, '[]', '{\"name\":\"quote_prefix\",\"value\":\"QU-\",\"id\":25}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(515, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 26, '[]', '{\"name\":\"order_prefix\",\"value\":\"ORD-\",\"id\":26}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(516, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 27, '[]', '{\"name\":\"invoice_prefix\",\"value\":\"INV-\",\"id\":27}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(517, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 28, '[]', '{\"name\":\"delivery_prefix\",\"value\":\"DEL-\",\"id\":28}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(518, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 29, '[]', '{\"name\":\"purchase_order_prefix\",\"value\":\"PO-\",\"id\":29}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(519, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 30, '[]', '{\"name\":\"dynamic_products\",\"value\":\"1\",\"id\":30}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(520, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 31, '[]', '{\"name\":\"show_related_activity\",\"value\":\"0\",\"id\":31}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(521, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 32, '[]', '{\"global\":1,\"name\":\"db_update_0180\",\"value\":0,\"id\":32}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(522, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 33, '[]', '{\"global\":1,\"name\":\"db_update_0181\",\"value\":0,\"id\":33}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(523, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 34, '[]', '{\"global\":1,\"name\":\"db_update_0191\",\"value\":0,\"id\":34}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(524, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 35, '[]', '{\"global\":1,\"name\":\"db_update_0193\",\"value\":0,\"id\":35}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(525, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 36, '[]', '{\"global\":1,\"name\":\"db_update_0194\",\"value\":0,\"id\":36}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(526, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 37, '[]', '{\"global\":1,\"name\":\"db_update_0199\",\"value\":0,\"id\":37}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(527, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 38, '[]', '{\"global\":1,\"name\":\"db_update_1200\",\"value\":0,\"id\":38}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(528, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 39, '[]', '{\"name\":\"install_id\",\"value\":\"1dab6e0f-fe88-471b-86c6-2128f3cd9015\",\"global\":1,\"id\":39}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:38', '2024-11-01 10:09:38'),
(529, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 40, '[]', '{\"name\":\"version_latest\",\"value\":\"1.2.2\",\"global\":1,\"id\":40}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:38', '2024-11-01 10:09:38'),
(530, 'App\\Models\\User', 1, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 12, '[]', '[]', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:09:38', '2024-11-01 10:09:38'),
(531, NULL, NULL, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 32, '{\"value\":\"0\"}', '{\"value\":1}', 'artisan laravelcrm:update', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:27:11', '2024-11-01 10:27:11'),
(532, NULL, NULL, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 33, '{\"value\":\"0\"}', '{\"value\":1}', 'artisan laravelcrm:update', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:27:11', '2024-11-01 10:27:11'),
(533, NULL, NULL, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 34, '{\"value\":\"0\"}', '{\"value\":1}', 'artisan laravelcrm:update', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:27:12', '2024-11-01 10:27:12'),
(534, NULL, NULL, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 35, '{\"value\":\"0\"}', '{\"value\":1}', 'artisan laravelcrm:update', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:27:12', '2024-11-01 10:27:12'),
(535, NULL, NULL, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 36, '{\"value\":\"0\"}', '{\"value\":1}', 'artisan laravelcrm:update', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:27:12', '2024-11-01 10:27:12'),
(536, NULL, NULL, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 37, '{\"value\":\"0\"}', '{\"value\":1}', 'artisan laravelcrm:update', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:27:12', '2024-11-01 10:27:12'),
(537, NULL, NULL, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 38, '{\"value\":\"0\"}', '{\"value\":1}', 'artisan laravelcrm:update', '127.0.0.1', 'Symfony', NULL, '2024-11-01 10:27:12', '2024-11-01 10:27:12'),
(538, 'App\\Models\\User', 1, 'updated', 'VentureDrake\\LaravelCrm\\Models\\Setting', 11, '{\"value\":\"http:\\/\\/laravelcrm.test\"}', '{\"value\":\"http:\\/\\/192.168.253.129\\/aorbisCRM\"}', 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 10:32:10', '2024-11-01 10:32:10'),
(539, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 41, '[]', '{\"name\":\"view_leads\",\"value\":\"list\",\"user_id\":1,\"id\":41}', 'http://127.0.0.1:8000/leads', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 13:44:04', '2024-11-01 13:44:04'),
(540, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 42, '[]', '{\"name\":\"view_deals\",\"value\":\"list\",\"user_id\":1,\"id\":42}', 'http://127.0.0.1:8000/deals', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 13:44:31', '2024-11-01 13:44:31'),
(541, 'App\\Models\\User', 1, 'created', 'VentureDrake\\LaravelCrm\\Models\\Setting', 43, '[]', '{\"name\":\"view_quotes\",\"value\":\"list\",\"user_id\":1,\"id\":43}', 'http://127.0.0.1:8000/quotes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', NULL, '2024-11-01 16:19:16', '2024-11-01 16:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE `calls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `finish_at` datetime DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminder_email` tinyint(1) NOT NULL DEFAULT 0,
  `reminder_sms` tinyint(1) NOT NULL DEFAULT 0,
  `callable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `callable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `clientable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactable_id` bigint(20) UNSIGNED NOT NULL,
  `entityable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entityable_id` bigint(20) UNSIGNED NOT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_contact_type`
--

CREATE TABLE `contact_contact_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_types`
--

CREATE TABLE `contact_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_types`
--

INSERT INTO `contact_types` (`id`, `team_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Primary', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(2, NULL, 'Secondary', NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crm_teams`
--

CREATE TABLE `crm_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_team_invitations`
--

CREATE TABLE `crm_team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `crm_team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_team_user`
--

CREATE TABLE `crm_team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `crm_team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lead_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `organisation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deal_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `qualified` tinyint(1) NOT NULL DEFAULT 0,
  `expected_close` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `closed_status` enum('won','lost') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_products`
--

CREATE TABLE `deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deal_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tax_rate` decimal(8,2) DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `delivery_initiated` datetime DEFAULT NULL,
  `delivery_shipped` datetime DEFAULT NULL,
  `delivery_expected` datetime DEFAULT NULL,
  `delivered_on` datetime DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_products`
--

CREATE TABLE `delivery_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_id` bigint(20) UNSIGNED NOT NULL,
  `order_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_desktop` tinyint(1) NOT NULL DEFAULT 0,
  `is_mobile` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_trusted` tinyint(1) NOT NULL DEFAULT 0,
  `is_untrusted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `user_id`, `user_type`, `platform`, `platform_version`, `browser`, `browser_version`, `is_desktop`, `is_mobile`, `language`, `is_trusted`, `is_untrusted`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\User', 'Windows', '10.0', 'Chrome', '130.0.0.0', 1, 0, 'en-gb', 0, 0, '2024-11-01 10:09:33', '2024-11-01 10:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  `type` enum('work','home','other') COLLATE utf8mb4_unicode_ci DEFAULT 'work',
  `emailable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailable_id` bigint(20) UNSIGNED NOT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('text','textarea','select','select_multiple','checkbox','checkbox_multiple','radio','date') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `default` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_groups`
--

CREATE TABLE `field_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_models`
--

CREATE TABLE `field_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_options`
--

CREATE TABLE `field_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_values`
--

CREATE TABLE `field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `field_valueable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_valueable_id` bigint(20) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fileable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileable_id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `organisation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` bigint(20) UNSIGNED NOT NULL,
  `issue_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `subtotal` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `adjustments` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `amount_due` int(11) DEFAULT NULL,
  `amount_paid` int(11) DEFAULT NULL,
  `fully_paid_at` datetime DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_lines`
--

CREATE TABLE `invoice_lines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tax_rate` decimal(8,2) DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labelables`
--

CREATE TABLE `labelables` (
  `label_id` bigint(20) NOT NULL,
  `labelable_id` bigint(20) NOT NULL,
  `labelable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `external_id`, `team_id`, `name`, `hex`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2fbea252-24e1-43af-a5c5-f454a2498a8c', NULL, 'Hot', 'dc3545', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(2, '996ba5ec-2669-46d4-b3cf-a3a5e1e5b3c1', NULL, 'Cold', '007bff', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(3, '47385263-8e5d-4a02-b002-6d37133c68e8', NULL, 'Warm', 'ffc107', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `organisation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `lead_status_id` smallint(5) UNSIGNED DEFAULT NULL,
  `lead_source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qualified` tinyint(1) NOT NULL DEFAULT 0,
  `expected_close` datetime DEFAULT NULL,
  `converted_at` datetime DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_statuses`
--

CREATE TABLE `lead_statuses` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_statuses`
--

INSERT INTO `lead_statuses` (`id`, `external_id`, `team_id`, `name`, `description`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'e58fc012-e195-4113-884c-8be0fda09de3', NULL, 'Lead In', NULL, NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(2, '2fdbb112-40e2-4794-824c-57ec05597609', NULL, 'Contacted', NULL, NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'auth',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `ip_address`, `type`, `user_id`, `user_type`, `device_id`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'auth', 1, 'App\\Models\\User', 1, '2024-11-01 10:09:33', '2024-11-01 10:09:33'),
(2, '127.0.0.1', 'auth', 1, 'App\\Models\\User', 1, '2024-11-01 10:32:09', '2024-11-01 10:32:09'),
(3, '127.0.0.1', 'auth', 1, 'App\\Models\\User', 1, '2024-11-01 11:36:03', '2024-11-01 11:36:03'),
(4, '127.0.0.1', 'auth', 1, 'App\\Models\\User', 1, '2024-11-01 13:38:41', '2024-11-01 13:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `lunches`
--

CREATE TABLE `lunches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `finish_at` datetime DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminder_email` tinyint(1) NOT NULL DEFAULT 0,
  `reminder_sms` tinyint(1) NOT NULL DEFAULT 0,
  `lunchable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lunchable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `finish_at` datetime DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminder_email` tinyint(1) NOT NULL DEFAULT 0,
  `reminder_sms` tinyint(1) NOT NULL DEFAULT 0,
  `meetingable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meetingable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_19_045621_create_permission_tables', 1),
(6, '2023_01_19_045622_add_teams_fields', 1),
(7, '2023_01_19_045623_create_laravel_crm_tables', 1),
(8, '2023_01_19_045624_create_laravel_crm_settings_table', 1),
(9, '2023_01_19_045625_add_fields_to_roles_permissions_tables', 1),
(10, '2023_01_19_045626_add_label_editable_fields_to_laravel_crm_settings_table', 1),
(11, '2023_01_19_045627_add_team_id_to_laravel_crm_tables', 1),
(12, '2023_01_19_045628_create_laravel_crm_products_table', 1),
(13, '2023_01_19_045629_create_laravel_crm_product_categories_table', 1),
(14, '2023_01_19_045630_create_laravel_crm_product_prices_table', 1),
(15, '2023_01_19_045631_create_laravel_crm_product_variations_table', 1),
(16, '2023_01_19_045632_create_laravel_crm_deal_products_table', 1),
(17, '2023_01_19_045633_add_global_to_laravel_crm_settings_table', 1),
(18, '2023_01_19_045634_alter_fields_for_encryption_on_laravel_crm_tables', 1),
(19, '2023_01_19_045635_create_laravel_crm_address_types_table', 1),
(20, '2023_01_19_045636_alter_type_on_laravel_crm_phones_table', 1),
(21, '2023_01_19_045637_add_description_to_laravel_crm_labels_table', 1),
(22, '2023_01_19_045638_add_name_to_laravel_crm_addresses_table', 1),
(23, '2023_01_19_045639_create_laravel_crm_contacts_table', 1),
(24, '2023_01_19_045640_create_laravel_crm_contact_types_table', 1),
(25, '2023_01_19_045641_create_laravel_crm_contact_contact_type_table', 1),
(26, '2023_01_19_045642_create_audits_table', 1),
(27, '2023_01_19_045643_create_devices_table', 1),
(28, '2023_01_19_045644_create_logins_table', 1),
(29, '2023_01_19_045645_update_logins_and_devices_table_user_relation', 1),
(30, '2023_01_19_045646_create_laravel_crm_organisation_types_table', 1),
(31, '2023_01_19_045647_change_morph_col_names_on_laravel_crm_notes_table', 1),
(32, '2023_01_19_045648_add_related_note_to_laravel_crm_notes_table', 1),
(33, '2023_01_19_045649_add_noted_at_to_laravel_crm_notes_table', 1),
(34, '2023_01_19_045650_create_laravel_crm_quotes_table', 1),
(35, '2023_01_19_045651_create_laravel_crm_quote_products_table', 1),
(36, '2023_01_19_045652_create_laravel_crm_files_table', 1),
(37, '2023_01_19_045653_add_mime_to_laravel_crm_files_table', 1),
(38, '2023_01_19_045654_create_xero_tokens_table', 1),
(39, '2023_01_19_045655_create_laravel_crm_xero_items_table', 1),
(40, '2023_01_19_045656_create_laravel_crm_xero_contacts_table', 1),
(41, '2023_01_19_045657_create_laravel_crm_xero_people_table', 1),
(42, '2023_01_19_045658_add_reference_to_laravel_crm_quotes_table', 1),
(43, '2023_01_19_045659_create_laravel_crm_tasks_table', 1),
(44, '2023_01_19_045700_add_deleted_at_to_laravel_crm_activities_table', 1),
(45, '2023_01_19_045701_create_laravel_crm_timezones_table', 1),
(46, '2023_01_19_045702_add_team_id_to_xero_tokens_table', 1),
(47, '2023_01_19_045703_create_laravel_crm_orders_table', 1),
(48, '2023_01_19_045704_create_laravel_crm_order_products_table', 1),
(49, '2023_01_19_045705_create_laravel_crm_invoices_table', 1),
(50, '2023_01_19_045706_create_laravel_crm_invoice_lines_table', 1),
(51, '2023_01_19_045707_add_reference_to_laravel_crm_orders_table', 1),
(52, '2023_01_19_045708_create_laravel_crm_calls_table', 1),
(53, '2023_01_19_045709_create_laravel_crm_meetings_table', 1),
(54, '2023_01_19_045710_create_laravel_crm_lunches_table', 1),
(55, '2023_01_19_045711_add_location_to_laravel_crm_activities_table', 1),
(56, '2023_01_19_045712_add_prefix_to_laravel_crm_invoices_table', 1),
(57, '2023_03_02_130115_create_laravel_crm_usage_requests_table', 1),
(58, '2023_03_02_130116_add_label_type_to_laravel_crm_fields_table', 1),
(59, '2023_03_02_130117_create_laravel_crm_field_models_table', 1),
(60, '2023_03_02_130118_create_laravel_crm_field_groups_table', 1),
(61, '2023_03_02_130119_add_team_id_to_laravel_crm_usage_requests_table', 1),
(62, '2023_03_02_130120_alter_field_group_id_on_laravel_crm_fields_table', 1),
(63, '2023_03_02_130121_add_system_to_laravel_crm_fields_table', 1),
(64, '2023_03_02_130122_add_comments_to_laravel_crm_quote_products_table', 1),
(65, '2023_03_02_130123_add_comments_to_laravel_crm_order_products_table', 1),
(66, '2023_03_02_130124_create_laravel_crm_deliveries_table', 1),
(67, '2023_03_02_130125_create_laravel_crm_delivery_products_table', 1),
(68, '2023_03_02_130126_alter_url_on_laravel_crm_usage_requests_table', 1),
(69, '2023_03_12_124552_create_laravel_crm_clients_table', 1),
(70, '2023_03_12_124553_create_laravel_crm_xero_invoices_table', 1),
(71, '2023_04_12_071358_add_contact_to_laravel_crm_addresses_table', 1),
(72, '2023_04_12_071359_add_phone_to_laravel_crm_addresses_table', 1),
(73, '2023_04_12_071400_add_name_to_laravel_crm_clients_table', 1),
(74, '2023_04_12_071401_add_delivery_dates_to_laravel_crm_deliveries_table', 1),
(75, '2023_04_12_071402_add_client_to_laravel_crm_orders_table', 1),
(76, '2023_04_12_071403_add_client_to_laravel_crm_leads_table', 1),
(77, '2023_04_12_071404_add_client_to_laravel_crm_deals_table', 1),
(78, '2023_04_12_071405_add_client_to_laravel_crm_quotes_table', 1),
(79, '2023_06_01_143654_add_account_codes_to_laravel_crm_products_table', 1),
(80, '2023_06_01_143655_add_prefix_to_laravel_crm_quotes_table', 1),
(81, '2023_06_01_143656_add_prefix_to_laravel_crm_orders_table', 1),
(82, '2023_06_01_143657_add_quote_product_id_to_laravel_crm_order_products_table', 1),
(83, '2023_06_01_143658_add_quantity_to_laravel_crm_delivery_products_table', 1),
(84, '2023_08_25_011430_create_laravel_crm_tax_rates_table', 1),
(85, '2023_08_27_143807_add_order_product_id_to_laravel_crm_invoice_lines_table', 1),
(86, '2023_08_29_125346_add_prefix_to_laravel_crm_deliveries_table', 1),
(87, '2023_09_01_041940_alter_value_on_laravel_crm_field_values_table', 1),
(88, '2024_02_06_023322_add_comments_to_laravel_crm_invoice_lines_table', 1),
(89, '2024_02_06_023323_add_default_to_laravel_crm_tax_rates_table', 1),
(90, '2024_02_06_023324_create_laravel_crm_industries_table', 1),
(91, '2024_02_06_023325_add_extra_fields_to_laravel_crm_organisations_table', 1),
(92, '2024_02_27_123910_create_laravel_crm_purchase_orders_table', 1),
(93, '2024_02_27_123911_create_laravel_crm_purchase_order_lines_table', 1),
(94, '2024_03_03_114920_create_laravel_crm_xero_purchase_orders_table', 1),
(95, '2024_03_03_140736_add_tax_type_to_laravel_crm_tax_rates_table', 1),
(96, '2024_03_19_132433_add_barcode_to_laravel_crm_products_table', 1),
(97, '2024_03_19_132434_create_laravel_crm_field_options_table', 1),
(98, '2024_04_05_041015_alter_type_on_laravel_crm_fields_table', 1),
(99, '2024_04_05_041016_add_soft_delete_to_laravel_crm_field_values_table', 1),
(100, '2024_05_06_132605_add_terms_to_laravel_crm_purchase_orders_table', 1),
(101, '2024_05_06_132606_add_delivery_type_to_laravel_crm_purchase_orders_table', 1),
(102, '2024_08_11_042410_create_laravel_crm_pipelines_table', 1),
(103, '2024_08_11_042517_create_laravel_crm_pipeline_stage_probabilities_table', 1),
(104, '2024_08_11_042734_create_laravel_crm_pipeline_stages_table', 1),
(105, '2024_08_12_012439_add_pipeline_to_laravel_crm_models_table', 1),
(106, '2024_08_18_011021_add_user_to_laravel_crm_settings_table', 1),
(107, '2024_08_24_120800_add_prefix_to_laravel_crm_leads_table', 1),
(108, '2024_08_24_120806_add_prefix_to_laravel_crm_deals_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `noteable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noteable_id` bigint(20) UNSIGNED NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `noted_at` datetime DEFAULT NULL,
  `related_note_id` int(11) DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lead_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quote_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `organisation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `subtotal` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `adjustments` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tax_rate` decimal(8,2) DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

CREATE TABLE `organisations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `organisation_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `industry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vat_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_founded` smallint(6) DEFAULT NULL,
  `timezone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `annual_revenue` int(11) DEFAULT NULL,
  `total_money_raised` int(11) DEFAULT NULL,
  `number_of_employees` smallint(6) DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organisation_types`
--

CREATE TABLE `organisation_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organisation_types`
--

INSERT INTO `organisation_types` (`id`, `team_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Sole Trader', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(2, NULL, 'Partnership', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(3, NULL, 'Company', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL),
(4, NULL, 'Trust', NULL, '2024-11-01 10:08:27', '2024-11-01 10:08:27', NULL);

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
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maiden_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crm_permission` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `description`, `crm_permission`, `created_at`, `updated_at`) VALUES
(1, 'create crm leads', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(2, 'view crm leads', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(3, 'edit crm leads', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(4, 'delete crm leads', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(5, 'create crm deals', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(6, 'view crm deals', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(7, 'edit crm deals', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(8, 'delete crm deals', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(9, 'create crm quotes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(10, 'view crm quotes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(11, 'edit crm quotes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(12, 'delete crm quotes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(13, 'create crm orders', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(14, 'view crm orders', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(15, 'edit crm orders', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(16, 'delete crm orders', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(17, 'create crm invoices', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(18, 'view crm invoices', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(19, 'edit crm invoices', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(20, 'delete crm invoices', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(21, 'create crm people', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(22, 'view crm people', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(23, 'edit crm people', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(24, 'delete crm people', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(25, 'create crm organisations', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(26, 'view crm organisations', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(27, 'edit crm organisations', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(28, 'delete crm organisations', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(29, 'create crm contacts', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(30, 'view crm contacts', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(31, 'edit crm contacts', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(32, 'delete crm contacts', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(33, 'create crm users', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(34, 'view crm users', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(35, 'edit crm users', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(36, 'delete crm users', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(37, 'create crm teams', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(38, 'view crm teams', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(39, 'edit crm teams', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(40, 'delete crm teams', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(41, 'view crm settings', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(42, 'edit crm settings', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(43, 'view crm updates', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(44, 'create crm roles', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(45, 'view crm roles', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(46, 'edit crm roles', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(47, 'delete crm roles', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(48, 'create crm permissions', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(49, 'view crm permissions', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(50, 'edit crm permissions', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(51, 'delete crm permissions', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(52, 'create crm products', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(53, 'view crm products', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(54, 'edit crm products', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(55, 'delete crm products', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(56, 'create crm product categories', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(57, 'view crm product categories', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(58, 'edit crm product categories', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(59, 'delete crm product categories', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(60, 'create crm product attributes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(61, 'view crm product attributes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(62, 'edit crm product attributes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(63, 'delete crm product attributes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(64, 'create crm tax rates', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(65, 'view crm tax rates', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(66, 'edit crm tax rates', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(67, 'delete crm tax rates', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(68, 'create crm labels', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(69, 'view crm labels', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(70, 'edit crm labels', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(71, 'delete crm labels', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(72, 'create crm fields', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(73, 'view crm fields', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(74, 'edit crm fields', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(75, 'delete crm fields', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(76, 'create crm integrations', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(77, 'view crm integrations', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(78, 'edit crm integrations', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(79, 'delete crm integrations', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(80, 'create crm activities', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(81, 'view crm activities', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(82, 'edit crm activities', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(83, 'delete crm activities', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(84, 'create crm tasks', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(85, 'view crm tasks', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(86, 'edit crm tasks', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(87, 'delete crm tasks', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(88, 'create crm notes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(89, 'view crm notes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(90, 'edit crm notes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(91, 'delete crm notes', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(92, 'create crm calls', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(93, 'view crm calls', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(94, 'edit crm calls', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(95, 'delete crm calls', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(96, 'create crm meetings', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(97, 'view crm meetings', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(98, 'edit crm meetings', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(99, 'delete crm meetings', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(100, 'create crm lunches', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(101, 'view crm lunches', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(102, 'edit crm lunches', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(103, 'delete crm lunches', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(104, 'create crm files', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(105, 'view crm files', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(106, 'edit crm files', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(107, 'delete crm files', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(108, 'create crm deliveries', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(109, 'view crm deliveries', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(110, 'edit crm deliveries', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(111, 'delete crm deliveries', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(112, 'create crm purchase orders', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(113, 'view crm purchase orders', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(114, 'edit crm purchase orders', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(115, 'delete crm purchase orders', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(116, 'create crm clients', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(117, 'view crm clients', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(118, 'edit crm clients', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(119, 'delete crm clients', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(120, 'create crm pipelines', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(121, 'view crm pipelines', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(122, 'edit crm pipelines', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(123, 'delete crm pipelines', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  `type` enum('work','home','mobile','fax','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'work',
  `phoneable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneable_id` bigint(20) UNSIGNED NOT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pipelines`
--

CREATE TABLE `pipelines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pipelines`
--

INSERT INTO `pipelines` (`id`, `external_id`, `team_id`, `name`, `model`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'f1fee5ce-73ea-4e12-97fe-69382f7ed9a9', NULL, 'Lead Pipeline', 'VentureDrake\\LaravelCrm\\Models\\Lead', '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(2, '8b4b240b-0705-4a04-9826-c45daaf8c5be', NULL, 'Deal Pipeline', 'VentureDrake\\LaravelCrm\\Models\\Deal', '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(3, '6bd3e761-6cc4-46f2-b210-c45819780dd8', NULL, 'Quote Pipeline', 'VentureDrake\\LaravelCrm\\Models\\Quote', '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(4, '3d7d5a9c-d4fb-411b-9d99-35407ec80f15', NULL, 'Order Pipeline', 'VentureDrake\\LaravelCrm\\Models\\Order', '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(5, 'c3d88a9d-abf7-4e52-8548-6535b70dbc36', NULL, 'Invoice Pipeline', 'VentureDrake\\LaravelCrm\\Models\\Invoice', '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(6, 'b0ed9ece-785b-4ca2-bce4-7999a3cb67e3', NULL, 'Delivery Pipeline', 'VentureDrake\\LaravelCrm\\Models\\Delivery', '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(7, '9a6643f9-05d8-4529-bb8d-8da6209f9aa3', NULL, 'Purchase Order Pipeline', 'VentureDrake\\LaravelCrm\\Models\\PurchaseOrder', '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pipeline_stages`
--

CREATE TABLE `pipeline_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED NOT NULL,
  `pipeline_stage_probability_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pipeline_stages`
--

INSERT INTO `pipeline_stages` (`id`, `external_id`, `team_id`, `name`, `description`, `pipeline_id`, `pipeline_stage_probability_id`, `order`, `color`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '946dec58-1897-41ea-8e73-1ab4f3d2202b', NULL, 'New', NULL, 1, 1, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(2, '1482ac16-59f9-4242-ae3b-9042d6471e86', NULL, 'Appointment Scheduled', NULL, 1, 3, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(3, '85cf581e-b657-4c8e-8536-262fddefe3ec', NULL, 'Qualified To Buy', NULL, 1, 5, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(4, 'e299437e-3f65-4abe-8565-e8bf98a346fe', NULL, 'Presentation Scheduled', NULL, 1, 7, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(5, 'd840919f-7e6a-455a-a635-06b5d7b20e89', NULL, 'Decision Maker Bought-In', NULL, 1, 9, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(6, 'e405af3f-dcd1-4817-8a22-ebcdfec37a36', NULL, 'Contract Sent', NULL, 1, 10, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(7, 'bccff32d-fbca-4822-9a0e-143adb30d289', NULL, 'Closed Won', NULL, 1, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(8, '5259ad55-785f-4781-a78b-59180d9ad579', NULL, 'Closed Lost', NULL, 1, 12, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(9, '100f7fd2-b209-4839-ad46-b8308a4d3304', NULL, 'Draft', NULL, 2, 1, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(10, 'e4554721-75e5-49f1-bbb9-034d6d3fa528', NULL, 'Pending', NULL, 2, 9, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(11, 'afbe1218-e5eb-4d49-a4ab-a82538009894', NULL, 'Closed Won', NULL, 2, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(12, 'e2c603b1-7333-4b5e-b877-0c915221742c', NULL, 'Closed Lost', NULL, 2, 12, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(13, '0ac5ccfd-8c51-4b30-931d-0a44091d58e5', NULL, 'Draft', NULL, 3, 1, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(14, '650a7576-1813-48e5-9fd1-785880c432c7', NULL, 'Sent', NULL, 3, 9, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(15, 'd622b0bf-5bb1-430f-b946-b71dadb2c27f', NULL, 'Accepted', NULL, 3, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(16, 'c5d30c36-4581-427f-a8c5-860cfdf06c2e', NULL, 'Rejected', NULL, 3, 12, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(17, 'f4d4ac40-61e7-4891-86d9-ae7f64ec036d', NULL, 'Ordered', NULL, 3, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(18, '3d316fab-465f-4a3a-8e49-5a45d5521392', NULL, 'Draft', NULL, 4, 1, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(19, 'df46868b-20ea-453d-83cb-a15e4158022b', NULL, 'Open', NULL, 4, 9, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(20, '08714670-daa8-442e-b719-d70bbbebd138', NULL, 'Invoiced', NULL, 4, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(21, '4e971f0b-369a-4c90-a47a-76c1821ae455', NULL, 'Delivered', NULL, 4, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(22, 'd7451379-91ba-4c38-a9cb-09bd89d68493', NULL, 'Completed', NULL, 4, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(23, '4be92c35-75f7-4e2d-a2c1-7502f9035ddc', NULL, 'Draft', NULL, 5, 1, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(24, '41351822-7fa9-43c2-82cd-909d6faa9df8', NULL, 'Awaiting Approval', NULL, 5, 5, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(25, '213168b6-6b2a-4ea6-980b-dc6e639c55bd', NULL, 'Awaiting Payment', NULL, 5, 9, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(26, '66f43e90-e956-46ed-84b8-213ea08a28ef', NULL, 'Paid', NULL, 5, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(27, '2a201fef-7e8d-4873-b06f-9412f9783755', NULL, 'Draft', NULL, 6, 1, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(28, '41440781-f01e-4433-bf9e-26754098d616', NULL, 'Packed', NULL, 6, 9, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(29, 'd6633114-1692-4f24-ae93-41af34f04b4f', NULL, 'Sent', NULL, 6, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(30, '894b5d05-c3ac-4954-ba5d-5b0d1a843b34', NULL, 'Delivered', NULL, 6, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(31, '5e7d0285-3720-4adc-a13e-9db68ee81aef', NULL, 'Draft', NULL, 7, 1, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(32, 'd7c2c04a-59d6-461d-97ae-105162145702', NULL, 'Awaiting Approval', NULL, 7, 5, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(33, '41c4ecb9-6b40-4c4b-9754-15c042c9f309', NULL, 'Approved', NULL, 7, 9, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(34, '4a83b457-f4d3-498f-800e-7f893452cc9a', NULL, 'Paid', NULL, 7, 11, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pipeline_stage_probabilities`
--

CREATE TABLE `pipeline_stage_probabilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` tinyint(3) UNSIGNED NOT NULL,
  `limit` tinyint(4) DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT 0,
  `archived_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pipeline_stage_probabilities`
--

INSERT INTO `pipeline_stage_probabilities` (`id`, `external_id`, `team_id`, `name`, `percent`, `limit`, `archive`, `archived_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'fc3d47dc-1b4a-47f5-8237-c47c768594a0', NULL, 'New', 1, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(2, 'b8d1a5ec-27c1-4dfa-a56d-719398cbed1c', NULL, '10%', 10, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(3, 'ad2a2a08-0e39-4198-8154-4cce64d59556', NULL, '20%', 20, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(4, '2480589c-c670-4536-b881-53f0ff11fa5a', NULL, '30%', 30, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(5, '66a65a11-0aaf-414d-9975-a68f66a7c172', NULL, '40%', 40, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(6, '81b76610-79e0-45ab-b853-835747c809ca', NULL, '50%', 50, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(7, '0ac55cb7-c668-4638-929e-f6748362f016', NULL, '60%', 60, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(8, '9f73be43-d905-4ff9-a475-1d73d68eedf0', NULL, '70%', 70, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(9, '7528d3b0-4b8e-4169-baf8-11b36ef8f063', NULL, '80%', 80, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(10, 'e5f2b57a-1592-4891-9565-3fdcaaa4c984', NULL, '90%', 90, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(11, '5c66d045-ebf8-42c6-8d09-1559e9a42963', NULL, 'Won', 100, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL),
(12, 'a446a496-3f24-4cee-9819-faf8683beecd', NULL, 'Lost', 0, NULL, 0, NULL, '2024-11-01 10:08:28', '2024-11-01 10:08:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_rate` decimal(8,2) DEFAULT NULL,
  `product_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `tax_rate_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `cost_per_unit` int(11) DEFAULT NULL,
  `direct_cost` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `organisation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` bigint(20) UNSIGNED NOT NULL,
  `issue_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `subtotal` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `adjustments` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `delivery_type` enum('deliver','pickup') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deliver',
  `delivery_instructions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_lines`
--

CREATE TABLE `purchase_order_lines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tax_rate` decimal(8,2) DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lead_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `organisation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `issue_at` datetime DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `subtotal` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `adjustments` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quote_products`
--

CREATE TABLE `quote_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quote_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tax_rate` decimal(8,2) DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crm_role` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `description`, `crm_role`, `created_at`, `updated_at`) VALUES
(1, 'Owner', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(2, 'Admin', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(3, 'Manager', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(4, 'Employee', 'web', NULL, 1, '2024-11-01 10:08:29', '2024-11-01 10:08:29');

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
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(20, 1),
(20, 2),
(20, 3),
(20, 4),
(21, 1),
(21, 2),
(21, 3),
(21, 4),
(22, 1),
(22, 2),
(22, 3),
(22, 4),
(23, 1),
(23, 2),
(23, 3),
(23, 4),
(24, 1),
(24, 2),
(24, 3),
(24, 4),
(25, 1),
(25, 2),
(25, 3),
(25, 4),
(26, 1),
(26, 2),
(26, 3),
(26, 4),
(27, 1),
(27, 2),
(27, 3),
(27, 4),
(28, 1),
(28, 2),
(28, 3),
(28, 4),
(29, 1),
(29, 2),
(29, 3),
(29, 4),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(80, 3),
(80, 4),
(81, 1),
(81, 2),
(81, 3),
(81, 4),
(82, 1),
(82, 2),
(82, 3),
(82, 4),
(83, 1),
(83, 2),
(83, 3),
(83, 4),
(84, 1),
(84, 2),
(84, 3),
(84, 4),
(85, 1),
(85, 2),
(85, 3),
(85, 4),
(86, 1),
(86, 2),
(86, 3),
(86, 4),
(87, 1),
(87, 2),
(87, 3),
(87, 4),
(88, 1),
(88, 2),
(88, 3),
(88, 4),
(89, 1),
(89, 2),
(89, 3),
(89, 4),
(90, 1),
(90, 2),
(90, 3),
(90, 4),
(91, 1),
(91, 2),
(91, 3),
(91, 4),
(92, 1),
(92, 2),
(92, 3),
(92, 4),
(93, 1),
(93, 2),
(93, 3),
(93, 4),
(94, 1),
(94, 2),
(94, 3),
(94, 4),
(95, 1),
(95, 2),
(95, 3),
(95, 4),
(96, 1),
(96, 2),
(96, 3),
(96, 4),
(97, 1),
(97, 2),
(97, 3),
(97, 4),
(98, 1),
(98, 2),
(98, 3),
(98, 4),
(99, 1),
(99, 2),
(99, 3),
(99, 4),
(100, 1),
(100, 2),
(100, 3),
(100, 4),
(101, 1),
(101, 2),
(101, 3),
(101, 4),
(102, 1),
(102, 2),
(102, 3),
(102, 4),
(103, 1),
(103, 2),
(103, 3),
(103, 4),
(104, 1),
(104, 2),
(104, 3),
(104, 4),
(105, 1),
(105, 2),
(105, 3),
(105, 4),
(106, 1),
(106, 2),
(106, 3),
(106, 4),
(107, 1),
(107, 2),
(107, 3),
(107, 4),
(108, 1),
(108, 2),
(108, 3),
(108, 4),
(109, 1),
(109, 2),
(109, 3),
(109, 4),
(110, 1),
(110, 2),
(110, 3),
(110, 4),
(111, 1),
(111, 2),
(111, 3),
(111, 4),
(112, 1),
(112, 2),
(112, 3),
(112, 4),
(113, 1),
(113, 2),
(113, 3),
(113, 4),
(114, 1),
(114, 2),
(114, 3),
(114, 4),
(115, 1),
(115, 2),
(115, 3),
(115, 4),
(116, 1),
(116, 2),
(116, 3),
(116, 4),
(117, 1),
(117, 2),
(117, 3),
(117, 4),
(118, 1),
(118, 2),
(118, 3),
(118, 4),
(119, 1),
(119, 2),
(119, 3),
(119, 4),
(120, 1),
(120, 2),
(120, 3),
(120, 4),
(121, 1),
(121, 2),
(121, 3),
(121, 4),
(122, 1),
(122, 2),
(122, 3),
(122, 4),
(123, 1),
(123, 2),
(123, 3),
(123, 4);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `team_id`, `user_id`, `global`, `name`, `label`, `value`, `editable`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 1, 'db_seeded_labels', NULL, '1', 0, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(2, NULL, NULL, 1, 'db_seeded_lead_statuses', NULL, '1', 0, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(3, NULL, NULL, 1, 'db_seeded_organisation_types', NULL, '1', 0, '2024-11-01 10:08:27', '2024-11-01 10:08:27'),
(4, NULL, NULL, 1, 'db_seeded_address_types', NULL, '1', 0, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(5, NULL, NULL, 1, 'db_seeded_contact_types', NULL, '1', 0, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(6, NULL, NULL, 1, 'db_seeded_pipeline_probabilities', NULL, '1', 0, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(7, NULL, NULL, 1, 'db_seeded_pipelines', NULL, '1', 0, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(8, NULL, NULL, 1, 'db_seeded_pipelines_stages', NULL, '1', 0, '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(9, NULL, NULL, 1, 'app_name', NULL, 'AorbisCRM', 0, '2024-11-01 10:09:34', '2024-11-01 10:09:34'),
(10, NULL, NULL, 1, 'app_env', NULL, 'local', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(11, NULL, NULL, 1, 'app_url', NULL, 'http://192.168.253.129/aorbisCRM', 0, '2024-11-01 10:09:35', '2024-11-01 10:32:10'),
(12, NULL, NULL, 1, 'version', NULL, '1.2.2', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:38'),
(13, NULL, NULL, 0, 'team', NULL, 'related', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(14, NULL, NULL, 0, 'organisation_name', NULL, 'AorbisCRM', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(15, NULL, NULL, 0, 'currency', NULL, 'USD', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(16, NULL, NULL, 0, 'country', NULL, 'United States', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(17, NULL, NULL, 0, 'language', NULL, 'english', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(18, NULL, NULL, 0, 'timezone', NULL, 'UTC', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(19, NULL, NULL, 0, 'date_format', NULL, 'Y-m-d', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(20, NULL, NULL, 0, 'time_format', NULL, 'g:i A', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(21, NULL, NULL, 0, 'tax_name', NULL, 'Tax', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(22, NULL, NULL, 0, 'tax_rate', NULL, '0', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(23, NULL, NULL, 0, 'lead_prefix', NULL, 'LD-', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(24, NULL, NULL, 0, 'deal_prefix', NULL, 'DL-', 0, '2024-11-01 10:09:35', '2024-11-01 10:09:35'),
(25, NULL, NULL, 0, 'quote_prefix', NULL, 'QU-', 0, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(26, NULL, NULL, 0, 'order_prefix', NULL, 'ORD-', 0, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(27, NULL, NULL, 0, 'invoice_prefix', NULL, 'INV-', 0, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(28, NULL, NULL, 0, 'delivery_prefix', NULL, 'DEL-', 0, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(29, NULL, NULL, 0, 'purchase_order_prefix', NULL, 'PO-', 0, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(30, NULL, NULL, 0, 'dynamic_products', NULL, '1', 0, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(31, NULL, NULL, 0, 'show_related_activity', NULL, '0', 0, '2024-11-01 10:09:36', '2024-11-01 10:09:36'),
(32, NULL, NULL, 1, 'db_update_0180', NULL, '1', 0, '2024-11-01 10:09:36', '2024-11-01 10:27:11'),
(33, NULL, NULL, 1, 'db_update_0181', NULL, '1', 0, '2024-11-01 10:09:36', '2024-11-01 10:27:11'),
(34, NULL, NULL, 1, 'db_update_0191', NULL, '1', 0, '2024-11-01 10:09:36', '2024-11-01 10:27:12'),
(35, NULL, NULL, 1, 'db_update_0193', NULL, '1', 0, '2024-11-01 10:09:36', '2024-11-01 10:27:12'),
(36, NULL, NULL, 1, 'db_update_0194', NULL, '1', 0, '2024-11-01 10:09:36', '2024-11-01 10:27:12'),
(37, NULL, NULL, 1, 'db_update_0199', NULL, '1', 0, '2024-11-01 10:09:36', '2024-11-01 10:27:12'),
(38, NULL, NULL, 1, 'db_update_1200', NULL, '1', 0, '2024-11-01 10:09:36', '2024-11-01 10:27:12'),
(39, NULL, NULL, 1, 'install_id', NULL, '1dab6e0f-fe88-471b-86c6-2128f3cd9015', 0, '2024-11-01 10:09:38', '2024-11-01 10:09:38'),
(40, NULL, NULL, 1, 'version_latest', NULL, '1.2.2', 0, '2024-11-01 10:09:38', '2024-11-01 10:09:38'),
(41, NULL, 1, 0, 'view_leads', NULL, 'list', 0, '2024-11-01 13:44:04', '2024-11-01 13:44:04'),
(42, NULL, 1, 0, 'view_deals', NULL, 'list', 0, '2024-11-01 13:44:31', '2024-11-01 13:44:31'),
(43, NULL, 1, 0, 'view_quotes', NULL, 'list', 0, '2024-11-01 16:19:16', '2024-11-01 16:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `reminder_email` tinyint(1) NOT NULL DEFAULT 0,
  `reminder_sms` tinyint(1) NOT NULL DEFAULT 0,
  `taskable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taskable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_created_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_updated_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_deleted_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_restored_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_assigned_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(8,2) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `tax_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offset` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diff_from_gtm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `name`, `offset`, `diff_from_gtm`, `created_at`, `updated_at`) VALUES
(1, 'Africa/Abidjan', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(2, 'Africa/Accra', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(3, 'Africa/Addis_Ababa', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(4, 'Africa/Algiers', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(5, 'Africa/Asmara', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(6, 'Africa/Bamako', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(7, 'Africa/Bangui', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(8, 'Africa/Banjul', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(9, 'Africa/Bissau', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(10, 'Africa/Blantyre', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(11, 'Africa/Brazzaville', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(12, 'Africa/Bujumbura', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(13, 'Africa/Cairo', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(14, 'Africa/Casablanca', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(15, 'Africa/Ceuta', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(16, 'Africa/Conakry', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(17, 'Africa/Dakar', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(18, 'Africa/Dar_es_Salaam', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(19, 'Africa/Djibouti', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(20, 'Africa/Douala', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(21, 'Africa/El_Aaiun', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(22, 'Africa/Freetown', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(23, 'Africa/Gaborone', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(24, 'Africa/Harare', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(25, 'Africa/Johannesburg', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(26, 'Africa/Juba', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(27, 'Africa/Kampala', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(28, 'Africa/Khartoum', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(29, 'Africa/Kigali', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(30, 'Africa/Kinshasa', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(31, 'Africa/Lagos', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(32, 'Africa/Libreville', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(33, 'Africa/Lome', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(34, 'Africa/Luanda', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(35, 'Africa/Lubumbashi', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(36, 'Africa/Lusaka', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(37, 'Africa/Malabo', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(38, 'Africa/Maputo', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(39, 'Africa/Maseru', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(40, 'Africa/Mbabane', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(41, 'Africa/Mogadishu', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(42, 'Africa/Monrovia', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(43, 'Africa/Nairobi', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(44, 'Africa/Ndjamena', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(45, 'Africa/Niamey', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(46, 'Africa/Nouakchott', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(47, 'Africa/Ouagadougou', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(48, 'Africa/Porto-Novo', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(49, 'Africa/Sao_Tome', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(50, 'Africa/Tripoli', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(51, 'Africa/Tunis', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(52, 'Africa/Windhoek', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(53, 'America/Adak', '-09:00', 'UTC/GMT -09:00', '2024-11-01 01:08:28', '2024-11-01 01:08:28'),
(54, 'America/Anchorage', '-08:00', 'UTC/GMT -08:00', '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(55, 'America/Anguilla', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(56, 'America/Antigua', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(57, 'America/Araguaina', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(58, 'America/Argentina/Buenos_Aires', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(59, 'America/Argentina/Catamarca', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(60, 'America/Argentina/Cordoba', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(61, 'America/Argentina/Jujuy', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(62, 'America/Argentina/La_Rioja', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(63, 'America/Argentina/Mendoza', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(64, 'America/Argentina/Rio_Gallegos', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(65, 'America/Argentina/Salta', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(66, 'America/Argentina/San_Juan', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(67, 'America/Argentina/San_Luis', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(68, 'America/Argentina/Tucuman', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(69, 'America/Argentina/Ushuaia', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(70, 'America/Aruba', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(71, 'America/Asuncion', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(72, 'America/Atikokan', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(73, 'America/Bahia', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(74, 'America/Bahia_Banderas', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(75, 'America/Barbados', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(76, 'America/Belem', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(77, 'America/Belize', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(78, 'America/Blanc-Sablon', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(79, 'America/Boa_Vista', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(80, 'America/Bogota', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(81, 'America/Boise', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(82, 'America/Cambridge_Bay', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(83, 'America/Campo_Grande', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(84, 'America/Cancun', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(85, 'America/Caracas', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(86, 'America/Cayenne', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(87, 'America/Cayman', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(88, 'America/Chicago', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(89, 'America/Chihuahua', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(90, 'America/Ciudad_Juarez', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(91, 'America/Costa_Rica', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(92, 'America/Creston', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(93, 'America/Cuiaba', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(94, 'America/Curacao', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(95, 'America/Danmarkshavn', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(96, 'America/Dawson', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(97, 'America/Dawson_Creek', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(98, 'America/Denver', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(99, 'America/Detroit', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(100, 'America/Dominica', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(101, 'America/Edmonton', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(102, 'America/Eirunepe', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(103, 'America/El_Salvador', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(104, 'America/Fort_Nelson', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(105, 'America/Fortaleza', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(106, 'America/Glace_Bay', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(107, 'America/Goose_Bay', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(108, 'America/Grand_Turk', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(109, 'America/Grenada', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(110, 'America/Guadeloupe', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(111, 'America/Guatemala', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(112, 'America/Guayaquil', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(113, 'America/Guyana', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(114, 'America/Halifax', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(115, 'America/Havana', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(116, 'America/Hermosillo', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(117, 'America/Indiana/Indianapolis', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(118, 'America/Indiana/Knox', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(119, 'America/Indiana/Marengo', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(120, 'America/Indiana/Petersburg', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(121, 'America/Indiana/Tell_City', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(122, 'America/Indiana/Vevay', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(123, 'America/Indiana/Vincennes', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(124, 'America/Indiana/Winamac', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(125, 'America/Inuvik', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(126, 'America/Iqaluit', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(127, 'America/Jamaica', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(128, 'America/Juneau', '-08:00', 'UTC/GMT -08:00', '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(129, 'America/Kentucky/Louisville', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(130, 'America/Kentucky/Monticello', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(131, 'America/Kralendijk', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(132, 'America/La_Paz', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(133, 'America/Lima', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(134, 'America/Los_Angeles', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(135, 'America/Lower_Princes', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(136, 'America/Maceio', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(137, 'America/Managua', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(138, 'America/Manaus', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(139, 'America/Marigot', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(140, 'America/Martinique', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(141, 'America/Matamoros', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(142, 'America/Mazatlan', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(143, 'America/Menominee', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(144, 'America/Merida', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(145, 'America/Metlakatla', '-08:00', 'UTC/GMT -08:00', '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(146, 'America/Mexico_City', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(147, 'America/Miquelon', '-02:00', 'UTC/GMT -02:00', '2024-11-01 08:08:28', '2024-11-01 08:08:28'),
(148, 'America/Moncton', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(149, 'America/Monterrey', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(150, 'America/Montevideo', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(151, 'America/Montserrat', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(152, 'America/Nassau', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(153, 'America/New_York', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(154, 'America/Nome', '-08:00', 'UTC/GMT -08:00', '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(155, 'America/Noronha', '-02:00', 'UTC/GMT -02:00', '2024-11-01 08:08:28', '2024-11-01 08:08:28'),
(156, 'America/North_Dakota/Beulah', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(157, 'America/North_Dakota/Center', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(158, 'America/North_Dakota/New_Salem', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(159, 'America/Nuuk', '-02:00', 'UTC/GMT -02:00', '2024-11-01 08:08:28', '2024-11-01 08:08:28'),
(160, 'America/Ojinaga', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(161, 'America/Panama', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(162, 'America/Paramaribo', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(163, 'America/Phoenix', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(164, 'America/Port-au-Prince', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(165, 'America/Port_of_Spain', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(166, 'America/Porto_Velho', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(167, 'America/Puerto_Rico', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(168, 'America/Punta_Arenas', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(169, 'America/Rankin_Inlet', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(170, 'America/Recife', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(171, 'America/Regina', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(172, 'America/Resolute', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(173, 'America/Rio_Branco', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(174, 'America/Santarem', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(175, 'America/Santiago', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(176, 'America/Santo_Domingo', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(177, 'America/Sao_Paulo', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(178, 'America/Scoresbysund', '-01:00', 'UTC/GMT -01:00', '2024-11-01 09:08:28', '2024-11-01 09:08:28'),
(179, 'America/Sitka', '-08:00', 'UTC/GMT -08:00', '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(180, 'America/St_Barthelemy', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(181, 'America/St_Johns', '-02:30', 'UTC/GMT -02:30', '2024-11-01 07:38:28', '2024-11-01 07:38:28'),
(182, 'America/St_Kitts', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(183, 'America/St_Lucia', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(184, 'America/St_Thomas', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(185, 'America/St_Vincent', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(186, 'America/Swift_Current', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(187, 'America/Tegucigalpa', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:28', '2024-11-01 04:08:28'),
(188, 'America/Thule', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(189, 'America/Tijuana', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(190, 'America/Toronto', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(191, 'America/Tortola', '-04:00', 'UTC/GMT -04:00', '2024-11-01 06:08:28', '2024-11-01 06:08:28'),
(192, 'America/Vancouver', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(193, 'America/Whitehorse', '-07:00', 'UTC/GMT -07:00', '2024-11-01 03:08:28', '2024-11-01 03:08:28'),
(194, 'America/Winnipeg', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:28', '2024-11-01 05:08:28'),
(195, 'America/Yakutat', '-08:00', 'UTC/GMT -08:00', '2024-11-01 02:08:28', '2024-11-01 02:08:28'),
(196, 'Antarctica/Casey', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(197, 'Antarctica/Davis', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(198, 'Antarctica/DumontDUrville', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(199, 'Antarctica/Macquarie', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(200, 'Antarctica/Mawson', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(201, 'Antarctica/McMurdo', '+13:00', 'UTC/GMT +13:00', '2024-11-01 23:08:28', '2024-11-01 23:08:28'),
(202, 'Antarctica/Palmer', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(203, 'Antarctica/Rothera', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(204, 'Antarctica/Syowa', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(205, 'Antarctica/Troll', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(206, 'Antarctica/Vostok', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(207, 'Arctic/Longyearbyen', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(208, 'Asia/Aden', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(209, 'Asia/Almaty', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(210, 'Asia/Amman', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(211, 'Asia/Anadyr', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:28', '2024-11-01 22:08:28'),
(212, 'Asia/Aqtau', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(213, 'Asia/Aqtobe', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(214, 'Asia/Ashgabat', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(215, 'Asia/Atyrau', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(216, 'Asia/Baghdad', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(217, 'Asia/Bahrain', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(218, 'Asia/Baku', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(219, 'Asia/Bangkok', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(220, 'Asia/Barnaul', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(221, 'Asia/Beirut', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(222, 'Asia/Bishkek', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(223, 'Asia/Brunei', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(224, 'Asia/Chita', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(225, 'Asia/Choibalsan', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(226, 'Asia/Colombo', '+05:30', 'UTC/GMT +05:30', '2024-11-01 15:38:28', '2024-11-01 15:38:28'),
(227, 'Asia/Damascus', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(228, 'Asia/Dhaka', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(229, 'Asia/Dili', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(230, 'Asia/Dubai', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(231, 'Asia/Dushanbe', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(232, 'Asia/Famagusta', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(233, 'Asia/Gaza', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(234, 'Asia/Hebron', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(235, 'Asia/Ho_Chi_Minh', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(236, 'Asia/Hong_Kong', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(237, 'Asia/Hovd', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(238, 'Asia/Irkutsk', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(239, 'Asia/Jakarta', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(240, 'Asia/Jayapura', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(241, 'Asia/Jerusalem', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(242, 'Asia/Kabul', '+04:30', 'UTC/GMT +04:30', '2024-11-01 14:38:28', '2024-11-01 14:38:28'),
(243, 'Asia/Kamchatka', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:28', '2024-11-01 22:08:28'),
(244, 'Asia/Karachi', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(245, 'Asia/Kathmandu', '+05:45', 'UTC/GMT +05:45', '2024-11-01 15:53:28', '2024-11-01 15:53:28'),
(246, 'Asia/Khandyga', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(247, 'Asia/Kolkata', '+05:30', 'UTC/GMT +05:30', '2024-11-01 15:38:28', '2024-11-01 15:38:28'),
(248, 'Asia/Krasnoyarsk', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(249, 'Asia/Kuala_Lumpur', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(250, 'Asia/Kuching', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(251, 'Asia/Kuwait', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(252, 'Asia/Macau', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(253, 'Asia/Magadan', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(254, 'Asia/Makassar', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(255, 'Asia/Manila', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(256, 'Asia/Muscat', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(257, 'Asia/Nicosia', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(258, 'Asia/Novokuznetsk', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(259, 'Asia/Novosibirsk', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(260, 'Asia/Omsk', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(261, 'Asia/Oral', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(262, 'Asia/Phnom_Penh', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(263, 'Asia/Pontianak', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(264, 'Asia/Pyongyang', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(265, 'Asia/Qatar', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(266, 'Asia/Qostanay', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(267, 'Asia/Qyzylorda', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(268, 'Asia/Riyadh', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:28', '2024-11-01 13:08:28'),
(269, 'Asia/Sakhalin', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(270, 'Asia/Samarkand', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(271, 'Asia/Seoul', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(272, 'Asia/Shanghai', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(273, 'Asia/Singapore', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(274, 'Asia/Srednekolymsk', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(275, 'Asia/Taipei', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(276, 'Asia/Tashkent', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(277, 'Asia/Tbilisi', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(278, 'Asia/Tehran', '+03:30', 'UTC/GMT +03:30', '2024-11-01 13:38:28', '2024-11-01 13:38:28'),
(279, 'Asia/Thimphu', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(280, 'Asia/Tokyo', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(281, 'Asia/Tomsk', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(282, 'Asia/Ulaanbaatar', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(283, 'Asia/Urumqi', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:28', '2024-11-01 16:08:28'),
(284, 'Asia/Ust-Nera', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(285, 'Asia/Vientiane', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:28', '2024-11-01 17:08:28'),
(286, 'Asia/Vladivostok', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(287, 'Asia/Yakutsk', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:28', '2024-11-01 19:08:28'),
(288, 'Asia/Yangon', '+06:30', 'UTC/GMT +06:30', '2024-11-01 16:38:28', '2024-11-01 16:38:28'),
(289, 'Asia/Yekaterinburg', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:28', '2024-11-01 15:08:28'),
(290, 'Asia/Yerevan', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(291, 'Atlantic/Azores', '-01:00', 'UTC/GMT -01:00', '2024-11-01 09:08:28', '2024-11-01 09:08:28'),
(292, 'Atlantic/Bermuda', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(293, 'Atlantic/Canary', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(294, 'Atlantic/Cape_Verde', '-01:00', 'UTC/GMT -01:00', '2024-11-01 09:08:28', '2024-11-01 09:08:28'),
(295, 'Atlantic/Faroe', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(296, 'Atlantic/Madeira', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(297, 'Atlantic/Reykjavik', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(298, 'Atlantic/South_Georgia', '-02:00', 'UTC/GMT -02:00', '2024-11-01 08:08:28', '2024-11-01 08:08:28'),
(299, 'Atlantic/St_Helena', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(300, 'Atlantic/Stanley', '-03:00', 'UTC/GMT -03:00', '2024-11-01 07:08:28', '2024-11-01 07:08:28'),
(301, 'Australia/Adelaide', '+10:30', 'UTC/GMT +10:30', '2024-11-01 20:38:28', '2024-11-01 20:38:28'),
(302, 'Australia/Brisbane', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(303, 'Australia/Broken_Hill', '+10:30', 'UTC/GMT +10:30', '2024-11-01 20:38:28', '2024-11-01 20:38:28'),
(304, 'Australia/Darwin', '+09:30', 'UTC/GMT +09:30', '2024-11-01 19:38:28', '2024-11-01 19:38:28'),
(305, 'Australia/Eucla', '+08:45', 'UTC/GMT +08:45', '2024-11-01 18:53:28', '2024-11-01 18:53:28'),
(306, 'Australia/Hobart', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(307, 'Australia/Lindeman', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:28', '2024-11-01 20:08:28'),
(308, 'Australia/Lord_Howe', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(309, 'Australia/Melbourne', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(310, 'Australia/Perth', '+08:00', 'UTC/GMT +08:00', '2024-11-01 18:08:28', '2024-11-01 18:08:28'),
(311, 'Australia/Sydney', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:28', '2024-11-01 21:08:28'),
(312, 'Europe/Amsterdam', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(313, 'Europe/Andorra', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(314, 'Europe/Astrakhan', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:28', '2024-11-01 14:08:28'),
(315, 'Europe/Athens', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(316, 'Europe/Belgrade', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(317, 'Europe/Berlin', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(318, 'Europe/Bratislava', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(319, 'Europe/Brussels', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(320, 'Europe/Bucharest', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(321, 'Europe/Budapest', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(322, 'Europe/Busingen', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(323, 'Europe/Chisinau', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(324, 'Europe/Copenhagen', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(325, 'Europe/Dublin', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(326, 'Europe/Gibraltar', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:28', '2024-11-01 11:08:28'),
(327, 'Europe/Guernsey', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(328, 'Europe/Helsinki', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:28', '2024-11-01 12:08:28'),
(329, 'Europe/Isle_of_Man', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:28', '2024-11-01 10:08:28'),
(330, 'Europe/Istanbul', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(331, 'Europe/Jersey', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(332, 'Europe/Kaliningrad', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(333, 'Europe/Kirov', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(334, 'Europe/Kyiv', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(335, 'Europe/Lisbon', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(336, 'Europe/Ljubljana', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(337, 'Europe/London', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:29', '2024-11-01 10:08:29'),
(338, 'Europe/Luxembourg', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(339, 'Europe/Madrid', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(340, 'Europe/Malta', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(341, 'Europe/Mariehamn', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(342, 'Europe/Minsk', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(343, 'Europe/Monaco', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(344, 'Europe/Moscow', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(345, 'Europe/Oslo', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(346, 'Europe/Paris', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(347, 'Europe/Podgorica', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(348, 'Europe/Prague', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(349, 'Europe/Riga', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(350, 'Europe/Rome', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(351, 'Europe/Samara', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(352, 'Europe/San_Marino', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(353, 'Europe/Sarajevo', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(354, 'Europe/Saratov', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(355, 'Europe/Simferopol', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(356, 'Europe/Skopje', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(357, 'Europe/Sofia', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(358, 'Europe/Stockholm', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(359, 'Europe/Tallinn', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(360, 'Europe/Tirane', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(361, 'Europe/Ulyanovsk', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(362, 'Europe/Vaduz', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(363, 'Europe/Vatican', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(364, 'Europe/Vienna', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(365, 'Europe/Vilnius', '+02:00', 'UTC/GMT +02:00', '2024-11-01 12:08:29', '2024-11-01 12:08:29'),
(366, 'Europe/Volgograd', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(367, 'Europe/Warsaw', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(368, 'Europe/Zagreb', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(369, 'Europe/Zurich', '+01:00', 'UTC/GMT +01:00', '2024-11-01 11:08:29', '2024-11-01 11:08:29'),
(370, 'Indian/Antananarivo', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(371, 'Indian/Chagos', '+06:00', 'UTC/GMT +06:00', '2024-11-01 16:08:29', '2024-11-01 16:08:29'),
(372, 'Indian/Christmas', '+07:00', 'UTC/GMT +07:00', '2024-11-01 17:08:29', '2024-11-01 17:08:29'),
(373, 'Indian/Cocos', '+06:30', 'UTC/GMT +06:30', '2024-11-01 16:38:29', '2024-11-01 16:38:29'),
(374, 'Indian/Comoro', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(375, 'Indian/Kerguelen', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:29', '2024-11-01 15:08:29'),
(376, 'Indian/Mahe', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(377, 'Indian/Maldives', '+05:00', 'UTC/GMT +05:00', '2024-11-01 15:08:29', '2024-11-01 15:08:29'),
(378, 'Indian/Mauritius', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(379, 'Indian/Mayotte', '+03:00', 'UTC/GMT +03:00', '2024-11-01 13:08:29', '2024-11-01 13:08:29'),
(380, 'Indian/Reunion', '+04:00', 'UTC/GMT +04:00', '2024-11-01 14:08:29', '2024-11-01 14:08:29'),
(381, 'Pacific/Apia', '+13:00', 'UTC/GMT +13:00', '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(382, 'Pacific/Auckland', '+13:00', 'UTC/GMT +13:00', '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(383, 'Pacific/Bougainville', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(384, 'Pacific/Chatham', '+13:45', 'UTC/GMT +13:45', '2024-11-01 23:53:29', '2024-11-01 23:53:29'),
(385, 'Pacific/Chuuk', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:29', '2024-11-01 20:08:29'),
(386, 'Pacific/Easter', '-05:00', 'UTC/GMT -05:00', '2024-11-01 05:08:29', '2024-11-01 05:08:29'),
(387, 'Pacific/Efate', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(388, 'Pacific/Fakaofo', '+13:00', 'UTC/GMT +13:00', '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(389, 'Pacific/Fiji', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(390, 'Pacific/Funafuti', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(391, 'Pacific/Galapagos', '-06:00', 'UTC/GMT -06:00', '2024-11-01 04:08:29', '2024-11-01 04:08:29'),
(392, 'Pacific/Gambier', '-09:00', 'UTC/GMT -09:00', '2024-11-01 01:08:29', '2024-11-01 01:08:29'),
(393, 'Pacific/Guadalcanal', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(394, 'Pacific/Guam', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:29', '2024-11-01 20:08:29'),
(395, 'Pacific/Honolulu', '-10:00', 'UTC/GMT -10:00', '2024-11-01 00:08:29', '2024-11-01 00:08:29'),
(396, 'Pacific/Kanton', '+13:00', 'UTC/GMT +13:00', '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(397, 'Pacific/Kiritimati', '+14:00', 'UTC/GMT +14:00', '2024-11-02 00:08:29', '2024-11-02 00:08:29'),
(398, 'Pacific/Kosrae', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(399, 'Pacific/Kwajalein', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(400, 'Pacific/Majuro', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(401, 'Pacific/Marquesas', '-09:30', 'UTC/GMT -09:30', '2024-11-01 00:38:29', '2024-11-01 00:38:29'),
(402, 'Pacific/Midway', '-11:00', 'UTC/GMT -11:00', '2024-10-31 23:08:29', '2024-10-31 23:08:29'),
(403, 'Pacific/Nauru', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(404, 'Pacific/Niue', '-11:00', 'UTC/GMT -11:00', '2024-10-31 23:08:29', '2024-10-31 23:08:29'),
(405, 'Pacific/Norfolk', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(406, 'Pacific/Noumea', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(407, 'Pacific/Pago_Pago', '-11:00', 'UTC/GMT -11:00', '2024-10-31 23:08:29', '2024-10-31 23:08:29'),
(408, 'Pacific/Palau', '+09:00', 'UTC/GMT +09:00', '2024-11-01 19:08:29', '2024-11-01 19:08:29'),
(409, 'Pacific/Pitcairn', '-08:00', 'UTC/GMT -08:00', '2024-11-01 02:08:29', '2024-11-01 02:08:29'),
(410, 'Pacific/Pohnpei', '+11:00', 'UTC/GMT +11:00', '2024-11-01 21:08:29', '2024-11-01 21:08:29'),
(411, 'Pacific/Port_Moresby', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:29', '2024-11-01 20:08:29'),
(412, 'Pacific/Rarotonga', '-10:00', 'UTC/GMT -10:00', '2024-11-01 00:08:29', '2024-11-01 00:08:29'),
(413, 'Pacific/Saipan', '+10:00', 'UTC/GMT +10:00', '2024-11-01 20:08:29', '2024-11-01 20:08:29'),
(414, 'Pacific/Tahiti', '-10:00', 'UTC/GMT -10:00', '2024-11-01 00:08:29', '2024-11-01 00:08:29'),
(415, 'Pacific/Tarawa', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(416, 'Pacific/Tongatapu', '+13:00', 'UTC/GMT +13:00', '2024-11-01 23:08:29', '2024-11-01 23:08:29'),
(417, 'Pacific/Wake', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(418, 'Pacific/Wallis', '+12:00', 'UTC/GMT +12:00', '2024-11-01 22:08:29', '2024-11-01 22:08:29'),
(419, 'UTC', '+00:00', 'UTC/GMT +00:00', '2024-11-01 10:08:29', '2024-11-01 10:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `usage_requests`
--

CREATE TABLE `usage_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_time` int(11) DEFAULT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hour` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usage_requests`
--

INSERT INTO `usage_requests` (`id`, `team_id`, `host`, `path`, `url`, `method`, `route`, `visitor`, `user_agent`, `response_time`, `day`, `hour`, `created_at`, `updated_at`) VALUES
(1, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 5764, 'Friday', 10, '2024-11-01 10:09:38', '2024-11-01 10:09:38'),
(2, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2627, 'Friday', 10, '2024-11-01 10:10:23', '2024-11-01 10:10:23'),
(3, NULL, '127.0.0.1', 'organisations', 'http://127.0.0.1:8000/organisations', 'GET', 'laravel-crm.organisations.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2695, 'Friday', 10, '2024-11-01 10:20:32', '2024-11-01 10:20:32'),
(4, NULL, '127.0.0.1', 'organisations', 'http://127.0.0.1:8000/organisations', 'GET', 'laravel-crm.organisations.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2708, 'Friday', 10, '2024-11-01 10:27:31', '2024-11-01 10:27:31'),
(5, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2319, 'Friday', 10, '2024-11-01 10:27:40', '2024-11-01 10:27:40'),
(6, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2242, 'Friday', 10, '2024-11-01 10:32:11', '2024-11-01 10:32:11'),
(7, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2321, 'Friday', 10, '2024-11-01 10:32:23', '2024-11-01 10:32:23'),
(8, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2842, 'Friday', 11, '2024-11-01 11:36:05', '2024-11-01 11:36:05'),
(9, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2753, 'Friday', 13, '2024-11-01 13:38:43', '2024-11-01 13:38:43'),
(10, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2088, 'Friday', 13, '2024-11-01 13:43:46', '2024-11-01 13:43:46'),
(11, NULL, '127.0.0.1', 'leads', 'http://127.0.0.1:8000/leads', 'GET', 'laravel-crm.leads.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2282, 'Friday', 13, '2024-11-01 13:44:05', '2024-11-01 13:44:05'),
(12, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 1911, 'Friday', 13, '2024-11-01 13:44:31', '2024-11-01 13:44:31'),
(13, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2110, 'Friday', 13, '2024-11-01 13:45:57', '2024-11-01 13:45:57'),
(14, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 1756, 'Friday', 13, '2024-11-01 13:46:24', '2024-11-01 13:46:24'),
(15, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 1790, 'Friday', 13, '2024-11-01 13:47:00', '2024-11-01 13:47:00'),
(16, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2695, 'Friday', 13, '2024-11-01 13:51:56', '2024-11-01 13:51:56'),
(17, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2109, 'Friday', 13, '2024-11-01 13:52:02', '2024-11-01 13:52:02'),
(18, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 3218, 'Friday', 13, '2024-11-01 13:54:49', '2024-11-01 13:54:49'),
(19, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2400, 'Friday', 13, '2024-11-01 13:54:53', '2024-11-01 13:54:53'),
(20, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2363, 'Friday', 13, '2024-11-01 13:54:57', '2024-11-01 13:54:57'),
(21, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2171, 'Friday', 13, '2024-11-01 13:54:59', '2024-11-01 13:54:59'),
(22, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 3015, 'Friday', 14, '2024-11-01 14:11:23', '2024-11-01 14:11:23'),
(23, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 3402, 'Friday', 14, '2024-11-01 14:26:04', '2024-11-01 14:26:04'),
(24, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2377, 'Friday', 14, '2024-11-01 14:26:06', '2024-11-01 14:26:06'),
(25, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2268, 'Friday', 14, '2024-11-01 14:26:08', '2024-11-01 14:26:08'),
(26, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2130, 'Friday', 14, '2024-11-01 14:26:10', '2024-11-01 14:26:10'),
(27, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2012, 'Friday', 14, '2024-11-01 14:26:12', '2024-11-01 14:26:12'),
(28, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 1940, 'Friday', 14, '2024-11-01 14:26:14', '2024-11-01 14:26:14'),
(29, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 1810, 'Friday', 14, '2024-11-01 14:26:15', '2024-11-01 14:26:15'),
(30, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2730, 'Friday', 14, '2024-11-01 14:26:17', '2024-11-01 14:26:17'),
(31, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2644, 'Friday', 14, '2024-11-01 14:26:19', '2024-11-01 14:26:19'),
(32, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2833, 'Friday', 14, '2024-11-01 14:27:00', '2024-11-01 14:27:00'),
(33, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2135, 'Friday', 14, '2024-11-01 14:29:00', '2024-11-01 14:29:00'),
(34, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 3591, 'Friday', 16, '2024-11-01 16:19:09', '2024-11-01 16:19:09'),
(35, NULL, '127.0.0.1', '/', 'http://127.0.0.1:8000', 'GET', 'laravel-crm.dashboard', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2807, 'Friday', 16, '2024-11-01 16:19:11', '2024-11-01 16:19:11'),
(36, NULL, '127.0.0.1', 'quotes', 'http://127.0.0.1:8000/quotes', 'GET', 'laravel-crm.quotes.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2612, 'Friday', 16, '2024-11-01 16:19:16', '2024-11-01 16:19:16'),
(37, NULL, '127.0.0.1', 'leads', 'http://127.0.0.1:8000/leads', 'GET', 'laravel-crm.leads.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2737, 'Friday', 16, '2024-11-01 16:21:42', '2024-11-01 16:21:42'),
(38, NULL, '127.0.0.1', 'deals', 'http://127.0.0.1:8000/deals', 'GET', 'laravel-crm.deals.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2381, 'Friday', 16, '2024-11-01 16:21:47', '2024-11-01 16:21:47'),
(39, NULL, '127.0.0.1', 'quotes', 'http://127.0.0.1:8000/quotes', 'GET', 'laravel-crm.quotes.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2399, 'Friday', 16, '2024-11-01 16:21:52', '2024-11-01 16:21:52'),
(40, NULL, '127.0.0.1', 'settings', 'http://127.0.0.1:8000/settings', 'GET', 'laravel-crm.settings.edit', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2953, 'Friday', 16, '2024-11-01 16:22:19', '2024-11-01 16:22:19'),
(41, NULL, '127.0.0.1', 'products', 'http://127.0.0.1:8000/products', 'GET', 'laravel-crm.products.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 1914, 'Friday', 16, '2024-11-01 16:22:29', '2024-11-01 16:22:29'),
(42, NULL, '127.0.0.1', 'settings', 'http://127.0.0.1:8000/settings', 'GET', 'laravel-crm.settings.edit', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2302, 'Friday', 16, '2024-11-01 16:22:33', '2024-11-01 16:22:33'),
(43, NULL, '127.0.0.1', 'settings', 'http://127.0.0.1:8000/settings', 'GET', 'laravel-crm.settings.edit', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 3727, 'Friday', 16, '2024-11-01 16:36:30', '2024-11-01 16:36:30'),
(44, NULL, '127.0.0.1', 'integrations/xero', 'http://127.0.0.1:8000/integrations/xero', 'GET', 'laravel-crm.integrations.xero', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2497, 'Friday', 16, '2024-11-01 16:36:45', '2024-11-01 16:36:45'),
(45, NULL, '127.0.0.1', 'settings', 'http://127.0.0.1:8000/settings', 'GET', 'laravel-crm.settings.edit', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2382, 'Friday', 16, '2024-11-01 16:44:23', '2024-11-01 16:44:23'),
(46, NULL, '127.0.0.1', 'settings', 'http://127.0.0.1:8000/settings', 'GET', 'laravel-crm.settings.edit', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 1914, 'Friday', 16, '2024-11-01 16:45:17', '2024-11-01 16:45:17'),
(47, NULL, '127.0.0.1', 'settings', 'http://127.0.0.1:8000/settings', 'GET', 'laravel-crm.settings.edit', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2354, 'Friday', 17, '2024-11-01 17:07:25', '2024-11-01 17:07:25'),
(48, NULL, '127.0.0.1', 'integrations/xero', 'http://127.0.0.1:8000/integrations/xero', 'GET', 'laravel-crm.integrations.xero', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 2947, 'Friday', 17, '2024-11-01 17:30:58', '2024-11-01 17:30:58'),
(49, NULL, '127.0.0.1', 'fields', 'http://127.0.0.1:8000/fields', 'GET', 'laravel-crm.fields.index', '*0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 1645, 'Friday', 17, '2024-11-01 17:32:44', '2024-11-01 17:32:44');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `crm_access` tinyint(1) NOT NULL DEFAULT 0,
  `last_online_at` timestamp NULL DEFAULT NULL,
  `current_crm_team_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `crm_access`, `last_online_at`, `current_crm_team_id`) VALUES
(1, 'Aorbis Inc', 'crm@aorbis.com', NULL, '$2y$10$Qok6vazkzTwA8U107RndzOkheW8xBI.5vVXa86tgb29EYNf4vZJDK', NULL, '2024-11-01 10:08:54', '2024-11-01 10:08:54', 1, '2024-11-01 17:32:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xero_contacts`
--

CREATE TABLE `xero_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `organisation_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xero_invoices`
--

CREATE TABLE `xero_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `xero_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xero_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `total_tax` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_due` int(11) DEFAULT NULL,
  `amount_paid` int(11) DEFAULT NULL,
  `amount_credited` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `line_amount_types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fully_paid_at` datetime DEFAULT NULL,
  `xero_updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xero_items`
--

CREATE TABLE `xero_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventory_tracked` tinyint(1) NOT NULL DEFAULT 0,
  `is_purchased` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_price` int(11) DEFAULT NULL,
  `purchase_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sold` tinyint(1) NOT NULL DEFAULT 0,
  `sell_price` int(11) DEFAULT NULL,
  `sell_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_on_hand` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xero_people`
--

CREATE TABLE `xero_people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xero_purchase_orders`
--

CREATE TABLE `xero_purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `xero_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xero_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `total_tax` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `line_amount_types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xero_updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xero_tokens`
--

CREATE TABLE `xero_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `id_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_event_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date_utc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date_utc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_causeable_type_causeable_id_index` (`causeable_type`,`causeable_id`),
  ADD KEY `activities_timelineable_type_timelineable_id_index` (`timelineable_type`,`timelineable_id`),
  ADD KEY `activities_recordable_type_recordable_id_index` (`recordable_type`,`recordable_id`),
  ADD KEY `activities_team_id_index` (`team_id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_addressable_type_addressable_id_index` (`addressable_type`,`addressable_id`),
  ADD KEY `addresses_user_created_id_foreign` (`user_created_id`),
  ADD KEY `addresses_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `addresses_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `addresses_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `addresses_team_id_index` (`team_id`),
  ADD KEY `addresses_address_type_id_index` (`address_type_id`);

--
-- Indexes for table `address_types`
--
ALTER TABLE `address_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_types_team_id_index` (`team_id`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indexes for table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calls_callable_type_callable_id_index` (`callable_type`,`callable_id`),
  ADD KEY `calls_user_created_id_foreign` (`user_created_id`),
  ADD KEY `calls_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `calls_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `calls_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `calls_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `calls_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `calls_team_id_index` (`team_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_clientable_type_clientable_id_index` (`clientable_type`,`clientable_id`),
  ADD KEY `clients_user_created_id_foreign` (`user_created_id`),
  ADD KEY `clients_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `clients_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `clients_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `clients_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `clients_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `clients_team_id_index` (`team_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_contactable_type_contactable_id_index` (`contactable_type`,`contactable_id`),
  ADD KEY `contacts_entityable_type_entityable_id_index` (`entityable_type`,`entityable_id`),
  ADD KEY `contacts_user_created_id_foreign` (`user_created_id`),
  ADD KEY `contacts_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `contacts_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `contacts_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `contacts_team_id_index` (`team_id`);

--
-- Indexes for table `contact_contact_type`
--
ALTER TABLE `contact_contact_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_contact_type_contact_id_index` (`contact_id`),
  ADD KEY `contact_contact_type_contact_type_id_index` (`contact_type_id`);

--
-- Indexes for table `contact_types`
--
ALTER TABLE `contact_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_types_team_id_index` (`team_id`);

--
-- Indexes for table `crm_teams`
--
ALTER TABLE `crm_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_teams_user_id_foreign` (`user_id`),
  ADD KEY `crm_teams_team_id_index` (`team_id`);

--
-- Indexes for table `crm_team_invitations`
--
ALTER TABLE `crm_team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_team_invitations_crm_team_id_email_unique` (`crm_team_id`,`email`);

--
-- Indexes for table `crm_team_user`
--
ALTER TABLE `crm_team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_team_user_crm_team_id_user_id_unique` (`crm_team_id`,`user_id`),
  ADD KEY `crm_team_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deals_user_created_id_foreign` (`user_created_id`),
  ADD KEY `deals_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `deals_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `deals_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `deals_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `deals_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `deals_lead_id_index` (`lead_id`),
  ADD KEY `deals_person_id_index` (`person_id`),
  ADD KEY `deals_organisation_id_index` (`organisation_id`),
  ADD KEY `deals_team_id_index` (`team_id`);

--
-- Indexes for table `deal_products`
--
ALTER TABLE `deal_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_products_team_id_index` (`team_id`),
  ADD KEY `deal_products_deal_id_index` (`deal_id`),
  ADD KEY `deal_products_product_id_index` (`product_id`),
  ADD KEY `deal_products_product_variation_id_index` (`product_variation_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveries_user_created_id_foreign` (`user_created_id`),
  ADD KEY `deliveries_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `deliveries_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `deliveries_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `deliveries_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `deliveries_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `deliveries_team_id_index` (`team_id`),
  ADD KEY `deliveries_order_id_index` (`order_id`);

--
-- Indexes for table `delivery_products`
--
ALTER TABLE `delivery_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_products_team_id_index` (`team_id`),
  ADD KEY `delivery_products_delivery_id_index` (`delivery_id`),
  ADD KEY `delivery_products_order_product_id_index` (`order_product_id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_is_trusted_index` (`is_trusted`),
  ADD KEY `devices_is_untrusted_index` (`is_untrusted`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emails_emailable_type_emailable_id_index` (`emailable_type`,`emailable_id`),
  ADD KEY `emails_user_created_id_foreign` (`user_created_id`),
  ADD KEY `emails_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `emails_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `emails_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `emails_team_id_index` (`team_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_team_id_index` (`team_id`),
  ADD KEY `fields_field_group_id_index` (`field_group_id`);

--
-- Indexes for table `field_groups`
--
ALTER TABLE `field_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_groups_team_id_index` (`team_id`);

--
-- Indexes for table `field_models`
--
ALTER TABLE `field_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_models_team_id_index` (`team_id`),
  ADD KEY `field_models_field_id_index` (`field_id`);

--
-- Indexes for table `field_options`
--
ALTER TABLE `field_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_options_team_id_index` (`team_id`);

--
-- Indexes for table `field_values`
--
ALTER TABLE `field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_values_field_valueable_type_field_valueable_id_index` (`field_valueable_type`,`field_valueable_id`),
  ADD KEY `field_values_field_id_index` (`field_id`),
  ADD KEY `field_values_team_id_index` (`team_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_fileable_type_fileable_id_index` (`fileable_type`,`fileable_id`),
  ADD KEY `files_user_created_id_foreign` (`user_created_id`),
  ADD KEY `files_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `files_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `files_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `files_team_id_index` (`team_id`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `industries_team_id_index` (`team_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_created_id_foreign` (`user_created_id`),
  ADD KEY `invoices_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `invoices_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `invoices_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `invoices_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `invoices_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `invoices_team_id_index` (`team_id`),
  ADD KEY `invoices_order_id_index` (`order_id`),
  ADD KEY `invoices_person_id_index` (`person_id`),
  ADD KEY `invoices_organisation_id_index` (`organisation_id`);

--
-- Indexes for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_lines_team_id_index` (`team_id`),
  ADD KEY `invoice_lines_invoice_id_index` (`invoice_id`),
  ADD KEY `invoice_lines_product_id_index` (`product_id`),
  ADD KEY `invoice_lines_product_variation_id_index` (`product_variation_id`),
  ADD KEY `invoice_lines_order_product_id_index` (`order_product_id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `labels_team_id_index` (`team_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_user_created_id_foreign` (`user_created_id`),
  ADD KEY `leads_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `leads_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `leads_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `leads_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `leads_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `leads_person_id_index` (`person_id`),
  ADD KEY `leads_organisation_id_index` (`organisation_id`),
  ADD KEY `leads_lead_status_id_index` (`lead_status_id`),
  ADD KEY `leads_lead_source_id_index` (`lead_source_id`),
  ADD KEY `leads_team_id_index` (`team_id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_sources_team_id_index` (`team_id`);

--
-- Indexes for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_statuses_team_id_index` (`team_id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logins_device_id_index` (`device_id`);

--
-- Indexes for table `lunches`
--
ALTER TABLE `lunches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lunches_lunchable_type_lunchable_id_index` (`lunchable_type`,`lunchable_id`),
  ADD KEY `lunches_user_created_id_foreign` (`user_created_id`),
  ADD KEY `lunches_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `lunches_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `lunches_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `lunches_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `lunches_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `lunches_team_id_index` (`team_id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meetings_meetingable_type_meetingable_id_index` (`meetingable_type`,`meetingable_id`),
  ADD KEY `meetings_user_created_id_foreign` (`user_created_id`),
  ADD KEY `meetings_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `meetings_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `meetings_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `meetings_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `meetings_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `meetings_team_id_index` (`team_id`);

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
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_noteable_type_noteable_id_index` (`noteable_type`,`noteable_id`),
  ADD KEY `notes_user_created_id_foreign` (`user_created_id`),
  ADD KEY `notes_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `notes_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `notes_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `notes_team_id_index` (`team_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_created_id_foreign` (`user_created_id`),
  ADD KEY `orders_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `orders_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `orders_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `orders_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `orders_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `orders_team_id_index` (`team_id`),
  ADD KEY `orders_lead_id_index` (`lead_id`),
  ADD KEY `orders_deal_id_index` (`deal_id`),
  ADD KEY `orders_quote_id_index` (`quote_id`),
  ADD KEY `orders_person_id_index` (`person_id`),
  ADD KEY `orders_organisation_id_index` (`organisation_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_team_id_index` (`team_id`),
  ADD KEY `order_products_order_id_index` (`order_id`),
  ADD KEY `order_products_product_id_index` (`product_id`),
  ADD KEY `order_products_product_variation_id_index` (`product_variation_id`);

--
-- Indexes for table `organisations`
--
ALTER TABLE `organisations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisations_user_created_id_foreign` (`user_created_id`),
  ADD KEY `organisations_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `organisations_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `organisations_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `organisations_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `organisations_team_id_index` (`team_id`),
  ADD KEY `organisations_organisation_type_id_index` (`organisation_type_id`),
  ADD KEY `organisations_industry_id_index` (`industry_id`),
  ADD KEY `organisations_timezone_id_index` (`timezone_id`);

--
-- Indexes for table `organisation_types`
--
ALTER TABLE `organisation_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisation_types_team_id_index` (`team_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `people_organisation_id_foreign` (`organisation_id`),
  ADD KEY `people_user_created_id_foreign` (`user_created_id`),
  ADD KEY `people_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `people_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `people_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `people_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `people_team_id_index` (`team_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phones_phoneable_type_phoneable_id_index` (`phoneable_type`,`phoneable_id`),
  ADD KEY `phones_user_created_id_foreign` (`user_created_id`),
  ADD KEY `phones_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `phones_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `phones_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `phones_team_id_index` (`team_id`);

--
-- Indexes for table `pipelines`
--
ALTER TABLE `pipelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines_team_id_index` (`team_id`);

--
-- Indexes for table `pipeline_stages`
--
ALTER TABLE `pipeline_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipeline_stages_team_id_index` (`team_id`);

--
-- Indexes for table `pipeline_stage_probabilities`
--
ALTER TABLE `pipeline_stage_probabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipeline_stage_probabilities_team_id_index` (`team_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_created_id_foreign` (`user_created_id`),
  ADD KEY `products_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `products_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `products_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `products_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `products_team_id_index` (`team_id`),
  ADD KEY `products_product_category_id_index` (`product_category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_team_id_index` (`team_id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_prices_team_id_index` (`team_id`),
  ADD KEY `product_prices_product_id_index` (`product_id`),
  ADD KEY `product_prices_product_variation_id_index` (`product_variation_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_team_id_index` (`team_id`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_orders_user_created_id_foreign` (`user_created_id`),
  ADD KEY `purchase_orders_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `purchase_orders_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `purchase_orders_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `purchase_orders_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `purchase_orders_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `purchase_orders_team_id_index` (`team_id`),
  ADD KEY `purchase_orders_order_id_index` (`order_id`),
  ADD KEY `purchase_orders_person_id_index` (`person_id`),
  ADD KEY `purchase_orders_organisation_id_index` (`organisation_id`);

--
-- Indexes for table `purchase_order_lines`
--
ALTER TABLE `purchase_order_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_lines_team_id_index` (`team_id`),
  ADD KEY `purchase_order_lines_purchase_order_id_index` (`purchase_order_id`),
  ADD KEY `purchase_order_lines_product_id_index` (`product_id`),
  ADD KEY `purchase_order_lines_product_variation_id_index` (`product_variation_id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotes_user_created_id_foreign` (`user_created_id`),
  ADD KEY `quotes_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `quotes_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `quotes_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `quotes_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `quotes_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `quotes_team_id_index` (`team_id`),
  ADD KEY `quotes_lead_id_index` (`lead_id`),
  ADD KEY `quotes_deal_id_index` (`deal_id`),
  ADD KEY `quotes_person_id_index` (`person_id`),
  ADD KEY `quotes_organisation_id_index` (`organisation_id`);

--
-- Indexes for table `quote_products`
--
ALTER TABLE `quote_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_products_team_id_index` (`team_id`),
  ADD KEY `quote_products_quote_id_index` (`quote_id`),
  ADD KEY `quote_products_product_id_index` (`product_id`),
  ADD KEY `quote_products_product_variation_id_index` (`product_variation_id`);

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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_team_id_index` (`team_id`),
  ADD KEY `settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_taskable_type_taskable_id_index` (`taskable_type`,`taskable_id`),
  ADD KEY `tasks_user_created_id_foreign` (`user_created_id`),
  ADD KEY `tasks_user_updated_id_foreign` (`user_updated_id`),
  ADD KEY `tasks_user_deleted_id_foreign` (`user_deleted_id`),
  ADD KEY `tasks_user_restored_id_foreign` (`user_restored_id`),
  ADD KEY `tasks_user_owner_id_foreign` (`user_owner_id`),
  ADD KEY `tasks_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `tasks_team_id_index` (`team_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_team_id_index` (`team_id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usage_requests`
--
ALTER TABLE `usage_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_current_crm_team_id_index` (`current_crm_team_id`);

--
-- Indexes for table `xero_contacts`
--
ALTER TABLE `xero_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xero_contacts_team_id_index` (`team_id`);

--
-- Indexes for table `xero_invoices`
--
ALTER TABLE `xero_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xero_invoices_team_id_index` (`team_id`);

--
-- Indexes for table `xero_items`
--
ALTER TABLE `xero_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xero_items_team_id_index` (`team_id`);

--
-- Indexes for table `xero_people`
--
ALTER TABLE `xero_people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xero_people_team_id_index` (`team_id`);

--
-- Indexes for table `xero_purchase_orders`
--
ALTER TABLE `xero_purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xero_purchase_orders_team_id_index` (`team_id`);

--
-- Indexes for table `xero_tokens`
--
ALTER TABLE `xero_tokens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address_types`
--
ALTER TABLE `address_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=542;

--
-- AUTO_INCREMENT for table `calls`
--
ALTER TABLE `calls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_contact_type`
--
ALTER TABLE `contact_contact_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_types`
--
ALTER TABLE `contact_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `crm_teams`
--
ALTER TABLE `crm_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_team_invitations`
--
ALTER TABLE `crm_team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_team_user`
--
ALTER TABLE `crm_team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_products`
--
ALTER TABLE `deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_products`
--
ALTER TABLE `delivery_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_groups`
--
ALTER TABLE `field_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_models`
--
ALTER TABLE `field_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_options`
--
ALTER TABLE `field_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_values`
--
ALTER TABLE `field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lunches`
--
ALTER TABLE `lunches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organisations`
--
ALTER TABLE `organisations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organisation_types`
--
ALTER TABLE `organisation_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pipelines`
--
ALTER TABLE `pipelines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pipeline_stages`
--
ALTER TABLE `pipeline_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `pipeline_stage_probabilities`
--
ALTER TABLE `pipeline_stage_probabilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_lines`
--
ALTER TABLE `purchase_order_lines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quote_products`
--
ALTER TABLE `quote_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT for table `usage_requests`
--
ALTER TABLE `usage_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xero_contacts`
--
ALTER TABLE `xero_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xero_invoices`
--
ALTER TABLE `xero_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xero_items`
--
ALTER TABLE `xero_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xero_people`
--
ALTER TABLE `xero_people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xero_purchase_orders`
--
ALTER TABLE `xero_purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xero_tokens`
--
ALTER TABLE `xero_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `addresses_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `addresses_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `addresses_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `calls`
--
ALTER TABLE `calls`
  ADD CONSTRAINT `calls_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `calls_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `calls_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `calls_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `calls_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `calls_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `contacts_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `contacts_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `contacts_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `crm_teams`
--
ALTER TABLE `crm_teams`
  ADD CONSTRAINT `crm_teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `crm_team_invitations`
--
ALTER TABLE `crm_team_invitations`
  ADD CONSTRAINT `crm_team_invitations_crm_team_id_foreign` FOREIGN KEY (`crm_team_id`) REFERENCES `crm_teams` (`id`);

--
-- Constraints for table `crm_team_user`
--
ALTER TABLE `crm_team_user`
  ADD CONSTRAINT `crm_team_user_crm_team_id_foreign` FOREIGN KEY (`crm_team_id`) REFERENCES `crm_teams` (`id`),
  ADD CONSTRAINT `crm_team_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `deals_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `deals_organisation_id_foreign` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  ADD CONSTRAINT `deals_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `deals_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deals_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deals_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deals_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deals_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deals_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `deliveries_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deliveries_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deliveries_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deliveries_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deliveries_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deliveries_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `delivery_products`
--
ALTER TABLE `delivery_products`
  ADD CONSTRAINT `delivery_products_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`);

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `emails_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `emails_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `emails_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `field_models`
--
ALTER TABLE `field_models`
  ADD CONSTRAINT `field_models_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`);

--
-- Constraints for table `field_values`
--
ALTER TABLE `field_values`
  ADD CONSTRAINT `field_values_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`);

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `files_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `files_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `files_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `invoices_organisation_id_foreign` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  ADD CONSTRAINT `invoices_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `invoices_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD CONSTRAINT `invoice_lines_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `invoice_lines_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`),
  ADD CONSTRAINT `invoice_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `invoice_lines_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`);

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_lead_source_id_foreign` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_sources` (`id`),
  ADD CONSTRAINT `leads_lead_status_id_foreign` FOREIGN KEY (`lead_status_id`) REFERENCES `lead_statuses` (`id`),
  ADD CONSTRAINT `leads_organisation_id_foreign` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  ADD CONSTRAINT `leads_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `leads_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leads_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leads_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leads_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leads_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leads_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lunches`
--
ALTER TABLE `lunches`
  ADD CONSTRAINT `lunches_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lunches_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lunches_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lunches_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lunches_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lunches_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `meetings_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `meetings_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `meetings_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `meetings_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `meetings_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

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
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`),
  ADD CONSTRAINT `orders_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `orders_organisation_id_foreign` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  ADD CONSTRAINT `orders_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `orders_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`),
  ADD CONSTRAINT `orders_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `organisations`
--
ALTER TABLE `organisations`
  ADD CONSTRAINT `organisations_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `organisations_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `organisations_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `organisations_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `organisations_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_organisation_id_foreign` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  ADD CONSTRAINT `people_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `people_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `people_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `people_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `people_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `phones_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `phones_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `phones_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `phones_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `purchase_orders_organisation_id_foreign` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  ADD CONSTRAINT `purchase_orders_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `purchase_orders_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchase_orders_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchase_orders_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchase_orders_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchase_orders_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchase_orders_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchase_order_lines`
--
ALTER TABLE `purchase_order_lines`
  ADD CONSTRAINT `purchase_order_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchase_order_lines_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`),
  ADD CONSTRAINT `purchase_order_lines_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`);

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`),
  ADD CONSTRAINT `quotes_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `quotes_organisation_id_foreign` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  ADD CONSTRAINT `quotes_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `quotes_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quotes_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quotes_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quotes_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quotes_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quotes_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_user_deleted_id_foreign` FOREIGN KEY (`user_deleted_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_user_owner_id_foreign` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_user_restored_id_foreign` FOREIGN KEY (`user_restored_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_user_updated_id_foreign` FOREIGN KEY (`user_updated_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_current_crm_team_id_foreign` FOREIGN KEY (`current_crm_team_id`) REFERENCES `crm_teams` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
