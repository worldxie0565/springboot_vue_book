/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 127.0.0.1:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 29/03/2020 12:09:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `publish` varchar(64) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
INSERT INTO `book` VALUES (2, '三国演义ss', '罗贯中', '清华出版社', 1000, 60);
INSERT INTO `book` VALUES (4, '追风筝的人', '卡勒德', '作家出版社', 150, 17.3);
INSERT INTO `book` VALUES (25, '不知道', '鲁迅传记', NULL, NULL, NULL);
INSERT INTO `book` VALUES (26, '呐喊', '鲁迅', NULL, NULL, NULL);
INSERT INTO `book` VALUES (27, '阿Q正传', '鲁迅', NULL, NULL, NULL);
INSERT INTO `book` VALUES (28, '红楼梦', '曹雪芹', NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
