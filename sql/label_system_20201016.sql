/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.137.100-mysql
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 192.168.137.100:3306
 Source Schema         : label_system

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 16/10/2020 16:58:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_common_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_common_dict`;
CREATE TABLE `t_common_dict`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_common_dict
-- ----------------------------
INSERT INTO `t_common_dict` VALUES ('1', '001', '模型分类', '模型管理中的模型分类，对应t_core_model表中的classify字段值', '2019-06-04 17:08:03', 'system', '2019-06-17 16:59:54', NULL);
INSERT INTO `t_common_dict` VALUES ('10', '010', '标签从属', '标签从属，结点标签/叶子标签', '2019-06-28 13:16:21', NULL, '2019-06-28 13:16:21', NULL);
INSERT INTO `t_common_dict` VALUES ('11', '011', '字段约束', '主题数据表字段约束，主键约束/唯一约束', '2019-07-02 14:08:07', NULL, '2019-07-02 14:08:07', NULL);
INSERT INTO `t_common_dict` VALUES ('12', '012', '表字段类型', '主题数据表字段类型，字符串/数字/日期等', '2019-07-02 14:12:42', NULL, '2019-07-02 14:12:42', NULL);
INSERT INTO `t_common_dict` VALUES ('13', '013', '数据清洗方式', '数据清洗方式，全量/增量', '2019-07-11 16:10:27', NULL, '2019-07-11 16:10:27', NULL);
INSERT INTO `t_common_dict` VALUES ('14', '014', '任务调度状态', '任务调度状态，等待中/正在执行/执行完毕', '2019-07-11 17:29:55', NULL, '2019-07-11 17:30:10', NULL);
INSERT INTO `t_common_dict` VALUES ('15', '015', '变量类型', 'java变量类型，String/Integer等', '2019-07-18 14:10:44', NULL, '2019-07-18 14:13:36', NULL);
INSERT INTO `t_common_dict` VALUES ('2', '002', '消息状态', '消息表中的状态，已读/未读', '2019-06-17 16:57:49', 'system', '2019-06-20 09:39:31', NULL);
INSERT INTO `t_common_dict` VALUES ('3', '003', '审核状态', '审核数据状态，待审核/审核通过/审核不通过', '2019-06-20 09:36:12', 'system', '2019-06-20 09:39:31', NULL);
INSERT INTO `t_common_dict` VALUES ('4', '004', '审核类型', '审核数据类型，新增/修改/删除', '2019-06-20 09:38:42', 'system', '2019-06-20 09:39:31', NULL);
INSERT INTO `t_common_dict` VALUES ('5', '005', '数据源类型', '数据源类型，MYSQL/Oracle/Mongodb', '2019-06-26 13:51:42', NULL, '2019-06-26 13:51:42', NULL);
INSERT INTO `t_common_dict` VALUES ('6', '006', '模型来源', '模型来源，第三方系统/本系统/AI系统', '2019-06-26 17:11:54', NULL, '2019-06-26 17:11:54', NULL);
INSERT INTO `t_common_dict` VALUES ('7', '007', '删除状态', '删除状态，未删除/已删除', '2019-06-26 17:30:03', NULL, '2019-06-26 17:30:54', NULL);
INSERT INTO `t_common_dict` VALUES ('8', '008', '不可用状态', '不可用状态，待删除审核/待修改审核', '2019-06-26 17:33:24', NULL, '2019-06-26 17:33:24', NULL);
INSERT INTO `t_common_dict` VALUES ('9', '009', '标签性质', '标签性质，属性标签/关系标签/分析标签等', '2019-06-27 15:13:22', NULL, '2019-06-27 15:13:22', NULL);

-- ----------------------------
-- Table structure for t_common_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `t_common_dict_item`;
CREATE TABLE `t_common_dict_item`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `pcode` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级编码，关联t_common_dict表code字段',
  `code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典项编码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典项名称',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_common_dict_item
-- ----------------------------
INSERT INTO `t_common_dict_item` VALUES ('1', '001', '001001', '标签提取模型', '该分类下的模型用于提取标签', '2019-06-04 17:09:33', NULL, '2019-06-20 10:40:07', NULL);
INSERT INTO `t_common_dict_item` VALUES ('10', '004', '004003', '删除', NULL, '2019-06-20 09:39:01', NULL, '2019-06-20 10:40:09', NULL);
INSERT INTO `t_common_dict_item` VALUES ('11', '005', '005001', 'MYSQL', NULL, '2019-06-26 13:52:32', NULL, '2019-06-26 13:53:01', NULL);
INSERT INTO `t_common_dict_item` VALUES ('12', '005', '005002', 'ORACLE', NULL, '2019-06-26 13:52:41', NULL, '2019-06-26 13:52:57', NULL);
INSERT INTO `t_common_dict_item` VALUES ('13', '005', '005003', 'MONGODB', NULL, '2019-06-26 13:52:46', NULL, '2019-06-26 13:53:05', NULL);
INSERT INTO `t_common_dict_item` VALUES ('14', '006', '006001', '本系统', NULL, '2019-06-26 17:12:38', NULL, '2019-06-26 17:12:38', NULL);
INSERT INTO `t_common_dict_item` VALUES ('15', '006', '006002', '第三方系统', NULL, '2019-06-26 17:12:51', NULL, '2019-06-26 17:12:51', NULL);
INSERT INTO `t_common_dict_item` VALUES ('16', '007', '007001', '未删除', NULL, '2019-06-26 17:30:34', NULL, '2019-06-26 17:30:34', NULL);
INSERT INTO `t_common_dict_item` VALUES ('17', '007', '007002', '已删除', NULL, '2019-06-26 17:30:44', NULL, '2019-06-27 10:21:02', NULL);
INSERT INTO `t_common_dict_item` VALUES ('18', '008', '008001', '待删除审核', NULL, '2019-06-26 17:34:12', NULL, '2019-06-26 17:34:12', NULL);
INSERT INTO `t_common_dict_item` VALUES ('19', '008', '008002', '待修改审核', NULL, '2019-06-26 17:34:24', NULL, '2019-06-26 17:34:24', NULL);
INSERT INTO `t_common_dict_item` VALUES ('2', '001', '001002', '数据源模型', '该分类下的模型返回数据源链接', '2019-06-04 17:10:16', NULL, '2019-06-20 10:40:10', NULL);
INSERT INTO `t_common_dict_item` VALUES ('20', '003', '003004', '取消审核申请', NULL, '2019-06-27 10:20:40', NULL, '2019-06-27 10:20:40', NULL);
INSERT INTO `t_common_dict_item` VALUES ('21', '009', '009001', '属性标签', NULL, '2019-06-27 15:13:46', NULL, '2019-06-27 15:14:16', NULL);
INSERT INTO `t_common_dict_item` VALUES ('22', '009', '009002', '关系标签', NULL, '2019-06-27 15:13:52', NULL, '2019-06-27 15:14:18', NULL);
INSERT INTO `t_common_dict_item` VALUES ('23', '009', '009003', '分析标签', NULL, '2019-06-27 15:14:00', NULL, '2019-06-27 15:14:21', NULL);
INSERT INTO `t_common_dict_item` VALUES ('24', '010', '010001', '结点标签', '有子节点', '2019-06-28 13:16:46', NULL, '2019-06-28 13:17:36', NULL);
INSERT INTO `t_common_dict_item` VALUES ('25', '010', '010002', '叶子标签', '无子节点', '2019-06-28 13:16:56', NULL, '2019-06-28 13:17:42', NULL);
INSERT INTO `t_common_dict_item` VALUES ('26', '011', '011001', '主键约束', NULL, '2019-07-02 14:08:41', NULL, '2019-07-02 14:08:41', NULL);
INSERT INTO `t_common_dict_item` VALUES ('27', '011', '011002', '唯一约束', NULL, '2019-07-02 14:09:04', NULL, '2019-07-02 14:09:04', NULL);
INSERT INTO `t_common_dict_item` VALUES ('28', '012', '012001', 'VARCHAR', NULL, '2019-07-02 14:13:03', NULL, '2019-07-02 14:35:05', NULL);
INSERT INTO `t_common_dict_item` VALUES ('29', '012', '012002', 'DOUBLE', NULL, '2019-07-02 14:13:10', NULL, '2019-07-02 14:35:09', NULL);
INSERT INTO `t_common_dict_item` VALUES ('3', '002', '002001', '未读', NULL, '2019-06-17 16:59:15', NULL, '2019-06-20 10:40:13', NULL);
INSERT INTO `t_common_dict_item` VALUES ('30', '012', '012003', 'DATETIME', NULL, '2019-07-02 14:13:23', NULL, '2019-07-02 14:35:14', NULL);
INSERT INTO `t_common_dict_item` VALUES ('31', '013', '013001', '全量', '只执行一次，且无更新', '2019-07-11 16:10:42', NULL, '2019-07-11 16:11:24', NULL);
INSERT INTO `t_common_dict_item` VALUES ('32', '013', '013002', '增量', '执行多次，如果记录已存在，则更新', '2019-07-11 16:10:47', NULL, '2019-07-11 16:11:43', NULL);
INSERT INTO `t_common_dict_item` VALUES ('33', '014', '014001', '等待中', NULL, '2019-07-11 17:33:10', NULL, '2019-07-11 17:33:10', NULL);
INSERT INTO `t_common_dict_item` VALUES ('34', '014', '014002', '正在执行', NULL, '2019-07-11 17:33:28', NULL, '2019-07-11 17:33:28', NULL);
INSERT INTO `t_common_dict_item` VALUES ('35', '014', '014003', '执行完毕', '只有一次性任务才有执行完毕状态', '2019-07-11 17:33:45', NULL, '2019-07-11 17:34:41', NULL);
INSERT INTO `t_common_dict_item` VALUES ('36', '014', '014004', '执行异常', '执行异常中断，可以查看执行日志获取详细错误信息', '2019-07-11 17:34:01', NULL, '2019-07-11 17:35:06', NULL);
INSERT INTO `t_common_dict_item` VALUES ('37', '014', '014005', '执行中止', '执行中止后，任务从调度池中移除，且不会再次加入到调度池，直到修改成等待中状态', '2019-07-12 09:27:30', NULL, '2019-07-12 09:27:30', NULL);
INSERT INTO `t_common_dict_item` VALUES ('38', '015', '015001', 'String', NULL, '2019-07-18 14:11:40', NULL, '2019-07-18 14:12:14', NULL);
INSERT INTO `t_common_dict_item` VALUES ('39', '015', '015002', 'Integer', NULL, '2019-07-18 14:11:50', NULL, '2019-07-18 14:12:17', NULL);
INSERT INTO `t_common_dict_item` VALUES ('4', '002', '002002', '已读', NULL, '2019-06-17 16:59:27', NULL, '2019-06-20 10:40:14', NULL);
INSERT INTO `t_common_dict_item` VALUES ('40', '015', '015003', 'Double', NULL, '2019-07-18 14:11:56', NULL, '2019-07-18 14:12:20', NULL);
INSERT INTO `t_common_dict_item` VALUES ('41', '005', '005004', 'POSTGRESQL', 'Postgresql/Mpp数据库', '2019-07-31 13:47:26', NULL, '2019-07-31 13:47:26', NULL);
INSERT INTO `t_common_dict_item` VALUES ('5', '003', '003001', '待审核', NULL, '2019-06-20 09:36:35', NULL, '2019-06-20 10:40:16', NULL);
INSERT INTO `t_common_dict_item` VALUES ('6', '003', '003002', '审核通过', NULL, '2019-06-20 09:36:47', NULL, '2019-06-20 10:40:17', NULL);
INSERT INTO `t_common_dict_item` VALUES ('7', '003', '003003', '审核不通过', NULL, '2019-06-20 09:36:57', NULL, '2019-06-20 10:40:19', NULL);
INSERT INTO `t_common_dict_item` VALUES ('8', '004', '004001', '新增', NULL, '2019-06-20 09:38:53', NULL, '2019-06-20 10:40:20', NULL);
INSERT INTO `t_common_dict_item` VALUES ('9', '004', '004002', '修改', NULL, '2019-06-20 09:38:57', NULL, '2019-06-20 10:40:22', NULL);

