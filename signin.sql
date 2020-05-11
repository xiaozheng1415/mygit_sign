/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50133
Source Host           : localhost:3306
Source Database       : signin

Target Server Type    : MYSQL
Target Server Version : 50133
File Encoding         : 65001

Date: 2020-04-09 21:40:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `signin`
-- ----------------------------
DROP TABLE IF EXISTS `signin`;
CREATE TABLE `signin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `signtime` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of signin
-- ----------------------------
INSERT INTO signin VALUES ('90', '3', '2018-03-16 15:04:21', '0');
INSERT INTO signin VALUES ('91', '3', '2018-03-16 15:04:44', '1');
INSERT INTO signin VALUES ('93', '3', '2018-03-16 16:16:08', '0');
INSERT INTO signin VALUES ('94', '3', '2018-03-16 16:16:53', '0');
INSERT INTO signin VALUES ('95', '3', '2018-03-16 16:17:39', '0');
INSERT INTO signin VALUES ('96', '3', '2018-03-16 16:17:46', '0');
INSERT INTO signin VALUES ('97', '3', '2018-03-16 16:19:31', '0');
INSERT INTO signin VALUES ('98', '3', '2018-03-16 16:20:54', '0');
INSERT INTO signin VALUES ('99', '3', '2018-03-16 16:21:14', '0');
INSERT INTO signin VALUES ('100', '3', '2018-03-16 16:23:00', '0');
INSERT INTO signin VALUES ('101', '3', '2018-03-16 16:27:14', '0');
INSERT INTO signin VALUES ('102', '3', '2018-03-16 16:32:38', '0');
INSERT INTO signin VALUES ('103', '3', '2018-03-16 16:32:54', '0');
INSERT INTO signin VALUES ('104', '3', '2018-03-16 16:33:09', '0');
INSERT INTO signin VALUES ('105', '3', '2018-03-16 16:33:14', '0');
INSERT INTO signin VALUES ('106', '3', '2018-03-16 16:33:46', '0');
INSERT INTO signin VALUES ('107', '3', '2018-03-16 16:34:59', '0');
INSERT INTO signin VALUES ('108', '3', '2018-03-16 16:35:21', '0');
INSERT INTO signin VALUES ('109', '3', '2018-03-16 16:37:57', '0');
INSERT INTO signin VALUES ('110', '3', '2018-03-16 16:40:32', '0');
INSERT INTO signin VALUES ('111', '3', '2018-03-16 16:40:50', '0');
INSERT INTO signin VALUES ('112', '3', '2018-03-16 16:43:39', '0');
INSERT INTO signin VALUES ('113', '3', '2018-03-16 17:05:03', '1');
INSERT INTO signin VALUES ('114', '3', '2018-03-16 17:05:28', '0');
INSERT INTO signin VALUES ('115', '3', '2018-03-16 17:10:26', '1');
INSERT INTO signin VALUES ('116', '3', '2018-03-19 08:38:44', '0');
INSERT INTO signin VALUES ('117', '3', '2018-03-19 17:18:48', '1');
INSERT INTO signin VALUES ('118', '14', '2020-03-31 09:35:59', '0');
INSERT INTO signin VALUES ('119', '14', '2020-04-01 13:19:05', '1');
INSERT INTO signin VALUES ('120', '14', '2020-04-01 13:19:08', '0');
INSERT INTO signin VALUES ('121', '14', '2020-04-01 13:19:10', '1');
INSERT INTO signin VALUES ('122', '14', '2020-04-01 13:19:12', '0');
INSERT INTO signin VALUES ('123', '14', '2020-04-01 13:19:13', '1');
INSERT INTO signin VALUES ('124', '3', '2020-04-04 08:47:24', '1');
INSERT INTO signin VALUES ('125', '3', '2020-04-04 11:02:00', '1');
INSERT INTO signin VALUES ('126', '3', '2020-04-04 11:06:04', '0');
INSERT INTO signin VALUES ('127', '3', '2020-04-04 11:06:06', '1');
INSERT INTO signin VALUES ('128', '3', '2020-04-04 11:06:12', '0');
INSERT INTO signin VALUES ('129', '3', '2020-04-04 11:06:55', '1');
INSERT INTO signin VALUES ('130', '3', '2020-04-04 11:07:21', '0');
INSERT INTO signin VALUES ('131', '3', '2020-04-04 11:07:22', '1');
INSERT INTO signin VALUES ('132', '3', '2020-04-04 11:08:34', '0');
INSERT INTO signin VALUES ('133', '3', '2020-04-04 11:08:36', '1');
INSERT INTO signin VALUES ('134', '3', '2020-04-04 11:08:48', '0');
INSERT INTO signin VALUES ('135', '3', '2020-04-04 11:08:49', '1');
INSERT INTO signin VALUES ('136', '3', '2020-04-08 11:53:03', '0');
INSERT INTO signin VALUES ('137', '3', '2020-04-08 11:53:06', '1');
INSERT INTO signin VALUES ('138', '3', '2020-04-08 12:09:45', '0');
INSERT INTO signin VALUES ('139', '3', '2020-04-08 12:25:06', '1');
INSERT INTO signin VALUES ('140', '6', '2020-04-09 12:42:45', '0');
INSERT INTO signin VALUES ('141', '6', '2020-04-09 12:42:55', '1');
INSERT INTO signin VALUES ('142', '17', '2020-04-09 12:43:34', '0');
INSERT INTO signin VALUES ('143', '17', '2020-04-09 12:43:40', '1');
INSERT INTO signin VALUES ('144', '3', '2020-04-09 15:50:39', '0');
INSERT INTO signin VALUES ('145', '3', '2020-04-09 15:50:41', '1');
INSERT INTO signin VALUES ('146', '3', '2020-04-09 21:39:16', '0');
INSERT INTO signin VALUES ('147', '3', '2020-04-09 21:39:18', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pswd` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `enable` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'admin', '管理员', 'admin', '1', '');
INSERT INTO user VALUES ('2', 'test', '测试账号', 'test', '0', '');
INSERT INTO user VALUES ('3', 't', '测试姓名', 't', '0', '');
INSERT INTO user VALUES ('4', 'a', 'a', 'a', '0', '');
INSERT INTO user VALUES ('5', 'b', '婷婷1', 't', '0', '');
INSERT INTO user VALUES ('6', 'ccc', 'c', 'ccc', '0', '');
INSERT INTO user VALUES ('7', 'dd', 'dd', 'dd', '0', '');
INSERT INTO user VALUES ('8', 'jack', '杰克', 'jack', '0', '');
INSERT INTO user VALUES ('9', 'tom', '汤姆', 'tom', '0', '');
INSERT INTO user VALUES ('13', 'c', 'c', 'c', '0', '');
INSERT INTO user VALUES ('14', 'd', 'd', 'd', '0', '');
INSERT INTO user VALUES ('15', 'e', 'e', 'e', '0', '');
INSERT INTO user VALUES ('16', 'q', 'q', 'q', '0', '');
INSERT INTO user VALUES ('24', 'yang', 'a', 'a', '0', '');
