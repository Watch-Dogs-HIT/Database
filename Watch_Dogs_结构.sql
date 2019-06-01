/*
 Navicat Premium Data Transfer

 Source Server         : HouJie Test @ 202
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 10.245.146.202:3306
 Source Schema         : Watch_Dogs

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 01/06/2019 16:49:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Alert_rule
-- ----------------------------
DROP TABLE IF EXISTS `Alert_rule`;
CREATE TABLE `Alert_rule`  (
  `alert_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '告警规则id',
  `user_id` int(11) NOT NULL DEFAULT -1 COMMENT '用户id',
  `host_id` int(11) NOT NULL DEFAULT -1 COMMENT '主机id',
  `process_id` int(11) NOT NULL DEFAULT -1 COMMENT '进程id',
  `status_detect` int(11) NULL DEFAULT 1 COMMENT '主机/进程状态检测',
  `cpu_lt` tinyint(255) NULL DEFAULT -1 COMMENT 'cpu百分比小于',
  `cpu_gt` tinyint(255) NULL DEFAULT -1 COMMENT 'cpu百分比大于',
  `mem_lt` int(255) NULL DEFAULT -1 COMMENT '内存占用(M)小于',
  `mem_gt` int(255) NULL DEFAULT -1 COMMENT '内存占用(M)大于',
  `net_upload_kbps_lt` int(255) NULL DEFAULT -1 COMMENT '上传速度小于',
  `net_upload_kbps_gt` int(255) NULL DEFAULT -1 COMMENT '上传速度大于',
  `net_download_kbps_lt` int(255) NULL DEFAULT -1 COMMENT '下载速度小于',
  `net_download_kbps_gt` int(255) NULL DEFAULT -1 COMMENT '下载速度大于',
  `log_key_words` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '进程日志关键词',
  `last_relate_record_id` int(255) NULL DEFAULT -1 COMMENT '最后一次触发告警对应记录ID',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '告警规则更新时间',
  PRIMARY KEY (`alert_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`user_id`, `host_id`, `process_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Host_info
-- ----------------------------
DROP TABLE IF EXISTS `Host_info`;
CREATE TABLE `Host_info`  (
  `host_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主机id',
  `status` tinyint(255) NOT NULL DEFAULT 0 COMMENT '主机状态',
  `host` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '主机ip',
  `user` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `port` int(255) NOT NULL DEFAULT 0 COMMENT '端口',
  `system` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '系统',
  `kernel` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内核',
  `CPU_info` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'CPU信息',
  `mem_M` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '内存大小',
  `disk_stat` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '磁盘状态',
  `default_net_device` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '默认网卡',
  `intranet_ip` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内网ip',
  `extranet_ip` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '外网ip',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`host_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`host`, `user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Host_record
-- ----------------------------
DROP TABLE IF EXISTS `Host_record`;
CREATE TABLE `Host_record`  (
  `record_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `host_id` tinyint(255) NOT NULL DEFAULT -1 COMMENT '主机id',
  `host` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机',
  `CPU` float(255, 2) NOT NULL COMMENT 'CPU百分比',
  `CPUs` varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'CPU单核数据',
  `mem` float(255, 2) NOT NULL COMMENT '内存百分比',
  `read_MBs` float(255, 2) NOT NULL COMMENT '读取速度',
  `write_MBs` float(255, 2) NOT NULL COMMENT '写入速度',
  `net_upload_kbps` float(255, 2) NOT NULL COMMENT '上传速度',
  `net_download_kbps` float(255, 2) NOT NULL COMMENT '下载速度',
  `lavg_1` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '系统1分钟负载率',
  `lavg_5` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '系统5分钟负载率',
  `lavg_15` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '系统15分钟负载率',
  `nr` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '系统负载比例',
  `free_rate` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '系统空闲率',
  `uptime` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '系统启动时间',
  `record_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17482 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Process
-- ----------------------------
DROP TABLE IF EXISTS `Process`;
CREATE TABLE `Process`  (
  `process_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '进程id',
  `host_id` tinyint(6) NOT NULL COMMENT '进程所在主机id',
  `pid` int(11) NOT NULL COMMENT '进程号',
  `comm` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '命令',
  `cmdline` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '执行地址',
  `ppid` int(11) NOT NULL DEFAULT -1 COMMENT '父进程号',
  `pgrp` int(11) NOT NULL DEFAULT -1 COMMENT '进程组号',
  `state` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '进程状态',
  `thread_num` tinyint(4) NOT NULL DEFAULT -1 COMMENT '线程数目',
  `log_path` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '日志目录',
  `process_path` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '进程目录',
  `start_com` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '进程启动命令',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`process_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`host_id`, `pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Process_record
-- ----------------------------
DROP TABLE IF EXISTS `Process_record`;
CREATE TABLE `Process_record`  (
  `record_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `process_id` int(11) NOT NULL COMMENT '进程id',
  `cpu` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT 'CPU占用率',
  `mem` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '内存占用大小',
  `read_MBs` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '读取速度',
  `write_MBs` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '写入速度',
  `net_upload_kbps` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '上传速度',
  `net_download_kbps` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '下载速度',
  `record_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38223 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User`  (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `brief` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户简介',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `email` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绑定邮箱',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `registration_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UNI_user`(`user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for User_Host
-- ----------------------------
DROP TABLE IF EXISTS `User_Host`;
CREATE TABLE `User_Host`  (
  `relation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `host_id` int(11) NOT NULL COMMENT '主机id',
  `comment` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '主机备注',
  `type` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '主机类型',
  `relation_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关系建立时间',
  PRIMARY KEY (`relation_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`user_id`, `host_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for User_Process
-- ----------------------------
DROP TABLE IF EXISTS `User_Process`;
CREATE TABLE `User_Process`  (
  `relation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `host_id` int(11) NOT NULL COMMENT '主机id',
  `process_id` int(11) NOT NULL COMMENT '进程id',
  `comment` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注',
  `type` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '进程类型',
  `relation_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关系建立时间',
  PRIMARY KEY (`relation_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`user_id`, `host_id`, `process_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