-- ----------------------------
-- Table structure for t_common_request_api
-- ----------------------------
DROP TABLE IF EXISTS `t_common_request_api`;
CREATE TABLE `t_common_request_api`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口路径',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数 json',
  `result_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回参数值 json',
  `result_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回参数 json',
  `status` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '前端接口使用API' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_common_request_api
-- ----------------------------

-- ----------------------------
-- Table structure for t_core_datasource
-- ----------------------------
DROP TABLE IF EXISTS `t_core_datasource`;
CREATE TABLE `t_core_datasource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '连接名称',
  `type` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源类型，MYSQL/ORACLE等等',
  `driver` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驱动',
  `host` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机名/ip',
  `port` int(11) NULL DEFAULT NULL COMMENT '端口',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '连接',
  `db` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `schemaname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域，postresql/mpp 存在该属性',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '连接用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '连接密码',
  `structure` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据库所有表结构',
  `is_public` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '是否公开该数据源',
  `status` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_datasource
-- ----------------------------
INSERT INTO `t_core_datasource` VALUES (1, 'zhxz', 'MYSQL', 'com.mysql.cj.jdbc.Driver', NULL, NULL, 'jdbc:mysql://192.168.0.66:3306/zhxz_hrb?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&rewriteBatchedStatements=true&allowMultiQueries=true&useSSL=false&serverTimezone=Asia/Shanghai', 'zhxz_hrb', NULL, 'root', 'root', NULL, 0, NULL, NULL, '2020-08-04 12:01:18', NULL, '2020-08-04 12:01:56', NULL);

