CREATE DATABASE IF NOT EXISTS `dice`;

USE `dice`;

CREATE TABLE IF NOT EXISTS `dice_tables` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `x` float(11) NOT NULL,
  `y` float(11) NOT NULL,
  `z` float(11) NOT NULL,
  `rx` float(11) NOT NULL,
  `ry` float(11) NOT NULL,
  `rz` float(11) NOT NULL,
  `interior` int(5) DEFAULT 0,
  `vw` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AUTO_INCREMENT=1;