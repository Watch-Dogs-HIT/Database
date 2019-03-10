/*
 Navicat Premium Data Transfer

 Source Server         : Tencent @ 182
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : 118.126.104.182:3306
 Source Schema         : Watch_Dogs

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 10/03/2019 18:53:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Host_info
-- ----------------------------
DROP TABLE IF EXISTS `Host_info`;
CREATE TABLE `Host_info`  (
  `host_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主机id',
  `host` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '主机ip',
  `user` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `port` int(255) NOT NULL DEFAULT 0 COMMENT '端口',
  `system` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '系统',
  `kernel` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内核',
  `CPU_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'CPU信息',
  `mem_M` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '内存大小',
  `disk_stat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '磁盘状态',
  `default_net_device` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '默认网卡',
  `intranet_ip` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内网ip',
  `extranet_ip` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '外网ip',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`host_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`host`, `user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Host_record
-- ----------------------------
DROP TABLE IF EXISTS `Host_record`;
CREATE TABLE `Host_record`  (
  `record_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `host` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机',
  `CPU` float(255, 0) NOT NULL COMMENT 'CPU百分比',
  `CPUs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'CPU单核数据',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Process
-- ----------------------------
DROP TABLE IF EXISTS `Process`;
CREATE TABLE `Process`  (
  `process_id` int(11) NOT NULL COMMENT '进程id',
  `host` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '进程所在主机',
  `pid` tinyint(4) NOT NULL COMMENT '进程号',
  `comm` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '命令',
  `cmdline` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行地址',
  `ppid` tinyint(4) NOT NULL COMMENT '父进程号',
  `pgrp` tinyint(255) NOT NULL COMMENT '进程组号',
  `state` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '进程状态',
  `thread_num` tinyint(4) NOT NULL COMMENT '线程数目',
  `record_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`process_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Process_record
-- ----------------------------
DROP TABLE IF EXISTS `Process_record`;
CREATE TABLE `Process_record`  (
  `record_id` int(255) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '进程信息记录id',
  `process_id` int(11) NOT NULL COMMENT '进程id',
  `cpu_max` float(255, 0) NOT NULL DEFAULT 0 COMMENT 'cpu占用率最大值',
  `cpu_avg` float(255, 0) NOT NULL DEFAULT 0 COMMENT 'cpu占用率平均值',
  `cpu_min` float(255, 0) NOT NULL DEFAULT 0 COMMENT 'cpu占用率最小值',
  `mem_max` float(255, 0) NOT NULL DEFAULT 0 COMMENT '内存占用最大值',
  `mem_avg` float(255, 0) NOT NULL DEFAULT 0 COMMENT '内存占用平均值',
  `mem_min` float(255, 0) NOT NULL DEFAULT 0 COMMENT '内存占用最小值',
  `read_MBs_max` float(255, 0) NOT NULL DEFAULT 0 COMMENT '读取速度最大值',
  `read_MBs_avg` float(255, 0) NOT NULL DEFAULT 0 COMMENT '读取速度平均值',
  `read_MBs_min` float(255, 0) NOT NULL DEFAULT 0 COMMENT '读取速度最小值',
  `write_MBs_max` float(255, 0) NOT NULL DEFAULT 0 COMMENT '写入速度最大值',
  `write_MBs_avg` float(255, 0) NOT NULL DEFAULT 0 COMMENT '写入速度平均值',
  `write_MBs_min` float(255, 0) NOT NULL DEFAULT 0 COMMENT '写入速度最小值',
  `net_upload_kbps_max` float(255, 0) NOT NULL DEFAULT 0 COMMENT '上传速度最大值',
  `net_upload_kbps_avg` float(255, 0) NOT NULL DEFAULT 0 COMMENT '上传速度平均值',
  `net_upload_kbps_min` float(255, 0) NOT NULL DEFAULT 0 COMMENT '上传速度最小值',
  `net_download_kbps_max` float(255, 0) NOT NULL DEFAULT 0 COMMENT '下载速度最大值',
  `net_download_kbps_avg` float(255, 0) NOT NULL DEFAULT 0 COMMENT '下载速度平均值',
  `net_download_kbps_min` float(255, 0) NOT NULL DEFAULT 0 COMMENT '下载速度最小值',
  `record_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Process_record_cache
-- ----------------------------
DROP TABLE IF EXISTS `Process_record_cache`;
CREATE TABLE `Process_record_cache`  (
  `record_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `process_id` int(11) NOT NULL COMMENT '进程id',
  `cpu` float(255, 0) NOT NULL DEFAULT 0 COMMENT 'CPU占用率',
  `mem` float(255, 0) NOT NULL DEFAULT 0 COMMENT '内存占用大小',
  `read_MBs` float(255, 0) NOT NULL DEFAULT 0 COMMENT '读取速度',
  `write_MBs` float(255, 0) NOT NULL DEFAULT 0 COMMENT '写入速度',
  `net_upload_kbps` float(255, 0) NOT NULL DEFAULT 0 COMMENT '上传速度',
  `net_download_kbps` float(255, 0) NOT NULL DEFAULT 0 COMMENT '下载速度',
  `record_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User`  (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `registration_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UNI_user`(`user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for User_Host
-- ----------------------------
DROP TABLE IF EXISTS `User_Host`;
CREATE TABLE `User_Host`  (
  `relation_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `host_id` int(11) NOT NULL COMMENT '主机id',
  `relation_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关系建立时间',
  PRIMARY KEY (`relation_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`user_id`, `host_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for User_Process
-- ----------------------------
DROP TABLE IF EXISTS `User_Process`;
CREATE TABLE `User_Process`  (
  `relation_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `host_id` int(11) NOT NULL COMMENT '主机id',
  `process_id` int(11) NOT NULL COMMENT '进程id',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注',
  `type` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '进程类型',
  `relation_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关系建立时间',
  PRIMARY KEY (`relation_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`user_id`, `host_id`, `process_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