-- ----------------------------
-- Table structure for t_core_label_system_info
-- ----------------------------
DROP TABLE IF EXISTS `t_core_label_system_info`;
CREATE TABLE `t_core_label_system_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签体系名称',
  `status` smallint(2) NULL DEFAULT NULL COMMENT '状态',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签体系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_label_system_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_core_label_system_node
-- ----------------------------
DROP TABLE IF EXISTS `t_core_label_system_node`;
CREATE TABLE `t_core_label_system_node`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `info_id` bigint(20) NULL DEFAULT NULL COMMENT '标签体系id',
  `nature` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签性质',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `model_id` bigint(20) NULL DEFAULT NULL COMMENT '模型id',
  `model_param_id` bigint(20) NULL DEFAULT NULL COMMENT '模型参数id',
  `status` smallint(2) NULL DEFAULT NULL COMMENT '状态',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签体系节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_label_system_node
-- ----------------------------

-- ----------------------------
-- Table structure for t_core_lexicon
-- ----------------------------
DROP TABLE IF EXISTS `t_core_lexicon`;
CREATE TABLE `t_core_lexicon`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '词汇名称',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '词汇表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_lexicon
-- ----------------------------
INSERT INTO `t_core_lexicon` VALUES ('323aa08d-8cae-4f78-88e4-0a1f8d617c4a', '测试测试', NULL, '2019-06-27 05:45:07', 'chenlong', '2019-06-27 13:59:45', NULL);

-- ----------------------------
-- Table structure for t_core_log
-- ----------------------------
DROP TABLE IF EXISTS `t_core_log`;
CREATE TABLE `t_core_log`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日志记录格式',
  `level` int(1) NULL DEFAULT 1 COMMENT '日志级别',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问ip',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '接口请求参数',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志元数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_log
-- ----------------------------
INSERT INTO `t_core_log` VALUES ('008e8031-9e99-4ab6-9e09-311f0bce975d', '/login', '在2019-06-26 14:38:54时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-26 06:38:54', '', '2019-06-26 14:38:55', NULL);
INSERT INTO `t_core_log` VALUES ('0659ff38-269e-4360-ae43-13538aae6fb9', '/lexicon/add', 'chenlong 通过IP:127.0.0.1 请求 /lexicon/add接口 添加数据:{\"name\":[\"测试测试\"]}', 3, '127.0.0.1', '{\"name\":[\"测试测试\"]}', NULL, '2019-06-27 05:42:53', 'chenlong', '2019-06-27 13:42:54', NULL);
INSERT INTO `t_core_log` VALUES ('0b4ab181-125f-4b04-9c8b-938c80750109', '/login', '在2019-07-02 11:20:01时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-02 03:20:01', '', '2019-07-02 11:20:01', NULL);
INSERT INTO `t_core_log` VALUES ('20a7b80b-6100-47f0-a351-fe490184fe80', '/login', '在2019-07-18 16:05:36时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-18 08:05:36', '', '2019-07-18 16:05:37', NULL);
INSERT INTO `t_core_log` VALUES ('29206b28-8396-47ed-a74d-38d39feb7f30', '/login', 'chenlong在2019-06-25 13:37:14时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 05:37:14', 'chenlong', '2019-06-25 13:37:14', NULL);
INSERT INTO `t_core_log` VALUES ('2947ecb4-9f33-44db-b454-313f619c8296', '/login', '在2019-08-05 09:40:43时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-08-05 01:40:43', '', '2019-08-05 09:40:43', NULL);
INSERT INTO `t_core_log` VALUES ('2abb3b16-92df-479e-bc05-b1709aa48848', '/login', 'chenlong在2019-06-25 11:39:19时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 03:39:19', 'chenlong', '2019-06-25 11:39:19', NULL);
INSERT INTO `t_core_log` VALUES ('2db7d6d4-43b6-46bc-ad1c-d65af273eeb5', '/login', 'chenlong在2019-08-05 09:38:58时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-08-05 01:38:58', 'chenlong', '2019-08-05 09:38:58', NULL);
INSERT INTO `t_core_log` VALUES ('3351cc9b-d66f-4add-a06e-828eccb1696c', '/login', 'chenlong在2019-06-25 09:30:15时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 01:30:15', 'chenlong', '2019-06-25 09:30:15', NULL);
INSERT INTO `t_core_log` VALUES ('3803e30d-1a4e-4853-bffe-00d4d7a5bef0', '/login', '在2019-07-03 11:35:21时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-03 03:35:21', '', '2019-07-03 11:35:21', NULL);
INSERT INTO `t_core_log` VALUES ('382ce160-b238-4da8-8295-a90bf7718c9d', '/login', '在2019-06-26 17:00:28时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-26 09:00:28', '', '2019-06-26 17:00:28', NULL);
INSERT INTO `t_core_log` VALUES ('387ad536-a024-4875-beb1-4d8852515696', '/login', '在2019-07-10 13:37:42时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-10 05:37:42', '', '2019-07-10 13:37:42', NULL);
INSERT INTO `t_core_log` VALUES ('3fed72ef-f44a-4f3c-b4af-3393d6388bb7', '/login', '在2019-07-15 16:55:06时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-15 08:55:06', '', '2019-07-15 16:55:06', NULL);
INSERT INTO `t_core_log` VALUES ('40d69799-abd9-4279-b714-64a60ba42307', '/lexicon/add', 'chenlong 通过IP:127.0.0.1 请求 /lexicon/add接口 添加数据:{\"name\":[\"测试测试\"]}', 3, '127.0.0.1', '{\"name\":[\"测试测试\"]}', NULL, '2019-06-27 05:44:52', 'chenlong', '2019-06-27 13:44:52', NULL);
INSERT INTO `t_core_log` VALUES ('41b04375-1a8d-487a-8d73-9981d9bc55a3', '/login', '在2019-06-27 09:24:52时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-27 01:24:52', '', '2019-06-27 09:24:53', NULL);
INSERT INTO `t_core_log` VALUES ('41dfc042-9cf7-4b25-ab9d-6cd6b3a8ab44', '/login', '在2019-07-12 13:44:18时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-12 05:44:18', '', '2019-07-12 13:44:18', NULL);
INSERT INTO `t_core_log` VALUES ('48061464-5a5d-4536-8264-ff01dd4a74ae', '/login', '在2019-07-09 10:44:15时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-09 02:44:15', '', '2019-07-09 10:44:15', NULL);
INSERT INTO `t_core_log` VALUES ('49e58814-e42a-4f61-b2b8-9bc35fdf9161', '/login', '在2019-07-09 17:05:26时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-09 09:05:26', '', '2019-07-09 17:05:26', NULL);
INSERT INTO `t_core_log` VALUES ('4c569fce-121f-4160-b9bc-b3b3978597d5', '/login', 'chenlong在2019-06-25 11:37:52时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 03:37:52', 'chenlong', '2019-06-25 11:37:52', NULL);
INSERT INTO `t_core_log` VALUES ('4f22a7ad-8e34-433d-a760-87edf50c2786', '/login', '在2019-07-10 15:01:55时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-10 07:01:55', '', '2019-07-10 15:01:55', NULL);
INSERT INTO `t_core_log` VALUES ('545ba419-fb77-416c-80a5-a05634d73b24', '/lexicon/add', 'chenlong 通过IP:127.0.0.1 请求 /lexicon/add接口 添加数据:{\"name\":[\"测试测试\"]}', 3, '127.0.0.1', '{\"name\":[\"测试测试\"]}', NULL, '2019-06-27 05:45:08', 'chenlong', '2019-06-27 13:45:08', NULL);
INSERT INTO `t_core_log` VALUES ('55f8c098-50a5-47d3-a420-8eac07f0971b', '/login', '在2019-06-25 11:35:57时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 03:35:57', '', '2019-06-25 11:35:57', NULL);
INSERT INTO `t_core_log` VALUES ('56b154d7-b9a0-4be6-b255-b69145d7d86e', '/login', '在2019-06-28 14:14:43时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-28 06:14:43', '', '2019-06-28 14:14:44', NULL);
INSERT INTO `t_core_log` VALUES ('578b53d1-5694-40bb-bbc8-342f9d8ee2f8', '/login', '在2019-07-16 15:22:41时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-16 07:22:41', '', '2019-07-16 15:22:41', NULL);
INSERT INTO `t_core_log` VALUES ('59312376-ebcc-4704-b24d-1f430480529d', '/login', 'chenlong在2019-07-09 17:38:02时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-09 09:38:02', 'chenlong', '2019-07-09 17:38:02', NULL);
INSERT INTO `t_core_log` VALUES ('5bb4391b-96d8-48fd-a984-8fe4653c4caf', '/login', '在2019-07-04 10:01:08时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-04 02:01:08', '', '2019-07-04 10:01:08', NULL);
INSERT INTO `t_core_log` VALUES ('5d933876-4ecc-4325-806a-6d04fb9d66a8', '/lexicon/add', 'chenlong 通过IP:127.0.0.1 请求 /lexicon/add接口 添加数据:{\"name\":[\"测试测试\"]}', 3, '127.0.0.1', '{\"name\":[\"测试测试\"]}', NULL, '2019-06-27 05:45:06', 'chenlong', '2019-06-27 13:45:06', NULL);
INSERT INTO `t_core_log` VALUES ('5db94ca1-c026-4c11-a11e-a9ce0ab271d0', '/login', 'chenlong在2019-06-25 13:20:10时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 05:20:10', 'chenlong', '2019-06-25 13:20:10', NULL);
INSERT INTO `t_core_log` VALUES ('5ea739a2-d3af-4358-9f6e-9146fd7c217c', '/login', '在2019-07-12 14:41:18时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-12 06:41:18', '', '2019-07-12 14:41:19', NULL);
INSERT INTO `t_core_log` VALUES ('606c01d4-a8b6-4c65-a9b5-01a7099e1090', '/lexicon/add', 'chenlong 通过IP:127.0.0.1 请求 /lexicon/add接口 添加数据:{\"name\":[\"测试测试\"]}', 3, '127.0.0.1', '{\"name\":[\"测试测试\"]}', NULL, '2019-06-27 05:42:57', 'chenlong', '2019-06-27 13:42:57', NULL);
INSERT INTO `t_core_log` VALUES ('61ce9b25-a218-4646-ba05-54cd999b540a', '/login', '在2019-06-26 14:54:34时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-26 06:54:34', '', '2019-06-26 14:54:34', NULL);
INSERT INTO `t_core_log` VALUES ('6368bf32-27e5-48cc-b489-cc71b58e7a6c', '/login', 'chenlong在2019-06-25 11:36:48时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 03:36:48', 'chenlong', '2019-06-25 11:36:48', NULL);
INSERT INTO `t_core_log` VALUES ('6a4b6a6b-db73-4026-8893-71f1af8c83de', '/login', 'chenlong在2019-06-25 13:20:20时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 05:20:20', 'chenlong', '2019-06-25 13:20:20', NULL);
INSERT INTO `t_core_log` VALUES ('70d2152f-d68f-4d26-a8f1-4c482fc30b01', '/login', '在2019-06-25 13:46:59时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 05:46:59', '', '2019-06-25 13:46:59', NULL);
INSERT INTO `t_core_log` VALUES ('74c3dab1-f4c5-4897-8d95-58b8df1695cd', '/login', '在2019-07-09 08:52:30时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-09 00:52:30', '', '2019-07-09 08:52:30', NULL);
INSERT INTO `t_core_log` VALUES ('79d6d9a2-f0a6-4bd5-84a0-bec3dfc14127', '/login', 'chenlong在2019-08-05 09:40:42时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-08-05 01:40:42', 'chenlong', '2019-08-05 09:40:42', NULL);
INSERT INTO `t_core_log` VALUES ('7b9a53f9-2637-487a-9883-48695dfd84ff', '/login', '在2019-08-05 09:38:22时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-08-05 01:38:22', '', '2019-08-05 09:38:23', NULL);
INSERT INTO `t_core_log` VALUES ('8c92dde8-db70-4800-8969-ce3eec3d2fdd', '/login', '在2019-06-25 13:14:36时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 05:14:36', '', '2019-06-25 13:14:36', NULL);
INSERT INTO `t_core_log` VALUES ('98d14aae-80f9-4b1b-b4c1-abf884563315', '/lexicon/add', 'chenlong 通过IP:127.0.0.1 请求 /lexicon/add接口 添加数据:{\"name\":[\"测试测试\"]}', 3, '127.0.0.1', '{\"name\":[\"测试测试\"]}', NULL, '2019-06-27 05:41:06', 'chenlong', '2019-06-27 13:41:06', NULL);
INSERT INTO `t_core_log` VALUES ('a0da6ba8-0e54-4409-9406-0987d2ca979b', '/login', '在2019-08-05 09:39:03时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-08-05 01:39:03', '', '2019-08-05 09:39:03', NULL);
INSERT INTO `t_core_log` VALUES ('a4cdebfd-6ef3-4010-a082-bf34556a5c1a', '/login', '在2019-06-25 15:20:54时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 07:20:54', '', '2019-06-25 15:20:54', NULL);
INSERT INTO `t_core_log` VALUES ('ad512463-e581-4eb5-8731-31e3ab07ac85', '/lexicon/add', 'chenlong 通过IP:127.0.0.1 请求 /lexicon/add接口 添加数据:{\"name\":[\"测试测试\"]}', 3, '127.0.0.1', '{\"name\":[\"测试测试\"]}', NULL, '2019-06-27 05:43:03', 'chenlong', '2019-06-27 13:43:03', NULL);
INSERT INTO `t_core_log` VALUES ('b535f547-37fb-40f2-9b06-a7ccbd2e92ee', '/login', '在2019-06-25 13:24:05时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 05:24:05', '', '2019-06-25 13:24:05', NULL);
INSERT INTO `t_core_log` VALUES ('b62187e2-3f9b-42b5-818b-aa72d3614282', '/login', '在2019-07-05 10:14:32时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-05 02:14:32', '', '2019-07-05 10:14:32', NULL);
INSERT INTO `t_core_log` VALUES ('bcd5319f-f705-45ae-a335-b3ae97a98e16', '/login', '在2019-06-27 13:40:40时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-27 05:40:40', '', '2019-06-27 13:40:40', NULL);
INSERT INTO `t_core_log` VALUES ('bd80d6a5-731f-44f8-b3f5-5035e4799089', '/lexicon/add', 'chenlong 通过IP:127.0.0.1 请求 /lexicon/add接口 添加数据:{\"name\":[\"测试测试\"]}', 3, '127.0.0.1', '{\"name\":[\"测试测试\"]}', NULL, '2019-06-27 05:43:01', 'chenlong', '2019-06-27 13:43:02', NULL);
INSERT INTO `t_core_log` VALUES ('c3ce1da7-6d8e-44b1-9629-0d2581949698', '/login', 'chenlong在2019-06-25 13:22:39时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 05:22:39', 'chenlong', '2019-06-25 13:22:39', NULL);
INSERT INTO `t_core_log` VALUES ('c948678d-58bd-48b2-b623-df185babd736', '/login', '在2019-06-25 15:21:22时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 07:21:22', '', '2019-06-25 15:21:22', NULL);
INSERT INTO `t_core_log` VALUES ('cd3111b3-2bf5-405a-b604-852d726eebd4', '/login', '在2019-06-25 15:22:09时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 07:22:09', '', '2019-06-25 15:22:09', NULL);
INSERT INTO `t_core_log` VALUES ('d4dc061e-2dbf-4ae0-b548-3d45b1548309', '/login', '在2019-07-01 09:46:28时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-01 01:46:28', '', '2019-07-01 01:46:29', NULL);
INSERT INTO `t_core_log` VALUES ('dc884ea8-17fd-47ff-b38c-139141a8323e', '/login', '在2019-07-01 09:31:01时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-01 01:31:01', '', '2019-07-01 01:31:02', NULL);
INSERT INTO `t_core_log` VALUES ('e4a96375-0ba7-47cc-a4c2-0cd78d1df1ca', '/login', 'chenlong在2019-06-25 11:37:44时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-06-25 03:37:44', 'chenlong', '2019-06-25 11:37:45', NULL);
INSERT INTO `t_core_log` VALUES ('f129ee41-cb67-45ce-a27e-c6ba5933f32a', '/login', '在2019-07-03 13:27:25时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-03 05:27:25', '', '2019-07-03 13:27:25', NULL);
INSERT INTO `t_core_log` VALUES ('f4c8b336-50d5-4299-8826-37c73da4b12f', '/login', '在2019-07-12 09:57:44时，通过127.0.0.1登录系统', 3, '127.0.0.1', '{\"username\":[\"chenlong\"],\"password\":[\"111111\"]}', NULL, '2019-07-12 01:57:44', '', '2019-07-12 09:57:45', NULL);

-- ----------------------------
-- Table structure for t_core_log_meta
-- ----------------------------
DROP TABLE IF EXISTS `t_core_log_meta`;
CREATE TABLE `t_core_log_meta`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志触发访问连接，一对一关联t_party_permission表中url数据',
  `format` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日志记录格式',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `url`(`url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志元数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_log_meta
