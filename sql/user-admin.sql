SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

SET NAMES utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
    `id` int(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `gravatar` varchar(100) DEFAULT NULL,
  `role`varchar(2) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
