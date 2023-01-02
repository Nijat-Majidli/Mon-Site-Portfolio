-- Base de données : `u988716521_myportfolio`
--
CREATE DATABASE IF NOT EXISTS `u988716521_myportfolio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `u988716521_myportfolio`;
-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `content`, `created_at`) VALUES
(1, 'Nicat', 'nicatmecid@gmail.com', 'Salam dostum', 'Salam. Necesen? Mesaj geldi?', '2022-11-08 16:18:26'),
(2, 'Mecid', 'nicatmecidli@mail.ru', 'Salam', 'Salam dostum Nicat.', '2022-11-08 16:26:34'),
(3, 'Nijat', 'nijat@rambler.ru', 'Hello', 'Hello friend', '2022-11-08 16:33:39'),
(4, 'Majid', 'majid@hotmail.com', 'salut', 'salut mon ami', '2022-11-08 18:05:55'),
(5, 'nicat', 'nicat@mail.ru', 'Salam dostum', 'salam Nicat', '2022-12-02 08:55:52'),
(6, 'nicat', 'nicat@rambler.ru', 'Salam', 'Salam dostum', '2022-12-04 15:18:56');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `technologies` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project`
--

INSERT INTO `project` (`id`, `name`, `description`, `technologies`, `photo`, `link`, `date`) VALUES
(1, 'Fil Rouge', 'L’entreprise Village Green souhaite faire évoluer son système de gestion des commandes et de facturation. Actuellement, l’organisation utilise un système qui ne donne pas entière satisfaction. L’informatisation de la totalité du processus depuis la mise à jour du catalogue, de la commande jusqu’au paiement, a pour objectif de fluidifier le workflow de l’entreprise.\nLa société souhaite avoir un site d\'e-commerce permettant aux clients de visualiser l\'ensemble du catalogue et de passer des commandes en ligne.', 'HTML5, CSS3, Bootstrap4, Javascript, jQuery, PHP, Symfony5, MySQL', 'Fil Rouge.jpg', 'www.filrouge.fr', '2022-10-01'),
(2, 'Acoteq', 'L\’objectif principale du projet consiste à développer une plateforme d\'appel d\'offres en ligne dans le domaine de l\'isolation thermique dans le but de mettre en relation les clients et fournisseurs.', 'HTML5, CSS3, Bootstrap4, Javascript, jQuery, PHP, MySQL', 'Acoteq.jpg', 'https://acoteq.nijatmajidli.eu', '2022-10-16'),
(3, 'Jarditou', 'Création d\'un site pour l\'entreprise familiale Jarditou qui met tout son savoir-faire à la disposition des clients dans le domaine du jardin et du paysagisme. \nCréée il y a 70 ans, l\'entreprise Jarditou vend fleurs, arbustes, matériel à main et motorisés.\n  ', 'HTML5, CSS3, Bootstrap, Javascript, PHP, MySQL', 'Jarditou.jpg', 'www.jarditou.fr', '2020-12-01'),
(4, 'API-REST', 'Il s’agit de développer une petite application permettant d’accéder à l’application LMB par API.\r\nLes fonctions attendues sont les suivantes :\r\n- rechercher des clients\r\n- ouvrir une fiche client\r\n- éditer une fiche client', 'PHP', 'ApiRest.jpg', '', '2022-10-16');