-- ----------------------------
INSERT INTO `t_core_log_meta` VALUES ('1', '/lexicon/add', '${user} 通过IP:${ip} 请求 ${url}接口 添加数据:${param}', NULL, '2019-06-03 10:38:55', NULL, '2019-06-20 08:56:38', NULL);
INSERT INTO `t_core_log_meta` VALUES ('2', '/login', '${user}在${datetime}时，通过${ip}登录系统', NULL, '2019-06-03 14:04:55', NULL, '2019-06-20 08:55:35', NULL);
INSERT INTO `t_core_log_meta` VALUES ('3', '/lexicon/del', '${user} 通过IP:${ip} 请求 ${url}接口 发起删除${param} 词汇申请', NULL, '2019-06-26 14:01:14', NULL, '2019-06-26 14:01:55', NULL);
INSERT INTO `t_core_log_meta` VALUES ('4', '/lexicon/edit', '${user} 通过IP:${ip} 请求 ${url}接口 发起修改${param} 词汇申请', NULL, '2019-06-26 14:02:09', NULL, '2019-06-26 14:02:21', NULL);
INSERT INTO `t_core_log_meta` VALUES ('5', '/lexicon/page', '${user} 通过IP:${ip} 请求 ${url}接口 检索词汇', NULL, '2019-06-26 14:05:05', NULL, '2019-06-26 14:05:28', NULL);

-- ----------------------------
-- Table structure for t_core_model
-- ----------------------------
DROP TABLE IF EXISTS `t_core_model`;
CREATE TABLE `t_core_model`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型名称',
  `classify` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型分类，标签提取模型、数据源模型等等',
  `origin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型来源',
  `rule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模型规则，java代码',
  `shine` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '映射,最终源代码',
  `status` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_model
