/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 127.0.0.1:3306
 Source Schema         : ssh

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 02/12/2019 16:32:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES (2, '小米', 0);
INSERT INTO `catalog` VALUES (8, '华为', 0);
INSERT INTO `catalog` VALUES (18, 'VIVO', 0);
INSERT INTO `catalog` VALUES (19, 'OPPO', 0);
INSERT INTO `catalog` VALUES (20, '一加', 0);
INSERT INTO `catalog` VALUES (22, '魅族', 0);
INSERT INTO `catalog` VALUES (24, '苹果', 0);
INSERT INTO `catalog` VALUES (25, '三星', 0);
INSERT INTO `catalog` VALUES (26, '联想', 0);
INSERT INTO `catalog` VALUES (27, '索尼（SONY）', 0);
INSERT INTO `catalog` VALUES (28, '锤子（smartisan）', 0);

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NULL DEFAULT NULL,
  `gid` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gid`(`gid`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  CONSTRAINT `detail_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_ibfk_3` FOREIGN KEY (`oid`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES (4, 4, 8, 1);
INSERT INTO `detail` VALUES (5, 4, 2, 1);
INSERT INTO `detail` VALUES (6, 5, 1, 1);
INSERT INTO `detail` VALUES (7, 5, 4, 1);
INSERT INTO `detail` VALUES (8, 6, 12, 1);
INSERT INTO `detail` VALUES (9, 6, 2, 1);
INSERT INTO `detail` VALUES (10, 7, 6, 4);
INSERT INTO `detail` VALUES (11, 7, 1, 4);
INSERT INTO `detail` VALUES (12, 7, 8, 4);
INSERT INTO `detail` VALUES (13, 7, 5, 3);
INSERT INTO `detail` VALUES (14, 7, 14, 6);
INSERT INTO `detail` VALUES (15, 7, 4, 6);
INSERT INTO `detail` VALUES (16, 8, 5, 7);
INSERT INTO `detail` VALUES (17, 8, 14, 2);
INSERT INTO `detail` VALUES (18, 8, 8, 5);
INSERT INTO `detail` VALUES (19, 8, 1, 6);
INSERT INTO `detail` VALUES (20, 8, 15, 4);
INSERT INTO `detail` VALUES (21, 8, 4, 2);
INSERT INTO `detail` VALUES (22, 8, 6, 3);
INSERT INTO `detail` VALUES (23, 9, 8, 4);
INSERT INTO `detail` VALUES (24, 9, 15, 5);
INSERT INTO `detail` VALUES (25, 9, 7, 4);
INSERT INTO `detail` VALUES (26, 10, 9, 4);
INSERT INTO `detail` VALUES (27, 10, 8, 4);
INSERT INTO `detail` VALUES (28, 10, 11, 4);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `catalogId` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catalogId`(`catalogId`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`catalogId`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '小米9', '小米9 战斗天使 好看又能打', 2999, 'http://localhost:8080/photo/mi9.jpg', 2, 0);
INSERT INTO `goods` VALUES (2, '华为 P30 Pro', '麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像 ', 5488, 'http://localhost:8080/photo/p30.png', 8, 0);
INSERT INTO `goods` VALUES (3, '华为 Mate 20 Pro ', '麒麟980 AI芯片 超广角徕卡三摄 OLED曲面屏 屏内指纹', 5499, 'http://localhost:8080/photo/m20.png', 8, 0);
INSERT INTO `goods` VALUES (4, 'iQOO ', '高配性能，快感超乎想象', 2998, 'http://localhost:8080/photo/iqoo.png', 18, 0);
INSERT INTO `goods` VALUES (5, 'NEX全面屏', '零界全面屏，视野无阻', 2998, 'http://localhost:8080/photo/nex.png', 18, 0);
INSERT INTO `goods` VALUES (6, 'Reno Z', '4800万超清像素，VOOC 3.0，4035mAh大电池。', 2499, 'http://localhost:8080/photo/reno.webp', 19, 0);
INSERT INTO `goods` VALUES (7, 'OnePlus 7 Pro', '开启流畅新纪元 ', 4499, 'http://localhost:8080/photo/17pro.png', 20, 0);
INSERT INTO `goods` VALUES (8, 'iPhone XS', 'iPhone XS', 12299, 'http://localhost:8080/photo/xs.jpg', 24, 0);
INSERT INTO `goods` VALUES (9, 'iPad Pro', 'iPad 最大的自我飞跃。', 6331, 'http://localhost:8080/photo/ipad.png', 24, 0);
INSERT INTO `goods` VALUES (11, 'Galaxy S10+', '超感官全视屏、3D超声波指纹解锁、无线共享充电、前置双摄像头、骁龙855处理器', 6999, 'http://localhost:8080/photo/s10.jpg', 25, 0);
INSERT INTO `goods` VALUES (12, 'Galaxy Note9', '智能 S Pen、海量存储8G+512G、4000mAh大容量电池', 4999, 'http://localhost:8080/photo/note9.jpg', 25, 0);
INSERT INTO `goods` VALUES (13, '魅族 16s', '骁龙855全面屏拍照游戏手机 6GB+128GB ', 2699, 'http://localhost:8080/photo/16s.jpg', 22, 0);
INSERT INTO `goods` VALUES (14, '联想Z6 Pro', '骁龙855 4800万AI四摄 4000mAh大电池 PC级液冷散热 ', 2999, 'http://localhost:8080/photo/z6.jpg', 26, 0);
INSERT INTO `goods` VALUES (15, 'Xperia XZ2 Premium', '暗光拍摄 骁龙845 移动联通双4G 手机 炫黑', 3299, 'http://localhost:8080/photo/xz.jpg', 27, 0);
INSERT INTO `goods` VALUES (16, '坚果R1 手机 炭黑色 8G+128G', '坚果R1 手机 炭黑色 8G+128G', 3199, 'http://localhost:8080/photo/smartisan.jpg', 28, 0);
INSERT INTO `goods` VALUES (17, ' Redmi K20Pro', '4800万超广角三摄 8GB+128GB 冰川蓝 骁龙855 全网通4G ', 3000, 'http://localhost:8080/photo/k20.jpg', 2, 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `createDate` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, '20190608192735483072213', 1, NULL, 1, '2019-06-08 19:27:36');
INSERT INTO `orders` VALUES (5, '20190609110323-1453666370', 1, NULL, 1, '2019-06-09 11:03:24');
INSERT INTO `orders` VALUES (6, '201906091126021250527298', 1, NULL, 1, '2019-06-09 11:26:02');
INSERT INTO `orders` VALUES (7, '201906100840291050280470', 27, NULL, 0, '2019-06-10 08:40:30');
INSERT INTO `orders` VALUES (8, '201906100853361811606050', 27, '湖工', 0, '2019-06-12 13:20:09');
INSERT INTO `orders` VALUES (9, '201906101017551819240352', 28, '湖北工程学院', 1, '2019-06-12 13:20:18');
INSERT INTO `orders` VALUES (10, '20190612133834309105251', 29, '湖北', 1, '2019-06-12 13:38:35');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `role` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '110', 20, '1', 0, 1);
INSERT INTO `user` VALUES (7, 'caohao2', 'caao2', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (9, '123456', '123456', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (13, 'lrh', '2222', '10086', 18, '0', 0, 1);
INSERT INTO `user` VALUES (14, 'test2', 'test2', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (15, 'test3', 'test3', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (16, 'test4', 'test4', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (17, 'test5', 'test5', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (18, 'test6', 'test6', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (19, 'test7', 'test7', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (20, 'test8', 'test8', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (21, 'hahaha', 'hahaha', '110', 99, '0', 0, 0);
INSERT INTO `user` VALUES (22, 'qqqq', 'qqqq', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (23, 'ffff', 'ffff', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (25, 'aaaa', 'aaaa', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (26, 'vvvv', 'vvvv', '', NULL, '1', 0, 0);
INSERT INTO `user` VALUES (27, 'caohao', 'caohao', '18888888888', 18, '1', 0, 0);
INSERT INTO `user` VALUES (28, 'abc', 'abc', '', 15, '1', 0, 0);
INSERT INTO `user` VALUES (29, 'testtest', 'testtest', '', 99, '1', 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
