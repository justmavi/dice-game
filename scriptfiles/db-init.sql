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

CREATE TABLE IF NOT EXISTS `promocodes` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(20) UNIQUE NOT NULL,
  `will_be_activated_in_level` int(11) DEFAULT 1,
  `bonus_money` int(11) DEFAULT NULL,
  `bonus_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nick` varchar(20) UNIQUE NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `money` int(11) DEFAULT 0,
  `ref_id` int(11) DEFAULT NULL,
  `promo_id` int(11) DEFAULT NULL,
  FOREIGN KEY (`ref_id`) REFERENCES `accounts`(`id`),
  FOREIGN KEY (`promo_id`) REFERENCES `promocodes`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AUTO_INCREMENT=1;