-- ----------------------------
INSERT INTO `t_core_model` VALUES ('43076b2e-d45d-4370-9f39-68ee7ccb21df', '报案人姓名标签', '001001', '006001', '{\"const\":[],\"body\":\"return entity.get(\\\"barxm\\\") == null ? null : entity.get(\\\"barxm\\\").toString();\",\"outType\":\"String\"}', 'package com.model;\r\nimport java.util.Map;\r\n\r\npublic class 报案人姓名标签 {\r\npublic static String method(Map<String, Object> entity) {return entity.get(\"barxm\") == null ? null : entity.get(\"barxm\").toString();}\r\n}', NULL, 'wu', '2019-08-05 02:16:54', 'chenlong', '2019-08-05 10:17:07', NULL);
INSERT INTO `t_core_model` VALUES ('ca9dc19e-ad8d-4351-b1e7-37f310a01443', '性别标签提取模型', '001001', '006001', '{\"const\":[{\"fieldType\":\"String\",\"fieldName\":\"male\"},{\"fieldType\":\"String\",\"fieldName\":\"female\"}],\"body\":\"String sex = entity.get(\\\"xb\\\") == null ? \\\"\\\" : entity.get(\\\"xb\\\").toString();if(sex.equals(male)) return \\\"男\\\"; else if(sex.equals(female)) return \\\"女\\\"; else return null;\",\"outType\":\"String\"}', 'package com.model;\r\nimport java.util.Map;\r\n\r\npublic class 性别标签提取模型 {\r\npublic static String method(Map<String, Object> entity, String male, String female) {String sex = entity.get(\"xb\") == null ? \"\" : entity.get(\"xb\").toString();if(sex.equals(male)) return \"男\"; else if(sex.equals(female)) return \"女\"; else return null;}\r\n}', NULL, '提取人性别标签', '2019-07-16 07:22:44', 'chenlong', '2019-07-16 15:23:23', NULL);
INSERT INTO `t_core_model` VALUES ('db978c14-47a3-4ba4-80a3-01e876bae080', '提取身份证号标签模型', '001001', '006001', '{\"const\":[],\"body\":\"return entity.get(\\\"sfzh\\\")==null ? null : entity.get(\\\"sfzh\\\").toString();\",\"outType\":\"String\"}', 'package com.model;\r\nimport java.util.Map;\r\n\r\npublic class 提取身份证号标签模型 {\r\npublic static String method(Map<String, Object> entity) {return entity.get(\"sfzh\")==null ? null : entity.get(\"sfzh\").toString();}\r\n}', NULL, '无', '2019-07-18 09:18:11', 'chenlong', '2019-07-18 17:18:24', NULL);

-- ----------------------------
-- Table structure for t_core_model_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_core_model_attachment`;
CREATE TABLE `t_core_model_attachment`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `cmid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型id,多对一关联t_core_theme表id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件路径',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模型附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_model_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for t_core_model_param
-- ----------------------------
DROP TABLE IF EXISTS `t_core_model_param`;
CREATE TABLE `t_core_model_param`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `cmid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型id，多对一关联t_core_model表id',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模型参数，json格式键值对',
  `status` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模型参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_model_param
-- ----------------------------
INSERT INTO `t_core_model_param` VALUES ('7a488b57-c16c-4f1d-8a4e-93a1d3a5831e', 'ca9dc19e-ad8d-4351-b1e7-37f310a01443', '{\"male\":\"男性\",\"female\":\"女性\"}', NULL, '男性和女性', '2019-07-16 07:22:44', 'chenlong', '2019-07-19 16:17:50', NULL);

-- ----------------------------
-- Table structure for t_core_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_core_notice`;
CREATE TABLE `t_core_notice`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `receiver` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收人',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容',
  `status` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息提示表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_notice
