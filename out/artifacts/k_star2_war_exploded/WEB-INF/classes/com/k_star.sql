/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : k_star

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2017-10-31 17:06:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for k_ap
-- ----------------------------
DROP TABLE IF EXISTS `k_ap`;
CREATE TABLE `k_ap` (
  `k_apId` int(11) NOT NULL AUTO_INCREMENT,
  `k_apGrade1` int(11) NOT NULL COMMENT '取货速度或负责态度',
  `k_apGrade2` int(11) NOT NULL COMMENT '沟通态度',
  `k_apGrade3` int(11) NOT NULL COMMENT '诚信度',
  `k_apInfoId` int(11) NOT NULL COMMENT '被评价者ID',
  `k_apText` text COMMENT '评价详细信息',
  PRIMARY KEY (`k_apId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for k_chat
-- ----------------------------
DROP TABLE IF EXISTS `k_chat`;
CREATE TABLE `k_chat` (
  `k_chatId` int(11) NOT NULL AUTO_INCREMENT,
  `k_chatMyId` int(11) DEFAULT NULL,
  `k_chatMyName` varchar(255) DEFAULT NULL,
  `k_chatOtherId` int(11) DEFAULT NULL,
  `k_chatOtherName` varchar(255) DEFAULT NULL,
  `k_chatMessage` text,
  `k_chatTime` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`k_chatId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for k_ex
-- ----------------------------
DROP TABLE IF EXISTS `k_ex`;
CREATE TABLE `k_ex` (
  `k_exId` int(11) NOT NULL AUTO_INCREMENT,
  `k_infoId` int(11) NOT NULL COMMENT '用户ID',
  `k_time` varchar(225) NOT NULL COMMENT '物流记录时间',
  `k_context` text NOT NULL COMMENT '物流信息',
  `k_number` varchar(225) NOT NULL COMMENT '快递单号',
  `k_type` varchar(255) NOT NULL COMMENT '快递公司类型',
  `k_status` int(2) NOT NULL COMMENT '0代表本人未签收  1代表本人已签收',
  PRIMARY KEY (`k_exId`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for k_info
-- ----------------------------
DROP TABLE IF EXISTS `k_info`;
CREATE TABLE `k_info` (
  `k_id` int(11) NOT NULL AUTO_INCREMENT,
  `k_username` varchar(255) NOT NULL,
  `k_password` varchar(255) NOT NULL,
  `k_phone` varchar(18) DEFAULT NULL,
  `k_tPhone` varchar(255) DEFAULT NULL COMMENT '手机号地区',
  `k_qq` varchar(12) DEFAULT NULL,
  `k_weChat` varchar(255) DEFAULT NULL,
  `k_email` varchar(255) NOT NULL,
  `k_gender` int(2) DEFAULT NULL,
  `k_status` int(4) DEFAULT NULL,
  `k_emailValidate` varchar(225) DEFAULT NULL,
  `k_registerTime` datetime DEFAULT NULL,
  `k_money` int(11) DEFAULT NULL COMMENT '默认赏金',
  `k_address` text COMMENT '默认收获地址',
  `k_name` text COMMENT '真实姓名',
  PRIMARY KEY (`k_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for k_me
-- ----------------------------
DROP TABLE IF EXISTS `k_me`;
CREATE TABLE `k_me` (
  `k_meId` int(11) NOT NULL AUTO_INCREMENT,
  `k_meWarn` text COMMENT '发布人消息',
  `k_meOtherWarn` text COMMENT '领取人消息',
  `k_me_myId` int(11) DEFAULT NULL COMMENT '发布人人ID',
  `k_me_myUsername` varchar(255) DEFAULT NULL,
  `k_me_otherId` int(11) DEFAULT NULL COMMENT '领取人ID',
  `k_me_otherUsername` varchar(255) DEFAULT NULL,
  `k_me_reId` int(11) DEFAULT NULL,
  `k_meTime` varchar(255) DEFAULT NULL COMMENT '发布时间',
  `k_meStatus` int(2) DEFAULT NULL COMMENT '0 任务发布  1 任务完成  2 任务领取  3 任务时间过期',
  `k_me_number` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `k_meRealName` text COMMENT '真实姓名',
  `k_meCode` varchar(255) DEFAULT NULL COMMENT '取件码',
  `k_meMoney` int(11) DEFAULT NULL COMMENT '赏金',
  `k_meAddress` text COMMENT '取件地址',
  `k_mePhone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `k_meText` text COMMENT '取件详细信息',
  PRIMARY KEY (`k_meId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for k_re
-- ----------------------------
DROP TABLE IF EXISTS `k_re`;
CREATE TABLE `k_re` (
  `k_reId` int(11) NOT NULL AUTO_INCREMENT,
  `k_reNumber` varchar(255) DEFAULT NULL,
  `k_reName` varchar(255) DEFAULT NULL,
  `k_rePhone` varchar(255) DEFAULT NULL,
  `k_reText` text,
  `k_re_infoId` int(11) DEFAULT NULL,
  `k_infoName` varchar(255) DEFAULT NULL,
  `k_reStatus` int(2) DEFAULT NULL,
  `k_reTime` varchar(255) DEFAULT NULL COMMENT '任务终止时间',
  `k_re_puTime` varchar(255) DEFAULT NULL COMMENT '任务发布时间',
  `k_reRealName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `k_reCode` varchar(255) DEFAULT NULL COMMENT '取件码',
  `k_reMoney` int(11) DEFAULT NULL COMMENT '赏金',
  `k_reAddress` text,
  PRIMARY KEY (`k_reId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
