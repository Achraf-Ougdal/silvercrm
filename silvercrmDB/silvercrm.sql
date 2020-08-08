-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 08 août 2020 à 20:40
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `silvercrm`
--

-- --------------------------------------------------------

--
-- Structure de la table `actions`
--

CREATE TABLE `actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action_date` datetime DEFAULT NULL,
  `action_suivi` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_type` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_action_type` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `prescriber_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` int(10) UNSIGNED NOT NULL,
  `objet` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corps` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `statut` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prescriber_id` int(11) NOT NULL,
  `stay_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delay` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `budget` int(11) DEFAULT NULL,
  `civility` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elderly_relationship` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `residence_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `statut`, `prescriber_id`, `stay_type`, `room_type`, `delay`, `budget`, `civility`, `first_name`, `last_name`, `address`, `zip_code`, `city`, `country`, `phone`, `elderly_relationship`, `email`, `created_at`, `updated_at`, `deleted_at`, `residence_id`) VALUES
(1, 'En cours', 2, 'long', 'simple', '3', 100, 'Mademoiselle', 'MonPrénom', 'MonNom', 'Adresse', 13000, 'Ville', 'France', '000000000', 'Ami(e)', 'email@email.com', '2020-07-26 16:42:00', '2020-07-26 17:55:55', NULL, NULL),
(2, 'Nouveau', 1, 'long', 'simple', '3', 200, 'Mademoiselle', 'Jean', 'Dupont', '10 boulevard de la victoir', 13000, 'Marseille', 'France', '000000000', 'Ami(e)', 'email@email.com', '2020-07-26 16:49:45', '2020-07-26 16:49:45', NULL, NULL),
(3, 'Nouveau', 1, 'long', 'simple', '3', NULL, 'Mademoiselle', 'test', 'test', NULL, NULL, NULL, 'France', '0000000000', 'Ami(e)', NULL, '2020-07-29 19:41:45', '2020-07-29 19:41:45', NULL, NULL),
(4, 'En cours', 1, 'long', 'simple', '3', NULL, 'Mademoiselle', 'test chekcin', 'chekcin', NULL, NULL, NULL, 'France', '33', 'Ami(e)', NULL, '2020-08-01 07:20:25', '2020-08-01 07:20:25', NULL, NULL),
(5, 'Entrée Prévue', 1, 'long', 'simple', '3', NULL, 'Mademoiselle', 'test new viesw', 'test new view', NULL, NULL, NULL, 'France', '00', 'Ami(e)', NULL, '2020-08-01 07:26:08', '2020-08-01 07:26:08', NULL, NULL),
(6, 'Nouveau', 1, 'long', 'simple', '3', NULL, 'Mademoiselle', 'post', 'post', NULL, NULL, NULL, 'France', 'k', 'Ami(e)', NULL, '2020-08-01 07:47:46', '2020-08-01 07:47:46', NULL, NULL),
(7, 'Nouveau', 1, 'long', 'simple', '3', 28, 'Mademoiselle', 'qsds', 'qsdqs', NULL, NULL, NULL, 'France', 'dqsds', 'Ami(e)', NULL, '2020-08-01 18:22:56', '2020-08-01 18:22:56', NULL, NULL),
(8, 'Nouveau', 1, 'long', 'simple', '3', 4, 'Mademoiselle', 'scndPartie', 'scndPartie', 'scndPartie', 22323, 'premiere partie', 'France', '88888', 'Ami(e)', 'premierepartie@ksq.fr', '2020-08-01 19:33:11', '2020-08-01 19:33:11', NULL, NULL),
(9, 'Nouveau', 2, 'long', 'simple', '3', 3, 'Mademoiselle', 'malo', 'scnd', 'qsdjs', 8832, 'scnd', 'France', '9889', 'Ami(e)', 'scnd', '2020-08-01 20:04:44', '2020-08-01 20:04:44', NULL, NULL),
(10, 'Nouveau', 1, 'long', 'simple', '3', 3, 'Mademoiselle', 'malo', 'scnd', 'qsdjs', 8832, 'scnd', 'France', '9889', 'Ami(e)', 'scnd', '2020-08-01 20:07:45', '2020-08-01 20:07:45', NULL, NULL),
(11, 'En cours', 1, 'long', 'simple', '3', 4, 'Mademoiselle', 'p2', 'n2', 'a2', 22222, 'v1', 'France', 'T1', 'Ami(e)', 'e1', '2020-08-01 21:13:16', '2020-08-01 21:13:16', NULL, NULL),
(12, 'En cours', 1, 'long', 'simple', '3', 4, 'Mademoiselle', 'p2', 'n2', 'a2', 22222, 'v1', 'France', 'T1', 'Ami(e)', 'e1', '2020-08-01 21:13:53', '2020-08-01 21:13:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'statut', 'select_dropdown', 'Statut', 1, 1, 1, 1, 1, 1, '{\"default\":\"Nouveau\",\"options\":{\"Nouveau\":\"Nouveau\",\"En cours\":\"En cours\",\"Entr\\u00e9e Pr\\u00e9vue\":\"-Entr\\u00e9e Pr\\u00e9vue\",\"Visite pr\\u00e9vue\":\"-Visite pr\\u00e9vue\",\"Visite effectu\\u00e9e\":\"-Visite effectu\\u00e9e\",\"Cloture\":\"Cloture\",\"Concurrence\":\"-Concurrence\",\"Cause tarifs\":\"-Cause tarifs\",\"Cause g\\u00e9ographie\":\"-Cause g\\u00e9ographie\",\"Cause prestation\":\"-Cause prestation\",\"Cause d\\u00e9c\\u00e8s\":\"-Cause d\\u00e9c\\u00e8s\",\"R\\u00e9sident\":\"R\\u00e9sident\",\"Emploi\":\"Emploi\",\"Non pertinent\":\"Non pertinent\"}}', 2),
(58, 7, 'prescriber_id', 'text', 'Prescriptor Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'stay_type', 'select_dropdown', 'Type de séjour', 1, 1, 1, 1, 1, 1, '{\"default\":\"long\",\"options\":{\"court\":\"Court s\\u00e9jour\",\"long\":\"Long s\\u00e9jour\",\"jour\":\"Accueil de jour\"}}', 4),
(60, 7, 'room_type', 'select_dropdown', 'Type de chambre', 0, 1, 1, 1, 1, 1, '{\"default\":\"simple\",\"options\":{\"simple\":\"Chambre simple\",\"double\":\"Chambre double\"}}', 5),
(61, 7, 'delay', 'select_dropdown', 'Délai', 1, 1, 1, 1, 1, 1, '{\"default\":\"3\",\"options\":{\"1\":\"+ de 3 mois\",\"2\":\"De 1 \\u00e0 3 mois\",\"3\":\"Urgent (-1 mois)\"}}', 6),
(62, 7, 'budget', 'number', 'Budget', 0, 1, 1, 1, 1, 1, '{}', 7),
(63, 7, 'civility', 'select_dropdown', 'Civilité', 1, 1, 1, 1, 1, 1, '{\"options\":{\"Mademoiselle\":\"Mademoiselle\",\"Madame\":\"Madame\",\"Monsieur\":\"Monsieur\"}}', 8),
(64, 7, 'first_name', 'text', 'Prénom', 1, 1, 1, 1, 1, 1, '{}', 9),
(65, 7, 'last_name', 'text', 'Nom', 1, 1, 1, 1, 1, 1, '{}', 10),
(66, 7, 'address', 'text', 'Adresse', 0, 1, 1, 1, 1, 1, '{}', 11),
(67, 7, 'zip_code', 'number', 'Code postal', 0, 1, 1, 1, 1, 1, '{}', 12),
(68, 7, 'city', 'text', 'Ville', 0, 1, 1, 1, 1, 1, '{}', 13),
(69, 7, 'country', 'text', 'Pays', 0, 1, 1, 1, 1, 1, '{\"default\":\"France\"}', 14),
(70, 7, 'phone', 'text', 'Telephone', 1, 1, 1, 1, 1, 1, '{}', 15),
(71, 7, 'elderly_relationship', 'select_dropdown', 'Relation avec la personne agée ?', 0, 1, 1, 1, 1, 1, '{\"default\":\"Ami(e)\",\"options\":{\"Ami(e)\":\"Ami(e)\",\"Belle fille\":\"Belle fille\",\"Conjoint(e)\":\"Conjoint(e)\",\"Famille\":\"Famille\",\"Fille \\/ fils\":\"Fille \\/ fils\",\"M\\u00e9decin\":\"M\\u00e9decin\",\"Pour elle m\\u00eame\":\"Pour elle m\\u00eame\",\"Prescripteur\":\"Prescripteur\",\"Tuteur\":\"Tuteur\"}}', 16),
(72, 7, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 17),
(74, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 19),
(75, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 20),
(76, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 21),
(77, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(78, 8, 'elder_civility', 'select_dropdown', 'Civilité', 0, 1, 1, 1, 1, 1, '{\"options\":{\"Mademoiselle\":\"Mademoiselle\",\"Madame\":\"Madame\",\"Monsieur\":\"Monsieur\"}}', 2),
(79, 8, 'elder_first_name', 'text', 'Prénom', 0, 1, 1, 1, 1, 1, '{}', 3),
(80, 8, 'elder_last_name', 'text', 'Nom', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 4),
(81, 8, 'birth_date', 'date', 'Date de naissance', 0, 1, 1, 1, 1, 1, '{}', 5),
(82, 8, 'age', 'number', 'Age', 0, 1, 1, 1, 1, 1, '{}', 6),
(83, 8, 'actual_situation', 'select_dropdown', 'Situation actuelle', 0, 1, 1, 1, 1, 1, '{\"options\":{\"A domicile\":\"A domicile\",\"hopital\":\"A l\'h\\u00f4pital \\/ clinique\",\"Dans la famille\":\"Dans la famille\",\"En Ehpad\":\"En Ehpad\",\"En r\\u00e9sidence autonomie\":\"En r\\u00e9sidence autonomie\",\"En r\\u00e9sidence services\":\"En r\\u00e9sidence services\",\"En SSR\":\"En SSR\"}}', 7),
(84, 8, 'twon', 'text', 'Commune de résidence', 0, 1, 1, 1, 1, 1, '{}', 8),
(85, 8, 'elder_address', 'text', 'Adresse', 0, 1, 1, 1, 1, 1, '{}', 9),
(86, 8, 'elder_zip_code', 'text', 'Code postal', 0, 1, 1, 1, 1, 1, '{}', 10),
(87, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 11),
(88, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(89, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 13),
(91, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(92, 11, 'first_name', 'text', 'Prénom', 0, 1, 1, 1, 1, 1, '{}', 2),
(93, 11, 'last_name', 'text', 'Nom', 0, 1, 1, 1, 1, 1, '{}', 3),
(94, 11, 'telephone', 'text', 'Telephone', 0, 1, 1, 1, 1, 1, '{}', 4),
(95, 11, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 5),
(96, 11, 'prescription_entity_id', 'text', 'Prescription Entity Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(97, 11, 'service', 'text', 'Service', 0, 1, 1, 1, 1, 1, '{}', 7),
(98, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(99, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(100, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 10),
(101, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(102, 12, 'name', 'text', 'Nom', 1, 1, 1, 1, 1, 1, '{}', 2),
(103, 12, 'Description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(104, 12, 'address', 'text', 'Adresse', 0, 1, 1, 1, 1, 1, '{}', 4),
(105, 12, 'zip_code', 'text', 'Code postal', 0, 1, 1, 1, 1, 1, '{}', 5),
(106, 12, 'city', 'text', 'Ville', 0, 1, 1, 1, 1, 1, '{}', 6),
(107, 12, 'entity_type', 'select_dropdown', 'Type organisation', 0, 1, 1, 1, 1, 1, '{\"options\":{\"ATIE\":\"ATIE\",\"CLINIQUE\":\"CLINIQUE\",\"HOPITAL\":\"HOPITAL\",\"SSR\":\"SSR\",\"UDAF\":\"UDAF\"}}', 7),
(108, 12, 'entity_group', 'select_dropdown', 'Groupe d\'organisation', 0, 1, 1, 1, 1, 1, '{\"options\":{\"APHP\":\"APHP\",\"ASSOCIATION TUTELAIRES\":\"ASSOCIATION TUTELAIRES\",\"HOPITAUX PERIPHERIQUES\":\"HOPITAUX PERIPHERIQUES\",\"PRIVE\":\"PRIVE\",\"PUBLIC\":\"PUBLIC\"}}', 8),
(109, 12, 'entity_region', 'select_dropdown', 'Region', 0, 1, 1, 1, 1, 1, '{\"options\":{\"IDF\":\"IDF\"}}', 9),
(110, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(111, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(112, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 12),
(115, 8, 'elder_belongsto_contact_relationship', 'relationship', 'contacts', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Contact\",\"table\":\"contacts\",\"type\":\"belongsTo\",\"column\":\"contact_id\",\"key\":\"id\",\"label\":\"first_name\",\"pivot_table\":\"actions\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(116, 7, 'contact_belongsto_prescriber_relationship', 'relationship', 'prescribers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Prescriber\",\"table\":\"prescribers\",\"type\":\"belongsTo\",\"column\":\"prescriber_id\",\"key\":\"id\",\"label\":\"first_name\",\"pivot_table\":\"actions\",\"pivot\":\"0\",\"taggable\":\"0\"}', 22),
(118, 11, 'prescriber_belongsto_prescription_entity_relationship', 'relationship', 'prescription_entities', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\PrescriptionEntity\",\"table\":\"prescription_entities\",\"type\":\"belongsTo\",\"column\":\"prescription_entity_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 11),
(119, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(120, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(121, 13, 'country', 'text', 'Country', 0, 1, 1, 1, 1, 1, '{}', 3),
(122, 13, 'address', 'text', 'Address', 1, 1, 1, 1, 1, 1, '{}', 4),
(123, 13, 'city', 'text', 'City', 0, 1, 1, 1, 1, 1, '{}', 5),
(124, 13, 'zip_code', 'text', 'Zip Code', 0, 1, 1, 1, 1, 1, '{}', 6),
(125, 13, 'picture', 'text', 'Picture', 0, 1, 1, 1, 1, 1, '{}', 7),
(126, 13, 'secondrary_picture', 'text', 'Secondrary Picture', 0, 1, 1, 1, 1, 1, '{}', 8),
(127, 13, 'plaquette', 'text', 'Plaquette', 0, 1, 1, 1, 1, 1, '{}', 9),
(128, 13, 'logo', 'text', 'Logo', 0, 1, 1, 1, 1, 1, '{}', 10),
(129, 13, 'telephone', 'text', 'Telephone', 0, 1, 1, 1, 1, 1, '{}', 11),
(130, 13, 'website', 'text', 'Website', 0, 1, 1, 1, 1, 1, '{}', 12),
(133, 8, 'elder_belongsto_residence_relationship', 'relationship', 'residences', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Residence\",\"table\":\"residences\",\"type\":\"belongsTo\",\"column\":\"residence_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"actions\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(134, 8, 'contact_id', 'text', 'Contact Id', 0, 1, 1, 1, 1, 1, '{}', 14),
(135, 8, 'residence_id', 'text', 'Residence Id', 1, 1, 1, 1, 1, 1, '{}', 15),
(136, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(137, 16, 'numero', 'text', 'Numero', 0, 1, 1, 1, 1, 1, '{}', 2),
(138, 16, 'type', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{\"options\":{\"Single\":\"Single\",\"Double\":\"Double\"}}', 3),
(139, 16, 'room_categorie_id', 'text', 'Room Categorie Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(140, 16, 'date_validite', 'date', 'Date Validite', 0, 1, 1, 1, 1, 1, '{}', 5),
(141, 16, 'occupation', 'text', 'Occupation', 0, 1, 1, 1, 1, 1, '{}', 6),
(142, 16, 'tarif', 'number', 'Tarif', 0, 1, 1, 1, 1, 1, '{}', 7),
(143, 16, 'residence_id', 'text', 'Residence Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(144, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(145, 17, 'name', 'text', 'Nom', 1, 1, 1, 1, 1, 1, '{}', 2),
(146, 17, 'tarif', 'number', 'Tarif', 0, 1, 1, 1, 1, 1, '{}', 3),
(147, 16, 'room_belongsto_residence_relationship', 'relationship', 'residences', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Residence\",\"table\":\"residences\",\"type\":\"belongsTo\",\"column\":\"residence_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"actions\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(148, 16, 'room_belongsto_room_category_relationship', 'relationship', 'room_categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\RoomCategory\",\"table\":\"room_categories\",\"type\":\"belongsTo\",\"column\":\"room_categorie_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"actions\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(149, 13, 'direction_civility', 'text', 'Direction Civility', 0, 1, 1, 1, 1, 1, '{}', 13),
(150, 13, 'direction_firstname', 'text', 'Direction Firstname', 0, 1, 1, 1, 1, 1, '{}', 14),
(151, 13, 'direction_lastname', 'text', 'Direction Lastname', 0, 1, 1, 1, 1, 1, '{}', 15),
(152, 13, 'direction_telephone', 'text', 'Direction Telephone', 0, 1, 1, 1, 1, 1, '{}', 16),
(153, 13, 'direction_email', 'text', 'Direction Email', 0, 1, 1, 1, 1, 1, '{}', 17),
(154, 13, 'arrhes', 'text', 'Arrhes', 0, 1, 1, 1, 1, 1, '{}', 18),
(155, 13, 'GIR1_2', 'text', 'GIR1 2', 0, 1, 1, 1, 1, 1, '{}', 19),
(156, 13, 'GIR3_4', 'text', 'GIR3 4', 0, 1, 1, 1, 1, 1, '{}', 20),
(157, 13, 'GIR5_6', 'text', 'GIR5 6', 0, 1, 1, 1, 1, 1, '{}', 21),
(158, 13, 'ticket_moderateur', 'text', 'Ticket Moderateur', 0, 1, 1, 1, 1, 1, '{}', 22),
(159, 13, 'marquage_linge', 'text', 'Marquage Linge', 0, 1, 1, 1, 1, 1, '{}', 23),
(160, 13, 'blanchisserie', 'text', 'Blanchisserie', 0, 1, 1, 1, 1, 1, '{}', 24),
(161, 13, 'abonnement_tel', 'text', 'Abonnement Tel', 0, 1, 1, 1, 1, 1, '{}', 25),
(162, 13, 'repas_invite', 'text', 'Repas Invite', 0, 1, 1, 1, 1, 1, '{}', 26),
(163, 13, 'television', 'text', 'Television', 0, 1, 1, 1, 1, 1, '{}', 27),
(164, 13, 'under_60', 'text', 'Under 60', 0, 1, 1, 1, 1, 1, '{}', 28),
(165, 13, 'sejour_temporaire', 'text', 'Sejour Temporaire', 0, 1, 1, 1, 1, 1, '{}', 29),
(166, 13, 'forme_juridique', 'text', 'Forme Juridique', 0, 1, 1, 1, 1, 1, '{}', 30),
(167, 13, 'denontiation_sociale_nom', 'text', 'Denontiation Sociale Nom', 0, 1, 1, 1, 1, 1, '{}', 31),
(168, 13, 'denontiation_sociale_pays', 'text', 'Denontiation Sociale Pays', 0, 1, 1, 1, 1, 1, '{}', 32),
(169, 13, 'denontiation_sociale_adresse_1', 'text', 'Denontiation Sociale Adresse 1', 0, 1, 1, 1, 1, 1, '{}', 33),
(170, 13, 'denontiation_sociale_adresse_2', 'text', 'Denontiation Sociale Adresse 2', 0, 1, 1, 1, 1, 1, '{}', 34),
(171, 13, 'denontiation_sociale_zip_code', 'text', 'Denontiation Sociale Zip Code', 0, 1, 1, 1, 1, 1, '{}', 35),
(172, 13, 'denontiation_sociale_city', 'text', 'Denontiation Sociale City', 0, 1, 1, 1, 1, 1, '{}', 36),
(173, 13, 'denontiation_sociale_rcs', 'text', 'Denontiation Sociale Rcs', 0, 1, 1, 1, 1, 1, '{}', 37),
(174, 13, 'denontiation_sociale_rcs_city', 'text', 'Denontiation Sociale Rcs City', 0, 1, 1, 1, 1, 1, '{}', 38),
(175, 13, 'denontiation_sociale_capital', 'text', 'Denontiation Sociale Capital', 0, 1, 1, 1, 1, 1, '{}', 39),
(176, 13, 'denontiation_sociale_siret', 'text', 'Denontiation Sociale Siret', 0, 1, 1, 1, 1, 1, '{}', 40),
(177, 13, 'denontiation_sociale_tva', 'text', 'Denontiation Sociale Tva', 0, 1, 1, 1, 1, 1, '{}', 41),
(178, 13, 'denontiation_sociale_code_ape', 'text', 'Denontiation Sociale Code Ape', 0, 1, 1, 1, 1, 1, '{}', 42),
(179, 13, 'objectif_to', 'text', 'Objectif To', 0, 1, 1, 1, 1, 1, '{}', 43),
(180, 13, 'debut_validite_to', 'text', 'Debut Validite To', 0, 1, 1, 1, 1, 1, '{}', 44),
(181, 13, 'contract_type_id', 'text', 'Contract Type Id', 0, 1, 1, 1, 1, 1, '{}', 45),
(182, 13, 'capretraite_id', 'text', 'Capretraite Id', 0, 1, 1, 1, 1, 1, '{}', 46),
(183, 13, 'referent_id', 'text', 'Referent Id', 0, 1, 1, 1, 1, 1, '{}', 47),
(184, 13, 'departement_id', 'text', 'Departement Id', 0, 1, 1, 1, 1, 1, '{}', 48),
(185, 16, 'room_belongsto_elder_relationship', 'relationship', 'elders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Elder\",\"table\":\"elders\",\"type\":\"belongsTo\",\"column\":\"occupant_id\",\"key\":\"id\",\"label\":\"elder_last_name\",\"pivot_table\":\"actions\",\"pivot\":\"0\",\"taggable\":null}', 11),
(186, 8, 'statut', 'select_dropdown', 'Statut', 0, 1, 1, 1, 1, 1, '{\"options\":{\"Refus m\\u00e9dical\":\"-Refus m\\u00e9dical\",\"Retour \\u00e0 domicile\":\"-Retour \\u00e0 domicile\"}}', 11),
(187, 8, 'source', 'select_dropdown', 'Source', 0, 1, 1, 1, 1, 1, '{\"options\":{\"Via Trajectoire\":\"Via Trajectoire\",\"Prescripteur hospitalier\":\"Prescripteur hospitalier\",\"En direct\":\"En direct\",\"Organisme\":\"Organisme\",\"Internet\":\"Internet\"}}', 12),
(189, 7, 'residence_id', 'text', 'Residence Id', 0, 1, 1, 1, 1, 1, '{}', 21);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(7, 'contacts', 'contacts', 'Contact', 'Contacts', 'voyager-person', 'App\\Contact', NULL, 'App\\Http\\Controllers\\Voyager\\ContactController', NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":\"first_name\",\"scope\":null}', '2020-07-22 17:17:41', '2020-08-05 14:37:34'),
(8, 'elders', 'elders', 'Personne âgée', 'Personnes âgées', 'voyager-people', 'App\\Elder', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-22 18:54:07', '2020-08-05 15:13:53'),
(9, 'prescription_entity', 'prescription-entity', 'Organisme prescripteur', 'Organismes prescripteurs', NULL, 'App\\PrescriptionEntity', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-23 19:25:18', '2020-07-23 19:25:18'),
(10, 'prescriber', 'prescriber', 'Prescripteur', 'Prescripteurs', NULL, 'App\\Prescriber', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-23 19:29:00', '2020-07-23 19:29:00'),
(11, 'prescribers', 'prescribers', 'Prescripteur', 'Prescripteurs', 'voyager-documentation', 'App\\Prescriber', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-23 20:53:48', '2020-07-23 21:28:03'),
(12, 'prescription_entities', 'prescription-entities', 'Organisme prescripteur', 'Organismes prescripteurs', 'voyager-wallet', 'App\\PrescriptionEntity', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-23 21:16:18', '2020-07-23 21:29:36'),
(13, 'residences', 'residences', 'Residence', 'Residences', 'voyager-company', 'App\\Residence', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-27 01:10:20', '2020-08-03 02:18:45'),
(16, 'rooms', 'rooms', 'Chambre', 'Chambres', 'voyager-key', 'App\\Room', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"numero\",\"order_display_column\":\"numero\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-03 02:10:17', '2020-08-03 02:24:19'),
(17, 'room_categories', 'room-categories', 'Catégorie de chambre', 'Catégories de chambres', NULL, 'App\\RoomCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-08-03 02:14:57', '2020-08-03 02:14:57');

-- --------------------------------------------------------

--
-- Structure de la table `elders`
--

CREATE TABLE `elders` (
  `id` int(10) UNSIGNED NOT NULL,
  `elder_civility` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elder_first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elder_last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `actual_situation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twon` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elder_address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elder_zip_code` int(11) DEFAULT NULL,
  `statut` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `residence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `elders`
--

INSERT INTO `elders` (`id`, `elder_civility`, `elder_first_name`, `elder_last_name`, `birth_date`, `age`, `actual_situation`, `twon`, `elder_address`, `elder_zip_code`, `statut`, `source`, `created_at`, `updated_at`, `deleted_at`, `contact_id`, `residence_id`) VALUES
(3, 'Mademoiselle', 'madame', 'wichou', '1999-10-23', 22, 'A domicile', 'commune', 'Adresse', 3333, NULL, 'En direct', '2020-08-01 07:15:51', '2020-08-01 07:15:51', NULL, NULL, 1),
(4, 'Mademoiselle', NULL, NULL, '2020-08-12', 22, 'A domicile', 'cc', 'Adresse', 33333, NULL, NULL, '2020-08-01 08:03:45', '2020-08-06 19:51:09', '2020-08-06 19:51:09', NULL, 1),
(5, 'Mademoiselle', 'mal', 'qsd', '2014-10-30', 3, 'A domicile', 'ddd', 'ddd', 323, NULL, NULL, '2020-08-01 18:22:00', '2020-08-06 13:01:15', '2020-08-06 13:01:15', NULL, 1),
(6, 'Mademoiselle', 'test Not Null', NULL, NULL, 34, 'A domicile', 'qsds', 'qsdsq', 332, NULL, NULL, '2020-08-01 19:14:28', '2020-08-06 19:35:09', '2020-08-06 19:35:09', NULL, 1),
(7, 'Mademoiselle', 'kljk', 'klqsjdsq', NULL, 27, 'A domicile', 'qsdsq', 'qsdqs', 33233, NULL, NULL, '2020-08-01 19:16:34', '2020-08-01 19:16:34', NULL, NULL, 1),
(9, 'Mademoiselle', 'p2', 'n2', '2020-08-11', 3, 'A domicile', 'c2', 'a2', 22222, NULL, NULL, '2020-08-01 21:13:53', '2020-08-01 21:13:53', NULL, NULL, 1),
(11, 'Monsieur', '2', '2', '2020-08-11', 2, 'A domicile', '2', '2', 2, NULL, NULL, '2020-08-01 22:06:13', '2020-08-06 19:34:50', '2020-08-06 19:34:50', NULL, 1),
(12, 'Madame', 'prenomSenir', 'nomSenior', '2014-10-29', 99, 'A domicile', 'communeSenior', 'adresseSenir', 99999, NULL, NULL, '2020-08-02 06:27:50', '2020-08-06 19:35:42', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `elder_rooms`
--

CREATE TABLE `elder_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `elder_id` int(10) UNSIGNED NOT NULL,
  `titleSejour` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeSejour` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contratSejour` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double(8,2) NOT NULL,
  `date_start` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-07-19 10:53:37', '2020-07-19 10:53:37');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-07-19 10:53:37', '2020-07-19 10:53:37', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2020-07-19 10:53:37', '2020-07-23 20:10:17', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2020-07-19 10:53:37', '2020-08-03 02:39:08', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2020-07-19 10:53:37', '2020-08-03 02:39:08', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 5, '2020-07-19 10:53:37', '2020-08-03 02:36:10', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-07-19 10:53:37', '2020-07-23 20:10:17', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-07-19 10:53:37', '2020-07-23 20:10:17', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-07-19 10:53:37', '2020-07-23 20:10:17', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-07-19 10:53:37', '2020-07-23 20:10:17', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2020-07-19 10:53:37', '2020-08-03 02:36:10', 'voyager.settings.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-07-19 10:53:37', '2020-07-23 20:10:17', 'voyager.hooks', NULL),
(15, 1, 'Contacts', '', '_self', 'voyager-person', NULL, NULL, 7, '2020-07-22 17:17:41', '2020-08-03 02:36:10', 'voyager.contacts.index', NULL),
(16, 1, 'Seniors', '', '_self', 'voyager-people', '#000000', NULL, 8, '2020-07-22 18:54:07', '2020-08-03 02:36:10', 'voyager.elders.index', 'null'),
(19, 1, 'Prescripteurs', '', '_self', 'voyager-documentation', '#000000', NULL, 12, '2020-07-23 20:53:48', '2020-08-03 02:38:45', 'voyager.prescribers.index', 'null'),
(20, 1, 'Organismes prescripteurs', '', '_self', 'voyager-wallet', '#000000', NULL, 13, '2020-07-23 21:16:18', '2020-08-03 02:38:43', 'voyager.prescription-entities.index', 'null'),
(21, 1, 'Residences', '', '_self', 'voyager-company', '#000000', NULL, 9, '2020-07-27 01:10:20', '2020-08-03 02:38:45', 'voyager.residences.index', 'null'),
(22, 1, 'Chambres', '', '_self', 'voyager-key', NULL, NULL, 10, '2020-08-03 02:10:17', '2020-08-03 02:38:45', 'voyager.rooms.index', NULL),
(23, 1, 'Catégories de chambres', '', '_self', 'voyager-categories', '#000000', NULL, 11, '2020-08-03 02:14:57', '2020-08-03 02:38:45', 'voyager.room-categories.index', 'null');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(28, '2020_08_04_184050_update_rooms_table', 3),
(29, '2020_08_04_184240_update_elders_table', 4),
(30, '2020_08_04_194959_update_elders_table', 5),
(31, '2020_08_04_195412_update_elders_table', 6),
(32, '2020_08_04_201115_create_elder_rooms_table', 7),
(33, '2020_08_04_201640_create_elder_rooms_table', 8),
(34, '2020_08_04_203631_create_elder_rooms_table', 9),
(35, '2020_08_06_122150_create_elder_rooms_table', 10),
(36, '2020_08_06_120517_update_elder_room_table', 11),
(37, '2020_08_06_121406_create_room_tarif_table', 12),
(38, '2020_08_06_141409_create_elder_rooms_table', 13),
(39, '2020_08_06_142006_update_elder_room_table', 14),
(40, '2020_08_07_163036_create_elder_rooms_table', 15),
(41, '2020_08_07_163854_update_elder_room_table', 16),
(42, '2020_08_08_003858_create_elder_rooms_table', 17),
(43, '2020_08_08_004029_update_elder_rooms_table', 18),
(44, '2020_08_08_005459_create_room_tarif_table', 19);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(2, 'browse_bread', NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(3, 'browse_database', NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(4, 'browse_media', NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(5, 'browse_compass', NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(6, 'browse_menus', 'menus', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(7, 'read_menus', 'menus', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(8, 'edit_menus', 'menus', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(9, 'add_menus', 'menus', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(10, 'delete_menus', 'menus', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(11, 'browse_roles', 'roles', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(12, 'read_roles', 'roles', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(13, 'edit_roles', 'roles', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(14, 'add_roles', 'roles', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(15, 'delete_roles', 'roles', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(16, 'browse_users', 'users', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(17, 'read_users', 'users', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(18, 'edit_users', 'users', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(19, 'add_users', 'users', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(20, 'delete_users', 'users', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(21, 'browse_settings', 'settings', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(22, 'read_settings', 'settings', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(23, 'edit_settings', 'settings', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(24, 'add_settings', 'settings', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(25, 'delete_settings', 'settings', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(41, 'browse_hooks', NULL, '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(42, 'browse_contacts', 'contacts', '2020-07-22 17:17:41', '2020-07-22 17:17:41'),
(43, 'read_contacts', 'contacts', '2020-07-22 17:17:41', '2020-07-22 17:17:41'),
(44, 'edit_contacts', 'contacts', '2020-07-22 17:17:41', '2020-07-22 17:17:41'),
(45, 'add_contacts', 'contacts', '2020-07-22 17:17:41', '2020-07-22 17:17:41'),
(46, 'delete_contacts', 'contacts', '2020-07-22 17:17:41', '2020-07-22 17:17:41'),
(47, 'browse_elders', 'elders', '2020-07-22 18:54:07', '2020-07-22 18:54:07'),
(48, 'read_elders', 'elders', '2020-07-22 18:54:07', '2020-07-22 18:54:07'),
(49, 'edit_elders', 'elders', '2020-07-22 18:54:07', '2020-07-22 18:54:07'),
(50, 'add_elders', 'elders', '2020-07-22 18:54:07', '2020-07-22 18:54:07'),
(51, 'delete_elders', 'elders', '2020-07-22 18:54:07', '2020-07-22 18:54:07'),
(52, 'browse_prescription_entity', 'prescription_entity', '2020-07-23 17:25:18', '2020-07-23 17:25:18'),
(53, 'read_prescription_entity', 'prescription_entity', '2020-07-23 17:25:18', '2020-07-23 17:25:18'),
(54, 'edit_prescription_entity', 'prescription_entity', '2020-07-23 17:25:18', '2020-07-23 17:25:18'),
(55, 'add_prescription_entity', 'prescription_entity', '2020-07-23 17:25:18', '2020-07-23 17:25:18'),
(56, 'delete_prescription_entity', 'prescription_entity', '2020-07-23 17:25:18', '2020-07-23 17:25:18'),
(57, 'browse_prescriber', 'prescriber', '2020-07-23 17:29:00', '2020-07-23 17:29:00'),
(58, 'read_prescriber', 'prescriber', '2020-07-23 17:29:00', '2020-07-23 17:29:00'),
(59, 'edit_prescriber', 'prescriber', '2020-07-23 17:29:00', '2020-07-23 17:29:00'),
(60, 'add_prescriber', 'prescriber', '2020-07-23 17:29:00', '2020-07-23 17:29:00'),
(61, 'delete_prescriber', 'prescriber', '2020-07-23 17:29:00', '2020-07-23 17:29:00'),
(62, 'browse_prescribers', 'prescribers', '2020-07-23 20:53:48', '2020-07-23 20:53:48'),
(63, 'read_prescribers', 'prescribers', '2020-07-23 20:53:48', '2020-07-23 20:53:48'),
(64, 'edit_prescribers', 'prescribers', '2020-07-23 20:53:48', '2020-07-23 20:53:48'),
(65, 'add_prescribers', 'prescribers', '2020-07-23 20:53:48', '2020-07-23 20:53:48'),
(66, 'delete_prescribers', 'prescribers', '2020-07-23 20:53:48', '2020-07-23 20:53:48'),
(67, 'browse_prescription_entities', 'prescription_entities', '2020-07-23 21:16:18', '2020-07-23 21:16:18'),
(68, 'read_prescription_entities', 'prescription_entities', '2020-07-23 21:16:18', '2020-07-23 21:16:18'),
(69, 'edit_prescription_entities', 'prescription_entities', '2020-07-23 21:16:18', '2020-07-23 21:16:18'),
(70, 'add_prescription_entities', 'prescription_entities', '2020-07-23 21:16:18', '2020-07-23 21:16:18'),
(71, 'delete_prescription_entities', 'prescription_entities', '2020-07-23 21:16:18', '2020-07-23 21:16:18'),
(72, 'browse_residences', 'residences', '2020-07-27 01:10:20', '2020-07-27 01:10:20'),
(73, 'read_residences', 'residences', '2020-07-27 01:10:20', '2020-07-27 01:10:20'),
(74, 'edit_residences', 'residences', '2020-07-27 01:10:20', '2020-07-27 01:10:20'),
(75, 'add_residences', 'residences', '2020-07-27 01:10:20', '2020-07-27 01:10:20'),
(76, 'delete_residences', 'residences', '2020-07-27 01:10:20', '2020-07-27 01:10:20'),
(77, 'browse_rooms', 'rooms', '2020-08-03 02:10:17', '2020-08-03 02:10:17'),
(78, 'read_rooms', 'rooms', '2020-08-03 02:10:17', '2020-08-03 02:10:17'),
(79, 'edit_rooms', 'rooms', '2020-08-03 02:10:17', '2020-08-03 02:10:17'),
(80, 'add_rooms', 'rooms', '2020-08-03 02:10:17', '2020-08-03 02:10:17'),
(81, 'delete_rooms', 'rooms', '2020-08-03 02:10:17', '2020-08-03 02:10:17'),
(82, 'browse_room_categories', 'room_categories', '2020-08-03 02:14:57', '2020-08-03 02:14:57'),
(83, 'read_room_categories', 'room_categories', '2020-08-03 02:14:57', '2020-08-03 02:14:57'),
(84, 'edit_room_categories', 'room_categories', '2020-08-03 02:14:57', '2020-08-03 02:14:57'),
(85, 'add_room_categories', 'room_categories', '2020-08-03 02:14:57', '2020-08-03 02:14:57'),
(86, 'delete_room_categories', 'room_categories', '2020-08-03 02:14:57', '2020-08-03 02:14:57');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(16, 3),
(17, 1),
(17, 2),
(17, 3),
(18, 1),
(18, 2),
(18, 3),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 2),
(20, 3),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(42, 1),
(42, 2),
(42, 3),
(42, 4),
(43, 1),
(43, 2),
(43, 3),
(43, 4),
(44, 1),
(44, 2),
(44, 3),
(44, 4),
(45, 1),
(45, 2),
(45, 3),
(45, 4),
(46, 1),
(46, 2),
(46, 3),
(46, 4),
(47, 1),
(47, 2),
(47, 3),
(48, 1),
(48, 2),
(48, 3),
(49, 1),
(49, 2),
(49, 3),
(50, 1),
(50, 2),
(50, 3),
(51, 1),
(51, 2),
(51, 3),
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
(62, 3),
(63, 1),
(63, 2),
(63, 3),
(64, 1),
(64, 2),
(64, 3),
(65, 1),
(65, 2),
(65, 3),
(66, 1),
(66, 2),
(66, 3),
(67, 1),
(67, 2),
(67, 3),
(68, 1),
(68, 2),
(68, 3),
(69, 1),
(69, 2),
(69, 3),
(70, 1),
(70, 2),
(70, 3),
(71, 1),
(71, 2),
(71, 3),
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
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2);

-- --------------------------------------------------------

--
-- Structure de la table `prescribers`
--

CREATE TABLE `prescribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prescription_entity_id` int(11) DEFAULT NULL,
  `service` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prescribers`
--

INSERT INTO `prescribers` (`id`, `first_name`, `last_name`, `telephone`, `email`, `prescription_entity_id`, `service`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ke', 'nen', '090870', 'kgandrille', 1, 'reprpeor', '2020-07-24 05:59:00', '2020-07-26 19:00:20', '2020-07-24 07:59:00'),
(2, 'NomPrescripteur', 'PrenomPrescripteur', '0788574568', 'e@abc.com', 1, NULL, '2020-07-26 17:55:00', '2020-07-26 19:00:11', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prescription_entities`
--

CREATE TABLE `prescription_entities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_group` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prescription_entities`
--

INSERT INTO `prescription_entities` (`id`, `name`, `Description`, `address`, `zip_code`, `city`, `entity_type`, `entity_group`, `entity_region`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Trajectoire', 'DescriptionTrajectoire', 'AdresseTrajectoire', 75000, 'Paris', 'ATIE', 'APHP', 'IDF', '2020-07-26 17:56:54', '2020-07-26 17:56:54', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `residences`
--

CREATE TABLE `residences` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondrary_picture` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plaquette` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction_civility` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction_firstname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction_lastname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction_telephone` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction_email` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrhes` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GIR1_2` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GIR3_4` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GIR5_6` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_moderateur` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marquage_linge` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanchisserie` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abonnement_tel` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repas_invite` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `television` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `under_60` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sejour_temporaire` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forme_juridique` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_nom` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_pays` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_adresse_1` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_adresse_2` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_zip_code` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_city` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_rcs` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_rcs_city` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_capital` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_siret` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_tva` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denontiation_sociale_code_ape` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectif_to` int(11) DEFAULT NULL,
  `debut_validite_to` date DEFAULT NULL,
  `contract_type_id` int(11) DEFAULT NULL,
  `capretraite_id` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referent_id` int(11) DEFAULT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `residences`
--

INSERT INTO `residences` (`id`, `name`, `country`, `address`, `city`, `zip_code`, `picture`, `secondrary_picture`, `plaquette`, `logo`, `telephone`, `website`, `direction_civility`, `direction_firstname`, `direction_lastname`, `direction_telephone`, `direction_email`, `arrhes`, `GIR1_2`, `GIR3_4`, `GIR5_6`, `ticket_moderateur`, `marquage_linge`, `blanchisserie`, `abonnement_tel`, `repas_invite`, `television`, `under_60`, `sejour_temporaire`, `forme_juridique`, `denontiation_sociale_nom`, `denontiation_sociale_pays`, `denontiation_sociale_adresse_1`, `denontiation_sociale_adresse_2`, `denontiation_sociale_zip_code`, `denontiation_sociale_city`, `denontiation_sociale_rcs`, `denontiation_sociale_rcs_city`, `denontiation_sociale_capital`, `denontiation_sociale_siret`, `denontiation_sociale_tva`, `denontiation_sociale_code_ape`, `objectif_to`, `debut_validite_to`, `contract_type_id`, `capretraite_id`, `referent_id`, `departement_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Résidence Alpha', NULL, 'Address rue de la gloire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Résidence Beta', 'Morocco', 'Morocco', 'Agadir', '25544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-03 19:49:31', '2020-08-03 19:49:31', NULL),
(3, 'Résidence Gamma', 'France', 'Paris', 'Paris', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-05 10:57:34', '2020-08-05 10:57:34', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'dev', 'dev', '2020-07-19 10:53:37', '2020-07-27 00:07:45'),
(2, 'direction', 'Direction de résidence', '2020-07-19 10:53:37', '2020-07-27 00:53:32'),
(3, 'assistance', 'Assistance de direction', '2020-07-27 00:56:46', '2020-07-27 00:56:46'),
(4, 'commercialisateur', 'Commercialisateur', '2020-07-27 00:57:25', '2020-07-27 00:57:25');

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_categorie_id` int(11) DEFAULT NULL,
  `date_validite` date DEFAULT NULL,
  `residence_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id`, `numero`, `type`, `room_categorie_id`, `date_validite`, `residence_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '100', 'Double', 1, '2019-12-31', 1, '2020-08-03 02:30:28', '2020-08-03 02:44:02', NULL),
(2, '101', NULL, 2, '2018-12-02', 1, '2020-08-03 02:42:19', '2020-08-03 02:42:19', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `room_categories`
--

CREATE TABLE `room_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarif` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `room_categories`
--

INSERT INTO `room_categories` (`id`, `name`, `tarif`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Prestige', 100, '2020-08-03 02:21:25', '2020-08-03 02:21:25', NULL),
(2, 'Premium', 200, '2020-08-03 02:21:39', '2020-08-03 02:21:39', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `room_tarif`
--

CREATE TABLE `room_tarif` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `tarif` double(8,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/July2020/y47GmUTAd3qARqZz6yDn.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'CRM', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', '© 2020', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings/July2020/PWWOvUjkuER0kShxz9q2.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/July2020/CocEpVGrR92ZNTGbBfjq.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-07-19 10:53:37', '2020-07-19 10:53:37'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-07-19 10:53:37', '2020-07-19 10:53:37');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'dev', 'dev@dev.com', 'users/default.png', NULL, '$2y$10$VIvoQbmhGut1MfwuBlwWt.RZ0MkaBrwXL5GKFIY7jhVWeEadL9Gd2', 'xotUhhm975DOJhlGWBU5voWniP4B86DBPu4kDqIU3xUO7XlMgyMCKDY9aXj9', '{\"locale\":\"en\"}', '2020-07-19 10:53:37', '2020-07-29 16:35:23'),
(2, 2, 'user', 'user@user.com', 'users/July2020/o8L6ASumeNrusOnagH4C.png', NULL, '$2y$10$IIUxH.5XoPBoWzQ/WPMDUOlZXElV0yNKcl2R8jbozX0uQ.P.lUmvq', NULL, '{\"locale\":\"fr\"}', '2020-07-23 21:43:47', '2020-07-26 23:39:06'),
(3, 4, 'commercial', 'commercial@commercial.com', 'users/default.png', NULL, '$2y$10$XYNYKSNEP2HNRoIRa069U.0CavpBg1h/rVB3OHgpsjGpahMW0/.ay', NULL, '{\"locale\":\"fr\"}', '2020-07-26 23:53:25', '2020-07-27 01:19:49');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Index pour la table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Index pour la table `elders`
--
ALTER TABLE `elders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `elder_rooms`
--
ALTER TABLE `elder_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Index pour la table `prescribers`
--
ALTER TABLE `prescribers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prescription_entities`
--
ALTER TABLE `prescription_entities`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `residences`
--
ALTER TABLE `residences`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `room_categories`
--
ALTER TABLE `room_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `room_tarif`
--
ALTER TABLE `room_tarif`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT pour la table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `elders`
--
ALTER TABLE `elders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `elder_rooms`
--
ALTER TABLE `elder_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT pour la table `prescribers`
--
ALTER TABLE `prescribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `prescription_entities`
--
ALTER TABLE `prescription_entities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `residences`
--
ALTER TABLE `residences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `room_categories`
--
ALTER TABLE `room_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `room_tarif`
--
ALTER TABLE `room_tarif`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
