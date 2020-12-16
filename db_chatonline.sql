/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_chatonline

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ylrc_account`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_account`;
CREATE TABLE `ylrc_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `chat_status` varchar(18) DEFAULT NULL,
  `info` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_aihhboidd3kwbhu1k1v5nli8b` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_account
-- ----------------------------
INSERT INTO `ylrc_account` VALUES ('1', '2020-07-11 15:21:49', '2020-08-16 20:52:12', 'llqqxf@qq.com', '20200729/1596027199536.png', '18816265655', '123456', '1', '1', '南昌拌粉', 'active', '【南昌拌粉】');
INSERT INTO `ylrc_account` VALUES ('2', '2020-07-12 00:33:39', '2020-08-05 20:51:59', '167639026@qq.com', '20200712/1594485068661.jpg', null, '123456', '0', '1', '小明同学', 'active', '小明一听就是个好孩子！');
INSERT INTO `ylrc_account` VALUES ('3', '2020-07-12 14:21:25', '2020-07-15 16:44:13', 'a@qq.com', '20200712/1594485297763.png', '', '1111', '0', '1', '小张同学', 'status-offline', '喜欢学习！');
INSERT INTO `ylrc_account` VALUES ('4', '2020-07-12 14:21:50', '2020-08-23 20:50:09', 'ww@qq.com', '20200712/1594530373511.png', '17315696564', '1111', '1', '1', '慢慢来会比较快', 'active', '有人说慢慢来会比较快');
INSERT INTO `ylrc_account` VALUES ('5', '2020-07-12 14:22:02', '2020-07-15 17:07:41', '2401886169@qq.com', 'default.png', '', '1111', '0', '1', '舍我其谁', 'status-offline', '天下大事分久必合，合久必分！');
INSERT INTO `ylrc_account` VALUES ('6', '2020-07-12 14:22:13', '2020-08-04 21:24:47', 'ww@qq.com', '20200712/1594559516305.jpg', '16656564656', '1111', '0', '1', '秦时明月', 'active', '秦时明月汉时关！');
INSERT INTO `ylrc_account` VALUES ('7', '2020-07-12 14:22:22', '2020-07-15 17:08:20', '2401886169@qq.com', '20200712/1594560371017.jpg', '18818881818', '1111', '0', '1', '雄霸天下', 'status-offline', '风云雄霸天下，变幻莫测！');
INSERT INTO `ylrc_account` VALUES ('8', '2020-07-12 14:22:39', '2020-07-15 17:08:32', 'ww@qq.com', '20200712/1594560427415.jpg', '', '1111', '1', '1', '天下霸唱', 'active', '鬼吹灯系列小说作者！');
INSERT INTO `ylrc_account` VALUES ('9', '2020-07-29 21:32:02', '2020-07-29 21:33:04', 'zhubo@qq.com', '20200729/1596029584781.jpeg', '', '123456', '0', '1', '朱波蕊蕊', 'active', '');
INSERT INTO `ylrc_account` VALUES ('10', '2020-08-15 15:11:51', '2020-08-15 15:14:11', 'wuying@qq.com', '20200815/1597475651573.jpg', '', '1111', '0', '1', '无影无踪', 'active', '');
INSERT INTO `ylrc_account` VALUES ('11', '2020-08-23 15:16:44', '2020-08-23 15:16:44', '115432031@qq.com', 'default.png', null, 'wjk5889164', '0', '1', '王金库T', 'status-offline', null);
INSERT INTO `ylrc_account` VALUES ('12', '2020-08-23 15:17:13', '2020-08-23 15:17:13', '552034509@qq.com', 'default.png', null, 'niyu1234', '0', '1', 'niyu', 'status-offline', null);
INSERT INTO `ylrc_account` VALUES ('13', '2020-08-23 15:17:43', '2020-08-23 15:17:43', '2568877130@qq.com', 'default.png', null, '17530710863', '0', '1', '苑鹏波Y', 'status-offline', null);
INSERT INTO `ylrc_account` VALUES ('14', '2020-08-24 21:41:33', '2020-08-24 21:42:52', 'llq@qq.com', '20200824/1598276557568.jpg', '', '1111', '2', '1', 'test', 'active', '我是一只小小小小鸟！');

-- ----------------------------
-- Table structure for `ylrc_account_group`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_account_group`;
CREATE TABLE `ylrc_account_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `info` varchar(256) DEFAULT NULL,
  `name` varchar(18) DEFAULT NULL,
  `picture` varchar(32) DEFAULT NULL,
  `cur_people` int(11) NOT NULL,
  `max_people` int(11) NOT NULL,
  `min_people` int(11) NOT NULL,
  `notice` varchar(256) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdt9w9af1lu2q1tr080w5s78mt` (`admin_id`),
  CONSTRAINT `FKdt9w9af1lu2q1tr080w5s78mt` FOREIGN KEY (`admin_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_account_group
-- ----------------------------
INSERT INTO `ylrc_account_group` VALUES ('4', '2020-12-11 22:55:37', '2020-12-16 14:27:39', '这里是南昌拌粉交流群，大家踊跃发言！', '南昌拌粉交流群', '20200722/1595430448489.jpg', '10', '65535', '2', '今天下午下班后开个短会，请大家不要着急回家，开完会了再走！', '1');
INSERT INTO `ylrc_account_group` VALUES ('5', '2020-12-14 21:48:22', '2020-12-14 21:48:22', '这里是测试群功能', '测试群', 'default-group-chat.jpg', '5', '65535', '2', null, '1');