-- ----------------------------
INSERT INTO `t_core_notice` VALUES ('062d587b-67a9-4ed1-9beb-d8dfc79fe8a6', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 02:05:32', 'chenlong', '2019-07-01 02:05:32', NULL);
INSERT INTO `t_core_notice` VALUES ('0cd9753a-e0a5-4e15-b71a-ac1d75fa213e', '', '审核', '主题案件主题-审核通过', '002001', NULL, '2019-08-02 08:49:58', '', '2019-08-02 16:49:07', NULL);
INSERT INTO `t_core_notice` VALUES ('159a6112-40c6-4ced-b79f-9b44a65873d8', 'chenlong', '模型审核', '模型提取身份证号标签模型-审核通过', '002001', NULL, '2019-07-18 09:18:24', 'chenlong', '2019-07-18 17:18:24', NULL);
INSERT INTO `t_core_notice` VALUES ('1833a23b-cc5b-4c3c-9d9f-0fb102d443dd', '', '审核', '主题人-审核通过', '002001', NULL, '2019-08-02 03:31:22', '', '2019-08-02 11:30:30', NULL);
INSERT INTO `t_core_notice` VALUES ('1d9b8081-63e7-46bb-bda5-004313ff7fe9', '', '审核', '标签体系单人标签-审核通过', '002001', NULL, '2019-07-25 03:31:47', '', '2019-07-25 11:31:47', NULL);
INSERT INTO `t_core_notice` VALUES ('29bddfbb-08fe-4a90-b9a7-8f12f005cf8a', 'chenlong', '模型审核', '模型报案人姓名-审核通过', '002001', NULL, '2019-08-05 01:41:21', 'chenlong', '2019-08-05 09:41:21', NULL);
INSERT INTO `t_core_notice` VALUES ('29f178bb-dbe5-4b04-ab75-705ed81af3dd', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-04 02:57:30', 'chenlong', '2019-07-04 10:57:30', NULL);
INSERT INTO `t_core_notice` VALUES ('2a53d858-23a9-4ab7-b721-44edf1ad078a', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 02:45:04', 'chenlong', '2019-07-01 02:45:04', NULL);
INSERT INTO `t_core_notice` VALUES ('2acce438-9314-4525-ab81-9cc602ea4ca4', 'chenlong', '审核', '标签体系案件-审核通过', '002001', NULL, '2019-08-05 01:42:28', 'chenlong', '2019-08-05 09:42:28', NULL);
INSERT INTO `t_core_notice` VALUES ('2f3b07ab-fe2f-4592-a85a-01d17d525692', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-04 03:45:00', 'chenlong', '2019-07-04 11:45:00', NULL);
INSERT INTO `t_core_notice` VALUES ('2fd43c8a-730c-4282-8475-635587313a56', '', '审核', '主题案件主题-审核不通过', '002001', NULL, '2019-08-02 03:59:14', '', '2019-08-02 11:58:22', NULL);
INSERT INTO `t_core_notice` VALUES ('323cd8c3-ec83-4774-9418-827ce02ce17c', 'chenlong', '模型审核', '模型提取身份证号标签模型-审核通过', '002001', NULL, '2019-07-18 09:14:36', 'chenlong', '2019-07-18 17:14:36', NULL);
INSERT INTO `t_core_notice` VALUES ('379b9db6-4041-471c-b129-eb4bc9d0efba', 'chenlong', '模型审核', '模型性别标签提取模型-审核通过', '002001', NULL, '2019-07-09 03:10:28', 'chenlong', '2019-07-09 11:10:28', NULL);
INSERT INTO `t_core_notice` VALUES ('3ae50de3-c763-4461-928e-c8b126a42121', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:19:36', '', '2019-07-25 11:19:36', NULL);
INSERT INTO `t_core_notice` VALUES ('3ca15a16-524e-4120-8131-f18906407649', '', '审核', '主题人-审核不通过', '002001', NULL, '2019-07-12 08:44:56', '', '2019-07-12 16:44:56', NULL);
INSERT INTO `t_core_notice` VALUES ('424dde92-2d88-4582-b746-f042a4e5d91c', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:09:25', '', '2019-07-25 11:09:25', NULL);
INSERT INTO `t_core_notice` VALUES ('4321c77a-5bab-46fc-a19f-b6a83c1f5c80', '', '审核', '主题人-审核通过', '002001', NULL, '2019-07-12 08:37:29', '', '2019-07-12 16:37:29', NULL);
INSERT INTO `t_core_notice` VALUES ('43dc7402-a6af-45d9-8b8a-ec337e87ea8e', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 02:48:28', 'chenlong', '2019-07-01 02:48:28', NULL);
INSERT INTO `t_core_notice` VALUES ('441b966e-ee56-4d09-aef4-59514ca411e6', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:24:17', '', '2019-07-25 11:24:17', NULL);
INSERT INTO `t_core_notice` VALUES ('449cd3fa-bba0-494c-ab6c-c464d02939e2', '', '审核', '主题人-审核不通过', '002001', NULL, '2019-07-12 08:45:12', '', '2019-07-12 16:45:12', NULL);
INSERT INTO `t_core_notice` VALUES ('4ca9f4e9-7b4f-4094-92d1-8023c9c450f0', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-19 09:31:14', '', '2019-07-19 17:31:14', NULL);
INSERT INTO `t_core_notice` VALUES ('4cc46195-43df-4eab-80a6-d518f3a362ed', 'chenlong', '模型审核', '模型报案人姓名标签-审核通过', '002001', NULL, '2019-08-05 02:17:07', 'chenlong', '2019-08-05 10:17:07', NULL);
INSERT INTO `t_core_notice` VALUES ('5748b69d-bc12-4c68-80bc-998fa49fe699', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:13:58', '', '2019-07-25 11:13:58', NULL);
INSERT INTO `t_core_notice` VALUES ('5cdf691c-018b-440f-b42a-fd88a7baf118', '', '审核', '主题银行卡-审核通过', '002001', NULL, '2019-07-12 08:58:50', '', '2019-07-12 16:58:50', NULL);
INSERT INTO `t_core_notice` VALUES ('5ee76034-40a2-4a1e-a941-bcc5317d7d88', '', '审核', '主题案件主题-审核通过', '002001', NULL, '2019-08-02 06:37:03', '', '2019-08-02 14:36:12', NULL);
INSERT INTO `t_core_notice` VALUES ('5f149d45-3b08-42f1-bbdd-2a0141d4580f', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-05 02:28:14', 'chenlong', '2019-07-05 10:28:14', NULL);
INSERT INTO `t_core_notice` VALUES ('5fbd6304-ecd8-486d-a5bc-a2201abd42ff', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 03:25:40', 'chenlong', '2019-07-01 11:25:41', NULL);
INSERT INTO `t_core_notice` VALUES ('6022313a-3aab-4397-8bd1-7b5627dea08c', 'chenlong', '审核', '标签体系案件-审核通过', '002001', NULL, '2019-08-05 02:18:44', 'chenlong', '2019-08-05 10:18:44', NULL);
INSERT INTO `t_core_notice` VALUES ('63d89464-3b09-4614-820e-9e550ea7959c', '', '审核', '标签体系单人标签-审核通过', '002001', NULL, '2019-08-02 03:32:06', '', '2019-08-02 11:31:14', NULL);
INSERT INTO `t_core_notice` VALUES ('65f5ca2b-fa65-44a4-b8b5-d43453f29898', '', '审核', '主题人-审核不通过', '002001', NULL, '2019-07-12 08:43:13', '', '2019-07-12 16:43:13', NULL);
INSERT INTO `t_core_notice` VALUES ('6c40ba1f-e927-40f4-b19d-ec14d9443322', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-05 02:43:09', 'chenlong', '2019-07-05 10:43:09', NULL);
INSERT INTO `t_core_notice` VALUES ('6d02b99e-cc46-4f48-8912-77909ffac12f', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-05 02:26:44', 'chenlong', '2019-07-05 10:26:44', NULL);
INSERT INTO `t_core_notice` VALUES ('76abe10d-c5b7-4646-be3e-e88b7bd0497d', 'chenlong', '审核', '主题案件主题-审核通过', '002001', NULL, '2019-08-05 02:07:46', 'chenlong', '2019-08-05 10:07:46', NULL);
INSERT INTO `t_core_notice` VALUES ('79c11df8-f562-43d8-a7f8-f23c5d79687f', 'chenlong', '审核', '标签体系案件标签体系-审核通过', '002001', NULL, '2019-08-05 02:58:16', 'chenlong', '2019-08-05 10:58:16', NULL);
INSERT INTO `t_core_notice` VALUES ('7a4f5ce4-6dff-480a-8887-270674e06cd4', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 03:28:44', 'chenlong', '2019-07-01 11:28:44', NULL);
INSERT INTO `t_core_notice` VALUES ('7aec3377-ccf4-4f5e-bbea-f8e627f26ef7', '', '审核', '主题人-审核通过', '002001', NULL, '2019-07-12 08:45:46', '', '2019-07-12 16:45:46', NULL);
INSERT INTO `t_core_notice` VALUES ('7bccd12b-699c-441f-8b13-e673261c541b', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-12 06:50:20', 'chenlong', '2019-07-12 14:50:20', NULL);
INSERT INTO `t_core_notice` VALUES ('7cff7134-aba2-4b0e-abf7-3e03d7bc1c2e', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:16:10', '', '2019-07-25 11:16:10', NULL);
INSERT INTO `t_core_notice` VALUES ('7d8443e1-d9bc-4083-b5f3-8e2e0be55281', '', '审核', '主题人-审核通过', '002001', NULL, '2019-07-16 02:57:24', '', '2019-07-16 10:57:24', NULL);
INSERT INTO `t_core_notice` VALUES ('8153a96f-693e-4406-8975-6fcbb647f7d1', 'chenlong', '模型审核', '模型性别标签提取模型-审核通过', '002001', NULL, '2019-07-09 02:54:55', 'chenlong', '2019-07-09 10:54:55', NULL);
INSERT INTO `t_core_notice` VALUES ('84eaac54-d9d2-43c6-964a-59fa8b021e23', '', '审核', '主题案件主题-审核通过', '002001', NULL, '2019-08-05 01:31:41', '', '2019-08-05 09:31:41', NULL);
INSERT INTO `t_core_notice` VALUES ('88971c33-1318-46cd-b37b-8b0682227e02', '', '审核', '主题案件主题-审核通过', '002001', NULL, '2019-08-02 08:31:29', '', '2019-08-02 16:30:37', NULL);
INSERT INTO `t_core_notice` VALUES ('92fc5db4-942f-491d-8370-3144f110459e', '', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-19 02:17:17', '', '2019-07-19 10:17:17', NULL);
INSERT INTO `t_core_notice` VALUES ('93fe9c89-c2f9-4015-8c2a-ea262ff190f8', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-19 09:30:46', '', '2019-07-19 17:30:46', NULL);
INSERT INTO `t_core_notice` VALUES ('940e2ba7-1ce9-4685-82fc-45a4ec9f738f', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 03:28:57', 'chenlong', '2019-07-01 11:28:57', NULL);
INSERT INTO `t_core_notice` VALUES ('9e67d525-884d-477d-85bd-a3c1d9748ad1', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-05 02:18:06', 'chenlong', '2019-07-05 10:18:06', NULL);
INSERT INTO `t_core_notice` VALUES ('a53e8721-c088-4782-9988-67f669c18f63', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:18:21', '', '2019-07-25 11:18:21', NULL);
INSERT INTO `t_core_notice` VALUES ('a600b8e9-2bda-4c81-aca6-c09a06104e23', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 02:10:13', 'chenlong', '2019-07-01 02:10:13', NULL);
INSERT INTO `t_core_notice` VALUES ('a7c0ed7b-5597-439a-bc64-cc6c7afe2ff4', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 02:59:00', 'chenlong', '2019-07-01 10:59:00', NULL);
INSERT INTO `t_core_notice` VALUES ('ab0d65c9-49ca-4fa2-a549-2b70d95633e5', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-05 02:47:34', 'chenlong', '2019-07-05 10:47:34', NULL);
INSERT INTO `t_core_notice` VALUES ('ac2a02f0-0680-49a3-be64-0c0b82d999a0', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 03:30:04', 'chenlong', '2019-07-01 11:30:04', NULL);
INSERT INTO `t_core_notice` VALUES ('b3103f29-0ea8-4f47-8c9d-9586e5775ccb', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-04 03:31:49', 'chenlong', '2019-07-04 11:31:49', NULL);
INSERT INTO `t_core_notice` VALUES ('bb20993b-e013-446f-a005-e7bc6e77f8e9', '', '审核', '主题人-审核不通过', '002001', NULL, '2019-07-12 08:41:02', '', '2019-07-12 16:41:02', NULL);
INSERT INTO `t_core_notice` VALUES ('bbd113ee-7a7e-4715-8692-7d57453547eb', '', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-09 05:43:10', '', '2019-07-09 13:43:11', NULL);
INSERT INTO `t_core_notice` VALUES ('be410421-7a16-4d50-9e50-ac72d9b45b62', '', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-19 02:07:45', '', '2019-07-19 10:07:45', NULL);
INSERT INTO `t_core_notice` VALUES ('bea0512e-c96e-4489-b5aa-3c55a378ec2d', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:17:58', '', '2019-07-25 11:17:58', NULL);
INSERT INTO `t_core_notice` VALUES ('bedd7522-9622-40ac-b193-c3f83d99b600', 'chenlong', '模型审核', '模型名称-审核通过', '002001', NULL, '2019-07-18 09:07:11', 'chenlong', '2019-07-18 17:07:11', NULL);
INSERT INTO `t_core_notice` VALUES ('c332fd91-8c7a-4538-9158-e8352a633cd9', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-12 06:46:09', 'chenlong', '2019-07-12 14:46:09', NULL);
INSERT INTO `t_core_notice` VALUES ('c5162b50-6324-4e2b-82c4-074b743d908e', 'chenlong', '词汇审核', '词汇测试测试-审核通过', '002001', NULL, '2019-06-27 05:59:45', 'chenlong', '2019-06-27 13:59:45', NULL);
INSERT INTO `t_core_notice` VALUES ('d18c42ca-0bdf-4c6a-bde8-1b0ad990d6ab', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-09 01:48:42', 'chenlong', '2019-07-09 09:48:42', NULL);
INSERT INTO `t_core_notice` VALUES ('d1b2199d-3057-46ee-be49-1451cec834e0', '', '审核', '主题案件主题-审核通过', '002001', NULL, '2019-08-05 01:30:58', '', '2019-08-05 09:30:58', NULL);
INSERT INTO `t_core_notice` VALUES ('d1c43601-a22d-4409-8941-919d389c5dad', 'chenlong', '模型审核', '模型名称-审核通过', '002001', NULL, '2019-07-18 08:40:46', 'chenlong', '2019-07-18 16:40:47', NULL);
INSERT INTO `t_core_notice` VALUES ('d66f97c6-0aeb-4c3f-a05e-edbaab39d0a0', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:18:50', '', '2019-07-25 11:18:50', NULL);
INSERT INTO `t_core_notice` VALUES ('d8f1030a-678f-4f5f-a75f-f96e8687e1bf', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 03:18:00', 'chenlong', '2019-07-01 11:18:00', NULL);
INSERT INTO `t_core_notice` VALUES ('d9991122-dde0-4d58-8d32-578b69a40470', 'chenlong', '模型审核', '模型提取身份证号标签模型-审核通过', '002001', NULL, '2019-07-18 09:16:13', 'chenlong', '2019-07-18 17:16:13', NULL);
INSERT INTO `t_core_notice` VALUES ('de88d25b-7c07-44d3-b2a1-a54480dc2a9e', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 03:27:45', 'chenlong', '2019-07-01 11:27:45', NULL);
INSERT INTO `t_core_notice` VALUES ('e0aa525c-134d-44e0-869b-aa3ae996fb54', '', '审核', '主题案件主题-审核通过', '002001', NULL, '2019-08-02 03:59:27', '', '2019-08-02 11:58:35', NULL);
INSERT INTO `t_core_notice` VALUES ('e1b4bf01-cc70-4fc1-8674-3ae38421b144', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-05 02:50:11', 'chenlong', '2019-07-05 10:50:11', NULL);
INSERT INTO `t_core_notice` VALUES ('eac7c28f-0d23-4e00-a0ff-c85ce63feadb', '', '审核', '主题案件主题-审核通过', '002001', NULL, '2019-08-02 06:34:46', '', '2019-08-02 14:33:54', NULL);
INSERT INTO `t_core_notice` VALUES ('edaf371f-0c1c-477e-9237-fc4a56f36e9f', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-19 09:31:38', '', '2019-07-19 17:31:38', NULL);
INSERT INTO `t_core_notice` VALUES ('ee32fbed-0cf4-4775-862d-98951dd68c0f', 'chenlong', '模型审核', '模型报案人姓名-审核通过', '002001', NULL, '2019-08-05 02:15:52', 'chenlong', '2019-08-05 10:15:52', NULL);
INSERT INTO `t_core_notice` VALUES ('f3591ba3-4b0d-468e-8177-6526a16a1ae9', '', '审核', '标签体系1-审核通过', '002001', NULL, '2019-07-25 03:17:26', '', '2019-07-25 11:17:26', NULL);
INSERT INTO `t_core_notice` VALUES ('f41ce899-8729-4c11-aed4-c9ceb0af2fc1', 'chenlong', '审核', '主题人-审核通过', '002001', NULL, '2019-07-04 03:47:13', 'chenlong', '2019-07-04 11:47:13', NULL);
INSERT INTO `t_core_notice` VALUES ('f6355467-d118-443f-843e-879f057dd00d', 'chenlong', '模型审核', '模型性别标签提取模型-审核通过', '002001', NULL, '2019-07-16 07:23:23', 'chenlong', '2019-07-16 15:23:23', NULL);
INSERT INTO `t_core_notice` VALUES ('f867c186-a9c5-42c3-b80f-23ed340d2b38', 'chenlong', '审核', '标签体系人-审核通过', '002001', NULL, '2019-07-01 02:13:25', 'chenlong', '2019-07-01 02:13:25', NULL);
INSERT INTO `t_core_notice` VALUES ('fa42ad14-008f-437d-a256-8ce83420d194', 'chenlong', '词汇审核', '词汇测试测试-审核通过', '002001', NULL, '2019-06-27 05:46:37', 'chenlong', '2019-06-27 13:46:37', NULL);

-- ----------------------------
-- Table structure for t_core_task_clean
-- ----------------------------
DROP TABLE IF EXISTS `t_core_task_clean`;
CREATE TABLE `t_core_task_clean`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据清洗任务名称',
  `way` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行方式，全量/增量',
  `ctid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题主键',
  `cdid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源id',
  `out_table` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目标表名',
  `field_shines` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '字段映射，json集合',
  `variable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '增量清洗查询条件,json，必须是时间字段',
  `select_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '查询sql语句',
  `status` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据清洗任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_task_clean
-- ----------------------------
INSERT INTO `t_core_task_clean` VALUES ('5962de70-5fc2-4480-ab9c-742be2b94611', '数据清洗', '013001', NULL, 'be78f2c0-a80d-4d88-8b47-440c98647cc2', 'tlpccsx2rlqfua2rmwibcg_main', '[{\"from\":\"ajbh\",\"to\":\"ajbh\"},{\"from\":\"ajmj\",\"to\":\"ajmj\"},{\"from\":\"ajlb\",\"to\":\"ajlb\"},{\"from\":\"ajfab\",\"to\":\"ajfab\"},{\"from\":\"kfxajlb\",\"to\":\"kfxajlb\"},{\"from\":\"ajmc\",\"to\":\"ajmc\"},{\"from\":\"ajzt\",\"to\":\"ajzt\"},{\"from\":\"ajly\",\"to\":\"ajly\"},{\"from\":\"barxm\",\"to\":\"barxm\"},{\"from\":\"barxb\",\"to\":\"barxb\"},{\"from\":\"barzz\",\"to\":\"barzz\"},{\"from\":\"ajbh\",\"to\":\"ajdz\"},{\"from\":\"jlbh\",\"to\":\"jlbh\"}]', NULL, 'select * from t_jw_aj_jbxx', '014003', '', '2019-08-15 15:57:21', '', '2019-08-15 15:57:21', NULL);

-- ----------------------------
-- Table structure for t_core_task_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_core_task_tag`;
CREATE TABLE `t_core_task_tag`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签提取任务名称',
  `cron` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务执行cron表达式，增量执行方式必填',
  `ctid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题id',
  `variable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '标签提取，任务分割点，对应主题数据表中的record_updated_at',
  `status` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据清洗任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_task_tag
-- ----------------------------
INSERT INTO `t_core_task_tag` VALUES ('0885f428-0435-492d-bb13-e14e7499f1bc', '标签提取任务名称', NULL, 'fe34afa7-6a35-4703-aa6f-574065f01b6a', '{\"name\":\"record_updated_at\",\"value\":\"1970-01-01 00:00:00\"}', NULL, '无', '2019-08-05 10:58:04', 'chenlong', '2019-08-05 10:58:04', NULL);
INSERT INTO `t_core_task_tag` VALUES ('27754804-265c-452f-9109-bd7ae01f6100', '提取案件标签任务', '0 20 * * * ?', 'fe34afa7-6a35-4703-aa6f-574065f01b6a', '{\"name\":\"record_updated_at\",\"value\":\"2019-08-05 17:35:33.0\"}', '014002', '无', '2019-08-01 01:42:57', 'chenlong', '2019-08-04 02:09:11', NULL);

-- ----------------------------
-- Table structure for t_core_theme
-- ----------------------------
DROP TABLE IF EXISTS `t_core_theme`;
CREATE TABLE `t_core_theme`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题名称',
  `clsids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '标签体系id集合，多个使用英文半角逗号隔开',
  `structure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主题表结构',
  `status` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_theme
-- ----------------------------
INSERT INTO `t_core_theme` VALUES ('fe34afa7-6a35-4703-aa6f-574065f01b6a', '案件主题', '[\"e5e20066-554a-4087-ab89-68b0ea4dd6cc\"]', '[]', '', '案件主题', '2019-08-02 03:59:22', '', '2019-08-05 02:07:35', 'chenlong');

-- ----------------------------
-- Table structure for t_core_theme_3d_analysis
-- ----------------------------
DROP TABLE IF EXISTS `t_core_theme_3d_analysis`;
CREATE TABLE `t_core_theme_3d_analysis`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三维分析模型名称',
  `ctids` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题id集合，使用英文半角逗号隔开',
  `status` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态，公开状态、不公开状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题三维分析表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_theme_3d_analysis
-- ----------------------------

-- ----------------------------
-- Table structure for t_core_theme_3d_analysis_item
-- ----------------------------
DROP TABLE IF EXISTS `t_core_theme_3d_analysis_item`;
CREATE TABLE `t_core_theme_3d_analysis_item`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '算法名称',
  `inctid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入主题id',
  `cmid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型id',
  `cmpid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型参数表id',
  `outctid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输出主题id',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题三维分析表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_theme_3d_analysis_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_core_theme_3d_analysis_result
-- ----------------------------
DROP TABLE IF EXISTS `t_core_theme_3d_analysis_result`;
CREATE TABLE `t_core_theme_3d_analysis_result`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `ct3dai` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三维模型表项id',
  `in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入参数值',
  `out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输出参数值',
  `status` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态，公开状态、不公开状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题三维分析表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_theme_3d_analysis_result
-- ----------------------------

-- ----------------------------
-- Table structure for t_core_theme_structure
-- ----------------------------
DROP TABLE IF EXISTS `t_core_theme_structure`;
CREATE TABLE `t_core_theme_structure`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `ctid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据结构名称',
  `table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表格字段集合，json',
  `pk` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户设置主键字段',
  `unions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户设置唯一约束字段，多个以逗号隔开',
  `status` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题数据结构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_core_theme_structure
-- ----------------------------
INSERT INTO `t_core_theme_structure` VALUES ('7e51047b-7cab-41e0-82b7-7a4312d68b77', 'fe34afa7-6a35-4703-aa6f-574065f01b6a', 'main', 'tlpccsx2rlqfua2rmwibcg_main', '[{\"name\":\"ajbh\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"ajmj\",\"type\":\"012001\",\"length\":\"2\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"ajlb\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"ajfab\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"kfxajlb\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"ajmc\",\"type\":\"012001\",\"length\":\"80\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"ajzt\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"ajly\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"barxm\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"barxb\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"barzz\",\"type\":\"012001\",\"length\":\"255\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"ajdz\",\"type\":\"012001\",\"length\":\"255\",\"decimalPointDigit\":\"\",\"restrain\":\"\",\"comment\":\"\"},{\"name\":\"jlbh\",\"type\":\"012001\",\"length\":\"32\",\"decimalPointDigit\":\"\",\"restrain\":\"011001\",\"comment\":\"\"}]', 'jlbh', '', NULL, NULL, '2019-08-02 03:59:22', '', '2019-08-05 09:31:40', NULL);

-- ----------------------------
-- Table structure for t_party_login
-- ----------------------------
DROP TABLE IF EXISTS `t_party_login`;
CREATE TABLE `t_party_login`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `puid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键关联t_party_user表',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_party_login
-- ----------------------------
INSERT INTO `t_party_login` VALUES ('1', '1', 'chenlong', '111111', NULL, '2019-06-03 15:42:14', NULL, '2019-06-03 15:42:14', NULL);

-- ----------------------------
-- Table structure for t_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_permission`;
CREATE TABLE `t_sys_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源连接',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级菜单',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` smallint(2) NULL DEFAULT 0 COMMENT '状态,0-启用，1-禁用，2-删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统-权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色代码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `status` smallint(2) NULL DEFAULT NULL COMMENT '状态,0-启用，1-禁用，2-删除',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES (1, NULL, '管理员', NULL, NULL, '2019-06-03 15:40:29', NULL, '2019-06-03 15:40:29', NULL);

-- ----------------------------
-- Table structure for t_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_permission`;
CREATE TABLE `t_sys_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` bigint(20) NULL DEFAULT NULL COMMENT '权限id',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role_permission
-- ----------------------------
INSERT INTO `t_sys_role_permission` VALUES (1, 1, 1, '2019-06-03 15:40:49', NULL, '2019-06-03 15:40:49', NULL);
INSERT INTO `t_sys_role_permission` VALUES (2, 1, 2, '2019-06-17 13:30:35', NULL, '2019-06-17 13:30:35', NULL);
INSERT INTO `t_sys_role_permission` VALUES (3, 1, 3, '2019-06-17 13:30:41', NULL, '2019-06-17 13:30:41', NULL);
INSERT INTO `t_sys_role_permission` VALUES (4, 1, 4, '2019-06-17 13:30:45', NULL, '2019-06-17 13:30:45', NULL);
INSERT INTO `t_sys_role_permission` VALUES (5, 1, 5, '2019-06-17 13:30:49', NULL, '2019-06-17 13:30:49', NULL);
INSERT INTO `t_sys_role_permission` VALUES (6, 1, 6, '2019-06-17 13:30:49', NULL, '2019-06-17 13:30:49', NULL);
INSERT INTO `t_sys_role_permission` VALUES (7, 1, 7, '2019-06-17 13:30:49', NULL, '2019-06-17 13:30:49', NULL);
INSERT INTO `t_sys_role_permission` VALUES (8, 1, 8, '2019-06-17 13:30:49', NULL, '2019-06-17 13:30:49', NULL);
INSERT INTO `t_sys_role_permission` VALUES (9, 1, 9, '2019-06-17 13:30:49', NULL, '2019-06-17 13:30:49', NULL);

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `is_admin` tinyint(1) NULL DEFAULT 0 COMMENT '是否是超级管理员， 0-否，1-是',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除，0-否，1-是',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统-用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (1, 'admin', '123456', 'https://www.baidu.com/img/flexible/logo/pc/result.png', NULL, 1, 0, '2020-07-28 14:08:36', 'admin', '2020-09-29 02:22:08', NULL);

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO `t_sys_user_role` VALUES (1, 1, 1, '2019-06-03 15:40:38', NULL, '2019-06-03 15:40:38', NULL);

-- ----------------------------
-- Table structure for t_temp
-- ----------------------------
DROP TABLE IF EXISTS `t_temp`;
CREATE TABLE `t_temp`  (
  `id` bigint(36) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `status` smallint(2) NULL DEFAULT NULL COMMENT '状态,0-启用，1-禁用，2-删除',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_temp
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
