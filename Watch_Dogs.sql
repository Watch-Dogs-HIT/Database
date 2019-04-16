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

 Date: 16/04/2019 16:33:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `CPU_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'CPU信息',
  `mem_M` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '内存大小',
  `disk_stat` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '磁盘状态',
  `default_net_device` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '默认网卡',
  `intranet_ip` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内网ip',
  `extranet_ip` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '外网ip',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`host_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`host`, `user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Host_info
-- ----------------------------
INSERT INTO `Host_info` VALUES (2, 1, '10.245.146.202', 'houjie', '0f3fc66c6c138324be707d110a39704c', 8000, 'Ubuntu 7.3.0-16ubuntu3', 'Linux version 4.15.0-46-generic', '[\'AMD Opteron 63xx class CPU - 2600.060Mhz 1 CPUs\', \'AMD Opteron 63xx class CPU - 2600.060Mhz 1 CPUs\']', 1993.22, '[[\'/dev/loop0\', \'squashfs\', 0.089, 0.089, 100.0, \'/snap/core/6531\'], [\'/dev/loop2\', \'squashfs\', 0.0872, 0.0872, 100.0, \'/snap/core/6673\'], [\'/dev/vda2\', \'ext4\', 97.9277, 13.9112, 14.2056, \'/\'], [\'/dev/loop1\', \'squashfs\', 0.0874, 0.0874, 100.0, \'/snap/core/6130\']]', 'ens3', '10.245.146.202', '222.175.198.1', '2019-04-16 16:24:04');

-- ----------------------------
-- Table structure for Host_record
-- ----------------------------
DROP TABLE IF EXISTS `Host_record`;
CREATE TABLE `Host_record`  (
  `record_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `host_id` tinyint(255) NOT NULL DEFAULT -1 COMMENT '主机id',
  `host` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机',
  `CPU` float(255, 2) NOT NULL COMMENT 'CPU百分比',
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
) ENGINE = InnoDB AUTO_INCREMENT = 4157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Host_record
-- ----------------------------
INSERT INTO `Host_record` VALUES (4034, 2, '10.245.146.202', 1.65, '{\'cpu0\': 2.11, \'cpu1\': 1.2}', 46.38, 0.00, 0.03, 0.75, 0.47, 0.01, 0.02, 0.00, '1/210', 0.9934, '16 Days 3 hours 40 min 37 secs', '2019-04-15 19:31:03');
INSERT INTO `Host_record` VALUES (4035, 2, '10.245.146.202', 1.21, '{\'cpu0\': 1.51, \'cpu1\': 0.91}', 46.25, 0.00, 0.06, 2.11, 57.96, 0.00, 0.00, 0.00, '1/207', 0.9934, '16 Days 4 hours 13 min 53 secs', '2019-04-15 20:04:19');
INSERT INTO `Host_record` VALUES (4036, 2, '10.245.146.202', 1.10, '{\'cpu0\': 0.76, \'cpu1\': 1.45}', 46.23, 0.00, 0.01, 0.00, 0.02, 0.01, 0.01, 0.00, '1/204', 0.9934, '16 Days 4 hours 23 min 53 secs', '2019-04-15 20:14:20');
INSERT INTO `Host_record` VALUES (4037, 2, '10.245.146.202', 0.74, '{\'cpu0\': 0.61, \'cpu1\': 0.87}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.01, 0.00, '1/192', 0.9934, '16 Days 4 hours 33 min 54 secs', '2019-04-15 20:24:20');
INSERT INTO `Host_record` VALUES (4038, 2, '10.245.146.202', 0.48, '{\'cpu0\': 0.55, \'cpu1\': 0.41}', 43.58, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 4 hours 43 min 54 secs', '2019-04-15 20:34:20');
INSERT INTO `Host_record` VALUES (4039, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.52, \'cpu1\': 0.48}', 43.58, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 4 hours 53 min 54 secs', '2019-04-15 20:44:21');
INSERT INTO `Host_record` VALUES (4040, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.64, \'cpu1\': 0.38}', 43.58, 0.00, 0.01, 0.00, 0.01, 0.07, 0.04, 0.01, '1/193', 0.9934, '16 Days 5 hours 03 min 55 secs', '2019-04-15 20:54:21');
INSERT INTO `Host_record` VALUES (4041, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.61, \'cpu1\': 0.43}', 43.60, 0.00, 0.02, 0.01, 0.05, 0.03, 0.03, 0.00, '1/193', 0.9934, '16 Days 5 hours 13 min 55 secs', '2019-04-15 21:04:22');
INSERT INTO `Host_record` VALUES (4042, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.58, \'cpu1\': 0.46}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 5 hours 23 min 56 secs', '2019-04-15 21:14:22');
INSERT INTO `Host_record` VALUES (4043, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.57, \'cpu1\': 0.5}', 43.58, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/192', 0.9934, '16 Days 5 hours 33 min 56 secs', '2019-04-15 21:24:22');
INSERT INTO `Host_record` VALUES (4044, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.59, \'cpu1\': 0.42}', 43.58, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 5 hours 43 min 56 secs', '2019-04-15 21:34:23');
INSERT INTO `Host_record` VALUES (4045, 2, '10.245.146.202', 0.63, '{\'cpu0\': 0.63, \'cpu1\': 0.63}', 43.67, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 5 hours 53 min 57 secs', '2019-04-15 21:44:23');
INSERT INTO `Host_record` VALUES (4046, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.49, \'cpu1\': 0.52}', 43.61, 0.00, 0.01, 0.00, 0.02, 0.02, 0.02, 0.00, '1/193', 0.9934, '16 Days 6 hours 03 min 58 secs', '2019-04-15 21:54:24');
INSERT INTO `Host_record` VALUES (4047, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.53, \'cpu1\': 0.48}', 43.61, 0.00, 0.01, 0.00, 0.02, 0.02, 0.03, 0.00, '1/193', 0.9934, '16 Days 6 hours 13 min 58 secs', '2019-04-15 22:04:24');
INSERT INTO `Host_record` VALUES (4048, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.51, \'cpu1\': 0.53}', 43.60, 0.00, 0.02, 0.00, 0.02, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 6 hours 23 min 59 secs', '2019-04-15 22:14:25');
INSERT INTO `Host_record` VALUES (4049, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.52, \'cpu1\': 0.51}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.03, 0.01, 0.00, '1/193', 0.9934, '16 Days 6 hours 33 min 59 secs', '2019-04-15 22:24:25');
INSERT INTO `Host_record` VALUES (4050, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.51, \'cpu1\': 0.52}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 6 hours 44 min 00 secs', '2019-04-15 22:34:26');
INSERT INTO `Host_record` VALUES (4051, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.56, \'cpu1\': 0.52}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.01, 0.00, 0.00, '1/193', 0.9934, '16 Days 6 hours 54 min 00 secs', '2019-04-15 22:44:26');
INSERT INTO `Host_record` VALUES (4052, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.61, \'cpu1\': 0.45}', 43.59, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 7 hours 04 min 01 secs', '2019-04-15 22:54:27');
INSERT INTO `Host_record` VALUES (4053, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.49, \'cpu1\': 0.58}', 43.59, 0.00, 0.01, 0.00, 0.02, 0.02, 0.02, 0.00, '1/193', 0.9934, '16 Days 7 hours 14 min 02 secs', '2019-04-15 23:04:28');
INSERT INTO `Host_record` VALUES (4054, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.51, \'cpu1\': 0.54}', 43.61, 0.00, 0.02, 0.00, 0.02, 0.08, 0.03, 0.01, '1/193', 0.9934, '16 Days 7 hours 24 min 02 secs', '2019-04-15 23:14:28');
INSERT INTO `Host_record` VALUES (4055, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.55, \'cpu1\': 0.53}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.01, 0.01, 0.00, '1/193', 0.9934, '16 Days 7 hours 34 min 02 secs', '2019-04-15 23:24:28');
INSERT INTO `Host_record` VALUES (4056, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.56, \'cpu1\': 0.53}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.06, 0.01, 0.00, '1/193', 0.9934, '16 Days 7 hours 44 min 02 secs', '2019-04-15 23:34:29');
INSERT INTO `Host_record` VALUES (4057, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.67, \'cpu1\': 0.43}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 7 hours 54 min 03 secs', '2019-04-15 23:44:29');
INSERT INTO `Host_record` VALUES (4058, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.52, \'cpu1\': 0.53}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/192', 0.9934, '16 Days 8 hours 04 min 04 secs', '2019-04-15 23:54:30');
INSERT INTO `Host_record` VALUES (4059, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.5, \'cpu1\': 0.53}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 8 hours 14 min 04 secs', '2019-04-16 00:04:30');
INSERT INTO `Host_record` VALUES (4060, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.59, \'cpu1\': 0.52}', 43.59, 0.00, 0.02, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 8 hours 24 min 04 secs', '2019-04-16 00:14:31');
INSERT INTO `Host_record` VALUES (4061, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.5, \'cpu1\': 0.51}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 8 hours 34 min 05 secs', '2019-04-16 00:24:31');
INSERT INTO `Host_record` VALUES (4062, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.47, \'cpu1\': 0.63}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 8 hours 44 min 05 secs', '2019-04-16 00:34:31');
INSERT INTO `Host_record` VALUES (4063, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.48, \'cpu1\': 0.54}', 43.59, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/192', 0.9934, '16 Days 8 hours 54 min 05 secs', '2019-04-16 00:44:31');
INSERT INTO `Host_record` VALUES (4064, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.49, \'cpu1\': 0.58}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.01, 0.01, 0.00, '1/193', 0.9934, '16 Days 9 hours 04 min 05 secs', '2019-04-16 00:54:32');
INSERT INTO `Host_record` VALUES (4065, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.46, \'cpu1\': 0.54}', 43.59, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 9 hours 14 min 06 secs', '2019-04-16 01:04:32');
INSERT INTO `Host_record` VALUES (4066, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.5, \'cpu1\': 0.59}', 43.60, 0.00, 0.02, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 9 hours 24 min 06 secs', '2019-04-16 01:14:32');
INSERT INTO `Host_record` VALUES (4067, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.49, \'cpu1\': 0.56}', 43.58, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 9 hours 34 min 06 secs', '2019-04-16 01:24:32');
INSERT INTO `Host_record` VALUES (4068, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.55, \'cpu1\': 0.51}', 43.58, 0.00, 0.01, 0.00, 0.02, 0.03, 0.02, 0.00, '1/193', 0.9934, '16 Days 9 hours 44 min 07 secs', '2019-04-16 01:34:33');
INSERT INTO `Host_record` VALUES (4069, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.54, \'cpu1\': 0.51}', 43.58, 0.00, 0.01, 0.00, 0.02, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 9 hours 54 min 07 secs', '2019-04-16 01:44:33');
INSERT INTO `Host_record` VALUES (4070, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.56, \'cpu1\': 0.5}', 43.59, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 10 hours 04 min 08 secs', '2019-04-16 01:54:34');
INSERT INTO `Host_record` VALUES (4071, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.54, \'cpu1\': 0.55}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 10 hours 14 min 08 secs', '2019-04-16 02:04:34');
INSERT INTO `Host_record` VALUES (4072, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.62, \'cpu1\': 0.43}', 43.61, 0.00, 0.01, 0.00, 0.02, 0.01, 0.01, 0.00, '1/193', 0.9934, '16 Days 10 hours 24 min 08 secs', '2019-04-16 02:14:35');
INSERT INTO `Host_record` VALUES (4073, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.49, \'cpu1\': 0.58}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 10 hours 34 min 09 secs', '2019-04-16 02:24:35');
INSERT INTO `Host_record` VALUES (4074, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.6, \'cpu1\': 0.46}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.00, 0.01, 0.00, '1/192', 0.9934, '16 Days 10 hours 44 min 09 secs', '2019-04-16 02:34:35');
INSERT INTO `Host_record` VALUES (4075, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.62, \'cpu1\': 0.45}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.05, 0.01, 0.00, '1/193', 0.9934, '16 Days 10 hours 54 min 09 secs', '2019-04-16 02:44:36');
INSERT INTO `Host_record` VALUES (4076, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.56, \'cpu1\': 0.5}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.02, 0.02, 0.00, '1/193', 0.9934, '16 Days 11 hours 04 min 10 secs', '2019-04-16 02:54:36');
INSERT INTO `Host_record` VALUES (4077, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.48, \'cpu1\': 0.6}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 11 hours 14 min 11 secs', '2019-04-16 03:04:37');
INSERT INTO `Host_record` VALUES (4078, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.48, \'cpu1\': 0.59}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.02, 0.01, 0.00, '1/193', 0.9934, '16 Days 11 hours 24 min 11 secs', '2019-04-16 03:14:37');
INSERT INTO `Host_record` VALUES (4079, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.57, \'cpu1\': 0.53}', 43.61, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 11 hours 34 min 11 secs', '2019-04-16 03:24:38');
INSERT INTO `Host_record` VALUES (4080, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.47, \'cpu1\': 0.59}', 43.63, 0.00, 0.02, 0.01, 0.03, 0.06, 0.02, 0.00, '1/193', 0.9934, '16 Days 11 hours 44 min 12 secs', '2019-04-16 03:34:38');
INSERT INTO `Host_record` VALUES (4081, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.51, \'cpu1\': 0.56}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.02, 0.03, 0.00, '1/193', 0.9934, '16 Days 11 hours 54 min 12 secs', '2019-04-16 03:44:38');
INSERT INTO `Host_record` VALUES (4082, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.61, \'cpu1\': 0.43}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '2/193', 0.9934, '16 Days 12 hours 04 min 13 secs', '2019-04-16 03:54:39');
INSERT INTO `Host_record` VALUES (4083, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.64, \'cpu1\': 0.42}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 12 hours 14 min 14 secs', '2019-04-16 04:04:40');
INSERT INTO `Host_record` VALUES (4084, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.54, \'cpu1\': 0.54}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 12 hours 24 min 14 secs', '2019-04-16 04:14:40');
INSERT INTO `Host_record` VALUES (4085, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.56, \'cpu1\': 0.5}', 43.61, 0.00, 0.01, 0.00, 0.01, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 12 hours 34 min 14 secs', '2019-04-16 04:24:41');
INSERT INTO `Host_record` VALUES (4086, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.61, \'cpu1\': 0.49}', 43.62, 0.00, 0.02, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 12 hours 44 min 15 secs', '2019-04-16 04:34:41');
INSERT INTO `Host_record` VALUES (4087, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.52, \'cpu1\': 0.5}', 43.61, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 12 hours 54 min 15 secs', '2019-04-16 04:44:41');
INSERT INTO `Host_record` VALUES (4088, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.52, \'cpu1\': 0.55}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 13 hours 04 min 16 secs', '2019-04-16 04:54:42');
INSERT INTO `Host_record` VALUES (4089, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.61, \'cpu1\': 0.43}', 43.61, 0.00, 0.01, 0.00, 0.02, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 13 hours 14 min 17 secs', '2019-04-16 05:04:43');
INSERT INTO `Host_record` VALUES (4090, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.54, \'cpu1\': 0.5}', 43.61, 0.00, 0.01, 0.00, 0.02, 0.01, 0.01, 0.00, '1/193', 0.9934, '16 Days 13 hours 24 min 17 secs', '2019-04-16 05:14:43');
INSERT INTO `Host_record` VALUES (4091, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.49, \'cpu1\': 0.55}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.02, 0.01, 0.00, '1/193', 0.9934, '16 Days 13 hours 34 min 17 secs', '2019-04-16 05:24:43');
INSERT INTO `Host_record` VALUES (4092, 2, '10.245.146.202', 0.57, '{\'cpu0\': 0.58, \'cpu1\': 0.55}', 43.59, 0.00, 0.01, 0.00, 0.01, 0.05, 0.03, 0.01, '1/193', 0.9934, '16 Days 13 hours 44 min 17 secs', '2019-04-16 05:34:44');
INSERT INTO `Host_record` VALUES (4093, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.56, \'cpu1\': 0.54}', 43.60, 0.00, 0.02, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 13 hours 54 min 18 secs', '2019-04-16 05:44:44');
INSERT INTO `Host_record` VALUES (4094, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.59, \'cpu1\': 0.51}', 43.61, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '2/193', 0.9934, '16 Days 14 hours 04 min 19 secs', '2019-04-16 05:54:45');
INSERT INTO `Host_record` VALUES (4095, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.46, \'cpu1\': 0.59}', 43.60, 0.00, 0.01, 0.00, 0.01, 0.02, 0.02, 0.00, '1/193', 0.9934, '16 Days 14 hours 14 min 19 secs', '2019-04-16 06:04:45');
INSERT INTO `Host_record` VALUES (4096, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.51, \'cpu1\': 0.49}', 43.60, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 14 hours 24 min 19 secs', '2019-04-16 06:14:46');
INSERT INTO `Host_record` VALUES (4097, 2, '10.245.146.202', 0.98, '{\'cpu0\': 0.66, \'cpu1\': 1.29}', 43.74, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/194', 0.9934, '16 Days 14 hours 34 min 20 secs', '2019-04-16 06:24:46');
INSERT INTO `Host_record` VALUES (4098, 2, '10.245.146.202', 0.74, '{\'cpu0\': 0.66, \'cpu1\': 0.82}', 43.79, 0.01, 0.02, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 14 hours 44 min 20 secs', '2019-04-16 06:34:46');
INSERT INTO `Host_record` VALUES (4099, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.5, \'cpu1\': 0.61}', 43.66, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 14 hours 54 min 20 secs', '2019-04-16 06:44:47');
INSERT INTO `Host_record` VALUES (4100, 2, '10.245.146.202', 0.59, '{\'cpu0\': 0.65, \'cpu1\': 0.52}', 43.66, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 15 hours 04 min 21 secs', '2019-04-16 06:54:48');
INSERT INTO `Host_record` VALUES (4101, 2, '10.245.146.202', 0.59, '{\'cpu0\': 0.71, \'cpu1\': 0.46}', 43.65, 0.00, 0.01, 0.00, 0.01, 0.14, 0.04, 0.01, '1/193', 0.9934, '16 Days 15 hours 14 min 22 secs', '2019-04-16 07:04:48');
INSERT INTO `Host_record` VALUES (4102, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.54, \'cpu1\': 0.51}', 43.65, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 15 hours 24 min 22 secs', '2019-04-16 07:14:48');
INSERT INTO `Host_record` VALUES (4103, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.68, \'cpu1\': 0.4}', 43.66, 0.00, 0.01, 0.00, 0.02, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 15 hours 34 min 22 secs', '2019-04-16 07:24:49');
INSERT INTO `Host_record` VALUES (4104, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.64, \'cpu1\': 0.42}', 43.64, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 15 hours 44 min 23 secs', '2019-04-16 07:34:49');
INSERT INTO `Host_record` VALUES (4105, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.56, \'cpu1\': 0.47}', 43.63, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 15 hours 54 min 23 secs', '2019-04-16 07:44:49');
INSERT INTO `Host_record` VALUES (4106, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.57, \'cpu1\': 0.48}', 43.64, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 16 hours 04 min 24 secs', '2019-04-16 07:54:50');
INSERT INTO `Host_record` VALUES (4107, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.45, \'cpu1\': 0.65}', 43.64, 0.00, 0.02, 0.00, 0.02, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 16 hours 14 min 24 secs', '2019-04-16 08:04:51');
INSERT INTO `Host_record` VALUES (4108, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.53, \'cpu1\': 0.53}', 43.64, 0.00, 0.01, 0.00, 0.02, 0.06, 0.02, 0.00, '1/193', 0.9934, '16 Days 16 hours 24 min 25 secs', '2019-04-16 08:14:51');
INSERT INTO `Host_record` VALUES (4109, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.56, \'cpu1\': 0.53}', 43.66, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 16 hours 34 min 25 secs', '2019-04-16 08:24:51');
INSERT INTO `Host_record` VALUES (4110, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.55, \'cpu1\': 0.49}', 43.66, 0.00, 0.01, 0.00, 0.01, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 16 hours 44 min 26 secs', '2019-04-16 08:34:52');
INSERT INTO `Host_record` VALUES (4111, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.54, \'cpu1\': 0.51}', 43.65, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 16 hours 54 min 26 secs', '2019-04-16 08:44:52');
INSERT INTO `Host_record` VALUES (4112, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.55, \'cpu1\': 0.53}', 43.65, 0.00, 0.01, 0.00, 0.02, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 17 hours 04 min 27 secs', '2019-04-16 08:54:53');
INSERT INTO `Host_record` VALUES (4113, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.55, \'cpu1\': 0.54}', 43.65, 0.00, 0.02, 0.00, 0.01, 0.06, 0.02, 0.00, '1/193', 0.9934, '16 Days 17 hours 14 min 27 secs', '2019-04-16 09:04:53');
INSERT INTO `Host_record` VALUES (4114, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.49, \'cpu1\': 0.56}', 43.65, 0.00, 0.01, 0.00, 0.02, 0.04, 0.01, 0.00, '1/193', 0.9934, '16 Days 17 hours 24 min 27 secs', '2019-04-16 09:14:54');
INSERT INTO `Host_record` VALUES (4115, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.5, \'cpu1\': 0.55}', 43.64, 0.00, 0.01, 0.00, 0.02, 0.10, 0.04, 0.01, '1/193', 0.9934, '16 Days 17 hours 34 min 28 secs', '2019-04-16 09:24:54');
INSERT INTO `Host_record` VALUES (4116, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.5, \'cpu1\': 0.54}', 43.64, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 17 hours 44 min 28 secs', '2019-04-16 09:34:54');
INSERT INTO `Host_record` VALUES (4117, 2, '10.245.146.202', 0.70, '{\'cpu0\': 0.69, \'cpu1\': 0.72}', 43.79, 0.00, 0.01, 0.58, 0.08, 0.01, 0.02, 0.00, '1/199', 0.9934, '16 Days 17 hours 54 min 28 secs', '2019-04-16 09:44:54');
INSERT INTO `Host_record` VALUES (4118, 2, '10.245.146.202', 0.54, '{\'cpu0\': 0.53, \'cpu1\': 0.55}', 43.93, 0.00, 0.01, 0.04, 0.03, 0.00, 0.00, 0.00, '1/199', 0.9934, '16 Days 18 hours 04 min 29 secs', '2019-04-16 09:54:55');
INSERT INTO `Host_record` VALUES (4119, 2, '10.245.146.202', 0.55, '{\'cpu0\': 0.54, \'cpu1\': 0.55}', 44.01, 0.00, 0.01, 0.46, 0.08, 0.00, 0.02, 0.00, '1/200', 0.9934, '16 Days 18 hours 14 min 29 secs', '2019-04-16 10:04:56');
INSERT INTO `Host_record` VALUES (4120, 2, '10.245.146.202', 1.26, '{\'cpu0\': 1.45, \'cpu1\': 1.07}', 46.46, 0.00, 0.02, 0.10, 0.22, 0.09, 0.09, 0.03, '1/202', 0.9934, '16 Days 18 hours 24 min 30 secs', '2019-04-16 10:14:56');
INSERT INTO `Host_record` VALUES (4121, 2, '10.245.146.202', 1.46, '{\'cpu0\': 2.18, \'cpu1\': 0.73}', 46.42, 0.00, 0.01, 0.17, 0.34, 0.00, 0.02, 0.00, '1/203', 0.9934, '16 Days 18 hours 34 min 30 secs', '2019-04-16 10:24:56');
INSERT INTO `Host_record` VALUES (4122, 2, '10.245.146.202', 1.32, '{\'cpu0\': 1.29, \'cpu1\': 1.35}', 46.47, 0.00, 0.01, 35.78, 0.90, 0.28, 0.11, 0.02, '1/205', 0.9934, '16 Days 18 hours 44 min 31 secs', '2019-04-16 10:34:57');
INSERT INTO `Host_record` VALUES (4123, 2, '10.245.146.202', 1.09, '{\'cpu0\': 1.09, \'cpu1\': 1.09}', 46.50, 0.00, 0.01, 0.52, 0.54, 0.19, 0.06, 0.02, '1/205', 0.9934, '16 Days 18 hours 54 min 31 secs', '2019-04-16 10:44:57');
INSERT INTO `Host_record` VALUES (4124, 2, '10.245.146.202', 1.21, '{\'cpu0\': 1.1, \'cpu1\': 1.32}', 46.49, 0.00, 0.01, 1.26, 0.97, 0.02, 0.03, 0.00, '1/206', 0.9934, '16 Days 19 hours 04 min 32 secs', '2019-04-16 10:54:58');
INSERT INTO `Host_record` VALUES (4125, 2, '10.245.146.202', 1.20, '{\'cpu0\': 1.23, \'cpu1\': 1.16}', 46.52, 0.00, 0.01, 2.00, 0.21, 0.06, 0.04, 0.00, '1/206', 0.9934, '16 Days 19 hours 14 min 33 secs', '2019-04-16 11:04:59');
INSERT INTO `Host_record` VALUES (4126, 2, '10.245.146.202', 1.04, '{\'cpu0\': 1.06, \'cpu1\': 1.03}', 46.54, 0.00, 0.02, 0.08, 0.15, 0.04, 0.03, 0.00, '1/206', 0.9934, '16 Days 19 hours 24 min 33 secs', '2019-04-16 11:14:59');
INSERT INTO `Host_record` VALUES (4127, 2, '10.245.146.202', 1.04, '{\'cpu0\': 0.9, \'cpu1\': 1.18}', 46.54, 0.00, 0.01, 0.07, 0.07, 0.06, 0.02, 0.00, '1/206', 0.9934, '16 Days 19 hours 34 min 33 secs', '2019-04-16 11:24:59');
INSERT INTO `Host_record` VALUES (4128, 2, '10.245.146.202', 0.74, '{\'cpu0\': 0.48, \'cpu1\': 1.0}', 43.85, 0.00, 0.01, 0.03, 0.03, 0.03, 0.05, 0.01, '1/193', 0.9934, '16 Days 19 hours 44 min 33 secs', '2019-04-16 11:35:00');
INSERT INTO `Host_record` VALUES (4129, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.51, \'cpu1\': 0.5}', 43.85, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 19 hours 54 min 34 secs', '2019-04-16 11:45:00');
INSERT INTO `Host_record` VALUES (4130, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.49, \'cpu1\': 0.51}', 43.84, 0.00, 0.01, 0.00, 0.02, 0.07, 0.02, 0.00, '1/192', 0.9934, '16 Days 20 hours 04 min 35 secs', '2019-04-16 11:55:01');
INSERT INTO `Host_record` VALUES (4131, 2, '10.245.146.202', 0.48, '{\'cpu0\': 0.44, \'cpu1\': 0.53}', 43.84, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 20 hours 14 min 35 secs', '2019-04-16 12:05:01');
INSERT INTO `Host_record` VALUES (4132, 2, '10.245.146.202', 0.48, '{\'cpu0\': 0.49, \'cpu1\': 0.46}', 43.84, 0.00, 0.02, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 20 hours 24 min 35 secs', '2019-04-16 12:15:01');
INSERT INTO `Host_record` VALUES (4133, 2, '10.245.146.202', 0.49, '{\'cpu0\': 0.55, \'cpu1\': 0.43}', 43.86, 0.00, 0.01, 0.00, 0.02, 0.05, 0.03, 0.00, '1/193', 0.9934, '16 Days 20 hours 34 min 36 secs', '2019-04-16 12:25:02');
INSERT INTO `Host_record` VALUES (4134, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.53, \'cpu1\': 0.51}', 43.84, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 20 hours 44 min 36 secs', '2019-04-16 12:35:02');
INSERT INTO `Host_record` VALUES (4135, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.53, \'cpu1\': 0.48}', 43.84, 0.00, 0.01, 0.00, 0.02, 0.03, 0.02, 0.00, '1/193', 0.9934, '16 Days 20 hours 54 min 36 secs', '2019-04-16 12:45:02');
INSERT INTO `Host_record` VALUES (4136, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.44, \'cpu1\': 0.55}', 43.85, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 21 hours 04 min 37 secs', '2019-04-16 12:55:03');
INSERT INTO `Host_record` VALUES (4137, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.48, \'cpu1\': 0.54}', 43.85, 0.00, 0.01, 0.00, 0.06, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 21 hours 14 min 37 secs', '2019-04-16 13:05:04');
INSERT INTO `Host_record` VALUES (4138, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.51, \'cpu1\': 0.52}', 43.84, 0.00, 0.01, 0.00, 0.03, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 21 hours 24 min 38 secs', '2019-04-16 13:15:04');
INSERT INTO `Host_record` VALUES (4139, 2, '10.245.146.202', 0.49, '{\'cpu0\': 0.48, \'cpu1\': 0.5}', 43.86, 0.00, 0.01, 0.00, 0.02, 0.40, 0.12, 0.03, '1/193', 0.9934, '16 Days 21 hours 34 min 38 secs', '2019-04-16 13:25:04');
INSERT INTO `Host_record` VALUES (4140, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.55, \'cpu1\': 0.48}', 43.84, 0.00, 0.01, 0.00, 0.05, 0.12, 0.05, 0.01, '1/193', 0.9934, '16 Days 21 hours 44 min 38 secs', '2019-04-16 13:35:04');
INSERT INTO `Host_record` VALUES (4141, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.51, \'cpu1\': 0.53}', 43.84, 0.00, 0.01, 0.00, 0.05, 0.00, 0.01, 0.00, '1/194', 0.9934, '16 Days 21 hours 54 min 39 secs', '2019-04-16 13:45:05');
INSERT INTO `Host_record` VALUES (4142, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.58, \'cpu1\': 0.45}', 43.84, 0.00, 0.01, 0.00, 0.07, 0.01, 0.00, 0.00, '1/193', 0.9934, '16 Days 22 hours 04 min 39 secs', '2019-04-16 13:55:06');
INSERT INTO `Host_record` VALUES (4143, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.57, \'cpu1\': 0.44}', 43.84, 0.00, 0.01, 0.00, 0.13, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 22 hours 14 min 40 secs', '2019-04-16 14:05:06');
INSERT INTO `Host_record` VALUES (4144, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.51, \'cpu1\': 0.5}', 43.84, 0.00, 0.01, 0.00, 0.05, 0.02, 0.01, 0.00, '1/193', 0.9934, '16 Days 22 hours 24 min 40 secs', '2019-04-16 14:15:06');
INSERT INTO `Host_record` VALUES (4145, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.53, \'cpu1\': 0.52}', 43.85, 0.00, 0.01, 0.00, 0.03, 0.00, 0.01, 0.00, '1/193', 0.9934, '16 Days 22 hours 34 min 40 secs', '2019-04-16 14:25:07');
INSERT INTO `Host_record` VALUES (4146, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.57, \'cpu1\': 0.46}', 43.84, 0.00, 0.02, 0.00, 0.03, 0.01, 0.01, 0.00, '1/192', 0.9934, '16 Days 22 hours 44 min 41 secs', '2019-04-16 14:35:07');
INSERT INTO `Host_record` VALUES (4147, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.49, \'cpu1\': 0.54}', 43.85, 0.00, 0.01, 0.01, 0.05, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 22 hours 54 min 41 secs', '2019-04-16 14:45:07');
INSERT INTO `Host_record` VALUES (4148, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.59, \'cpu1\': 0.41}', 43.86, 0.00, 0.01, 0.00, 0.03, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 23 hours 04 min 42 secs', '2019-04-16 14:55:08');
INSERT INTO `Host_record` VALUES (4149, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.54, \'cpu1\': 0.46}', 43.85, 0.00, 0.01, 0.00, 0.03, 0.04, 0.01, 0.00, '1/193', 0.9934, '16 Days 23 hours 14 min 42 secs', '2019-04-16 15:05:08');
INSERT INTO `Host_record` VALUES (4150, 2, '10.245.146.202', 0.50, '{\'cpu0\': 0.53, \'cpu1\': 0.48}', 43.85, 0.00, 0.01, 0.00, 0.03, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 23 hours 24 min 43 secs', '2019-04-16 15:15:09');
INSERT INTO `Host_record` VALUES (4151, 2, '10.245.146.202', 0.51, '{\'cpu0\': 0.56, \'cpu1\': 0.47}', 43.85, 0.00, 0.01, 0.00, 0.03, 0.04, 0.02, 0.00, '1/192', 0.9934, '16 Days 23 hours 34 min 43 secs', '2019-04-16 15:25:09');
INSERT INTO `Host_record` VALUES (4152, 2, '10.245.146.202', 0.52, '{\'cpu0\': 0.51, \'cpu1\': 0.52}', 43.85, 0.00, 0.01, 0.00, 0.02, 0.00, 0.00, 0.00, '1/194', 0.9934, '16 Days 23 hours 44 min 43 secs', '2019-04-16 15:35:09');
INSERT INTO `Host_record` VALUES (4153, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.65, \'cpu1\': 0.4}', 43.84, 0.00, 0.02, 0.00, 0.03, 0.00, 0.00, 0.00, '1/193', 0.9934, '16 Days 23 hours 54 min 44 secs', '2019-04-16 15:45:10');
INSERT INTO `Host_record` VALUES (4154, 2, '10.245.146.202', 1.70, '{\'cpu0\': 2.42, \'cpu1\': 0.97}', 43.38, 0.12, 0.27, 0.12, 4.19, 0.01, 0.06, 0.02, '1/194', 0.9934, '17 Days 0 hours 04 min 45 secs', '2019-04-16 15:55:11');
INSERT INTO `Host_record` VALUES (4155, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.5, \'cpu1\': 0.56}', 43.27, 0.00, 0.01, 0.00, 0.03, 0.08, 0.03, 0.01, '1/193', 0.9934, '17 Days 0 hours 14 min 45 secs', '2019-04-16 16:05:11');
INSERT INTO `Host_record` VALUES (4156, 2, '10.245.146.202', 0.53, '{\'cpu0\': 0.53, \'cpu1\': 0.52}', 43.37, 0.00, 0.01, 0.00, 0.03, 0.00, 0.00, 0.00, '1/194', 0.9934, '17 Days 0 hours 24 min 45 secs', '2019-04-16 16:15:12');
INSERT INTO `Host_record` VALUES (4157, 2, '10.245.146.202', 1.22, '{\'cpu0\': 1.29, \'cpu1\': 1.14}', 43.74, 0.02, 0.04, 1.41, 0.26, 0.14, 0.04, 0.01, '1/206', 0.9934, '17 Days 0 hours 33 min 38 secs', '2019-04-16 16:24:04');

-- ----------------------------
-- Table structure for Process
-- ----------------------------
DROP TABLE IF EXISTS `Process`;
CREATE TABLE `Process`  (
  `process_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '进程id',
  `host` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '进程所在主机',
  `pid` int(11) NOT NULL COMMENT '进程号',
  `comm` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '命令',
  `cmdline` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '执行地址',
  `ppid` int(11) NOT NULL DEFAULT -1 COMMENT '父进程号',
  `pgrp` int(11) NOT NULL DEFAULT -1 COMMENT '进程组号',
  `state` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '进程状态',
  `thread_num` tinyint(4) NOT NULL DEFAULT -1 COMMENT '线程数目',
  `log_path` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '日志目录',
  `process_path` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '进程目录',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`process_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`host`, `pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Process
-- ----------------------------
INSERT INTO `Process` VALUES (2, '10.245.146.202', 974, 'mysqld', '/usr/sbin/mysqld', 1, 974, 'S', 46, '', '', '2019-04-16 16:24:04');
INSERT INTO `Process` VALUES (33, '10.245.146.202', 32582, 'mongod', '/usr/bin/mongod --unixSocketPrefix=/run/mongodb --config /etc/mongodb.conf', 1, 32582, 'S', 23, '', '', '2019-04-16 16:24:04');

-- ----------------------------
-- Table structure for Process_record
-- ----------------------------
DROP TABLE IF EXISTS `Process_record`;
CREATE TABLE `Process_record`  (
  `record_id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '进程信息记录id',
  `process_id` int(11) NOT NULL COMMENT '进程id',
  `cpu_max` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT 'cpu占用率最大值',
  `cpu_avg` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT 'cpu占用率平均值',
  `cpu_min` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT 'cpu占用率最小值',
  `mem_max` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '内存占用最大值',
  `mem_avg` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '内存占用平均值',
  `mem_min` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '内存占用最小值',
  `read_MBs_max` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '读取速度最大值',
  `read_MBs_avg` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '读取速度平均值',
  `read_MBs_min` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '读取速度最小值',
  `write_MBs_max` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '写入速度最大值',
  `write_MBs_avg` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '写入速度平均值',
  `write_MBs_min` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '写入速度最小值',
  `net_upload_kbps_max` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '上传速度最大值',
  `net_upload_kbps_avg` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '上传速度平均值',
  `net_upload_kbps_min` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '上传速度最小值',
  `net_download_kbps_max` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '下载速度最大值',
  `net_download_kbps_avg` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '下载速度平均值',
  `net_download_kbps_min` float(255, 4) NOT NULL DEFAULT 0.0000 COMMENT '下载速度最小值',
  `record_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Process_record
-- ----------------------------
INSERT INTO `Process_record` VALUES (673, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 00:05:23');
INSERT INTO `Process_record` VALUES (674, 2, 0.3000, 0.2933, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 00:20:24');
INSERT INTO `Process_record` VALUES (675, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 00:35:25');
INSERT INTO `Process_record` VALUES (676, 2, 0.3200, 0.3033, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 00:50:26');
INSERT INTO `Process_record` VALUES (677, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 01:05:26');
INSERT INTO `Process_record` VALUES (678, 2, 0.3200, 0.3033, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 01:20:27');
INSERT INTO `Process_record` VALUES (679, 2, 0.3400, 0.3100, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 01:35:28');
INSERT INTO `Process_record` VALUES (680, 2, 0.3100, 0.3000, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 01:50:28');
INSERT INTO `Process_record` VALUES (681, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 02:05:29');
INSERT INTO `Process_record` VALUES (682, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 02:20:29');
INSERT INTO `Process_record` VALUES (683, 2, 0.3300, 0.3067, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 02:35:30');
INSERT INTO `Process_record` VALUES (684, 2, 0.3100, 0.3033, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 02:50:30');
INSERT INTO `Process_record` VALUES (685, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 03:05:31');
INSERT INTO `Process_record` VALUES (686, 2, 0.3100, 0.3033, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 03:20:32');
INSERT INTO `Process_record` VALUES (687, 2, 0.3100, 0.3033, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 03:35:33');
INSERT INTO `Process_record` VALUES (688, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 03:50:33');
INSERT INTO `Process_record` VALUES (689, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 04:05:34');
INSERT INTO `Process_record` VALUES (690, 2, 0.3300, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 04:20:35');
INSERT INTO `Process_record` VALUES (691, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 04:35:36');
INSERT INTO `Process_record` VALUES (692, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 04:50:37');
INSERT INTO `Process_record` VALUES (693, 2, 0.3200, 0.3100, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 05:05:38');
INSERT INTO `Process_record` VALUES (694, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 05:20:39');
INSERT INTO `Process_record` VALUES (695, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 05:35:40');
INSERT INTO `Process_record` VALUES (696, 2, 0.3200, 0.3067, 0.2800, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 05:50:41');
INSERT INTO `Process_record` VALUES (697, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 06:05:41');
INSERT INTO `Process_record` VALUES (698, 2, 0.3100, 0.3033, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 06:20:42');
INSERT INTO `Process_record` VALUES (699, 2, 0.3400, 0.3200, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 06:35:43');
INSERT INTO `Process_record` VALUES (700, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 06:50:43');
INSERT INTO `Process_record` VALUES (701, 2, 0.3300, 0.3133, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 07:05:44');
INSERT INTO `Process_record` VALUES (702, 2, 0.3200, 0.3133, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 07:20:45');
INSERT INTO `Process_record` VALUES (703, 2, 0.3200, 0.3200, 0.3200, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 07:35:46');
INSERT INTO `Process_record` VALUES (704, 2, 0.3300, 0.3167, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 07:50:47');
INSERT INTO `Process_record` VALUES (705, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 08:05:48');
INSERT INTO `Process_record` VALUES (706, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 08:20:48');
INSERT INTO `Process_record` VALUES (707, 2, 0.3300, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 08:35:49');
INSERT INTO `Process_record` VALUES (708, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 08:50:50');
INSERT INTO `Process_record` VALUES (709, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 09:05:50');
INSERT INTO `Process_record` VALUES (710, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 09:20:50');
INSERT INTO `Process_record` VALUES (711, 2, 0.3200, 0.3100, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 09:35:51');
INSERT INTO `Process_record` VALUES (712, 2, 0.3300, 0.3133, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 09:50:52');
INSERT INTO `Process_record` VALUES (713, 2, 0.3100, 0.3000, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 10:05:53');
INSERT INTO `Process_record` VALUES (714, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 10:20:53');
INSERT INTO `Process_record` VALUES (715, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 10:35:54');
INSERT INTO `Process_record` VALUES (716, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 10:50:55');
INSERT INTO `Process_record` VALUES (717, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 11:05:56');
INSERT INTO `Process_record` VALUES (718, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 11:20:56');
INSERT INTO `Process_record` VALUES (719, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 11:35:57');
INSERT INTO `Process_record` VALUES (720, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 11:50:58');
INSERT INTO `Process_record` VALUES (721, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 12:05:59');
INSERT INTO `Process_record` VALUES (722, 2, 0.3300, 0.3067, 0.2800, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 12:21:00');
INSERT INTO `Process_record` VALUES (723, 2, 0.3300, 0.3167, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 12:36:01');
INSERT INTO `Process_record` VALUES (724, 2, 0.3200, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 12:51:01');
INSERT INTO `Process_record` VALUES (725, 2, 0.3200, 0.3067, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 13:06:01');
INSERT INTO `Process_record` VALUES (726, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 13:21:02');
INSERT INTO `Process_record` VALUES (727, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 13:36:03');
INSERT INTO `Process_record` VALUES (728, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 13:51:04');
INSERT INTO `Process_record` VALUES (729, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 14:06:05');
INSERT INTO `Process_record` VALUES (730, 2, 0.3300, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 14:21:05');
INSERT INTO `Process_record` VALUES (731, 2, 0.3300, 0.3100, 0.2800, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 14:36:06');
INSERT INTO `Process_record` VALUES (732, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 14:51:07');
INSERT INTO `Process_record` VALUES (733, 2, 0.3300, 0.3167, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 15:06:08');
INSERT INTO `Process_record` VALUES (734, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 15:21:08');
INSERT INTO `Process_record` VALUES (735, 2, 0.3300, 0.3233, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 15:36:09');
INSERT INTO `Process_record` VALUES (736, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 15:51:09');
INSERT INTO `Process_record` VALUES (737, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 16:06:10');
INSERT INTO `Process_record` VALUES (738, 2, 0.3200, 0.3067, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 16:21:11');
INSERT INTO `Process_record` VALUES (739, 2, 0.3100, 0.3000, 0.2800, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 16:36:12');
INSERT INTO `Process_record` VALUES (740, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 16:51:12');
INSERT INTO `Process_record` VALUES (741, 2, 0.3100, 0.3033, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 17:06:12');
INSERT INTO `Process_record` VALUES (742, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 17:21:13');
INSERT INTO `Process_record` VALUES (743, 2, 0.3400, 0.3200, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 17:36:14');
INSERT INTO `Process_record` VALUES (744, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 17:51:15');
INSERT INTO `Process_record` VALUES (745, 2, 0.3200, 0.3133, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 18:06:16');
INSERT INTO `Process_record` VALUES (746, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 18:21:17');
INSERT INTO `Process_record` VALUES (747, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 18:36:18');
INSERT INTO `Process_record` VALUES (748, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 18:51:19');
INSERT INTO `Process_record` VALUES (749, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 19:06:19');
INSERT INTO `Process_record` VALUES (750, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 19:21:20');
INSERT INTO `Process_record` VALUES (751, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 19:36:21');
INSERT INTO `Process_record` VALUES (752, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 19:51:21');
INSERT INTO `Process_record` VALUES (753, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 20:06:22');
INSERT INTO `Process_record` VALUES (754, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 20:21:23');
INSERT INTO `Process_record` VALUES (755, 2, 0.3300, 0.3133, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 20:36:24');
INSERT INTO `Process_record` VALUES (756, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 20:51:25');
INSERT INTO `Process_record` VALUES (757, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 21:06:26');
INSERT INTO `Process_record` VALUES (758, 2, 0.3100, 0.3033, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 21:21:26');
INSERT INTO `Process_record` VALUES (759, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 21:36:27');
INSERT INTO `Process_record` VALUES (760, 2, 0.3300, 0.3267, 0.3200, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 21:51:27');
INSERT INTO `Process_record` VALUES (761, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 22:06:28');
INSERT INTO `Process_record` VALUES (762, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 22:21:29');
INSERT INTO `Process_record` VALUES (763, 2, 0.3400, 0.3233, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 22:36:30');
INSERT INTO `Process_record` VALUES (764, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 22:51:30');
INSERT INTO `Process_record` VALUES (765, 2, 0.3300, 0.3167, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 23:06:30');
INSERT INTO `Process_record` VALUES (766, 2, 0.3300, 0.3233, 0.3200, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 23:21:31');
INSERT INTO `Process_record` VALUES (767, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 23:36:31');
INSERT INTO `Process_record` VALUES (768, 2, 0.3300, 0.3200, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-24 23:51:31');
INSERT INTO `Process_record` VALUES (769, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 00:06:32');
INSERT INTO `Process_record` VALUES (770, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 00:21:33');
INSERT INTO `Process_record` VALUES (771, 2, 0.3300, 0.3167, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 00:36:34');
INSERT INTO `Process_record` VALUES (772, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 00:51:34');
INSERT INTO `Process_record` VALUES (773, 2, 0.3300, 0.3133, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 01:06:35');
INSERT INTO `Process_record` VALUES (774, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 01:21:35');
INSERT INTO `Process_record` VALUES (775, 2, 0.3400, 0.3233, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 01:36:36');
INSERT INTO `Process_record` VALUES (776, 2, 0.3100, 0.3067, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 01:51:36');
INSERT INTO `Process_record` VALUES (777, 2, 0.3200, 0.3200, 0.3200, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 02:06:37');
INSERT INTO `Process_record` VALUES (778, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 02:21:38');
INSERT INTO `Process_record` VALUES (779, 2, 0.3300, 0.3167, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 02:36:39');
INSERT INTO `Process_record` VALUES (780, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 02:51:40');
INSERT INTO `Process_record` VALUES (781, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 03:06:41');
INSERT INTO `Process_record` VALUES (782, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 03:21:42');
INSERT INTO `Process_record` VALUES (783, 2, 0.3200, 0.3133, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 03:36:43');
INSERT INTO `Process_record` VALUES (784, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 03:51:43');
INSERT INTO `Process_record` VALUES (785, 2, 0.3300, 0.3233, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 04:06:44');
INSERT INTO `Process_record` VALUES (786, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 04:21:45');
INSERT INTO `Process_record` VALUES (787, 2, 0.3300, 0.3233, 0.3200, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 04:36:46');
INSERT INTO `Process_record` VALUES (788, 2, 0.3300, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 04:51:46');
INSERT INTO `Process_record` VALUES (789, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 05:06:47');
INSERT INTO `Process_record` VALUES (790, 2, 0.3300, 0.3167, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 05:21:48');
INSERT INTO `Process_record` VALUES (791, 2, 0.3400, 0.3233, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 05:36:49');
INSERT INTO `Process_record` VALUES (792, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 05:51:49');
INSERT INTO `Process_record` VALUES (793, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 06:06:50');
INSERT INTO `Process_record` VALUES (794, 2, 0.3300, 0.3200, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 06:21:50');
INSERT INTO `Process_record` VALUES (795, 2, 0.3300, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 06:36:51');
INSERT INTO `Process_record` VALUES (796, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 06:51:52');
INSERT INTO `Process_record` VALUES (797, 2, 0.3200, 0.3067, 0.2900, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 07:06:53');
INSERT INTO `Process_record` VALUES (798, 2, 0.3100, 0.3100, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 07:21:53');
INSERT INTO `Process_record` VALUES (799, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 07:36:54');
INSERT INTO `Process_record` VALUES (800, 2, 0.3200, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 07:51:54');
INSERT INTO `Process_record` VALUES (801, 2, 0.3200, 0.3133, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 08:06:55');
INSERT INTO `Process_record` VALUES (802, 2, 0.3200, 0.3167, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 08:21:56');
INSERT INTO `Process_record` VALUES (803, 2, 0.3400, 0.3233, 0.3100, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 08:36:57');
INSERT INTO `Process_record` VALUES (804, 2, 0.3300, 0.3233, 0.3200, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 08:51:58');
INSERT INTO `Process_record` VALUES (805, 2, 0.3300, 0.3233, 0.3200, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 09:06:59');
INSERT INTO `Process_record` VALUES (806, 2, 0.3300, 0.3100, 0.3000, 598.5400, 598.5400, 598.5400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 09:21:59');
INSERT INTO `Process_record` VALUES (807, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 09:36:59');
INSERT INTO `Process_record` VALUES (808, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 09:51:59');
INSERT INTO `Process_record` VALUES (809, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 10:07:00');
INSERT INTO `Process_record` VALUES (810, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 10:22:01');
INSERT INTO `Process_record` VALUES (811, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 10:37:01');
INSERT INTO `Process_record` VALUES (812, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 10:52:01');
INSERT INTO `Process_record` VALUES (813, 2, 0.3400, 0.3233, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 11:07:02');
INSERT INTO `Process_record` VALUES (814, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 11:22:02');
INSERT INTO `Process_record` VALUES (815, 2, 0.3400, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 11:37:02');
INSERT INTO `Process_record` VALUES (816, 2, 0.3300, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 11:52:02');
INSERT INTO `Process_record` VALUES (817, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 12:07:03');
INSERT INTO `Process_record` VALUES (818, 2, 0.3300, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 12:22:04');
INSERT INTO `Process_record` VALUES (819, 2, 0.3200, 0.3200, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 12:37:05');
INSERT INTO `Process_record` VALUES (820, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 12:52:05');
INSERT INTO `Process_record` VALUES (821, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 13:07:05');
INSERT INTO `Process_record` VALUES (822, 2, 0.3300, 0.3267, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 13:22:06');
INSERT INTO `Process_record` VALUES (823, 2, 0.3500, 0.3300, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 13:37:07');
INSERT INTO `Process_record` VALUES (824, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 13:52:08');
INSERT INTO `Process_record` VALUES (825, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 14:07:09');
INSERT INTO `Process_record` VALUES (826, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 14:22:10');
INSERT INTO `Process_record` VALUES (827, 2, 0.3300, 0.3233, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 14:37:11');
INSERT INTO `Process_record` VALUES (828, 2, 0.3300, 0.3233, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 14:52:11');
INSERT INTO `Process_record` VALUES (829, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 15:07:12');
INSERT INTO `Process_record` VALUES (830, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 15:22:12');
INSERT INTO `Process_record` VALUES (831, 2, 0.3200, 0.3100, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 15:37:13');
INSERT INTO `Process_record` VALUES (832, 2, 0.3300, 0.3233, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 15:52:14');
INSERT INTO `Process_record` VALUES (833, 2, 0.3400, 0.3267, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 16:07:14');
INSERT INTO `Process_record` VALUES (834, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 16:22:14');
INSERT INTO `Process_record` VALUES (835, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 16:37:15');
INSERT INTO `Process_record` VALUES (836, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 16:52:15');
INSERT INTO `Process_record` VALUES (837, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 17:07:16');
INSERT INTO `Process_record` VALUES (838, 2, 0.3400, 0.3267, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 17:22:17');
INSERT INTO `Process_record` VALUES (839, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 17:37:18');
INSERT INTO `Process_record` VALUES (840, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 17:52:19');
INSERT INTO `Process_record` VALUES (841, 2, 0.3400, 0.3267, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 18:07:20');
INSERT INTO `Process_record` VALUES (842, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 18:22:20');
INSERT INTO `Process_record` VALUES (843, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 18:37:21');
INSERT INTO `Process_record` VALUES (844, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 18:52:22');
INSERT INTO `Process_record` VALUES (845, 2, 0.3300, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 19:07:23');
INSERT INTO `Process_record` VALUES (846, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 19:22:24');
INSERT INTO `Process_record` VALUES (847, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 19:37:25');
INSERT INTO `Process_record` VALUES (848, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 19:52:26');
INSERT INTO `Process_record` VALUES (849, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 20:07:27');
INSERT INTO `Process_record` VALUES (850, 2, 0.3200, 0.3067, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 20:22:27');
INSERT INTO `Process_record` VALUES (851, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 20:37:28');
INSERT INTO `Process_record` VALUES (852, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 20:52:29');
INSERT INTO `Process_record` VALUES (853, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 21:07:29');
INSERT INTO `Process_record` VALUES (854, 2, 0.3100, 0.3033, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 21:22:30');
INSERT INTO `Process_record` VALUES (855, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 21:37:31');
INSERT INTO `Process_record` VALUES (856, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 21:52:31');
INSERT INTO `Process_record` VALUES (857, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 22:07:31');
INSERT INTO `Process_record` VALUES (858, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 22:22:32');
INSERT INTO `Process_record` VALUES (859, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 22:37:33');
INSERT INTO `Process_record` VALUES (860, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 22:52:33');
INSERT INTO `Process_record` VALUES (861, 2, 0.3000, 0.2933, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 23:07:34');
INSERT INTO `Process_record` VALUES (862, 2, 0.3000, 0.2967, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 23:22:35');
INSERT INTO `Process_record` VALUES (863, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 23:37:36');
INSERT INTO `Process_record` VALUES (864, 2, 0.3100, 0.3000, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-25 23:52:36');
INSERT INTO `Process_record` VALUES (865, 2, 0.3000, 0.2933, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 00:07:37');
INSERT INTO `Process_record` VALUES (866, 2, 0.3000, 0.3000, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 00:22:38');
INSERT INTO `Process_record` VALUES (867, 2, 0.3100, 0.3000, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 00:37:39');
INSERT INTO `Process_record` VALUES (868, 2, 0.3100, 0.2967, 0.2800, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 00:52:40');
INSERT INTO `Process_record` VALUES (869, 2, 0.3100, 0.3033, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 01:07:40');
INSERT INTO `Process_record` VALUES (870, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 01:22:41');
INSERT INTO `Process_record` VALUES (871, 2, 0.3100, 0.3033, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 01:37:42');
INSERT INTO `Process_record` VALUES (872, 2, 0.3100, 0.3033, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 01:52:43');
INSERT INTO `Process_record` VALUES (873, 2, 0.3200, 0.3033, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 02:07:44');
INSERT INTO `Process_record` VALUES (874, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 02:22:44');
INSERT INTO `Process_record` VALUES (875, 2, 0.3200, 0.3067, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 02:37:45');
INSERT INTO `Process_record` VALUES (876, 2, 0.3200, 0.3033, 0.2800, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 02:52:46');
INSERT INTO `Process_record` VALUES (877, 2, 0.3100, 0.3000, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 03:07:47');
INSERT INTO `Process_record` VALUES (878, 2, 0.3200, 0.3033, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 03:22:48');
INSERT INTO `Process_record` VALUES (879, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 03:37:48');
INSERT INTO `Process_record` VALUES (880, 2, 0.3100, 0.3033, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 03:52:49');
INSERT INTO `Process_record` VALUES (881, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 04:07:49');
INSERT INTO `Process_record` VALUES (882, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 04:22:50');
INSERT INTO `Process_record` VALUES (883, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 04:37:50');
INSERT INTO `Process_record` VALUES (884, 2, 0.3100, 0.3033, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 04:52:50');
INSERT INTO `Process_record` VALUES (885, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 05:07:51');
INSERT INTO `Process_record` VALUES (886, 2, 0.3100, 0.3033, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 05:22:52');
INSERT INTO `Process_record` VALUES (887, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 05:37:53');
INSERT INTO `Process_record` VALUES (888, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 05:52:54');
INSERT INTO `Process_record` VALUES (889, 2, 0.3200, 0.3100, 0.3000, 599.0500, 597.9633, 595.7900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 06:07:55');
INSERT INTO `Process_record` VALUES (890, 2, 0.3100, 0.3033, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 06:22:56');
INSERT INTO `Process_record` VALUES (891, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 06:37:57');
INSERT INTO `Process_record` VALUES (892, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 06:52:58');
INSERT INTO `Process_record` VALUES (893, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 07:07:59');
INSERT INTO `Process_record` VALUES (894, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 07:23:00');
INSERT INTO `Process_record` VALUES (895, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 07:38:00');
INSERT INTO `Process_record` VALUES (896, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 07:53:02');
INSERT INTO `Process_record` VALUES (897, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 08:08:03');
INSERT INTO `Process_record` VALUES (898, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 08:23:04');
INSERT INTO `Process_record` VALUES (899, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 08:38:05');
INSERT INTO `Process_record` VALUES (900, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 08:53:06');
INSERT INTO `Process_record` VALUES (901, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 09:08:07');
INSERT INTO `Process_record` VALUES (902, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 09:23:07');
INSERT INTO `Process_record` VALUES (903, 2, 0.3300, 0.3233, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 09:38:08');
INSERT INTO `Process_record` VALUES (904, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 09:53:09');
INSERT INTO `Process_record` VALUES (905, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 10:08:10');
INSERT INTO `Process_record` VALUES (906, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 10:23:10');
INSERT INTO `Process_record` VALUES (907, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 10:38:11');
INSERT INTO `Process_record` VALUES (908, 2, 0.3300, 0.3233, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 10:53:12');
INSERT INTO `Process_record` VALUES (909, 2, 0.3200, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 11:08:13');
INSERT INTO `Process_record` VALUES (910, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 11:23:14');
INSERT INTO `Process_record` VALUES (911, 2, 0.3300, 0.3233, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 11:38:15');
INSERT INTO `Process_record` VALUES (912, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 11:53:16');
INSERT INTO `Process_record` VALUES (913, 2, 0.3200, 0.3200, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 12:08:16');
INSERT INTO `Process_record` VALUES (914, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 12:23:17');
INSERT INTO `Process_record` VALUES (915, 2, 0.3300, 0.3267, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 12:38:18');
INSERT INTO `Process_record` VALUES (916, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 12:53:18');
INSERT INTO `Process_record` VALUES (917, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 13:08:18');
INSERT INTO `Process_record` VALUES (918, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 13:23:19');
INSERT INTO `Process_record` VALUES (919, 2, 0.3300, 0.3200, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 13:38:20');
INSERT INTO `Process_record` VALUES (920, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 13:53:20');
INSERT INTO `Process_record` VALUES (921, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 14:08:21');
INSERT INTO `Process_record` VALUES (922, 2, 0.3300, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 14:23:22');
INSERT INTO `Process_record` VALUES (923, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 14:38:22');
INSERT INTO `Process_record` VALUES (924, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 14:53:22');
INSERT INTO `Process_record` VALUES (925, 2, 0.3100, 0.3033, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 15:08:22');
INSERT INTO `Process_record` VALUES (926, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 15:23:22');
INSERT INTO `Process_record` VALUES (927, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 15:38:22');
INSERT INTO `Process_record` VALUES (928, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 15:53:24');
INSERT INTO `Process_record` VALUES (929, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 16:08:25');
INSERT INTO `Process_record` VALUES (930, 2, 0.3300, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 16:23:25');
INSERT INTO `Process_record` VALUES (931, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 16:38:26');
INSERT INTO `Process_record` VALUES (932, 2, 0.3200, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 16:53:26');
INSERT INTO `Process_record` VALUES (933, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 17:08:27');
INSERT INTO `Process_record` VALUES (934, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 17:23:28');
INSERT INTO `Process_record` VALUES (935, 2, 0.3600, 0.3300, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 17:38:28');
INSERT INTO `Process_record` VALUES (936, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 17:53:28');
INSERT INTO `Process_record` VALUES (937, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 18:08:28');
INSERT INTO `Process_record` VALUES (938, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 18:23:29');
INSERT INTO `Process_record` VALUES (939, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 18:38:30');
INSERT INTO `Process_record` VALUES (940, 2, 0.3200, 0.3100, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 18:53:31');
INSERT INTO `Process_record` VALUES (941, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 19:08:32');
INSERT INTO `Process_record` VALUES (942, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 19:23:32');
INSERT INTO `Process_record` VALUES (943, 2, 0.3300, 0.3200, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 19:38:33');
INSERT INTO `Process_record` VALUES (944, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 19:53:34');
INSERT INTO `Process_record` VALUES (945, 2, 0.3300, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 20:08:35');
INSERT INTO `Process_record` VALUES (946, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 20:23:36');
INSERT INTO `Process_record` VALUES (947, 2, 0.3300, 0.3233, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 20:38:37');
INSERT INTO `Process_record` VALUES (948, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 20:53:38');
INSERT INTO `Process_record` VALUES (949, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 21:08:39');
INSERT INTO `Process_record` VALUES (950, 2, 0.3300, 0.3267, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 21:23:40');
INSERT INTO `Process_record` VALUES (951, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 21:38:41');
INSERT INTO `Process_record` VALUES (952, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 21:53:42');
INSERT INTO `Process_record` VALUES (953, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 22:08:42');
INSERT INTO `Process_record` VALUES (954, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 22:23:43');
INSERT INTO `Process_record` VALUES (955, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 22:38:44');
INSERT INTO `Process_record` VALUES (956, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 22:53:44');
INSERT INTO `Process_record` VALUES (957, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 23:08:45');
INSERT INTO `Process_record` VALUES (958, 2, 0.3000, 0.3000, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 23:23:46');
INSERT INTO `Process_record` VALUES (959, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 23:38:46');
INSERT INTO `Process_record` VALUES (960, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-26 23:53:47');
INSERT INTO `Process_record` VALUES (961, 2, 0.3300, 0.3267, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 00:08:47');
INSERT INTO `Process_record` VALUES (962, 2, 0.3300, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 00:23:48');
INSERT INTO `Process_record` VALUES (963, 2, 0.3300, 0.3067, 0.2900, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 00:38:49');
INSERT INTO `Process_record` VALUES (964, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 00:53:50');
INSERT INTO `Process_record` VALUES (965, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 01:08:50');
INSERT INTO `Process_record` VALUES (966, 2, 0.3200, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 01:23:51');
INSERT INTO `Process_record` VALUES (967, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 01:38:51');
INSERT INTO `Process_record` VALUES (968, 2, 0.3200, 0.3200, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 01:53:51');
INSERT INTO `Process_record` VALUES (969, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 02:08:52');
INSERT INTO `Process_record` VALUES (970, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 02:23:53');
INSERT INTO `Process_record` VALUES (971, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 02:38:54');
INSERT INTO `Process_record` VALUES (972, 2, 0.3200, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 02:53:54');
INSERT INTO `Process_record` VALUES (973, 2, 0.3200, 0.3200, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 03:08:54');
INSERT INTO `Process_record` VALUES (974, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 03:23:55');
INSERT INTO `Process_record` VALUES (975, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 03:38:56');
INSERT INTO `Process_record` VALUES (976, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 03:53:57');
INSERT INTO `Process_record` VALUES (977, 2, 0.3200, 0.3100, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 04:08:58');
INSERT INTO `Process_record` VALUES (978, 2, 0.3300, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 04:23:59');
INSERT INTO `Process_record` VALUES (979, 2, 0.3400, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 04:39:00');
INSERT INTO `Process_record` VALUES (980, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 04:54:00');
INSERT INTO `Process_record` VALUES (981, 2, 0.3300, 0.3233, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 05:09:01');
INSERT INTO `Process_record` VALUES (982, 2, 0.3200, 0.3133, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 05:24:02');
INSERT INTO `Process_record` VALUES (983, 2, 0.3400, 0.3233, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 05:39:02');
INSERT INTO `Process_record` VALUES (984, 2, 0.3200, 0.3200, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 05:54:02');
INSERT INTO `Process_record` VALUES (985, 2, 0.3300, 0.3233, 0.3200, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 06:09:03');
INSERT INTO `Process_record` VALUES (986, 2, 0.3300, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 06:24:04');
INSERT INTO `Process_record` VALUES (987, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 06:39:04');
INSERT INTO `Process_record` VALUES (988, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 06:54:05');
INSERT INTO `Process_record` VALUES (989, 2, 0.3200, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 07:09:06');
INSERT INTO `Process_record` VALUES (990, 2, 0.3100, 0.3100, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 07:24:06');
INSERT INTO `Process_record` VALUES (991, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 07:39:07');
INSERT INTO `Process_record` VALUES (992, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 07:54:08');
INSERT INTO `Process_record` VALUES (993, 2, 0.3100, 0.3067, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 08:09:08');
INSERT INTO `Process_record` VALUES (994, 2, 0.3200, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 08:24:10');
INSERT INTO `Process_record` VALUES (995, 2, 0.3300, 0.3167, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 08:39:11');
INSERT INTO `Process_record` VALUES (996, 2, 0.3300, 0.3200, 0.3100, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 08:54:11');
INSERT INTO `Process_record` VALUES (997, 2, 0.3300, 0.3133, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 09:09:12');
INSERT INTO `Process_record` VALUES (998, 2, 0.3300, 0.3167, 0.3000, 599.0500, 599.0500, 599.0500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 09:24:13');
INSERT INTO `Process_record` VALUES (999, 2, 0.4200, 0.3567, 0.3200, 599.3100, 599.2233, 599.0500, 0.0000, 0.0000, 0.0000, 0.0200, 0.0067, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 09:39:14');
INSERT INTO `Process_record` VALUES (1000, 2, 0.3500, 0.3400, 0.3300, 601.5900, 600.8300, 599.3100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 09:54:14');
INSERT INTO `Process_record` VALUES (1001, 2, 0.3300, 0.3300, 0.3300, 602.6600, 601.9467, 601.5900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 10:09:15');
INSERT INTO `Process_record` VALUES (1002, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 10:24:16');
INSERT INTO `Process_record` VALUES (1003, 2, 0.3400, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 10:39:16');
INSERT INTO `Process_record` VALUES (1004, 2, 0.3200, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 10:54:16');
INSERT INTO `Process_record` VALUES (1005, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 11:09:17');
INSERT INTO `Process_record` VALUES (1006, 2, 0.3200, 0.3100, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 11:24:18');
INSERT INTO `Process_record` VALUES (1007, 2, 0.3400, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 11:39:19');
INSERT INTO `Process_record` VALUES (1008, 2, 0.3200, 0.3133, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 11:54:20');
INSERT INTO `Process_record` VALUES (1009, 2, 0.3300, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 12:09:21');
INSERT INTO `Process_record` VALUES (1010, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 12:24:21');
INSERT INTO `Process_record` VALUES (1011, 2, 0.3200, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 12:39:22');
INSERT INTO `Process_record` VALUES (1012, 2, 0.3200, 0.3133, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 12:54:23');
INSERT INTO `Process_record` VALUES (1013, 2, 0.3300, 0.3267, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 13:09:24');
INSERT INTO `Process_record` VALUES (1014, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 13:24:25');
INSERT INTO `Process_record` VALUES (1015, 2, 0.3300, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 13:39:26');
INSERT INTO `Process_record` VALUES (1016, 2, 0.3100, 0.3067, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 13:54:27');
INSERT INTO `Process_record` VALUES (1017, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 14:09:28');
INSERT INTO `Process_record` VALUES (1018, 2, 0.3300, 0.3267, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 14:24:29');
INSERT INTO `Process_record` VALUES (1019, 2, 0.3300, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 14:39:30');
INSERT INTO `Process_record` VALUES (1020, 2, 0.3300, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 14:54:31');
INSERT INTO `Process_record` VALUES (1021, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 15:09:32');
INSERT INTO `Process_record` VALUES (1022, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 15:24:33');
INSERT INTO `Process_record` VALUES (1023, 2, 0.3400, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 15:39:34');
INSERT INTO `Process_record` VALUES (1024, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 15:54:34');
INSERT INTO `Process_record` VALUES (1025, 2, 0.3400, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 16:09:35');
INSERT INTO `Process_record` VALUES (1026, 2, 0.3200, 0.3133, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 16:24:36');
INSERT INTO `Process_record` VALUES (1027, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 16:39:37');
INSERT INTO `Process_record` VALUES (1028, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 16:54:38');
INSERT INTO `Process_record` VALUES (1029, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 17:09:39');
INSERT INTO `Process_record` VALUES (1030, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 17:24:40');
INSERT INTO `Process_record` VALUES (1031, 2, 0.3300, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 17:39:41');
INSERT INTO `Process_record` VALUES (1032, 2, 0.3100, 0.3100, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 17:54:41');
INSERT INTO `Process_record` VALUES (1033, 2, 0.3300, 0.3200, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 18:09:42');
INSERT INTO `Process_record` VALUES (1034, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 18:24:43');
INSERT INTO `Process_record` VALUES (1035, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 18:39:44');
INSERT INTO `Process_record` VALUES (1036, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 18:54:44');
INSERT INTO `Process_record` VALUES (1037, 2, 0.3400, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 19:09:44');
INSERT INTO `Process_record` VALUES (1038, 2, 0.3100, 0.3100, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 19:24:45');
INSERT INTO `Process_record` VALUES (1039, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 19:39:46');
INSERT INTO `Process_record` VALUES (1040, 2, 0.3300, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 19:54:46');
INSERT INTO `Process_record` VALUES (1041, 2, 0.3300, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 20:09:47');
INSERT INTO `Process_record` VALUES (1042, 2, 0.3200, 0.3133, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 20:24:48');
INSERT INTO `Process_record` VALUES (1043, 2, 0.3400, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 20:39:49');
INSERT INTO `Process_record` VALUES (1044, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 20:54:49');
INSERT INTO `Process_record` VALUES (1045, 2, 0.3300, 0.3100, 0.2900, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 21:09:49');
INSERT INTO `Process_record` VALUES (1046, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 21:24:49');
INSERT INTO `Process_record` VALUES (1047, 2, 0.3400, 0.3300, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 21:39:51');
INSERT INTO `Process_record` VALUES (1048, 2, 0.3300, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 21:54:51');
INSERT INTO `Process_record` VALUES (1049, 2, 0.3400, 0.3300, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 22:09:51');
INSERT INTO `Process_record` VALUES (1050, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 22:24:51');
INSERT INTO `Process_record` VALUES (1051, 2, 0.3300, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 22:39:52');
INSERT INTO `Process_record` VALUES (1052, 2, 0.3300, 0.3133, 0.2900, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 22:54:53');
INSERT INTO `Process_record` VALUES (1053, 2, 0.3200, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 23:09:54');
INSERT INTO `Process_record` VALUES (1054, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 23:24:55');
INSERT INTO `Process_record` VALUES (1055, 2, 0.3300, 0.3167, 0.2900, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 23:39:56');
INSERT INTO `Process_record` VALUES (1056, 2, 0.3300, 0.3267, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-27 23:54:56');
INSERT INTO `Process_record` VALUES (1057, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 00:09:56');
INSERT INTO `Process_record` VALUES (1058, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 00:24:57');
INSERT INTO `Process_record` VALUES (1059, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 00:39:58');
INSERT INTO `Process_record` VALUES (1060, 2, 0.3200, 0.3100, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 00:54:59');
INSERT INTO `Process_record` VALUES (1061, 2, 0.3300, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 01:10:00');
INSERT INTO `Process_record` VALUES (1062, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 01:25:01');
INSERT INTO `Process_record` VALUES (1063, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 01:40:02');
INSERT INTO `Process_record` VALUES (1064, 2, 0.3200, 0.3200, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 01:55:02');
INSERT INTO `Process_record` VALUES (1065, 2, 0.3200, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 02:10:02');
INSERT INTO `Process_record` VALUES (1066, 2, 0.3200, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 02:25:03');
INSERT INTO `Process_record` VALUES (1067, 2, 0.3400, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 02:40:04');
INSERT INTO `Process_record` VALUES (1068, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 02:55:05');
INSERT INTO `Process_record` VALUES (1069, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 03:10:05');
INSERT INTO `Process_record` VALUES (1070, 2, 0.3100, 0.3067, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 03:25:06');
INSERT INTO `Process_record` VALUES (1071, 2, 0.3300, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 03:40:06');
INSERT INTO `Process_record` VALUES (1072, 2, 0.3200, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 03:55:07');
INSERT INTO `Process_record` VALUES (1073, 2, 0.3200, 0.3100, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 04:10:08');
INSERT INTO `Process_record` VALUES (1074, 2, 0.3100, 0.3067, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 04:25:09');
INSERT INTO `Process_record` VALUES (1075, 2, 0.3300, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 04:40:10');
INSERT INTO `Process_record` VALUES (1076, 2, 0.3300, 0.3133, 0.2900, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 04:55:11');
INSERT INTO `Process_record` VALUES (1077, 2, 0.3300, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 05:10:12');
INSERT INTO `Process_record` VALUES (1078, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 05:25:13');
INSERT INTO `Process_record` VALUES (1079, 2, 0.3500, 0.3300, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 05:40:14');
INSERT INTO `Process_record` VALUES (1080, 2, 0.3200, 0.3200, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 05:55:15');
INSERT INTO `Process_record` VALUES (1081, 2, 0.3200, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 06:10:16');
INSERT INTO `Process_record` VALUES (1082, 2, 0.3400, 0.3367, 0.3300, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 06:25:16');
INSERT INTO `Process_record` VALUES (1083, 2, 0.3400, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 06:40:17');
INSERT INTO `Process_record` VALUES (1084, 2, 0.3300, 0.3267, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 06:55:17');
INSERT INTO `Process_record` VALUES (1085, 2, 0.3300, 0.3100, 0.2900, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 07:10:18');
INSERT INTO `Process_record` VALUES (1086, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 07:25:20');
INSERT INTO `Process_record` VALUES (1087, 2, 0.3300, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 07:40:20');
INSERT INTO `Process_record` VALUES (1088, 2, 0.3200, 0.3200, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 07:55:20');
INSERT INTO `Process_record` VALUES (1089, 2, 0.3300, 0.3133, 0.2900, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 08:10:21');
INSERT INTO `Process_record` VALUES (1090, 2, 0.3300, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 08:25:21');
INSERT INTO `Process_record` VALUES (1091, 2, 0.3400, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 08:40:22');
INSERT INTO `Process_record` VALUES (1092, 2, 0.3300, 0.3067, 0.2800, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 08:55:22');
INSERT INTO `Process_record` VALUES (1093, 2, 0.3100, 0.3067, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 09:10:23');
INSERT INTO `Process_record` VALUES (1094, 2, 0.3100, 0.3067, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 09:25:23');
INSERT INTO `Process_record` VALUES (1095, 2, 0.3300, 0.3167, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 09:40:24');
INSERT INTO `Process_record` VALUES (1096, 2, 0.3100, 0.3067, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 09:55:25');
INSERT INTO `Process_record` VALUES (1097, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 10:10:26');
INSERT INTO `Process_record` VALUES (1098, 2, 0.3300, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 10:25:27');
INSERT INTO `Process_record` VALUES (1099, 2, 0.3300, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 10:40:28');
INSERT INTO `Process_record` VALUES (1100, 2, 0.3300, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 10:55:29');
INSERT INTO `Process_record` VALUES (1101, 2, 0.3400, 0.3267, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 11:10:30');
INSERT INTO `Process_record` VALUES (1102, 2, 0.3300, 0.3133, 0.2900, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 11:25:31');
INSERT INTO `Process_record` VALUES (1103, 2, 0.3300, 0.3200, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 11:40:32');
INSERT INTO `Process_record` VALUES (1104, 2, 0.3300, 0.3167, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 11:55:32');
INSERT INTO `Process_record` VALUES (1105, 2, 0.3300, 0.3233, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 12:10:33');
INSERT INTO `Process_record` VALUES (1106, 2, 0.3400, 0.3233, 0.3100, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 12:25:34');
INSERT INTO `Process_record` VALUES (1107, 2, 0.3300, 0.3133, 0.2900, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 12:40:35');
INSERT INTO `Process_record` VALUES (1108, 2, 0.3300, 0.3133, 0.3000, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 12:55:36');
INSERT INTO `Process_record` VALUES (1109, 2, 0.3200, 0.3200, 0.3200, 602.6600, 602.6600, 602.6600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-28 13:10:37');
INSERT INTO `Process_record` VALUES (1110, 2, 0.3300, 0.3133, 0.3000, 602.6600, 473.2800, 408.5900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 16:40:58');
INSERT INTO `Process_record` VALUES (1111, 2, 0.3100, 0.3033, 0.2900, 408.8500, 408.8500, 408.8500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 16:55:59');
INSERT INTO `Process_record` VALUES (1112, 2, 0.3300, 0.3200, 0.3100, 408.8500, 408.8500, 408.8500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 17:11:00');
INSERT INTO `Process_record` VALUES (1113, 2, 0.3100, 0.3067, 0.3000, 408.8500, 408.8500, 408.8500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 17:26:01');
INSERT INTO `Process_record` VALUES (1114, 2, 0.3100, 0.3100, 0.3100, 408.8500, 408.8500, 408.8500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 17:41:02');
INSERT INTO `Process_record` VALUES (1115, 2, 0.3300, 0.3200, 0.3100, 408.8500, 408.8500, 408.8500, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 17:56:03');
INSERT INTO `Process_record` VALUES (1116, 2, 0.3200, 0.3100, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 18:11:03');
INSERT INTO `Process_record` VALUES (1117, 2, 0.3100, 0.3067, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 18:26:04');
INSERT INTO `Process_record` VALUES (1118, 2, 0.3100, 0.3100, 0.3100, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 18:41:05');
INSERT INTO `Process_record` VALUES (1119, 2, 0.3200, 0.3100, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 18:56:06');
INSERT INTO `Process_record` VALUES (1120, 2, 0.3400, 0.3233, 0.3100, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 19:11:07');
INSERT INTO `Process_record` VALUES (1121, 2, 0.3100, 0.3033, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 19:26:07');
INSERT INTO `Process_record` VALUES (1122, 2, 0.3200, 0.3067, 0.2900, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 19:41:08');
INSERT INTO `Process_record` VALUES (1123, 2, 0.3200, 0.3133, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 19:56:09');
INSERT INTO `Process_record` VALUES (1124, 2, 0.3100, 0.3033, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 20:11:10');
INSERT INTO `Process_record` VALUES (1125, 2, 0.3100, 0.3067, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 20:26:10');
INSERT INTO `Process_record` VALUES (1126, 2, 0.3200, 0.3067, 0.2800, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 20:41:11');
INSERT INTO `Process_record` VALUES (1127, 2, 0.3100, 0.3067, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 20:56:12');
INSERT INTO `Process_record` VALUES (1128, 2, 0.3200, 0.3100, 0.3000, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 21:11:13');
INSERT INTO `Process_record` VALUES (1129, 2, 0.3100, 0.3000, 0.2900, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 21:26:14');
INSERT INTO `Process_record` VALUES (1130, 2, 0.3100, 0.3100, 0.3100, 409.1100, 409.1100, 409.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 21:41:15');
INSERT INTO `Process_record` VALUES (1131, 2, 0.3100, 0.3033, 0.2900, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 21:56:16');
INSERT INTO `Process_record` VALUES (1132, 2, 0.3200, 0.3067, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 22:11:17');
INSERT INTO `Process_record` VALUES (1133, 2, 0.3200, 0.3100, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 22:26:17');
INSERT INTO `Process_record` VALUES (1134, 2, 0.3400, 0.3233, 0.3100, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 22:41:18');
INSERT INTO `Process_record` VALUES (1135, 2, 0.3200, 0.3067, 0.2900, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 22:56:19');
INSERT INTO `Process_record` VALUES (1136, 2, 0.3100, 0.3033, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 23:11:20');
INSERT INTO `Process_record` VALUES (1137, 2, 0.3300, 0.3133, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 23:26:21');
INSERT INTO `Process_record` VALUES (1138, 2, 0.3100, 0.3033, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 23:41:21');
INSERT INTO `Process_record` VALUES (1139, 2, 0.3100, 0.3100, 0.3100, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-30 23:56:22');
INSERT INTO `Process_record` VALUES (1140, 2, 0.3200, 0.3033, 0.2900, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 00:11:23');
INSERT INTO `Process_record` VALUES (1141, 2, 0.3300, 0.3233, 0.3200, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 00:26:23');
INSERT INTO `Process_record` VALUES (1142, 2, 0.3300, 0.3133, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 00:41:24');
INSERT INTO `Process_record` VALUES (1143, 2, 0.3000, 0.3000, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 00:56:24');
INSERT INTO `Process_record` VALUES (1144, 2, 0.3200, 0.3133, 0.3100, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 01:11:25');
INSERT INTO `Process_record` VALUES (1145, 2, 0.3400, 0.3300, 0.3200, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 01:26:25');
INSERT INTO `Process_record` VALUES (1146, 2, 0.3300, 0.3200, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 01:41:26');
INSERT INTO `Process_record` VALUES (1147, 2, 0.3200, 0.3100, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 01:56:27');
INSERT INTO `Process_record` VALUES (1148, 2, 0.3300, 0.3167, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 02:11:28');
INSERT INTO `Process_record` VALUES (1149, 2, 0.3200, 0.3100, 0.3000, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 02:26:29');
INSERT INTO `Process_record` VALUES (1150, 2, 0.3200, 0.3167, 0.3100, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 02:41:30');
INSERT INTO `Process_record` VALUES (1151, 2, 0.3100, 0.3000, 0.2800, 409.3600, 409.3600, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 02:56:31');
INSERT INTO `Process_record` VALUES (1152, 2, 0.3200, 0.3133, 0.3000, 409.6200, 409.5333, 409.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 03:11:31');
INSERT INTO `Process_record` VALUES (1153, 2, 0.3200, 0.3100, 0.3000, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 03:26:32');
INSERT INTO `Process_record` VALUES (1154, 2, 0.3200, 0.3100, 0.3000, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 03:41:33');
INSERT INTO `Process_record` VALUES (1155, 2, 0.3300, 0.3167, 0.3100, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 03:56:34');
INSERT INTO `Process_record` VALUES (1156, 2, 0.3200, 0.3167, 0.3100, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 04:11:35');
INSERT INTO `Process_record` VALUES (1157, 2, 0.3100, 0.3067, 0.3000, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 04:26:35');
INSERT INTO `Process_record` VALUES (1158, 2, 0.3300, 0.3200, 0.3100, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 04:41:36');
INSERT INTO `Process_record` VALUES (1159, 2, 0.3300, 0.3167, 0.3000, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 04:56:37');
INSERT INTO `Process_record` VALUES (1160, 2, 0.3200, 0.3167, 0.3100, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 05:11:38');
INSERT INTO `Process_record` VALUES (1161, 2, 0.3200, 0.3067, 0.3000, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 05:26:38');
INSERT INTO `Process_record` VALUES (1162, 2, 0.3300, 0.3167, 0.3100, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 05:41:39');
INSERT INTO `Process_record` VALUES (1163, 2, 0.3200, 0.3100, 0.3000, 409.6200, 409.6200, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 05:56:40');
INSERT INTO `Process_record` VALUES (1164, 2, 0.3400, 0.3233, 0.3100, 409.8800, 409.7067, 409.6200, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 06:11:41');
INSERT INTO `Process_record` VALUES (1165, 2, 0.3200, 0.3167, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 06:26:42');
INSERT INTO `Process_record` VALUES (1166, 2, 0.3300, 0.3133, 0.3000, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 06:41:43');
INSERT INTO `Process_record` VALUES (1167, 2, 0.3200, 0.3167, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 06:56:44');
INSERT INTO `Process_record` VALUES (1168, 2, 0.3400, 0.3233, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 07:11:44');
INSERT INTO `Process_record` VALUES (1169, 2, 0.3200, 0.3133, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 07:26:45');
INSERT INTO `Process_record` VALUES (1170, 2, 0.3400, 0.3100, 0.2900, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 07:41:46');
INSERT INTO `Process_record` VALUES (1171, 2, 0.3200, 0.3200, 0.3200, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 07:56:47');
INSERT INTO `Process_record` VALUES (1172, 2, 0.3200, 0.3133, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 08:11:48');
INSERT INTO `Process_record` VALUES (1173, 2, 0.3300, 0.3267, 0.3200, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 08:26:48');
INSERT INTO `Process_record` VALUES (1174, 2, 0.3200, 0.3133, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 08:41:49');
INSERT INTO `Process_record` VALUES (1175, 2, 0.3100, 0.3100, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 08:56:50');
INSERT INTO `Process_record` VALUES (1176, 2, 0.3300, 0.3200, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 09:11:51');
INSERT INTO `Process_record` VALUES (1177, 2, 0.3200, 0.3133, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 09:26:52');
INSERT INTO `Process_record` VALUES (1178, 2, 0.3300, 0.3167, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 09:41:53');
INSERT INTO `Process_record` VALUES (1179, 2, 0.3200, 0.3067, 0.2900, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 09:56:54');
INSERT INTO `Process_record` VALUES (1180, 2, 0.3400, 0.3167, 0.3000, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 10:11:54');
INSERT INTO `Process_record` VALUES (1181, 2, 0.3200, 0.3067, 0.2900, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 10:26:55');
INSERT INTO `Process_record` VALUES (1182, 2, 0.3100, 0.3067, 0.3000, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 10:41:56');
INSERT INTO `Process_record` VALUES (1183, 2, 0.3200, 0.3167, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 10:56:57');
INSERT INTO `Process_record` VALUES (1184, 2, 0.3100, 0.3033, 0.3000, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 11:11:58');
INSERT INTO `Process_record` VALUES (1185, 2, 0.3200, 0.3200, 0.3200, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 11:26:58');
INSERT INTO `Process_record` VALUES (1186, 2, 0.3300, 0.3167, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 11:41:59');
INSERT INTO `Process_record` VALUES (1187, 2, 0.3200, 0.3100, 0.3000, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 11:57:00');
INSERT INTO `Process_record` VALUES (1188, 2, 0.3200, 0.3100, 0.3000, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 12:12:01');
INSERT INTO `Process_record` VALUES (1189, 2, 0.3200, 0.3167, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 12:27:02');
INSERT INTO `Process_record` VALUES (1190, 2, 0.3200, 0.3133, 0.3000, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 12:42:02');
INSERT INTO `Process_record` VALUES (1191, 2, 0.3300, 0.3200, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 12:57:03');
INSERT INTO `Process_record` VALUES (1192, 2, 0.3300, 0.3200, 0.3100, 409.8800, 409.8800, 409.8800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 13:12:04');
INSERT INTO `Process_record` VALUES (1193, 2, 0.3200, 0.3133, 0.3000, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 13:27:05');
INSERT INTO `Process_record` VALUES (1194, 2, 0.3300, 0.3100, 0.2900, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 13:42:06');
INSERT INTO `Process_record` VALUES (1195, 2, 0.3200, 0.3100, 0.3000, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 13:57:07');
INSERT INTO `Process_record` VALUES (1196, 2, 0.3300, 0.3167, 0.3000, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 14:12:07');
INSERT INTO `Process_record` VALUES (1197, 2, 0.3100, 0.3067, 0.3000, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 14:27:08');
INSERT INTO `Process_record` VALUES (1198, 2, 0.3200, 0.3133, 0.3100, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 14:42:09');
INSERT INTO `Process_record` VALUES (1199, 2, 0.3300, 0.3233, 0.3200, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 14:57:10');
INSERT INTO `Process_record` VALUES (1200, 2, 0.3200, 0.3167, 0.3100, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 15:12:11');
INSERT INTO `Process_record` VALUES (1201, 2, 0.3100, 0.3067, 0.3000, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 15:27:11');
INSERT INTO `Process_record` VALUES (1202, 2, 0.3300, 0.3000, 0.2800, 410.1400, 410.1400, 410.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 15:42:12');
INSERT INTO `Process_record` VALUES (1203, 2, 0.3100, 0.3100, 0.3100, 410.3900, 410.3900, 410.3900, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 15:57:13');
INSERT INTO `Process_record` VALUES (1204, 2, 0.3200, 0.3133, 0.3100, 410.3900, 410.3900, 410.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 16:12:13');
INSERT INTO `Process_record` VALUES (1205, 2, 0.3200, 0.3167, 0.3100, 410.3900, 410.3900, 410.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 16:27:14');
INSERT INTO `Process_record` VALUES (1206, 2, 0.3500, 0.3133, 0.2900, 411.1600, 411.0733, 410.9000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 16:42:15');
INSERT INTO `Process_record` VALUES (1207, 2, 0.3200, 0.3133, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 16:57:16');
INSERT INTO `Process_record` VALUES (1208, 2, 0.3200, 0.3133, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 17:12:17');
INSERT INTO `Process_record` VALUES (1209, 2, 0.3200, 0.3067, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 17:27:17');
INSERT INTO `Process_record` VALUES (1210, 2, 0.3200, 0.3167, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 17:42:18');
INSERT INTO `Process_record` VALUES (1211, 2, 0.3300, 0.3167, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 17:57:19');
INSERT INTO `Process_record` VALUES (1212, 2, 0.3200, 0.3167, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 18:12:20');
INSERT INTO `Process_record` VALUES (1213, 2, 0.3100, 0.3067, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 18:27:21');
INSERT INTO `Process_record` VALUES (1214, 2, 0.3300, 0.3133, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 18:42:22');
INSERT INTO `Process_record` VALUES (1215, 2, 0.3300, 0.3133, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 18:57:23');
INSERT INTO `Process_record` VALUES (1216, 2, 0.3200, 0.3100, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 19:12:24');
INSERT INTO `Process_record` VALUES (1217, 2, 0.3300, 0.3133, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 19:27:25');
INSERT INTO `Process_record` VALUES (1218, 2, 0.3300, 0.3167, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 19:42:25');
INSERT INTO `Process_record` VALUES (1219, 2, 0.3200, 0.3133, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 19:57:27');
INSERT INTO `Process_record` VALUES (1220, 2, 0.3400, 0.3200, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 20:12:27');
INSERT INTO `Process_record` VALUES (1221, 2, 0.3200, 0.3133, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 20:27:28');
INSERT INTO `Process_record` VALUES (1222, 2, 0.3300, 0.3233, 0.3200, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 20:42:29');
INSERT INTO `Process_record` VALUES (1223, 2, 0.3200, 0.3100, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 20:57:30');
INSERT INTO `Process_record` VALUES (1224, 2, 0.3200, 0.3133, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 21:12:31');
INSERT INTO `Process_record` VALUES (1225, 2, 0.3300, 0.3233, 0.3200, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 21:27:32');
INSERT INTO `Process_record` VALUES (1226, 2, 0.3500, 0.3233, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 21:42:32');
INSERT INTO `Process_record` VALUES (1227, 2, 0.3100, 0.3067, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 21:57:33');
INSERT INTO `Process_record` VALUES (1228, 2, 0.3300, 0.3167, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 22:12:34');
INSERT INTO `Process_record` VALUES (1229, 2, 0.3200, 0.3133, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 22:27:35');
INSERT INTO `Process_record` VALUES (1230, 2, 0.3200, 0.3067, 0.2900, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 22:42:35');
INSERT INTO `Process_record` VALUES (1231, 2, 0.3300, 0.3133, 0.3000, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 22:57:36');
INSERT INTO `Process_record` VALUES (1232, 2, 0.3400, 0.3167, 0.2900, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 23:12:37');
INSERT INTO `Process_record` VALUES (1233, 2, 0.3200, 0.3067, 0.2900, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 23:27:38');
INSERT INTO `Process_record` VALUES (1234, 2, 0.3200, 0.3167, 0.3100, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 23:42:39');
INSERT INTO `Process_record` VALUES (1235, 2, 0.3200, 0.3067, 0.2900, 411.1600, 411.1600, 411.1600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-03-31 23:57:40');
INSERT INTO `Process_record` VALUES (2415, 2, 0.3200, 0.3067, 0.2900, 490.3700, 490.3700, 490.3700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 00:14:56');
INSERT INTO `Process_record` VALUES (2416, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 00:14:56');
INSERT INTO `Process_record` VALUES (2417, 2, 0.3100, 0.3000, 0.2900, 490.3700, 490.3700, 490.3700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 00:29:56');
INSERT INTO `Process_record` VALUES (2418, 33, 0.2400, 0.2300, 0.2200, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 00:29:56');
INSERT INTO `Process_record` VALUES (2419, 2, 0.3100, 0.3033, 0.2900, 490.3700, 490.3700, 490.3700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 00:44:57');
INSERT INTO `Process_record` VALUES (2420, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 00:44:57');
INSERT INTO `Process_record` VALUES (2421, 2, 0.3100, 0.3033, 0.2900, 490.3700, 490.3700, 490.3700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 00:59:58');
INSERT INTO `Process_record` VALUES (2422, 33, 0.2400, 0.2267, 0.2100, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 00:59:58');
INSERT INTO `Process_record` VALUES (2423, 2, 0.3200, 0.3100, 0.3000, 490.3700, 490.3700, 490.3700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 01:14:59');
INSERT INTO `Process_record` VALUES (2424, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 01:14:59');
INSERT INTO `Process_record` VALUES (2425, 2, 0.3000, 0.3000, 0.3000, 490.3700, 490.3700, 490.3700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 01:30:01');
INSERT INTO `Process_record` VALUES (2426, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 01:30:01');
INSERT INTO `Process_record` VALUES (2427, 2, 0.3000, 0.2933, 0.2900, 490.3700, 490.3700, 490.3700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 01:45:01');
INSERT INTO `Process_record` VALUES (2428, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 01:45:01');
INSERT INTO `Process_record` VALUES (2429, 2, 0.3000, 0.2933, 0.2900, 490.3700, 490.3700, 490.3700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 02:00:02');
INSERT INTO `Process_record` VALUES (2430, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 02:00:02');
INSERT INTO `Process_record` VALUES (2431, 2, 0.3200, 0.3167, 0.3100, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 02:15:03');
INSERT INTO `Process_record` VALUES (2432, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 02:15:03');
INSERT INTO `Process_record` VALUES (2433, 2, 0.3100, 0.3000, 0.2900, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 02:30:04');
INSERT INTO `Process_record` VALUES (2434, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 02:30:04');
INSERT INTO `Process_record` VALUES (2435, 2, 0.3100, 0.3033, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 02:45:05');
INSERT INTO `Process_record` VALUES (2436, 33, 0.2400, 0.2300, 0.2200, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 02:45:05');
INSERT INTO `Process_record` VALUES (2437, 2, 0.3100, 0.3033, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 03:00:06');
INSERT INTO `Process_record` VALUES (2438, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 03:00:06');
INSERT INTO `Process_record` VALUES (2439, 2, 0.3200, 0.3000, 0.2800, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 03:15:06');
INSERT INTO `Process_record` VALUES (2440, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 03:15:06');
INSERT INTO `Process_record` VALUES (2441, 2, 0.3200, 0.3100, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 03:30:08');
INSERT INTO `Process_record` VALUES (2442, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 03:30:08');
INSERT INTO `Process_record` VALUES (2443, 2, 0.3200, 0.3033, 0.2900, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 03:45:08');
INSERT INTO `Process_record` VALUES (2444, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 03:45:08');
INSERT INTO `Process_record` VALUES (2445, 2, 0.3100, 0.3033, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 04:00:09');
INSERT INTO `Process_record` VALUES (2446, 33, 0.2400, 0.2300, 0.2200, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 04:00:09');
INSERT INTO `Process_record` VALUES (2447, 2, 0.3300, 0.3067, 0.2900, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 04:15:10');
INSERT INTO `Process_record` VALUES (2448, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 04:15:10');
INSERT INTO `Process_record` VALUES (2449, 2, 0.3100, 0.3033, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 04:30:10');
INSERT INTO `Process_record` VALUES (2450, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 04:30:10');
INSERT INTO `Process_record` VALUES (2451, 2, 0.3100, 0.3067, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 04:45:11');
INSERT INTO `Process_record` VALUES (2452, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 04:45:11');
INSERT INTO `Process_record` VALUES (2453, 2, 0.3200, 0.3033, 0.2900, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 05:00:12');
INSERT INTO `Process_record` VALUES (2454, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 05:00:12');
INSERT INTO `Process_record` VALUES (2455, 2, 0.3300, 0.3133, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 05:15:13');
INSERT INTO `Process_record` VALUES (2456, 33, 0.2400, 0.2400, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 05:15:13');
INSERT INTO `Process_record` VALUES (2457, 2, 0.3100, 0.3000, 0.2900, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 05:30:13');
INSERT INTO `Process_record` VALUES (2458, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 05:30:13');
INSERT INTO `Process_record` VALUES (2459, 2, 0.3100, 0.3100, 0.3100, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 05:45:14');
INSERT INTO `Process_record` VALUES (2460, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 05:45:14');
INSERT INTO `Process_record` VALUES (2461, 2, 0.3300, 0.3100, 0.2900, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 06:00:15');
INSERT INTO `Process_record` VALUES (2462, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 06:00:15');
INSERT INTO `Process_record` VALUES (2463, 2, 0.3200, 0.3100, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 06:15:15');
INSERT INTO `Process_record` VALUES (2464, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 06:15:15');
INSERT INTO `Process_record` VALUES (2465, 2, 0.3100, 0.3000, 0.2900, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 06:30:16');
INSERT INTO `Process_record` VALUES (2466, 33, 0.2300, 0.2233, 0.2200, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 06:30:16');
INSERT INTO `Process_record` VALUES (2467, 2, 0.3100, 0.3033, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 06:45:17');
INSERT INTO `Process_record` VALUES (2468, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 06:45:17');
INSERT INTO `Process_record` VALUES (2469, 2, 0.3100, 0.3033, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 07:00:18');
INSERT INTO `Process_record` VALUES (2470, 33, 0.2300, 0.2267, 0.2200, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 07:00:18');
INSERT INTO `Process_record` VALUES (2471, 2, 0.3300, 0.3100, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 07:15:19');
INSERT INTO `Process_record` VALUES (2472, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 07:15:19');
INSERT INTO `Process_record` VALUES (2473, 2, 0.3200, 0.3033, 0.2900, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 07:30:19');
INSERT INTO `Process_record` VALUES (2474, 33, 0.2400, 0.2400, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 07:30:19');
INSERT INTO `Process_record` VALUES (2475, 2, 0.3100, 0.3067, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 07:45:20');
INSERT INTO `Process_record` VALUES (2476, 33, 0.2300, 0.2300, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 07:45:20');
INSERT INTO `Process_record` VALUES (2477, 2, 0.3100, 0.3033, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 08:00:21');
INSERT INTO `Process_record` VALUES (2478, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 08:00:21');
INSERT INTO `Process_record` VALUES (2479, 2, 0.3200, 0.3033, 0.2800, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 08:15:22');
INSERT INTO `Process_record` VALUES (2480, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 08:15:22');
INSERT INTO `Process_record` VALUES (2481, 2, 0.3200, 0.3067, 0.3000, 490.6300, 490.6300, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 08:30:23');
INSERT INTO `Process_record` VALUES (2482, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 08:30:23');
INSERT INTO `Process_record` VALUES (2483, 2, 0.3200, 0.3100, 0.3000, 490.8800, 490.7133, 490.6300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 08:45:24');
INSERT INTO `Process_record` VALUES (2484, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 08:45:24');
INSERT INTO `Process_record` VALUES (2485, 2, 0.3200, 0.3100, 0.3000, 490.8800, 490.8800, 490.8800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 09:00:25');
INSERT INTO `Process_record` VALUES (2486, 33, 0.2500, 0.2400, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 09:00:25');
INSERT INTO `Process_record` VALUES (2487, 2, 0.3200, 0.3033, 0.2900, 490.8800, 490.8800, 490.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 09:15:26');
INSERT INTO `Process_record` VALUES (2488, 33, 0.2400, 0.2300, 0.2200, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 09:15:26');
INSERT INTO `Process_record` VALUES (2489, 2, 0.3100, 0.3100, 0.3100, 490.8800, 490.8800, 490.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 09:30:26');
INSERT INTO `Process_record` VALUES (2490, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 09:30:26');
INSERT INTO `Process_record` VALUES (2491, 2, 0.3100, 0.3100, 0.3100, 490.8800, 490.8800, 490.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 09:45:27');
INSERT INTO `Process_record` VALUES (2492, 33, 0.2400, 0.2300, 0.2200, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 09:45:27');
INSERT INTO `Process_record` VALUES (2493, 2, 0.3100, 0.2933, 0.2800, 490.8800, 490.8800, 490.8800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 10:00:28');
INSERT INTO `Process_record` VALUES (2494, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 10:00:28');
INSERT INTO `Process_record` VALUES (2495, 2, 0.3100, 0.3000, 0.2900, 490.8800, 490.8800, 490.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 10:15:29');
INSERT INTO `Process_record` VALUES (2496, 33, 0.2300, 0.2267, 0.2200, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 10:15:29');
INSERT INTO `Process_record` VALUES (2497, 2, 0.3100, 0.3033, 0.3000, 491.1300, 491.1300, 491.1300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 10:30:30');
INSERT INTO `Process_record` VALUES (2498, 33, 0.2300, 0.2200, 0.2100, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 10:30:30');
INSERT INTO `Process_record` VALUES (2499, 2, 0.3200, 0.3167, 0.3100, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 10:45:31');
INSERT INTO `Process_record` VALUES (2500, 33, 0.2600, 0.2500, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 10:45:31');
INSERT INTO `Process_record` VALUES (2501, 2, 0.3200, 0.3067, 0.2800, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 11:00:31');
INSERT INTO `Process_record` VALUES (2502, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 11:00:31');
INSERT INTO `Process_record` VALUES (2503, 2, 0.3400, 0.3233, 0.3100, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 11:15:32');
INSERT INTO `Process_record` VALUES (2504, 33, 0.2600, 0.2600, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 11:15:32');
INSERT INTO `Process_record` VALUES (2505, 2, 0.3300, 0.3200, 0.3000, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 11:30:33');
INSERT INTO `Process_record` VALUES (2506, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 11:30:33');
INSERT INTO `Process_record` VALUES (2507, 2, 0.3300, 0.3233, 0.3200, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 11:45:34');
INSERT INTO `Process_record` VALUES (2508, 33, 0.2600, 0.2500, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 11:45:34');
INSERT INTO `Process_record` VALUES (2509, 2, 0.3300, 0.3267, 0.3200, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 12:00:35');
INSERT INTO `Process_record` VALUES (2510, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 12:00:35');
INSERT INTO `Process_record` VALUES (2511, 2, 0.3400, 0.3333, 0.3300, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 12:15:36');
INSERT INTO `Process_record` VALUES (2512, 33, 0.2700, 0.2600, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 12:15:36');
INSERT INTO `Process_record` VALUES (2513, 2, 0.3300, 0.3233, 0.3200, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 12:30:37');
INSERT INTO `Process_record` VALUES (2514, 33, 0.2500, 0.2467, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 12:30:37');
INSERT INTO `Process_record` VALUES (2515, 2, 0.3400, 0.3200, 0.3000, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 12:45:38');
INSERT INTO `Process_record` VALUES (2516, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 12:45:38');
INSERT INTO `Process_record` VALUES (2517, 2, 0.3400, 0.3267, 0.3200, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 13:00:39');
INSERT INTO `Process_record` VALUES (2518, 33, 0.2700, 0.2600, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 13:00:39');
INSERT INTO `Process_record` VALUES (2519, 2, 0.3400, 0.3233, 0.3100, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 13:15:40');
INSERT INTO `Process_record` VALUES (2520, 33, 0.2600, 0.2567, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 13:15:40');
INSERT INTO `Process_record` VALUES (2521, 2, 0.3300, 0.3267, 0.3200, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 13:30:41');
INSERT INTO `Process_record` VALUES (2522, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 13:30:41');
INSERT INTO `Process_record` VALUES (2523, 2, 0.3300, 0.3267, 0.3200, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 13:45:42');
INSERT INTO `Process_record` VALUES (2524, 33, 0.2500, 0.2500, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 13:45:42');
INSERT INTO `Process_record` VALUES (2525, 2, 0.3200, 0.3167, 0.3100, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 14:00:43');
INSERT INTO `Process_record` VALUES (2526, 33, 0.2500, 0.2500, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 14:00:43');
INSERT INTO `Process_record` VALUES (2527, 2, 0.3400, 0.3233, 0.3100, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 14:15:44');
INSERT INTO `Process_record` VALUES (2528, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 14:15:44');
INSERT INTO `Process_record` VALUES (2529, 2, 0.3300, 0.3200, 0.3000, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 14:30:45');
INSERT INTO `Process_record` VALUES (2530, 33, 0.2500, 0.2467, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 14:30:45');
INSERT INTO `Process_record` VALUES (2531, 2, 0.3300, 0.3167, 0.3000, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 14:45:46');
INSERT INTO `Process_record` VALUES (2532, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 14:45:46');
INSERT INTO `Process_record` VALUES (2533, 2, 0.3300, 0.3233, 0.3200, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 15:00:46');
INSERT INTO `Process_record` VALUES (2534, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 15:00:46');
INSERT INTO `Process_record` VALUES (2535, 2, 0.3300, 0.3167, 0.3000, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 15:15:47');
INSERT INTO `Process_record` VALUES (2536, 33, 0.2500, 0.2433, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 15:15:47');
INSERT INTO `Process_record` VALUES (2537, 2, 0.3400, 0.3300, 0.3200, 491.3900, 491.3900, 491.3900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 15:30:48');
INSERT INTO `Process_record` VALUES (2538, 33, 0.2600, 0.2567, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 15:30:48');
INSERT INTO `Process_record` VALUES (2539, 2, 0.3300, 0.3267, 0.3200, 493.9700, 493.1100, 491.3900, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 15:45:49');
INSERT INTO `Process_record` VALUES (2540, 33, 0.2600, 0.2500, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 15:45:49');
INSERT INTO `Process_record` VALUES (2541, 2, 0.3200, 0.3167, 0.3100, 493.9700, 493.9700, 493.9700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 16:00:49');
INSERT INTO `Process_record` VALUES (2542, 33, 0.2500, 0.2500, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 16:00:50');
INSERT INTO `Process_record` VALUES (2543, 2, 0.3600, 0.3400, 0.3200, 493.9700, 493.9700, 493.9700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 16:15:50');
INSERT INTO `Process_record` VALUES (2544, 33, 0.2700, 0.2633, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 16:15:50');
INSERT INTO `Process_record` VALUES (2545, 2, 0.3700, 0.3533, 0.3300, 493.9700, 493.9700, 493.9700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 16:30:50');
INSERT INTO `Process_record` VALUES (2546, 33, 0.2600, 0.2600, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 16:30:50');
INSERT INTO `Process_record` VALUES (2547, 2, 0.3800, 0.3567, 0.3300, 493.9700, 493.9700, 493.9700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 16:45:51');
INSERT INTO `Process_record` VALUES (2548, 33, 0.2700, 0.2633, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 16:45:51');
INSERT INTO `Process_record` VALUES (2549, 2, 0.3600, 0.3400, 0.3300, 494.4700, 494.2967, 494.2100, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 17:00:51');
INSERT INTO `Process_record` VALUES (2550, 33, 0.2600, 0.2533, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 17:00:51');
INSERT INTO `Process_record` VALUES (2551, 2, 0.3500, 0.3333, 0.3200, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 17:15:52');
INSERT INTO `Process_record` VALUES (2552, 33, 0.2700, 0.2633, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 17:15:52');
INSERT INTO `Process_record` VALUES (2553, 2, 0.3700, 0.3467, 0.3300, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 17:30:52');
INSERT INTO `Process_record` VALUES (2554, 33, 0.2600, 0.2567, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 17:30:52');
INSERT INTO `Process_record` VALUES (2555, 2, 0.3300, 0.3233, 0.3200, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 17:45:53');
INSERT INTO `Process_record` VALUES (2556, 33, 0.2600, 0.2600, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 17:45:53');
INSERT INTO `Process_record` VALUES (2557, 2, 0.3400, 0.3300, 0.3200, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 18:00:54');
INSERT INTO `Process_record` VALUES (2558, 33, 0.2600, 0.2567, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 18:00:54');
INSERT INTO `Process_record` VALUES (2559, 2, 0.3500, 0.3267, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 18:15:54');
INSERT INTO `Process_record` VALUES (2560, 33, 0.2600, 0.2533, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 18:15:54');
INSERT INTO `Process_record` VALUES (2561, 2, 0.3400, 0.3333, 0.3200, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 18:30:54');
INSERT INTO `Process_record` VALUES (2562, 33, 0.2600, 0.2600, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 18:30:54');
INSERT INTO `Process_record` VALUES (2563, 2, 0.3400, 0.3300, 0.3200, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 18:45:55');
INSERT INTO `Process_record` VALUES (2564, 33, 0.2600, 0.2567, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 18:45:55');
INSERT INTO `Process_record` VALUES (2565, 2, 0.3300, 0.3267, 0.3200, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 19:00:55');
INSERT INTO `Process_record` VALUES (2566, 33, 0.2600, 0.2567, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 19:00:55');
INSERT INTO `Process_record` VALUES (2567, 2, 0.3400, 0.3233, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 19:15:55');
INSERT INTO `Process_record` VALUES (2568, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 19:15:55');
INSERT INTO `Process_record` VALUES (2569, 2, 0.3300, 0.3200, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 19:30:56');
INSERT INTO `Process_record` VALUES (2570, 33, 0.2600, 0.2533, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 19:30:56');
INSERT INTO `Process_record` VALUES (2571, 2, 0.3400, 0.3300, 0.3200, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 19:45:57');
INSERT INTO `Process_record` VALUES (2572, 33, 0.2600, 0.2600, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 19:45:57');
INSERT INTO `Process_record` VALUES (2573, 2, 0.3300, 0.3167, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 20:00:57');
INSERT INTO `Process_record` VALUES (2574, 33, 0.2600, 0.2533, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 20:00:57');
INSERT INTO `Process_record` VALUES (2575, 2, 0.3500, 0.3367, 0.3300, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 20:15:58');
INSERT INTO `Process_record` VALUES (2576, 33, 0.2600, 0.2600, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 20:15:58');
INSERT INTO `Process_record` VALUES (2577, 2, 0.3300, 0.3233, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 20:30:59');
INSERT INTO `Process_record` VALUES (2578, 33, 0.2600, 0.2567, 0.2500, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 20:30:59');
INSERT INTO `Process_record` VALUES (2579, 2, 0.3800, 0.3467, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 20:46:00');
INSERT INTO `Process_record` VALUES (2580, 33, 0.2700, 0.2667, 0.2600, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 20:46:00');
INSERT INTO `Process_record` VALUES (2581, 2, 0.3400, 0.3233, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 21:01:00');
INSERT INTO `Process_record` VALUES (2582, 33, 0.2600, 0.2500, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 21:01:00');
INSERT INTO `Process_record` VALUES (2583, 2, 0.3400, 0.3100, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 21:16:01');
INSERT INTO `Process_record` VALUES (2584, 33, 0.2500, 0.2400, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 21:16:01');
INSERT INTO `Process_record` VALUES (2585, 2, 0.3200, 0.3133, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 21:31:02');
INSERT INTO `Process_record` VALUES (2586, 33, 0.2500, 0.2433, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 21:31:02');
INSERT INTO `Process_record` VALUES (2587, 2, 0.3200, 0.3100, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 21:46:03');
INSERT INTO `Process_record` VALUES (2588, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 21:46:03');
INSERT INTO `Process_record` VALUES (2589, 2, 0.3100, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 22:01:04');
INSERT INTO `Process_record` VALUES (2590, 33, 0.2400, 0.2400, 0.2400, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 22:01:04');
INSERT INTO `Process_record` VALUES (2591, 2, 0.3200, 0.3100, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 22:16:05');
INSERT INTO `Process_record` VALUES (2592, 33, 0.2400, 0.2333, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 22:16:05');
INSERT INTO `Process_record` VALUES (2593, 2, 0.3000, 0.3000, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 22:31:05');
INSERT INTO `Process_record` VALUES (2594, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 22:31:05');
INSERT INTO `Process_record` VALUES (2595, 2, 0.3200, 0.3000, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 22:46:06');
INSERT INTO `Process_record` VALUES (2596, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 22:46:06');
INSERT INTO `Process_record` VALUES (2597, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 23:01:07');
INSERT INTO `Process_record` VALUES (2598, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 23:01:07');
INSERT INTO `Process_record` VALUES (2599, 2, 0.3300, 0.3133, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 23:16:08');
INSERT INTO `Process_record` VALUES (2600, 33, 0.2400, 0.2367, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 23:16:08');
INSERT INTO `Process_record` VALUES (2601, 2, 0.3300, 0.3133, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 23:31:09');
INSERT INTO `Process_record` VALUES (2602, 33, 0.2500, 0.2400, 0.2300, 70.2300, 70.2300, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 23:31:09');
INSERT INTO `Process_record` VALUES (2603, 2, 0.3300, 0.3133, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 23:46:10');
INSERT INTO `Process_record` VALUES (2604, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.3533, 70.2300, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-13 23:46:10');
INSERT INTO `Process_record` VALUES (2605, 2, 0.3100, 0.3033, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 00:01:10');
INSERT INTO `Process_record` VALUES (2606, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 00:01:10');
INSERT INTO `Process_record` VALUES (2607, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 00:16:11');
INSERT INTO `Process_record` VALUES (2608, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 00:16:11');
INSERT INTO `Process_record` VALUES (2609, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 00:31:12');
INSERT INTO `Process_record` VALUES (2610, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 00:31:12');
INSERT INTO `Process_record` VALUES (2611, 2, 0.3000, 0.3000, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 00:46:13');
INSERT INTO `Process_record` VALUES (2612, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 00:46:13');
INSERT INTO `Process_record` VALUES (2613, 2, 0.3200, 0.3100, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 01:01:14');
INSERT INTO `Process_record` VALUES (2614, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 01:01:14');
INSERT INTO `Process_record` VALUES (2615, 2, 0.3100, 0.3000, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 01:16:15');
INSERT INTO `Process_record` VALUES (2616, 33, 0.2300, 0.2267, 0.2200, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 01:16:15');
INSERT INTO `Process_record` VALUES (2617, 2, 0.3200, 0.3100, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 01:31:15');
INSERT INTO `Process_record` VALUES (2618, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 01:31:15');
INSERT INTO `Process_record` VALUES (2619, 2, 0.3200, 0.3033, 0.2800, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 01:46:16');
INSERT INTO `Process_record` VALUES (2620, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 01:46:16');
INSERT INTO `Process_record` VALUES (2621, 2, 0.3100, 0.3033, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 02:01:17');
INSERT INTO `Process_record` VALUES (2622, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 02:01:17');
INSERT INTO `Process_record` VALUES (2623, 2, 0.3200, 0.3067, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 02:16:18');
INSERT INTO `Process_record` VALUES (2624, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 02:16:18');
INSERT INTO `Process_record` VALUES (2625, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 02:31:19');
INSERT INTO `Process_record` VALUES (2626, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 02:31:19');
INSERT INTO `Process_record` VALUES (2627, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 02:46:20');
INSERT INTO `Process_record` VALUES (2628, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 02:46:20');
INSERT INTO `Process_record` VALUES (2629, 2, 0.3100, 0.3000, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 03:01:21');
INSERT INTO `Process_record` VALUES (2630, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 03:01:21');
INSERT INTO `Process_record` VALUES (2631, 2, 0.3300, 0.3100, 0.2800, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 03:16:21');
INSERT INTO `Process_record` VALUES (2632, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 03:16:21');
INSERT INTO `Process_record` VALUES (2633, 2, 0.3200, 0.3133, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 03:31:22');
INSERT INTO `Process_record` VALUES (2634, 33, 0.2500, 0.2467, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 03:31:22');
INSERT INTO `Process_record` VALUES (2635, 2, 0.3200, 0.3100, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 03:46:22');
INSERT INTO `Process_record` VALUES (2636, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 03:46:22');
INSERT INTO `Process_record` VALUES (2637, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 04:01:22');
INSERT INTO `Process_record` VALUES (2638, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 04:01:22');
INSERT INTO `Process_record` VALUES (2639, 2, 0.3300, 0.3100, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 04:16:23');
INSERT INTO `Process_record` VALUES (2640, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 04:16:23');
INSERT INTO `Process_record` VALUES (2641, 2, 0.3300, 0.3167, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 04:31:23');
INSERT INTO `Process_record` VALUES (2642, 33, 0.2500, 0.2467, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 04:31:23');
INSERT INTO `Process_record` VALUES (2643, 2, 0.3300, 0.3133, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 04:46:24');
INSERT INTO `Process_record` VALUES (2644, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 04:46:24');
INSERT INTO `Process_record` VALUES (2645, 2, 0.3200, 0.3133, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 05:01:25');
INSERT INTO `Process_record` VALUES (2646, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 05:01:25');
INSERT INTO `Process_record` VALUES (2647, 2, 0.3300, 0.3167, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 05:16:26');
INSERT INTO `Process_record` VALUES (2648, 33, 0.2300, 0.2300, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 05:16:26');
INSERT INTO `Process_record` VALUES (2649, 2, 0.3200, 0.3100, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 05:31:26');
INSERT INTO `Process_record` VALUES (2650, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 05:31:26');
INSERT INTO `Process_record` VALUES (2651, 2, 0.3300, 0.3067, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 05:46:27');
INSERT INTO `Process_record` VALUES (2652, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 05:46:27');
INSERT INTO `Process_record` VALUES (2653, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 06:01:28');
INSERT INTO `Process_record` VALUES (2654, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 06:01:28');
INSERT INTO `Process_record` VALUES (2655, 2, 0.3200, 0.3067, 0.2900, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 06:16:29');
INSERT INTO `Process_record` VALUES (2656, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 06:16:29');
INSERT INTO `Process_record` VALUES (2657, 2, 0.3100, 0.3100, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 06:31:29');
INSERT INTO `Process_record` VALUES (2658, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 06:31:29');
INSERT INTO `Process_record` VALUES (2659, 2, 0.3200, 0.3100, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 06:46:30');
INSERT INTO `Process_record` VALUES (2660, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 06:46:30');
INSERT INTO `Process_record` VALUES (2661, 2, 0.3200, 0.3133, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 07:01:30');
INSERT INTO `Process_record` VALUES (2662, 33, 0.2300, 0.2300, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 07:01:30');
INSERT INTO `Process_record` VALUES (2663, 2, 0.3300, 0.3100, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 07:16:31');
INSERT INTO `Process_record` VALUES (2664, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 07:16:31');
INSERT INTO `Process_record` VALUES (2665, 2, 0.3300, 0.3200, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 07:31:32');
INSERT INTO `Process_record` VALUES (2666, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 07:31:32');
INSERT INTO `Process_record` VALUES (2667, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 07:46:33');
INSERT INTO `Process_record` VALUES (2668, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 07:46:33');
INSERT INTO `Process_record` VALUES (2669, 2, 0.3200, 0.3133, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 08:01:34');
INSERT INTO `Process_record` VALUES (2670, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 08:01:34');
INSERT INTO `Process_record` VALUES (2671, 2, 0.3300, 0.3200, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 08:16:35');
INSERT INTO `Process_record` VALUES (2672, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 08:16:35');
INSERT INTO `Process_record` VALUES (2673, 2, 0.3100, 0.3033, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 08:31:35');
INSERT INTO `Process_record` VALUES (2674, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 08:31:35');
INSERT INTO `Process_record` VALUES (2675, 2, 0.3300, 0.3167, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 08:46:36');
INSERT INTO `Process_record` VALUES (2676, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 08:46:36');
INSERT INTO `Process_record` VALUES (2677, 2, 0.3200, 0.3133, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 09:01:37');
INSERT INTO `Process_record` VALUES (2678, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 09:01:37');
INSERT INTO `Process_record` VALUES (2679, 2, 0.3300, 0.3167, 0.3100, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 09:16:37');
INSERT INTO `Process_record` VALUES (2680, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 09:16:37');
INSERT INTO `Process_record` VALUES (2681, 2, 0.3200, 0.3067, 0.3000, 494.4700, 494.4700, 494.4700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 09:31:39');
INSERT INTO `Process_record` VALUES (2682, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 09:31:39');
INSERT INTO `Process_record` VALUES (2683, 2, 0.3400, 0.3267, 0.3200, 497.5600, 495.5000, 494.4700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0067, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 09:46:40');
INSERT INTO `Process_record` VALUES (2684, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 09:46:40');
INSERT INTO `Process_record` VALUES (2685, 2, 0.3400, 0.3200, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 10:01:40');
INSERT INTO `Process_record` VALUES (2686, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 10:01:40');
INSERT INTO `Process_record` VALUES (2687, 2, 0.3300, 0.3233, 0.3200, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 10:16:41');
INSERT INTO `Process_record` VALUES (2688, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 10:16:41');
INSERT INTO `Process_record` VALUES (2689, 2, 0.3800, 0.3433, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 10:31:41');
INSERT INTO `Process_record` VALUES (2690, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 10:31:41');
INSERT INTO `Process_record` VALUES (2691, 2, 0.3500, 0.3367, 0.3300, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 10:46:42');
INSERT INTO `Process_record` VALUES (2692, 33, 0.2600, 0.2500, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 10:46:42');
INSERT INTO `Process_record` VALUES (2693, 2, 0.3500, 0.3467, 0.3400, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 11:01:43');
INSERT INTO `Process_record` VALUES (2694, 33, 0.2600, 0.2433, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 11:01:43');
INSERT INTO `Process_record` VALUES (2695, 2, 0.3700, 0.3567, 0.3400, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 11:16:44');
INSERT INTO `Process_record` VALUES (2696, 33, 0.2600, 0.2533, 0.2500, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 11:16:44');
INSERT INTO `Process_record` VALUES (2697, 2, 0.3400, 0.3233, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 11:31:45');
INSERT INTO `Process_record` VALUES (2698, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 11:31:45');
INSERT INTO `Process_record` VALUES (2699, 2, 0.3300, 0.3200, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 11:46:46');
INSERT INTO `Process_record` VALUES (2700, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 11:46:46');
INSERT INTO `Process_record` VALUES (2701, 2, 0.3300, 0.3200, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 12:01:47');
INSERT INTO `Process_record` VALUES (2702, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 12:01:47');
INSERT INTO `Process_record` VALUES (2703, 2, 0.3200, 0.3167, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 12:16:48');
INSERT INTO `Process_record` VALUES (2704, 33, 0.2300, 0.2300, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 12:16:48');
INSERT INTO `Process_record` VALUES (2705, 2, 0.3300, 0.3167, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 12:31:49');
INSERT INTO `Process_record` VALUES (2706, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 12:31:49');
INSERT INTO `Process_record` VALUES (2707, 2, 0.3300, 0.3133, 0.3000, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 12:46:50');
INSERT INTO `Process_record` VALUES (2708, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 12:46:50');
INSERT INTO `Process_record` VALUES (2709, 2, 0.3300, 0.3233, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 13:01:50');
INSERT INTO `Process_record` VALUES (2710, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 13:01:50');
INSERT INTO `Process_record` VALUES (2711, 2, 0.3500, 0.3367, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 13:16:51');
INSERT INTO `Process_record` VALUES (2712, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 13:16:51');
INSERT INTO `Process_record` VALUES (2713, 2, 0.3400, 0.3200, 0.3000, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 13:31:52');
INSERT INTO `Process_record` VALUES (2714, 33, 0.2500, 0.2467, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 13:31:52');
INSERT INTO `Process_record` VALUES (2715, 2, 0.3300, 0.3233, 0.3200, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 13:46:53');
INSERT INTO `Process_record` VALUES (2716, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 13:46:53');
INSERT INTO `Process_record` VALUES (2717, 2, 0.3400, 0.3267, 0.3200, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 14:01:53');
INSERT INTO `Process_record` VALUES (2718, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 14:01:53');
INSERT INTO `Process_record` VALUES (2719, 2, 0.3400, 0.3233, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 14:16:54');
INSERT INTO `Process_record` VALUES (2720, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 14:16:54');
INSERT INTO `Process_record` VALUES (2721, 2, 0.3400, 0.3200, 0.3000, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 14:31:55');
INSERT INTO `Process_record` VALUES (2722, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 14:31:55');
INSERT INTO `Process_record` VALUES (2723, 2, 0.3300, 0.3167, 0.3100, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 14:46:55');
INSERT INTO `Process_record` VALUES (2724, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 14:46:55');
INSERT INTO `Process_record` VALUES (2725, 2, 0.3300, 0.3100, 0.2900, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 15:01:56');
INSERT INTO `Process_record` VALUES (2726, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 15:01:56');
INSERT INTO `Process_record` VALUES (2727, 2, 0.3500, 0.3133, 0.2900, 497.5600, 497.5600, 497.5600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 15:16:57');
INSERT INTO `Process_record` VALUES (2728, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 15:16:57');
INSERT INTO `Process_record` VALUES (2729, 2, 0.3500, 0.3400, 0.3300, 499.1100, 499.1100, 499.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0400, 0.0133, 0.0000, '2019-04-14 15:31:57');
INSERT INTO `Process_record` VALUES (2730, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 15:31:57');
INSERT INTO `Process_record` VALUES (2731, 2, 0.3700, 0.3400, 0.3200, 499.1100, 499.1100, 499.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 15:46:58');
INSERT INTO `Process_record` VALUES (2732, 33, 0.2600, 0.2533, 0.2500, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 15:46:58');
INSERT INTO `Process_record` VALUES (2733, 2, 0.3400, 0.3333, 0.3300, 499.1100, 499.1100, 499.1100, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 16:01:59');
INSERT INTO `Process_record` VALUES (2734, 33, 0.2500, 0.2500, 0.2500, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 16:01:59');
INSERT INTO `Process_record` VALUES (2735, 2, 0.3400, 0.3267, 0.3200, 499.1100, 499.1100, 499.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 16:16:59');
INSERT INTO `Process_record` VALUES (2736, 33, 0.2600, 0.2533, 0.2500, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 16:16:59');
INSERT INTO `Process_record` VALUES (2737, 2, 0.3500, 0.3433, 0.3400, 499.1100, 499.1100, 499.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 16:31:59');
INSERT INTO `Process_record` VALUES (2738, 33, 0.2600, 0.2567, 0.2500, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 16:31:59');
INSERT INTO `Process_record` VALUES (2739, 2, 0.3500, 0.3333, 0.3200, 499.1100, 499.1100, 499.1100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 16:47:00');
INSERT INTO `Process_record` VALUES (2740, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 16:47:00');
INSERT INTO `Process_record` VALUES (2741, 2, 0.4200, 0.3533, 0.3200, 499.3600, 499.1933, 499.1100, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 17:02:01');
INSERT INTO `Process_record` VALUES (2742, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 17:02:01');
INSERT INTO `Process_record` VALUES (2743, 2, 0.4900, 0.4133, 0.3700, 499.3600, 499.3600, 499.3600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0067, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 17:17:01');
INSERT INTO `Process_record` VALUES (2744, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 17:17:01');
INSERT INTO `Process_record` VALUES (2745, 2, 0.3500, 0.3333, 0.3100, 499.3600, 499.3600, 499.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 17:32:02');
INSERT INTO `Process_record` VALUES (2746, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 17:32:02');
INSERT INTO `Process_record` VALUES (2747, 2, 0.3300, 0.3233, 0.3200, 499.4400, 499.3867, 499.3600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 17:47:03');
INSERT INTO `Process_record` VALUES (2748, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 17:47:03');
INSERT INTO `Process_record` VALUES (2749, 2, 0.3100, 0.3100, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 18:02:04');
INSERT INTO `Process_record` VALUES (2750, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 18:02:04');
INSERT INTO `Process_record` VALUES (2751, 2, 0.3300, 0.3167, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 18:17:05');
INSERT INTO `Process_record` VALUES (2752, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 18:17:05');
INSERT INTO `Process_record` VALUES (2753, 2, 0.3100, 0.3033, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 18:32:06');
INSERT INTO `Process_record` VALUES (2754, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 18:32:06');
INSERT INTO `Process_record` VALUES (2755, 2, 0.3300, 0.3133, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 18:47:07');
INSERT INTO `Process_record` VALUES (2756, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 18:47:07');
INSERT INTO `Process_record` VALUES (2757, 2, 0.3300, 0.3167, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 19:02:07');
INSERT INTO `Process_record` VALUES (2758, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 19:02:07');
INSERT INTO `Process_record` VALUES (2759, 2, 0.3200, 0.3133, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 19:17:08');
INSERT INTO `Process_record` VALUES (2760, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 19:17:08');
INSERT INTO `Process_record` VALUES (2761, 2, 0.3300, 0.3133, 0.2900, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 19:32:09');
INSERT INTO `Process_record` VALUES (2762, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 19:32:09');
INSERT INTO `Process_record` VALUES (2763, 2, 0.3200, 0.3133, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 19:47:10');
INSERT INTO `Process_record` VALUES (2764, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 19:47:10');
INSERT INTO `Process_record` VALUES (2765, 2, 0.3200, 0.3100, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 20:02:11');
INSERT INTO `Process_record` VALUES (2766, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 20:02:11');
INSERT INTO `Process_record` VALUES (2767, 2, 0.3300, 0.3067, 0.2900, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 20:17:12');
INSERT INTO `Process_record` VALUES (2768, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 20:17:12');
INSERT INTO `Process_record` VALUES (2769, 2, 0.3200, 0.3033, 0.2900, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 20:32:12');
INSERT INTO `Process_record` VALUES (2770, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 20:32:12');
INSERT INTO `Process_record` VALUES (2771, 2, 0.3200, 0.3133, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 20:47:13');
INSERT INTO `Process_record` VALUES (2772, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 20:47:13');
INSERT INTO `Process_record` VALUES (2773, 2, 0.3200, 0.3167, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 21:02:14');
INSERT INTO `Process_record` VALUES (2774, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 21:02:14');
INSERT INTO `Process_record` VALUES (2775, 2, 0.3400, 0.3233, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 21:17:15');
INSERT INTO `Process_record` VALUES (2776, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 21:17:15');
INSERT INTO `Process_record` VALUES (2777, 2, 0.3000, 0.3000, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 21:32:15');
INSERT INTO `Process_record` VALUES (2778, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 21:32:15');
INSERT INTO `Process_record` VALUES (2779, 2, 0.3200, 0.3067, 0.2900, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 21:47:16');
INSERT INTO `Process_record` VALUES (2780, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 21:47:16');
INSERT INTO `Process_record` VALUES (2781, 2, 0.3200, 0.3133, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 22:02:16');
INSERT INTO `Process_record` VALUES (2782, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 22:02:16');
INSERT INTO `Process_record` VALUES (2783, 2, 0.3300, 0.3167, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 22:17:17');
INSERT INTO `Process_record` VALUES (2784, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 22:17:17');
INSERT INTO `Process_record` VALUES (2785, 2, 0.3100, 0.3100, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 22:32:17');
INSERT INTO `Process_record` VALUES (2786, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 22:32:17');
INSERT INTO `Process_record` VALUES (2787, 2, 0.3300, 0.3100, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 22:47:18');
INSERT INTO `Process_record` VALUES (2788, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 22:47:18');
INSERT INTO `Process_record` VALUES (2789, 2, 0.3200, 0.3133, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 23:02:19');
INSERT INTO `Process_record` VALUES (2790, 33, 0.2500, 0.2467, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 23:02:19');
INSERT INTO `Process_record` VALUES (2791, 2, 0.3300, 0.3200, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 23:17:20');
INSERT INTO `Process_record` VALUES (2792, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 23:17:20');
INSERT INTO `Process_record` VALUES (2793, 2, 0.3300, 0.3133, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 23:32:21');
INSERT INTO `Process_record` VALUES (2794, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 23:32:21');
INSERT INTO `Process_record` VALUES (2795, 2, 0.3300, 0.3167, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 23:47:22');
INSERT INTO `Process_record` VALUES (2796, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-14 23:47:22');
INSERT INTO `Process_record` VALUES (2797, 2, 0.3300, 0.3200, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 00:02:22');
INSERT INTO `Process_record` VALUES (2798, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 00:02:22');
INSERT INTO `Process_record` VALUES (2799, 2, 0.3200, 0.3067, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 00:17:23');
INSERT INTO `Process_record` VALUES (2800, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 00:17:23');
INSERT INTO `Process_record` VALUES (2801, 2, 0.3200, 0.3067, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 00:32:24');
INSERT INTO `Process_record` VALUES (2802, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 00:32:24');
INSERT INTO `Process_record` VALUES (2803, 2, 0.3300, 0.3133, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 00:47:25');
INSERT INTO `Process_record` VALUES (2804, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 00:47:25');
INSERT INTO `Process_record` VALUES (2805, 2, 0.3300, 0.3200, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 01:02:26');
INSERT INTO `Process_record` VALUES (2806, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 01:02:26');
INSERT INTO `Process_record` VALUES (2807, 2, 0.3200, 0.3100, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 01:17:27');
INSERT INTO `Process_record` VALUES (2808, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 01:17:27');
INSERT INTO `Process_record` VALUES (2809, 2, 0.3200, 0.3067, 0.2900, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 01:32:28');
INSERT INTO `Process_record` VALUES (2810, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 01:32:28');
INSERT INTO `Process_record` VALUES (2811, 2, 0.3200, 0.3100, 0.3000, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 01:47:29');
INSERT INTO `Process_record` VALUES (2812, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 01:47:29');
INSERT INTO `Process_record` VALUES (2813, 2, 0.3200, 0.3167, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 02:02:30');
INSERT INTO `Process_record` VALUES (2814, 33, 0.2500, 0.2467, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 02:02:30');
INSERT INTO `Process_record` VALUES (2815, 2, 0.3300, 0.3167, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 02:17:31');
INSERT INTO `Process_record` VALUES (2816, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 02:17:31');
INSERT INTO `Process_record` VALUES (2817, 2, 0.3300, 0.3167, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 02:32:32');
INSERT INTO `Process_record` VALUES (2818, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 02:32:32');
INSERT INTO `Process_record` VALUES (2819, 2, 0.3200, 0.3167, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 02:47:33');
INSERT INTO `Process_record` VALUES (2820, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 02:47:33');
INSERT INTO `Process_record` VALUES (2821, 2, 0.3200, 0.3167, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 03:02:33');
INSERT INTO `Process_record` VALUES (2822, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 03:02:33');
INSERT INTO `Process_record` VALUES (2823, 2, 0.3200, 0.3133, 0.3100, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 03:17:34');
INSERT INTO `Process_record` VALUES (2824, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 03:17:34');
INSERT INTO `Process_record` VALUES (2825, 2, 0.3400, 0.3167, 0.2900, 499.4400, 499.4400, 499.4400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 03:32:35');
INSERT INTO `Process_record` VALUES (2826, 33, 0.2300, 0.2300, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 03:32:35');
INSERT INTO `Process_record` VALUES (2827, 2, 0.3200, 0.3133, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 03:47:36');
INSERT INTO `Process_record` VALUES (2828, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 03:47:36');
INSERT INTO `Process_record` VALUES (2829, 2, 0.3400, 0.3200, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 04:02:37');
INSERT INTO `Process_record` VALUES (2830, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 04:02:37');
INSERT INTO `Process_record` VALUES (2831, 2, 0.3300, 0.3200, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 04:17:37');
INSERT INTO `Process_record` VALUES (2832, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 04:17:37');
INSERT INTO `Process_record` VALUES (2833, 2, 0.3300, 0.3167, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 04:32:38');
INSERT INTO `Process_record` VALUES (2834, 33, 0.2500, 0.2433, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 04:32:38');
INSERT INTO `Process_record` VALUES (2835, 2, 0.3100, 0.3033, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 04:47:38');
INSERT INTO `Process_record` VALUES (2836, 33, 0.2400, 0.2333, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 04:47:39');
INSERT INTO `Process_record` VALUES (2837, 2, 0.3300, 0.3200, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 05:02:39');
INSERT INTO `Process_record` VALUES (2838, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 05:02:39');
INSERT INTO `Process_record` VALUES (2839, 2, 0.3300, 0.3300, 0.3300, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 05:17:40');
INSERT INTO `Process_record` VALUES (2840, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 05:17:40');
INSERT INTO `Process_record` VALUES (2841, 2, 0.3300, 0.3167, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 05:32:41');
INSERT INTO `Process_record` VALUES (2842, 33, 0.2400, 0.2367, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 05:32:41');
INSERT INTO `Process_record` VALUES (2843, 2, 0.3200, 0.3167, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 05:47:42');
INSERT INTO `Process_record` VALUES (2844, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 05:47:42');
INSERT INTO `Process_record` VALUES (2845, 2, 0.3300, 0.3167, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 06:02:42');
INSERT INTO `Process_record` VALUES (2846, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 06:02:42');
INSERT INTO `Process_record` VALUES (2847, 2, 0.3200, 0.3133, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 06:17:43');
INSERT INTO `Process_record` VALUES (2848, 33, 0.2400, 0.2400, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 06:17:43');
INSERT INTO `Process_record` VALUES (2849, 2, 0.3300, 0.3200, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 06:32:44');
INSERT INTO `Process_record` VALUES (2850, 33, 0.2500, 0.2433, 0.2400, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 06:32:44');
INSERT INTO `Process_record` VALUES (2851, 2, 0.3300, 0.3200, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 06:47:45');
INSERT INTO `Process_record` VALUES (2852, 33, 0.2500, 0.2400, 0.2300, 70.6000, 70.6000, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 06:47:45');
INSERT INTO `Process_record` VALUES (2853, 2, 0.3300, 0.3167, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 07:02:45');
INSERT INTO `Process_record` VALUES (2854, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.6933, 70.6000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 07:02:45');
INSERT INTO `Process_record` VALUES (2855, 2, 0.3200, 0.3133, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 07:17:46');
INSERT INTO `Process_record` VALUES (2856, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 07:17:46');
INSERT INTO `Process_record` VALUES (2857, 2, 0.3300, 0.3167, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 07:32:47');
INSERT INTO `Process_record` VALUES (2858, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 07:32:47');
INSERT INTO `Process_record` VALUES (2859, 2, 0.3300, 0.3200, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 07:47:48');
INSERT INTO `Process_record` VALUES (2860, 33, 0.2500, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 07:47:48');
INSERT INTO `Process_record` VALUES (2861, 2, 0.3300, 0.3167, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 08:02:48');
INSERT INTO `Process_record` VALUES (2862, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 08:02:48');
INSERT INTO `Process_record` VALUES (2863, 2, 0.3200, 0.3067, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 08:17:49');
INSERT INTO `Process_record` VALUES (2864, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 08:17:49');
INSERT INTO `Process_record` VALUES (2865, 2, 0.3200, 0.3067, 0.2900, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 08:32:50');
INSERT INTO `Process_record` VALUES (2866, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 08:32:50');
INSERT INTO `Process_record` VALUES (2867, 2, 0.3100, 0.3067, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 08:47:51');
INSERT INTO `Process_record` VALUES (2868, 33, 0.2400, 0.2333, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 08:47:51');
INSERT INTO `Process_record` VALUES (2869, 2, 0.3200, 0.3167, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 09:02:52');
INSERT INTO `Process_record` VALUES (2870, 33, 0.2400, 0.2300, 0.2200, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 09:02:52');
INSERT INTO `Process_record` VALUES (2871, 2, 0.3300, 0.3167, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 09:17:52');
INSERT INTO `Process_record` VALUES (2872, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 09:17:52');
INSERT INTO `Process_record` VALUES (2873, 2, 0.3200, 0.3100, 0.2900, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 09:32:52');
INSERT INTO `Process_record` VALUES (2874, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 09:32:52');
INSERT INTO `Process_record` VALUES (2875, 2, 0.3900, 0.3433, 0.3200, 499.3800, 493.3233, 481.2100, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 09:47:53');
INSERT INTO `Process_record` VALUES (2876, 33, 0.2500, 0.2433, 0.2400, 71.8100, 71.1900, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 09:47:53');
INSERT INTO `Process_record` VALUES (2877, 2, 0.3500, 0.3233, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 10:02:54');
INSERT INTO `Process_record` VALUES (2878, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 10:02:54');
INSERT INTO `Process_record` VALUES (2879, 2, 0.3300, 0.3167, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 10:17:55');
INSERT INTO `Process_record` VALUES (2880, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 10:17:55');
INSERT INTO `Process_record` VALUES (2881, 2, 0.3400, 0.3133, 0.2900, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 10:32:55');
INSERT INTO `Process_record` VALUES (2882, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 10:32:55');
INSERT INTO `Process_record` VALUES (2883, 2, 0.3300, 0.3200, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 10:47:56');
INSERT INTO `Process_record` VALUES (2884, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 10:47:56');
INSERT INTO `Process_record` VALUES (2885, 2, 0.3200, 0.3167, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 11:02:56');
INSERT INTO `Process_record` VALUES (2886, 33, 0.2400, 0.2333, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 11:02:56');
INSERT INTO `Process_record` VALUES (2887, 2, 0.3400, 0.3300, 0.3200, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 11:17:57');
INSERT INTO `Process_record` VALUES (2888, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 11:17:57');
INSERT INTO `Process_record` VALUES (2889, 2, 0.3200, 0.3133, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 11:32:58');
INSERT INTO `Process_record` VALUES (2890, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 11:32:58');
INSERT INTO `Process_record` VALUES (2891, 2, 0.3200, 0.3133, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 11:47:59');
INSERT INTO `Process_record` VALUES (2892, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 11:47:59');
INSERT INTO `Process_record` VALUES (2893, 2, 0.3100, 0.3033, 0.2900, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 12:03:00');
INSERT INTO `Process_record` VALUES (2894, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 12:03:00');
INSERT INTO `Process_record` VALUES (2895, 2, 0.3500, 0.3300, 0.3200, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 12:18:01');
INSERT INTO `Process_record` VALUES (2896, 33, 0.2500, 0.2400, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 12:18:01');
INSERT INTO `Process_record` VALUES (2897, 2, 0.3200, 0.3100, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 12:33:02');
INSERT INTO `Process_record` VALUES (2898, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 12:33:02');
INSERT INTO `Process_record` VALUES (2899, 2, 0.3300, 0.3200, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 12:48:03');
INSERT INTO `Process_record` VALUES (2900, 33, 0.2400, 0.2333, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 12:48:03');
INSERT INTO `Process_record` VALUES (2901, 2, 0.3200, 0.3133, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 13:03:04');
INSERT INTO `Process_record` VALUES (2902, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 13:03:04');
INSERT INTO `Process_record` VALUES (2903, 2, 0.3500, 0.3233, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 13:18:05');
INSERT INTO `Process_record` VALUES (2904, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 13:18:05');
INSERT INTO `Process_record` VALUES (2905, 2, 0.3300, 0.3233, 0.3200, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 13:33:05');
INSERT INTO `Process_record` VALUES (2906, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 13:33:05');
INSERT INTO `Process_record` VALUES (2907, 2, 0.3300, 0.3233, 0.3200, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 13:48:06');
INSERT INTO `Process_record` VALUES (2908, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 13:48:06');
INSERT INTO `Process_record` VALUES (2909, 2, 0.3100, 0.3067, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 14:03:07');
INSERT INTO `Process_record` VALUES (2910, 33, 0.2400, 0.2333, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 14:03:07');
INSERT INTO `Process_record` VALUES (2911, 2, 0.3400, 0.3167, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 14:18:08');
INSERT INTO `Process_record` VALUES (2912, 33, 0.2400, 0.2333, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 14:18:08');
INSERT INTO `Process_record` VALUES (2913, 2, 0.3300, 0.3100, 0.2900, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 14:33:08');
INSERT INTO `Process_record` VALUES (2914, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 14:33:08');
INSERT INTO `Process_record` VALUES (2915, 2, 0.3200, 0.3100, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 14:48:09');
INSERT INTO `Process_record` VALUES (2916, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 14:48:09');
INSERT INTO `Process_record` VALUES (2917, 2, 0.3100, 0.3033, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 15:03:09');
INSERT INTO `Process_record` VALUES (2918, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 15:03:09');
INSERT INTO `Process_record` VALUES (2919, 2, 0.3400, 0.3133, 0.3000, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 15:18:10');
INSERT INTO `Process_record` VALUES (2920, 33, 0.2500, 0.2400, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 15:18:10');
INSERT INTO `Process_record` VALUES (2921, 2, 0.3100, 0.3000, 0.2900, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 15:33:11');
INSERT INTO `Process_record` VALUES (2922, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 15:33:11');
INSERT INTO `Process_record` VALUES (2923, 2, 0.3400, 0.3233, 0.3100, 499.3800, 499.3800, 499.3800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1.1300, 0.3767, 0.0000, 0.1400, 0.0467, 0.0000, '2019-04-15 15:48:12');
INSERT INTO `Process_record` VALUES (2924, 33, 0.2500, 0.2400, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 15:48:12');
INSERT INTO `Process_record` VALUES (2925, 2, 0.3300, 0.3267, 0.3200, 500.4100, 499.7233, 499.3800, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 16:03:12');
INSERT INTO `Process_record` VALUES (2926, 33, 0.2600, 0.2500, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 16:03:12');
INSERT INTO `Process_record` VALUES (2927, 2, 0.4200, 0.3700, 0.3400, 500.6700, 500.6700, 500.6700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 16:18:13');
INSERT INTO `Process_record` VALUES (2928, 33, 0.2600, 0.2567, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 16:18:13');
INSERT INTO `Process_record` VALUES (2929, 2, 0.3400, 0.3300, 0.3200, 500.6700, 500.6700, 500.6700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 16:33:13');
INSERT INTO `Process_record` VALUES (2930, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 16:33:13');
INSERT INTO `Process_record` VALUES (2931, 2, 0.3500, 0.3433, 0.3400, 500.6700, 500.6700, 500.6700, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 16:48:15');
INSERT INTO `Process_record` VALUES (2932, 33, 0.2600, 0.2567, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 16:48:15');
INSERT INTO `Process_record` VALUES (2933, 2, 0.3700, 0.3400, 0.3200, 501.7000, 501.3567, 500.6700, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 5.4000, 1.8000, 0.0000, 0.2000, 0.0667, 0.0000, '2019-04-15 17:03:15');
INSERT INTO `Process_record` VALUES (2934, 33, 0.2500, 0.2400, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 17:03:15');
INSERT INTO `Process_record` VALUES (2935, 2, 0.3400, 0.3200, 0.3000, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 17:18:15');
INSERT INTO `Process_record` VALUES (2936, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 17:18:15');
INSERT INTO `Process_record` VALUES (2937, 2, 0.3300, 0.3233, 0.3100, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 17:33:15');
INSERT INTO `Process_record` VALUES (2938, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 17:33:15');
INSERT INTO `Process_record` VALUES (2939, 2, 0.3400, 0.3233, 0.3100, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 17:48:15');
INSERT INTO `Process_record` VALUES (2940, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 17:48:15');
INSERT INTO `Process_record` VALUES (2941, 2, 0.3300, 0.3233, 0.3200, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 18:03:16');
INSERT INTO `Process_record` VALUES (2942, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 18:03:16');
INSERT INTO `Process_record` VALUES (2943, 2, 0.3500, 0.3200, 0.3000, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 18:18:17');
INSERT INTO `Process_record` VALUES (2944, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 18:18:17');
INSERT INTO `Process_record` VALUES (2945, 2, 0.3100, 0.2967, 0.2900, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 18:33:17');
INSERT INTO `Process_record` VALUES (2946, 33, 0.2400, 0.2333, 0.2200, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 18:33:17');
INSERT INTO `Process_record` VALUES (2947, 2, 0.3200, 0.3100, 0.3000, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 18:48:18');
INSERT INTO `Process_record` VALUES (2948, 33, 0.2300, 0.2233, 0.2200, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 18:48:18');
INSERT INTO `Process_record` VALUES (2949, 2, 0.3200, 0.3033, 0.2900, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 19:03:19');
INSERT INTO `Process_record` VALUES (2950, 33, 0.2300, 0.2233, 0.2200, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 19:03:19');
INSERT INTO `Process_record` VALUES (2951, 2, 0.3100, 0.3000, 0.2900, 501.7000, 501.7000, 501.7000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 19:18:20');
INSERT INTO `Process_record` VALUES (2952, 33, 0.2300, 0.2233, 0.2200, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 19:18:20');
INSERT INTO `Process_record` VALUES (2953, 2, 2.0300, 0.8933, 0.3200, 504.5500, 502.6500, 501.7000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 19:31:03');
INSERT INTO `Process_record` VALUES (2954, 33, 0.2300, 0.1500, 0.0000, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 19:31:03');
INSERT INTO `Process_record` VALUES (2955, 2, 0.3000, 0.2900, 0.2800, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 20:24:20');
INSERT INTO `Process_record` VALUES (2956, 33, 0.2400, 0.2333, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 20:24:20');
INSERT INTO `Process_record` VALUES (2957, 2, 0.3000, 0.3000, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 20:39:21');
INSERT INTO `Process_record` VALUES (2958, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 20:39:21');
INSERT INTO `Process_record` VALUES (2959, 2, 0.3100, 0.3033, 0.2900, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 20:54:22');
INSERT INTO `Process_record` VALUES (2960, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 20:54:22');
INSERT INTO `Process_record` VALUES (2961, 2, 0.3100, 0.3100, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 21:09:22');
INSERT INTO `Process_record` VALUES (2962, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 21:09:22');
INSERT INTO `Process_record` VALUES (2963, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 21:24:23');
INSERT INTO `Process_record` VALUES (2964, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 21:24:24');
INSERT INTO `Process_record` VALUES (2965, 2, 0.3100, 0.3100, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 21:39:24');
INSERT INTO `Process_record` VALUES (2966, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 21:39:24');
INSERT INTO `Process_record` VALUES (2967, 2, 0.3200, 0.3100, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 21:54:25');
INSERT INTO `Process_record` VALUES (2968, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 21:54:25');
INSERT INTO `Process_record` VALUES (2969, 2, 0.3300, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 22:09:26');
INSERT INTO `Process_record` VALUES (2970, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 22:09:26');
INSERT INTO `Process_record` VALUES (2971, 2, 0.3200, 0.3067, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 22:24:27');
INSERT INTO `Process_record` VALUES (2972, 33, 0.2500, 0.2400, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 22:24:27');
INSERT INTO `Process_record` VALUES (2973, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 22:39:27');
INSERT INTO `Process_record` VALUES (2974, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 22:39:27');
INSERT INTO `Process_record` VALUES (2975, 2, 0.3200, 0.3133, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 22:54:28');
INSERT INTO `Process_record` VALUES (2976, 33, 0.2500, 0.2433, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 22:54:28');
INSERT INTO `Process_record` VALUES (2977, 2, 0.3400, 0.3267, 0.3200, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 23:09:29');
INSERT INTO `Process_record` VALUES (2978, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 23:09:29');
INSERT INTO `Process_record` VALUES (2979, 2, 0.3300, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 23:24:30');
INSERT INTO `Process_record` VALUES (2980, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 23:24:30');
INSERT INTO `Process_record` VALUES (2981, 2, 0.3300, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 23:39:31');
INSERT INTO `Process_record` VALUES (2982, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 23:39:31');
INSERT INTO `Process_record` VALUES (2983, 2, 0.3300, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 23:54:32');
INSERT INTO `Process_record` VALUES (2984, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-15 23:54:32');
INSERT INTO `Process_record` VALUES (2985, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 00:09:33');
INSERT INTO `Process_record` VALUES (2986, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 00:09:33');
INSERT INTO `Process_record` VALUES (2987, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 00:24:34');
INSERT INTO `Process_record` VALUES (2988, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 00:24:34');
INSERT INTO `Process_record` VALUES (2989, 2, 0.3300, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 00:39:35');
INSERT INTO `Process_record` VALUES (2990, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 00:39:35');
INSERT INTO `Process_record` VALUES (2991, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 00:54:36');
INSERT INTO `Process_record` VALUES (2992, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 00:54:36');
INSERT INTO `Process_record` VALUES (2993, 2, 0.3300, 0.3133, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 01:09:37');
INSERT INTO `Process_record` VALUES (2994, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 01:09:37');
INSERT INTO `Process_record` VALUES (2995, 2, 0.3400, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 01:24:38');
INSERT INTO `Process_record` VALUES (2996, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 01:24:38');
INSERT INTO `Process_record` VALUES (2997, 2, 0.3300, 0.3167, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 01:39:38');
INSERT INTO `Process_record` VALUES (2998, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 01:39:38');
INSERT INTO `Process_record` VALUES (2999, 2, 0.3200, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 01:54:39');
INSERT INTO `Process_record` VALUES (3000, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 01:54:39');
INSERT INTO `Process_record` VALUES (3001, 2, 0.3400, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 02:09:40');
INSERT INTO `Process_record` VALUES (3002, 33, 0.2600, 0.2567, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 02:09:40');
INSERT INTO `Process_record` VALUES (3003, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 02:24:40');
INSERT INTO `Process_record` VALUES (3004, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 02:24:40');
INSERT INTO `Process_record` VALUES (3005, 2, 0.3200, 0.3133, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 02:39:41');
INSERT INTO `Process_record` VALUES (3006, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 02:39:41');
INSERT INTO `Process_record` VALUES (3007, 2, 0.3200, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 02:54:42');
INSERT INTO `Process_record` VALUES (3008, 33, 0.2600, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 02:54:42');
INSERT INTO `Process_record` VALUES (3009, 2, 0.3200, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 03:09:42');
INSERT INTO `Process_record` VALUES (3010, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 03:09:42');
INSERT INTO `Process_record` VALUES (3011, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 03:24:43');
INSERT INTO `Process_record` VALUES (3012, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 03:24:43');
INSERT INTO `Process_record` VALUES (3013, 2, 0.3300, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 03:39:44');
INSERT INTO `Process_record` VALUES (3014, 33, 0.2500, 0.2433, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 03:39:44');
INSERT INTO `Process_record` VALUES (3015, 2, 0.3300, 0.3167, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 03:54:44');
INSERT INTO `Process_record` VALUES (3016, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 03:54:44');
INSERT INTO `Process_record` VALUES (3017, 2, 0.3300, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 04:09:45');
INSERT INTO `Process_record` VALUES (3018, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 04:09:45');
INSERT INTO `Process_record` VALUES (3019, 2, 0.3300, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 04:24:46');
INSERT INTO `Process_record` VALUES (3020, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 04:24:46');
INSERT INTO `Process_record` VALUES (3021, 2, 0.3300, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 04:39:46');
INSERT INTO `Process_record` VALUES (3022, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 04:39:46');
INSERT INTO `Process_record` VALUES (3023, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 04:54:47');
INSERT INTO `Process_record` VALUES (3024, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 04:54:47');
INSERT INTO `Process_record` VALUES (3025, 2, 0.3400, 0.3233, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 05:09:48');
INSERT INTO `Process_record` VALUES (3026, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 05:09:48');
INSERT INTO `Process_record` VALUES (3027, 2, 0.3200, 0.3100, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 05:24:49');
INSERT INTO `Process_record` VALUES (3028, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 05:24:49');
INSERT INTO `Process_record` VALUES (3029, 2, 0.3400, 0.3267, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 05:39:50');
INSERT INTO `Process_record` VALUES (3030, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 05:39:50');
INSERT INTO `Process_record` VALUES (3031, 2, 0.3500, 0.3267, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 05:54:51');
INSERT INTO `Process_record` VALUES (3032, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 05:54:51');
INSERT INTO `Process_record` VALUES (3033, 2, 0.3300, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 06:09:52');
INSERT INTO `Process_record` VALUES (3034, 33, 0.2600, 0.2500, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 06:09:52');
INSERT INTO `Process_record` VALUES (3035, 2, 0.3100, 0.3100, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 06:24:52');
INSERT INTO `Process_record` VALUES (3036, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 06:24:52');
INSERT INTO `Process_record` VALUES (3037, 2, 0.3300, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 06:39:53');
INSERT INTO `Process_record` VALUES (3038, 33, 0.2600, 0.2500, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 06:39:53');
INSERT INTO `Process_record` VALUES (3039, 2, 0.3300, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 06:54:54');
INSERT INTO `Process_record` VALUES (3040, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 06:54:54');
INSERT INTO `Process_record` VALUES (3041, 2, 0.3400, 0.3333, 0.3300, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 07:09:55');
INSERT INTO `Process_record` VALUES (3042, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 07:09:55');
INSERT INTO `Process_record` VALUES (3043, 2, 0.3300, 0.3233, 0.3200, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 07:24:55');
INSERT INTO `Process_record` VALUES (3044, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 07:24:55');
INSERT INTO `Process_record` VALUES (3045, 2, 0.3400, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 07:39:56');
INSERT INTO `Process_record` VALUES (3046, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 07:39:56');
INSERT INTO `Process_record` VALUES (3047, 2, 0.3100, 0.3100, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 07:54:56');
INSERT INTO `Process_record` VALUES (3048, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 07:54:56');
INSERT INTO `Process_record` VALUES (3049, 2, 0.3400, 0.3267, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 08:09:57');
INSERT INTO `Process_record` VALUES (3050, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 08:09:57');
INSERT INTO `Process_record` VALUES (3051, 2, 0.3200, 0.3133, 0.3000, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 08:24:57');
INSERT INTO `Process_record` VALUES (3052, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 08:24:57');
INSERT INTO `Process_record` VALUES (3053, 2, 0.3200, 0.3133, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 08:39:58');
INSERT INTO `Process_record` VALUES (3054, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 08:39:58');
INSERT INTO `Process_record` VALUES (3055, 2, 0.3200, 0.3167, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 08:54:59');
INSERT INTO `Process_record` VALUES (3056, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 08:54:59');
INSERT INTO `Process_record` VALUES (3057, 2, 0.3400, 0.3300, 0.3200, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 09:10:00');
INSERT INTO `Process_record` VALUES (3058, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 09:10:00');
INSERT INTO `Process_record` VALUES (3059, 2, 0.3100, 0.3100, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 09:25:01');
INSERT INTO `Process_record` VALUES (3060, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 09:25:01');
INSERT INTO `Process_record` VALUES (3061, 2, 0.3300, 0.3200, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 09:40:02');
INSERT INTO `Process_record` VALUES (3062, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 09:40:02');
INSERT INTO `Process_record` VALUES (3063, 2, 0.3100, 0.3100, 0.3100, 504.6400, 504.6400, 504.6400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 09:55:02');
INSERT INTO `Process_record` VALUES (3064, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 09:55:02');
INSERT INTO `Process_record` VALUES (3065, 2, 0.3400, 0.3333, 0.3300, 508.7600, 508.4167, 507.7300, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 10:10:03');
INSERT INTO `Process_record` VALUES (3066, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 10:10:03');
INSERT INTO `Process_record` VALUES (3067, 2, 0.3400, 0.3333, 0.3300, 508.7600, 508.7600, 508.7600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 10:25:04');
INSERT INTO `Process_record` VALUES (3068, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 10:25:04');
INSERT INTO `Process_record` VALUES (3069, 2, 0.3400, 0.3300, 0.3200, 508.7600, 508.7600, 508.7600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 10:40:05');
INSERT INTO `Process_record` VALUES (3070, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 10:40:05');
INSERT INTO `Process_record` VALUES (3071, 2, 0.3400, 0.3400, 0.3400, 508.7600, 508.7600, 508.7600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 10:55:05');
INSERT INTO `Process_record` VALUES (3072, 33, 0.2500, 0.2467, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 10:55:05');
INSERT INTO `Process_record` VALUES (3073, 2, 0.4100, 0.3467, 0.3100, 508.7600, 508.7600, 508.7600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 11:10:06');
INSERT INTO `Process_record` VALUES (3074, 33, 0.2600, 0.2533, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 11:10:06');
INSERT INTO `Process_record` VALUES (3075, 2, 0.3200, 0.3100, 0.3000, 508.7600, 508.7600, 508.7600, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 11:25:07');
INSERT INTO `Process_record` VALUES (3076, 33, 0.2500, 0.2500, 0.2500, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 11:25:07');
INSERT INTO `Process_record` VALUES (3077, 2, 0.3200, 0.3133, 0.3000, 508.8000, 508.7867, 508.7600, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 11:40:07');
INSERT INTO `Process_record` VALUES (3078, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 11:40:07');
INSERT INTO `Process_record` VALUES (3079, 2, 0.3300, 0.3100, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 11:55:08');
INSERT INTO `Process_record` VALUES (3080, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 11:55:08');
INSERT INTO `Process_record` VALUES (3081, 2, 0.3300, 0.3133, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 12:10:09');
INSERT INTO `Process_record` VALUES (3082, 33, 0.2400, 0.2367, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 12:10:09');
INSERT INTO `Process_record` VALUES (3083, 2, 0.3200, 0.3067, 0.2900, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 12:25:09');
INSERT INTO `Process_record` VALUES (3084, 33, 0.2400, 0.2333, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 12:25:09');
INSERT INTO `Process_record` VALUES (3085, 2, 0.3300, 0.3233, 0.3200, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 12:40:10');
INSERT INTO `Process_record` VALUES (3086, 33, 0.2400, 0.2400, 0.2400, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 12:40:10');
INSERT INTO `Process_record` VALUES (3087, 2, 0.3200, 0.3133, 0.3100, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 12:55:10');
INSERT INTO `Process_record` VALUES (3088, 33, 0.2500, 0.2400, 0.2300, 70.8800, 70.8800, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 12:55:10');
INSERT INTO `Process_record` VALUES (3089, 2, 0.3200, 0.3133, 0.3100, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 13:10:11');
INSERT INTO `Process_record` VALUES (3090, 33, 0.2400, 0.2333, 0.2300, 71.1400, 71.0533, 70.8800, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 13:10:11');
INSERT INTO `Process_record` VALUES (3091, 2, 0.3300, 0.3167, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 13:25:12');
INSERT INTO `Process_record` VALUES (3092, 33, 0.2400, 0.2400, 0.2400, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 13:25:12');
INSERT INTO `Process_record` VALUES (3093, 2, 0.3200, 0.3133, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 13:40:13');
INSERT INTO `Process_record` VALUES (3094, 33, 0.2500, 0.2467, 0.2400, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 13:40:13');
INSERT INTO `Process_record` VALUES (3095, 2, 0.3300, 0.3133, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 13:55:14');
INSERT INTO `Process_record` VALUES (3096, 33, 0.2400, 0.2367, 0.2300, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 13:55:14');
INSERT INTO `Process_record` VALUES (3097, 2, 0.3400, 0.3233, 0.3100, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 14:10:15');
INSERT INTO `Process_record` VALUES (3098, 33, 0.2500, 0.2400, 0.2300, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 14:10:15');
INSERT INTO `Process_record` VALUES (3099, 2, 0.3200, 0.3100, 0.2900, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 14:25:16');
INSERT INTO `Process_record` VALUES (3100, 33, 0.2500, 0.2433, 0.2300, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 14:25:16');
INSERT INTO `Process_record` VALUES (3101, 2, 0.3300, 0.3167, 0.3100, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 14:40:17');
INSERT INTO `Process_record` VALUES (3102, 33, 0.2500, 0.2467, 0.2400, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 14:40:17');
INSERT INTO `Process_record` VALUES (3103, 2, 0.3300, 0.3167, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 14:55:17');
INSERT INTO `Process_record` VALUES (3104, 33, 0.2500, 0.2433, 0.2400, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 14:55:17');
INSERT INTO `Process_record` VALUES (3105, 2, 0.3300, 0.3167, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 15:10:18');
INSERT INTO `Process_record` VALUES (3106, 33, 0.2500, 0.2433, 0.2400, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 15:10:18');
INSERT INTO `Process_record` VALUES (3107, 2, 0.3200, 0.3100, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 15:25:19');
INSERT INTO `Process_record` VALUES (3108, 33, 0.2500, 0.2433, 0.2400, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 15:25:19');
INSERT INTO `Process_record` VALUES (3109, 2, 0.3400, 0.3167, 0.3000, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 15:40:20');
INSERT INTO `Process_record` VALUES (3110, 33, 0.2600, 0.2533, 0.2500, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 15:40:20');
INSERT INTO `Process_record` VALUES (3111, 2, 0.3200, 0.3133, 0.3100, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 15:55:21');
INSERT INTO `Process_record` VALUES (3112, 33, 0.2500, 0.2467, 0.2400, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 15:55:21');
INSERT INTO `Process_record` VALUES (3113, 2, 0.3300, 0.3200, 0.3100, 508.8000, 508.8000, 508.8000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 16:10:22');
INSERT INTO `Process_record` VALUES (3114, 33, 0.2500, 0.2433, 0.2400, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 16:10:22');
INSERT INTO `Process_record` VALUES (3115, 2, 3.2500, 1.2900, 0.3100, 511.8900, 509.8300, 508.8000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0033, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 16:24:04');
INSERT INTO `Process_record` VALUES (3116, 33, 0.2500, 0.1633, 0.0000, 71.1400, 71.1400, 71.1400, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2019-04-16 16:24:04');

-- ----------------------------
-- Table structure for Process_record_cache
-- ----------------------------
DROP TABLE IF EXISTS `Process_record_cache`;
CREATE TABLE `Process_record_cache`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 9315 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Process_record_cache
-- ----------------------------
INSERT INTO `Process_record_cache` VALUES (8827, 2, 0.27, 504.55, 0.00, 0.00, 0.00, 0.00, '2019-04-15 19:59:19');
INSERT INTO `Process_record_cache` VALUES (8828, 33, 0.24, 70.88, 0.00, 0.00, 0.00, 0.00, '2019-04-15 19:59:19');
INSERT INTO `Process_record_cache` VALUES (8829, 2, 0.30, 504.55, 0.00, 0.00, 0.00, 0.00, '2019-04-15 20:04:20');
INSERT INTO `Process_record_cache` VALUES (8830, 33, 0.24, 70.88, 0.00, 0.00, 0.00, 0.00, '2019-04-15 20:04:20');

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User`  (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `brief` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户简介',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `registration_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UNI_user`(`user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES (1, 'root', '管理员', '0f3fc66c6c138324be707d110a39704c', 10, '2019-03-12 16:28:22', '2019-04-13 20:53:30');
INSERT INTO `User` VALUES (2, 'houjie', '开发者', '0f3fc66c6c138324be707d110a39704c', 10, '2019-03-12 16:28:22', '2019-04-16 16:26:51');
INSERT INTO `User` VALUES (7, 'houjie-test', '被锁定的账号', '61f4dc6ab78c9153c9b30a317f1d3d5c', 0, '2019-04-08 20:41:49', '2019-04-14 10:19:57');
INSERT INTO `User` VALUES (8, 'houjie-test2', '测试账号2', '0f3fc66c6c138324be707d110a39704c', 1, '2019-04-10 09:40:37', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of User_Host
-- ----------------------------
INSERT INTO `User_Host` VALUES (1, 1, 2, 'DNS lab虚拟机', '1C2G', '2019-03-12 16:30:33');
INSERT INTO `User_Host` VALUES (2, 2, 2, 'DNS lab虚拟机', '1C2G', '2019-03-12 16:30:49');

-- ----------------------------
-- Table structure for User_Process
-- ----------------------------
DROP TABLE IF EXISTS `User_Process`;
CREATE TABLE `User_Process`  (
  `relation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `host_id` int(11) NOT NULL COMMENT '主机id',
  `process_id` int(11) NOT NULL COMMENT '进程id',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注',
  `type` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '进程类型',
  `relation_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关系建立时间',
  PRIMARY KEY (`relation_id`) USING BTREE,
  UNIQUE INDEX `UNI`(`user_id`, `host_id`, `process_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of User_Process
-- ----------------------------
INSERT INTO `User_Process` VALUES (1, 1, 2, 2, 'MySQL数据库', '数据库', '2019-03-13 08:51:11');
INSERT INTO `User_Process` VALUES (2, 2, 2, 2, 'MySQL数据库', '数据库', '2019-03-13 08:56:12');
INSERT INTO `User_Process` VALUES (5, 2, 2, 33, 'MongoDB数据库', '数据库', '2019-04-10 17:57:15');

SET FOREIGN_KEY_CHECKS = 1;