-- ----------------------------
-- Table structure for `ylrc_account_group_member`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_account_group_member`;
CREATE TABLE `ylrc_account_group_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `msg_status` int(11) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `account_group_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmycyncamy6b3gfme7s694mban` (`account_group_id`),
  KEY `FKqryb35bh5jt8d9uhd8d46x9pa` (`member_id`),
  CONSTRAINT `FKmycyncamy6b3gfme7s694mban` FOREIGN KEY (`account_group_id`) REFERENCES `ylrc_account_group` (`id`),
  CONSTRAINT `FKqryb35bh5jt8d9uhd8d46x9pa` FOREIGN KEY (`member_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_account_group_member
-- ----------------------------
INSERT INTO `ylrc_account_group_member` VALUES ('15', '2020-07-21 22:55:37', '2020-08-16 14:30:11', '1', '南昌拌粉大厨', '4', '1');
INSERT INTO `ylrc_account_group_member` VALUES ('20', '2020-07-23 22:04:24', '2020-07-23 22:04:24', '1', '慢慢来会比较快', '4', '4');
INSERT INTO `ylrc_account_group_member` VALUES ('21', '2020-07-23 22:04:24', '2020-07-23 22:04:24', '1', '舍我其谁', '4', '5');
INSERT INTO `ylrc_account_group_member` VALUES ('22', '2020-07-23 22:04:24', '2020-07-23 22:04:24', '1', '秦时明月', '4', '6');
INSERT INTO `ylrc_account_group_member` VALUES ('23', '2020-07-23 22:04:24', '2020-07-23 22:04:24', '1', '雄霸天下', '4', '7');
INSERT INTO `ylrc_account_group_member` VALUES ('24', '2020-07-23 22:04:24', '2020-07-23 22:04:24', '1', '天下霸唱', '4', '8');
INSERT INTO `ylrc_account_group_member` VALUES ('26', '2020-07-23 22:04:31', '2020-07-23 22:04:31', '1', '小张同学', '4', '3');
INSERT INTO `ylrc_account_group_member` VALUES ('29', '2020-08-05 21:01:04', '2020-08-05 21:01:04', '1', '小明同学', '4', '2');
INSERT INTO `ylrc_account_group_member` VALUES ('30', '2020-08-15 23:39:08', '2020-08-15 23:39:08', '1', '朱波蕊蕊', '4', '9');
INSERT INTO `ylrc_account_group_member` VALUES ('37', '2020-08-16 14:27:39', '2020-08-16 14:27:39', '1', '无影无踪', '4', '10');
INSERT INTO `ylrc_account_group_member` VALUES ('38', '2020-08-24 21:48:22', '2020-08-24 21:48:22', '1', '慢慢来会比较快', '5', '4');
INSERT INTO `ylrc_account_group_member` VALUES ('39', '2020-08-24 21:48:22', '2020-08-24 21:48:22', '1', '雄霸天下', '5', '7');
INSERT INTO `ylrc_account_group_member` VALUES ('40', '2020-08-24 21:48:22', '2020-08-24 21:48:22', '1', '天下霸唱', '5', '8');
INSERT INTO `ylrc_account_group_member` VALUES ('41', '2020-08-24 21:48:22', '2020-08-24 21:48:22', '1', 'test', '5', '14');
INSERT INTO `ylrc_account_group_member` VALUES ('42', '2020-08-24 21:48:22', '2020-08-24 21:48:22', '1', '南昌拌粉', '5', '1');

-- ----------------------------
-- Table structure for `ylrc_database_bak`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_database_bak`;
CREATE TABLE `ylrc_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_database_bak
-- ----------------------------
INSERT INTO `ylrc_database_bak` VALUES ('10', '2020-03-22 19:36:47', '2020-03-22 19:36:47', 'db_boot_base_20200322193647.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('11', '2020-03-22 19:37:54', '2020-03-22 19:37:54', 'db_boot_base_20200322193754.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('12', '2020-03-22 19:40:04', '2020-03-22 19:40:04', 'db_boot_base_20200322194004.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('14', '2020-03-22 19:40:14', '2020-03-22 19:40:14', 'db_boot_base_20200322194014.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('15', '2020-03-22 19:40:19', '2020-03-22 19:40:19', 'db_boot_base_20200322194019.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('17', '2020-03-22 19:43:34', '2020-03-22 19:43:34', 'db_boot_base_20200322194334.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('18', '2020-03-22 19:43:39', '2020-03-22 19:43:39', 'db_boot_base_20200322194339.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('20', '2020-03-22 19:43:49', '2020-03-22 19:43:49', 'db_boot_base_20200322194349.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('21', '2020-03-22 19:43:54', '2020-03-22 19:43:54', 'db_boot_base_20200322194354.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('22', '2020-03-22 19:43:59', '2020-03-22 19:43:59', 'db_boot_base_20200322194359.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('23', '2020-03-22 19:44:04', '2020-03-22 19:44:04', 'db_boot_base_20200322194404.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('24', '2020-03-22 19:44:09', '2020-03-22 19:44:09', 'db_boot_base_20200322194409.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('25', '2020-03-22 19:44:14', '2020-03-22 19:44:14', 'db_boot_base_20200322194414.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('26', '2020-03-22 19:44:19', '2020-03-22 19:44:19', 'db_boot_base_20200322194419.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('27', '2020-03-22 19:44:24', '2020-03-22 19:44:24', 'db_boot_base_20200322194424.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('28', '2020-03-22 19:44:29', '2020-03-22 19:44:29', 'db_boot_base_20200322194429.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('29', '2020-03-22 19:44:34', '2020-03-22 19:44:34', 'db_boot_base_20200322194434.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('30', '2020-03-22 19:44:39', '2020-03-22 19:44:39', 'db_boot_base_20200322194439.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('31', '2020-03-23 17:46:49', '2020-03-23 17:46:49', 'db_boot_base_20200323174649.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('32', '2020-07-12 01:00:00', '2020-07-12 01:00:00', 'db_chatonline_20200712010000.sql', 'E:/workspace-test/chatonline/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('33', '2020-08-16 01:00:00', '2020-08-16 01:00:00', 'db_chatonline_20200816010000.sql', 'E:/workspace-test/chatonline/src/main/resources/backup/');

-- ----------------------------
-- Table structure for `ylrc_friend`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_friend`;
CREATE TABLE `ylrc_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `msg_status` int(11) DEFAULT NULL,
  `remark` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `friend_account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcrcuhy1ifelusa18ajbuptv00` (`account_id`),
  KEY `FKgg73y8195r0ohj3pxfx6m2ahf` (`friend_account_id`),
  CONSTRAINT `FKcrcuhy1ifelusa18ajbuptv00` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`),
  CONSTRAINT `FKgg73y8195r0ohj3pxfx6m2ahf` FOREIGN KEY (`friend_account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_friend
-- ----------------------------
INSERT INTO `ylrc_friend` VALUES ('37', '2020-07-15 16:36:52', '2020-07-15 16:36:52', '1', '南昌拌粉', '1', '2', '1');
INSERT INTO `ylrc_friend` VALUES ('38', '2020-07-15 16:36:52', '2020-07-16 12:12:48', '1', '张慧敏', '1', '1', '2');
INSERT INTO `ylrc_friend` VALUES ('39', '2020-07-15 16:43:54', '2020-07-15 16:43:54', '1', '南昌拌粉', '1', '3', '1');
INSERT INTO `ylrc_friend` VALUES ('40', '2020-07-15 16:43:54', '2020-07-15 17:22:08', '1', '张晓敏', '1', '1', '3');
INSERT INTO `ylrc_friend` VALUES ('41', '2020-07-15 17:04:55', '2020-07-15 17:04:55', '1', '南昌拌粉', '1', '4', '1');
INSERT INTO `ylrc_friend` VALUES ('42', '2020-07-15 17:04:55', '2020-08-05 21:45:18', '1', 'Dr.X++ ', '1', '1', '4');
INSERT INTO `ylrc_friend` VALUES ('43', '2020-07-15 17:07:16', '2020-07-15 17:07:16', '1', '南昌拌粉', '1', '5', '1');
INSERT INTO `ylrc_friend` VALUES ('44', '2020-07-15 17:07:17', '2020-07-15 17:07:17', '1', '舍我其谁', '1', '1', '5');
INSERT INTO `ylrc_friend` VALUES ('45', '2020-07-15 17:07:57', '2020-07-15 17:07:57', '1', '南昌拌粉', '1', '6', '1');
INSERT INTO `ylrc_friend` VALUES ('46', '2020-07-15 17:07:57', '2020-07-20 20:52:24', '1', '秦时明月', '1', '1', '6');
INSERT INTO `ylrc_friend` VALUES ('47', '2020-07-15 17:08:18', '2020-07-15 17:08:18', '1', '南昌拌粉', '1', '7', '1');
INSERT INTO `ylrc_friend` VALUES ('48', '2020-07-15 17:08:18', '2020-07-15 17:13:23', '1', '张大伯', '1', '1', '7');
INSERT INTO `ylrc_friend` VALUES ('49', '2020-07-15 17:12:40', '2020-07-22 23:07:38', '1', '天下霸唱', '1', '1', '8');
INSERT INTO `ylrc_friend` VALUES ('50', '2020-07-15 17:12:40', '2020-07-15 17:12:40', '1', '南昌拌粉', '1', '8', '1');
INSERT INTO `ylrc_friend` VALUES ('51', '2020-07-29 21:35:31', '2020-07-29 21:45:07', '0', '南昌拌粉', '1', '9', '1');
INSERT INTO `ylrc_friend` VALUES ('52', '2020-07-29 21:35:31', '2020-07-29 21:35:31', '1', '朱波蕊蕊', '1', '1', '9');
INSERT INTO `ylrc_friend` VALUES ('53', '2020-08-15 15:14:30', '2020-08-16 14:30:17', '1', '无影无踪', '1', '1', '10');
INSERT INTO `ylrc_friend` VALUES ('55', '2020-08-16 15:22:02', '2020-08-16 15:22:02', '1', '南昌拌粉', '1', '10', '1');
INSERT INTO `ylrc_friend` VALUES ('56', '2020-08-24 21:43:12', '2020-08-24 21:46:45', '1', 'test', '1', '1', '14');
INSERT INTO `ylrc_friend` VALUES ('57', '2020-08-24 21:43:12', '2020-08-24 21:43:12', '1', '南昌拌粉', '1', '14', '1');

-- ----------------------------
-- Table structure for `ylrc_friend_request`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_friend_request`;
CREATE TABLE `ylrc_friend_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `remark` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `reciever_account_id` bigint(20) DEFAULT NULL,
  `sender_account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1rfhidhsjxpcvssa531fewjho` (`reciever_account_id`),
  KEY `FK1bh5uj16p7s7c5nus7xjedntx` (`sender_account_id`),
  CONSTRAINT `FK1bh5uj16p7s7c5nus7xjedntx` FOREIGN KEY (`sender_account_id`) REFERENCES `ylrc_account` (`id`),
  CONSTRAINT `FK1rfhidhsjxpcvssa531fewjho` FOREIGN KEY (`reciever_account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_friend_request
-- ----------------------------
INSERT INTO `ylrc_friend_request` VALUES ('24', '2020-07-15 16:33:08', '2020-07-15 16:36:52', '你好呀！', '1', '2', '1');
INSERT INTO `ylrc_friend_request` VALUES ('25', '2020-07-15 16:33:08', '2020-07-15 16:43:54', '你好呀！', '1', '3', '1');
INSERT INTO `ylrc_friend_request` VALUES ('26', '2020-07-15 16:33:40', '2020-07-15 17:04:55', 'hi', '1', '4', '1');
INSERT INTO `ylrc_friend_request` VALUES ('27', '2020-07-15 16:34:31', '2020-07-15 17:07:17', '哈喽！我是新来的同学叫王美丽！', '1', '5', '1');
INSERT INTO `ylrc_friend_request` VALUES ('28', '2020-07-15 16:34:31', '2020-07-15 17:07:57', '哈喽！我是新来的同学叫王美丽！', '1', '6', '1');
INSERT INTO `ylrc_friend_request` VALUES ('29', '2020-07-15 16:34:31', '2020-07-15 17:08:18', '哈喽！我是新来的同学叫王美丽！', '1', '7', '1');
INSERT INTO `ylrc_friend_request` VALUES ('30', '2020-07-15 16:34:31', '2020-07-15 17:08:37', '哈喽！我是新来的同学叫王美丽！', '-1', '8', '1');
INSERT INTO `ylrc_friend_request` VALUES ('31', '2020-07-15 17:08:51', '2020-07-15 17:12:40', '你好', '1', '1', '8');
INSERT INTO `ylrc_friend_request` VALUES ('32', '2020-07-29 21:35:21', '2020-07-29 21:35:31', '我是蕊蕊', '1', '9', '1');
INSERT INTO `ylrc_friend_request` VALUES ('33', '2020-08-15 15:12:45', '2020-08-16 15:22:02', '你好呀小哥哥\n', '1', '1', '10');
INSERT INTO `ylrc_friend_request` VALUES ('34', '2020-08-24 21:42:03', '2020-08-24 21:43:12', '哈喽', '1', '1', '14');

-- ----------------------------
-- Table structure for `ylrc_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_menu`;
CREATE TABLE `ylrc_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`),
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_menu
-- ----------------------------
INSERT INTO `ylrc_menu` VALUES ('2', '2020-03-14 14:26:03', '2020-03-14 18:24:53', '系统设置', '', 'mdi-settings', '0', null, '', '');
INSERT INTO `ylrc_menu` VALUES ('3', '2020-03-14 16:58:55', '2020-07-11 11:33:39', '菜单管理', '/admin/menu/list', 'mdi-view-list', '1', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('5', '2020-03-14 17:04:44', '2020-07-11 11:34:19', '新增', '/admin/menu/add', 'mdi-plus', '2', '3', '', '');
INSERT INTO `ylrc_menu` VALUES ('7', '2020-03-14 17:07:43', '2020-03-15 12:11:25', '角色管理', '/admin/role/list', 'mdi-account-settings-variant', '5', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('8', '2020-03-14 18:28:48', '2020-07-11 11:34:30', '编辑', 'edit(\'/admin/menu/edit\')', 'mdi-grease-pencil', '3', '3', '', '');
INSERT INTO `ylrc_menu` VALUES ('9', '2020-03-14 18:30:00', '2020-03-21 22:08:20', '删除', 'del(\'/admin/menu/delete\')', 'mdi-close', '4', '3', '', '');
INSERT INTO `ylrc_menu` VALUES ('10', '2020-03-15 12:12:00', '2020-03-15 12:12:00', '添加', '/admin/role/add', 'mdi-account-plus', '6', '7', '', '');
INSERT INTO `ylrc_menu` VALUES ('11', '2020-03-15 12:12:36', '2020-03-21 22:10:45', '编辑', 'edit(\'/admin/role/edit\')', 'mdi-account-edit', '7', '7', '', '');
INSERT INTO `ylrc_menu` VALUES ('12', '2020-03-15 12:13:19', '2020-03-21 22:15:27', '删除', 'del(\'/admin/role/delete\')', 'mdi-account-remove', '8', '7', '', '');
INSERT INTO `ylrc_menu` VALUES ('13', '2020-03-15 12:14:52', '2020-03-15 12:17:00', '用户管理', '/admin/user/list', 'mdi-account-multiple', '9', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('14', '2020-03-15 12:15:22', '2020-03-15 12:17:27', '添加', '/admin/user/add', 'mdi-account-plus', '10', '13', '', '');
INSERT INTO `ylrc_menu` VALUES ('15', '2020-03-16 17:18:14', '2020-03-21 22:11:19', '编辑', 'edit(\'/admin/user/edit\')', 'mdi-account-edit', '11', '13', '', '');
INSERT INTO `ylrc_menu` VALUES ('16', '2020-03-16 17:19:01', '2020-03-21 22:15:36', '删除', 'del(\'/admin/user/delete\')', 'mdi-account-remove', '12', '13', '', '');
INSERT INTO `ylrc_menu` VALUES ('19', '2020-03-22 11:24:36', '2020-03-22 11:26:00', '上传图片', '/upload/upload_photo', 'mdi-arrow-up-bold-circle', '0', '13', '', '');
INSERT INTO `ylrc_menu` VALUES ('20', '2020-03-22 14:09:35', '2020-03-22 14:09:47', '日志管理', '/system/operator_log_list', 'mdi-tag-multiple', '13', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('21', '2020-03-22 14:11:39', '2020-03-22 14:11:39', '删除', 'del(\'/system/delete_operator_log\')', 'mdi-tag-remove', '14', '20', '', '');
INSERT INTO `ylrc_menu` VALUES ('22', '2020-03-22 14:12:57', '2020-03-22 14:46:55', '清空日志', 'delAll(\'/system/delete_all_operator_log\')', 'mdi-delete-circle', '15', '20', '', '');
INSERT INTO `ylrc_menu` VALUES ('23', '2020-03-22 14:46:40', '2020-03-22 14:47:09', '数据备份', '/admin/database_bak/list', 'mdi-database', '16', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('24', '2020-03-22 14:48:07', '2020-03-22 15:13:41', '备份', 'add(\'/admin/database_bak/add\')', 'mdi-database-plus', '17', '23', '', '');
INSERT INTO `ylrc_menu` VALUES ('25', '2020-03-22 14:49:03', '2020-03-22 14:49:03', '删除', 'del(\'/admin/database_bak/delete\')', 'mdi-database-minus', '18', '23', '', '');
INSERT INTO `ylrc_menu` VALUES ('26', '2020-03-22 19:36:20', '2020-03-22 19:36:20', '还原', 'restore(\'/admin/database_bak/restore\')', 'mdi-database-minus', '19', '23', '', '');
INSERT INTO `ylrc_menu` VALUES ('27', '2020-08-16 20:27:27', '2020-08-16 20:34:00', '聊天管理', '', 'mdi-account-multiple', '20', null, '', '');
INSERT INTO `ylrc_menu` VALUES ('28', '2020-08-16 20:28:22', '2020-08-16 20:35:23', '账号管理', '/admin/account/list', 'mdi-account-multiple-outline', '21', '27', '', '');
INSERT INTO `ylrc_menu` VALUES ('29', '2020-08-16 20:35:11', '2020-08-16 20:35:11', '群组管理', '/admin/group/list', 'mdi-account-switch', '22', '27', '', '');
INSERT INTO `ylrc_menu` VALUES ('30', '2020-08-16 20:36:33', '2020-08-16 20:36:33', '消息管理', '/admin/msg/list', 'mdi-message-text', '23', '27', '', '');
INSERT INTO `ylrc_menu` VALUES ('31', '2020-08-16 20:38:12', '2020-08-16 20:40:20', '冻结', 'freezeAccount(\'/admin/account/edit\')', 'mdi-account-remove', '24', '28', '', '');
INSERT INTO `ylrc_menu` VALUES ('32', '2020-08-16 20:40:56', '2020-08-16 20:40:56', '解冻', 'unFreezeAccount(\'/admin/account/edit\')', 'mdi-account-check', '25', '28', '', '');
INSERT INTO `ylrc_menu` VALUES ('33', '2020-08-16 20:43:32', '2020-08-16 20:43:32', '解散群组', 'destoryGroup(\'/admin/group/destory\')', 'mdi-account-off', '25', '29', '', '');
INSERT INTO `ylrc_menu` VALUES ('34', '2020-08-16 20:44:45', '2020-08-20 21:28:24', '移除成员', 'deleteMember(\'/admin/group/delete_member\')', 'mdi-account-minus', '26', '29', '', '');
INSERT INTO `ylrc_menu` VALUES ('35', '2020-08-16 20:45:45', '2020-08-20 21:06:34', '查看详情', 'viewInfo(\'/admin/msg/view_info\')', 'mdi-eye', '27', '30', '', '');
INSERT INTO `ylrc_menu` VALUES ('36', '2020-08-20 21:30:58', '2020-08-20 21:30:58', '查看群成员', 'viewMembers(\'/admin/group/view_member\')', 'mdi-eye', '28', '29', '', '');

-- ----------------------------
-- Table structure for `ylrc_msg_content`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_msg_content`;
CREATE TABLE `ylrc_msg_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `attach_size` bigint(20) DEFAULT NULL,
  `attach_url` varchar(512) DEFAULT NULL,
  `chat_type` varchar(12) DEFAULT NULL,
  `ext_attr` varchar(1280) DEFAULT NULL,
  `from_id` bigint(20) NOT NULL,
  `content` varchar(10240) DEFAULT NULL,
  `msg_type` varchar(12) DEFAULT NULL,
  `to_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_msg_content
-- ----------------------------
INSERT INTO `ylrc_msg_content` VALUES ('27', '2020-08-05 20:51:26', '2020-08-05 20:51:26', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', '你好', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('28', '2020-08-05 20:51:29', '2020-08-05 20:51:29', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', '小明', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('29', '2020-08-05 20:51:40', '2020-08-05 20:51:40', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '大家都在吗？', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('30', '2020-08-05 20:51:47', '2020-08-05 20:51:47', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '在忙什么呢？', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('31', '2020-08-05 20:52:10', '2020-08-05 20:52:10', '0', null, 'single', '张慧敏;20200712/1594485068661.jpg', '38', '你好', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('32', '2020-08-05 20:52:12', '2020-08-05 20:52:12', '0', null, 'single', '张慧敏;20200712/1594485068661.jpg', '38', 'CEO', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('33', '2020-08-05 20:52:30', '2020-08-05 20:52:30', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '没人吗？', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('34', '2020-08-05 20:52:40', '2020-08-05 20:52:40', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', '嗯嗯', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('35', '2020-08-05 20:52:44', '2020-08-05 20:52:44', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', '你来了呀', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('36', '2020-08-05 20:52:47', '2020-08-05 20:52:47', '0', null, 'single', '张慧敏;20200712/1594485068661.jpg', '38', '恩', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('37', '2020-08-05 20:52:48', '2020-08-05 20:52:48', '0', null, 'single', '张慧敏;20200712/1594485068661.jpg', '38', '对的', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('38', '2020-08-05 20:52:54', '2020-08-05 20:52:54', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '有的', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('39', '2020-08-05 20:52:56', '2020-08-05 20:52:56', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '我在了', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('40', '2020-08-05 20:53:14', '2020-08-05 20:53:14', '0', '20200805/1596631994443.png', 'group', '小明同学;20200712/1594485068661.jpg', '2', '[图片]nc_nav.png', 'img', '4');
INSERT INTO `ylrc_msg_content` VALUES ('41', '2020-08-05 20:53:38', '2020-08-05 20:53:38', '0', '20200805/1596632018094.mp3', 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', 'audio.mp3', 'audio', '4');
INSERT INTO `ylrc_msg_content` VALUES ('42', '2020-08-05 20:54:32', '2020-08-05 20:54:32', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '哎呀', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('43', '2020-08-05 20:54:36', '2020-08-05 20:54:36', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '我一会会不在', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('44', '2020-08-05 20:54:42', '2020-08-05 20:54:42', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '你们都聊了这么多了', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('45', '2020-08-05 20:54:53', '2020-08-05 20:54:53', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '哈哈', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('46', '2020-08-05 20:55:07', '2020-08-05 20:55:07', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '老板', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('47', '2020-08-05 20:55:09', '2020-08-05 20:55:09', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '在吗', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('48', '2020-08-05 20:55:14', '2020-08-05 20:55:14', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '恩', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('49', '2020-08-05 20:55:15', '2020-08-05 20:55:15', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '在的', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('50', '2020-08-05 20:56:46', '2020-08-05 20:56:46', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '你这是', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('51', '2020-08-05 20:59:08', '2020-08-05 20:59:08', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '哎', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('52', '2020-08-05 20:59:20', '2020-08-05 20:59:20', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '都好了', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('53', '2020-08-05 21:00:23', '2020-08-05 21:00:23', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '移除了', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('54', '2020-08-05 21:00:50', '2020-08-05 21:00:50', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '恩 看到了', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('55', '2020-08-05 21:01:13', '2020-08-05 21:01:13', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '又拉进去了', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('56', '2020-08-05 21:10:31', '2020-08-05 21:10:31', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '在', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('57', '2020-08-05 21:10:52', '2020-08-05 21:10:52', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '号', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('58', '2020-08-05 21:11:27', '2020-08-05 21:11:27', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '这次呢', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('59', '2020-08-05 21:11:36', '2020-08-05 21:11:36', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '这次ok的', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('60', '2020-08-05 21:11:44', '2020-08-05 21:11:44', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '那就好', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('61', '2020-08-05 21:11:48', '2020-08-05 21:11:48', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '给你们看个美女', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('62', '2020-08-05 21:12:50', '2020-08-05 21:12:50', '0', '20200805/1596633170422.jpg', 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '[图片]lisa.jpg', 'img', '4');
INSERT INTO `ylrc_msg_content` VALUES ('63', '2020-08-05 21:13:15', '2020-08-05 21:13:15', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '好漂亮啊', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('64', '2020-08-05 21:26:18', '2020-08-05 21:26:18', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '咋了', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('65', '2020-08-05 21:31:26', '2020-08-05 21:31:26', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', 'heihei', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('66', '2020-08-05 21:31:35', '2020-08-05 21:31:35', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '消息', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('67', '2020-08-05 21:31:51', '2020-08-05 21:31:51', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '免打扰', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('68', '2020-08-05 21:33:19', '2020-08-05 21:33:19', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '现在呢', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('69', '2020-08-05 21:33:55', '2020-08-05 21:33:55', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '再来一次', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('70', '2020-08-05 21:34:24', '2020-08-05 21:34:24', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '6', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('71', '2020-08-05 21:34:28', '2020-08-05 21:34:28', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '9', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('72', '2020-08-05 21:34:38', '2020-08-05 21:34:38', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '2', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('73', '2020-08-05 21:34:42', '2020-08-05 21:34:42', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '8', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('74', '2020-08-05 21:34:48', '2020-08-05 21:34:48', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '0', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('75', '2020-08-05 21:35:04', '2020-08-05 21:35:04', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '3', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('76', '2020-08-05 21:35:10', '2020-08-05 21:35:10', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '21', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('77', '2020-08-05 21:36:01', '2020-08-05 21:36:01', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '6', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('78', '2020-08-05 21:38:44', '2020-08-05 21:38:44', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '666', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('79', '2020-08-05 21:39:42', '2020-08-05 21:39:42', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '我来', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('80', '2020-08-05 21:41:18', '2020-08-05 21:41:18', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '我来哦', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('81', '2020-08-05 21:41:26', '2020-08-05 21:41:26', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '恩', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('82', '2020-08-05 21:42:28', '2020-08-05 21:42:28', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '响几声？', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('83', '2020-08-05 21:42:42', '2020-08-05 21:42:42', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '一声', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('84', '2020-08-05 21:44:39', '2020-08-05 21:44:39', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '来了', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('85', '2020-08-05 21:44:50', '2020-08-05 21:44:50', '0', null, 'group', '小明同学;20200712/1594485068661.jpg', '2', '恩', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('86', '2020-08-05 21:45:05', '2020-08-05 21:45:05', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '哈哈', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('87', '2020-08-05 21:45:10', '2020-08-05 21:45:10', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '78 ', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('88', '2020-08-05 21:45:11', '2020-08-05 21:45:11', '0', null, 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '撒', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('89', '2020-08-05 21:45:35', '2020-08-05 21:45:35', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', ' 好了', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('90', '2020-08-05 21:49:01', '2020-08-05 21:49:01', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', 'didi', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('91', '2020-08-05 21:49:15', '2020-08-05 21:49:15', '0', null, 'group', '慢慢来会比较快;20200712/1594530373511.png', '4', '你还早呢', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('92', '2020-08-05 21:49:22', '2020-08-05 21:49:22', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', 'hhh', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('93', '2020-08-05 21:49:42', '2020-08-05 21:49:42', '0', null, 'single', '张慧敏;20200712/1594485068661.jpg', '38', '恩', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('94', '2020-08-05 21:50:21', '2020-08-05 21:50:21', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', 'sha', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('95', '2020-08-05 21:50:34', '2020-08-05 21:50:34', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '你们这群比', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('96', '2020-08-05 21:50:35', '2020-08-05 21:50:35', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '哈哈哈', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('97', '2020-08-05 21:50:37', '2020-08-05 21:50:37', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '真的是', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('98', '2020-08-05 21:50:52', '2020-08-05 21:50:52', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '撒都不知', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('99', '2020-08-15 15:15:03', '2020-08-15 15:15:03', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '你好', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('100', '2020-08-15 15:15:11', '2020-08-15 15:15:11', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '在下霍元甲', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('101', '2020-08-15 15:16:53', '2020-08-15 15:16:53', '0', null, 'single', '无影无踪;20200815/1597475651573.jpg', '53', '你好', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('102', '2020-08-15 15:17:07', '2020-08-15 15:17:07', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '阁下是？', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('103', '2020-08-15 15:17:14', '2020-08-15 15:17:14', '0', '20200815/1597475834412.jpg', 'single', '无影无踪;20200815/1597475651573.jpg', '53', '[图片]timg.jpg', 'img', '1');
INSERT INTO `ylrc_msg_content` VALUES ('104', '2020-08-15 15:17:21', '2020-08-15 15:17:21', '0', null, 'single', '无影无踪;20200815/1597475651573.jpg', '53', '这是当年的我', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('105', '2020-08-15 15:17:25', '2020-08-15 15:17:25', '0', null, 'single', '无影无踪;20200815/1597475651573.jpg', '53', '英俊无敌', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('106', '2020-08-15 15:17:43', '2020-08-15 15:17:43', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '果然如此', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('107', '2020-08-15 15:17:47', '2020-08-15 15:17:47', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '百闻不如一见', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('108', '2020-08-15 15:39:29', '2020-08-15 15:39:29', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '真的是', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('109', '2020-08-15 15:39:44', '2020-08-15 15:39:44', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '真的是', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('110', '2020-08-15 16:50:13', '2020-08-15 16:50:13', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/emoji/1.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('111', '2020-08-15 17:17:52', '2020-08-15 17:17:52', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/emoji/1.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('112', '2020-08-15 17:39:09', '2020-08-15 17:39:09', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/emoji/10.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('113', '2020-08-15 17:39:42', '2020-08-15 17:39:42', '0', '20200815/1597484382035.jpg', 'single', '无影无踪;20200815/1597475651573.jpg', '53', '[图片]lisa.jpg', 'img', '1');
INSERT INTO `ylrc_msg_content` VALUES ('114', '2020-08-15 18:07:27', '2020-08-15 18:07:27', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/tieba/1.jpg\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('115', '2020-08-15 18:07:51', '2020-08-15 18:07:51', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/tieba/2.jpg\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('116', '2020-08-15 18:09:12', '2020-08-15 18:09:12', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/qq/1.gif\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('117', '2020-08-15 18:11:46', '2020-08-15 18:11:46', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/qq/6.gif\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('118', '2020-08-15 18:19:23', '2020-08-15 18:19:23', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/qq/14.gif\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('119', '2020-08-15 18:19:30', '2020-08-15 18:19:30', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/qq/24.gif\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('120', '2020-08-15 18:20:16', '2020-08-15 18:20:16', '0', null, 'single', '无影无踪;20200815/1597475651573.jpg', '53', '<img class=\"emoji_icon\" src=\"/home/css/qq/6.gif\">', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('121', '2020-08-15 18:20:43', '2020-08-15 18:20:43', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '我他妈要奔溃了<img class=\"emoji_icon\" src=\"/home/css/qq/6.gif\"><img class=\"emoji_icon\" src=\"/home/css/qq/6.gif\"><img class=\"emoji_icon\" src=\"/home/css/qq/6.gif\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('122', '2020-08-15 18:23:50', '2020-08-15 18:23:50', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/qq/73.gif\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('123', '2020-08-15 18:35:55', '2020-08-15 18:35:55', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/qq/1.gif\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('124', '2020-08-15 18:36:01', '2020-08-15 18:36:01', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/tieba/4.jpg\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('125', '2020-08-15 18:36:09', '2020-08-15 18:36:09', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/tieba/27.jpg\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('126', '2020-08-15 18:36:22', '2020-08-15 18:36:22', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/emoji/1.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('127', '2020-08-15 18:36:54', '2020-08-15 18:36:54', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/emoji/25.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('128', '2020-08-15 18:37:39', '2020-08-15 18:37:39', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/emoji/1.png\" style=\"\n    width: 30px;\n\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('129', '2020-08-15 18:38:57', '2020-08-15 18:38:57', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/emoji/4.png\"><img class=\"emoji_icon\" src=\"/home/css/tieba/24.jpg\"><img class=\"emoji_icon\" src=\"/home/css/qq/14.gif\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('130', '2020-08-15 18:39:15', '2020-08-15 18:39:15', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/emoji/5.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('131', '2020-08-15 18:39:33', '2020-08-15 18:39:33', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/qq/32.gif\"><img class=\"emoji_icon\" src=\"/home/css/emoji/20.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('132', '2020-08-15 18:54:22', '2020-08-15 18:54:22', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/qq/14.gif\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('133', '2020-08-15 19:23:05', '2020-08-15 19:23:05', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/sina/1.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('134', '2020-08-15 19:23:13', '2020-08-15 19:23:13', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/sina/4.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('135', '2020-08-15 19:29:09', '2020-08-15 19:29:09', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/dlam/2.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('136', '2020-08-15 19:29:17', '2020-08-15 19:29:17', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/dlam/6.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('137', '2020-08-15 19:35:37', '2020-08-15 19:35:37', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/other/1.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('138', '2020-08-15 19:45:35', '2020-08-15 19:45:35', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/bird/3.png\">哈哈哈哈', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('139', '2020-08-15 19:45:49', '2020-08-15 19:45:49', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/sina/4.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('140', '2020-08-15 19:45:58', '2020-08-15 19:45:58', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/sina/19.png\">咋说呢', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('141', '2020-08-15 23:35:17', '2020-08-15 23:35:17', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/sina/19.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('142', '2020-08-15 23:35:47', '2020-08-15 23:35:47', '0', null, 'single', '无影无踪;20200815/1597475651573.jpg', '53', '<img class=\"emoji_icon\" src=\"/home/css/sina/6.png\">挺好的', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('143', '2020-08-15 23:35:57', '2020-08-15 23:35:57', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '啥呀', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('144', '2020-08-15 23:36:10', '2020-08-15 23:36:10', '0', '20200815/1597505770707.mp3', 'single', '无影无踪;20200815/1597475651573.jpg', '53', 'audio.mp3', 'audio', '1');
INSERT INTO `ylrc_msg_content` VALUES ('145', '2020-08-15 23:36:24', '2020-08-15 23:36:24', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '好听', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('146', '2020-08-15 23:36:46', '2020-08-15 23:36:46', '589943', '20200815/1597505806388.pdf', 'single', '无影无踪;20200815/1597475651573.jpg', '53', 'jpa.pdf', 'file', '1');
INSERT INTO `ylrc_msg_content` VALUES ('147', '2020-08-15 23:37:02', '2020-08-15 23:37:02', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '知识点挺好的', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('148', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/sina/4.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('149', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/sina/27.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('150', '2020-08-15 23:47:47', '2020-08-15 23:47:47', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/sina/24.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('151', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '会话', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('152', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '蛮好的', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('153', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/sina/2.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('154', '2020-08-16 13:50:42', '2020-08-16 13:50:42', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/sina/43.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('155', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '呱呱叫', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('156', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '嗯哼', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('157', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '呱呱叫', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('158', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '哈哈<img class=\"emoji_icon\" src=\"/home/css/sina/4.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('159', '2020-08-16 14:27:16', '2020-08-16 14:27:16', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', 'hi', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('160', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '<img class=\"emoji_icon\" src=\"/home/css/sina/19.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('161', '2020-08-16 14:28:05', '2020-08-16 14:28:05', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '<img class=\"emoji_icon\" src=\"/home/css/sina/23.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('162', '2020-08-16 14:28:27', '2020-08-16 14:28:27', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '54', '真的', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('163', '2020-08-16 14:28:47', '2020-08-16 14:28:47', '0', null, 'single', '无影无踪;20200815/1597475651573.jpg', '53', '<img class=\"emoji_icon\" src=\"/home/css/sina/18.png\">', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('164', '2020-08-16 14:29:59', '2020-08-16 14:29:59', '0', null, 'single', '无影无踪;20200815/1597475651573.jpg', '53', '6', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('165', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '8', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('166', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '4', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('167', '2020-08-16 14:45:17', '2020-08-16 14:45:17', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '777', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('168', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '送达后即可', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('169', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '但双方科技', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('170', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '水电费和健康好看', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('171', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '第三节课很健康', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('172', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '个', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('173', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '<img class=\"emoji_icon\" src=\"/home/css/sina/24.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('174', '2020-08-16 15:22:13', '2020-08-16 15:22:13', '0', null, 'single', '无影无踪;20200815/1597475651573.jpg', '53', '<img class=\"emoji_icon\" src=\"/home/css/sina/4.png\">', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('175', '2020-08-16 17:12:22', '2020-08-16 17:12:22', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', '<img class=\"emoji_icon\" src=\"/home/css/sina/33.png\">', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('176', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '0', null, 'group', '南昌拌粉CEO;20200729/1596027199536.png', '1', '南昌拌粉', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('177', '2020-08-16 18:17:19', '2020-08-16 18:17:19', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', '张', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('178', '2020-08-16 18:39:23', '2020-08-16 18:39:23', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '55', '南昌拌粉', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('179', '2020-08-16 18:39:37', '2020-08-16 18:39:37', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '<span style=\"color: rgb(255, 255, 255); font-size: 14px; background-color: rgb(25, 162, 153);\">南昌拌粉</span>', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('180', '2020-08-16 18:39:40', '2020-08-16 18:39:40', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', '<span style=\"color: rgb(255, 255, 255); font-size: 14px; background-color: rgb(25, 162, 153);\">南昌拌粉</span>', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('181', '2020-08-16 18:39:59', '2020-08-16 18:39:59', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '<font color=\"#ffffff\"><span style=\"font-size: 14px; background-color: rgb(25, 162, 153);\">南昌拌粉</span></font>', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('182', '2020-08-16 18:40:03', '2020-08-16 18:40:03', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '南昌拌粉', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('183', '2020-08-16 18:40:19', '2020-08-16 18:40:19', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '37', '南昌拌粉', 'text', '2');
INSERT INTO `ylrc_msg_content` VALUES ('184', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '真的是', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('185', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '0', null, 'group', '无影无踪;20200815/1597475651573.jpg', '10', '老子', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('186', '2020-08-16 18:44:12', '2020-08-16 18:44:12', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '43', '干嘛呢', 'text', '5');
INSERT INTO `ylrc_msg_content` VALUES ('187', '2020-08-16 18:44:14', '2020-08-16 18:44:14', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '43', '哈哈', 'text', '5');
INSERT INTO `ylrc_msg_content` VALUES ('188', '2020-08-16 18:44:16', '2020-08-16 18:44:16', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '43', '人呢', 'text', '5');
INSERT INTO `ylrc_msg_content` VALUES ('189', '2020-08-20 21:38:12', '2020-08-20 21:38:12', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '55', '兄弟在吗？<img class=\"emoji_icon\" src=\"/home/css/sina/1.png\">', 'text', '10');
INSERT INTO `ylrc_msg_content` VALUES ('190', '2020-08-23 20:38:03', '2020-08-23 20:38:03', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('191', '2020-08-23 20:38:03', '2020-08-23 20:38:03', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('192', '2020-08-23 20:38:04', '2020-08-23 20:38:04', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('193', '2020-08-23 20:38:04', '2020-08-23 20:38:04', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('194', '2020-08-23 20:38:26', '2020-08-23 20:38:26', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('195', '2020-08-23 20:43:50', '2020-08-23 20:43:50', '0', null, null, '南昌拌粉;20200729/1596027199536.png', '41', '您的好友【南昌拌粉】下线啦！', 'offline', '4');
INSERT INTO `ylrc_msg_content` VALUES ('196', '2020-08-23 20:44:24', '2020-08-23 20:44:24', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('197', '2020-08-23 20:47:04', '2020-08-23 20:47:04', '0', null, null, '南昌拌粉;20200729/1596027199536.png', '41', '您的好友【南昌拌粉】下线啦！', 'offline', '4');
INSERT INTO `ylrc_msg_content` VALUES ('198', '2020-08-23 20:49:45', '2020-08-23 20:49:45', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('199', '2020-08-23 20:49:50', '2020-08-23 20:49:50', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('200', '2020-08-23 20:50:02', '2020-08-23 20:50:02', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('201', '2020-08-23 20:50:39', '2020-08-23 20:50:39', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '<img class=\"emoji_icon\" src=\"/home/css/sina/16.png\">', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('202', '2020-08-23 20:50:46', '2020-08-23 20:50:46', '0', null, 'single', '南昌拌粉;20200729/1596027199536.png', '41', '干嘛呢', 'text', '4');
INSERT INTO `ylrc_msg_content` VALUES ('203', '2020-08-23 20:51:01', '2020-08-23 20:51:01', '0', '20200823/1598187061296.png', 'single', '南昌拌粉;20200729/1596027199536.png', '41', '[图片]nc_nav.png', 'img', '4');
INSERT INTO `ylrc_msg_content` VALUES ('204', '2020-08-23 20:51:12', '2020-08-23 20:51:12', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('205', '2020-08-23 20:51:44', '2020-08-23 20:51:44', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('206', '2020-08-23 20:52:23', '2020-08-23 20:52:23', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('207', '2020-08-23 20:54:03', '2020-08-23 20:54:03', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('208', '2020-08-23 20:54:22', '2020-08-23 20:54:22', '0', '20200823/1598187262531.jpg', 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '[图片]4afbfbedab64034fa3aaef20adc379310a551db4.jpg', 'img', '1');
INSERT INTO `ylrc_msg_content` VALUES ('209', '2020-08-23 20:54:37', '2020-08-23 20:54:37', '0', null, null, '南昌拌粉;20200729/1596027199536.png', '41', '您的好友【南昌拌粉】下线啦！', 'offline', '4');
INSERT INTO `ylrc_msg_content` VALUES ('210', '2020-08-23 20:55:32', '2020-08-23 20:55:32', '0', '20200823/1598187332136.jpg', 'single', '南昌拌粉;20200729/1596027199536.png', '41', '[图片]动图.jpg', 'img', '4');
INSERT INTO `ylrc_msg_content` VALUES ('211', '2020-08-23 20:57:22', '2020-08-23 20:57:22', '0', '20200823/1598187441990.jpg', 'single', 'Dr.X++ ;20200712/1594530373511.png', '42', '[图片]timg.jpg', 'img', '1');
INSERT INTO `ylrc_msg_content` VALUES ('212', '2020-08-23 20:59:10', '2020-08-23 20:59:10', '0', null, null, 'Dr.X++ ;20200712/1594530373511.png', '42', '您的好友【Dr.X++ 】下线啦！', 'offline', '1');
INSERT INTO `ylrc_msg_content` VALUES ('213', '2020-08-24 21:43:37', '2020-08-24 21:43:37', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '哈喽', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('214', '2020-08-24 21:43:39', '2020-08-24 21:43:39', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '你好呀', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('215', '2020-08-24 21:44:15', '2020-08-24 21:44:15', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '<img class=\"emoji_icon\" src=\"/home/css/sina/1.png\">', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('216', '2020-08-24 21:44:27', '2020-08-24 21:44:27', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '<img class=\"emoji_icon\" src=\"/home/css/sina/13.png\">', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('217', '2020-08-24 21:44:43', '2020-08-24 21:44:43', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '<img class=\"emoji_icon\" src=\"/home/css/sina/33.png\">需', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('218', '2020-08-24 21:45:45', '2020-08-24 21:45:45', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '<img class=\"emoji_icon\" src=\"/home/css/sina/24.png\">', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('219', '2020-08-24 21:46:36', '2020-08-24 21:46:36', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '发生的境况', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('220', '2020-08-24 21:46:36', '2020-08-24 21:46:36', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '但双方尽快', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('221', '2020-08-24 21:46:50', '2020-08-24 21:46:50', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '萨达', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('222', '2020-08-24 21:46:51', '2020-08-24 21:46:51', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', 'dsfds', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('223', '2020-08-24 21:46:53', '2020-08-24 21:46:53', '0', null, 'single', 'test;20200824/1598276557568.jpg', '56', '的所发生的', 'text', '1');
INSERT INTO `ylrc_msg_content` VALUES ('224', '2020-08-24 21:47:13', '2020-08-24 21:47:13', '0', '20200824/1598276833454.mp4', 'single', '南昌拌粉;20200729/1596027199536.png', '57', 'video.mp4', 'video', '14');
INSERT INTO `ylrc_msg_content` VALUES ('225', '2020-08-24 21:47:24', '2020-08-24 21:47:24', '0', '20200824/1598276844325.jpg', 'single', 'test;20200824/1598276557568.jpg', '56', '[图片]lisa.jpg', 'img', '1');
INSERT INTO `ylrc_msg_content` VALUES ('226', '2020-08-24 21:47:37', '2020-08-24 21:47:37', '0', '20200824/1598276857713.txt', 'single', '南昌拌粉;20200729/1596027199536.png', '57', '新建文本文档.txt', 'file', '14');
INSERT INTO `ylrc_msg_content` VALUES ('227', '2020-08-24 21:48:33', '2020-08-24 21:48:33', '0', null, 'group', 'test;20200824/1598276557568.jpg', '14', '哈喽', 'text', '5');
INSERT INTO `ylrc_msg_content` VALUES ('228', '2020-08-24 21:48:35', '2020-08-24 21:48:35', '0', null, 'group', 'test;20200824/1598276557568.jpg', '14', '有人吗', 'text', '5');
INSERT INTO `ylrc_msg_content` VALUES ('229', '2020-08-24 21:48:45', '2020-08-24 21:48:45', '0', null, 'group', '南昌拌粉;20200729/1596027199536.png', '1', '<img class=\"emoji_icon\" src=\"/home/css/sina/23.png\">', 'text', '5');

-- ----------------------------
-- Table structure for `ylrc_msg_log`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_msg_log`;
CREATE TABLE `ylrc_msg_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `status` int(11) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `msg_content_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6rxwoex9jvmwlgnacf0smwjc4` (`account_id`),
  KEY `FKm9ocgrhnlt9lljgkdy2u7uuk9` (`msg_content_id`),
  CONSTRAINT `FK6rxwoex9jvmwlgnacf0smwjc4` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`),
  CONSTRAINT `FKm9ocgrhnlt9lljgkdy2u7uuk9` FOREIGN KEY (`msg_content_id`) REFERENCES `ylrc_msg_content` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_msg_log
-- ----------------------------
INSERT INTO `ylrc_msg_log` VALUES ('39', '2020-08-05 20:51:26', '2020-08-05 20:52:00', '1', '2', '27');
INSERT INTO `ylrc_msg_log` VALUES ('40', '2020-08-05 20:51:29', '2020-08-05 20:52:00', '1', '2', '28');
INSERT INTO `ylrc_msg_log` VALUES ('41', '2020-08-05 20:51:40', '2020-08-05 20:54:12', '1', '4', '29');
INSERT INTO `ylrc_msg_log` VALUES ('42', '2020-08-05 20:51:40', '2020-08-05 20:51:40', '0', '5', '29');
INSERT INTO `ylrc_msg_log` VALUES ('43', '2020-08-05 20:51:40', '2020-08-05 20:51:40', '0', '6', '29');
INSERT INTO `ylrc_msg_log` VALUES ('44', '2020-08-05 20:51:40', '2020-08-05 20:51:40', '0', '7', '29');
INSERT INTO `ylrc_msg_log` VALUES ('45', '2020-08-05 20:51:40', '2020-08-05 20:51:40', '0', '8', '29');
INSERT INTO `ylrc_msg_log` VALUES ('46', '2020-08-05 20:51:40', '2020-08-05 20:51:40', '0', '3', '29');
INSERT INTO `ylrc_msg_log` VALUES ('47', '2020-08-05 20:51:40', '2020-08-05 20:52:00', '1', '2', '29');
INSERT INTO `ylrc_msg_log` VALUES ('48', '2020-08-05 20:51:47', '2020-08-05 20:54:12', '1', '4', '30');
INSERT INTO `ylrc_msg_log` VALUES ('49', '2020-08-05 20:51:47', '2020-08-05 20:51:47', '0', '5', '30');
INSERT INTO `ylrc_msg_log` VALUES ('50', '2020-08-05 20:51:47', '2020-08-05 20:51:47', '0', '6', '30');
INSERT INTO `ylrc_msg_log` VALUES ('51', '2020-08-05 20:51:47', '2020-08-05 20:51:47', '0', '7', '30');
INSERT INTO `ylrc_msg_log` VALUES ('52', '2020-08-05 20:51:47', '2020-08-05 20:51:47', '0', '8', '30');
INSERT INTO `ylrc_msg_log` VALUES ('53', '2020-08-05 20:51:47', '2020-08-05 20:51:47', '0', '3', '30');
INSERT INTO `ylrc_msg_log` VALUES ('54', '2020-08-05 20:51:47', '2020-08-05 20:52:00', '1', '2', '30');
INSERT INTO `ylrc_msg_log` VALUES ('55', '2020-08-05 20:52:10', '2020-08-05 20:52:10', '1', '1', '31');
INSERT INTO `ylrc_msg_log` VALUES ('56', '2020-08-05 20:52:12', '2020-08-05 20:52:12', '1', '1', '32');
INSERT INTO `ylrc_msg_log` VALUES ('57', '2020-08-05 20:52:30', '2020-08-05 20:54:12', '1', '4', '33');
INSERT INTO `ylrc_msg_log` VALUES ('58', '2020-08-05 20:52:30', '2020-08-05 20:52:30', '0', '5', '33');
INSERT INTO `ylrc_msg_log` VALUES ('59', '2020-08-05 20:52:30', '2020-08-05 20:52:30', '0', '6', '33');
INSERT INTO `ylrc_msg_log` VALUES ('60', '2020-08-05 20:52:30', '2020-08-05 20:52:30', '0', '7', '33');
INSERT INTO `ylrc_msg_log` VALUES ('61', '2020-08-05 20:52:30', '2020-08-05 20:52:30', '0', '8', '33');
INSERT INTO `ylrc_msg_log` VALUES ('62', '2020-08-05 20:52:30', '2020-08-05 20:52:30', '0', '3', '33');
INSERT INTO `ylrc_msg_log` VALUES ('63', '2020-08-05 20:52:30', '2020-08-05 20:52:30', '1', '2', '33');
INSERT INTO `ylrc_msg_log` VALUES ('64', '2020-08-05 20:52:40', '2020-08-05 20:52:40', '1', '2', '34');
INSERT INTO `ylrc_msg_log` VALUES ('65', '2020-08-05 20:52:44', '2020-08-05 20:52:44', '1', '2', '35');
INSERT INTO `ylrc_msg_log` VALUES ('66', '2020-08-05 20:52:47', '2020-08-05 20:52:47', '1', '1', '36');
INSERT INTO `ylrc_msg_log` VALUES ('67', '2020-08-05 20:52:48', '2020-08-05 20:52:48', '1', '1', '37');
INSERT INTO `ylrc_msg_log` VALUES ('68', '2020-08-05 20:52:54', '2020-08-05 20:52:54', '1', '1', '38');
INSERT INTO `ylrc_msg_log` VALUES ('69', '2020-08-05 20:52:54', '2020-08-05 20:54:12', '1', '4', '38');
INSERT INTO `ylrc_msg_log` VALUES ('70', '2020-08-05 20:52:54', '2020-08-05 20:52:54', '0', '5', '38');
INSERT INTO `ylrc_msg_log` VALUES ('71', '2020-08-05 20:52:54', '2020-08-05 20:52:54', '0', '6', '38');
INSERT INTO `ylrc_msg_log` VALUES ('72', '2020-08-05 20:52:54', '2020-08-05 20:52:54', '0', '7', '38');
INSERT INTO `ylrc_msg_log` VALUES ('73', '2020-08-05 20:52:54', '2020-08-05 20:52:54', '0', '8', '38');
INSERT INTO `ylrc_msg_log` VALUES ('74', '2020-08-05 20:52:54', '2020-08-05 20:52:54', '0', '3', '38');
INSERT INTO `ylrc_msg_log` VALUES ('75', '2020-08-05 20:52:56', '2020-08-05 20:52:56', '1', '1', '39');
INSERT INTO `ylrc_msg_log` VALUES ('76', '2020-08-05 20:52:56', '2020-08-05 20:54:12', '1', '4', '39');
INSERT INTO `ylrc_msg_log` VALUES ('77', '2020-08-05 20:52:56', '2020-08-05 20:52:56', '0', '5', '39');
INSERT INTO `ylrc_msg_log` VALUES ('78', '2020-08-05 20:52:56', '2020-08-05 20:52:56', '0', '6', '39');
INSERT INTO `ylrc_msg_log` VALUES ('79', '2020-08-05 20:52:56', '2020-08-05 20:52:56', '0', '7', '39');
INSERT INTO `ylrc_msg_log` VALUES ('80', '2020-08-05 20:52:56', '2020-08-05 20:52:56', '0', '8', '39');
INSERT INTO `ylrc_msg_log` VALUES ('81', '2020-08-05 20:52:56', '2020-08-05 20:52:56', '0', '3', '39');
INSERT INTO `ylrc_msg_log` VALUES ('82', '2020-08-05 20:53:14', '2020-08-05 20:53:14', '1', '1', '40');
INSERT INTO `ylrc_msg_log` VALUES ('83', '2020-08-05 20:53:14', '2020-08-05 20:54:12', '1', '4', '40');
INSERT INTO `ylrc_msg_log` VALUES ('84', '2020-08-05 20:53:14', '2020-08-05 20:53:14', '0', '5', '40');
INSERT INTO `ylrc_msg_log` VALUES ('85', '2020-08-05 20:53:14', '2020-08-05 20:53:14', '0', '6', '40');
INSERT INTO `ylrc_msg_log` VALUES ('86', '2020-08-05 20:53:14', '2020-08-05 20:53:14', '0', '7', '40');
INSERT INTO `ylrc_msg_log` VALUES ('87', '2020-08-05 20:53:14', '2020-08-05 20:53:14', '0', '8', '40');
INSERT INTO `ylrc_msg_log` VALUES ('88', '2020-08-05 20:53:14', '2020-08-05 20:53:14', '0', '3', '40');
INSERT INTO `ylrc_msg_log` VALUES ('89', '2020-08-05 20:53:38', '2020-08-05 20:54:12', '1', '4', '41');
INSERT INTO `ylrc_msg_log` VALUES ('90', '2020-08-05 20:53:38', '2020-08-05 20:53:38', '0', '5', '41');
INSERT INTO `ylrc_msg_log` VALUES ('91', '2020-08-05 20:53:38', '2020-08-05 20:53:38', '0', '6', '41');
INSERT INTO `ylrc_msg_log` VALUES ('92', '2020-08-05 20:53:38', '2020-08-05 20:53:38', '0', '7', '41');
INSERT INTO `ylrc_msg_log` VALUES ('93', '2020-08-05 20:53:38', '2020-08-05 20:53:38', '0', '8', '41');
INSERT INTO `ylrc_msg_log` VALUES ('94', '2020-08-05 20:53:38', '2020-08-05 20:53:38', '0', '3', '41');
INSERT INTO `ylrc_msg_log` VALUES ('95', '2020-08-05 20:53:38', '2020-08-05 20:53:38', '1', '2', '41');
INSERT INTO `ylrc_msg_log` VALUES ('96', '2020-08-05 20:54:32', '2020-08-05 20:54:32', '1', '1', '42');
INSERT INTO `ylrc_msg_log` VALUES ('97', '2020-08-05 20:54:32', '2020-08-05 20:54:32', '0', '5', '42');
INSERT INTO `ylrc_msg_log` VALUES ('98', '2020-08-05 20:54:32', '2020-08-05 20:54:32', '0', '6', '42');
INSERT INTO `ylrc_msg_log` VALUES ('99', '2020-08-05 20:54:32', '2020-08-05 20:54:32', '0', '7', '42');
INSERT INTO `ylrc_msg_log` VALUES ('100', '2020-08-05 20:54:32', '2020-08-05 20:54:32', '0', '8', '42');
INSERT INTO `ylrc_msg_log` VALUES ('101', '2020-08-05 20:54:32', '2020-08-05 20:54:32', '0', '3', '42');
INSERT INTO `ylrc_msg_log` VALUES ('102', '2020-08-05 20:54:32', '2020-08-05 20:54:32', '1', '2', '42');
INSERT INTO `ylrc_msg_log` VALUES ('103', '2020-08-05 20:54:36', '2020-08-05 20:54:36', '1', '1', '43');
INSERT INTO `ylrc_msg_log` VALUES ('104', '2020-08-05 20:54:36', '2020-08-05 20:54:36', '0', '5', '43');
INSERT INTO `ylrc_msg_log` VALUES ('105', '2020-08-05 20:54:36', '2020-08-05 20:54:36', '0', '6', '43');
INSERT INTO `ylrc_msg_log` VALUES ('106', '2020-08-05 20:54:36', '2020-08-05 20:54:36', '0', '7', '43');
INSERT INTO `ylrc_msg_log` VALUES ('107', '2020-08-05 20:54:36', '2020-08-05 20:54:36', '0', '8', '43');
INSERT INTO `ylrc_msg_log` VALUES ('108', '2020-08-05 20:54:36', '2020-08-05 20:54:36', '0', '3', '43');
INSERT INTO `ylrc_msg_log` VALUES ('109', '2020-08-05 20:54:36', '2020-08-05 20:54:36', '1', '2', '43');
INSERT INTO `ylrc_msg_log` VALUES ('110', '2020-08-05 20:54:42', '2020-08-05 20:54:42', '1', '1', '44');
INSERT INTO `ylrc_msg_log` VALUES ('111', '2020-08-05 20:54:42', '2020-08-05 20:54:42', '0', '5', '44');
INSERT INTO `ylrc_msg_log` VALUES ('112', '2020-08-05 20:54:42', '2020-08-05 20:54:42', '0', '6', '44');
INSERT INTO `ylrc_msg_log` VALUES ('113', '2020-08-05 20:54:42', '2020-08-05 20:54:42', '0', '7', '44');
INSERT INTO `ylrc_msg_log` VALUES ('114', '2020-08-05 20:54:42', '2020-08-05 20:54:42', '0', '8', '44');
INSERT INTO `ylrc_msg_log` VALUES ('115', '2020-08-05 20:54:42', '2020-08-05 20:54:42', '0', '3', '44');
INSERT INTO `ylrc_msg_log` VALUES ('116', '2020-08-05 20:54:42', '2020-08-05 20:54:42', '1', '2', '44');
INSERT INTO `ylrc_msg_log` VALUES ('117', '2020-08-05 20:54:53', '2020-08-05 20:54:53', '1', '1', '45');
INSERT INTO `ylrc_msg_log` VALUES ('118', '2020-08-05 20:54:53', '2020-08-05 20:54:53', '1', '4', '45');
INSERT INTO `ylrc_msg_log` VALUES ('119', '2020-08-05 20:54:53', '2020-08-05 20:54:53', '0', '5', '45');
INSERT INTO `ylrc_msg_log` VALUES ('120', '2020-08-05 20:54:53', '2020-08-05 20:54:53', '0', '6', '45');
INSERT INTO `ylrc_msg_log` VALUES ('121', '2020-08-05 20:54:53', '2020-08-05 20:54:53', '0', '7', '45');
INSERT INTO `ylrc_msg_log` VALUES ('122', '2020-08-05 20:54:53', '2020-08-05 20:54:53', '0', '8', '45');
INSERT INTO `ylrc_msg_log` VALUES ('123', '2020-08-05 20:54:53', '2020-08-05 20:54:53', '0', '3', '45');
INSERT INTO `ylrc_msg_log` VALUES ('124', '2020-08-05 20:55:07', '2020-08-05 20:55:07', '1', '1', '46');
INSERT INTO `ylrc_msg_log` VALUES ('125', '2020-08-05 20:55:09', '2020-08-05 20:55:09', '1', '1', '47');
INSERT INTO `ylrc_msg_log` VALUES ('126', '2020-08-05 20:55:14', '2020-08-05 20:55:14', '1', '4', '48');
INSERT INTO `ylrc_msg_log` VALUES ('127', '2020-08-05 20:55:15', '2020-08-05 20:55:15', '1', '4', '49');
INSERT INTO `ylrc_msg_log` VALUES ('128', '2020-08-05 20:56:46', '2020-08-05 20:56:46', '1', '1', '50');
INSERT INTO `ylrc_msg_log` VALUES ('129', '2020-08-05 20:59:08', '2020-08-05 20:59:08', '1', '4', '51');
INSERT INTO `ylrc_msg_log` VALUES ('130', '2020-08-05 20:59:20', '2020-08-05 20:59:20', '1', '1', '52');
INSERT INTO `ylrc_msg_log` VALUES ('131', '2020-08-05 20:59:20', '2020-08-05 20:59:20', '1', '4', '52');
INSERT INTO `ylrc_msg_log` VALUES ('132', '2020-08-05 20:59:20', '2020-08-05 20:59:20', '0', '5', '52');
INSERT INTO `ylrc_msg_log` VALUES ('133', '2020-08-05 20:59:20', '2020-08-05 20:59:20', '0', '6', '52');
INSERT INTO `ylrc_msg_log` VALUES ('134', '2020-08-05 20:59:20', '2020-08-05 20:59:20', '0', '7', '52');
INSERT INTO `ylrc_msg_log` VALUES ('135', '2020-08-05 20:59:20', '2020-08-05 20:59:20', '0', '8', '52');
INSERT INTO `ylrc_msg_log` VALUES ('136', '2020-08-05 20:59:20', '2020-08-05 20:59:20', '0', '3', '52');
INSERT INTO `ylrc_msg_log` VALUES ('137', '2020-08-05 21:00:23', '2020-08-05 21:00:23', '1', '4', '53');
INSERT INTO `ylrc_msg_log` VALUES ('138', '2020-08-05 21:00:23', '2020-08-05 21:00:23', '0', '5', '53');
INSERT INTO `ylrc_msg_log` VALUES ('139', '2020-08-05 21:00:23', '2020-08-05 21:00:23', '0', '6', '53');
INSERT INTO `ylrc_msg_log` VALUES ('140', '2020-08-05 21:00:23', '2020-08-05 21:00:23', '0', '7', '53');
INSERT INTO `ylrc_msg_log` VALUES ('141', '2020-08-05 21:00:23', '2020-08-05 21:00:23', '0', '8', '53');
INSERT INTO `ylrc_msg_log` VALUES ('142', '2020-08-05 21:00:23', '2020-08-05 21:00:23', '0', '3', '53');
INSERT INTO `ylrc_msg_log` VALUES ('143', '2020-08-05 21:00:50', '2020-08-05 21:00:50', '1', '1', '54');
INSERT INTO `ylrc_msg_log` VALUES ('144', '2020-08-05 21:00:50', '2020-08-05 21:00:50', '0', '5', '54');
INSERT INTO `ylrc_msg_log` VALUES ('145', '2020-08-05 21:00:50', '2020-08-05 21:00:50', '0', '6', '54');
INSERT INTO `ylrc_msg_log` VALUES ('146', '2020-08-05 21:00:50', '2020-08-05 21:00:50', '0', '7', '54');
INSERT INTO `ylrc_msg_log` VALUES ('147', '2020-08-05 21:00:50', '2020-08-05 21:00:50', '0', '8', '54');
INSERT INTO `ylrc_msg_log` VALUES ('148', '2020-08-05 21:00:50', '2020-08-05 21:00:50', '0', '3', '54');
INSERT INTO `ylrc_msg_log` VALUES ('149', '2020-08-05 21:01:13', '2020-08-05 21:01:13', '1', '4', '55');
INSERT INTO `ylrc_msg_log` VALUES ('150', '2020-08-05 21:01:13', '2020-08-05 21:01:13', '0', '5', '55');
INSERT INTO `ylrc_msg_log` VALUES ('151', '2020-08-05 21:01:13', '2020-08-05 21:01:13', '0', '6', '55');
INSERT INTO `ylrc_msg_log` VALUES ('152', '2020-08-05 21:01:13', '2020-08-05 21:01:13', '0', '7', '55');
INSERT INTO `ylrc_msg_log` VALUES ('153', '2020-08-05 21:01:13', '2020-08-05 21:01:13', '0', '8', '55');
INSERT INTO `ylrc_msg_log` VALUES ('154', '2020-08-05 21:01:13', '2020-08-05 21:01:13', '0', '3', '55');
INSERT INTO `ylrc_msg_log` VALUES ('155', '2020-08-05 21:01:13', '2020-08-05 21:01:13', '1', '2', '55');
INSERT INTO `ylrc_msg_log` VALUES ('156', '2020-08-05 21:10:31', '2020-08-05 21:10:31', '1', '1', '56');
INSERT INTO `ylrc_msg_log` VALUES ('157', '2020-08-05 21:10:31', '2020-08-05 21:10:31', '0', '5', '56');
INSERT INTO `ylrc_msg_log` VALUES ('158', '2020-08-05 21:10:31', '2020-08-05 21:10:31', '0', '6', '56');
INSERT INTO `ylrc_msg_log` VALUES ('159', '2020-08-05 21:10:31', '2020-08-05 21:10:31', '0', '7', '56');
INSERT INTO `ylrc_msg_log` VALUES ('160', '2020-08-05 21:10:31', '2020-08-05 21:10:31', '0', '8', '56');
INSERT INTO `ylrc_msg_log` VALUES ('161', '2020-08-05 21:10:31', '2020-08-05 21:10:31', '0', '3', '56');
INSERT INTO `ylrc_msg_log` VALUES ('162', '2020-08-05 21:10:31', '2020-08-05 21:10:31', '1', '2', '56');
INSERT INTO `ylrc_msg_log` VALUES ('163', '2020-08-05 21:10:52', '2020-08-05 21:10:52', '1', '1', '57');
INSERT INTO `ylrc_msg_log` VALUES ('164', '2020-08-05 21:10:52', '2020-08-05 21:10:52', '1', '4', '57');
INSERT INTO `ylrc_msg_log` VALUES ('165', '2020-08-05 21:10:52', '2020-08-05 21:10:52', '0', '5', '57');
INSERT INTO `ylrc_msg_log` VALUES ('166', '2020-08-05 21:10:52', '2020-08-05 21:10:52', '0', '6', '57');
INSERT INTO `ylrc_msg_log` VALUES ('167', '2020-08-05 21:10:52', '2020-08-05 21:10:52', '0', '7', '57');
INSERT INTO `ylrc_msg_log` VALUES ('168', '2020-08-05 21:10:52', '2020-08-05 21:10:52', '0', '8', '57');
INSERT INTO `ylrc_msg_log` VALUES ('169', '2020-08-05 21:10:52', '2020-08-05 21:10:52', '0', '3', '57');
INSERT INTO `ylrc_msg_log` VALUES ('170', '2020-08-05 21:11:27', '2020-08-05 21:11:27', '1', '1', '58');
INSERT INTO `ylrc_msg_log` VALUES ('171', '2020-08-05 21:11:27', '2020-08-05 21:11:27', '1', '4', '58');
INSERT INTO `ylrc_msg_log` VALUES ('172', '2020-08-05 21:11:27', '2020-08-05 21:11:27', '0', '5', '58');
INSERT INTO `ylrc_msg_log` VALUES ('173', '2020-08-05 21:11:27', '2020-08-05 21:11:27', '0', '6', '58');
INSERT INTO `ylrc_msg_log` VALUES ('174', '2020-08-05 21:11:27', '2020-08-05 21:11:27', '0', '7', '58');
INSERT INTO `ylrc_msg_log` VALUES ('175', '2020-08-05 21:11:27', '2020-08-05 21:11:27', '0', '8', '58');
INSERT INTO `ylrc_msg_log` VALUES ('176', '2020-08-05 21:11:27', '2020-08-05 21:11:27', '0', '3', '58');
INSERT INTO `ylrc_msg_log` VALUES ('177', '2020-08-05 21:11:36', '2020-08-05 21:11:36', '1', '1', '59');
INSERT INTO `ylrc_msg_log` VALUES ('178', '2020-08-05 21:11:36', '2020-08-05 21:11:36', '0', '5', '59');
INSERT INTO `ylrc_msg_log` VALUES ('179', '2020-08-05 21:11:36', '2020-08-05 21:11:36', '0', '6', '59');
INSERT INTO `ylrc_msg_log` VALUES ('180', '2020-08-05 21:11:36', '2020-08-05 21:11:36', '0', '7', '59');
INSERT INTO `ylrc_msg_log` VALUES ('181', '2020-08-05 21:11:36', '2020-08-05 21:11:36', '0', '8', '59');
INSERT INTO `ylrc_msg_log` VALUES ('182', '2020-08-05 21:11:36', '2020-08-05 21:11:36', '0', '3', '59');
INSERT INTO `ylrc_msg_log` VALUES ('183', '2020-08-05 21:11:36', '2020-08-05 21:11:36', '1', '2', '59');
INSERT INTO `ylrc_msg_log` VALUES ('184', '2020-08-05 21:11:44', '2020-08-05 21:11:44', '1', '4', '60');
INSERT INTO `ylrc_msg_log` VALUES ('185', '2020-08-05 21:11:44', '2020-08-05 21:11:44', '0', '5', '60');
INSERT INTO `ylrc_msg_log` VALUES ('186', '2020-08-05 21:11:44', '2020-08-05 21:11:44', '0', '6', '60');
INSERT INTO `ylrc_msg_log` VALUES ('187', '2020-08-05 21:11:44', '2020-08-05 21:11:44', '0', '7', '60');
INSERT INTO `ylrc_msg_log` VALUES ('188', '2020-08-05 21:11:44', '2020-08-05 21:11:44', '0', '8', '60');
INSERT INTO `ylrc_msg_log` VALUES ('189', '2020-08-05 21:11:44', '2020-08-05 21:11:44', '0', '3', '60');
INSERT INTO `ylrc_msg_log` VALUES ('190', '2020-08-05 21:11:44', '2020-08-05 21:11:44', '1', '2', '60');
INSERT INTO `ylrc_msg_log` VALUES ('191', '2020-08-05 21:11:48', '2020-08-05 21:11:48', '1', '4', '61');
INSERT INTO `ylrc_msg_log` VALUES ('192', '2020-08-05 21:11:48', '2020-08-05 21:11:48', '0', '5', '61');
INSERT INTO `ylrc_msg_log` VALUES ('193', '2020-08-05 21:11:48', '2020-08-05 21:11:48', '0', '6', '61');
INSERT INTO `ylrc_msg_log` VALUES ('194', '2020-08-05 21:11:48', '2020-08-05 21:11:48', '0', '7', '61');
INSERT INTO `ylrc_msg_log` VALUES ('195', '2020-08-05 21:11:48', '2020-08-05 21:11:48', '0', '8', '61');
INSERT INTO `ylrc_msg_log` VALUES ('196', '2020-08-05 21:11:48', '2020-08-05 21:11:48', '0', '3', '61');
INSERT INTO `ylrc_msg_log` VALUES ('197', '2020-08-05 21:11:48', '2020-08-05 21:11:48', '1', '2', '61');
INSERT INTO `ylrc_msg_log` VALUES ('198', '2020-08-05 21:12:50', '2020-08-05 21:12:50', '1', '1', '62');
INSERT INTO `ylrc_msg_log` VALUES ('199', '2020-08-05 21:12:50', '2020-08-05 21:12:50', '0', '5', '62');
INSERT INTO `ylrc_msg_log` VALUES ('200', '2020-08-05 21:12:50', '2020-08-05 21:12:50', '0', '6', '62');
INSERT INTO `ylrc_msg_log` VALUES ('201', '2020-08-05 21:12:50', '2020-08-05 21:12:50', '0', '7', '62');
INSERT INTO `ylrc_msg_log` VALUES ('202', '2020-08-05 21:12:50', '2020-08-05 21:12:50', '0', '8', '62');
INSERT INTO `ylrc_msg_log` VALUES ('203', '2020-08-05 21:12:50', '2020-08-05 21:12:50', '0', '3', '62');
INSERT INTO `ylrc_msg_log` VALUES ('204', '2020-08-05 21:12:50', '2020-08-05 21:12:50', '1', '2', '62');
INSERT INTO `ylrc_msg_log` VALUES ('205', '2020-08-05 21:13:15', '2020-08-05 21:13:15', '1', '1', '63');
INSERT INTO `ylrc_msg_log` VALUES ('206', '2020-08-05 21:13:15', '2020-08-05 21:13:15', '1', '4', '63');
INSERT INTO `ylrc_msg_log` VALUES ('207', '2020-08-05 21:13:15', '2020-08-05 21:13:15', '0', '5', '63');
INSERT INTO `ylrc_msg_log` VALUES ('208', '2020-08-05 21:13:15', '2020-08-05 21:13:15', '0', '6', '63');
INSERT INTO `ylrc_msg_log` VALUES ('209', '2020-08-05 21:13:15', '2020-08-05 21:13:15', '0', '7', '63');
INSERT INTO `ylrc_msg_log` VALUES ('210', '2020-08-05 21:13:15', '2020-08-05 21:13:15', '0', '8', '63');
INSERT INTO `ylrc_msg_log` VALUES ('211', '2020-08-05 21:13:15', '2020-08-05 21:13:15', '0', '3', '63');
INSERT INTO `ylrc_msg_log` VALUES ('212', '2020-08-05 21:26:18', '2020-08-05 21:26:18', '1', '1', '64');
INSERT INTO `ylrc_msg_log` VALUES ('213', '2020-08-05 21:31:26', '2020-08-05 21:31:26', '1', '4', '65');
INSERT INTO `ylrc_msg_log` VALUES ('214', '2020-08-05 21:31:26', '2020-08-05 21:31:26', '0', '5', '65');
INSERT INTO `ylrc_msg_log` VALUES ('215', '2020-08-05 21:31:26', '2020-08-05 21:31:26', '0', '6', '65');
INSERT INTO `ylrc_msg_log` VALUES ('216', '2020-08-05 21:31:26', '2020-08-05 21:31:26', '0', '7', '65');
INSERT INTO `ylrc_msg_log` VALUES ('217', '2020-08-05 21:31:26', '2020-08-05 21:31:26', '0', '8', '65');
INSERT INTO `ylrc_msg_log` VALUES ('218', '2020-08-05 21:31:26', '2020-08-05 21:31:26', '0', '3', '65');
INSERT INTO `ylrc_msg_log` VALUES ('219', '2020-08-05 21:31:26', '2020-08-05 21:31:26', '1', '2', '65');
INSERT INTO `ylrc_msg_log` VALUES ('220', '2020-08-05 21:31:35', '2020-08-05 21:31:35', '1', '1', '66');
INSERT INTO `ylrc_msg_log` VALUES ('221', '2020-08-05 21:31:51', '2020-08-05 21:31:51', '1', '1', '67');
INSERT INTO `ylrc_msg_log` VALUES ('222', '2020-08-05 21:33:19', '2020-08-05 21:33:19', '1', '1', '68');
INSERT INTO `ylrc_msg_log` VALUES ('223', '2020-08-05 21:33:55', '2020-08-05 21:33:55', '1', '1', '69');
INSERT INTO `ylrc_msg_log` VALUES ('224', '2020-08-05 21:34:24', '2020-08-05 21:34:24', '1', '4', '70');
INSERT INTO `ylrc_msg_log` VALUES ('225', '2020-08-05 21:34:28', '2020-08-05 21:34:28', '1', '1', '71');
INSERT INTO `ylrc_msg_log` VALUES ('226', '2020-08-05 21:34:38', '2020-08-05 21:34:38', '1', '4', '72');
INSERT INTO `ylrc_msg_log` VALUES ('227', '2020-08-05 21:34:42', '2020-08-05 21:34:42', '1', '1', '73');
INSERT INTO `ylrc_msg_log` VALUES ('228', '2020-08-05 21:34:48', '2020-08-05 21:34:48', '1', '1', '74');
INSERT INTO `ylrc_msg_log` VALUES ('229', '2020-08-05 21:35:04', '2020-08-05 21:35:04', '1', '4', '75');
INSERT INTO `ylrc_msg_log` VALUES ('230', '2020-08-05 21:35:10', '2020-08-05 21:35:10', '1', '1', '76');
INSERT INTO `ylrc_msg_log` VALUES ('231', '2020-08-05 21:35:10', '2020-08-05 21:35:10', '0', '5', '76');
INSERT INTO `ylrc_msg_log` VALUES ('232', '2020-08-05 21:35:10', '2020-08-05 21:35:10', '0', '6', '76');
INSERT INTO `ylrc_msg_log` VALUES ('233', '2020-08-05 21:35:10', '2020-08-05 21:35:10', '0', '7', '76');
INSERT INTO `ylrc_msg_log` VALUES ('234', '2020-08-05 21:35:10', '2020-08-05 21:35:10', '0', '8', '76');
INSERT INTO `ylrc_msg_log` VALUES ('235', '2020-08-05 21:35:10', '2020-08-05 21:35:10', '0', '3', '76');
INSERT INTO `ylrc_msg_log` VALUES ('236', '2020-08-05 21:35:10', '2020-08-05 21:35:10', '1', '2', '76');
INSERT INTO `ylrc_msg_log` VALUES ('237', '2020-08-05 21:36:01', '2020-08-05 21:36:01', '1', '1', '77');
INSERT INTO `ylrc_msg_log` VALUES ('238', '2020-08-05 21:36:01', '2020-08-05 21:36:01', '0', '5', '77');
INSERT INTO `ylrc_msg_log` VALUES ('239', '2020-08-05 21:36:01', '2020-08-05 21:36:01', '0', '6', '77');
INSERT INTO `ylrc_msg_log` VALUES ('240', '2020-08-05 21:36:02', '2020-08-05 21:36:02', '0', '7', '77');
INSERT INTO `ylrc_msg_log` VALUES ('241', '2020-08-05 21:36:02', '2020-08-05 21:36:02', '0', '8', '77');
INSERT INTO `ylrc_msg_log` VALUES ('242', '2020-08-05 21:36:02', '2020-08-05 21:36:02', '0', '3', '77');
INSERT INTO `ylrc_msg_log` VALUES ('243', '2020-08-05 21:36:02', '2020-08-05 21:36:02', '1', '2', '77');
INSERT INTO `ylrc_msg_log` VALUES ('244', '2020-08-05 21:38:44', '2020-08-05 21:38:44', '1', '1', '78');
INSERT INTO `ylrc_msg_log` VALUES ('245', '2020-08-05 21:38:44', '2020-08-05 21:38:44', '0', '5', '78');
INSERT INTO `ylrc_msg_log` VALUES ('246', '2020-08-05 21:38:44', '2020-08-05 21:38:44', '0', '6', '78');
INSERT INTO `ylrc_msg_log` VALUES ('247', '2020-08-05 21:38:44', '2020-08-05 21:38:44', '0', '7', '78');
INSERT INTO `ylrc_msg_log` VALUES ('248', '2020-08-05 21:38:44', '2020-08-05 21:38:44', '0', '8', '78');
INSERT INTO `ylrc_msg_log` VALUES ('249', '2020-08-05 21:38:44', '2020-08-05 21:38:44', '0', '3', '78');
INSERT INTO `ylrc_msg_log` VALUES ('250', '2020-08-05 21:38:44', '2020-08-05 21:38:44', '1', '2', '78');
INSERT INTO `ylrc_msg_log` VALUES ('251', '2020-08-05 21:39:42', '2020-08-05 21:39:42', '1', '1', '79');
INSERT INTO `ylrc_msg_log` VALUES ('252', '2020-08-05 21:39:42', '2020-08-05 21:39:42', '1', '4', '79');
INSERT INTO `ylrc_msg_log` VALUES ('253', '2020-08-05 21:39:42', '2020-08-05 21:39:42', '0', '5', '79');
INSERT INTO `ylrc_msg_log` VALUES ('254', '2020-08-05 21:39:42', '2020-08-05 21:39:42', '0', '6', '79');
INSERT INTO `ylrc_msg_log` VALUES ('255', '2020-08-05 21:39:42', '2020-08-05 21:39:42', '0', '7', '79');
INSERT INTO `ylrc_msg_log` VALUES ('256', '2020-08-05 21:39:42', '2020-08-05 21:39:42', '0', '8', '79');
INSERT INTO `ylrc_msg_log` VALUES ('257', '2020-08-05 21:39:42', '2020-08-05 21:39:42', '0', '3', '79');
INSERT INTO `ylrc_msg_log` VALUES ('258', '2020-08-05 21:41:18', '2020-08-05 21:41:18', '1', '1', '80');
INSERT INTO `ylrc_msg_log` VALUES ('259', '2020-08-05 21:41:18', '2020-08-05 21:41:18', '0', '5', '80');
INSERT INTO `ylrc_msg_log` VALUES ('260', '2020-08-05 21:41:18', '2020-08-05 21:41:18', '0', '6', '80');
INSERT INTO `ylrc_msg_log` VALUES ('261', '2020-08-05 21:41:18', '2020-08-05 21:41:18', '0', '7', '80');
INSERT INTO `ylrc_msg_log` VALUES ('262', '2020-08-05 21:41:18', '2020-08-05 21:41:18', '0', '8', '80');
INSERT INTO `ylrc_msg_log` VALUES ('263', '2020-08-05 21:41:18', '2020-08-05 21:41:18', '0', '3', '80');
INSERT INTO `ylrc_msg_log` VALUES ('264', '2020-08-05 21:41:18', '2020-08-05 21:41:18', '1', '2', '80');
INSERT INTO `ylrc_msg_log` VALUES ('265', '2020-08-05 21:41:26', '2020-08-05 21:41:26', '1', '1', '81');
INSERT INTO `ylrc_msg_log` VALUES ('266', '2020-08-05 21:41:26', '2020-08-05 21:41:26', '1', '4', '81');
INSERT INTO `ylrc_msg_log` VALUES ('267', '2020-08-05 21:41:26', '2020-08-05 21:41:26', '0', '5', '81');
INSERT INTO `ylrc_msg_log` VALUES ('268', '2020-08-05 21:41:26', '2020-08-05 21:41:26', '0', '6', '81');
INSERT INTO `ylrc_msg_log` VALUES ('269', '2020-08-05 21:41:26', '2020-08-05 21:41:26', '0', '7', '81');
INSERT INTO `ylrc_msg_log` VALUES ('270', '2020-08-05 21:41:26', '2020-08-05 21:41:26', '0', '8', '81');
INSERT INTO `ylrc_msg_log` VALUES ('271', '2020-08-05 21:41:26', '2020-08-05 21:41:26', '0', '3', '81');
INSERT INTO `ylrc_msg_log` VALUES ('272', '2020-08-05 21:42:28', '2020-08-05 21:42:28', '1', '1', '82');
INSERT INTO `ylrc_msg_log` VALUES ('273', '2020-08-05 21:42:28', '2020-08-05 21:42:28', '0', '5', '82');
INSERT INTO `ylrc_msg_log` VALUES ('274', '2020-08-05 21:42:28', '2020-08-05 21:42:28', '0', '6', '82');
INSERT INTO `ylrc_msg_log` VALUES ('275', '2020-08-05 21:42:28', '2020-08-05 21:42:28', '0', '7', '82');
INSERT INTO `ylrc_msg_log` VALUES ('276', '2020-08-05 21:42:28', '2020-08-05 21:42:28', '0', '8', '82');
INSERT INTO `ylrc_msg_log` VALUES ('277', '2020-08-05 21:42:28', '2020-08-05 21:42:28', '0', '3', '82');
INSERT INTO `ylrc_msg_log` VALUES ('278', '2020-08-05 21:42:28', '2020-08-05 21:42:28', '1', '2', '82');
INSERT INTO `ylrc_msg_log` VALUES ('279', '2020-08-05 21:42:42', '2020-08-05 21:42:42', '1', '1', '83');
INSERT INTO `ylrc_msg_log` VALUES ('280', '2020-08-05 21:42:42', '2020-08-05 21:42:42', '1', '4', '83');
INSERT INTO `ylrc_msg_log` VALUES ('281', '2020-08-05 21:42:42', '2020-08-05 21:42:42', '0', '5', '83');
INSERT INTO `ylrc_msg_log` VALUES ('282', '2020-08-05 21:42:42', '2020-08-05 21:42:42', '0', '6', '83');
INSERT INTO `ylrc_msg_log` VALUES ('283', '2020-08-05 21:42:42', '2020-08-05 21:42:42', '0', '7', '83');
INSERT INTO `ylrc_msg_log` VALUES ('284', '2020-08-05 21:42:42', '2020-08-05 21:42:42', '0', '8', '83');
INSERT INTO `ylrc_msg_log` VALUES ('285', '2020-08-05 21:42:42', '2020-08-05 21:42:42', '0', '3', '83');
INSERT INTO `ylrc_msg_log` VALUES ('286', '2020-08-05 21:44:39', '2020-08-05 21:44:39', '1', '1', '84');
INSERT INTO `ylrc_msg_log` VALUES ('287', '2020-08-05 21:44:39', '2020-08-05 21:44:39', '0', '5', '84');
INSERT INTO `ylrc_msg_log` VALUES ('288', '2020-08-05 21:44:39', '2020-08-05 21:44:39', '0', '6', '84');
INSERT INTO `ylrc_msg_log` VALUES ('289', '2020-08-05 21:44:39', '2020-08-05 21:44:39', '0', '7', '84');
INSERT INTO `ylrc_msg_log` VALUES ('290', '2020-08-05 21:44:39', '2020-08-05 21:44:39', '0', '8', '84');
INSERT INTO `ylrc_msg_log` VALUES ('291', '2020-08-05 21:44:39', '2020-08-05 21:44:39', '0', '3', '84');
INSERT INTO `ylrc_msg_log` VALUES ('292', '2020-08-05 21:44:39', '2020-08-05 21:44:39', '1', '2', '84');
INSERT INTO `ylrc_msg_log` VALUES ('293', '2020-08-05 21:44:50', '2020-08-05 21:44:50', '1', '1', '85');
INSERT INTO `ylrc_msg_log` VALUES ('294', '2020-08-05 21:44:50', '2020-08-05 21:44:50', '1', '4', '85');
INSERT INTO `ylrc_msg_log` VALUES ('295', '2020-08-05 21:44:50', '2020-08-05 21:44:50', '0', '5', '85');
INSERT INTO `ylrc_msg_log` VALUES ('296', '2020-08-05 21:44:50', '2020-08-05 21:44:50', '0', '6', '85');
INSERT INTO `ylrc_msg_log` VALUES ('297', '2020-08-05 21:44:50', '2020-08-05 21:44:50', '0', '7', '85');
INSERT INTO `ylrc_msg_log` VALUES ('298', '2020-08-05 21:44:50', '2020-08-05 21:44:50', '0', '8', '85');
INSERT INTO `ylrc_msg_log` VALUES ('299', '2020-08-05 21:44:50', '2020-08-05 21:44:50', '0', '3', '85');
INSERT INTO `ylrc_msg_log` VALUES ('300', '2020-08-05 21:45:05', '2020-08-05 21:45:05', '1', '1', '86');
INSERT INTO `ylrc_msg_log` VALUES ('301', '2020-08-05 21:45:10', '2020-08-05 21:45:10', '1', '1', '87');
INSERT INTO `ylrc_msg_log` VALUES ('302', '2020-08-05 21:45:11', '2020-08-05 21:45:11', '1', '1', '88');
INSERT INTO `ylrc_msg_log` VALUES ('303', '2020-08-05 21:45:35', '2020-08-05 21:45:35', '1', '1', '89');
INSERT INTO `ylrc_msg_log` VALUES ('304', '2020-08-05 21:45:35', '2020-08-05 21:45:35', '0', '5', '89');
INSERT INTO `ylrc_msg_log` VALUES ('305', '2020-08-05 21:45:35', '2020-08-05 21:45:35', '0', '6', '89');
INSERT INTO `ylrc_msg_log` VALUES ('306', '2020-08-05 21:45:35', '2020-08-05 21:45:35', '0', '7', '89');
INSERT INTO `ylrc_msg_log` VALUES ('307', '2020-08-05 21:45:35', '2020-08-05 21:45:35', '0', '8', '89');
INSERT INTO `ylrc_msg_log` VALUES ('308', '2020-08-05 21:45:35', '2020-08-05 21:45:35', '0', '3', '89');
INSERT INTO `ylrc_msg_log` VALUES ('309', '2020-08-05 21:45:35', '2020-08-05 21:45:35', '1', '2', '89');
INSERT INTO `ylrc_msg_log` VALUES ('310', '2020-08-05 21:49:01', '2020-08-05 21:49:01', '1', '4', '90');
INSERT INTO `ylrc_msg_log` VALUES ('311', '2020-08-05 21:49:01', '2020-08-05 21:49:01', '0', '5', '90');
INSERT INTO `ylrc_msg_log` VALUES ('312', '2020-08-05 21:49:01', '2020-08-05 21:49:01', '0', '6', '90');
INSERT INTO `ylrc_msg_log` VALUES ('313', '2020-08-05 21:49:01', '2020-08-05 21:49:01', '0', '7', '90');
INSERT INTO `ylrc_msg_log` VALUES ('314', '2020-08-05 21:49:01', '2020-08-05 21:49:01', '0', '8', '90');
INSERT INTO `ylrc_msg_log` VALUES ('315', '2020-08-05 21:49:01', '2020-08-05 21:49:01', '0', '3', '90');
INSERT INTO `ylrc_msg_log` VALUES ('316', '2020-08-05 21:49:01', '2020-08-05 21:49:01', '1', '2', '90');
INSERT INTO `ylrc_msg_log` VALUES ('317', '2020-08-05 21:49:15', '2020-08-05 21:49:15', '1', '1', '91');
INSERT INTO `ylrc_msg_log` VALUES ('318', '2020-08-05 21:49:15', '2020-08-05 21:49:15', '0', '5', '91');
INSERT INTO `ylrc_msg_log` VALUES ('319', '2020-08-05 21:49:15', '2020-08-05 21:49:15', '0', '6', '91');
INSERT INTO `ylrc_msg_log` VALUES ('320', '2020-08-05 21:49:15', '2020-08-05 21:49:15', '0', '7', '91');
INSERT INTO `ylrc_msg_log` VALUES ('321', '2020-08-05 21:49:15', '2020-08-05 21:49:15', '0', '8', '91');
INSERT INTO `ylrc_msg_log` VALUES ('322', '2020-08-05 21:49:15', '2020-08-05 21:49:15', '0', '3', '91');
INSERT INTO `ylrc_msg_log` VALUES ('323', '2020-08-05 21:49:15', '2020-08-05 21:49:15', '1', '2', '91');
INSERT INTO `ylrc_msg_log` VALUES ('324', '2020-08-05 21:49:22', '2020-08-05 21:49:22', '1', '4', '92');
INSERT INTO `ylrc_msg_log` VALUES ('325', '2020-08-05 21:49:22', '2020-08-05 21:49:22', '0', '5', '92');
INSERT INTO `ylrc_msg_log` VALUES ('326', '2020-08-05 21:49:22', '2020-08-05 21:49:22', '0', '6', '92');
INSERT INTO `ylrc_msg_log` VALUES ('327', '2020-08-05 21:49:22', '2020-08-05 21:49:22', '0', '7', '92');
INSERT INTO `ylrc_msg_log` VALUES ('328', '2020-08-05 21:49:22', '2020-08-05 21:49:22', '0', '8', '92');
INSERT INTO `ylrc_msg_log` VALUES ('329', '2020-08-05 21:49:22', '2020-08-05 21:49:22', '0', '3', '92');
INSERT INTO `ylrc_msg_log` VALUES ('330', '2020-08-05 21:49:22', '2020-08-05 21:49:22', '1', '2', '92');
INSERT INTO `ylrc_msg_log` VALUES ('331', '2020-08-05 21:49:42', '2020-08-05 21:49:42', '1', '1', '93');
INSERT INTO `ylrc_msg_log` VALUES ('332', '2020-08-05 21:50:21', '2020-08-05 21:50:21', '1', '2', '94');
INSERT INTO `ylrc_msg_log` VALUES ('333', '2020-08-05 21:50:34', '2020-08-05 21:50:34', '1', '4', '95');
INSERT INTO `ylrc_msg_log` VALUES ('334', '2020-08-05 21:50:34', '2020-08-05 21:50:34', '0', '5', '95');
INSERT INTO `ylrc_msg_log` VALUES ('335', '2020-08-05 21:50:34', '2020-08-05 21:50:34', '0', '6', '95');
INSERT INTO `ylrc_msg_log` VALUES ('336', '2020-08-05 21:50:34', '2020-08-05 21:50:34', '0', '7', '95');
INSERT INTO `ylrc_msg_log` VALUES ('337', '2020-08-05 21:50:34', '2020-08-05 21:50:34', '0', '8', '95');
INSERT INTO `ylrc_msg_log` VALUES ('338', '2020-08-05 21:50:34', '2020-08-05 21:50:34', '0', '3', '95');
INSERT INTO `ylrc_msg_log` VALUES ('339', '2020-08-05 21:50:34', '2020-08-05 21:50:34', '1', '2', '95');
INSERT INTO `ylrc_msg_log` VALUES ('340', '2020-08-05 21:50:35', '2020-08-05 21:50:35', '1', '4', '96');
INSERT INTO `ylrc_msg_log` VALUES ('341', '2020-08-05 21:50:35', '2020-08-05 21:50:35', '0', '5', '96');
INSERT INTO `ylrc_msg_log` VALUES ('342', '2020-08-05 21:50:35', '2020-08-05 21:50:35', '0', '6', '96');
INSERT INTO `ylrc_msg_log` VALUES ('343', '2020-08-05 21:50:35', '2020-08-05 21:50:35', '0', '7', '96');
INSERT INTO `ylrc_msg_log` VALUES ('344', '2020-08-05 21:50:35', '2020-08-05 21:50:35', '0', '8', '96');
INSERT INTO `ylrc_msg_log` VALUES ('345', '2020-08-05 21:50:35', '2020-08-05 21:50:35', '0', '3', '96');
INSERT INTO `ylrc_msg_log` VALUES ('346', '2020-08-05 21:50:35', '2020-08-05 21:50:35', '1', '2', '96');
INSERT INTO `ylrc_msg_log` VALUES ('347', '2020-08-05 21:50:37', '2020-08-05 21:50:37', '1', '4', '97');
INSERT INTO `ylrc_msg_log` VALUES ('348', '2020-08-05 21:50:37', '2020-08-05 21:50:37', '0', '5', '97');
INSERT INTO `ylrc_msg_log` VALUES ('349', '2020-08-05 21:50:37', '2020-08-05 21:50:37', '0', '6', '97');
INSERT INTO `ylrc_msg_log` VALUES ('350', '2020-08-05 21:50:37', '2020-08-05 21:50:37', '0', '7', '97');
INSERT INTO `ylrc_msg_log` VALUES ('351', '2020-08-05 21:50:37', '2020-08-05 21:50:37', '0', '8', '97');
INSERT INTO `ylrc_msg_log` VALUES ('352', '2020-08-05 21:50:37', '2020-08-05 21:50:37', '0', '3', '97');
INSERT INTO `ylrc_msg_log` VALUES ('353', '2020-08-05 21:50:37', '2020-08-05 21:50:37', '1', '2', '97');
INSERT INTO `ylrc_msg_log` VALUES ('354', '2020-08-05 21:50:52', '2020-08-05 21:50:52', '1', '4', '98');
INSERT INTO `ylrc_msg_log` VALUES ('355', '2020-08-05 21:50:52', '2020-08-05 21:50:52', '0', '5', '98');
INSERT INTO `ylrc_msg_log` VALUES ('356', '2020-08-05 21:50:52', '2020-08-05 21:50:52', '0', '6', '98');
INSERT INTO `ylrc_msg_log` VALUES ('357', '2020-08-05 21:50:52', '2020-08-05 21:50:52', '0', '7', '98');
INSERT INTO `ylrc_msg_log` VALUES ('358', '2020-08-05 21:50:52', '2020-08-05 21:50:52', '0', '8', '98');
INSERT INTO `ylrc_msg_log` VALUES ('359', '2020-08-05 21:50:52', '2020-08-05 21:50:52', '0', '3', '98');
INSERT INTO `ylrc_msg_log` VALUES ('360', '2020-08-05 21:50:52', '2020-08-05 21:50:52', '1', '2', '98');
INSERT INTO `ylrc_msg_log` VALUES ('361', '2020-08-15 15:15:03', '2020-08-15 15:15:03', '1', '10', '99');
INSERT INTO `ylrc_msg_log` VALUES ('362', '2020-08-15 15:15:11', '2020-08-15 15:15:11', '1', '10', '100');
INSERT INTO `ylrc_msg_log` VALUES ('363', '2020-08-15 15:16:53', '2020-08-15 15:16:53', '1', '1', '101');
INSERT INTO `ylrc_msg_log` VALUES ('364', '2020-08-15 15:17:07', '2020-08-15 15:17:07', '1', '10', '102');
INSERT INTO `ylrc_msg_log` VALUES ('365', '2020-08-15 15:17:14', '2020-08-15 15:17:14', '1', '1', '103');
INSERT INTO `ylrc_msg_log` VALUES ('366', '2020-08-15 15:17:21', '2020-08-15 15:17:21', '1', '1', '104');
INSERT INTO `ylrc_msg_log` VALUES ('367', '2020-08-15 15:17:25', '2020-08-15 15:17:25', '1', '1', '105');
INSERT INTO `ylrc_msg_log` VALUES ('368', '2020-08-15 15:17:43', '2020-08-15 15:17:43', '1', '10', '106');
INSERT INTO `ylrc_msg_log` VALUES ('369', '2020-08-15 15:17:47', '2020-08-15 15:17:47', '1', '10', '107');
INSERT INTO `ylrc_msg_log` VALUES ('370', '2020-08-15 15:39:29', '2020-08-23 20:38:03', '1', '4', '108');
INSERT INTO `ylrc_msg_log` VALUES ('371', '2020-08-15 15:39:29', '2020-08-15 15:39:29', '0', '5', '108');
INSERT INTO `ylrc_msg_log` VALUES ('372', '2020-08-15 15:39:29', '2020-08-15 15:39:29', '0', '6', '108');
INSERT INTO `ylrc_msg_log` VALUES ('373', '2020-08-15 15:39:29', '2020-08-15 15:39:29', '0', '7', '108');
INSERT INTO `ylrc_msg_log` VALUES ('374', '2020-08-15 15:39:29', '2020-08-15 15:39:29', '0', '8', '108');
INSERT INTO `ylrc_msg_log` VALUES ('375', '2020-08-15 15:39:29', '2020-08-15 15:39:29', '0', '3', '108');
INSERT INTO `ylrc_msg_log` VALUES ('376', '2020-08-15 15:39:29', '2020-08-15 15:39:29', '0', '2', '108');
INSERT INTO `ylrc_msg_log` VALUES ('377', '2020-08-15 15:39:44', '2020-08-15 15:39:44', '1', '10', '109');
INSERT INTO `ylrc_msg_log` VALUES ('378', '2020-08-15 16:50:13', '2020-08-23 20:38:03', '1', '4', '110');
INSERT INTO `ylrc_msg_log` VALUES ('379', '2020-08-15 16:50:13', '2020-08-15 16:50:13', '0', '5', '110');
INSERT INTO `ylrc_msg_log` VALUES ('380', '2020-08-15 16:50:13', '2020-08-15 16:50:13', '0', '6', '110');
INSERT INTO `ylrc_msg_log` VALUES ('381', '2020-08-15 16:50:13', '2020-08-15 16:50:13', '0', '7', '110');
INSERT INTO `ylrc_msg_log` VALUES ('382', '2020-08-15 16:50:13', '2020-08-15 16:50:13', '0', '8', '110');
INSERT INTO `ylrc_msg_log` VALUES ('383', '2020-08-15 16:50:13', '2020-08-15 16:50:13', '0', '3', '110');
INSERT INTO `ylrc_msg_log` VALUES ('384', '2020-08-15 16:50:13', '2020-08-15 16:50:13', '0', '2', '110');
INSERT INTO `ylrc_msg_log` VALUES ('385', '2020-08-15 17:17:52', '2020-08-15 17:17:52', '1', '10', '111');
INSERT INTO `ylrc_msg_log` VALUES ('386', '2020-08-15 17:39:09', '2020-08-15 17:39:09', '1', '10', '112');
INSERT INTO `ylrc_msg_log` VALUES ('387', '2020-08-15 17:39:42', '2020-08-15 17:39:42', '1', '1', '113');
INSERT INTO `ylrc_msg_log` VALUES ('388', '2020-08-15 18:07:27', '2020-08-23 20:38:03', '1', '4', '114');
INSERT INTO `ylrc_msg_log` VALUES ('389', '2020-08-15 18:07:27', '2020-08-15 18:07:27', '0', '5', '114');
INSERT INTO `ylrc_msg_log` VALUES ('390', '2020-08-15 18:07:27', '2020-08-15 18:07:27', '0', '6', '114');
INSERT INTO `ylrc_msg_log` VALUES ('391', '2020-08-15 18:07:27', '2020-08-15 18:07:27', '0', '7', '114');
INSERT INTO `ylrc_msg_log` VALUES ('392', '2020-08-15 18:07:27', '2020-08-15 18:07:27', '0', '8', '114');
INSERT INTO `ylrc_msg_log` VALUES ('393', '2020-08-15 18:07:27', '2020-08-15 18:07:27', '0', '3', '114');
INSERT INTO `ylrc_msg_log` VALUES ('394', '2020-08-15 18:07:27', '2020-08-15 18:07:27', '0', '2', '114');
INSERT INTO `ylrc_msg_log` VALUES ('395', '2020-08-15 18:07:51', '2020-08-15 18:07:51', '1', '10', '115');
INSERT INTO `ylrc_msg_log` VALUES ('396', '2020-08-15 18:09:12', '2020-08-23 20:38:03', '1', '4', '116');
INSERT INTO `ylrc_msg_log` VALUES ('397', '2020-08-15 18:09:12', '2020-08-15 18:09:12', '0', '5', '116');
INSERT INTO `ylrc_msg_log` VALUES ('398', '2020-08-15 18:09:12', '2020-08-15 18:09:12', '0', '6', '116');
INSERT INTO `ylrc_msg_log` VALUES ('399', '2020-08-15 18:09:12', '2020-08-15 18:09:12', '0', '7', '116');
INSERT INTO `ylrc_msg_log` VALUES ('400', '2020-08-15 18:09:12', '2020-08-15 18:09:12', '0', '8', '116');
INSERT INTO `ylrc_msg_log` VALUES ('401', '2020-08-15 18:09:12', '2020-08-15 18:09:12', '0', '3', '116');
INSERT INTO `ylrc_msg_log` VALUES ('402', '2020-08-15 18:09:12', '2020-08-15 18:09:12', '0', '2', '116');
INSERT INTO `ylrc_msg_log` VALUES ('403', '2020-08-15 18:11:46', '2020-08-23 20:38:03', '1', '4', '117');
INSERT INTO `ylrc_msg_log` VALUES ('404', '2020-08-15 18:11:46', '2020-08-15 18:11:46', '0', '5', '117');
INSERT INTO `ylrc_msg_log` VALUES ('405', '2020-08-15 18:11:46', '2020-08-15 18:11:46', '0', '6', '117');
INSERT INTO `ylrc_msg_log` VALUES ('406', '2020-08-15 18:11:46', '2020-08-15 18:11:46', '0', '7', '117');
INSERT INTO `ylrc_msg_log` VALUES ('407', '2020-08-15 18:11:46', '2020-08-15 18:11:46', '0', '8', '117');
INSERT INTO `ylrc_msg_log` VALUES ('408', '2020-08-15 18:11:46', '2020-08-15 18:11:46', '0', '3', '117');
INSERT INTO `ylrc_msg_log` VALUES ('409', '2020-08-15 18:11:46', '2020-08-15 18:11:46', '0', '2', '117');
INSERT INTO `ylrc_msg_log` VALUES ('410', '2020-08-15 18:19:23', '2020-08-23 20:38:03', '1', '4', '118');
INSERT INTO `ylrc_msg_log` VALUES ('411', '2020-08-15 18:19:23', '2020-08-15 18:19:23', '0', '5', '118');
INSERT INTO `ylrc_msg_log` VALUES ('412', '2020-08-15 18:19:23', '2020-08-15 18:19:23', '0', '6', '118');
INSERT INTO `ylrc_msg_log` VALUES ('413', '2020-08-15 18:19:23', '2020-08-15 18:19:23', '0', '7', '118');
INSERT INTO `ylrc_msg_log` VALUES ('414', '2020-08-15 18:19:23', '2020-08-15 18:19:23', '0', '8', '118');
INSERT INTO `ylrc_msg_log` VALUES ('415', '2020-08-15 18:19:23', '2020-08-15 18:19:23', '0', '3', '118');
INSERT INTO `ylrc_msg_log` VALUES ('416', '2020-08-15 18:19:23', '2020-08-15 18:19:23', '0', '2', '118');
INSERT INTO `ylrc_msg_log` VALUES ('417', '2020-08-15 18:19:30', '2020-08-15 18:19:30', '1', '10', '119');
INSERT INTO `ylrc_msg_log` VALUES ('418', '2020-08-15 18:20:16', '2020-08-15 18:20:16', '1', '1', '120');
INSERT INTO `ylrc_msg_log` VALUES ('419', '2020-08-15 18:20:43', '2020-08-15 18:20:43', '1', '10', '121');
INSERT INTO `ylrc_msg_log` VALUES ('420', '2020-08-15 18:23:50', '2020-08-15 18:23:50', '1', '10', '122');
INSERT INTO `ylrc_msg_log` VALUES ('421', '2020-08-15 18:35:55', '2020-08-23 20:38:03', '1', '4', '123');
INSERT INTO `ylrc_msg_log` VALUES ('422', '2020-08-15 18:35:55', '2020-08-15 18:35:55', '0', '5', '123');
INSERT INTO `ylrc_msg_log` VALUES ('423', '2020-08-15 18:35:55', '2020-08-15 18:35:55', '0', '6', '123');
INSERT INTO `ylrc_msg_log` VALUES ('424', '2020-08-15 18:35:55', '2020-08-15 18:35:55', '0', '7', '123');
INSERT INTO `ylrc_msg_log` VALUES ('425', '2020-08-15 18:35:55', '2020-08-15 18:35:55', '0', '8', '123');
INSERT INTO `ylrc_msg_log` VALUES ('426', '2020-08-15 18:35:55', '2020-08-15 18:35:55', '0', '3', '123');
INSERT INTO `ylrc_msg_log` VALUES ('427', '2020-08-15 18:35:55', '2020-08-15 18:35:55', '0', '2', '123');
INSERT INTO `ylrc_msg_log` VALUES ('428', '2020-08-15 18:36:01', '2020-08-23 20:38:03', '1', '4', '124');
INSERT INTO `ylrc_msg_log` VALUES ('429', '2020-08-15 18:36:01', '2020-08-15 18:36:01', '0', '5', '124');
INSERT INTO `ylrc_msg_log` VALUES ('430', '2020-08-15 18:36:01', '2020-08-15 18:36:01', '0', '6', '124');
INSERT INTO `ylrc_msg_log` VALUES ('431', '2020-08-15 18:36:01', '2020-08-15 18:36:01', '0', '7', '124');
INSERT INTO `ylrc_msg_log` VALUES ('432', '2020-08-15 18:36:01', '2020-08-15 18:36:01', '0', '8', '124');
INSERT INTO `ylrc_msg_log` VALUES ('433', '2020-08-15 18:36:01', '2020-08-15 18:36:01', '0', '3', '124');
INSERT INTO `ylrc_msg_log` VALUES ('434', '2020-08-15 18:36:01', '2020-08-15 18:36:01', '0', '2', '124');
INSERT INTO `ylrc_msg_log` VALUES ('435', '2020-08-15 18:36:09', '2020-08-15 18:36:09', '1', '10', '125');
INSERT INTO `ylrc_msg_log` VALUES ('436', '2020-08-15 18:36:22', '2020-08-15 18:36:22', '1', '10', '126');
INSERT INTO `ylrc_msg_log` VALUES ('437', '2020-08-15 18:36:54', '2020-08-15 18:36:54', '1', '10', '127');
INSERT INTO `ylrc_msg_log` VALUES ('438', '2020-08-15 18:37:39', '2020-08-15 18:37:39', '1', '10', '128');
INSERT INTO `ylrc_msg_log` VALUES ('439', '2020-08-15 18:38:57', '2020-08-23 20:38:03', '1', '4', '129');
INSERT INTO `ylrc_msg_log` VALUES ('440', '2020-08-15 18:38:57', '2020-08-15 18:38:57', '0', '5', '129');
INSERT INTO `ylrc_msg_log` VALUES ('441', '2020-08-15 18:38:57', '2020-08-15 18:38:57', '0', '6', '129');
INSERT INTO `ylrc_msg_log` VALUES ('442', '2020-08-15 18:38:57', '2020-08-15 18:38:57', '0', '7', '129');
INSERT INTO `ylrc_msg_log` VALUES ('443', '2020-08-15 18:38:57', '2020-08-15 18:38:57', '0', '8', '129');
INSERT INTO `ylrc_msg_log` VALUES ('444', '2020-08-15 18:38:57', '2020-08-15 18:38:57', '0', '3', '129');
INSERT INTO `ylrc_msg_log` VALUES ('445', '2020-08-15 18:38:57', '2020-08-15 18:38:57', '0', '2', '129');
INSERT INTO `ylrc_msg_log` VALUES ('446', '2020-08-15 18:39:15', '2020-08-15 18:39:15', '1', '10', '130');
INSERT INTO `ylrc_msg_log` VALUES ('447', '2020-08-15 18:39:33', '2020-08-15 18:39:33', '1', '10', '131');
INSERT INTO `ylrc_msg_log` VALUES ('448', '2020-08-15 18:54:22', '2020-08-15 18:54:22', '1', '10', '132');
INSERT INTO `ylrc_msg_log` VALUES ('449', '2020-08-15 19:23:05', '2020-08-15 23:35:34', '1', '10', '133');
INSERT INTO `ylrc_msg_log` VALUES ('450', '2020-08-15 19:23:13', '2020-08-15 23:35:34', '1', '10', '134');
INSERT INTO `ylrc_msg_log` VALUES ('451', '2020-08-15 19:29:09', '2020-08-23 20:38:03', '1', '4', '135');
INSERT INTO `ylrc_msg_log` VALUES ('452', '2020-08-15 19:29:09', '2020-08-15 19:29:09', '0', '5', '135');
INSERT INTO `ylrc_msg_log` VALUES ('453', '2020-08-15 19:29:09', '2020-08-15 19:29:09', '0', '6', '135');
INSERT INTO `ylrc_msg_log` VALUES ('454', '2020-08-15 19:29:09', '2020-08-15 19:29:09', '0', '7', '135');
INSERT INTO `ylrc_msg_log` VALUES ('455', '2020-08-15 19:29:09', '2020-08-15 19:29:09', '0', '8', '135');
INSERT INTO `ylrc_msg_log` VALUES ('456', '2020-08-15 19:29:10', '2020-08-15 19:29:10', '0', '3', '135');
INSERT INTO `ylrc_msg_log` VALUES ('457', '2020-08-15 19:29:10', '2020-08-15 19:29:10', '0', '2', '135');
INSERT INTO `ylrc_msg_log` VALUES ('458', '2020-08-15 19:29:17', '2020-08-15 23:35:34', '1', '10', '136');
INSERT INTO `ylrc_msg_log` VALUES ('459', '2020-08-15 19:35:37', '2020-08-23 20:38:03', '1', '4', '137');
INSERT INTO `ylrc_msg_log` VALUES ('460', '2020-08-15 19:35:37', '2020-08-15 19:35:37', '0', '5', '137');
INSERT INTO `ylrc_msg_log` VALUES ('461', '2020-08-15 19:35:37', '2020-08-15 19:35:37', '0', '6', '137');
INSERT INTO `ylrc_msg_log` VALUES ('462', '2020-08-15 19:35:37', '2020-08-15 19:35:37', '0', '7', '137');
INSERT INTO `ylrc_msg_log` VALUES ('463', '2020-08-15 19:35:37', '2020-08-15 19:35:37', '0', '8', '137');
INSERT INTO `ylrc_msg_log` VALUES ('464', '2020-08-15 19:35:37', '2020-08-15 19:35:37', '0', '3', '137');
INSERT INTO `ylrc_msg_log` VALUES ('465', '2020-08-15 19:35:37', '2020-08-15 19:35:37', '0', '2', '137');
INSERT INTO `ylrc_msg_log` VALUES ('466', '2020-08-15 19:45:35', '2020-08-23 20:38:03', '1', '4', '138');
INSERT INTO `ylrc_msg_log` VALUES ('467', '2020-08-15 19:45:35', '2020-08-15 19:45:35', '0', '5', '138');
INSERT INTO `ylrc_msg_log` VALUES ('468', '2020-08-15 19:45:35', '2020-08-15 19:45:35', '0', '6', '138');
INSERT INTO `ylrc_msg_log` VALUES ('469', '2020-08-15 19:45:35', '2020-08-15 19:45:35', '0', '7', '138');
INSERT INTO `ylrc_msg_log` VALUES ('470', '2020-08-15 19:45:35', '2020-08-15 19:45:35', '0', '8', '138');
INSERT INTO `ylrc_msg_log` VALUES ('471', '2020-08-15 19:45:35', '2020-08-15 19:45:35', '0', '3', '138');
INSERT INTO `ylrc_msg_log` VALUES ('472', '2020-08-15 19:45:35', '2020-08-15 19:45:35', '0', '2', '138');
INSERT INTO `ylrc_msg_log` VALUES ('473', '2020-08-15 19:45:49', '2020-08-15 23:35:34', '1', '10', '139');
INSERT INTO `ylrc_msg_log` VALUES ('474', '2020-08-15 19:45:58', '2020-08-15 23:35:34', '1', '10', '140');
INSERT INTO `ylrc_msg_log` VALUES ('475', '2020-08-15 23:35:17', '2020-08-15 23:35:34', '1', '10', '141');
INSERT INTO `ylrc_msg_log` VALUES ('476', '2020-08-15 23:35:47', '2020-08-15 23:35:47', '1', '1', '142');
INSERT INTO `ylrc_msg_log` VALUES ('477', '2020-08-15 23:35:57', '2020-08-15 23:35:57', '1', '10', '143');
INSERT INTO `ylrc_msg_log` VALUES ('478', '2020-08-15 23:36:10', '2020-08-15 23:36:10', '1', '1', '144');
INSERT INTO `ylrc_msg_log` VALUES ('479', '2020-08-15 23:36:24', '2020-08-15 23:36:24', '1', '10', '145');
INSERT INTO `ylrc_msg_log` VALUES ('480', '2020-08-15 23:36:46', '2020-08-15 23:36:46', '1', '1', '146');
INSERT INTO `ylrc_msg_log` VALUES ('481', '2020-08-15 23:37:02', '2020-08-15 23:37:02', '1', '10', '147');
INSERT INTO `ylrc_msg_log` VALUES ('482', '2020-08-15 23:39:20', '2020-08-23 20:38:03', '1', '4', '148');
INSERT INTO `ylrc_msg_log` VALUES ('483', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '0', '5', '148');
INSERT INTO `ylrc_msg_log` VALUES ('484', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '0', '6', '148');
INSERT INTO `ylrc_msg_log` VALUES ('485', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '0', '7', '148');
INSERT INTO `ylrc_msg_log` VALUES ('486', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '0', '8', '148');
INSERT INTO `ylrc_msg_log` VALUES ('487', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '0', '3', '148');
INSERT INTO `ylrc_msg_log` VALUES ('488', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '0', '2', '148');
INSERT INTO `ylrc_msg_log` VALUES ('489', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '0', '9', '148');
INSERT INTO `ylrc_msg_log` VALUES ('490', '2020-08-15 23:39:20', '2020-08-15 23:39:20', '1', '10', '148');
INSERT INTO `ylrc_msg_log` VALUES ('491', '2020-08-15 23:40:29', '2020-08-23 20:38:03', '1', '4', '149');
INSERT INTO `ylrc_msg_log` VALUES ('492', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '0', '5', '149');
INSERT INTO `ylrc_msg_log` VALUES ('493', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '0', '6', '149');
INSERT INTO `ylrc_msg_log` VALUES ('494', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '0', '7', '149');
INSERT INTO `ylrc_msg_log` VALUES ('495', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '0', '8', '149');
INSERT INTO `ylrc_msg_log` VALUES ('496', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '0', '3', '149');
INSERT INTO `ylrc_msg_log` VALUES ('497', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '0', '2', '149');
INSERT INTO `ylrc_msg_log` VALUES ('498', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '0', '9', '149');
INSERT INTO `ylrc_msg_log` VALUES ('499', '2020-08-15 23:40:29', '2020-08-15 23:40:29', '1', '10', '149');
INSERT INTO `ylrc_msg_log` VALUES ('500', '2020-08-15 23:47:47', '2020-08-23 20:38:03', '1', '4', '150');
INSERT INTO `ylrc_msg_log` VALUES ('501', '2020-08-15 23:47:47', '2020-08-15 23:47:47', '0', '5', '150');
INSERT INTO `ylrc_msg_log` VALUES ('502', '2020-08-15 23:47:47', '2020-08-15 23:47:47', '0', '6', '150');
INSERT INTO `ylrc_msg_log` VALUES ('503', '2020-08-15 23:47:47', '2020-08-15 23:47:47', '0', '7', '150');
INSERT INTO `ylrc_msg_log` VALUES ('504', '2020-08-15 23:47:47', '2020-08-15 23:47:47', '0', '8', '150');
INSERT INTO `ylrc_msg_log` VALUES ('505', '2020-08-15 23:47:47', '2020-08-15 23:47:47', '0', '3', '150');
INSERT INTO `ylrc_msg_log` VALUES ('506', '2020-08-15 23:47:47', '2020-08-15 23:47:47', '0', '2', '150');
INSERT INTO `ylrc_msg_log` VALUES ('507', '2020-08-15 23:47:47', '2020-08-15 23:47:47', '0', '9', '150');
INSERT INTO `ylrc_msg_log` VALUES ('508', '2020-08-15 23:55:32', '2020-08-23 20:38:03', '1', '4', '151');
INSERT INTO `ylrc_msg_log` VALUES ('509', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '0', '5', '151');
INSERT INTO `ylrc_msg_log` VALUES ('510', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '0', '6', '151');
INSERT INTO `ylrc_msg_log` VALUES ('511', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '0', '7', '151');
INSERT INTO `ylrc_msg_log` VALUES ('512', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '0', '8', '151');
INSERT INTO `ylrc_msg_log` VALUES ('513', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '0', '3', '151');
INSERT INTO `ylrc_msg_log` VALUES ('514', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '0', '2', '151');
INSERT INTO `ylrc_msg_log` VALUES ('515', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '0', '9', '151');
INSERT INTO `ylrc_msg_log` VALUES ('516', '2020-08-15 23:55:32', '2020-08-15 23:55:32', '1', '10', '151');
INSERT INTO `ylrc_msg_log` VALUES ('517', '2020-08-16 00:00:15', '2020-08-23 20:38:04', '1', '4', '152');
INSERT INTO `ylrc_msg_log` VALUES ('518', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '0', '5', '152');
INSERT INTO `ylrc_msg_log` VALUES ('519', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '0', '6', '152');
INSERT INTO `ylrc_msg_log` VALUES ('520', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '0', '7', '152');
INSERT INTO `ylrc_msg_log` VALUES ('521', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '0', '8', '152');
INSERT INTO `ylrc_msg_log` VALUES ('522', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '0', '3', '152');
INSERT INTO `ylrc_msg_log` VALUES ('523', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '0', '2', '152');
INSERT INTO `ylrc_msg_log` VALUES ('524', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '0', '9', '152');
INSERT INTO `ylrc_msg_log` VALUES ('525', '2020-08-16 00:00:15', '2020-08-16 00:00:15', '1', '10', '152');
INSERT INTO `ylrc_msg_log` VALUES ('526', '2020-08-16 00:01:24', '2020-08-23 20:38:04', '1', '4', '153');
INSERT INTO `ylrc_msg_log` VALUES ('527', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '0', '5', '153');
INSERT INTO `ylrc_msg_log` VALUES ('528', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '0', '6', '153');
INSERT INTO `ylrc_msg_log` VALUES ('529', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '0', '7', '153');
INSERT INTO `ylrc_msg_log` VALUES ('530', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '0', '8', '153');
INSERT INTO `ylrc_msg_log` VALUES ('531', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '0', '3', '153');
INSERT INTO `ylrc_msg_log` VALUES ('532', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '0', '2', '153');
INSERT INTO `ylrc_msg_log` VALUES ('533', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '0', '9', '153');
INSERT INTO `ylrc_msg_log` VALUES ('534', '2020-08-16 00:01:24', '2020-08-16 00:01:24', '1', '10', '153');
INSERT INTO `ylrc_msg_log` VALUES ('535', '2020-08-16 13:50:42', '2020-08-16 13:50:42', '1', '10', '154');
INSERT INTO `ylrc_msg_log` VALUES ('536', '2020-08-16 13:50:58', '2020-08-23 20:38:04', '1', '4', '155');
INSERT INTO `ylrc_msg_log` VALUES ('537', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '0', '5', '155');
INSERT INTO `ylrc_msg_log` VALUES ('538', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '0', '6', '155');
INSERT INTO `ylrc_msg_log` VALUES ('539', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '0', '7', '155');
INSERT INTO `ylrc_msg_log` VALUES ('540', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '0', '8', '155');
INSERT INTO `ylrc_msg_log` VALUES ('541', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '0', '3', '155');
INSERT INTO `ylrc_msg_log` VALUES ('542', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '0', '2', '155');
INSERT INTO `ylrc_msg_log` VALUES ('543', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '0', '9', '155');
INSERT INTO `ylrc_msg_log` VALUES ('544', '2020-08-16 13:50:58', '2020-08-16 13:50:58', '1', '10', '155');
INSERT INTO `ylrc_msg_log` VALUES ('545', '2020-08-16 14:11:50', '2020-08-23 20:38:04', '1', '4', '156');
INSERT INTO `ylrc_msg_log` VALUES ('546', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '0', '5', '156');
INSERT INTO `ylrc_msg_log` VALUES ('547', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '0', '6', '156');
INSERT INTO `ylrc_msg_log` VALUES ('548', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '0', '7', '156');
INSERT INTO `ylrc_msg_log` VALUES ('549', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '0', '8', '156');
INSERT INTO `ylrc_msg_log` VALUES ('550', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '0', '3', '156');
INSERT INTO `ylrc_msg_log` VALUES ('551', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '0', '2', '156');
INSERT INTO `ylrc_msg_log` VALUES ('552', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '0', '9', '156');
INSERT INTO `ylrc_msg_log` VALUES ('553', '2020-08-16 14:11:50', '2020-08-16 14:11:50', '1', '10', '156');
INSERT INTO `ylrc_msg_log` VALUES ('554', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '1', '1', '157');
INSERT INTO `ylrc_msg_log` VALUES ('555', '2020-08-16 14:26:22', '2020-08-23 20:38:04', '1', '4', '157');
INSERT INTO `ylrc_msg_log` VALUES ('556', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '0', '5', '157');
INSERT INTO `ylrc_msg_log` VALUES ('557', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '0', '6', '157');
INSERT INTO `ylrc_msg_log` VALUES ('558', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '0', '7', '157');
INSERT INTO `ylrc_msg_log` VALUES ('559', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '0', '8', '157');
INSERT INTO `ylrc_msg_log` VALUES ('560', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '0', '3', '157');
INSERT INTO `ylrc_msg_log` VALUES ('561', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '0', '2', '157');
INSERT INTO `ylrc_msg_log` VALUES ('562', '2020-08-16 14:26:22', '2020-08-16 14:26:22', '0', '9', '157');
INSERT INTO `ylrc_msg_log` VALUES ('563', '2020-08-16 14:26:36', '2020-08-23 20:38:04', '1', '4', '158');
INSERT INTO `ylrc_msg_log` VALUES ('564', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '0', '5', '158');
INSERT INTO `ylrc_msg_log` VALUES ('565', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '0', '6', '158');
INSERT INTO `ylrc_msg_log` VALUES ('566', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '0', '7', '158');
INSERT INTO `ylrc_msg_log` VALUES ('567', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '0', '8', '158');
INSERT INTO `ylrc_msg_log` VALUES ('568', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '0', '3', '158');
INSERT INTO `ylrc_msg_log` VALUES ('569', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '0', '2', '158');
INSERT INTO `ylrc_msg_log` VALUES ('570', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '0', '9', '158');
INSERT INTO `ylrc_msg_log` VALUES ('571', '2020-08-16 14:26:36', '2020-08-16 14:26:36', '1', '10', '158');
INSERT INTO `ylrc_msg_log` VALUES ('572', '2020-08-16 14:27:16', '2020-08-23 20:38:04', '1', '4', '159');
INSERT INTO `ylrc_msg_log` VALUES ('573', '2020-08-16 14:27:16', '2020-08-16 14:27:16', '0', '5', '159');
INSERT INTO `ylrc_msg_log` VALUES ('574', '2020-08-16 14:27:16', '2020-08-16 14:27:16', '0', '6', '159');
INSERT INTO `ylrc_msg_log` VALUES ('575', '2020-08-16 14:27:16', '2020-08-16 14:27:16', '0', '7', '159');
INSERT INTO `ylrc_msg_log` VALUES ('576', '2020-08-16 14:27:16', '2020-08-16 14:27:16', '0', '8', '159');
INSERT INTO `ylrc_msg_log` VALUES ('577', '2020-08-16 14:27:16', '2020-08-16 14:27:16', '0', '3', '159');
INSERT INTO `ylrc_msg_log` VALUES ('578', '2020-08-16 14:27:16', '2020-08-16 14:27:16', '0', '2', '159');
INSERT INTO `ylrc_msg_log` VALUES ('579', '2020-08-16 14:27:16', '2020-08-16 14:27:16', '0', '9', '159');
INSERT INTO `ylrc_msg_log` VALUES ('580', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '1', '1', '160');
INSERT INTO `ylrc_msg_log` VALUES ('581', '2020-08-16 14:27:49', '2020-08-23 20:38:04', '1', '4', '160');
INSERT INTO `ylrc_msg_log` VALUES ('582', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '0', '5', '160');
INSERT INTO `ylrc_msg_log` VALUES ('583', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '0', '6', '160');
INSERT INTO `ylrc_msg_log` VALUES ('584', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '0', '7', '160');
INSERT INTO `ylrc_msg_log` VALUES ('585', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '0', '8', '160');
INSERT INTO `ylrc_msg_log` VALUES ('586', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '0', '3', '160');
INSERT INTO `ylrc_msg_log` VALUES ('587', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '0', '2', '160');
INSERT INTO `ylrc_msg_log` VALUES ('588', '2020-08-16 14:27:49', '2020-08-16 14:27:49', '0', '9', '160');
INSERT INTO `ylrc_msg_log` VALUES ('589', '2020-08-16 14:28:05', '2020-08-16 14:28:05', '1', '10', '161');
INSERT INTO `ylrc_msg_log` VALUES ('590', '2020-08-16 14:28:27', '2020-08-16 14:28:27', '1', '10', '162');
INSERT INTO `ylrc_msg_log` VALUES ('591', '2020-08-16 14:28:47', '2020-08-16 14:28:47', '1', '1', '163');
INSERT INTO `ylrc_msg_log` VALUES ('592', '2020-08-16 14:29:59', '2020-08-16 14:29:59', '1', '1', '164');
INSERT INTO `ylrc_msg_log` VALUES ('593', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '1', '1', '165');
INSERT INTO `ylrc_msg_log` VALUES ('594', '2020-08-16 14:30:02', '2020-08-23 20:38:04', '1', '4', '165');
INSERT INTO `ylrc_msg_log` VALUES ('595', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '0', '5', '165');
INSERT INTO `ylrc_msg_log` VALUES ('596', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '0', '6', '165');
INSERT INTO `ylrc_msg_log` VALUES ('597', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '0', '7', '165');
INSERT INTO `ylrc_msg_log` VALUES ('598', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '0', '8', '165');
INSERT INTO `ylrc_msg_log` VALUES ('599', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '0', '3', '165');
INSERT INTO `ylrc_msg_log` VALUES ('600', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '0', '2', '165');
INSERT INTO `ylrc_msg_log` VALUES ('601', '2020-08-16 14:30:02', '2020-08-16 14:30:02', '0', '9', '165');
INSERT INTO `ylrc_msg_log` VALUES ('602', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '1', '1', '166');
INSERT INTO `ylrc_msg_log` VALUES ('603', '2020-08-16 14:43:04', '2020-08-23 20:38:04', '1', '4', '166');
INSERT INTO `ylrc_msg_log` VALUES ('604', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '0', '5', '166');
INSERT INTO `ylrc_msg_log` VALUES ('605', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '0', '6', '166');
INSERT INTO `ylrc_msg_log` VALUES ('606', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '0', '7', '166');
INSERT INTO `ylrc_msg_log` VALUES ('607', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '0', '8', '166');
INSERT INTO `ylrc_msg_log` VALUES ('608', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '0', '3', '166');
INSERT INTO `ylrc_msg_log` VALUES ('609', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '0', '2', '166');
INSERT INTO `ylrc_msg_log` VALUES ('610', '2020-08-16 14:43:04', '2020-08-16 14:43:04', '0', '9', '166');
INSERT INTO `ylrc_msg_log` VALUES ('611', '2020-08-16 14:45:17', '2020-08-16 14:45:17', '1', '1', '167');
INSERT INTO `ylrc_msg_log` VALUES ('612', '2020-08-16 14:45:17', '2020-08-23 20:38:04', '1', '4', '167');
INSERT INTO `ylrc_msg_log` VALUES ('613', '2020-08-16 14:45:17', '2020-08-16 14:45:17', '0', '5', '167');
INSERT INTO `ylrc_msg_log` VALUES ('614', '2020-08-16 14:45:17', '2020-08-16 14:45:17', '0', '6', '167');
INSERT INTO `ylrc_msg_log` VALUES ('615', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '7', '167');
INSERT INTO `ylrc_msg_log` VALUES ('616', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '8', '167');
INSERT INTO `ylrc_msg_log` VALUES ('617', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '3', '167');
INSERT INTO `ylrc_msg_log` VALUES ('618', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '2', '167');
INSERT INTO `ylrc_msg_log` VALUES ('619', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '9', '167');
INSERT INTO `ylrc_msg_log` VALUES ('620', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '1', '1', '168');
INSERT INTO `ylrc_msg_log` VALUES ('621', '2020-08-16 14:45:18', '2020-08-23 20:38:04', '1', '4', '168');
INSERT INTO `ylrc_msg_log` VALUES ('622', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '5', '168');
INSERT INTO `ylrc_msg_log` VALUES ('623', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '6', '168');
INSERT INTO `ylrc_msg_log` VALUES ('624', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '7', '168');
INSERT INTO `ylrc_msg_log` VALUES ('625', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '8', '168');
INSERT INTO `ylrc_msg_log` VALUES ('626', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '3', '168');
INSERT INTO `ylrc_msg_log` VALUES ('627', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '2', '168');
INSERT INTO `ylrc_msg_log` VALUES ('628', '2020-08-16 14:45:18', '2020-08-16 14:45:18', '0', '9', '168');
INSERT INTO `ylrc_msg_log` VALUES ('629', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '1', '1', '169');
INSERT INTO `ylrc_msg_log` VALUES ('630', '2020-08-16 14:45:19', '2020-08-23 20:38:04', '1', '4', '169');
INSERT INTO `ylrc_msg_log` VALUES ('631', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '0', '5', '169');
INSERT INTO `ylrc_msg_log` VALUES ('632', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '0', '6', '169');
INSERT INTO `ylrc_msg_log` VALUES ('633', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '0', '7', '169');
INSERT INTO `ylrc_msg_log` VALUES ('634', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '0', '8', '169');
INSERT INTO `ylrc_msg_log` VALUES ('635', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '0', '3', '169');
INSERT INTO `ylrc_msg_log` VALUES ('636', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '0', '2', '169');
INSERT INTO `ylrc_msg_log` VALUES ('637', '2020-08-16 14:45:19', '2020-08-16 14:45:19', '0', '9', '169');
INSERT INTO `ylrc_msg_log` VALUES ('638', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '1', '1', '170');
INSERT INTO `ylrc_msg_log` VALUES ('639', '2020-08-16 14:45:20', '2020-08-23 20:38:04', '1', '4', '170');
INSERT INTO `ylrc_msg_log` VALUES ('640', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '0', '5', '170');
INSERT INTO `ylrc_msg_log` VALUES ('641', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '0', '6', '170');
INSERT INTO `ylrc_msg_log` VALUES ('642', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '0', '7', '170');
INSERT INTO `ylrc_msg_log` VALUES ('643', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '0', '8', '170');
INSERT INTO `ylrc_msg_log` VALUES ('644', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '0', '3', '170');
INSERT INTO `ylrc_msg_log` VALUES ('645', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '0', '2', '170');
INSERT INTO `ylrc_msg_log` VALUES ('646', '2020-08-16 14:45:20', '2020-08-16 14:45:20', '0', '9', '170');
INSERT INTO `ylrc_msg_log` VALUES ('647', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '1', '1', '171');
INSERT INTO `ylrc_msg_log` VALUES ('648', '2020-08-16 14:45:21', '2020-08-23 20:38:04', '1', '4', '171');
INSERT INTO `ylrc_msg_log` VALUES ('649', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '0', '5', '171');
INSERT INTO `ylrc_msg_log` VALUES ('650', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '0', '6', '171');
INSERT INTO `ylrc_msg_log` VALUES ('651', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '0', '7', '171');
INSERT INTO `ylrc_msg_log` VALUES ('652', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '0', '8', '171');
INSERT INTO `ylrc_msg_log` VALUES ('653', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '0', '3', '171');
INSERT INTO `ylrc_msg_log` VALUES ('654', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '0', '2', '171');
INSERT INTO `ylrc_msg_log` VALUES ('655', '2020-08-16 14:45:21', '2020-08-16 14:45:21', '0', '9', '171');
INSERT INTO `ylrc_msg_log` VALUES ('656', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '1', '1', '172');
INSERT INTO `ylrc_msg_log` VALUES ('657', '2020-08-16 15:09:29', '2020-08-23 20:38:04', '1', '4', '172');
INSERT INTO `ylrc_msg_log` VALUES ('658', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '0', '5', '172');
INSERT INTO `ylrc_msg_log` VALUES ('659', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '0', '6', '172');
INSERT INTO `ylrc_msg_log` VALUES ('660', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '0', '7', '172');
INSERT INTO `ylrc_msg_log` VALUES ('661', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '0', '8', '172');
INSERT INTO `ylrc_msg_log` VALUES ('662', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '0', '3', '172');
INSERT INTO `ylrc_msg_log` VALUES ('663', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '0', '2', '172');
INSERT INTO `ylrc_msg_log` VALUES ('664', '2020-08-16 15:09:29', '2020-08-16 15:09:29', '0', '9', '172');
INSERT INTO `ylrc_msg_log` VALUES ('665', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '1', '1', '173');
INSERT INTO `ylrc_msg_log` VALUES ('666', '2020-08-16 15:09:33', '2020-08-23 20:38:04', '1', '4', '173');
INSERT INTO `ylrc_msg_log` VALUES ('667', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '0', '5', '173');
INSERT INTO `ylrc_msg_log` VALUES ('668', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '0', '6', '173');
INSERT INTO `ylrc_msg_log` VALUES ('669', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '0', '7', '173');
INSERT INTO `ylrc_msg_log` VALUES ('670', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '0', '8', '173');
INSERT INTO `ylrc_msg_log` VALUES ('671', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '0', '3', '173');
INSERT INTO `ylrc_msg_log` VALUES ('672', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '0', '2', '173');
INSERT INTO `ylrc_msg_log` VALUES ('673', '2020-08-16 15:09:33', '2020-08-16 15:09:33', '0', '9', '173');
INSERT INTO `ylrc_msg_log` VALUES ('674', '2020-08-16 15:22:13', '2020-08-16 15:22:13', '1', '1', '174');
INSERT INTO `ylrc_msg_log` VALUES ('675', '2020-08-16 17:12:22', '2020-08-16 17:12:22', '0', '2', '175');
INSERT INTO `ylrc_msg_log` VALUES ('676', '2020-08-16 18:15:25', '2020-08-23 20:38:04', '1', '4', '176');
INSERT INTO `ylrc_msg_log` VALUES ('677', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '0', '5', '176');
INSERT INTO `ylrc_msg_log` VALUES ('678', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '0', '6', '176');
INSERT INTO `ylrc_msg_log` VALUES ('679', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '0', '7', '176');
INSERT INTO `ylrc_msg_log` VALUES ('680', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '0', '8', '176');
INSERT INTO `ylrc_msg_log` VALUES ('681', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '0', '3', '176');
INSERT INTO `ylrc_msg_log` VALUES ('682', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '0', '2', '176');
INSERT INTO `ylrc_msg_log` VALUES ('683', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '0', '9', '176');
INSERT INTO `ylrc_msg_log` VALUES ('684', '2020-08-16 18:15:25', '2020-08-16 18:15:25', '1', '10', '176');
INSERT INTO `ylrc_msg_log` VALUES ('685', '2020-08-16 18:17:19', '2020-08-16 18:17:19', '0', '2', '177');
INSERT INTO `ylrc_msg_log` VALUES ('686', '2020-08-16 18:39:23', '2020-08-16 18:39:23', '1', '10', '178');
INSERT INTO `ylrc_msg_log` VALUES ('687', '2020-08-16 18:39:37', '2020-08-23 20:38:04', '1', '4', '179');
INSERT INTO `ylrc_msg_log` VALUES ('688', '2020-08-16 18:39:40', '2020-08-16 18:39:40', '0', '2', '180');
INSERT INTO `ylrc_msg_log` VALUES ('689', '2020-08-16 18:39:59', '2020-08-23 20:38:04', '1', '4', '181');
INSERT INTO `ylrc_msg_log` VALUES ('690', '2020-08-16 18:40:03', '2020-08-23 20:38:04', '1', '4', '182');
INSERT INTO `ylrc_msg_log` VALUES ('691', '2020-08-16 18:40:19', '2020-08-16 18:40:19', '0', '2', '183');
INSERT INTO `ylrc_msg_log` VALUES ('692', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '1', '1', '184');
INSERT INTO `ylrc_msg_log` VALUES ('693', '2020-08-16 18:41:29', '2020-08-23 20:38:04', '1', '4', '184');
INSERT INTO `ylrc_msg_log` VALUES ('694', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '0', '5', '184');
INSERT INTO `ylrc_msg_log` VALUES ('695', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '0', '6', '184');
INSERT INTO `ylrc_msg_log` VALUES ('696', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '0', '7', '184');
INSERT INTO `ylrc_msg_log` VALUES ('697', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '0', '8', '184');
INSERT INTO `ylrc_msg_log` VALUES ('698', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '0', '3', '184');
INSERT INTO `ylrc_msg_log` VALUES ('699', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '0', '2', '184');
INSERT INTO `ylrc_msg_log` VALUES ('700', '2020-08-16 18:41:29', '2020-08-16 18:41:29', '0', '9', '184');
INSERT INTO `ylrc_msg_log` VALUES ('701', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '1', '1', '185');
INSERT INTO `ylrc_msg_log` VALUES ('702', '2020-08-16 18:42:44', '2020-08-23 20:38:04', '1', '4', '185');
INSERT INTO `ylrc_msg_log` VALUES ('703', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '0', '5', '185');
INSERT INTO `ylrc_msg_log` VALUES ('704', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '0', '6', '185');
INSERT INTO `ylrc_msg_log` VALUES ('705', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '0', '7', '185');
INSERT INTO `ylrc_msg_log` VALUES ('706', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '0', '8', '185');
INSERT INTO `ylrc_msg_log` VALUES ('707', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '0', '3', '185');
INSERT INTO `ylrc_msg_log` VALUES ('708', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '0', '2', '185');
INSERT INTO `ylrc_msg_log` VALUES ('709', '2020-08-16 18:42:44', '2020-08-16 18:42:44', '0', '9', '185');
INSERT INTO `ylrc_msg_log` VALUES ('710', '2020-08-16 18:44:12', '2020-08-16 18:44:12', '0', '5', '186');
INSERT INTO `ylrc_msg_log` VALUES ('711', '2020-08-16 18:44:14', '2020-08-16 18:44:14', '0', '5', '187');
INSERT INTO `ylrc_msg_log` VALUES ('712', '2020-08-16 18:44:16', '2020-08-16 18:44:16', '0', '5', '188');
INSERT INTO `ylrc_msg_log` VALUES ('713', '2020-08-20 21:38:12', '2020-08-20 21:38:12', '0', '10', '189');
INSERT INTO `ylrc_msg_log` VALUES ('714', '2020-08-23 20:38:03', '2020-08-23 20:38:03', '1', '1', '190');
INSERT INTO `ylrc_msg_log` VALUES ('715', '2020-08-23 20:38:03', '2020-08-23 20:38:03', '1', '1', '191');
INSERT INTO `ylrc_msg_log` VALUES ('716', '2020-08-23 20:38:04', '2020-08-23 20:38:04', '1', '1', '192');
INSERT INTO `ylrc_msg_log` VALUES ('717', '2020-08-23 20:38:04', '2020-08-23 20:38:04', '1', '1', '193');
INSERT INTO `ylrc_msg_log` VALUES ('718', '2020-08-23 20:38:26', '2020-08-23 20:38:26', '1', '1', '194');
INSERT INTO `ylrc_msg_log` VALUES ('719', '2020-08-23 20:43:50', '2020-08-23 20:43:50', '1', '4', '195');
INSERT INTO `ylrc_msg_log` VALUES ('720', '2020-08-23 20:44:24', '2020-08-23 20:44:24', '1', '1', '196');
INSERT INTO `ylrc_msg_log` VALUES ('721', '2020-08-23 20:47:04', '2020-08-23 20:47:04', '1', '4', '197');
INSERT INTO `ylrc_msg_log` VALUES ('722', '2020-08-23 20:49:45', '2020-08-23 20:49:45', '1', '1', '198');
INSERT INTO `ylrc_msg_log` VALUES ('723', '2020-08-23 20:49:50', '2020-08-23 20:49:50', '1', '1', '199');
INSERT INTO `ylrc_msg_log` VALUES ('724', '2020-08-23 20:50:02', '2020-08-23 20:50:02', '1', '1', '200');
INSERT INTO `ylrc_msg_log` VALUES ('725', '2020-08-23 20:50:39', '2020-08-23 20:50:39', '1', '4', '201');
INSERT INTO `ylrc_msg_log` VALUES ('726', '2020-08-23 20:50:46', '2020-08-23 20:50:46', '1', '4', '202');
INSERT INTO `ylrc_msg_log` VALUES ('727', '2020-08-23 20:51:01', '2020-08-23 20:51:01', '1', '4', '203');
INSERT INTO `ylrc_msg_log` VALUES ('728', '2020-08-23 20:51:12', '2020-08-23 20:51:12', '1', '1', '204');
INSERT INTO `ylrc_msg_log` VALUES ('729', '2020-08-23 20:51:44', '2020-08-23 20:51:44', '1', '1', '205');
INSERT INTO `ylrc_msg_log` VALUES ('730', '2020-08-23 20:52:23', '2020-08-23 20:52:23', '1', '1', '206');
INSERT INTO `ylrc_msg_log` VALUES ('731', '2020-08-23 20:54:03', '2020-08-23 20:54:03', '1', '1', '207');
INSERT INTO `ylrc_msg_log` VALUES ('732', '2020-08-23 20:54:22', '2020-08-23 20:54:22', '1', '1', '208');
INSERT INTO `ylrc_msg_log` VALUES ('733', '2020-08-23 20:54:37', '2020-08-23 20:54:37', '1', '4', '209');
INSERT INTO `ylrc_msg_log` VALUES ('734', '2020-08-23 20:55:32', '2020-08-23 20:55:32', '1', '4', '210');
INSERT INTO `ylrc_msg_log` VALUES ('735', '2020-08-23 20:57:22', '2020-08-23 20:57:22', '1', '1', '211');
INSERT INTO `ylrc_msg_log` VALUES ('736', '2020-08-23 20:59:10', '2020-08-23 20:59:10', '1', '1', '212');
INSERT INTO `ylrc_msg_log` VALUES ('737', '2020-08-24 21:43:37', '2020-08-24 21:43:37', '1', '1', '213');
INSERT INTO `ylrc_msg_log` VALUES ('738', '2020-08-24 21:43:39', '2020-08-24 21:43:39', '1', '1', '214');
INSERT INTO `ylrc_msg_log` VALUES ('739', '2020-08-24 21:44:15', '2020-08-24 21:44:15', '1', '1', '215');
INSERT INTO `ylrc_msg_log` VALUES ('740', '2020-08-24 21:44:27', '2020-08-24 21:44:27', '1', '1', '216');
INSERT INTO `ylrc_msg_log` VALUES ('741', '2020-08-24 21:44:43', '2020-08-24 21:44:43', '1', '1', '217');
INSERT INTO `ylrc_msg_log` VALUES ('742', '2020-08-24 21:45:45', '2020-08-24 21:45:45', '1', '1', '218');
INSERT INTO `ylrc_msg_log` VALUES ('743', '2020-08-24 21:46:36', '2020-08-24 21:46:36', '1', '1', '219');
INSERT INTO `ylrc_msg_log` VALUES ('744', '2020-08-24 21:46:36', '2020-08-24 21:46:36', '1', '1', '220');
INSERT INTO `ylrc_msg_log` VALUES ('745', '2020-08-24 21:46:50', '2020-08-24 21:46:50', '1', '1', '221');
INSERT INTO `ylrc_msg_log` VALUES ('746', '2020-08-24 21:46:51', '2020-08-24 21:46:51', '1', '1', '222');
INSERT INTO `ylrc_msg_log` VALUES ('747', '2020-08-24 21:46:53', '2020-08-24 21:46:53', '1', '1', '223');
INSERT INTO `ylrc_msg_log` VALUES ('748', '2020-08-24 21:47:13', '2020-08-24 21:47:13', '1', '14', '224');
INSERT INTO `ylrc_msg_log` VALUES ('749', '2020-08-24 21:47:24', '2020-08-24 21:47:24', '1', '1', '225');
INSERT INTO `ylrc_msg_log` VALUES ('750', '2020-08-24 21:47:37', '2020-08-24 21:47:37', '1', '14', '226');
INSERT INTO `ylrc_msg_log` VALUES ('751', '2020-08-24 21:48:33', '2020-08-24 21:48:33', '0', '4', '227');
INSERT INTO `ylrc_msg_log` VALUES ('752', '2020-08-24 21:48:33', '2020-08-24 21:48:33', '0', '7', '227');
INSERT INTO `ylrc_msg_log` VALUES ('753', '2020-08-24 21:48:33', '2020-08-24 21:48:33', '0', '8', '227');
INSERT INTO `ylrc_msg_log` VALUES ('754', '2020-08-24 21:48:33', '2020-08-24 21:48:33', '1', '1', '227');
INSERT INTO `ylrc_msg_log` VALUES ('755', '2020-08-24 21:48:35', '2020-08-24 21:48:35', '0', '4', '228');
INSERT INTO `ylrc_msg_log` VALUES ('756', '2020-08-24 21:48:35', '2020-08-24 21:48:35', '0', '7', '228');
INSERT INTO `ylrc_msg_log` VALUES ('757', '2020-08-24 21:48:35', '2020-08-24 21:48:35', '0', '8', '228');
INSERT INTO `ylrc_msg_log` VALUES ('758', '2020-08-24 21:48:35', '2020-08-24 21:48:35', '1', '1', '228');
INSERT INTO `ylrc_msg_log` VALUES ('759', '2020-08-24 21:48:45', '2020-08-24 21:48:45', '0', '4', '229');
INSERT INTO `ylrc_msg_log` VALUES ('760', '2020-08-24 21:48:45', '2020-08-24 21:48:45', '0', '7', '229');
INSERT INTO `ylrc_msg_log` VALUES ('761', '2020-08-24 21:48:45', '2020-08-24 21:48:45', '0', '8', '229');
INSERT INTO `ylrc_msg_log` VALUES ('762', '2020-08-24 21:48:45', '2020-08-24 21:48:45', '1', '14', '229');

-- ----------------------------
-- Table structure for `ylrc_operater_log`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_operater_log`;
CREATE TABLE `ylrc_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_operater_log
-- ----------------------------
INSERT INTO `ylrc_operater_log` VALUES ('172', '2020-03-22 14:49:22', '2020-03-22 14:49:22', '编辑角色【超级管理员】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('173', '2020-03-22 14:58:14', '2020-03-22 14:58:14', '用户【南昌拌粉】于【2020-03-22 14:58:13】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('174', '2020-03-22 15:09:49', '2020-03-22 15:09:49', '用户【南昌拌粉】于【2020-03-22 15:09:49】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('175', '2020-03-22 15:11:09', '2020-03-22 15:11:09', '用户【南昌拌粉】于【2020-03-22 15:11:08】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('176', '2020-03-22 15:13:41', '2020-03-22 15:13:41', '编辑菜单信息【Menu [name=备份, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=add(\'/database_bak/add\'), icon=mdi-database-plus, sort=17, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('177', '2020-03-22 16:16:31', '2020-03-22 16:16:31', '用户【南昌拌粉】于【2020-03-22 16:16:31】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('178', '2020-03-22 16:31:23', '2020-03-22 16:31:23', '用户【南昌拌粉】于【2020-03-22 16:31:23】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('179', '2020-03-22 16:56:25', '2020-03-22 16:56:25', '用户【南昌拌粉】于【2020-03-22 16:56:25】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('180', '2020-03-22 17:00:42', '2020-03-22 17:00:42', '用户【南昌拌粉】于【2020-03-22 17:00:42】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('181', '2020-03-22 17:13:01', '2020-03-22 17:13:01', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('182', '2020-03-22 17:15:04', '2020-03-22 17:15:04', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322171504.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('183', '2020-03-22 17:15:14', '2020-03-22 17:15:14', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322171514.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('184', '2020-03-22 17:21:02', '2020-03-22 17:21:02', '用户【南昌拌粉】于【2020-03-22 17:21:02】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('185', '2020-03-22 17:21:15', '2020-03-22 17:21:15', '添加角色【dsadsasadsa】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('186', '2020-03-22 18:09:55', '2020-03-22 18:09:55', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322180955.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('187', '2020-03-22 18:59:16', '2020-03-22 18:59:16', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322185916.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('188', '2020-03-22 18:59:41', '2020-03-22 18:59:41', '数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322180955.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('189', '2020-03-22 19:12:03', '2020-03-22 19:12:03', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322191203.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('190', '2020-03-22 19:12:59', '2020-03-22 19:12:59', '数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322191203.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('191', '2020-03-22 19:35:07', '2020-03-22 19:35:07', '用户【南昌拌粉】于【2020-03-22 19:35:07】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('192', '2020-03-22 19:35:21', '2020-03-22 19:35:21', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193521.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('193', '2020-03-22 19:36:20', '2020-03-22 19:36:20', '添加菜单信息【Menu [name=还原, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=19, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('194', '2020-03-22 19:36:34', '2020-03-22 19:36:34', '编辑角色【超级管理员】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('195', '2020-03-22 19:36:47', '2020-03-22 19:36:47', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193647.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('196', '2020-03-22 19:37:21', '2020-03-22 19:37:21', '数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322193647.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('197', '2020-03-22 19:37:54', '2020-03-22 19:37:54', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193754.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('198', '2020-03-22 19:38:15', '2020-03-22 19:38:15', '数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322193754.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('199', '2020-03-22 19:43:34', '2020-03-22 19:43:34', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194334.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('200', '2020-03-22 19:43:39', '2020-03-22 19:43:39', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194339.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('201', '2020-03-22 19:43:44', '2020-03-22 19:43:44', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194344.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('202', '2020-03-22 19:43:49', '2020-03-22 19:43:49', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194349.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('203', '2020-03-22 19:43:52', '2020-03-22 19:43:52', '用户【南昌拌粉】于【2020-03-22 19:43:52】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('204', '2020-03-22 19:43:54', '2020-03-22 19:43:54', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194354.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('205', '2020-03-22 19:43:59', '2020-03-22 19:43:59', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194359.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('206', '2020-03-22 19:44:04', '2020-03-22 19:44:04', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194404.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('207', '2020-03-22 19:44:09', '2020-03-22 19:44:09', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194409.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('208', '2020-03-22 19:44:14', '2020-03-22 19:44:14', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194414.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('209', '2020-03-22 19:44:19', '2020-03-22 19:44:19', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194419.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('210', '2020-03-22 19:44:24', '2020-03-22 19:44:24', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194424.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('211', '2020-03-22 19:44:29', '2020-03-22 19:44:29', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194429.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('212', '2020-03-22 19:44:34', '2020-03-22 19:44:34', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194434.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('213', '2020-03-22 19:44:39', '2020-03-22 19:44:39', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194439.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('214', '2020-03-22 21:11:19', '2020-03-22 21:11:19', '用户【南昌拌粉】于【2020-03-22 21:11:19】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('215', '2020-03-22 21:18:12', '2020-03-22 21:18:12', '用户【南昌拌粉】于【2020-03-22 21:18:11】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('216', '2020-03-22 21:36:47', '2020-03-22 21:36:47', '用户【南昌拌粉】于【2020-03-22 21:36:47】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('217', '2020-03-22 21:43:51', '2020-03-22 21:43:51', '用户【南昌拌粉】于【2020-03-22 21:43:51】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('218', '2020-03-23 17:41:23', '2020-03-23 17:41:23', '用户【南昌拌粉】于【2020-03-23 17:41:23】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('219', '2020-03-23 17:41:49', '2020-03-23 17:41:49', '添加菜单信息【Menu [name=sdadsa递四方速递, parent=null, url=https://www.yuanlrc.com/, icon=mdi-alarm-snooze, sort=0, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('220', '2020-03-23 17:42:02', '2020-03-23 17:42:02', '编辑菜单信息【Menu [name=sdadsa递四方速递, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=https://www.yuanlrc.com/, icon=mdi-alarm-snooze, sort=3, isButton=false, isShow=false]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('221', '2020-03-23 17:42:09', '2020-03-23 17:42:09', '删除菜单信息，菜单ID【27】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('222', '2020-03-23 17:42:32', '2020-03-23 17:42:32', '编辑角色【sdfds水电费多少】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('223', '2020-03-23 17:42:45', '2020-03-23 17:42:45', '编辑角色【sdfds水电费多少】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('224', '2020-03-23 17:42:56', '2020-03-23 17:42:56', '删除角色ID【7】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('225', '2020-03-23 17:43:16', '2020-03-23 17:43:16', '添加角色【撒旦撒】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('226', '2020-03-23 17:43:29', '2020-03-23 17:43:29', '删除角色ID【8】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('227', '2020-03-23 17:44:11', '2020-03-23 17:44:11', '添加用户，用户名：打撒大撒', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('228', '2020-03-23 17:44:29', '2020-03-23 17:44:29', '编辑用户，用户名：打撒大撒22', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('229', '2020-03-23 17:44:37', '2020-03-23 17:44:37', '添加用户，用户ID：6', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('230', '2020-03-23 17:44:55', '2020-03-23 17:44:55', '添加用户，用户ID：4', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('231', '2020-03-23 17:45:47', '2020-03-23 17:45:47', '编辑用户，用户名：小刘同志', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('232', '2020-03-23 17:46:49', '2020-03-23 17:46:49', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200323174649.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('233', '2020-03-23 17:47:16', '2020-03-23 17:47:16', '数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200323174649.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('234', '2020-03-23 17:48:15', '2020-03-23 17:48:15', '用户【测试账号】于【2020-03-23 17:48:15】登录系统！', '测试账号');
INSERT INTO `ylrc_operater_log` VALUES ('235', '2020-03-23 17:49:00', '2020-03-23 17:49:00', '编辑角色【测试角色】', '测试账号');
INSERT INTO `ylrc_operater_log` VALUES ('236', '2020-03-23 17:49:50', '2020-03-23 17:49:50', '用户【南昌拌粉】于【2020-03-23 17:49:50】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('237', '2020-03-23 17:50:03', '2020-03-23 17:50:03', '编辑用户，用户名：小刘同志', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('238', '2020-03-23 17:50:19', '2020-03-23 17:50:19', '编辑用户，用户名：小刘同志', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('239', '2020-03-23 17:50:56', '2020-03-23 17:50:56', '用户【南昌拌粉】于【2020-03-23 17:50:56】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('240', '2020-07-11 11:26:40', '2020-07-11 11:26:40', '用户【南昌拌粉】于【2020-07-11 11:26:39】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('241', '2020-07-11 11:33:39', '2020-07-11 11:33:39', '编辑菜单信息【Menu [name=菜单管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/menu/list, icon=mdi-view-list, sort=1, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('242', '2020-07-11 11:34:19', '2020-07-11 11:34:19', '编辑菜单信息【Menu [name=新增, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/menu/add, icon=mdi-plus, sort=2, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('243', '2020-07-11 11:34:30', '2020-07-11 11:34:30', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/menu/edit\'), icon=mdi-grease-pencil, sort=3, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('244', '2020-07-11 11:56:16', '2020-07-11 11:56:16', '用户【南昌拌粉】于【2020-07-11 11:56:16】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('245', '2020-07-11 15:21:49', '2020-07-11 15:21:49', '用户【南昌拌粉】于【2020-07-11 15:21:49】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('246', '2020-07-11 15:39:25', '2020-07-11 15:39:25', '用户【南昌拌粉】于【2020-07-11 15:39:25】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('247', '2020-07-11 16:44:26', '2020-07-11 16:44:26', '用户【南昌拌粉】于【2020-07-11 16:44:26】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('248', '2020-07-11 16:45:09', '2020-07-11 16:45:09', '用户【南昌拌粉】于【2020-07-11 16:45:09】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('249', '2020-07-11 19:47:59', '2020-07-11 19:47:59', '用户【南昌拌粉】于【2020-07-11 19:47:59】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('250', '2020-07-11 20:02:28', '2020-07-11 20:02:28', '用户【南昌拌粉】于【2020-07-11 20:02:27】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('251', '2020-07-11 21:25:41', '2020-07-11 21:25:41', '用户【南昌拌粉】于【2020-07-11 21:25:41】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('252', '2020-07-11 22:30:17', '2020-07-11 22:30:17', '用户【南昌拌粉】于【2020-07-11 22:30:17】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('253', '2020-07-11 22:34:49', '2020-07-11 22:34:49', '用户【南昌拌粉】于【2020-07-11 22:34:49】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('254', '2020-07-11 22:36:27', '2020-07-11 22:36:27', '用户【南昌拌粉】于【2020-07-11 22:36:27】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('255', '2020-07-11 22:41:07', '2020-07-11 22:41:07', '用户【南昌拌粉】于【2020-07-11 22:41:07】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('256', '2020-07-11 23:48:13', '2020-07-11 23:48:13', '用户【南昌拌粉】于【2020-07-11 23:48:13】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('257', '2020-07-11 23:54:06', '2020-07-11 23:54:06', '用户【南昌拌粉】于【2020-07-11 23:54:06】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('258', '2020-07-12 00:25:22', '2020-07-12 00:25:22', '用户【南昌拌粉】于【2020-07-12 00:25:22】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('259', '2020-07-12 00:30:25', '2020-07-12 00:30:25', '用户【南昌拌粉】于【2020-07-12 00:30:25】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('260', '2020-07-12 00:30:58', '2020-07-12 00:30:58', '用户【南昌拌粉】于【2020-07-12 00:30:58】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('261', '2020-07-12 00:31:08', '2020-07-12 00:31:08', '用户【南昌拌粉】于【2020-07-12 00:31:08】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('262', '2020-07-12 00:31:58', '2020-07-12 00:31:58', '用户【南昌拌粉】于【2020-07-12 00:31:58】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('263', '2020-07-12 00:32:10', '2020-07-12 00:32:10', '用户【南昌拌粉】于【2020-07-12 00:32:10】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('264', '2020-07-12 00:32:35', '2020-07-12 00:32:35', '用户【南昌拌粉】于【2020-07-12 00:32:35】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('265', '2020-07-12 00:32:46', '2020-07-12 00:32:46', '用户【南昌拌粉】于【2020-07-12 00:32:46】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('266', '2020-07-12 00:33:39', '2020-07-12 00:33:39', '用户【小明同学】于【2020-07-12 00:33:39】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('267', '2020-07-12 00:33:46', '2020-07-12 00:33:46', '用户【小明同学】于【2020-07-12 00:33:46】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('268', '2020-07-12 00:34:27', '2020-07-12 00:34:27', '用户【南昌拌粉1】于【2020-07-12 00:34:27】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('269', '2020-07-12 00:34:49', '2020-07-12 00:34:49', '用户【小明同学】于【2020-07-12 00:34:49】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('270', '2020-07-12 00:34:57', '2020-07-12 00:34:57', '用户【小明同学】于【2020-07-12 00:34:57】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('271', '2020-07-12 01:00:00', '2020-07-12 01:00:00', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_chatonline_20200712010000.sql, filepath=E:/workspace-test/chatonline/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('272', '2020-07-12 12:02:15', '2020-07-12 12:02:15', '用户【南昌拌粉】于【2020-07-12 12:02:15】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('273', '2020-07-12 12:25:40', '2020-07-12 12:25:40', '用户【南昌拌粉】于【2020-07-12 12:25:40】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('274', '2020-07-12 13:05:34', '2020-07-12 13:05:34', '用户【南昌拌粉】于【2020-07-12 13:05:34】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('275', '2020-07-12 13:05:52', '2020-07-12 13:05:52', '用户【南昌拌粉】于【2020-07-12 13:05:52】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('276', '2020-07-12 13:06:13', '2020-07-12 13:06:13', '用户【南昌拌粉】于【2020-07-12 13:06:13】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('277', '2020-07-12 14:21:25', '2020-07-12 14:21:25', '用户【aaaa】于【2020-07-12 14:21:25】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('278', '2020-07-12 14:21:50', '2020-07-12 14:21:50', '用户【aaa1】于【2020-07-12 14:21:50】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('279', '2020-07-12 14:22:02', '2020-07-12 14:22:02', '用户【aaa2】于【2020-07-12 14:22:02】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('280', '2020-07-12 14:22:13', '2020-07-12 14:22:13', '用户【aaa3】于【2020-07-12 14:22:13】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('281', '2020-07-12 14:22:22', '2020-07-12 14:22:22', '用户【aaa4】于【2020-07-12 14:22:22】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('282', '2020-07-12 14:22:39', '2020-07-12 14:22:39', '用户【aaa5】于【2020-07-12 14:22:39】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('283', '2020-07-12 16:11:58', '2020-07-12 16:11:58', '用户【南昌拌粉】于【2020-07-12 16:11:57】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('284', '2020-07-12 17:01:02', '2020-07-12 17:01:02', '用户【南昌拌粉】于【2020-07-12 17:01:02】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('285', '2020-07-12 17:04:28', '2020-07-12 17:04:28', '用户【南昌拌粉】于【2020-07-12 17:04:28】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('286', '2020-07-12 17:33:04', '2020-07-12 17:33:04', '用户【南昌拌粉】于【2020-07-12 17:33:04】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('287', '2020-07-12 17:37:22', '2020-07-12 17:37:22', '用户【aaa1】于【2020-07-12 17:37:22】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('288', '2020-07-12 17:53:48', '2020-07-12 17:53:48', '用户【南昌拌粉】于【2020-07-12 17:53:48】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('289', '2020-07-12 17:57:06', '2020-07-12 17:57:06', '用户【aaa2】于【2020-07-12 17:57:06】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('290', '2020-07-12 17:57:45', '2020-07-12 17:57:45', '用户【aaa1】于【2020-07-12 17:57:45】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('291', '2020-07-12 17:59:39', '2020-07-12 17:59:39', '用户【aaa1】于【2020-07-12 17:59:39】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('292', '2020-07-12 18:15:11', '2020-07-12 18:15:11', '用户【南昌拌粉】于【2020-07-12 18:15:11】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('293', '2020-07-12 18:15:38', '2020-07-12 18:15:38', '用户【aaa1】于【2020-07-12 18:15:38】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('294', '2020-07-12 19:42:44', '2020-07-12 19:42:44', '用户【aaa1】于【2020-07-12 19:42:44】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('295', '2020-07-12 20:17:36', '2020-07-12 20:17:36', '用户【南昌拌粉】于【2020-07-12 20:17:35】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('296', '2020-07-12 20:17:51', '2020-07-12 20:17:51', '用户【aaa1】于【2020-07-12 20:17:51】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('297', '2020-07-12 20:31:56', '2020-07-12 20:31:56', '用户【aaa2】于【2020-07-12 20:31:56】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('298', '2020-07-12 20:38:09', '2020-07-12 20:38:09', '用户【aaaa】于【2020-07-12 20:38:09】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('299', '2020-07-12 20:38:46', '2020-07-12 20:38:46', '用户【aaa3】于【2020-07-12 20:38:46】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('300', '2020-07-12 20:43:33', '2020-07-12 20:43:33', '用户【秦时明月】于【2020-07-12 20:43:33】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('301', '2020-07-12 20:44:52', '2020-07-12 20:44:52', '用户【秦时明月】于【2020-07-12 20:44:52】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('302', '2020-07-12 20:46:04', '2020-07-12 20:46:04', '用户【秦时明月】于【2020-07-12 20:46:04】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('303', '2020-07-12 20:46:23', '2020-07-12 20:46:23', '用户【秦时明月】于【2020-07-12 20:46:23】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('304', '2020-07-12 20:46:35', '2020-07-12 20:46:35', '用户【秦时明月】于【2020-07-12 20:46:34】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('305', '2020-07-12 20:46:55', '2020-07-12 20:46:55', '用户【秦时明月】于【2020-07-12 20:46:55】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('306', '2020-07-12 20:54:01', '2020-07-12 20:54:01', '用户【南昌拌粉】于【2020-07-12 20:54:01】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('307', '2020-07-12 20:54:23', '2020-07-12 20:54:23', '用户【aaaa】于【2020-07-12 20:54:23】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('308', '2020-07-12 20:56:01', '2020-07-12 20:56:01', '用户【小张同学】于【2020-07-12 20:56:01】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('309', '2020-07-12 20:56:29', '2020-07-12 20:56:29', '用户【aaa1】于【2020-07-12 20:56:29】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('310', '2020-07-12 20:58:46', '2020-07-12 20:58:46', '用户【慢慢来会比较快】于【2020-07-12 20:58:46】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('311', '2020-07-12 20:59:05', '2020-07-12 20:59:05', '用户【aaa2】于【2020-07-12 20:59:05】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('312', '2020-07-12 21:00:26', '2020-07-12 21:00:26', '用户【舍我其谁】于【2020-07-12 21:00:26】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('313', '2020-07-12 21:00:59', '2020-07-12 21:00:59', '用户【aaa4】于【2020-07-12 21:00:59】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('314', '2020-07-12 21:10:00', '2020-07-12 21:10:00', '用户【雄霸天下】于【2020-07-12 21:10:00】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('315', '2020-07-12 21:10:42', '2020-07-12 21:10:42', '用户【aaa5】于【2020-07-12 21:10:42】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('316', '2020-07-12 21:11:56', '2020-07-12 21:11:56', '用户【天下霸唱】于【2020-07-12 21:11:56】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('317', '2020-07-12 21:11:57', '2020-07-12 21:11:57', '用户【天下霸唱】于【2020-07-12 21:11:57】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('318', '2020-07-12 21:12:02', '2020-07-12 21:12:02', '用户【天下霸唱】于【2020-07-12 21:12:02】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('319', '2020-07-12 21:18:54', '2020-07-12 21:18:54', '用户【南昌拌粉】于【2020-07-12 21:18:54】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('320', '2020-07-12 21:19:52', '2020-07-12 21:19:52', '用户【天下霸唱】于【2020-07-12 21:19:52】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('321', '2020-07-12 21:20:31', '2020-07-12 21:20:31', '用户【天下霸唱】于【2020-07-12 21:20:31】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('322', '2020-07-12 21:23:16', '2020-07-12 21:23:16', '用户【雄霸天下】于【2020-07-12 21:23:16】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('323', '2020-07-12 21:23:31', '2020-07-12 21:23:31', '用户【雄霸天下】于【2020-07-12 21:23:31】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('324', '2020-07-12 21:25:11', '2020-07-12 21:25:11', '用户【雄霸天下】于【2020-07-12 21:25:11】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('325', '2020-07-12 21:25:29', '2020-07-12 21:25:29', '用户【小张同学】于【2020-07-12 21:25:29】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('326', '2020-07-12 21:25:56', '2020-07-12 21:25:56', '用户【小张同学】于【2020-07-12 21:25:56】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('327', '2020-07-12 21:26:11', '2020-07-12 21:26:11', '用户【小张同学】于【2020-07-12 21:26:11】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('328', '2020-07-12 21:26:46', '2020-07-12 21:26:46', '用户【慢慢来会比较快】于【2020-07-12 21:26:46】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('329', '2020-07-12 21:27:07', '2020-07-12 21:27:07', '用户【慢慢来会比较快】于【2020-07-12 21:27:07】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('330', '2020-07-12 21:27:56', '2020-07-12 21:27:56', '用户【秦时明月】于【2020-07-12 21:27:56】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('331', '2020-07-12 21:28:03', '2020-07-12 21:28:03', '用户【秦时明月】于【2020-07-12 21:28:03】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('332', '2020-07-12 21:28:08', '2020-07-12 21:28:08', '用户【秦时明月】于【2020-07-12 21:28:08】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('333', '2020-07-12 21:28:41', '2020-07-12 21:28:41', '用户【天下霸唱】于【2020-07-12 21:28:41】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('334', '2020-07-12 21:28:47', '2020-07-12 21:28:47', '用户【天下霸唱】于【2020-07-12 21:28:47】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('335', '2020-07-12 21:29:07', '2020-07-12 21:29:07', '用户【雄霸天下】于【2020-07-12 21:29:07】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('336', '2020-07-12 21:33:50', '2020-07-12 21:33:50', '用户【雄霸天下】于【2020-07-12 21:33:50】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('337', '2020-07-12 21:34:08', '2020-07-12 21:34:08', '用户【小明同学】于【2020-07-12 21:34:08】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('338', '2020-07-13 15:58:24', '2020-07-13 15:58:24', '用户【南昌拌粉】于【2020-07-13 15:58:24】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('339', '2020-07-13 16:57:56', '2020-07-13 16:57:56', '用户【南昌拌粉】于【2020-07-13 16:57:56】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('340', '2020-07-13 17:05:41', '2020-07-13 17:05:41', '用户【南昌拌粉】于【2020-07-13 17:05:41】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('341', '2020-07-14 10:23:03', '2020-07-14 10:23:03', '用户【南昌拌粉】于【2020-07-14 10:23:03】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('342', '2020-07-14 14:24:08', '2020-07-14 14:24:08', '用户【南昌拌粉】于【2020-07-14 14:24:08】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('343', '2020-07-14 15:31:32', '2020-07-14 15:31:32', '用户【南昌拌粉】于【2020-07-14 15:31:32】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('344', '2020-07-14 15:35:46', '2020-07-14 15:35:46', '用户【南昌拌粉】于【2020-07-14 15:35:46】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('345', '2020-07-14 15:40:13', '2020-07-14 15:40:13', '用户【南昌拌粉】于【2020-07-14 15:40:13】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('346', '2020-07-14 15:45:05', '2020-07-14 15:45:05', '用户【南昌拌粉】于【2020-07-14 15:45:05】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('347', '2020-07-15 09:55:40', '2020-07-15 09:55:40', '用户【南昌拌粉】于【2020-07-15 09:55:40】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('348', '2020-07-15 16:32:06', '2020-07-15 16:32:06', '用户【南昌拌粉】于【2020-07-15 16:32:06】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('349', '2020-07-15 16:35:11', '2020-07-15 16:35:11', '用户【小明同学】于【2020-07-15 16:35:11】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('350', '2020-07-15 16:43:48', '2020-07-15 16:43:48', '用户【小张同学】于【2020-07-15 16:43:48】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('351', '2020-07-15 17:04:50', '2020-07-15 17:04:50', '用户【慢慢来会比较快】于【2020-07-15 17:04:50】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('352', '2020-07-15 17:07:11', '2020-07-15 17:07:11', '用户【舍我其谁】于【2020-07-15 17:07:11】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('353', '2020-07-15 17:07:52', '2020-07-15 17:07:52', '用户【秦时明月】于【2020-07-15 17:07:52】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('354', '2020-07-15 17:08:13', '2020-07-15 17:08:13', '用户【雄霸天下】于【2020-07-15 17:08:13】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('355', '2020-07-15 17:08:32', '2020-07-15 17:08:32', '用户【天下霸唱】于【2020-07-15 17:08:32】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('356', '2020-07-15 20:49:21', '2020-07-15 20:49:21', '用户【南昌拌粉】于【2020-07-15 20:49:21】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('357', '2020-07-15 21:47:14', '2020-07-15 21:47:14', '用户【南昌拌粉】于【2020-07-15 21:47:14】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('358', '2020-07-16 11:48:51', '2020-07-16 11:48:51', '用户【南昌拌粉】于【2020-07-16 11:48:51】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('359', '2020-07-16 12:09:01', '2020-07-16 12:09:01', '用户【南昌拌粉】于【2020-07-16 12:09:01】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('360', '2020-07-16 13:10:35', '2020-07-16 13:10:35', '用户【南昌拌粉】于【2020-07-16 13:10:35】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('361', '2020-07-16 19:19:04', '2020-07-16 19:19:04', '用户【南昌拌粉】于【2020-07-16 19:19:04】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('362', '2020-07-17 15:27:15', '2020-07-17 15:27:15', '用户【南昌拌粉】于【2020-07-17 15:27:15】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('363', '2020-07-17 16:40:30', '2020-07-17 16:40:30', '用户【南昌拌粉】于【2020-07-17 16:40:30】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('364', '2020-07-17 18:30:22', '2020-07-17 18:30:22', '用户【南昌拌粉】于【2020-07-17 18:30:22】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('365', '2020-07-19 23:07:11', '2020-07-19 23:07:11', '用户【南昌拌粉】于【2020-07-19 23:07:11】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('366', '2020-07-20 20:23:25', '2020-07-20 20:23:25', '用户【南昌拌粉】于【2020-07-20 20:23:25】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('367', '2020-07-21 21:23:56', '2020-07-21 21:23:56', '用户【南昌拌粉】于【2020-07-21 21:23:56】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('368', '2020-07-21 22:39:28', '2020-07-21 22:39:28', '用户【慢慢来会比较快】于【2020-07-21 22:39:28】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('369', '2020-07-21 22:39:58', '2020-07-21 22:39:58', '用户【南昌拌粉】于【2020-07-21 22:39:58】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('370', '2020-07-22 20:36:17', '2020-07-22 20:36:17', '用户【南昌拌粉】于【2020-07-22 20:36:17】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('371', '2020-07-22 21:41:53', '2020-07-22 21:41:53', '用户【南昌拌粉】于【2020-07-22 21:41:53】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('372', '2020-07-22 22:15:09', '2020-07-22 22:15:09', '用户【小明同学】于【2020-07-22 22:15:09】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('373', '2020-07-22 22:44:34', '2020-07-22 22:44:34', '用户【南昌拌粉】于【2020-07-22 22:44:34】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('374', '2020-07-22 23:08:11', '2020-07-22 23:08:11', '用户【小明同学】于【2020-07-22 23:08:11】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('375', '2020-07-23 20:40:54', '2020-07-23 20:40:54', '用户【南昌拌粉】于【2020-07-23 20:40:54】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('376', '2020-07-23 21:52:16', '2020-07-23 21:52:16', '用户【南昌拌粉】于【2020-07-23 21:52:16】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('377', '2020-07-23 22:13:20', '2020-07-23 22:13:20', '用户【小明同学】于【2020-07-23 22:13:20】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('378', '2020-07-29 20:45:45', '2020-07-29 20:45:45', '用户【南昌拌粉】于【2020-07-29 20:45:45】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('379', '2020-07-29 20:48:23', '2020-07-29 20:48:23', '用户【南昌拌粉】于【2020-07-29 20:48:23】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('380', '2020-07-29 20:53:19', '2020-07-29 20:53:19', '用户【南昌拌粉】于【2020-07-29 20:53:19】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('381', '2020-07-29 21:09:02', '2020-07-29 21:09:02', '用户【南昌拌粉】于【2020-07-29 21:09:02】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('382', '2020-07-29 21:09:40', '2020-07-29 21:09:40', '用户【慢慢来会比较快】于【2020-07-29 21:09:40】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('383', '2020-07-29 21:32:02', '2020-07-29 21:32:02', '用户【朱波蕊蕊】于【2020-07-29 21:32:02】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('384', '2020-07-29 21:32:15', '2020-07-29 21:32:15', '用户【朱波蕊蕊】于【2020-07-29 21:32:15】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('385', '2020-07-29 21:33:04', '2020-07-29 21:33:04', '用户【朱波蕊蕊】于【2020-07-29 21:33:04】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('386', '2020-07-29 21:38:35', '2020-07-29 21:38:35', '用户【朱波蕊蕊】于【2020-07-29 21:38:35】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('387', '2020-07-29 21:44:51', '2020-07-29 21:44:51', '用户【朱波蕊蕊】于【2020-07-29 21:44:51】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('388', '2020-08-04 20:18:33', '2020-08-04 20:18:33', '用户【南昌拌粉】于【2020-08-04 20:18:33】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('389', '2020-08-04 20:40:42', '2020-08-04 20:40:42', '用户【小明同学】于【2020-08-04 20:40:42】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('390', '2020-08-04 21:22:27', '2020-08-04 21:22:27', '用户【南昌拌粉】于【2020-08-04 21:22:27】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('391', '2020-08-04 21:22:44', '2020-08-04 21:22:44', '用户【小明同学】于【2020-08-04 21:22:44】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('392', '2020-08-04 21:24:47', '2020-08-04 21:24:47', '用户【秦时明月】于【2020-08-04 21:24:47】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('393', '2020-08-04 21:31:09', '2020-08-04 21:31:09', '用户【秦时明月】于【2020-08-04 21:31:09】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('394', '2020-08-05 20:38:39', '2020-08-05 20:38:39', '用户【南昌拌粉】于【2020-08-05 20:38:39】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('395', '2020-08-05 20:42:06', '2020-08-05 20:42:06', '用户【小明同学】于【2020-08-05 20:42:06】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('396', '2020-08-05 20:51:59', '2020-08-05 20:51:59', '用户【小明同学】于【2020-08-05 20:51:59】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('397', '2020-08-05 20:54:11', '2020-08-05 20:54:11', '用户【慢慢来会比较快】于【2020-08-05 20:54:11】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('398', '2020-08-09 22:01:31', '2020-08-09 22:01:31', '用户【南昌拌粉】于【2020-08-09 22:01:31】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('399', '2020-08-15 15:11:01', '2020-08-15 15:11:01', '用户【南昌拌粉】于【2020-08-15 15:11:01】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('400', '2020-08-15 15:11:51', '2020-08-15 15:11:51', '用户【无影无踪】于【2020-08-15 15:11:51】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('401', '2020-08-15 15:11:59', '2020-08-15 15:11:59', '用户【无影无踪】于【2020-08-15 15:11:59】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('402', '2020-08-15 15:14:11', '2020-08-15 15:14:11', '用户【无影无踪】于【2020-08-15 15:14:11】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('403', '2020-08-15 19:21:48', '2020-08-15 19:21:48', '用户【南昌拌粉】于【2020-08-15 19:21:48】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('404', '2020-08-15 23:35:33', '2020-08-15 23:35:33', '用户【无影无踪】于【2020-08-15 23:35:33】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('405', '2020-08-16 01:00:00', '2020-08-16 01:00:00', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_chatonline_20200816010000.sql, filepath=E:/workspace-test/chatonline/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('406', '2020-08-16 15:19:34', '2020-08-16 15:19:34', '用户【南昌拌粉】于【2020-08-16 15:19:33】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('407', '2020-08-16 18:47:57', '2020-08-16 18:47:57', '用户【南昌拌粉】于【2020-08-16 18:47:57】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('408', '2020-08-16 20:27:27', '2020-08-16 20:27:27', '添加菜单信息【Menu [name=账号管理, parent=null, url=, icon=mdi-account-multiple, sort=0, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('409', '2020-08-16 20:27:40', '2020-08-16 20:27:40', '编辑菜单信息【Menu [name=账号管理, parent=null, url=, icon=mdi-account-multiple, sort=20, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('410', '2020-08-16 20:28:22', '2020-08-16 20:28:22', '添加菜单信息【Menu [name=账号列表, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/account/list, icon=mdi-account-multiple-outline, sort=21, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('411', '2020-08-16 20:34:00', '2020-08-16 20:34:00', '编辑菜单信息【Menu [name=聊天管理, parent=null, url=, icon=mdi-account-multiple, sort=20, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('412', '2020-08-16 20:35:11', '2020-08-16 20:35:11', '添加菜单信息【Menu [name=群组管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/account_group/list, icon=mdi-account-switch, sort=22, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('413', '2020-08-16 20:35:23', '2020-08-16 20:35:23', '编辑菜单信息【Menu [name=账号管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/account/list, icon=mdi-account-multiple-outline, sort=21, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('414', '2020-08-16 20:36:33', '2020-08-16 20:36:33', '添加菜单信息【Menu [name=消息管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/msg/list, icon=mdi-message-text, sort=23, isButton=false, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('415', '2020-08-16 20:38:12', '2020-08-16 20:38:12', '添加菜单信息【Menu [name=冻结, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/account/edit?status=-1\'), icon=mdi-account-remove, sort=24, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('416', '2020-08-16 20:39:30', '2020-08-16 20:39:30', '编辑菜单信息【Menu [name=冻结, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/account/edit?status=0\'), icon=mdi-account-remove, sort=24, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('417', '2020-08-16 20:40:20', '2020-08-16 20:40:20', '编辑菜单信息【Menu [name=冻结, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=freezeAccount(\'/admin/account/edit\'), icon=mdi-account-remove, sort=24, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('418', '2020-08-16 20:40:56', '2020-08-16 20:40:56', '添加菜单信息【Menu [name=解冻, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=unFreezeAccount(\'/admin/account/edit\'), icon=mdi-account-check, sort=25, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('419', '2020-08-16 20:43:32', '2020-08-16 20:43:32', '添加菜单信息【Menu [name=解散群组, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=destoryGroup(\'/admin/account_group/destory\'), icon=mdi-account-off, sort=25, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('420', '2020-08-16 20:44:45', '2020-08-16 20:44:45', '添加菜单信息【Menu [name=移除成员, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=deleteMember(\'/admin/account_group/delete_member\'), icon=mdi-account-minus, sort=26, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('421', '2020-08-16 20:45:45', '2020-08-16 20:45:45', '添加菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/msg/delete\'), icon=mdi-comment-remove-outline, sort=27, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('422', '2020-08-16 20:45:58', '2020-08-16 20:45:58', '编辑角色【超级管理员】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('423', '2020-08-16 20:46:11', '2020-08-16 20:46:11', '用户【南昌拌粉】于【2020-08-16 20:46:11】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('424', '2020-08-16 20:52:12', '2020-08-16 20:52:12', '用户【南昌拌粉】于【2020-08-16 20:52:12】登录成功！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('425', '2020-08-20 20:47:55', '2020-08-20 20:47:55', '用户【南昌拌粉】于【2020-08-20 20:47:55】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('426', '2020-08-20 21:06:34', '2020-08-20 21:06:34', '编辑菜单信息【Menu [name=查看详情, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=viewInfo(\'/admin/msg/view_info\'), icon=mdi-eye, sort=27, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('427', '2020-08-20 21:23:58', '2020-08-20 21:23:58', '用户【南昌拌粉】于【2020-08-20 21:23:58】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('428', '2020-08-20 21:28:24', '2020-08-20 21:28:24', '编辑菜单信息【Menu [name=移除成员, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=deleteMember(\'/admin/group/delete_member\'), icon=mdi-account-minus, sort=26, isButton=true, isShow=false]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('429', '2020-08-20 21:30:58', '2020-08-20 21:30:58', '添加菜单信息【Menu [name=查看群成员, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=viewMembers(\'/admin/group/view_member\'), icon=mdi-eye, sort=28, isButton=true, isShow=true]】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('430', '2020-08-20 21:31:05', '2020-08-20 21:31:05', '编辑角色【超级管理员】', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('431', '2020-08-20 21:31:16', '2020-08-20 21:31:16', '用户【南昌拌粉】于【2020-08-20 21:31:16】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('432', '2020-08-20 21:37:58', '2020-08-20 21:37:58', '用户【南昌拌粉】于【2020-08-20 21:37:58】登录成功！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('433', '2020-08-20 21:54:38', '2020-08-20 21:54:38', '用户【南昌拌粉】于【2020-08-20 21:54:38】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('434', '2020-08-23 13:57:02', '2020-08-23 13:57:02', '用户【南昌拌粉】于【2020-08-23 13:57:02】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('435', '2020-08-23 15:16:44', '2020-08-23 15:16:44', '用户【王金库T】于【2020-08-23 15:16:44】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('436', '2020-08-23 15:17:13', '2020-08-23 15:17:13', '用户【niyu】于【2020-08-23 15:17:13】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('437', '2020-08-23 15:17:43', '2020-08-23 15:17:43', '用户【苑鹏波Y】于【2020-08-23 15:17:43】注册成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('438', '2020-08-23 15:39:33', '2020-08-23 15:39:33', '用户【南昌拌粉】于【2020-08-23 15:39:33】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('439', '2020-08-23 16:23:51', '2020-08-23 16:23:51', '用户【南昌拌粉】于【2020-08-23 16:23:51】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('440', '2020-08-23 20:37:46', '2020-08-23 20:37:46', '用户【南昌拌粉】于【2020-08-23 20:37:46】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('441', '2020-08-23 20:38:02', '2020-08-23 20:38:02', '用户【慢慢来会比较快】于【2020-08-23 20:38:02】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('442', '2020-08-23 20:38:55', '2020-08-23 20:38:55', '用户【慢慢来会比较快】于【2020-08-23 20:38:55】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('443', '2020-08-23 20:39:12', '2020-08-23 20:39:12', '用户【慢慢来会比较快】于【2020-08-23 20:39:12】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('444', '2020-08-23 20:39:23', '2020-08-23 20:39:23', '用户【慢慢来会比较快】于【2020-08-23 20:39:23】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('445', '2020-08-23 20:44:01', '2020-08-23 20:44:01', '用户【南昌拌粉】于【2020-08-23 20:44:01】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('446', '2020-08-23 20:44:12', '2020-08-23 20:44:12', '用户【慢慢来会比较快】于【2020-08-23 20:44:12】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('447', '2020-08-23 20:44:24', '2020-08-23 20:44:24', '用户【慢慢来会比较快】于【2020-08-23 20:44:24】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('448', '2020-08-23 20:44:35', '2020-08-23 20:44:35', '用户【慢慢来会比较快】于【2020-08-23 20:44:35】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('449', '2020-08-23 20:49:23', '2020-08-23 20:49:23', '用户【南昌拌粉】于【2020-08-23 20:49:23】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('450', '2020-08-23 20:49:35', '2020-08-23 20:49:35', '用户【慢慢来会比较快】于【2020-08-23 20:49:35】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('451', '2020-08-23 20:49:45', '2020-08-23 20:49:45', '用户【慢慢来会比较快】于【2020-08-23 20:49:45】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('452', '2020-08-23 20:49:50', '2020-08-23 20:49:50', '用户【慢慢来会比较快】于【2020-08-23 20:49:50】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('453', '2020-08-23 20:49:54', '2020-08-23 20:49:54', '用户【慢慢来会比较快】于【2020-08-23 20:49:54】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('454', '2020-08-23 20:50:02', '2020-08-23 20:50:02', '用户【慢慢来会比较快】于【2020-08-23 20:50:02】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('455', '2020-08-23 20:50:09', '2020-08-23 20:50:09', '用户【慢慢来会比较快】于【2020-08-23 20:50:09】修改个人信息！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('456', '2020-08-24 21:09:48', '2020-08-24 21:09:48', '用户【南昌拌粉】于【2020-08-24 21:09:48】登录成功！', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('457', '2020-08-24 21:10:15', '2020-08-24 21:10:15', '用户【南昌拌粉】于【2020-08-24 21:10:15】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('458', '2020-08-24 21:40:06', '2020-08-24 21:40:06', '用户【南昌拌粉】于【2020-08-24 21:40:06】登录系统！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('459', '2020-08-24 21:41:33', '2020-08-24 21:41:33', '用户【test】于【2020-08-24 21:41:33】注册成功！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('460', '2020-08-24 21:41:41', '2020-08-24 21:41:41', '用户【test】于【2020-08-24 21:41:41】登录成功！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('461', '2020-08-24 21:42:37', '2020-08-24 21:42:37', '用户【test】于【2020-08-24 21:42:37】修改个人信息！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('462', '2020-08-24 21:42:52', '2020-08-24 21:42:52', '用户【test】于【2020-08-24 21:42:52】修改个人信息！', '南昌拌粉');
INSERT INTO `ylrc_operater_log` VALUES ('463', '2020-08-24 21:43:02', '2020-08-24 21:43:02', '用户【南昌拌粉】于【2020-08-24 21:43:02】登录成功！', '未知(获取登录用户失败)');

-- ----------------------------
-- Table structure for `ylrc_order_auth`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_order_auth`;
CREATE TABLE `ylrc_order_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `order_sn` varchar(18) NOT NULL,
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ahqv988xcab5a70bem0piku3l` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_order_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `ylrc_role`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_role`;
CREATE TABLE `ylrc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_role
-- ----------------------------
INSERT INTO `ylrc_role` VALUES ('1', '2020-03-15 13:16:38', '2020-08-20 21:31:05', '超级管理员', '超级管理员拥有最高权限。', '1');
INSERT INTO `ylrc_role` VALUES ('2', '2020-03-15 13:18:57', '2020-03-21 22:18:43', '普通管理员', '普通管理员只有部分权限', '1');
INSERT INTO `ylrc_role` VALUES ('4', '2020-03-21 20:11:00', '2020-03-23 17:49:00', '测试角色', 'sadsa', '0');

-- ----------------------------
-- Table structure for `ylrc_role_authorities`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_role_authorities`;
CREATE TABLE `ylrc_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`),
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`),
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_role_authorities
-- ----------------------------
INSERT INTO `ylrc_role_authorities` VALUES ('2', '2');
INSERT INTO `ylrc_role_authorities` VALUES ('2', '3');
INSERT INTO `ylrc_role_authorities` VALUES ('2', '5');
INSERT INTO `ylrc_role_authorities` VALUES ('2', '7');
INSERT INTO `ylrc_role_authorities` VALUES ('2', '11');
INSERT INTO `ylrc_role_authorities` VALUES ('2', '13');
INSERT INTO `ylrc_role_authorities` VALUES ('2', '16');
INSERT INTO `ylrc_role_authorities` VALUES ('4', '2');
INSERT INTO `ylrc_role_authorities` VALUES ('4', '13');
INSERT INTO `ylrc_role_authorities` VALUES ('4', '15');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '2');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '3');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '5');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '8');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '9');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '7');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '10');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '11');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '12');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '13');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '14');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '15');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '16');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '19');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '20');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '21');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '22');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '23');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '24');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '25');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '26');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '27');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '28');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '31');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '32');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '29');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '33');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '34');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '36');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '30');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '35');

-- ----------------------------
-- Table structure for `ylrc_user`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_user`;
CREATE TABLE `ylrc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`),
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`),
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_user
-- ----------------------------
INSERT INTO `ylrc_user` VALUES ('1', '2020-03-18 19:18:53', '2020-03-22 12:43:54', 'ylrc@qq.com', '20200322/1584850135123.jpg', '13356565656', '123456', '1', '1', '南昌拌粉', '1');
INSERT INTO `ylrc_user` VALUES ('2', '2020-03-18 19:20:36', '2020-03-21 22:18:55', 'llq@qq.com', '20200318/1584530412075.jpg', '13918655656', '123456', '1', '1', '测试账号', '2');
INSERT INTO `ylrc_user` VALUES ('5', '2020-03-20 20:42:19', '2020-03-23 17:50:19', 'yw@qq.com', '20200323/1584956702094.png', '13356565656', '123456', '1', '1', '小刘同志', '4');
