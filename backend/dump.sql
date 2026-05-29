/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySQL
 Source Server Type    : MySQL
 Source Server Version : 80046
 Source Host           : localhost:3306
 Source Schema         : django_admin_system

 Target Server Type    : MySQL
 Target Server Version : 80046
 File Encoding         : 65001

 Date: 29/05/2026 09:13:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'group' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'permission' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 4, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 4, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 4, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can view session', 4, 'view_session');
INSERT INTO `auth_permission` VALUES (17, 'Can add captcha store', 5, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (18, 'Can change captcha store', 5, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (19, 'Can delete captcha store', 5, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (20, 'Can view captcha store', 5, 'view_captchastore');
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户表', 6, 'add_users');
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户表', 6, 'change_users');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户表', 6, 'delete_users');
INSERT INTO `auth_permission` VALUES (24, 'Can view 用户表', 6, 'view_users');
INSERT INTO `auth_permission` VALUES (25, 'Can add 部门表', 7, 'add_dept');
INSERT INTO `auth_permission` VALUES (26, 'Can change 部门表', 7, 'change_dept');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 部门表', 7, 'delete_dept');
INSERT INTO `auth_permission` VALUES (28, 'Can view 部门表', 7, 'view_dept');
INSERT INTO `auth_permission` VALUES (29, 'Can add 菜单表', 8, 'add_menu');
INSERT INTO `auth_permission` VALUES (30, 'Can change 菜单表', 8, 'change_menu');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 菜单表', 8, 'delete_menu');
INSERT INTO `auth_permission` VALUES (32, 'Can view 菜单表', 8, 'view_menu');
INSERT INTO `auth_permission` VALUES (33, 'Can add 菜单权限表', 9, 'add_menubutton');
INSERT INTO `auth_permission` VALUES (34, 'Can change 菜单权限表', 9, 'change_menubutton');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 菜单权限表', 9, 'delete_menubutton');
INSERT INTO `auth_permission` VALUES (36, 'Can view 菜单权限表', 9, 'view_menubutton');
INSERT INTO `auth_permission` VALUES (37, 'Can add 消息中心', 10, 'add_messagecenter');
INSERT INTO `auth_permission` VALUES (38, 'Can change 消息中心', 10, 'change_messagecenter');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 消息中心', 10, 'delete_messagecenter');
INSERT INTO `auth_permission` VALUES (40, 'Can view 消息中心', 10, 'view_messagecenter');
INSERT INTO `auth_permission` VALUES (41, 'Can add 角色表', 11, 'add_role');
INSERT INTO `auth_permission` VALUES (42, 'Can change 角色表', 11, 'change_role');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 角色表', 11, 'delete_role');
INSERT INTO `auth_permission` VALUES (44, 'Can view 角色表', 11, 'view_role');
INSERT INTO `auth_permission` VALUES (45, 'Can add 角色菜单权限表', 12, 'add_rolemenupermission');
INSERT INTO `auth_permission` VALUES (46, 'Can change 角色菜单权限表', 12, 'change_rolemenupermission');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 角色菜单权限表', 12, 'delete_rolemenupermission');
INSERT INTO `auth_permission` VALUES (48, 'Can view 角色菜单权限表', 12, 'view_rolemenupermission');
INSERT INTO `auth_permission` VALUES (49, 'Can add 角色按钮权限表', 13, 'add_rolemenubuttonpermission');
INSERT INTO `auth_permission` VALUES (50, 'Can change 角色按钮权限表', 13, 'change_rolemenubuttonpermission');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 角色按钮权限表', 13, 'delete_rolemenubuttonpermission');
INSERT INTO `auth_permission` VALUES (52, 'Can view 角色按钮权限表', 13, 'view_rolemenubuttonpermission');
INSERT INTO `auth_permission` VALUES (53, 'Can add 岗位表', 14, 'add_post');
INSERT INTO `auth_permission` VALUES (54, 'Can change 岗位表', 14, 'change_post');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 岗位表', 14, 'delete_post');
INSERT INTO `auth_permission` VALUES (56, 'Can view 岗位表', 14, 'view_post');
INSERT INTO `auth_permission` VALUES (57, 'Can add 操作日志', 15, 'add_operationlog');
INSERT INTO `auth_permission` VALUES (58, 'Can change 操作日志', 15, 'change_operationlog');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 操作日志', 15, 'delete_operationlog');
INSERT INTO `auth_permission` VALUES (60, 'Can view 操作日志', 15, 'view_operationlog');
INSERT INTO `auth_permission` VALUES (61, 'Can add 消息中心目标用户表', 16, 'add_messagecentertargetuser');
INSERT INTO `auth_permission` VALUES (62, 'Can change 消息中心目标用户表', 16, 'change_messagecentertargetuser');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 消息中心目标用户表', 16, 'delete_messagecentertargetuser');
INSERT INTO `auth_permission` VALUES (64, 'Can view 消息中心目标用户表', 16, 'view_messagecentertargetuser');
INSERT INTO `auth_permission` VALUES (65, 'Can add 菜单字段表', 17, 'add_menufield');
INSERT INTO `auth_permission` VALUES (66, 'Can change 菜单字段表', 17, 'change_menufield');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 菜单字段表', 17, 'delete_menufield');
INSERT INTO `auth_permission` VALUES (68, 'Can view 菜单字段表', 17, 'view_menufield');
INSERT INTO `auth_permission` VALUES (69, 'Can add 登录日志', 18, 'add_loginlog');
INSERT INTO `auth_permission` VALUES (70, 'Can change 登录日志', 18, 'change_loginlog');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 登录日志', 18, 'delete_loginlog');
INSERT INTO `auth_permission` VALUES (72, 'Can view 登录日志', 18, 'view_loginlog');
INSERT INTO `auth_permission` VALUES (73, 'Can add 文件管理', 19, 'add_filelist');
INSERT INTO `auth_permission` VALUES (74, 'Can change 文件管理', 19, 'change_filelist');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 文件管理', 19, 'delete_filelist');
INSERT INTO `auth_permission` VALUES (76, 'Can view 文件管理', 19, 'view_filelist');
INSERT INTO `auth_permission` VALUES (77, 'Can add 字段权限表', 20, 'add_fieldpermission');
INSERT INTO `auth_permission` VALUES (78, 'Can change 字段权限表', 20, 'change_fieldpermission');
INSERT INTO `auth_permission` VALUES (79, 'Can delete 字段权限表', 20, 'delete_fieldpermission');
INSERT INTO `auth_permission` VALUES (80, 'Can view 字段权限表', 20, 'view_fieldpermission');
INSERT INTO `auth_permission` VALUES (81, 'Can add 下载中心', 21, 'add_downloadcenter');
INSERT INTO `auth_permission` VALUES (82, 'Can change 下载中心', 21, 'change_downloadcenter');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 下载中心', 21, 'delete_downloadcenter');
INSERT INTO `auth_permission` VALUES (84, 'Can view 下载中心', 21, 'view_downloadcenter');
INSERT INTO `auth_permission` VALUES (85, 'Can add 字典表', 22, 'add_dictionary');
INSERT INTO `auth_permission` VALUES (86, 'Can change 字典表', 22, 'change_dictionary');
INSERT INTO `auth_permission` VALUES (87, 'Can delete 字典表', 22, 'delete_dictionary');
INSERT INTO `auth_permission` VALUES (88, 'Can view 字典表', 22, 'view_dictionary');
INSERT INTO `auth_permission` VALUES (89, 'Can add 地区表', 23, 'add_area');
INSERT INTO `auth_permission` VALUES (90, 'Can change 地区表', 23, 'change_area');
INSERT INTO `auth_permission` VALUES (91, 'Can delete 地区表', 23, 'delete_area');
INSERT INTO `auth_permission` VALUES (92, 'Can view 地区表', 23, 'view_area');
INSERT INTO `auth_permission` VALUES (93, 'Can add 接口白名单', 24, 'add_apiwhitelist');
INSERT INTO `auth_permission` VALUES (94, 'Can change 接口白名单', 24, 'change_apiwhitelist');
INSERT INTO `auth_permission` VALUES (95, 'Can delete 接口白名单', 24, 'delete_apiwhitelist');
INSERT INTO `auth_permission` VALUES (96, 'Can view 接口白名单', 24, 'view_apiwhitelist');
INSERT INTO `auth_permission` VALUES (97, 'Can add 系统配置表', 25, 'add_systemconfig');
INSERT INTO `auth_permission` VALUES (98, 'Can change 系统配置表', 25, 'change_systemconfig');
INSERT INTO `auth_permission` VALUES (99, 'Can delete 系统配置表', 25, 'delete_systemconfig');
INSERT INTO `auth_permission` VALUES (100, 'Can view 系统配置表', 25, 'view_systemconfig');
INSERT INTO `auth_permission` VALUES (101, 'Can add 陪玩用户', 26, 'add_escortuser');
INSERT INTO `auth_permission` VALUES (102, 'Can change 陪玩用户', 26, 'change_escortuser');
INSERT INTO `auth_permission` VALUES (103, 'Can delete 陪玩用户', 26, 'delete_escortuser');
INSERT INTO `auth_permission` VALUES (104, 'Can view 陪玩用户', 26, 'view_escortuser');
INSERT INTO `auth_permission` VALUES (105, 'Can add 陪玩订单', 27, 'add_order');
INSERT INTO `auth_permission` VALUES (106, 'Can change 陪玩订单', 27, 'change_order');
INSERT INTO `auth_permission` VALUES (107, 'Can delete 陪玩订单', 27, 'delete_order');
INSERT INTO `auth_permission` VALUES (108, 'Can view 陪玩订单', 27, 'view_order');
INSERT INTO `auth_permission` VALUES (109, 'Can add 提现申请', 28, 'add_withdrawal');
INSERT INTO `auth_permission` VALUES (110, 'Can change 提现申请', 28, 'change_withdrawal');
INSERT INTO `auth_permission` VALUES (111, 'Can delete 提现申请', 28, 'delete_withdrawal');
INSERT INTO `auth_permission` VALUES (112, 'Can view 提现申请', 28, 'view_withdrawal');
INSERT INTO `auth_permission` VALUES (113, 'Can add 服务分类', 29, 'add_servicecategory');
INSERT INTO `auth_permission` VALUES (114, 'Can change 服务分类', 29, 'change_servicecategory');
INSERT INTO `auth_permission` VALUES (115, 'Can delete 服务分类', 29, 'delete_servicecategory');
INSERT INTO `auth_permission` VALUES (116, 'Can view 服务分类', 29, 'view_servicecategory');
INSERT INTO `auth_permission` VALUES (117, 'Can add 陪玩服务', 30, 'add_service');
INSERT INTO `auth_permission` VALUES (118, 'Can change 陪玩服务', 30, 'change_service');
INSERT INTO `auth_permission` VALUES (119, 'Can delete 陪玩服务', 30, 'delete_service');
INSERT INTO `auth_permission` VALUES (120, 'Can view 陪玩服务', 30, 'view_service');
INSERT INTO `auth_permission` VALUES (121, 'Can add 订单评价', 31, 'add_orderreview');
INSERT INTO `auth_permission` VALUES (122, 'Can change 订单评价', 31, 'change_orderreview');
INSERT INTO `auth_permission` VALUES (123, 'Can delete 订单评价', 31, 'delete_orderreview');
INSERT INTO `auth_permission` VALUES (124, 'Can view 订单评价', 31, 'view_orderreview');
INSERT INTO `auth_permission` VALUES (125, 'Can add 订单打手', 32, 'add_orderhunter');
INSERT INTO `auth_permission` VALUES (126, 'Can change 订单打手', 32, 'change_orderhunter');
INSERT INTO `auth_permission` VALUES (127, 'Can delete 订单打手', 32, 'delete_orderhunter');
INSERT INTO `auth_permission` VALUES (128, 'Can view 订单打手', 32, 'view_orderhunter');
INSERT INTO `auth_permission` VALUES (129, 'Can add 搭子关系', 33, 'add_buddyrelation');
INSERT INTO `auth_permission` VALUES (130, 'Can change 搭子关系', 33, 'change_buddyrelation');
INSERT INTO `auth_permission` VALUES (131, 'Can delete 搭子关系', 33, 'delete_buddyrelation');
INSERT INTO `auth_permission` VALUES (132, 'Can view 搭子关系', 33, 'view_buddyrelation');
INSERT INTO `auth_permission` VALUES (133, 'Can add 商品图片', 34, 'add_serviceimage');
INSERT INTO `auth_permission` VALUES (134, 'Can change 商品图片', 34, 'change_serviceimage');
INSERT INTO `auth_permission` VALUES (135, 'Can delete 商品图片', 34, 'delete_serviceimage');
INSERT INTO `auth_permission` VALUES (136, 'Can view 商品图片', 34, 'view_serviceimage');
INSERT INTO `auth_permission` VALUES (137, 'Can add 订单聊天消息', 35, 'add_chatmessage');
INSERT INTO `auth_permission` VALUES (138, 'Can change 订单聊天消息', 35, 'change_chatmessage');
INSERT INTO `auth_permission` VALUES (139, 'Can delete 订单聊天消息', 35, 'delete_chatmessage');
INSERT INTO `auth_permission` VALUES (140, 'Can view 订单聊天消息', 35, 'view_chatmessage');
INSERT INTO `auth_permission` VALUES (141, 'Can add 退款申请', 36, 'add_refundrequest');
INSERT INTO `auth_permission` VALUES (142, 'Can change 退款申请', 36, 'change_refundrequest');
INSERT INTO `auth_permission` VALUES (143, 'Can delete 退款申请', 36, 'delete_refundrequest');
INSERT INTO `auth_permission` VALUES (144, 'Can view 退款申请', 36, 'view_refundrequest');
INSERT INTO `auth_permission` VALUES (145, 'Can add crontab', 37, 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES (146, 'Can change crontab', 37, 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES (147, 'Can delete crontab', 37, 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES (148, 'Can view crontab', 37, 'view_crontabschedule');
INSERT INTO `auth_permission` VALUES (149, 'Can add interval', 38, 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES (150, 'Can change interval', 38, 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES (151, 'Can delete interval', 38, 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES (152, 'Can view interval', 38, 'view_intervalschedule');
INSERT INTO `auth_permission` VALUES (153, 'Can add periodic task', 39, 'add_periodictask');
INSERT INTO `auth_permission` VALUES (154, 'Can change periodic task', 39, 'change_periodictask');
INSERT INTO `auth_permission` VALUES (155, 'Can delete periodic task', 39, 'delete_periodictask');
INSERT INTO `auth_permission` VALUES (156, 'Can view periodic task', 39, 'view_periodictask');
INSERT INTO `auth_permission` VALUES (157, 'Can add periodic task track', 40, 'add_periodictasks');
INSERT INTO `auth_permission` VALUES (158, 'Can change periodic task track', 40, 'change_periodictasks');
INSERT INTO `auth_permission` VALUES (159, 'Can delete periodic task track', 40, 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES (160, 'Can view periodic task track', 40, 'view_periodictasks');
INSERT INTO `auth_permission` VALUES (161, 'Can add solar event', 41, 'add_solarschedule');
INSERT INTO `auth_permission` VALUES (162, 'Can change solar event', 41, 'change_solarschedule');
INSERT INTO `auth_permission` VALUES (163, 'Can delete solar event', 41, 'delete_solarschedule');
INSERT INTO `auth_permission` VALUES (164, 'Can view solar event', 41, 'view_solarschedule');
INSERT INTO `auth_permission` VALUES (165, 'Can add clocked', 42, 'add_clockedschedule');
INSERT INTO `auth_permission` VALUES (166, 'Can change clocked', 42, 'change_clockedschedule');
INSERT INTO `auth_permission` VALUES (167, 'Can delete clocked', 42, 'delete_clockedschedule');
INSERT INTO `auth_permission` VALUES (168, 'Can view clocked', 42, 'view_clockedschedule');
INSERT INTO `auth_permission` VALUES (169, 'Can add chord counter', 43, 'add_chordcounter');
INSERT INTO `auth_permission` VALUES (170, 'Can change chord counter', 43, 'change_chordcounter');
INSERT INTO `auth_permission` VALUES (171, 'Can delete chord counter', 43, 'delete_chordcounter');
INSERT INTO `auth_permission` VALUES (172, 'Can view chord counter', 43, 'view_chordcounter');
INSERT INTO `auth_permission` VALUES (173, 'Can add task result', 44, 'add_taskresult');
INSERT INTO `auth_permission` VALUES (174, 'Can change task result', 44, 'change_taskresult');
INSERT INTO `auth_permission` VALUES (175, 'Can delete task result', 44, 'delete_taskresult');
INSERT INTO `auth_permission` VALUES (176, 'Can view task result', 44, 'view_taskresult');
INSERT INTO `auth_permission` VALUES (177, 'Can add group result', 45, 'add_groupresult');
INSERT INTO `auth_permission` VALUES (178, 'Can change group result', 45, 'change_groupresult');
INSERT INTO `auth_permission` VALUES (179, 'Can delete group result', 45, 'delete_groupresult');
INSERT INTO `auth_permission` VALUES (180, 'Can view group result', 45, 'view_groupresult');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'captcha store' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_beat_clockedschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
CREATE TABLE `django_celery_beat_clockedschedule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL COMMENT 'Run the task at clocked time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'clocked' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_beat_clockedschedule
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_beat_crontabschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
CREATE TABLE `django_celery_beat_crontabschedule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Cron Minutes to Run. Use \"*\" for \"all\". (Example: \"0,30\")',
  `hour` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Cron Hours to Run. Use \"*\" for \"all\". (Example: \"8,20\")',
  `day_of_week` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Cron Days Of The Week to Run. Use \"*\" for \"all\", Sunday is 0 or 7, Monday is 1. (Example: \"0,5\")',
  `day_of_month` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Cron Days Of The Month to Run. Use \"*\" for \"all\". (Example: \"1,15\")',
  `month_of_year` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Cron Months (1-12) Of The Year to Run. Use \"*\" for \"all\". (Example: \"1,12\")',
  `timezone` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Timezone to Run the Cron Schedule on. Default is UTC.',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'crontab' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_beat_crontabschedule
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_beat_intervalschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
CREATE TABLE `django_celery_beat_intervalschedule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL COMMENT 'Number of interval periods to wait before running the task again',
  `period` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of period between task runs (Example: days)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'interval' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_beat_intervalschedule
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_beat_periodictask
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
CREATE TABLE `django_celery_beat_periodictask`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Short Description For This Task',
  `task` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The Name of the Celery Task that Should be Run.  (Example: \"proj.tasks.import_contacts\")',
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded positional arguments (Example: [\"arg1\", \"arg2\"])',
  `kwargs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded keyword arguments (Example: {\"argument\": \"value\"})',
  `queue` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Queue defined in CELERY_TASK_QUEUES. Leave None for default queuing.',
  `exchange` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Override Exchange for low-level AMQP routing',
  `routing_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Override Routing Key for low-level AMQP routing',
  `expires` datetime(6) NULL DEFAULT NULL COMMENT 'Datetime after which the schedule will no longer trigger the task to run',
  `enabled` tinyint(1) NOT NULL COMMENT 'Set to False to disable the schedule',
  `last_run_at` datetime(6) NULL DEFAULT NULL COMMENT 'Datetime that the schedule last triggered the task to run. Reset to None if enabled is set to False.',
  `total_run_count` int UNSIGNED NOT NULL COMMENT 'Running count of how many times the schedule has triggered the task',
  `date_changed` datetime(6) NOT NULL COMMENT 'Datetime that this PeriodicTask was last modified',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Detailed description about the details of this Periodic Task',
  `crontab_id` int NULL DEFAULT NULL COMMENT 'Crontab Schedule to run the task on.  Set only one schedule type, leave the others null.',
  `interval_id` int NULL DEFAULT NULL COMMENT 'Interval Schedule to run the task on.  Set only one schedule type, leave the others null.',
  `solar_id` int NULL DEFAULT NULL COMMENT 'Solar Schedule to run the task on.  Set only one schedule type, leave the others null.',
  `one_off` tinyint(1) NOT NULL COMMENT 'If True, the schedule will only run the task a single time',
  `start_time` datetime(6) NULL DEFAULT NULL COMMENT 'Datetime when the schedule should begin triggering the task to run',
  `priority` int UNSIGNED NULL DEFAULT NULL COMMENT 'Priority Number between 0 and 255. Supported by: RabbitMQ, Redis (priority reversed, 0 is highest).',
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded message headers for the AMQP message.',
  `clocked_id` int NULL DEFAULT NULL COMMENT 'Clocked Schedule to run the task on.  Set only one schedule type, leave the others null.',
  `expire_seconds` int UNSIGNED NULL DEFAULT NULL COMMENT 'Timedelta with seconds which the schedule will no longer trigger the task to run',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  INDEX `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce`(`crontab_id` ASC) USING BTREE,
  INDEX `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce`(`interval_id` ASC) USING BTREE,
  INDEX `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce`(`solar_id` ASC) USING BTREE,
  INDEX `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce`(`clocked_id` ASC) USING BTREE,
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK (`total_run_count` >= 0),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK (`priority` >= 0),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK (`expire_seconds` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'periodic task' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_beat_periodictask
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_beat_periodictasks
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
CREATE TABLE `django_celery_beat_periodictasks`  (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'periodic task track' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_beat_periodictasks
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_beat_solarschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
CREATE TABLE `django_celery_beat_solarschedule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of solar event when the job should run',
  `latitude` decimal(9, 6) NOT NULL COMMENT 'Run the task when the event happens at this latitude',
  `longitude` decimal(9, 6) NOT NULL COMMENT 'Run the task when the event happens at this longitude',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq`(`event` ASC, `latitude` ASC, `longitude` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'solar event' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_beat_solarschedule
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_results_chordcounter
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_results_chordcounter`;
CREATE TABLE `django_celery_results_chordcounter`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Celery ID for the Chord header group',
  `sub_tasks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON serialized list of task result tuples. use .group_result() to decode',
  `count` int UNSIGNED NOT NULL COMMENT 'Starts at len(chord header) and decrements after each task is finished',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `django_celery_results_chordcounter_chk_1` CHECK (`count` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'chord counter' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_results_chordcounter
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_results_groupresult
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_results_groupresult`;
CREATE TABLE `django_celery_results_groupresult`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Celery ID for the Group that was run',
  `date_created` datetime(6) NOT NULL COMMENT 'Datetime field when the group result was created in UTC',
  `date_done` datetime(6) NOT NULL COMMENT 'Datetime field when the group was completed in UTC',
  `content_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Content type of the result data',
  `content_encoding` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The encoding used to save the task result data',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'The data returned by the task.  Use content_encoding and content_type fields to read.',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id` ASC) USING BTREE,
  INDEX `django_cele_date_cr_bd6c1d_idx`(`date_created` ASC) USING BTREE,
  INDEX `django_cele_date_do_caae0e_idx`(`date_done` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'group result' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_results_groupresult
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_results_taskresult
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_results_taskresult`;
CREATE TABLE `django_celery_results_taskresult`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Celery ID for the Task that was run',
  `periodic_task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Name of the Periodic Task which was run',
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Name of the Task which was run',
  `task_args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'JSON representation of the positional arguments used with the task',
  `task_kwargs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'JSON representation of the named arguments used with the task',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Current state of the task being run',
  `worker` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Worker that executes the task',
  `content_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Content type of the result data',
  `content_encoding` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The encoding used to save the task result data',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'The data returned by the task.  Use content_encoding and content_type fields to read.',
  `date_created` datetime(6) NOT NULL COMMENT 'Datetime field when the task result was created in UTC',
  `date_done` datetime(6) NOT NULL COMMENT 'Datetime field when the task was completed in UTC',
  `traceback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'Text of the traceback if the task generated one',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'JSON meta information about the task, such as information on child tasks',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_id`(`task_id` ASC) USING BTREE,
  INDEX `django_cele_task_na_08aec9_idx`(`task_name` ASC) USING BTREE,
  INDEX `django_cele_status_9b6201_idx`(`status` ASC) USING BTREE,
  INDEX `django_cele_worker_d54dd8_idx`(`worker` ASC) USING BTREE,
  INDEX `django_cele_date_cr_f04a50_idx`(`date_created` ASC) USING BTREE,
  INDEX `django_cele_date_do_f59aad_idx`(`date_done` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'task result' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_celery_results_taskresult
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'content type' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (5, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (42, 'django_celery_beat', 'clockedschedule');
INSERT INTO `django_content_type` VALUES (37, 'django_celery_beat', 'crontabschedule');
INSERT INTO `django_content_type` VALUES (38, 'django_celery_beat', 'intervalschedule');
INSERT INTO `django_content_type` VALUES (39, 'django_celery_beat', 'periodictask');
INSERT INTO `django_content_type` VALUES (40, 'django_celery_beat', 'periodictasks');
INSERT INTO `django_content_type` VALUES (41, 'django_celery_beat', 'solarschedule');
INSERT INTO `django_content_type` VALUES (43, 'django_celery_results', 'chordcounter');
INSERT INTO `django_content_type` VALUES (45, 'django_celery_results', 'groupresult');
INSERT INTO `django_content_type` VALUES (44, 'django_celery_results', 'taskresult');
INSERT INTO `django_content_type` VALUES (33, 'escort', 'buddyrelation');
INSERT INTO `django_content_type` VALUES (35, 'escort', 'chatmessage');
INSERT INTO `django_content_type` VALUES (26, 'escort', 'escortuser');
INSERT INTO `django_content_type` VALUES (27, 'escort', 'order');
INSERT INTO `django_content_type` VALUES (32, 'escort', 'orderhunter');
INSERT INTO `django_content_type` VALUES (31, 'escort', 'orderreview');
INSERT INTO `django_content_type` VALUES (36, 'escort', 'refundrequest');
INSERT INTO `django_content_type` VALUES (30, 'escort', 'service');
INSERT INTO `django_content_type` VALUES (29, 'escort', 'servicecategory');
INSERT INTO `django_content_type` VALUES (34, 'escort', 'serviceimage');
INSERT INTO `django_content_type` VALUES (28, 'escort', 'withdrawal');
INSERT INTO `django_content_type` VALUES (4, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (24, 'system', 'apiwhitelist');
INSERT INTO `django_content_type` VALUES (23, 'system', 'area');
INSERT INTO `django_content_type` VALUES (7, 'system', 'dept');
INSERT INTO `django_content_type` VALUES (22, 'system', 'dictionary');
INSERT INTO `django_content_type` VALUES (21, 'system', 'downloadcenter');
INSERT INTO `django_content_type` VALUES (20, 'system', 'fieldpermission');
INSERT INTO `django_content_type` VALUES (19, 'system', 'filelist');
INSERT INTO `django_content_type` VALUES (18, 'system', 'loginlog');
INSERT INTO `django_content_type` VALUES (8, 'system', 'menu');
INSERT INTO `django_content_type` VALUES (9, 'system', 'menubutton');
INSERT INTO `django_content_type` VALUES (17, 'system', 'menufield');
INSERT INTO `django_content_type` VALUES (10, 'system', 'messagecenter');
INSERT INTO `django_content_type` VALUES (16, 'system', 'messagecentertargetuser');
INSERT INTO `django_content_type` VALUES (15, 'system', 'operationlog');
INSERT INTO `django_content_type` VALUES (14, 'system', 'post');
INSERT INTO `django_content_type` VALUES (11, 'system', 'role');
INSERT INTO `django_content_type` VALUES (13, 'system', 'rolemenubuttonpermission');
INSERT INTO `django_content_type` VALUES (12, 'system', 'rolemenupermission');
INSERT INTO `django_content_type` VALUES (25, 'system', 'systemconfig');
INSERT INTO `django_content_type` VALUES (6, 'system', 'users');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2026-05-25 09:37:13.543935');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2026-05-25 09:37:13.734540');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2026-05-25 09:37:14.324639');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2026-05-25 09:37:14.480795');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2026-05-25 09:37:14.500504');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2026-05-25 09:37:14.517678');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2026-05-25 09:37:14.533678');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2026-05-25 09:37:14.549681');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2026-05-25 09:37:14.562678');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2026-05-25 09:37:14.578688');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2026-05-25 09:37:14.590678');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2026-05-25 09:37:14.614684');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2026-05-25 09:37:14.629679');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2026-05-25 09:37:14.644685');
INSERT INTO `django_migrations` VALUES (15, 'captcha', '0001_initial', '2026-05-25 09:37:14.763381');
INSERT INTO `django_migrations` VALUES (16, 'django_celery_beat', '0001_initial', '2026-05-25 09:37:15.255791');
INSERT INTO `django_migrations` VALUES (17, 'django_celery_beat', '0002_auto_20161118_0346', '2026-05-25 09:37:15.459938');
INSERT INTO `django_migrations` VALUES (18, 'django_celery_beat', '0003_auto_20161209_0049', '2026-05-25 09:37:15.510047');
INSERT INTO `django_migrations` VALUES (19, 'django_celery_beat', '0004_auto_20170221_0000', '2026-05-25 09:37:15.518053');
INSERT INTO `django_migrations` VALUES (20, 'django_celery_beat', '0005_add_solarschedule_events_choices', '2026-05-25 09:37:15.527051');
INSERT INTO `django_migrations` VALUES (21, 'django_celery_beat', '0006_auto_20180322_0932', '2026-05-25 09:37:15.681326');
INSERT INTO `django_migrations` VALUES (22, 'django_celery_beat', '0007_auto_20180521_0826', '2026-05-25 09:37:15.951185');
INSERT INTO `django_migrations` VALUES (23, 'django_celery_beat', '0008_auto_20180914_1922', '2026-05-25 09:37:15.970192');
INSERT INTO `django_migrations` VALUES (24, 'django_celery_beat', '0006_auto_20180210_1226', '2026-05-25 09:37:15.986193');
INSERT INTO `django_migrations` VALUES (25, 'django_celery_beat', '0006_periodictask_priority', '2026-05-25 09:37:16.139825');
INSERT INTO `django_migrations` VALUES (26, 'django_celery_beat', '0009_periodictask_headers', '2026-05-25 09:37:16.292811');
INSERT INTO `django_migrations` VALUES (27, 'django_celery_beat', '0010_auto_20190429_0326', '2026-05-25 09:37:16.376741');
INSERT INTO `django_migrations` VALUES (28, 'django_celery_beat', '0011_auto_20190508_0153', '2026-05-25 09:37:16.600680');
INSERT INTO `django_migrations` VALUES (29, 'django_celery_beat', '0012_periodictask_expire_seconds', '2026-05-25 09:37:16.759699');
INSERT INTO `django_migrations` VALUES (30, 'django_celery_beat', '0013_auto_20200609_0727', '2026-05-25 09:37:16.771699');
INSERT INTO `django_migrations` VALUES (31, 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2026-05-25 09:37:16.857472');
INSERT INTO `django_migrations` VALUES (32, 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2026-05-25 09:37:16.867980');
INSERT INTO `django_migrations` VALUES (33, 'django_celery_beat', '0016_alter_crontabschedule_timezone', '2026-05-25 09:37:16.882495');
INSERT INTO `django_migrations` VALUES (34, 'django_celery_beat', '0017_alter_crontabschedule_month_of_year', '2026-05-25 09:37:16.897496');
INSERT INTO `django_migrations` VALUES (35, 'django_celery_beat', '0018_improve_crontab_helptext', '2026-05-25 09:37:16.908922');
INSERT INTO `django_migrations` VALUES (36, 'django_celery_beat', '0019_alter_periodictasks_options', '2026-05-25 09:37:16.918038');
INSERT INTO `django_migrations` VALUES (37, 'django_celery_results', '0001_initial', '2026-05-25 09:37:17.347915');
INSERT INTO `django_migrations` VALUES (38, 'system', '0001_initial', '2026-05-25 09:37:21.536741');
INSERT INTO `django_migrations` VALUES (39, 'escort', '0001_initial', '2026-05-25 09:37:23.801994');
INSERT INTO `django_migrations` VALUES (40, 'escort', '0002_servicecategory_image_alter_servicecategory_icon', '2026-05-25 09:37:23.935400');
INSERT INTO `django_migrations` VALUES (41, 'escort', '0003_alter_servicecategory_image', '2026-05-25 09:37:23.975595');
INSERT INTO `django_migrations` VALUES (42, 'escort', '0004_serviceimage', '2026-05-25 09:37:24.202778');
INSERT INTO `django_migrations` VALUES (43, 'escort', '0005_order_out_trade_no', '2026-05-25 09:37:24.396334');
INSERT INTO `django_migrations` VALUES (44, 'escort', '0007_add_cancel_fields', '2026-05-25 09:37:24.719742');
INSERT INTO `django_migrations` VALUES (45, 'escort', '0008_add_id_card_images', '2026-05-25 09:37:25.058680');
INSERT INTO `django_migrations` VALUES (46, 'escort', '0009_add_buddy_status', '2026-05-25 09:37:25.205861');
INSERT INTO `django_migrations` VALUES (47, 'escort', '0010_add_chat_message', '2026-05-25 09:37:25.564279');
INSERT INTO `django_migrations` VALUES (48, 'escort', '0011_add_refund_status_and_model', '2026-05-25 09:37:25.960964');
INSERT INTO `django_migrations` VALUES (49, 'escort', '0012_add_refund_previous_order_status', '2026-05-25 09:37:26.088785');
INSERT INTO `django_migrations` VALUES (50, 'escort', '0013_add_escort_user_invite_code', '2026-05-25 09:37:26.230487');
INSERT INTO `django_migrations` VALUES (51, 'escort', '0014_add_wx_auth_authorized', '2026-05-25 09:37:26.382182');
INSERT INTO `django_migrations` VALUES (52, 'sessions', '0001_initial', '2026-05-25 09:37:26.465546');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'session' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_api_white_list
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_api_white_list`;
CREATE TABLE `dvadmin_api_white_list`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'url地址',
  `method` int NULL DEFAULT NULL COMMENT '接口请求方法',
  `enable_datasource` tinyint(1) NOT NULL COMMENT '激活数据权限',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_api_white_list_creator_id_fd335789`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '接口白名单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_api_white_list
-- ----------------------------
INSERT INTO `dvadmin_api_white_list` VALUES (1, NULL, '1', NULL, '2026-05-25 09:42:36.828956', '2026-04-02 11:54:45.104000', '/api/system/dept_lazy_tree/', 0, 1, NULL);

-- ----------------------------
-- Table structure for dvadmin_download_center
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_download_center`;
CREATE TABLE `dvadmin_download_center`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_status` smallint NOT NULL COMMENT '是否可下载',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` bigint NOT NULL COMMENT '文件大小',
  `md5sum` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_download_center_creator_id_4a0a9256`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '下载中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_download_center
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_escort_buddy_relation
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_buddy_relation`;
CREATE TABLE `dvadmin_escort_buddy_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `user_a_id` bigint NOT NULL COMMENT '搭子关系中的用户A',
  `user_b_id` bigint NOT NULL COMMENT '搭子关系中的用户B',
  `status` int NOT NULL COMMENT '搭子关系状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_escort_buddy_relation_user_a_id_user_b_id_298a3586_uniq`(`user_a_id` ASC, `user_b_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_buddy_user_b_id_67ac8710_fk_dvadmin_e`(`user_b_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_buddy_relation_creator_id_4ee3d00c`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_buddy_user_a_id_10992d37_fk_dvadmin_e` FOREIGN KEY (`user_a_id`) REFERENCES `dvadmin_escort_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dvadmin_escort_buddy_user_b_id_67ac8710_fk_dvadmin_e` FOREIGN KEY (`user_b_id`) REFERENCES `dvadmin_escort_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '搭子关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_buddy_relation
-- ----------------------------
INSERT INTO `dvadmin_escort_buddy_relation` VALUES (1, NULL, NULL, NULL, '2026-05-25 09:42:37.474317', '2026-05-25 09:42:37.474317', NULL, 8, 6, 1);

-- ----------------------------
-- Table structure for dvadmin_escort_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_chat_message`;
CREATE TABLE `dvadmin_escort_chat_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `sender_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'customer=客户, hunter=打手, system=系统',
  `message_type` int NOT NULL COMMENT '文本/系统/图片',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片消息URL',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `order_id` bigint NOT NULL COMMENT '所属订单',
  `sender_id` bigint NOT NULL COMMENT '消息发送者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_escort_chat__order_id_a0a5c194_fk_dvadmin_e`(`order_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_chat__sender_id_bdaab894_fk_dvadmin_e`(`sender_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_chat_message_creator_id_fccfb4d7`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_chat__order_id_a0a5c194_fk_dvadmin_e` FOREIGN KEY (`order_id`) REFERENCES `dvadmin_escort_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dvadmin_escort_chat__sender_id_bdaab894_fk_dvadmin_e` FOREIGN KEY (`sender_id`) REFERENCES `dvadmin_escort_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单聊天消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_chat_message
-- ----------------------------
INSERT INTO `dvadmin_escort_chat_message` VALUES (1, '', '', '', '2026-05-25 09:42:37.483328', '2026-05-25 09:42:37.483328', 'customer', 1, '312312', NULL, NULL, 15, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (2, '', '', '', '2026-05-25 09:42:37.493313', '2026-05-25 09:42:37.493313', 'customer', 1, '32131232', NULL, NULL, 15, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (3, '', '', '', '2026-05-25 09:42:37.502442', '2026-05-25 09:42:37.502442', 'hunter', 1, '老板在吗', NULL, NULL, 16, 8);
INSERT INTO `dvadmin_escort_chat_message` VALUES (4, '', '', '', '2026-05-25 09:42:37.511943', '2026-05-25 09:42:37.511943', 'customer', 1, '在的。啥时候可以上号呀', NULL, NULL, 16, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (5, '', '', '', '2026-05-25 09:42:37.521017', '2026-05-25 09:42:37.521017', 'customer', 1, '在码', NULL, NULL, 16, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (6, '', '', '', '2026-05-25 09:42:37.530944', '2026-05-25 09:42:37.530944', 'hunter', 1, '在的老板', NULL, NULL, 16, 8);
INSERT INTO `dvadmin_escort_chat_message` VALUES (7, '', '', '', '2026-05-25 09:42:37.538949', '2026-05-25 09:42:37.538949', 'customer', 1, '好的', NULL, NULL, 16, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (8, '', '', '', '2026-05-25 09:42:37.546952', '2026-05-25 09:42:37.546952', 'hunter', 1, '老板把游戏账号发给我一下', NULL, NULL, 16, 8);
INSERT INTO `dvadmin_escort_chat_message` VALUES (9, '', '', '', '2026-05-25 09:42:37.553948', '2026-05-25 09:42:37.553948', 'customer', 1, '974614985', NULL, NULL, 16, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (10, '', '', '', '2026-05-25 09:42:37.562948', '2026-05-25 09:42:37.562948', 'hunter', 1, '收到', NULL, NULL, 16, 8);
INSERT INTO `dvadmin_escort_chat_message` VALUES (11, '', '', '', '2026-05-25 09:42:37.570952', '2026-05-25 09:42:37.570952', 'customer', 1, '312312', NULL, NULL, 16, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (12, '', '', '', '2026-05-25 09:42:37.578949', '2026-05-25 09:42:37.578949', 'customer', 1, '312312312', NULL, NULL, 16, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (13, '', '', '', '2026-05-25 09:42:37.588943', '2026-05-25 09:42:37.588943', 'customer', 1, '55555555', NULL, NULL, 16, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (14, '', '', '', '2026-05-25 09:42:37.598949', '2026-05-25 09:42:37.598949', 'hunter', 1, '打完了老板，麻烦点个确定收货呀', NULL, NULL, 16, 8);
INSERT INTO `dvadmin_escort_chat_message` VALUES (15, '', '', '', '2026-05-25 09:42:37.606941', '2026-05-25 09:42:37.606941', 'customer', 1, '好的好的', NULL, NULL, 16, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (16, '', '', '', '2026-05-25 09:42:37.615050', '2026-05-25 09:42:37.615050', 'customer', 1, '我是打手一号', NULL, NULL, 20, 6);
INSERT INTO `dvadmin_escort_chat_message` VALUES (17, '', '', '', '2026-05-25 09:42:37.624047', '2026-05-25 09:42:37.624047', 'hunter', 1, '我是打手二号', NULL, NULL, 20, 8);
INSERT INTO `dvadmin_escort_chat_message` VALUES (18, '', '', '', '2026-05-25 09:42:37.631951', '2026-05-25 09:42:37.631951', 'customer', 1, '我是老板', NULL, NULL, 20, 6);

-- ----------------------------
-- Table structure for dvadmin_escort_order
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_order`;
CREATE TABLE `dvadmin_escort_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单唯一编号',
  `status` int NOT NULL COMMENT '订单当前状态',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `platform_fee` decimal(10, 2) NOT NULL COMMENT '平台抽成金额',
  `hunter_share` decimal(10, 2) NOT NULL COMMENT '打手分成金额',
  `game_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户游戏账号',
  `game_server` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏服务器',
  `game_mode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏模式',
  `special_requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '客户的特殊要求',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付完成时间',
  `accept_time` datetime(6) NULL DEFAULT NULL COMMENT '打手接单时间',
  `service_start_time` datetime(6) NULL DEFAULT NULL COMMENT '服务开始时间',
  `service_end_time` datetime(6) NULL DEFAULT NULL COMMENT '服务结束时间',
  `complete_time` datetime(6) NULL DEFAULT NULL COMMENT '订单完成时间',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `customer_id` bigint NOT NULL COMMENT '下单客户',
  `service_id` bigint NOT NULL COMMENT '购买的服务',
  `out_trade_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信支付统一下单返回的商户订单号（out_trade_no）',
  `cancel_reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '取消原因：user=用户取消, timeout=超时自动取消',
  `cancel_time` datetime(6) NULL DEFAULT NULL COMMENT '订单取消时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no` ASC) USING BTREE,
  INDEX `dvadmin_escort_order_service_id_b050a1c6_fk_dvadmin_e`(`service_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_order_customer_id_7e733022_fk_dvadmin_e`(`customer_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_order_creator_id_c006404a`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_order_out_trade_no_ca7aaa9f`(`out_trade_no` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_order_customer_id_7e733022_fk_dvadmin_e` FOREIGN KEY (`customer_id`) REFERENCES `dvadmin_escort_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dvadmin_escort_order_service_id_b050a1c6_fk_dvadmin_e` FOREIGN KEY (`service_id`) REFERENCES `dvadmin_escort_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '陪玩订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_order
-- ----------------------------
INSERT INTO `dvadmin_escort_order` VALUES (6, NULL, NULL, NULL, '2026-05-25 09:42:37.249676', '2026-05-25 09:42:37.249676', '', 8, 0.01, 0.00, 0.00, '321', '321', '312', '231312', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, NULL, 'timeout', '2026-05-05 17:27:14.082000');
INSERT INTO `dvadmin_escort_order` VALUES (7, NULL, NULL, NULL, '2026-05-25 09:42:37.257676', '2026-05-25 09:42:37.257676', 'EP8F560E821780', 8, 0.01, 0.00, 0.00, '321322', '2132132', '31232', '21312', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, NULL, 'timeout', '2026-05-05 17:35:14.884000');
INSERT INTO `dvadmin_escort_order` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:37.265678', '2026-05-25 09:42:37.265678', 'EPFDF2DE0F131E', 8, 0.01, 0.00, 0.00, '321312', '231321', '313211', '13123', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, NULL, 'timeout', '2026-05-05 17:35:14.873000');
INSERT INTO `dvadmin_escort_order` VALUES (9, NULL, NULL, NULL, '2026-05-25 09:42:37.278680', '2026-05-25 09:42:37.278680', 'EP70F43ABC1569', 8, 0.01, 0.00, 0.00, '321321', '3213123', '231312', '32131321', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'EP70F43ABC15691777960942', 'timeout', '2026-05-05 17:35:14.862000');
INSERT INTO `dvadmin_escort_order` VALUES (10, NULL, NULL, NULL, '2026-05-25 09:42:37.290679', '2026-05-25 09:42:37.290679', 'EP858C3A16CC89', 8, 0.01, 0.00, 0.00, '32112', '2313', '321312', '312321', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'EP858C3A16CC891777961783', 'timeout', '2026-05-05 17:35:14.849000');
INSERT INTO `dvadmin_escort_order` VALUES (11, NULL, NULL, NULL, '2026-05-25 09:42:37.302677', '2026-05-25 09:42:37.302677', 'EPDD2829456568', 8, 0.01, 0.00, 0.00, '321', '321321', '213312', '321312312', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'EPDD28294565681777962630', 'timeout', '2026-05-05 17:35:14.838000');
INSERT INTO `dvadmin_escort_order` VALUES (12, NULL, NULL, NULL, '2026-05-25 09:42:37.316678', '2026-05-25 09:42:37.316678', 'EP40C8959F96B6', 8, 0.01, 0.00, 0.00, '321321', '321312', '3123123', '31232', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'EP40C8959F96B61777963017', 'timeout', '2026-05-05 17:35:14.827000');
INSERT INTO `dvadmin_escort_order` VALUES (13, NULL, NULL, NULL, '2026-05-25 09:42:37.328677', '2026-05-25 09:42:37.328677', 'EPE0AB41CA3403', 8, 0.01, 0.00, 0.00, '312312', '3213123', '312312312', '123123123', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'EPE0AB41CA34031777963294', 'timeout', '2026-05-05 17:35:14.816000');
INSERT INTO `dvadmin_escort_order` VALUES (14, NULL, NULL, NULL, '2026-05-25 09:42:37.341678', '2026-05-25 09:42:37.341678', 'EP21B579FEE0CF', 8, 0.01, 0.00, 0.00, '312', '312', '312312', '3211312', NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'EP21B579FEE0CF1777963662', 'timeout', '2026-05-05 17:35:14.805000');
INSERT INTO `dvadmin_escort_order` VALUES (15, NULL, NULL, NULL, '2026-05-25 09:42:37.354680', '2026-05-25 09:42:37.354680', 'EP44CF56FC6C66', 4, 0.01, 0.00, 0.00, '213', '321312', '213123', '23123123', '2026-05-05 14:51:40.720000', '2026-05-08 14:27:48.250000', '2026-05-08 14:27:48.250000', NULL, NULL, NULL, 6, 14, 'EP44CF56FC6C661777963870', NULL, NULL);
INSERT INTO `dvadmin_escort_order` VALUES (16, NULL, NULL, NULL, '2026-05-25 09:42:37.366677', '2026-05-25 09:42:37.366677', 'EP97CF9FEC729A', 6, 0.01, 0.00, 0.00, 'xzpxzp', '2121', '跑刀', '无特殊要求', '2026-05-12 13:41:21.295000', '2026-05-12 13:43:34.151000', '2026-05-12 13:43:34.151000', '2026-05-18 10:45:23.467000', '2026-05-18 10:46:06.326000', NULL, 6, 14, 'EP97CF9FEC729A1778564460', NULL, NULL);
INSERT INTO `dvadmin_escort_order` VALUES (17, NULL, NULL, NULL, '2026-05-25 09:42:37.378676', '2026-05-25 09:42:37.378676', 'EP1B744EE7000A', 10, 0.10, 0.00, 0.00, '测试0.1元', 'test', '无', '321321312', '2026-05-18 11:08:58.723000', NULL, NULL, NULL, NULL, NULL, 6, 14, 'EP1B744EE7000A1779073715', NULL, NULL);
INSERT INTO `dvadmin_escort_order` VALUES (18, NULL, NULL, NULL, '2026-05-25 10:17:05.532761', '2026-05-25 09:42:37.389677', 'EPCB33D1627013', 10, 0.10, 0.00, 0.00, 'xzp', '手游', '代练', '猛猛干！', '2026-05-18 16:28:45.840000', NULL, NULL, NULL, NULL, NULL, 6, 14, 'EPCB33D16270131779092905', NULL, NULL);
INSERT INTO `dvadmin_escort_order` VALUES (19, NULL, NULL, NULL, '2026-05-25 09:42:37.401677', '2026-05-25 09:42:37.401677', 'EP5C653CCA40B3', 10, 0.10, 0.02, 0.08, '测试22', '2121', '2121', '2122222', '2026-05-18 17:49:35.108000', '2026-05-18 17:50:02.904000', '2026-05-18 17:50:02.904000', NULL, NULL, NULL, 6, 14, 'EP5C653CCA40B31779097751', NULL, NULL);
INSERT INTO `dvadmin_escort_order` VALUES (20, NULL, NULL, NULL, '2026-05-25 09:42:37.408676', '2026-05-25 09:42:37.408676', 'EPA90BCE0A9A1F', 6, 0.20, 0.03, 0.17, '测试输入账号', 'pc端', '绝密航天', '必须欧美！', '2026-05-20 15:41:12.202000', '2026-05-20 15:42:29.328000', '2026-05-20 17:31:47.451000', '2026-05-20 17:33:58.578000', '2026-05-20 17:34:04.138000', NULL, 6, 15, 'EPA90BCE0A9A1F1779262848', NULL, NULL);
INSERT INTO `dvadmin_escort_order` VALUES (21, NULL, NULL, NULL, '2026-05-25 10:06:16.981807', '2026-05-25 10:04:28.427553', 'EP16E2BA1DF3E9', 6, 0.60, 0.09, 0.51, '测试账号', '端游steam', '跑刀', '4格以上大红留着', '2026-05-25 10:04:50.024594', '2026-05-25 10:05:51.387022', '2026-05-25 10:05:51.387022', '2026-05-25 10:06:13.415814', '2026-05-25 10:06:16.980807', NULL, 6, 16, 'EP16E2BA1DF3E91779674669', NULL, NULL);
INSERT INTO `dvadmin_escort_order` VALUES (22, NULL, NULL, NULL, '2026-05-25 10:13:04.067892', '2026-05-25 10:07:48.836109', 'EP449BB147E61B', 6, 0.88, 0.13, 0.74, '测试333', 'wegame端游', '猛攻', '必须欧美', '2026-05-25 10:08:10.548065', '2026-05-25 10:08:38.625658', '2026-05-25 10:08:45.901624', '2026-05-25 10:13:00.763724', '2026-05-25 10:13:04.067892', NULL, 6, 17, 'EP449BB147E61B1779674869', NULL, NULL);
INSERT INTO `dvadmin_escort_order` VALUES (23, NULL, NULL, NULL, '2026-05-25 10:23:09.420515', '2026-05-25 10:22:22.150159', 'EPC9527D6C902E', 10, 0.10, 0.02, 0.08, '312', '123', '321', '', '2026-05-25 10:22:41.048883', NULL, NULL, NULL, NULL, NULL, 6, 14, 'EPC9527D6C902E1779675743', NULL, NULL);

-- ----------------------------
-- Table structure for dvadmin_escort_order_hunter
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_order_hunter`;
CREATE TABLE `dvadmin_escort_order_hunter`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `is_primary` tinyint(1) NOT NULL COMMENT '是否是抢单人',
  `share_percentage` double NOT NULL COMMENT '打手分成比例（百分比）',
  `share_amount` decimal(10, 2) NOT NULL COMMENT '打手分成金额',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `hunter_id` bigint NOT NULL COMMENT '接单打手',
  `order_id` bigint NOT NULL COMMENT '所属订单',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_escort_order_hunter_order_id_hunter_id_b416f8cc_uniq`(`order_id` ASC, `hunter_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_order_hunter_id_1eae782a_fk_dvadmin_e`(`hunter_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_order_hunter_creator_id_ac0a0d9c`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_order_hunter_id_1eae782a_fk_dvadmin_e` FOREIGN KEY (`hunter_id`) REFERENCES `dvadmin_escort_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dvadmin_escort_order_order_id_0f4aee5c_fk_dvadmin_e` FOREIGN KEY (`order_id`) REFERENCES `dvadmin_escort_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单打手' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_order_hunter
-- ----------------------------
INSERT INTO `dvadmin_escort_order_hunter` VALUES (4, NULL, NULL, NULL, '2026-05-25 09:42:37.418628', '2026-05-25 09:42:37.418628', 1, 100, 0.01, NULL, 6, 15);
INSERT INTO `dvadmin_escort_order_hunter` VALUES (5, NULL, NULL, NULL, '2026-05-25 09:42:37.427794', '2026-05-25 09:42:37.427794', 1, 100, 0.01, NULL, 8, 16);
INSERT INTO `dvadmin_escort_order_hunter` VALUES (6, NULL, NULL, NULL, '2026-05-25 09:42:37.437816', '2026-05-25 09:42:37.437816', 1, 100, 0.08, NULL, 8, 19);
INSERT INTO `dvadmin_escort_order_hunter` VALUES (7, NULL, NULL, NULL, '2026-05-25 09:42:37.446236', '2026-05-25 09:42:37.446236', 1, 50, 0.09, NULL, 8, 20);
INSERT INTO `dvadmin_escort_order_hunter` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:37.454255', '2026-05-25 09:42:37.454255', 0, 50, 0.09, NULL, 6, 20);
INSERT INTO `dvadmin_escort_order_hunter` VALUES (9, NULL, NULL, NULL, '2026-05-25 10:06:16.969807', '2026-05-25 10:05:51.378996', 1, 100, 0.51, NULL, 8, 21);
INSERT INTO `dvadmin_escort_order_hunter` VALUES (10, NULL, NULL, NULL, '2026-05-25 10:13:04.052899', '2026-05-25 10:08:38.618657', 1, 50, 0.37, NULL, 8, 22);
INSERT INTO `dvadmin_escort_order_hunter` VALUES (11, NULL, NULL, NULL, '2026-05-25 10:13:04.038899', '2026-05-25 10:08:45.874626', 0, 50, 0.37, NULL, 6, 22);

-- ----------------------------
-- Table structure for dvadmin_escort_order_review
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_order_review`;
CREATE TABLE `dvadmin_escort_order_review`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `rating` int NOT NULL COMMENT '评分（1-5分）',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评价详细内容',
  `is_anonymous` tinyint(1) NOT NULL COMMENT '是否匿名评价',
  `reply_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商家回复内容',
  `reply_time` datetime(6) NULL DEFAULT NULL COMMENT '回复时间',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `customer_id` bigint NOT NULL COMMENT '发表评价的客户',
  `order_id` bigint NOT NULL COMMENT '被评价的订单',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_order_customer_id_7392797d_fk_dvadmin_e`(`customer_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_order_review_creator_id_0b6fca13`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_order_customer_id_7392797d_fk_dvadmin_e` FOREIGN KEY (`customer_id`) REFERENCES `dvadmin_escort_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dvadmin_escort_order_order_id_c00d4520_fk_dvadmin_e` FOREIGN KEY (`order_id`) REFERENCES `dvadmin_escort_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_order_review
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_escort_refund_request
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_refund_request`;
CREATE TABLE `dvadmin_escort_refund_request`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `refund_amount` decimal(10, 2) NOT NULL COMMENT '客户申请的退款金额',
  `actual_refund_amount` decimal(10, 2) NOT NULL COMMENT '实际退款金额（可能与申请金额不同）',
  `reason_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '退款原因类型',
  `reason_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '客户填写的退款详细说明',
  `status` int NOT NULL COMMENT '退款申请状态',
  `refund_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信退款单号',
  `refund_time` datetime(6) NULL DEFAULT NULL COMMENT '微信退款完成时间',
  `reviewer_id` int NULL DEFAULT NULL COMMENT '审核退款的管理员ID',
  `reviewer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核退款的管理员名称',
  `review_notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审核备注信息',
  `review_time` datetime(6) NULL DEFAULT NULL COMMENT '审核时间',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `customer_id` bigint NOT NULL COMMENT '申请退款的客户',
  `order_id` bigint NOT NULL COMMENT '关联的订单',
  `previous_order_status` int NULL DEFAULT NULL COMMENT '申请退款前订单的状态值，用于拒绝退款时还原',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_refun_customer_id_bed61747_fk_dvadmin_e`(`customer_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_refund_request_creator_id_aabe69dc`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_refun_customer_id_bed61747_fk_dvadmin_e` FOREIGN KEY (`customer_id`) REFERENCES `dvadmin_escort_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dvadmin_escort_refun_order_id_d413ae45_fk_dvadmin_e` FOREIGN KEY (`order_id`) REFERENCES `dvadmin_escort_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '退款申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_refund_request
-- ----------------------------
INSERT INTO `dvadmin_escort_refund_request` VALUES (1, NULL, NULL, NULL, '2026-05-25 10:17:05.521757', '2026-05-25 10:16:42.738319', 0.10, 0.10, 'user_cancel', '时间太长了没人接单', 4, 'REFEPCB33D16270131779675424473', '2026-05-25 10:17:05.520760', 1, '1', '通过', '2026-05-25 10:17:04.473538', NULL, 6, 18, 1);
INSERT INTO `dvadmin_escort_refund_request` VALUES (2, NULL, NULL, NULL, '2026-05-25 10:23:09.408169', '2026-05-25 10:22:53.607810', 0.10, 0.10, 'user_cancel', '下错了订单', 4, 'REFEPC9527D6C902E1779675788446', '2026-05-25 10:23:09.408169', 1, '1', '通过', '2026-05-25 10:23:08.446836', NULL, 6, 23, 1);

-- ----------------------------
-- Table structure for dvadmin_escort_service
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_service`;
CREATE TABLE `dvadmin_escort_service`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '服务名称',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '服务详细描述',
  `price` decimal(10, 2) NOT NULL COMMENT '服务价格',
  `service_type` int NOT NULL COMMENT '单人还是多人服务',
  `required_hunters` int NOT NULL COMMENT '需要多少打手',
  `duration` int NOT NULL COMMENT '服务时长，单位分钟',
  `game_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏名称',
  `game_server` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏服务器',
  `game_mode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '游戏模式',
  `is_active` tinyint(1) NOT NULL COMMENT '是否上架销售',
  `sort` int NOT NULL COMMENT '服务排序',
  `category_id` bigint NOT NULL COMMENT '所属分类',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_escort_servi_category_id_cf7f5cc7_fk_dvadmin_e`(`category_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_service_creator_id_61c009d8`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_servi_category_id_cf7f5cc7_fk_dvadmin_e` FOREIGN KEY (`category_id`) REFERENCES `dvadmin_escort_service_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '陪玩服务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_service
-- ----------------------------
INSERT INTO `dvadmin_escort_service` VALUES (13, NULL, NULL, '2026-05-25 09:42:37.191773', '2026-05-25 09:42:37.191773', '护航测试单', '<p>测试专用</p>', 0.01, 2, 2, 120, '', NULL, NULL, 1, 0, 10, NULL);
INSERT INTO `dvadmin_escort_service` VALUES (14, NULL, NULL, '2026-05-25 09:42:37.199370', '2026-05-25 09:42:37.199370', '跑刀【测试专用】', '<p>测试</p>', 0.10, 1, 1, 240, '', NULL, NULL, 1, 0, 10, NULL);
INSERT INTO `dvadmin_escort_service` VALUES (15, NULL, NULL, '2026-05-25 09:42:37.207376', '2026-05-25 09:42:37.207376', '测试护航单', '<p>测试专用护航体验单</p><p>【测试2人订单】</p>', 0.20, 2, 2, 60, '', NULL, NULL, 1, 0, 10, NULL);
INSERT INTO `dvadmin_escort_service` VALUES (16, NULL, NULL, '2026-05-25 10:02:34.289177', '2026-05-25 10:02:34.289177', '跑刀', '<p>使用mysql8.0数据库新增的跑刀测试单</p>', 0.60, 1, 1, 240, '', NULL, NULL, 1, 0, 10, NULL);
INSERT INTO `dvadmin_escort_service` VALUES (17, NULL, NULL, '2026-05-25 10:03:25.621813', '2026-05-25 10:03:25.621813', '护航【手游】', '<p>测试mysql本地护航单</p>', 0.88, 2, 2, 60, '', NULL, NULL, 1, 0, 10, NULL);

-- ----------------------------
-- Table structure for dvadmin_escort_service_category
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_service_category`;
CREATE TABLE `dvadmin_escort_service_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '服务分类名称',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '分类描述',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类图标（图标类名）',
  `sort` int NOT NULL COMMENT '分类排序',
  `is_active` tinyint(1) NOT NULL COMMENT '是否启用该分类',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类图片（存储图片URL相对路径）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_escort_service_category_creator_id_7d44d67e`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '服务分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_service_category
-- ----------------------------
INSERT INTO `dvadmin_escort_service_category` VALUES (10, '1', NULL, '2026-05-25 09:42:37.125722', '2026-04-08 09:14:34.074000', '三角洲', 'test', NULL, 0, 1, NULL, 'media/files/6/6/66d93a2c6c647a250b6687c0a5c59da6.png');
INSERT INTO `dvadmin_escort_service_category` VALUES (11, NULL, NULL, '2026-05-25 09:42:37.132704', '2026-05-05 10:34:17.516000', '王者荣耀', NULL, NULL, 1, 1, NULL, 'media/files\\2\\5\\2555f1a6d7c4918f4ed721b1b0a9dcc6.png');
INSERT INTO `dvadmin_escort_service_category` VALUES (12, NULL, NULL, '2026-05-25 09:42:37.140708', '2026-05-05 10:35:25.468000', '英雄联盟', NULL, NULL, 2, 1, NULL, 'media/files\\6\\f\\6f9dcda52c129dcd994c844bda1420bf.png');
INSERT INTO `dvadmin_escort_service_category` VALUES (13, NULL, NULL, '2026-05-25 09:42:37.147700', '2026-05-18 13:57:28.228000', '测试游戏', '测试', NULL, 0, 1, NULL, 'media/files\\b\\2\\b2aef140789763ccb50dde7ae5b87096.png');

-- ----------------------------
-- Table structure for dvadmin_escort_service_image
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_service_image`;
CREATE TABLE `dvadmin_escort_service_image`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片相对路径',
  `sort` int NOT NULL COMMENT '图片排序，越小越靠前',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `service_id` bigint NOT NULL COMMENT '所属商品',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_escort_servi_service_id_4fcec3b1_fk_dvadmin_e`(`service_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_service_image_creator_id_9ef3b9ef`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_servi_service_id_4fcec3b1_fk_dvadmin_e` FOREIGN KEY (`service_id`) REFERENCES `dvadmin_escort_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_service_image
-- ----------------------------
INSERT INTO `dvadmin_escort_service_image` VALUES (18, NULL, NULL, NULL, '2026-05-25 09:42:37.224371', '2026-05-25 09:42:37.224371', 'media/files/6/6/66d93a2c6c647a250b6687c0a5c59da6.png', 0, NULL, 13);
INSERT INTO `dvadmin_escort_service_image` VALUES (20, NULL, NULL, NULL, '2026-05-25 09:42:37.231650', '2026-05-25 09:42:37.231650', 'media/files/6/6/66d93a2c6c647a250b6687c0a5c59da6.png', 0, NULL, 14);
INSERT INTO `dvadmin_escort_service_image` VALUES (21, NULL, NULL, NULL, '2026-05-25 09:42:37.239649', '2026-05-25 09:42:37.239649', 'media/files/8/e/8eb55a02681f5a401e449cf527a42305.png', 0, NULL, 15);
INSERT INTO `dvadmin_escort_service_image` VALUES (22, NULL, NULL, NULL, '2026-05-25 10:02:34.357177', '2026-05-25 10:02:34.357177', 'media/files/a/4/a4436432ad8274c24866f9791a77053c.png', 0, NULL, 16);
INSERT INTO `dvadmin_escort_service_image` VALUES (23, NULL, NULL, NULL, '2026-05-25 10:03:25.674812', '2026-05-25 10:03:25.674812', 'media/files/a/4/a4436432ad8274c24866f9791a77053c.png', 0, NULL, 17);

-- ----------------------------
-- Table structure for dvadmin_escort_user
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_user`;
CREATE TABLE `dvadmin_escort_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信用户唯一标识',
  `unionid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信UnionID',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信昵称',
  `avatar_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信头像URL',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `hunter_status` int NOT NULL COMMENT '打手申请状态',
  `apply_time` datetime(6) NULL DEFAULT NULL COMMENT '申请成为打手的时间',
  `approve_time` datetime(6) NULL DEFAULT NULL COMMENT '打手审核通过时间',
  `reject_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '打手申请被拒绝的原因',
  `balance` decimal(10, 2) NOT NULL COMMENT '用户可用余额',
  `total_income` decimal(10, 2) NOT NULL COMMENT '累计总收入',
  `total_withdrawal` decimal(10, 2) NOT NULL COMMENT '累计提现金额',
  `completed_orders` int NOT NULL COMMENT '已完成的订单数量',
  `avg_rating` double NOT NULL COMMENT '平均评分（0-5分）',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `id_card_back` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证反面照片URL',
  `id_card_front` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证正面照片URL',
  `invite_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '搭子邀请码，用于扫码绑定',
  `wx_auth_authorized` tinyint(1) NOT NULL COMMENT '用户是否已授权微信免确认收款',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `openid`(`openid` ASC) USING BTREE,
  UNIQUE INDEX `invite_code`(`invite_code` ASC) USING BTREE,
  INDEX `dvadmin_escort_user_creator_id_1e303105`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '陪玩用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_user
-- ----------------------------
INSERT INTO `dvadmin_escort_user` VALUES (6, NULL, NULL, NULL, '2026-05-25 09:42:37.156726', '2026-04-10 09:32:28.392000', 'oL0RH10jhY79kJkUs121emgQV16Y', '', 'xzp', 'http://127.0.0.1:18088/media/avatars/1777975024578_3c0d9193.png', '18296642121', '肖志鹏', '362426199702187317', 2, '2026-05-06 11:04:12.794000', '2026-05-06 13:49:04.475000', '', 0.46, 0.46, 0.00, 0, 0, NULL, 'http://127.0.0.1:18088/media/avatars/1778036316175_70af3076.png', 'http://127.0.0.1:18088/media/avatars/1778036311056_90c52c6b.png', 'CYJ7Q4AHAW5V', 0);
INSERT INTO `dvadmin_escort_user` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:37.165725', '2026-05-08 08:59:52.018000', 'oL0RH1xCJEfwaWHEXfHH-kbHlcOE', '', '用户bHlcOE', '', '18702590302', '肖学哲', '362426199802187317', 2, '2026-05-08 10:01:50.117000', '2026-05-08 10:20:46.010000', '', 0.98, 0.98, 0.00, 0, 0, NULL, 'http://127.0.0.1:18088/media/avatars/1778205707804_23343d49.png', 'http://127.0.0.1:18088/media/avatars/1778205704506_37e226a2.png', NULL, 0);
INSERT INTO `dvadmin_escort_user` VALUES (9, '', '', '', '2026-05-25 09:42:37.174726', '2026-05-12 02:30:45.000000', 'SYSTEM_PLATFORM_ADMIN', NULL, '星际怪兽话事人', 'https://mmbiz.qpic.cn/mmbiz/icTdbqWNOwNRna42FI242Lcia03jQ8KLluxDia7fhiaGibzKSPiamciciaibG8B1icic7I8ibyP8f8icXgib9icicI0N0h5x7icA1fVrw/0', '', '', '', 0, NULL, NULL, '', 0.00, 0.00, 0.00, 0, 0, NULL, '', '', NULL, 0);

-- ----------------------------
-- Table structure for dvadmin_escort_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_escort_withdrawal`;
CREATE TABLE `dvadmin_escort_withdrawal`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `amount` decimal(10, 2) NOT NULL COMMENT '申请提现的金额',
  `tax_amount` decimal(10, 2) NOT NULL COMMENT '个人所得税金额',
  `actual_amount` decimal(10, 2) NOT NULL COMMENT '实际到账金额',
  `status` int NOT NULL COMMENT '提现申请状态',
  `payment_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信支付单号',
  `payment_time` datetime(6) NULL DEFAULT NULL COMMENT '微信支付时间',
  `review_notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审核备注信息',
  `review_time` datetime(6) NULL DEFAULT NULL COMMENT '审核时间',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `user_id` bigint NOT NULL COMMENT '申请提现的用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_escort_withd_user_id_3d21633f_fk_dvadmin_e`(`user_id` ASC) USING BTREE,
  INDEX `dvadmin_escort_withdrawal_creator_id_56cfcd3a`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_escort_withd_user_id_3d21633f_fk_dvadmin_e` FOREIGN KEY (`user_id`) REFERENCES `dvadmin_escort_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '提现申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_escort_withdrawal
-- ----------------------------
INSERT INTO `dvadmin_escort_withdrawal` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:42:37.464311', '2026-05-25 09:42:37.464311', 0.10, 0.00, 0.10, 1, '', NULL, '微信付款失败 [SIGN_ERROR] Authorization不合法', '2026-05-20 19:22:43.279000', NULL, 8);

-- ----------------------------
-- Table structure for dvadmin_message_center
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_message_center`;
CREATE TABLE `dvadmin_message_center`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `target_type` int NOT NULL COMMENT '目标类型',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_message_center_creator_id_60e2080e`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_message_center
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_message_center_target_dept
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_message_center_target_dept`;
CREATE TABLE `dvadmin_message_center_target_dept`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `messagecenter_id` bigint NOT NULL,
  `dept_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_message_center_t_messagecenter_id_dept_id_d9fb0c77_uniq`(`messagecenter_id` ASC, `dept_id` ASC) USING BTREE,
  INDEX `dvadmin_message_center_target_dept_messagecenter_id_69868c17`(`messagecenter_id` ASC) USING BTREE,
  INDEX `dvadmin_message_center_target_dept_dept_id_616decc4`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_message_center_target_dept
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_message_center_target_role
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_message_center_target_role`;
CREATE TABLE `dvadmin_message_center_target_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `messagecenter_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_message_center_t_messagecenter_id_role_id_f5a77970_uniq`(`messagecenter_id` ASC, `role_id` ASC) USING BTREE,
  INDEX `dvadmin_message_center_target_role_messagecenter_id_41a7bd9d`(`messagecenter_id` ASC) USING BTREE,
  INDEX `dvadmin_message_center_target_role_role_id_661a61bb`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_message_center_target_role
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_message_center_target_user
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_message_center_target_user`;
CREATE TABLE `dvadmin_message_center_target_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `is_read` tinyint(1) NULL DEFAULT NULL COMMENT '是否已读',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `messagecenter_id` bigint NOT NULL COMMENT '关联消息中心表',
  `users_id` bigint NOT NULL COMMENT '关联用户表',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_message_center_target_user_creator_id_0a27a561`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_message_center_target_user_messagecenter_id_54f35bf8`(`messagecenter_id` ASC) USING BTREE,
  INDEX `dvadmin_message_center_target_user_users_id_9ff81ff5`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息中心目标用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_message_center_target_user
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_role_menu_button_permission
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_role_menu_button_permission`;
CREATE TABLE `dvadmin_role_menu_button_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `data_range` int NOT NULL COMMENT '数据权限范围',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `menu_button_id` bigint NULL DEFAULT NULL COMMENT '关联菜单按钮',
  `role_id` bigint NOT NULL COMMENT '关联角色',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_role_menu_button_permission_creator_id_76e161e6`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_role_menu_button_permission_menu_button_id_e2fba687`(`menu_button_id` ASC) USING BTREE,
  INDEX `dvadmin_role_menu_button_permission_role_id_3b8dd37a`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色按钮权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_role_menu_button_permission
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_role_menu_button_permission_dept
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_role_menu_button_permission_dept`;
CREATE TABLE `dvadmin_role_menu_button_permission_dept`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rolemenubuttonpermission_id` bigint NOT NULL,
  `dept_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_role_menu_button_rolemenubuttonpermission_e9ad3e96_uniq`(`rolemenubuttonpermission_id` ASC, `dept_id` ASC) USING BTREE,
  INDEX `dvadmin_role_menu_button_pe_rolemenubuttonpermission_id_d43fe932`(`rolemenubuttonpermission_id` ASC) USING BTREE,
  INDEX `dvadmin_role_menu_button_permission_dept_dept_id_8b8ccd69`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_role_menu_button_permission_dept
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_role_menu_permission
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_role_menu_permission`;
CREATE TABLE `dvadmin_role_menu_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `menu_id` bigint NOT NULL COMMENT '关联菜单',
  `role_id` bigint NOT NULL COMMENT '关联角色',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_role_menu_permission_creator_id_c45cb075`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_role_menu_permission_menu_id_f6486ce5`(`menu_id` ASC) USING BTREE,
  INDEX `dvadmin_role_menu_permission_role_id_9a3f9bee`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_role_menu_permission
-- ----------------------------
INSERT INTO `dvadmin_role_menu_permission` VALUES (1, NULL, '1', NULL, '2026-05-25 09:42:36.544076', '2026-05-25 09:42:36.544076', NULL, 1, 1);
INSERT INTO `dvadmin_role_menu_permission` VALUES (2, NULL, '1', NULL, '2026-05-25 09:42:36.552075', '2026-05-25 09:42:36.552075', NULL, 3, 1);

-- ----------------------------
-- Table structure for dvadmin_system_area
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_area`;
CREATE TABLE `dvadmin_system_area`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地区编码',
  `level` bigint NOT NULL COMMENT '地区层级(1省份 2城市 3区县 4乡级)',
  `pinyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '拼音',
  `initials` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '首字母',
  `enable` tinyint(1) NOT NULL COMMENT '是否启用',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `pcode_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父地区编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE,
  INDEX `dvadmin_system_area_creator_id_a5046ac0`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_area_pcode_id_f9b21462`(`pcode_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3446 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_area
-- ----------------------------
INSERT INTO `dvadmin_system_area` VALUES (1, NULL, NULL, NULL, '2026-05-25 09:42:02.863035', '2026-04-03 10:10:04.958000', '北京市', '11', 1, 'beijingshi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2, NULL, NULL, NULL, '2026-05-25 09:42:02.874034', '2026-05-25 09:42:02.874034', '市辖区', '1101', 2, 'shixiaqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:42:02.882034', '2026-05-25 09:42:02.882034', '东城区', '110101', 3, 'dongchengqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (4, NULL, NULL, NULL, '2026-05-25 09:42:02.890033', '2026-05-25 09:42:02.890033', '西城区', '110102', 3, 'xichengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (5, NULL, NULL, NULL, '2026-05-25 09:42:02.899035', '2026-05-25 09:42:02.899035', '朝阳区', '110105', 3, 'chaoyangqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (6, NULL, NULL, NULL, '2026-05-25 09:42:02.915034', '2026-05-25 09:42:02.915034', '丰台区', '110106', 3, 'fengtaiqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (7, NULL, NULL, NULL, '2026-05-25 09:42:02.923034', '2026-05-25 09:42:02.923034', '石景山区', '110107', 3, 'shijingshanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:02.930034', '2026-05-25 09:42:02.930034', '海淀区', '110108', 3, 'haidianqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (9, NULL, NULL, NULL, '2026-05-25 09:42:02.941034', '2026-05-25 09:42:02.941034', '门头沟区', '110109', 3, 'mentougouqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (10, NULL, NULL, NULL, '2026-05-25 09:42:02.951374', '2026-05-25 09:42:02.951374', '房山区', '110111', 3, 'fangshanqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (11, NULL, NULL, NULL, '2026-05-25 09:42:02.959374', '2026-05-25 09:42:02.959374', '通州区', '110112', 3, 'tongzhouqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (12, NULL, NULL, NULL, '2026-05-25 09:42:02.970240', '2026-05-25 09:42:02.970240', '顺义区', '110113', 3, 'shunyiqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (13, NULL, NULL, NULL, '2026-05-25 09:42:02.978404', '2026-05-25 09:42:02.978404', '昌平区', '110114', 3, 'changpingqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (14, NULL, NULL, NULL, '2026-05-25 09:42:02.986154', '2026-05-25 09:42:02.986154', '大兴区', '110115', 3, 'daxingqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (15, NULL, NULL, NULL, '2026-05-25 09:42:02.998527', '2026-05-25 09:42:02.998527', '怀柔区', '110116', 3, 'huairouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (16, NULL, NULL, NULL, '2026-05-25 09:42:03.007519', '2026-05-25 09:42:03.007519', '平谷区', '110117', 3, 'pingguqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (17, NULL, NULL, NULL, '2026-05-25 09:42:03.016521', '2026-05-25 09:42:03.016521', '密云区', '110118', 3, 'miyunqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (18, NULL, NULL, NULL, '2026-05-25 09:42:03.024519', '2026-05-25 09:42:03.024519', '延庆区', '110119', 3, 'yanqingqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (19, NULL, NULL, NULL, '2026-05-25 09:42:03.034959', '2026-04-03 10:10:04.958000', '天津市', '12', 1, 'tianjinshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (20, NULL, NULL, NULL, '2026-05-25 09:42:03.043960', '2026-05-25 09:42:03.044959', '市辖区', '1201', 2, 'shixiaqu', 'S', 1, NULL, '110113');
INSERT INTO `dvadmin_system_area` VALUES (21, NULL, NULL, NULL, '2026-05-25 09:42:03.052183', '2026-05-25 09:42:03.052183', '和平区', '120101', 3, 'hepingqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (22, NULL, NULL, NULL, '2026-05-25 09:42:03.065284', '2026-05-25 09:42:03.065284', '河东区', '120102', 3, 'hedongqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (23, NULL, NULL, NULL, '2026-05-25 09:42:03.075300', '2026-05-25 09:42:03.075300', '河西区', '120103', 3, 'hexiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (24, NULL, NULL, NULL, '2026-05-25 09:42:03.082294', '2026-05-25 09:42:03.083301', '南开区', '120104', 3, 'nankaiqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (25, NULL, NULL, NULL, '2026-05-25 09:42:03.092214', '2026-05-25 09:42:03.092214', '河北区', '120105', 3, 'hebeiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (26, NULL, NULL, NULL, '2026-05-25 09:42:03.100213', '2026-05-25 09:42:03.100213', '红桥区', '120106', 3, 'hongqiaoqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (27, NULL, NULL, NULL, '2026-05-25 09:42:03.108428', '2026-05-25 09:42:03.108428', '东丽区', '120110', 3, 'dongliqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (28, NULL, NULL, NULL, '2026-05-25 09:42:03.118435', '2026-05-25 09:42:03.118435', '西青区', '120111', 3, 'xiqingqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (29, NULL, NULL, NULL, '2026-05-25 09:42:03.127441', '2026-05-25 09:42:03.127441', '津南区', '120112', 3, 'jinnanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (30, NULL, NULL, NULL, '2026-05-25 09:42:03.136436', '2026-05-25 09:42:03.136436', '北辰区', '120113', 3, 'beichenqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (31, NULL, NULL, NULL, '2026-05-25 09:42:03.143437', '2026-05-25 09:42:03.143437', '武清区', '120114', 3, 'wuqingqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (32, NULL, NULL, NULL, '2026-05-25 09:42:03.150442', '2026-05-25 09:42:03.150442', '宝坻区', '120115', 3, 'baodiqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (33, NULL, NULL, NULL, '2026-05-25 09:42:03.158841', '2026-05-25 09:42:03.158841', '滨海新区', '120116', 3, 'binhaixinqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (34, NULL, NULL, NULL, '2026-05-25 09:42:03.165840', '2026-05-25 09:42:03.165840', '宁河区', '120117', 3, 'ninghequ', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (35, NULL, NULL, NULL, '2026-05-25 09:42:03.172862', '2026-05-25 09:42:03.172862', '静海区', '120118', 3, 'jinghaiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (36, NULL, NULL, NULL, '2026-05-25 09:42:03.179900', '2026-05-25 09:42:03.179900', '蓟州区', '120119', 3, 'jizhouqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (37, NULL, NULL, NULL, '2026-05-25 09:42:03.187900', '2026-04-03 10:10:04.959000', '河北省', '13', 1, 'hebeisheng', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (38, NULL, NULL, NULL, '2026-05-25 09:42:03.195551', '2026-05-25 09:42:03.195551', '石家庄市', '1301', 2, 'shijiazhuangshi', 'S', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (39, NULL, NULL, NULL, '2026-05-25 09:42:03.205603', '2026-05-25 09:42:03.205603', '长安区', '130102', 3, 'changanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (40, NULL, NULL, NULL, '2026-05-25 09:42:03.214603', '2026-05-25 09:42:03.214603', '桥西区', '130104', 3, 'qiaoxiqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (41, NULL, NULL, NULL, '2026-05-25 09:42:03.224612', '2026-05-25 09:42:03.224612', '新华区', '130105', 3, 'xinhuaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (42, NULL, NULL, NULL, '2026-05-25 09:42:03.234802', '2026-05-25 09:42:03.234802', '井陉矿区', '130107', 3, 'jingxingkuangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (43, NULL, NULL, NULL, '2026-05-25 09:42:03.243802', '2026-05-25 09:42:03.243802', '裕华区', '130108', 3, 'yuhuaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (44, NULL, NULL, NULL, '2026-05-25 09:42:03.250802', '2026-05-25 09:42:03.250802', '藁城区', '130109', 3, 'gaochengqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (45, NULL, NULL, NULL, '2026-05-25 09:42:03.262873', '2026-05-25 09:42:03.262873', '鹿泉区', '130110', 3, 'luquanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (46, NULL, NULL, NULL, '2026-05-25 09:42:03.270859', '2026-05-25 09:42:03.270859', '栾城区', '130111', 3, 'luanchengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (47, NULL, NULL, NULL, '2026-05-25 09:42:03.280867', '2026-05-25 09:42:03.280867', '井陉县', '130121', 3, 'jingxingxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (48, NULL, NULL, NULL, '2026-05-25 09:42:03.289792', '2026-05-25 09:42:03.289792', '正定县', '130123', 3, 'zhengdingxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (49, NULL, NULL, NULL, '2026-05-25 09:42:03.297898', '2026-05-25 09:42:03.297898', '行唐县', '130125', 3, 'xingtangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (50, NULL, NULL, NULL, '2026-05-25 09:42:03.308898', '2026-05-25 09:42:03.308898', '灵寿县', '130126', 3, 'lingshouxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (51, NULL, NULL, NULL, '2026-05-25 09:42:03.317958', '2026-05-25 09:42:03.317958', '高邑县', '130127', 3, 'gaoyixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (52, NULL, NULL, NULL, '2026-05-25 09:42:03.326440', '2026-05-25 09:42:03.326440', '深泽县', '130128', 3, 'shenzexian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (53, NULL, NULL, NULL, '2026-05-25 09:42:03.334864', '2026-05-25 09:42:03.334864', '赞皇县', '130129', 3, 'zanhuangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (54, NULL, NULL, NULL, '2026-05-25 09:42:03.343864', '2026-05-25 09:42:03.343864', '无极县', '130130', 3, 'wujixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (55, NULL, NULL, NULL, '2026-05-25 09:42:03.354864', '2026-05-25 09:42:03.354864', '平山县', '130131', 3, 'pingshanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (56, NULL, NULL, NULL, '2026-05-25 09:42:03.363822', '2026-05-25 09:42:03.363822', '元氏县', '130132', 3, 'yuanshixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (57, NULL, NULL, NULL, '2026-05-25 09:42:03.371428', '2026-05-25 09:42:03.371428', '赵县', '130133', 3, 'zhaoxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (58, NULL, NULL, NULL, '2026-05-25 09:42:03.380428', '2026-05-25 09:42:03.380428', '石家庄高新技术产业开发区', '130171', 3, 'shijiazhuanggaoxinjishuchanyekaifaqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (59, NULL, NULL, NULL, '2026-05-25 09:42:03.389431', '2026-05-25 09:42:03.389431', '石家庄循环化工园区', '130172', 3, 'shijiazhuangxunhuanhuagongyuanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (60, NULL, NULL, NULL, '2026-05-25 09:42:03.398428', '2026-05-25 09:42:03.398428', '辛集市', '130181', 3, 'xinjishi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (61, NULL, NULL, NULL, '2026-05-25 09:42:03.408421', '2026-05-25 09:42:03.408421', '晋州市', '130183', 3, 'jinzhoushi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (62, NULL, NULL, NULL, '2026-05-25 09:42:03.417121', '2026-05-25 09:42:03.417121', '新乐市', '130184', 3, 'xinleshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (63, NULL, NULL, NULL, '2026-05-25 09:42:03.425120', '2026-05-25 09:42:03.425120', '唐山市', '1302', 2, 'tangshanshi', 'T', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (64, NULL, NULL, NULL, '2026-05-25 09:42:03.434122', '2026-05-25 09:42:03.434122', '路南区', '130202', 3, 'lunanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (65, NULL, NULL, NULL, '2026-05-25 09:42:03.442116', '2026-05-25 09:42:03.442116', '路北区', '130203', 3, 'lubeiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (66, NULL, NULL, NULL, '2026-05-25 09:42:03.457895', '2026-05-25 09:42:03.457895', '古冶区', '130204', 3, 'guyequ', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (67, NULL, NULL, NULL, '2026-05-25 09:42:03.501875', '2026-05-25 09:42:03.501875', '开平区', '130205', 3, 'kaipingqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (68, NULL, NULL, NULL, '2026-05-25 09:42:03.518830', '2026-05-25 09:42:03.518830', '丰南区', '130207', 3, 'fengnanqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (69, NULL, NULL, NULL, '2026-05-25 09:42:03.536875', '2026-05-25 09:42:03.536875', '丰润区', '130208', 3, 'fengrunqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (70, NULL, NULL, NULL, '2026-05-25 09:42:03.554881', '2026-05-25 09:42:03.554881', '曹妃甸区', '130209', 3, 'caofeidianqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (71, NULL, NULL, NULL, '2026-05-25 09:42:03.573413', '2026-05-25 09:42:03.573413', '滦南县', '130224', 3, 'luannanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (72, NULL, NULL, NULL, '2026-05-25 09:42:03.589640', '2026-05-25 09:42:03.589640', '乐亭县', '130225', 3, 'letingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (73, NULL, NULL, NULL, '2026-05-25 09:42:03.601963', '2026-05-25 09:42:03.601963', '迁西县', '130227', 3, 'qianxixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (74, NULL, NULL, NULL, '2026-05-25 09:42:03.620814', '2026-05-25 09:42:03.620814', '玉田县', '130229', 3, 'yutianxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (75, NULL, NULL, NULL, '2026-05-25 09:42:03.638229', '2026-05-25 09:42:03.638229', '河北唐山芦台经济开发区', '130271', 3, 'hebeitangshanlutaijingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (76, NULL, NULL, NULL, '2026-05-25 09:42:03.653230', '2026-05-25 09:42:03.653230', '唐山市汉沽管理区', '130272', 3, 'tangshanshihanguguanliqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (77, NULL, NULL, NULL, '2026-05-25 09:42:03.663228', '2026-05-25 09:42:03.663228', '唐山高新技术产业开发区', '130273', 3, 'tangshangaoxinjishuchanyekaifaqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (78, NULL, NULL, NULL, '2026-05-25 09:42:03.672171', '2026-05-25 09:42:03.672171', '河北唐山海港经济开发区', '130274', 3, 'hebeitangshanhaigangjingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (79, NULL, NULL, NULL, '2026-05-25 09:42:03.681173', '2026-05-25 09:42:03.681173', '遵化市', '130281', 3, 'zunhuashi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (80, NULL, NULL, NULL, '2026-05-25 09:42:03.690560', '2026-05-25 09:42:03.690560', '迁安市', '130283', 3, 'qiananshi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (81, NULL, NULL, NULL, '2026-05-25 09:42:03.698109', '2026-05-25 09:42:03.699109', '滦州市', '130284', 3, 'luanzhoushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (82, NULL, NULL, NULL, '2026-05-25 09:42:03.706747', '2026-05-25 09:42:03.706747', '秦皇岛市', '1303', 2, 'qinhuangdaoshi', 'Q', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (83, NULL, NULL, NULL, '2026-05-25 09:42:03.715761', '2026-05-25 09:42:03.715761', '海港区', '130302', 3, 'haigangqu', 'H', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (84, NULL, NULL, NULL, '2026-05-25 09:42:03.722811', '2026-05-25 09:42:03.722811', '山海关区', '130303', 3, 'shanhaiguanqu', 'S', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (85, NULL, NULL, NULL, '2026-05-25 09:42:03.731808', '2026-05-25 09:42:03.731808', '北戴河区', '130304', 3, 'beidaihequ', 'B', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (86, NULL, NULL, NULL, '2026-05-25 09:42:03.738799', '2026-05-25 09:42:03.738799', '抚宁区', '130306', 3, 'funingqu', 'F', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (87, NULL, NULL, NULL, '2026-05-25 09:42:03.746026', '2026-05-25 09:42:03.746026', '青龙满族自治县', '130321', 3, 'qinglongmanzuzizhixian', 'Q', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (88, NULL, NULL, NULL, '2026-05-25 09:42:03.753402', '2026-05-25 09:42:03.753402', '昌黎县', '130322', 3, 'changlixian', 'C', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (89, NULL, NULL, NULL, '2026-05-25 09:42:03.760401', '2026-05-25 09:42:03.760401', '卢龙县', '130324', 3, 'lulongxian', 'L', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (90, NULL, NULL, NULL, '2026-05-25 09:42:03.768584', '2026-05-25 09:42:03.768584', '秦皇岛市经济技术开发区', '130371', 3, 'qinhuangdaoshijingjijishukaifaqu', 'Q', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (91, NULL, NULL, NULL, '2026-05-25 09:42:03.776584', '2026-05-25 09:42:03.776584', '北戴河新区', '130372', 3, 'beidaihexinqu', 'B', 1, NULL, '36');
INSERT INTO `dvadmin_system_area` VALUES (92, NULL, NULL, NULL, '2026-05-25 09:42:03.785583', '2026-05-25 09:42:03.785583', '邯郸市', '1304', 2, 'handanshi', 'H', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (93, NULL, NULL, NULL, '2026-05-25 09:42:03.793583', '2026-05-25 09:42:03.793583', '邯山区', '130402', 3, 'hanshanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (94, NULL, NULL, NULL, '2026-05-25 09:42:03.801636', '2026-05-25 09:42:03.801636', '丛台区', '130403', 3, 'congtaiqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (95, NULL, NULL, NULL, '2026-05-25 09:42:03.809268', '2026-05-25 09:42:03.809268', '复兴区', '130404', 3, 'fuxingqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (96, NULL, NULL, NULL, '2026-05-25 09:42:03.819030', '2026-05-25 09:42:03.819030', '峰峰矿区', '130406', 3, 'fengfengkuangqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (97, NULL, NULL, NULL, '2026-05-25 09:42:03.825313', '2026-05-25 09:42:03.825313', '肥乡区', '130407', 3, 'feixiangqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (98, NULL, NULL, NULL, '2026-05-25 09:42:03.833781', '2026-05-25 09:42:03.833781', '永年区', '130408', 3, 'yongnianqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (99, NULL, NULL, NULL, '2026-05-25 09:42:03.843062', '2026-05-25 09:42:03.843062', '临漳县', '130423', 3, 'linzhangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (100, NULL, NULL, NULL, '2026-05-25 09:42:03.854136', '2026-05-25 09:42:03.854136', '成安县', '130424', 3, 'chenganxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (101, NULL, NULL, NULL, '2026-05-25 09:42:03.863169', '2026-05-25 09:42:03.863169', '大名县', '130425', 3, 'damingxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (102, NULL, NULL, NULL, '2026-05-25 09:42:03.873169', '2026-05-25 09:42:03.873169', '涉县', '130426', 3, 'shexian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (103, NULL, NULL, NULL, '2026-05-25 09:42:03.882170', '2026-05-25 09:42:03.882170', '磁县', '130427', 3, 'cixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (104, NULL, NULL, NULL, '2026-05-25 09:42:03.890181', '2026-05-25 09:42:03.890181', '邱县', '130430', 3, 'qiuxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (105, NULL, NULL, NULL, '2026-05-25 09:42:03.898181', '2026-05-25 09:42:03.898181', '鸡泽县', '130431', 3, 'jizexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (106, NULL, NULL, NULL, '2026-05-25 09:42:03.906712', '2026-05-25 09:42:03.906712', '广平县', '130432', 3, 'guangpingxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (107, NULL, NULL, NULL, '2026-05-25 09:42:03.919469', '2026-05-25 09:42:03.919469', '馆陶县', '130433', 3, 'guantaoxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (108, NULL, NULL, NULL, '2026-05-25 09:42:03.927463', '2026-05-25 09:42:03.927463', '魏县', '130434', 3, 'weixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (109, NULL, NULL, NULL, '2026-05-25 09:42:03.935997', '2026-05-25 09:42:03.935997', '曲周县', '130435', 3, 'quzhouxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (110, NULL, NULL, NULL, '2026-05-25 09:42:03.944911', '2026-05-25 09:42:03.944911', '邯郸经济技术开发区', '130471', 3, 'handanjingjijishukaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (111, NULL, NULL, NULL, '2026-05-25 09:42:03.952435', '2026-05-25 09:42:03.953435', '邯郸冀南新区', '130473', 3, 'handanjinanxinqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (112, NULL, NULL, NULL, '2026-05-25 09:42:03.961468', '2026-05-25 09:42:03.961468', '武安市', '130481', 3, 'wuanshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (113, NULL, NULL, NULL, '2026-05-25 09:42:03.970515', '2026-05-25 09:42:03.970515', '邢台市', '1305', 2, 'xingtaishi', 'X', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (114, NULL, NULL, NULL, '2026-05-25 09:42:03.979990', '2026-05-25 09:42:03.979990', '襄都区', '130502', 3, 'xiangdouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (115, NULL, NULL, NULL, '2026-05-25 09:42:03.988037', '2026-05-25 09:42:03.988037', '信都区', '130503', 3, 'xindouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (116, NULL, NULL, NULL, '2026-05-25 09:42:03.996752', '2026-05-25 09:42:03.996752', '任泽区', '130505', 3, 'renzequ', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (117, NULL, NULL, NULL, '2026-05-25 09:42:04.006745', '2026-05-25 09:42:04.006745', '南和区', '130506', 3, 'nanhequ', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (118, NULL, NULL, NULL, '2026-05-25 09:42:04.015761', '2026-05-25 09:42:04.015761', '临城县', '130522', 3, 'linchengxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (119, NULL, NULL, NULL, '2026-05-25 09:42:04.026753', '2026-05-25 09:42:04.026753', '内丘县', '130523', 3, 'neiqiuxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (120, NULL, NULL, NULL, '2026-05-25 09:42:04.035751', '2026-05-25 09:42:04.035751', '柏乡县', '130524', 3, 'baixiangxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (121, NULL, NULL, NULL, '2026-05-25 09:42:04.044900', '2026-05-25 09:42:04.044900', '隆尧县', '130525', 3, 'longyaoxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (122, NULL, NULL, NULL, '2026-05-25 09:42:04.052902', '2026-05-25 09:42:04.052902', '宁晋县', '130528', 3, 'ningjinxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (123, NULL, NULL, NULL, '2026-05-25 09:42:04.062501', '2026-05-25 09:42:04.062501', '巨鹿县', '130529', 3, 'juluxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (124, NULL, NULL, NULL, '2026-05-25 09:42:04.071269', '2026-05-25 09:42:04.071269', '新河县', '130530', 3, 'xinhexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (125, NULL, NULL, NULL, '2026-05-25 09:42:04.079099', '2026-05-25 09:42:04.079099', '广宗县', '130531', 3, 'guangzongxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (126, NULL, NULL, NULL, '2026-05-25 09:42:04.088726', '2026-05-25 09:42:04.088726', '平乡县', '130532', 3, 'pingxiangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (127, NULL, NULL, NULL, '2026-05-25 09:42:04.098728', '2026-05-25 09:42:04.098728', '威县', '130533', 3, 'weixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (128, NULL, NULL, NULL, '2026-05-25 09:42:04.105152', '2026-05-25 09:42:04.105152', '清河县', '130534', 3, 'qinghexian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (129, NULL, NULL, NULL, '2026-05-25 09:42:04.114146', '2026-05-25 09:42:04.114146', '临西县', '130535', 3, 'linxixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (130, NULL, NULL, NULL, '2026-05-25 09:42:04.123150', '2026-05-25 09:42:04.123150', '河北邢台经济开发区', '130571', 3, 'hebeixingtaijingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (131, NULL, NULL, NULL, '2026-05-25 09:42:04.131144', '2026-05-25 09:42:04.131144', '南宫市', '130581', 3, 'nangongshi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (132, NULL, NULL, NULL, '2026-05-25 09:42:04.139153', '2026-05-25 09:42:04.139153', '沙河市', '130582', 3, 'shaheshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (133, NULL, NULL, NULL, '2026-05-25 09:42:04.146835', '2026-05-25 09:42:04.146835', '保定市', '1306', 2, 'baodingshi', 'B', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (134, NULL, NULL, NULL, '2026-05-25 09:42:04.154879', '2026-05-25 09:42:04.154879', '竞秀区', '130602', 3, 'jingxiuqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (135, NULL, NULL, NULL, '2026-05-25 09:42:04.161893', '2026-05-25 09:42:04.161893', '莲池区', '130606', 3, 'lianchiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (136, NULL, NULL, NULL, '2026-05-25 09:42:04.170894', '2026-05-25 09:42:04.170894', '满城区', '130607', 3, 'manchengqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (137, NULL, NULL, NULL, '2026-05-25 09:42:04.181900', '2026-05-25 09:42:04.182900', '清苑区', '130608', 3, 'qingyuanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (138, NULL, NULL, NULL, '2026-05-25 09:42:04.190625', '2026-05-25 09:42:04.190625', '徐水区', '130609', 3, 'xushuiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (139, NULL, NULL, NULL, '2026-05-25 09:42:04.198795', '2026-05-25 09:42:04.198795', '涞水县', '130623', 3, 'laishuixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (140, NULL, NULL, NULL, '2026-05-25 09:42:04.208304', '2026-05-25 09:42:04.208304', '阜平县', '130624', 3, 'fupingxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (141, NULL, NULL, NULL, '2026-05-25 09:42:04.217305', '2026-05-25 09:42:04.217305', '定兴县', '130626', 3, 'dingxingxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (142, NULL, NULL, NULL, '2026-05-25 09:42:04.227844', '2026-05-25 09:42:04.227844', '唐县', '130627', 3, 'tangxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (143, NULL, NULL, NULL, '2026-05-25 09:42:04.240040', '2026-05-25 09:42:04.240040', '高阳县', '130628', 3, 'gaoyangxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (144, NULL, NULL, NULL, '2026-05-25 09:42:04.251809', '2026-05-25 09:42:04.251809', '容城县', '130629', 3, 'rongchengxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (145, NULL, NULL, NULL, '2026-05-25 09:42:04.261772', '2026-05-25 09:42:04.261772', '涞源县', '130630', 3, 'laiyuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (146, NULL, NULL, NULL, '2026-05-25 09:42:04.269931', '2026-05-25 09:42:04.269931', '望都县', '130631', 3, 'wangdouxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (147, NULL, NULL, NULL, '2026-05-25 09:42:04.279931', '2026-05-25 09:42:04.279931', '安新县', '130632', 3, 'anxinxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (148, NULL, NULL, NULL, '2026-05-25 09:42:04.286934', '2026-05-25 09:42:04.286934', '易县', '130633', 3, 'yixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (149, NULL, NULL, NULL, '2026-05-25 09:42:04.295737', '2026-05-25 09:42:04.295737', '曲阳县', '130634', 3, 'quyangxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (150, NULL, NULL, NULL, '2026-05-25 09:42:04.304943', '2026-05-25 09:42:04.304943', '蠡县', '130635', 3, 'lixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (151, NULL, NULL, NULL, '2026-05-25 09:42:04.315759', '2026-05-25 09:42:04.315759', '顺平县', '130636', 3, 'shunpingxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (152, NULL, NULL, NULL, '2026-05-25 09:42:04.324756', '2026-05-25 09:42:04.324756', '博野县', '130637', 3, 'boyexian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (153, NULL, NULL, NULL, '2026-05-25 09:42:04.338766', '2026-05-25 09:42:04.338766', '雄县', '130638', 3, 'xiongxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (154, NULL, NULL, NULL, '2026-05-25 09:42:04.345755', '2026-05-25 09:42:04.345755', '保定高新技术产业开发区', '130671', 3, 'baodinggaoxinjishuchanyekaifaqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (155, NULL, NULL, NULL, '2026-05-25 09:42:04.355755', '2026-05-25 09:42:04.355755', '保定白沟新城', '130672', 3, 'baodingbaigouxincheng', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (156, NULL, NULL, NULL, '2026-05-25 09:42:04.363755', '2026-05-25 09:42:04.363755', '涿州市', '130681', 3, 'zhuozhoushi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (157, NULL, NULL, NULL, '2026-05-25 09:42:04.372755', '2026-05-25 09:42:04.372755', '定州市', '130682', 3, 'dingzhoushi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (158, NULL, NULL, NULL, '2026-05-25 09:42:04.379755', '2026-05-25 09:42:04.379755', '安国市', '130683', 3, 'anguoshi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (159, NULL, NULL, NULL, '2026-05-25 09:42:04.387755', '2026-05-25 09:42:04.387755', '高碑店市', '130684', 3, 'gaobeidianshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (160, NULL, NULL, NULL, '2026-05-25 09:42:04.395756', '2026-05-25 09:42:04.395756', '张家口市', '1307', 2, 'zhangjiakoushi', 'Z', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (161, NULL, NULL, NULL, '2026-05-25 09:42:04.407755', '2026-05-25 09:42:04.407755', '桥东区', '130702', 3, 'qiaodongqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (162, NULL, NULL, NULL, '2026-05-25 09:42:04.415755', '2026-05-25 09:42:04.415755', '桥西区', '130703', 3, 'qiaoxiqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (163, NULL, NULL, NULL, '2026-05-25 09:42:04.425750', '2026-05-25 09:42:04.425750', '宣化区', '130705', 3, 'xuanhuaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (164, NULL, NULL, NULL, '2026-05-25 09:42:04.435755', '2026-05-25 09:42:04.435755', '下花园区', '130706', 3, 'xiahuayuanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (165, NULL, NULL, NULL, '2026-05-25 09:42:04.445266', '2026-05-25 09:42:04.445266', '万全区', '130708', 3, 'wanquanqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (166, NULL, NULL, NULL, '2026-05-25 09:42:04.475476', '2026-05-25 09:42:04.475476', '崇礼区', '130709', 3, 'chongliqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (167, NULL, NULL, NULL, '2026-05-25 09:42:04.484470', '2026-05-25 09:42:04.484470', '张北县', '130722', 3, 'zhangbeixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (168, NULL, NULL, NULL, '2026-05-25 09:42:04.493619', '2026-05-25 09:42:04.493619', '康保县', '130723', 3, 'kangbaoxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (169, NULL, NULL, NULL, '2026-05-25 09:42:04.501612', '2026-05-25 09:42:04.501612', '沽源县', '130724', 3, 'guyuanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (170, NULL, NULL, NULL, '2026-05-25 09:42:04.512619', '2026-05-25 09:42:04.512619', '尚义县', '130725', 3, 'shangyixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (171, NULL, NULL, NULL, '2026-05-25 09:42:04.520621', '2026-05-25 09:42:04.520621', '蔚县', '130726', 3, 'yuxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (172, NULL, NULL, NULL, '2026-05-25 09:42:04.529613', '2026-05-25 09:42:04.529613', '阳原县', '130727', 3, 'yangyuanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (173, NULL, NULL, NULL, '2026-05-25 09:42:04.538619', '2026-05-25 09:42:04.538619', '怀安县', '130728', 3, 'huaianxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (174, NULL, NULL, NULL, '2026-05-25 09:42:04.547612', '2026-05-25 09:42:04.547612', '怀来县', '130730', 3, 'huailaixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (175, NULL, NULL, NULL, '2026-05-25 09:42:04.555619', '2026-05-25 09:42:04.555619', '涿鹿县', '130731', 3, 'zhuoluxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (176, NULL, NULL, NULL, '2026-05-25 09:42:04.563619', '2026-05-25 09:42:04.563619', '赤城县', '130732', 3, 'chichengxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (177, NULL, NULL, NULL, '2026-05-25 09:42:04.571790', '2026-05-25 09:42:04.571790', '张家口经济开发区', '130771', 3, 'zhangjiakoujingjikaifaqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (178, NULL, NULL, NULL, '2026-05-25 09:42:04.579795', '2026-05-25 09:42:04.579795', '张家口市察北管理区', '130772', 3, 'zhangjiakoushichabeiguanliqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (179, NULL, NULL, NULL, '2026-05-25 09:42:04.589798', '2026-05-25 09:42:04.589798', '张家口市塞北管理区', '130773', 3, 'zhangjiakoushisaibeiguanliqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (180, NULL, NULL, NULL, '2026-05-25 09:42:04.599789', '2026-05-25 09:42:04.599789', '承德市', '1308', 2, 'chengdeshi', 'C', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (181, NULL, NULL, NULL, '2026-05-25 09:42:04.609042', '2026-05-25 09:42:04.609042', '双桥区', '130802', 3, 'shuangqiaoqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (182, NULL, NULL, NULL, '2026-05-25 09:42:04.618320', '2026-05-25 09:42:04.618320', '双滦区', '130803', 3, 'shuangluanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (183, NULL, NULL, NULL, '2026-05-25 09:42:04.627321', '2026-05-25 09:42:04.627321', '鹰手营子矿区', '130804', 3, 'yingshouyingzikuangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (184, NULL, NULL, NULL, '2026-05-25 09:42:04.638320', '2026-05-25 09:42:04.638320', '承德县', '130821', 3, 'chengdexian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (185, NULL, NULL, NULL, '2026-05-25 09:42:04.646320', '2026-05-25 09:42:04.646320', '兴隆县', '130822', 3, 'xinglongxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (186, NULL, NULL, NULL, '2026-05-25 09:42:04.655321', '2026-05-25 09:42:04.655321', '滦平县', '130824', 3, 'luanpingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (187, NULL, NULL, NULL, '2026-05-25 09:42:04.664365', '2026-05-25 09:42:04.664365', '隆化县', '130825', 3, 'longhuaxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (188, NULL, NULL, NULL, '2026-05-25 09:42:04.671497', '2026-05-25 09:42:04.671497', '丰宁满族自治县', '130826', 3, 'fengningmanzuzizhixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (189, NULL, NULL, NULL, '2026-05-25 09:42:04.681475', '2026-05-25 09:42:04.681475', '宽城满族自治县', '130827', 3, 'kuanchengmanzuzizhixian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (190, NULL, NULL, NULL, '2026-05-25 09:42:04.689406', '2026-05-25 09:42:04.689406', '围场满族蒙古族自治县', '130828', 3, 'weichangmanzumengguzuzizhixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (191, NULL, NULL, NULL, '2026-05-25 09:42:04.700406', '2026-05-25 09:42:04.700406', '承德高新技术产业开发区', '130871', 3, 'chengdegaoxinjishuchanyekaifaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (192, NULL, NULL, NULL, '2026-05-25 09:42:04.709091', '2026-05-25 09:42:04.709091', '平泉市', '130881', 3, 'pingquanshi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (193, NULL, NULL, NULL, '2026-05-25 09:42:04.717830', '2026-05-25 09:42:04.717830', '沧州市', '1309', 2, 'cangzhoushi', 'C', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (194, NULL, NULL, NULL, '2026-05-25 09:42:04.725595', '2026-05-25 09:42:04.725595', '新华区', '130902', 3, 'xinhuaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (195, NULL, NULL, NULL, '2026-05-25 09:42:04.735594', '2026-05-25 09:42:04.735594', '运河区', '130903', 3, 'yunhequ', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (196, NULL, NULL, NULL, '2026-05-25 09:42:04.743812', '2026-05-25 09:42:04.743812', '沧县', '130921', 3, 'cangxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (197, NULL, NULL, NULL, '2026-05-25 09:42:04.752822', '2026-05-25 09:42:04.752822', '青县', '130922', 3, 'qingxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (198, NULL, NULL, NULL, '2026-05-25 09:42:04.762734', '2026-05-25 09:42:04.762734', '东光县', '130923', 3, 'dongguangxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (199, NULL, NULL, NULL, '2026-05-25 09:42:04.770667', '2026-05-25 09:42:04.770667', '海兴县', '130924', 3, 'haixingxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (200, NULL, NULL, NULL, '2026-05-25 09:42:04.778046', '2026-05-25 09:42:04.778046', '盐山县', '130925', 3, 'yanshanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (201, NULL, NULL, NULL, '2026-05-25 09:42:04.786615', '2026-05-25 09:42:04.786615', '肃宁县', '130926', 3, 'suningxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (202, NULL, NULL, NULL, '2026-05-25 09:42:04.794568', '2026-05-25 09:42:04.794568', '南皮县', '130927', 3, 'nanpixian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (203, NULL, NULL, NULL, '2026-05-25 09:42:04.802568', '2026-05-25 09:42:04.802568', '吴桥县', '130928', 3, 'wuqiaoxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (204, NULL, NULL, NULL, '2026-05-25 09:42:04.809567', '2026-05-25 09:42:04.809567', '献县', '130929', 3, 'xianxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (205, NULL, NULL, NULL, '2026-05-25 09:42:04.817765', '2026-05-25 09:42:04.817765', '孟村回族自治县', '130930', 3, 'mengcunhuizuzizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (206, NULL, NULL, NULL, '2026-05-25 09:42:04.826765', '2026-05-25 09:42:04.826765', '河北沧州经济开发区', '130971', 3, 'hebeicangzhoujingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (207, NULL, NULL, NULL, '2026-05-25 09:42:04.834765', '2026-05-25 09:42:04.834765', '沧州高新技术产业开发区', '130972', 3, 'cangzhougaoxinjishuchanyekaifaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (208, NULL, NULL, NULL, '2026-05-25 09:42:04.842765', '2026-05-25 09:42:04.842765', '沧州渤海新区', '130973', 3, 'cangzhoubohaixinqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (209, NULL, NULL, NULL, '2026-05-25 09:42:04.850863', '2026-05-25 09:42:04.850863', '泊头市', '130981', 3, 'potoushi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (210, NULL, NULL, NULL, '2026-05-25 09:42:04.859278', '2026-05-25 09:42:04.859278', '任丘市', '130982', 3, 'renqiushi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (211, NULL, NULL, NULL, '2026-05-25 09:42:04.868693', '2026-05-25 09:42:04.868693', '黄骅市', '130983', 3, 'huanghuashi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (212, NULL, NULL, NULL, '2026-05-25 09:42:04.881686', '2026-05-25 09:42:04.881686', '河间市', '130984', 3, 'hejianshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (213, NULL, NULL, NULL, '2026-05-25 09:42:04.888687', '2026-05-25 09:42:04.888687', '廊坊市', '1310', 2, 'langfangshi', 'L', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (214, NULL, NULL, NULL, '2026-05-25 09:42:04.898686', '2026-05-25 09:42:04.898686', '安次区', '131002', 3, 'anciqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (215, NULL, NULL, NULL, '2026-05-25 09:42:04.907680', '2026-05-25 09:42:04.907680', '广阳区', '131003', 3, 'guangyangqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (216, NULL, NULL, NULL, '2026-05-25 09:42:04.915686', '2026-05-25 09:42:04.915686', '固安县', '131022', 3, 'guanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (217, NULL, NULL, NULL, '2026-05-25 09:42:04.924686', '2026-05-25 09:42:04.924686', '永清县', '131023', 3, 'yongqingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (218, NULL, NULL, NULL, '2026-05-25 09:42:04.935681', '2026-05-25 09:42:04.935681', '香河县', '131024', 3, 'xianghexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (219, NULL, NULL, NULL, '2026-05-25 09:42:04.945609', '2026-05-25 09:42:04.945609', '大城县', '131025', 3, 'daichengxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (220, NULL, NULL, NULL, '2026-05-25 09:42:04.954607', '2026-05-25 09:42:04.954607', '文安县', '131026', 3, 'wenanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (221, NULL, NULL, NULL, '2026-05-25 09:42:04.963539', '2026-05-25 09:42:04.963539', '大厂回族自治县', '131028', 3, 'dachanghuizuzizhixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (222, NULL, NULL, NULL, '2026-05-25 09:42:04.972561', '2026-05-25 09:42:04.972561', '廊坊经济技术开发区', '131071', 3, 'langfangjingjijishukaifaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (223, NULL, NULL, NULL, '2026-05-25 09:42:04.981069', '2026-05-25 09:42:04.981069', '霸州市', '131081', 3, 'bazhoushi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (224, NULL, NULL, NULL, '2026-05-25 09:42:04.989490', '2026-05-25 09:42:04.990491', '三河市', '131082', 3, 'sanheshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (225, NULL, NULL, NULL, '2026-05-25 09:42:04.999049', '2026-05-25 09:42:04.999049', '衡水市', '1311', 2, 'hengshuishi', 'H', 1, NULL, '110114');
INSERT INTO `dvadmin_system_area` VALUES (226, NULL, NULL, NULL, '2026-05-25 09:42:05.009751', '2026-05-25 09:42:05.009751', '桃城区', '131102', 3, 'taochengqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (227, NULL, NULL, NULL, '2026-05-25 09:42:05.018434', '2026-05-25 09:42:05.018434', '冀州区', '131103', 3, 'jizhouqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (228, NULL, NULL, NULL, '2026-05-25 09:42:05.025505', '2026-05-25 09:42:05.025505', '枣强县', '131121', 3, 'zaoqiangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (229, NULL, NULL, NULL, '2026-05-25 09:42:05.033506', '2026-05-25 09:42:05.033506', '武邑县', '131122', 3, 'wuyixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (230, NULL, NULL, NULL, '2026-05-25 09:42:05.041459', '2026-05-25 09:42:05.041459', '武强县', '131123', 3, 'wuqiangxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (231, NULL, NULL, NULL, '2026-05-25 09:42:05.049487', '2026-05-25 09:42:05.049487', '饶阳县', '131124', 3, 'raoyangxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (232, NULL, NULL, NULL, '2026-05-25 09:42:05.057487', '2026-05-25 09:42:05.057487', '安平县', '131125', 3, 'anpingxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (233, NULL, NULL, NULL, '2026-05-25 09:42:05.065969', '2026-05-25 09:42:05.065969', '故城县', '131126', 3, 'guchengxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (234, NULL, NULL, NULL, '2026-05-25 09:42:05.076401', '2026-05-25 09:42:05.076401', '景县', '131127', 3, 'jingxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (235, NULL, NULL, NULL, '2026-05-25 09:42:05.083891', '2026-05-25 09:42:05.083891', '阜城县', '131128', 3, 'fuchengxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (236, NULL, NULL, NULL, '2026-05-25 09:42:05.091912', '2026-05-25 09:42:05.091912', '河北衡水高新技术产业开发区', '131171', 3, 'hebeihengshuigaoxinjishuchanyekaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (237, NULL, NULL, NULL, '2026-05-25 09:42:05.099930', '2026-05-25 09:42:05.099930', '衡水滨湖新区', '131172', 3, 'hengshuibinhuxinqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (238, NULL, NULL, NULL, '2026-05-25 09:42:05.110431', '2026-05-25 09:42:05.110431', '深州市', '131182', 3, 'shenzhoushi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (239, NULL, NULL, NULL, '2026-05-25 09:42:05.119573', '2026-04-03 10:10:04.972000', '山西省', '14', 1, 'shanxisheng', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (240, NULL, NULL, NULL, '2026-05-25 09:42:05.128866', '2026-05-25 09:42:05.128866', '太原市', '1401', 2, 'taiyuanshi', 'T', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (241, NULL, NULL, NULL, '2026-05-25 09:42:05.137866', '2026-05-25 09:42:05.137866', '小店区', '140105', 3, 'xiaodianqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (242, NULL, NULL, NULL, '2026-05-25 09:42:05.146638', '2026-05-25 09:42:05.146638', '迎泽区', '140106', 3, 'yingzequ', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (243, NULL, NULL, NULL, '2026-05-25 09:42:05.154633', '2026-05-25 09:42:05.154633', '杏花岭区', '140107', 3, 'xinghualingqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (244, NULL, NULL, NULL, '2026-05-25 09:42:05.164753', '2026-05-25 09:42:05.164753', '尖草坪区', '140108', 3, 'jiancaopingqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (245, NULL, NULL, NULL, '2026-05-25 09:42:05.174771', '2026-05-25 09:42:05.174771', '万柏林区', '140109', 3, 'wanbolinqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (246, NULL, NULL, NULL, '2026-05-25 09:42:05.182273', '2026-05-25 09:42:05.182273', '晋源区', '140110', 3, 'jinyuanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (247, NULL, NULL, NULL, '2026-05-25 09:42:05.191046', '2026-05-25 09:42:05.191046', '清徐县', '140121', 3, 'qingxuxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (248, NULL, NULL, NULL, '2026-05-25 09:42:05.199047', '2026-05-25 09:42:05.199047', '阳曲县', '140122', 3, 'yangquxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (249, NULL, NULL, NULL, '2026-05-25 09:42:05.207463', '2026-05-25 09:42:05.207463', '娄烦县', '140123', 3, 'loufanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (250, NULL, NULL, NULL, '2026-05-25 09:42:05.215470', '2026-05-25 09:42:05.215470', '山西转型综合改革示范区', '140171', 3, 'shanxizhuanxingzonghegaigeshifanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (251, NULL, NULL, NULL, '2026-05-25 09:42:05.224195', '2026-05-25 09:42:05.224195', '古交市', '140181', 3, 'gujiaoshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (252, NULL, NULL, NULL, '2026-05-25 09:42:05.231505', '2026-05-25 09:42:05.231505', '大同市', '1402', 2, 'datongshi', 'D', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (253, NULL, NULL, NULL, '2026-05-25 09:42:05.240520', '2026-05-25 09:42:05.240520', '新荣区', '140212', 3, 'xinrongqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (254, NULL, NULL, NULL, '2026-05-25 09:42:05.248519', '2026-05-25 09:42:05.248519', '平城区', '140213', 3, 'pingchengqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (255, NULL, NULL, NULL, '2026-05-25 09:42:05.259520', '2026-05-25 09:42:05.259520', '云冈区', '140214', 3, 'yungangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (256, NULL, NULL, NULL, '2026-05-25 09:42:05.267513', '2026-05-25 09:42:05.267513', '云州区', '140215', 3, 'yunzhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (257, NULL, NULL, NULL, '2026-05-25 09:42:05.275521', '2026-05-25 09:42:05.275521', '阳高县', '140221', 3, 'yanggaoxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (258, NULL, NULL, NULL, '2026-05-25 09:42:05.283519', '2026-05-25 09:42:05.283519', '天镇县', '140222', 3, 'tianzhenxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (259, NULL, NULL, NULL, '2026-05-25 09:42:05.291492', '2026-05-25 09:42:05.291492', '广灵县', '140223', 3, 'guanglingxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (260, NULL, NULL, NULL, '2026-05-25 09:42:05.299431', '2026-05-25 09:42:05.299431', '灵丘县', '140224', 3, 'lingqiuxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (261, NULL, NULL, NULL, '2026-05-25 09:42:05.307421', '2026-05-25 09:42:05.307421', '浑源县', '140225', 3, 'hunyuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (262, NULL, NULL, NULL, '2026-05-25 09:42:05.316775', '2026-05-25 09:42:05.316775', '左云县', '140226', 3, 'zuoyunxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (263, NULL, NULL, NULL, '2026-05-25 09:42:05.326241', '2026-05-25 09:42:05.326241', '山西大同经济开发区', '140271', 3, 'shanxidatongjingjikaifaqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (264, NULL, NULL, NULL, '2026-05-25 09:42:05.336251', '2026-05-25 09:42:05.336251', '阳泉市', '1403', 2, 'yangquanshi', 'Y', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (265, NULL, NULL, NULL, '2026-05-25 09:42:05.347891', '2026-05-25 09:42:05.347891', '城区', '140302', 3, 'chengqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (266, NULL, NULL, NULL, '2026-05-25 09:42:05.356885', '2026-05-25 09:42:05.356885', '矿区', '140303', 3, 'kuangqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (267, NULL, NULL, NULL, '2026-05-25 09:42:05.367152', '2026-05-25 09:42:05.367152', '郊区', '140311', 3, 'jiaoqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (268, NULL, NULL, NULL, '2026-05-25 09:42:05.375430', '2026-05-25 09:42:05.375430', '平定县', '140321', 3, 'pingdingxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (269, NULL, NULL, NULL, '2026-05-25 09:42:05.384428', '2026-05-25 09:42:05.384428', '盂县', '140322', 3, 'yuxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (270, NULL, NULL, NULL, '2026-05-25 09:42:05.392677', '2026-05-25 09:42:05.392677', '长治市', '1404', 2, 'zhangzhishi', 'Z', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (271, NULL, NULL, NULL, '2026-05-25 09:42:05.402590', '2026-05-25 09:42:05.402590', '潞州区', '140403', 3, 'luzhouqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (272, NULL, NULL, NULL, '2026-05-25 09:42:05.413590', '2026-05-25 09:42:05.413590', '上党区', '140404', 3, 'shangdangqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (273, NULL, NULL, NULL, '2026-05-25 09:42:05.422409', '2026-05-25 09:42:05.422409', '屯留区', '140405', 3, 'tunliuqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (274, NULL, NULL, NULL, '2026-05-25 09:42:05.430715', '2026-05-25 09:42:05.430715', '潞城区', '140406', 3, 'luchengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (275, NULL, NULL, NULL, '2026-05-25 09:42:05.438569', '2026-05-25 09:42:05.438569', '襄垣县', '140423', 3, 'xiangyuanxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (276, NULL, NULL, NULL, '2026-05-25 09:42:05.447560', '2026-05-25 09:42:05.447560', '平顺县', '140425', 3, 'pingshunxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (277, NULL, NULL, NULL, '2026-05-25 09:42:05.455570', '2026-05-25 09:42:05.455570', '黎城县', '140426', 3, 'lichengxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (278, NULL, NULL, NULL, '2026-05-25 09:42:05.470527', '2026-05-25 09:42:05.470527', '壶关县', '140427', 3, 'huguanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (279, NULL, NULL, NULL, '2026-05-25 09:42:05.482522', '2026-05-25 09:42:05.482522', '长子县', '140428', 3, 'zhangzixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (280, NULL, NULL, NULL, '2026-05-25 09:42:05.496930', '2026-05-25 09:42:05.496930', '武乡县', '140429', 3, 'wuxiangxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (281, NULL, NULL, NULL, '2026-05-25 09:42:05.509467', '2026-05-25 09:42:05.509467', '沁县', '140430', 3, 'qinxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (282, NULL, NULL, NULL, '2026-05-25 09:42:05.518692', '2026-05-25 09:42:05.518692', '沁源县', '140431', 3, 'qinyuanxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (283, NULL, NULL, NULL, '2026-05-25 09:42:05.526561', '2026-05-25 09:42:05.526561', '山西长治高新技术产业园区', '140471', 3, 'shanxizhangzhigaoxinjishuchanyeyuanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (284, NULL, NULL, NULL, '2026-05-25 09:42:05.535561', '2026-05-25 09:42:05.535561', '晋城市', '1405', 2, 'jinchengshi', 'J', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (285, NULL, NULL, NULL, '2026-05-25 09:42:05.544049', '2026-05-25 09:42:05.544049', '城区', '140502', 3, 'chengqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (286, NULL, NULL, NULL, '2026-05-25 09:42:05.552431', '2026-05-25 09:42:05.552431', '沁水县', '140521', 3, 'qinshuixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (287, NULL, NULL, NULL, '2026-05-25 09:42:05.560274', '2026-05-25 09:42:05.560274', '阳城县', '140522', 3, 'yangchengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (288, NULL, NULL, NULL, '2026-05-25 09:42:05.567284', '2026-05-25 09:42:05.567284', '陵川县', '140524', 3, 'lingchuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (289, NULL, NULL, NULL, '2026-05-25 09:42:05.575964', '2026-05-25 09:42:05.575964', '泽州县', '140525', 3, 'zezhouxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (290, NULL, NULL, NULL, '2026-05-25 09:42:05.584846', '2026-05-25 09:42:05.584846', '高平市', '140581', 3, 'gaopingshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (291, NULL, NULL, NULL, '2026-05-25 09:42:05.593807', '2026-05-25 09:42:05.593807', '朔州市', '1406', 2, 'shuozhoushi', 'S', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (292, NULL, NULL, NULL, '2026-05-25 09:42:05.603859', '2026-05-25 09:42:05.603859', '朔城区', '140602', 3, 'shuochengqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (293, NULL, NULL, NULL, '2026-05-25 09:42:05.612857', '2026-05-25 09:42:05.612857', '平鲁区', '140603', 3, 'pingluqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (294, NULL, NULL, NULL, '2026-05-25 09:42:05.621859', '2026-05-25 09:42:05.621859', '山阴县', '140621', 3, 'shanyinxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (295, NULL, NULL, NULL, '2026-05-25 09:42:05.631858', '2026-05-25 09:42:05.631858', '应县', '140622', 3, 'yingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (296, NULL, NULL, NULL, '2026-05-25 09:42:05.638859', '2026-05-25 09:42:05.638859', '右玉县', '140623', 3, 'youyuxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (297, NULL, NULL, NULL, '2026-05-25 09:42:05.647860', '2026-05-25 09:42:05.647860', '山西朔州经济开发区', '140671', 3, 'shanxishuozhoujingjikaifaqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (298, NULL, NULL, NULL, '2026-05-25 09:42:05.657858', '2026-05-25 09:42:05.657858', '怀仁市', '140681', 3, 'huairenshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (299, NULL, NULL, NULL, '2026-05-25 09:42:05.665858', '2026-05-25 09:42:05.665858', '晋中市', '1407', 2, 'jinzhongshi', 'J', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (300, NULL, NULL, NULL, '2026-05-25 09:42:05.675866', '2026-05-25 09:42:05.675866', '榆次区', '140702', 3, 'yuciqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (301, NULL, NULL, NULL, '2026-05-25 09:42:05.684859', '2026-05-25 09:42:05.684859', '太谷区', '140703', 3, 'taiguqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (302, NULL, NULL, NULL, '2026-05-25 09:42:05.696860', '2026-05-25 09:42:05.696860', '榆社县', '140721', 3, 'yushexian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (303, NULL, NULL, NULL, '2026-05-25 09:42:05.705874', '2026-05-25 09:42:05.705874', '左权县', '140722', 3, 'zuoquanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (304, NULL, NULL, NULL, '2026-05-25 09:42:05.712874', '2026-05-25 09:42:05.712874', '和顺县', '140723', 3, 'heshunxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (305, NULL, NULL, NULL, '2026-05-25 09:42:05.720977', '2026-05-25 09:42:05.720977', '昔阳县', '140724', 3, 'xiyangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (306, NULL, NULL, NULL, '2026-05-25 09:42:05.730635', '2026-05-25 09:42:05.730635', '寿阳县', '140725', 3, 'shouyangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (307, NULL, NULL, NULL, '2026-05-25 09:42:05.738635', '2026-05-25 09:42:05.738635', '祁县', '140727', 3, 'qixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (308, NULL, NULL, NULL, '2026-05-25 09:42:05.751634', '2026-05-25 09:42:05.751634', '平遥县', '140728', 3, 'pingyaoxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (309, NULL, NULL, NULL, '2026-05-25 09:42:05.761640', '2026-05-25 09:42:05.761640', '灵石县', '140729', 3, 'lingshixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (310, NULL, NULL, NULL, '2026-05-25 09:42:05.768652', '2026-05-25 09:42:05.768652', '介休市', '140781', 3, 'jiexiushi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (311, NULL, NULL, NULL, '2026-05-25 09:42:05.775649', '2026-05-25 09:42:05.775649', '运城市', '1408', 2, 'yunchengshi', 'Y', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (312, NULL, NULL, NULL, '2026-05-25 09:42:05.783871', '2026-05-25 09:42:05.783871', '盐湖区', '140802', 3, 'yanhuqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (313, NULL, NULL, NULL, '2026-05-25 09:42:05.792865', '2026-05-25 09:42:05.792865', '临猗县', '140821', 3, 'linyixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (314, NULL, NULL, NULL, '2026-05-25 09:42:05.801525', '2026-05-25 09:42:05.801525', '万荣县', '140822', 3, 'wanrongxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (315, NULL, NULL, NULL, '2026-05-25 09:42:05.811526', '2026-05-25 09:42:05.811526', '闻喜县', '140823', 3, 'wenxixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (316, NULL, NULL, NULL, '2026-05-25 09:42:05.819523', '2026-05-25 09:42:05.819523', '稷山县', '140824', 3, 'jishanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (317, NULL, NULL, NULL, '2026-05-25 09:42:05.829516', '2026-05-25 09:42:05.829516', '新绛县', '140825', 3, 'xinjiangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (318, NULL, NULL, NULL, '2026-05-25 09:42:05.838013', '2026-05-25 09:42:05.838013', '绛县', '140826', 3, 'jiangxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (319, NULL, NULL, NULL, '2026-05-25 09:42:05.846512', '2026-05-25 09:42:05.846512', '垣曲县', '140827', 3, 'yuanquxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (320, NULL, NULL, NULL, '2026-05-25 09:42:05.854040', '2026-05-25 09:42:05.854040', '夏县', '140828', 3, 'xiaxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (321, NULL, NULL, NULL, '2026-05-25 09:42:05.863049', '2026-05-25 09:42:05.863049', '平陆县', '140829', 3, 'pingluxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (322, NULL, NULL, NULL, '2026-05-25 09:42:05.872539', '2026-05-25 09:42:05.872539', '芮城县', '140830', 3, 'ruichengxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (323, NULL, NULL, NULL, '2026-05-25 09:42:05.883540', '2026-05-25 09:42:05.883540', '永济市', '140881', 3, 'yongjishi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (324, NULL, NULL, NULL, '2026-05-25 09:42:05.893539', '2026-05-25 09:42:05.893539', '河津市', '140882', 3, 'hejinshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (325, NULL, NULL, NULL, '2026-05-25 09:42:05.901539', '2026-05-25 09:42:05.901539', '忻州市', '1409', 2, 'xinzhoushi', 'X', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (326, NULL, NULL, NULL, '2026-05-25 09:42:05.909908', '2026-05-25 09:42:05.909908', '忻府区', '140902', 3, 'xinfuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (327, NULL, NULL, NULL, '2026-05-25 09:42:05.920918', '2026-05-25 09:42:05.920918', '定襄县', '140921', 3, 'dingxiangxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (328, NULL, NULL, NULL, '2026-05-25 09:42:05.928915', '2026-05-25 09:42:05.928915', '五台县', '140922', 3, 'wutaixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (329, NULL, NULL, NULL, '2026-05-25 09:42:05.937907', '2026-05-25 09:42:05.937907', '代县', '140923', 3, 'daixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (330, NULL, NULL, NULL, '2026-05-25 09:42:05.947908', '2026-05-25 09:42:05.947908', '繁峙县', '140924', 3, 'fanzhixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (331, NULL, NULL, NULL, '2026-05-25 09:42:05.955916', '2026-05-25 09:42:05.955916', '宁武县', '140925', 3, 'ningwuxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (332, NULL, NULL, NULL, '2026-05-25 09:42:05.963915', '2026-05-25 09:42:05.963915', '静乐县', '140926', 3, 'jinglexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (333, NULL, NULL, NULL, '2026-05-25 09:42:05.972036', '2026-05-25 09:42:05.972036', '神池县', '140927', 3, 'shenchixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (334, NULL, NULL, NULL, '2026-05-25 09:42:05.981036', '2026-05-25 09:42:05.981036', '五寨县', '140928', 3, 'wuzhaixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (335, NULL, NULL, NULL, '2026-05-25 09:42:05.991043', '2026-05-25 09:42:05.991043', '岢岚县', '140929', 3, 'kelanxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (336, NULL, NULL, NULL, '2026-05-25 09:42:06.000133', '2026-05-25 09:42:06.000133', '河曲县', '140930', 3, 'hequxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (337, NULL, NULL, NULL, '2026-05-25 09:42:06.009140', '2026-05-25 09:42:06.009140', '保德县', '140931', 3, 'baodexian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (338, NULL, NULL, NULL, '2026-05-25 09:42:06.018134', '2026-05-25 09:42:06.018134', '偏关县', '140932', 3, 'pianguanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (339, NULL, NULL, NULL, '2026-05-25 09:42:06.027132', '2026-05-25 09:42:06.027132', '五台山风景名胜区', '140971', 3, 'wutaishanfengjingmingshengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (340, NULL, NULL, NULL, '2026-05-25 09:42:06.035142', '2026-05-25 09:42:06.035142', '原平市', '140981', 3, 'yuanpingshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (341, NULL, NULL, NULL, '2026-05-25 09:42:06.043141', '2026-05-25 09:42:06.043141', '临汾市', '1410', 2, 'linfenshi', 'L', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (342, NULL, NULL, NULL, '2026-05-25 09:42:06.052140', '2026-05-25 09:42:06.052140', '尧都区', '141002', 3, 'yaodouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (343, NULL, NULL, NULL, '2026-05-25 09:42:06.061138', '2026-05-25 09:42:06.061138', '曲沃县', '141021', 3, 'quwoxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (344, NULL, NULL, NULL, '2026-05-25 09:42:06.071140', '2026-05-25 09:42:06.071140', '翼城县', '141022', 3, 'yichengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (345, NULL, NULL, NULL, '2026-05-25 09:42:06.080140', '2026-05-25 09:42:06.080140', '襄汾县', '141023', 3, 'xiangfenxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (346, NULL, NULL, NULL, '2026-05-25 09:42:06.087140', '2026-05-25 09:42:06.087140', '洪洞县', '141024', 3, 'hongdongxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (347, NULL, NULL, NULL, '2026-05-25 09:42:06.096289', '2026-05-25 09:42:06.096289', '古县', '141025', 3, 'guxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (348, NULL, NULL, NULL, '2026-05-25 09:42:06.105290', '2026-05-25 09:42:06.105290', '安泽县', '141026', 3, 'anzexian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (349, NULL, NULL, NULL, '2026-05-25 09:42:06.112861', '2026-05-25 09:42:06.112861', '浮山县', '141027', 3, 'fushanxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (350, NULL, NULL, NULL, '2026-05-25 09:42:06.120925', '2026-05-25 09:42:06.120925', '吉县', '141028', 3, 'jixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (351, NULL, NULL, NULL, '2026-05-25 09:42:06.128923', '2026-05-25 09:42:06.128923', '乡宁县', '141029', 3, 'xiangningxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (352, NULL, NULL, NULL, '2026-05-25 09:42:06.137980', '2026-05-25 09:42:06.137980', '大宁县', '141030', 3, 'daningxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (353, NULL, NULL, NULL, '2026-05-25 09:42:06.145981', '2026-05-25 09:42:06.145981', '隰县', '141031', 3, 'xixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (354, NULL, NULL, NULL, '2026-05-25 09:42:06.153979', '2026-05-25 09:42:06.153979', '永和县', '141032', 3, 'yonghexian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (355, NULL, NULL, NULL, '2026-05-25 09:42:06.161973', '2026-05-25 09:42:06.161973', '蒲县', '141033', 3, 'puxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (356, NULL, NULL, NULL, '2026-05-25 09:42:06.169978', '2026-05-25 09:42:06.169978', '汾西县', '141034', 3, 'fenxixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (357, NULL, NULL, NULL, '2026-05-25 09:42:06.177979', '2026-05-25 09:42:06.177979', '侯马市', '141081', 3, 'houmashi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (358, NULL, NULL, NULL, '2026-05-25 09:42:06.186979', '2026-05-25 09:42:06.186979', '霍州市', '141082', 3, 'huozhoushi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (359, NULL, NULL, NULL, '2026-05-25 09:42:06.195980', '2026-05-25 09:42:06.195980', '吕梁市', '1411', 2, 'lvliangshi', 'L', 1, NULL, '110115');
INSERT INTO `dvadmin_system_area` VALUES (360, NULL, NULL, NULL, '2026-05-25 09:42:06.202982', '2026-05-25 09:42:06.202982', '离石区', '141102', 3, 'lishiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (361, NULL, NULL, NULL, '2026-05-25 09:42:06.211972', '2026-05-25 09:42:06.211972', '文水县', '141121', 3, 'wenshuixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (362, NULL, NULL, NULL, '2026-05-25 09:42:06.219979', '2026-05-25 09:42:06.219979', '交城县', '141122', 3, 'jiaochengxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (363, NULL, NULL, NULL, '2026-05-25 09:42:06.230185', '2026-05-25 09:42:06.230185', '兴县', '141123', 3, 'xingxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (364, NULL, NULL, NULL, '2026-05-25 09:42:06.239193', '2026-05-25 09:42:06.239193', '临县', '141124', 3, 'linxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (365, NULL, NULL, NULL, '2026-05-25 09:42:06.247194', '2026-05-25 09:42:06.247194', '柳林县', '141125', 3, 'liulinxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (366, NULL, NULL, NULL, '2026-05-25 09:42:06.255193', '2026-05-25 09:42:06.255193', '石楼县', '141126', 3, 'shilouxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (367, NULL, NULL, NULL, '2026-05-25 09:42:06.264184', '2026-05-25 09:42:06.264184', '岚县', '141127', 3, 'lanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (368, NULL, NULL, NULL, '2026-05-25 09:42:06.272194', '2026-05-25 09:42:06.272194', '方山县', '141128', 3, 'fangshanxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (369, NULL, NULL, NULL, '2026-05-25 09:42:06.280192', '2026-05-25 09:42:06.280192', '中阳县', '141129', 3, 'zhongyangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (370, NULL, NULL, NULL, '2026-05-25 09:42:06.288194', '2026-05-25 09:42:06.288194', '交口县', '141130', 3, 'jiaokouxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (371, NULL, NULL, NULL, '2026-05-25 09:42:06.297194', '2026-05-25 09:42:06.297194', '孝义市', '141181', 3, 'xiaoyishi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (372, NULL, NULL, NULL, '2026-05-25 09:42:06.307193', '2026-05-25 09:42:06.307193', '汾阳市', '141182', 3, 'fenyangshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (373, NULL, NULL, NULL, '2026-05-25 09:42:06.315193', '2026-04-03 10:10:04.975000', '内蒙古自治区', '15', 1, 'neimengguzizhiqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (374, NULL, NULL, NULL, '2026-05-25 09:42:06.325193', '2026-05-25 09:42:06.325193', '呼和浩特市', '1501', 2, 'huhehaoteshi', 'H', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (375, NULL, NULL, NULL, '2026-05-25 09:42:06.333193', '2026-05-25 09:42:06.333193', '新城区', '150102', 3, 'xinchengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (376, NULL, NULL, NULL, '2026-05-25 09:42:06.342186', '2026-05-25 09:42:06.342186', '回民区', '150103', 3, 'huiminqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (377, NULL, NULL, NULL, '2026-05-25 09:42:06.350187', '2026-05-25 09:42:06.350187', '玉泉区', '150104', 3, 'yuquanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (378, NULL, NULL, NULL, '2026-05-25 09:42:06.359194', '2026-05-25 09:42:06.359194', '赛罕区', '150105', 3, 'saihanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (379, NULL, NULL, NULL, '2026-05-25 09:42:06.370193', '2026-05-25 09:42:06.370193', '土默特左旗', '150121', 3, 'tumotezuoqi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (380, NULL, NULL, NULL, '2026-05-25 09:42:06.378192', '2026-05-25 09:42:06.378192', '托克托县', '150122', 3, 'tuoketuoxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (381, NULL, NULL, NULL, '2026-05-25 09:42:06.385697', '2026-05-25 09:42:06.385697', '和林格尔县', '150123', 3, 'helingeerxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (382, NULL, NULL, NULL, '2026-05-25 09:42:06.394711', '2026-05-25 09:42:06.394711', '清水河县', '150124', 3, 'qingshuihexian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (383, NULL, NULL, NULL, '2026-05-25 09:42:06.403713', '2026-05-25 09:42:06.403713', '武川县', '150125', 3, 'wuchuanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (384, NULL, NULL, NULL, '2026-05-25 09:42:06.411713', '2026-05-25 09:42:06.411713', '呼和浩特经济技术开发区', '150172', 3, 'huhehaotejingjijishukaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (385, NULL, NULL, NULL, '2026-05-25 09:42:06.421707', '2026-05-25 09:42:06.421707', '包头市', '1502', 2, 'baotoushi', 'B', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (386, NULL, NULL, NULL, '2026-05-25 09:42:06.430712', '2026-05-25 09:42:06.430712', '东河区', '150202', 3, 'donghequ', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (387, NULL, NULL, NULL, '2026-05-25 09:42:06.438705', '2026-05-25 09:42:06.438705', '昆都仑区', '150203', 3, 'kundoulunqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (388, NULL, NULL, NULL, '2026-05-25 09:42:06.446713', '2026-05-25 09:42:06.446713', '青山区', '150204', 3, 'qingshanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (389, NULL, NULL, NULL, '2026-05-25 09:42:06.456720', '2026-05-25 09:42:06.456720', '石拐区', '150205', 3, 'shiguaiqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (390, NULL, NULL, NULL, '2026-05-25 09:42:06.475464', '2026-05-25 09:42:06.475464', '白云鄂博矿区', '150206', 3, 'baiyunebokuangqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (391, NULL, NULL, NULL, '2026-05-25 09:42:06.488463', '2026-05-25 09:42:06.488463', '九原区', '150207', 3, 'jiuyuanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (392, NULL, NULL, NULL, '2026-05-25 09:42:06.502685', '2026-05-25 09:42:06.502685', '土默特右旗', '150221', 3, 'tumoteyouqi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (393, NULL, NULL, NULL, '2026-05-25 09:42:06.508676', '2026-05-25 09:42:06.508676', '固阳县', '150222', 3, 'guyangxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (394, NULL, NULL, NULL, '2026-05-25 09:42:06.513679', '2026-05-25 09:42:06.513679', '达尔罕茂明安联合旗', '150223', 3, 'daerhanmaominganlianheqi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (395, NULL, NULL, NULL, '2026-05-25 09:42:06.518685', '2026-05-25 09:42:06.518685', '包头稀土高新技术产业开发区', '150271', 3, 'baotouxitugaoxinjishuchanyekaifaqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (396, NULL, NULL, NULL, '2026-05-25 09:42:06.522683', '2026-05-25 09:42:06.522683', '乌海市', '1503', 2, 'wuhaishi', 'W', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (397, NULL, NULL, NULL, '2026-05-25 09:42:06.531685', '2026-05-25 09:42:06.531685', '海勃湾区', '150302', 3, 'haibowanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (398, NULL, NULL, NULL, '2026-05-25 09:42:06.540684', '2026-05-25 09:42:06.540684', '海南区', '150303', 3, 'hainanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (399, NULL, NULL, NULL, '2026-05-25 09:42:06.549688', '2026-05-25 09:42:06.549688', '乌达区', '150304', 3, 'wudaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (400, NULL, NULL, NULL, '2026-05-25 09:42:06.556683', '2026-05-25 09:42:06.556683', '赤峰市', '1504', 2, 'chifengshi', 'C', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (401, NULL, NULL, NULL, '2026-05-25 09:42:06.564683', '2026-05-25 09:42:06.564683', '红山区', '150402', 3, 'hongshanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (402, NULL, NULL, NULL, '2026-05-25 09:42:06.572684', '2026-05-25 09:42:06.572684', '元宝山区', '150403', 3, 'yuanbaoshanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (403, NULL, NULL, NULL, '2026-05-25 09:42:06.580838', '2026-05-25 09:42:06.580838', '松山区', '150404', 3, 'songshanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (404, NULL, NULL, NULL, '2026-05-25 09:42:06.588474', '2026-05-25 09:42:06.588474', '阿鲁科尔沁旗', '150421', 3, 'alukeerqinqi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (405, NULL, NULL, NULL, '2026-05-25 09:42:06.596468', '2026-05-25 09:42:06.596468', '巴林左旗', '150422', 3, 'balinzuoqi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (406, NULL, NULL, NULL, '2026-05-25 09:42:06.606461', '2026-05-25 09:42:06.606461', '巴林右旗', '150423', 3, 'balinyouqi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (407, NULL, NULL, NULL, '2026-05-25 09:42:06.615471', '2026-05-25 09:42:06.615471', '林西县', '150424', 3, 'linxixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (408, NULL, NULL, NULL, '2026-05-25 09:42:06.623462', '2026-05-25 09:42:06.623462', '克什克腾旗', '150425', 3, 'keshenketengqi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (409, NULL, NULL, NULL, '2026-05-25 09:42:06.631467', '2026-05-25 09:42:06.631467', '翁牛特旗', '150426', 3, 'wengniuteqi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (410, NULL, NULL, NULL, '2026-05-25 09:42:06.640472', '2026-05-25 09:42:06.640472', '喀喇沁旗', '150428', 3, 'kalaqinqi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (411, NULL, NULL, NULL, '2026-05-25 09:42:06.648469', '2026-05-25 09:42:06.648469', '宁城县', '150429', 3, 'ningchengxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (412, NULL, NULL, NULL, '2026-05-25 09:42:06.655979', '2026-05-25 09:42:06.655979', '敖汉旗', '150430', 3, 'aohanqi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (413, NULL, NULL, NULL, '2026-05-25 09:42:06.663988', '2026-05-25 09:42:06.663988', '通辽市', '1505', 2, 'tongliaoshi', 'T', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (414, NULL, NULL, NULL, '2026-05-25 09:42:06.671989', '2026-05-25 09:42:06.671989', '科尔沁区', '150502', 3, 'keerqinqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (415, NULL, NULL, NULL, '2026-05-25 09:42:06.680987', '2026-05-25 09:42:06.680987', '科尔沁左翼中旗', '150521', 3, 'keerqinzuoyizhongqi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (416, NULL, NULL, NULL, '2026-05-25 09:42:06.688989', '2026-05-25 09:42:06.688989', '科尔沁左翼后旗', '150522', 3, 'keerqinzuoyihouqi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (417, NULL, NULL, NULL, '2026-05-25 09:42:06.696988', '2026-05-25 09:42:06.696988', '开鲁县', '150523', 3, 'kailuxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (418, NULL, NULL, NULL, '2026-05-25 09:42:06.705911', '2026-05-25 09:42:06.705911', '库伦旗', '150524', 3, 'kulunqi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (419, NULL, NULL, NULL, '2026-05-25 09:42:06.712913', '2026-05-25 09:42:06.712913', '奈曼旗', '150525', 3, 'naimanqi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (420, NULL, NULL, NULL, '2026-05-25 09:42:06.721588', '2026-05-25 09:42:06.721588', '扎鲁特旗', '150526', 3, 'zhaluteqi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (421, NULL, NULL, NULL, '2026-05-25 09:42:06.729587', '2026-05-25 09:42:06.729587', '通辽经济技术开发区', '150571', 3, 'tongliaojingjijishukaifaqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (422, NULL, NULL, NULL, '2026-05-25 09:42:06.738585', '2026-05-25 09:42:06.738585', '霍林郭勒市', '150581', 3, 'huolinguoleishi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (423, NULL, NULL, NULL, '2026-05-25 09:42:06.746588', '2026-05-25 09:42:06.746588', '鄂尔多斯市', '1506', 2, 'eerduosishi', 'E', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (424, NULL, NULL, NULL, '2026-05-25 09:42:06.757579', '2026-05-25 09:42:06.757579', '东胜区', '150602', 3, 'dongshengqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (425, NULL, NULL, NULL, '2026-05-25 09:42:06.766588', '2026-05-25 09:42:06.766588', '康巴什区', '150603', 3, 'kangbashenqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (426, NULL, NULL, NULL, '2026-05-25 09:42:06.775586', '2026-05-25 09:42:06.775586', '达拉特旗', '150621', 3, 'dalateqi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (427, NULL, NULL, NULL, '2026-05-25 09:42:06.783586', '2026-05-25 09:42:06.783586', '准格尔旗', '150622', 3, 'zhungeerqi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (428, NULL, NULL, NULL, '2026-05-25 09:42:06.792587', '2026-05-25 09:42:06.792587', '鄂托克前旗', '150623', 3, 'etuokeqianqi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (429, NULL, NULL, NULL, '2026-05-25 09:42:06.800757', '2026-05-25 09:42:06.800757', '鄂托克旗', '150624', 3, 'etuokeqi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (430, NULL, NULL, NULL, '2026-05-25 09:42:06.809750', '2026-05-25 09:42:06.809750', '杭锦旗', '150625', 3, 'hangjinqi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (431, NULL, NULL, NULL, '2026-05-25 09:42:06.819262', '2026-05-25 09:42:06.819262', '乌审旗', '150626', 3, 'wushenqi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (432, NULL, NULL, NULL, '2026-05-25 09:42:06.826778', '2026-05-25 09:42:06.826778', '伊金霍洛旗', '150627', 3, 'yijinhuoluoqi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (433, NULL, NULL, NULL, '2026-05-25 09:42:06.834780', '2026-05-25 09:42:06.834780', '呼伦贝尔市', '1507', 2, 'hulunbeiershi', 'H', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (434, NULL, NULL, NULL, '2026-05-25 09:42:06.843776', '2026-05-25 09:42:06.843776', '海拉尔区', '150702', 3, 'hailaerqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (435, NULL, NULL, NULL, '2026-05-25 09:42:06.853237', '2026-05-25 09:42:06.853237', '扎赉诺尔区', '150703', 3, 'zhalainuoerqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (436, NULL, NULL, NULL, '2026-05-25 09:42:06.861130', '2026-05-25 09:42:06.861130', '阿荣旗', '150721', 3, 'arongqi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (437, NULL, NULL, NULL, '2026-05-25 09:42:06.869450', '2026-05-25 09:42:06.869450', '莫力达瓦达斡尔族自治旗', '150722', 3, 'molidawadawoerzuzizhiqi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (438, NULL, NULL, NULL, '2026-05-25 09:42:06.878448', '2026-05-25 09:42:06.878448', '鄂伦春自治旗', '150723', 3, 'elunchunzizhiqi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (439, NULL, NULL, NULL, '2026-05-25 09:42:06.887976', '2026-05-25 09:42:06.887976', '鄂温克族自治旗', '150724', 3, 'ewenkezuzizhiqi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (440, NULL, NULL, NULL, '2026-05-25 09:42:06.897381', '2026-05-25 09:42:06.897381', '陈巴尔虎旗', '150725', 3, 'chenbaerhuqi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (441, NULL, NULL, NULL, '2026-05-25 09:42:06.906382', '2026-05-25 09:42:06.906382', '新巴尔虎左旗', '150726', 3, 'xinbaerhuzuoqi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (442, NULL, NULL, NULL, '2026-05-25 09:42:06.920381', '2026-05-25 09:42:06.920381', '新巴尔虎右旗', '150727', 3, 'xinbaerhuyouqi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (443, NULL, NULL, NULL, '2026-05-25 09:42:06.932376', '2026-05-25 09:42:06.932376', '满洲里市', '150781', 3, 'manzhoulishi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (444, NULL, NULL, NULL, '2026-05-25 09:42:06.940382', '2026-05-25 09:42:06.940382', '牙克石市', '150782', 3, 'yakeshishi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (445, NULL, NULL, NULL, '2026-05-25 09:42:06.949385', '2026-05-25 09:42:06.949385', '扎兰屯市', '150783', 3, 'zhalantunshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (446, NULL, NULL, NULL, '2026-05-25 09:42:06.957381', '2026-05-25 09:42:06.957381', '额尔古纳市', '150784', 3, 'eergunashi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (447, NULL, NULL, NULL, '2026-05-25 09:42:06.965375', '2026-05-25 09:42:06.965375', '根河市', '150785', 3, 'genheshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (448, NULL, NULL, NULL, '2026-05-25 09:42:06.975417', '2026-05-25 09:42:06.975417', '巴彦淖尔市', '1508', 2, 'bayannaoershi', 'B', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (449, NULL, NULL, NULL, '2026-05-25 09:42:06.983417', '2026-05-25 09:42:06.983417', '临河区', '150802', 3, 'linhequ', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (450, NULL, NULL, NULL, '2026-05-25 09:42:06.990417', '2026-05-25 09:42:06.990417', '五原县', '150821', 3, 'wuyuanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (451, NULL, NULL, NULL, '2026-05-25 09:42:06.998777', '2026-05-25 09:42:06.998777', '磴口县', '150822', 3, 'dengkouxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (452, NULL, NULL, NULL, '2026-05-25 09:42:07.006813', '2026-05-25 09:42:07.006813', '乌拉特前旗', '150823', 3, 'wulateqianqi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (453, NULL, NULL, NULL, '2026-05-25 09:42:07.014813', '2026-05-25 09:42:07.014813', '乌拉特中旗', '150824', 3, 'wulatezhongqi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (454, NULL, NULL, NULL, '2026-05-25 09:42:07.023092', '2026-05-25 09:42:07.023092', '乌拉特后旗', '150825', 3, 'wulatehouqi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (455, NULL, NULL, NULL, '2026-05-25 09:42:07.031791', '2026-05-25 09:42:07.031791', '杭锦后旗', '150826', 3, 'hangjinhouqi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (456, NULL, NULL, NULL, '2026-05-25 09:42:07.038084', '2026-05-25 09:42:07.038084', '乌兰察布市', '1509', 2, 'wulanchabushi', 'W', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (457, NULL, NULL, NULL, '2026-05-25 09:42:07.047090', '2026-05-25 09:42:07.047090', '集宁区', '150902', 3, 'jiningqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (458, NULL, NULL, NULL, '2026-05-25 09:42:07.055857', '2026-05-25 09:42:07.055857', '卓资县', '150921', 3, 'zhuozixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (459, NULL, NULL, NULL, '2026-05-25 09:42:07.063939', '2026-05-25 09:42:07.063939', '化德县', '150922', 3, 'huadexian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (460, NULL, NULL, NULL, '2026-05-25 09:42:07.071810', '2026-05-25 09:42:07.071810', '商都县', '150923', 3, 'shangdouxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (461, NULL, NULL, NULL, '2026-05-25 09:42:07.081804', '2026-05-25 09:42:07.081804', '兴和县', '150924', 3, 'xinghexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (462, NULL, NULL, NULL, '2026-05-25 09:42:07.089811', '2026-05-25 09:42:07.089811', '凉城县', '150925', 3, 'liangchengxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (463, NULL, NULL, NULL, '2026-05-25 09:42:07.097885', '2026-05-25 09:42:07.097885', '察哈尔右翼前旗', '150926', 3, 'chahaeryouyiqianqi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (464, NULL, NULL, NULL, '2026-05-25 09:42:07.105110', '2026-05-25 09:42:07.105110', '察哈尔右翼中旗', '150927', 3, 'chahaeryouyizhongqi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (465, NULL, NULL, NULL, '2026-05-25 09:42:07.113106', '2026-05-25 09:42:07.113106', '察哈尔右翼后旗', '150928', 3, 'chahaeryouyihouqi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (466, NULL, NULL, NULL, '2026-05-25 09:42:07.121795', '2026-05-25 09:42:07.121795', '四子王旗', '150929', 3, 'siziwangqi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (467, NULL, NULL, NULL, '2026-05-25 09:42:07.131013', '2026-05-25 09:42:07.131013', '丰镇市', '150981', 3, 'fengzhenshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (468, NULL, NULL, NULL, '2026-05-25 09:42:07.140014', '2026-05-25 09:42:07.140014', '兴安盟', '1522', 2, 'xinganmeng', 'X', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (469, NULL, NULL, NULL, '2026-05-25 09:42:07.148122', '2026-05-25 09:42:07.148122', '乌兰浩特市', '152201', 3, 'wulanhaoteshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (470, NULL, NULL, NULL, '2026-05-25 09:42:07.157352', '2026-05-25 09:42:07.157352', '阿尔山市', '152202', 3, 'aershanshi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (471, NULL, NULL, NULL, '2026-05-25 09:42:07.166354', '2026-05-25 09:42:07.166354', '科尔沁右翼前旗', '152221', 3, 'keerqinyouyiqianqi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (472, NULL, NULL, NULL, '2026-05-25 09:42:07.176837', '2026-05-25 09:42:07.176837', '科尔沁右翼中旗', '152222', 3, 'keerqinyouyizhongqi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (473, NULL, NULL, NULL, '2026-05-25 09:42:07.184823', '2026-05-25 09:42:07.184823', '扎赉特旗', '152223', 3, 'zhalaiteqi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (474, NULL, NULL, NULL, '2026-05-25 09:42:07.194314', '2026-05-25 09:42:07.194314', '突泉县', '152224', 3, 'tuquanxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (475, NULL, NULL, NULL, '2026-05-25 09:42:07.201704', '2026-05-25 09:42:07.201704', '锡林郭勒盟', '1525', 2, 'xilinguoleimeng', 'X', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (476, NULL, NULL, NULL, '2026-05-25 09:42:07.209824', '2026-05-25 09:42:07.209824', '二连浩特市', '152501', 3, 'erlianhaoteshi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (477, NULL, NULL, NULL, '2026-05-25 09:42:07.217821', '2026-05-25 09:42:07.217821', '锡林浩特市', '152502', 3, 'xilinhaoteshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (478, NULL, NULL, NULL, '2026-05-25 09:42:07.225821', '2026-05-25 09:42:07.225821', '阿巴嘎旗', '152522', 3, 'abagaqi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (479, NULL, NULL, NULL, '2026-05-25 09:42:07.234821', '2026-05-25 09:42:07.234821', '苏尼特左旗', '152523', 3, 'sunitezuoqi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (480, NULL, NULL, NULL, '2026-05-25 09:42:07.242823', '2026-05-25 09:42:07.242823', '苏尼特右旗', '152524', 3, 'suniteyouqi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (481, NULL, NULL, NULL, '2026-05-25 09:42:07.252822', '2026-05-25 09:42:07.252822', '东乌珠穆沁旗', '152525', 3, 'dongwuzhumuqinqi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (482, NULL, NULL, NULL, '2026-05-25 09:42:07.261817', '2026-05-25 09:42:07.261817', '西乌珠穆沁旗', '152526', 3, 'xiwuzhumuqinqi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (483, NULL, NULL, NULL, '2026-05-25 09:42:07.271049', '2026-05-25 09:42:07.271049', '太仆寺旗', '152527', 3, 'taipusiqi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (484, NULL, NULL, NULL, '2026-05-25 09:42:07.278940', '2026-05-25 09:42:07.278940', '镶黄旗', '152528', 3, 'xianghuangqi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (485, NULL, NULL, NULL, '2026-05-25 09:42:07.287941', '2026-05-25 09:42:07.287941', '正镶白旗', '152529', 3, 'zhengxiangbaiqi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (486, NULL, NULL, NULL, '2026-05-25 09:42:07.294892', '2026-05-25 09:42:07.294892', '正蓝旗', '152530', 3, 'zhenglanqi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (487, NULL, NULL, NULL, '2026-05-25 09:42:07.302893', '2026-05-25 09:42:07.302893', '多伦县', '152531', 3, 'duolunxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (488, NULL, NULL, NULL, '2026-05-25 09:42:07.311891', '2026-05-25 09:42:07.311891', '乌拉盖管委会', '152571', 3, 'wulagaiguanweihui', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (489, NULL, NULL, NULL, '2026-05-25 09:42:07.319686', '2026-05-25 09:42:07.319686', '阿拉善盟', '1529', 2, 'alashanmeng', 'A', 1, NULL, '110116');
INSERT INTO `dvadmin_system_area` VALUES (490, NULL, NULL, NULL, '2026-05-25 09:42:07.326681', '2026-05-25 09:42:07.326681', '阿拉善左旗', '152921', 3, 'alashanzuoqi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (491, NULL, NULL, NULL, '2026-05-25 09:42:07.335146', '2026-05-25 09:42:07.335146', '阿拉善右旗', '152922', 3, 'alashanyouqi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (492, NULL, NULL, NULL, '2026-05-25 09:42:07.341649', '2026-05-25 09:42:07.341649', '额济纳旗', '152923', 3, 'ejinaqi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (493, NULL, NULL, NULL, '2026-05-25 09:42:07.349648', '2026-05-25 09:42:07.349648', '内蒙古阿拉善经济开发区', '152971', 3, 'neimenggualashanjingjikaifaqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (494, NULL, NULL, NULL, '2026-05-25 09:42:07.355839', '2026-04-03 10:10:04.980000', '辽宁省', '21', 1, 'liaoningsheng', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (495, NULL, NULL, NULL, '2026-05-25 09:42:07.364821', '2026-05-25 09:42:07.364821', '沈阳市', '2101', 2, 'shenyangshi', 'S', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (496, NULL, NULL, NULL, '2026-05-25 09:42:07.374007', '2026-05-25 09:42:07.374007', '和平区', '210102', 3, 'hepingqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (497, NULL, NULL, NULL, '2026-05-25 09:42:07.383010', '2026-05-25 09:42:07.383010', '沈河区', '210103', 3, 'shenhequ', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (498, NULL, NULL, NULL, '2026-05-25 09:42:07.394012', '2026-05-25 09:42:07.394012', '大东区', '210104', 3, 'dadongqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (499, NULL, NULL, NULL, '2026-05-25 09:42:07.402809', '2026-05-25 09:42:07.402809', '皇姑区', '210105', 3, 'huangguqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (500, NULL, NULL, NULL, '2026-05-25 09:42:07.410122', '2026-05-25 09:42:07.410122', '铁西区', '210106', 3, 'tiexiqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (501, NULL, NULL, NULL, '2026-05-25 09:42:07.419121', '2026-05-25 09:42:07.419121', '苏家屯区', '210111', 3, 'sujiatunqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (502, NULL, NULL, NULL, '2026-05-25 09:42:07.427122', '2026-05-25 09:42:07.427122', '浑南区', '210112', 3, 'hunnanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (503, NULL, NULL, NULL, '2026-05-25 09:42:07.434822', '2026-05-25 09:42:07.434822', '沈北新区', '210113', 3, 'shenbeixinqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (504, NULL, NULL, NULL, '2026-05-25 09:42:07.444046', '2026-05-25 09:42:07.444046', '于洪区', '210114', 3, 'yuhongqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (505, NULL, NULL, NULL, '2026-05-25 09:42:07.453046', '2026-05-25 09:42:07.453046', '辽中区', '210115', 3, 'liaozhongqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (506, NULL, NULL, NULL, '2026-05-25 09:42:07.462928', '2026-05-25 09:42:07.462928', '康平县', '210123', 3, 'kangpingxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (507, NULL, NULL, NULL, '2026-05-25 09:42:07.474127', '2026-05-25 09:42:07.474127', '法库县', '210124', 3, 'fakuxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (508, NULL, NULL, NULL, '2026-05-25 09:42:07.490120', '2026-05-25 09:42:07.490120', '新民市', '210181', 3, 'xinminshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (509, NULL, NULL, NULL, '2026-05-25 09:42:07.507126', '2026-05-25 09:42:07.507126', '大连市', '2102', 2, 'dalianshi', 'D', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (510, NULL, NULL, NULL, '2026-05-25 09:42:07.521657', '2026-05-25 09:42:07.521657', '中山区', '210202', 3, 'zhongshanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (511, NULL, NULL, NULL, '2026-05-25 09:42:07.529657', '2026-05-25 09:42:07.529657', '西岗区', '210203', 3, 'xigangqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (512, NULL, NULL, NULL, '2026-05-25 09:42:07.538657', '2026-05-25 09:42:07.538657', '沙河口区', '210204', 3, 'shahekouqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (513, NULL, NULL, NULL, '2026-05-25 09:42:07.550783', '2026-05-25 09:42:07.550783', '甘井子区', '210211', 3, 'ganjingziqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (514, NULL, NULL, NULL, '2026-05-25 09:42:07.558536', '2026-05-25 09:42:07.558536', '旅顺口区', '210212', 3, 'lvshunkouqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (515, NULL, NULL, NULL, '2026-05-25 09:42:07.566533', '2026-05-25 09:42:07.566533', '金州区', '210213', 3, 'jinzhouqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (516, NULL, NULL, NULL, '2026-05-25 09:42:07.574627', '2026-05-25 09:42:07.574627', '普兰店区', '210214', 3, 'pulandianqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (517, NULL, NULL, NULL, '2026-05-25 09:42:07.584115', '2026-05-25 09:42:07.584115', '长海县', '210224', 3, 'zhanghaixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (518, NULL, NULL, NULL, '2026-05-25 09:42:07.593366', '2026-05-25 09:42:07.593366', '瓦房店市', '210281', 3, 'wafangdianshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (519, NULL, NULL, NULL, '2026-05-25 09:42:07.603364', '2026-05-25 09:42:07.603364', '庄河市', '210283', 3, 'zhuangheshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (520, NULL, NULL, NULL, '2026-05-25 09:42:07.614577', '2026-05-25 09:42:07.614577', '鞍山市', '2103', 2, 'anshanshi', 'A', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (521, NULL, NULL, NULL, '2026-05-25 09:42:07.623667', '2026-05-25 09:42:07.623667', '铁东区', '210302', 3, 'tiedongqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (522, NULL, NULL, NULL, '2026-05-25 09:42:07.634739', '2026-05-25 09:42:07.634739', '铁西区', '210303', 3, 'tiexiqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (523, NULL, NULL, NULL, '2026-05-25 09:42:07.644756', '2026-05-25 09:42:07.644756', '立山区', '210304', 3, 'lishanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (524, NULL, NULL, NULL, '2026-05-25 09:42:07.654140', '2026-05-25 09:42:07.654140', '千山区', '210311', 3, 'qianshanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (525, NULL, NULL, NULL, '2026-05-25 09:42:07.663153', '2026-05-25 09:42:07.663153', '台安县', '210321', 3, 'taianxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (526, NULL, NULL, NULL, '2026-05-25 09:42:07.672461', '2026-05-25 09:42:07.672461', '岫岩满族自治县', '210323', 3, 'xiuyanmanzuzizhixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (527, NULL, NULL, NULL, '2026-05-25 09:42:07.683096', '2026-05-25 09:42:07.683096', '海城市', '210381', 3, 'haichengshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (528, NULL, NULL, NULL, '2026-05-25 09:42:07.692076', '2026-05-25 09:42:07.692076', '抚顺市', '2104', 2, 'fushunshi', 'F', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (529, NULL, NULL, NULL, '2026-05-25 09:42:07.700867', '2026-05-25 09:42:07.700867', '新抚区', '210402', 3, 'xinfuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (530, NULL, NULL, NULL, '2026-05-25 09:42:07.709868', '2026-05-25 09:42:07.709868', '东洲区', '210403', 3, 'dongzhouqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (531, NULL, NULL, NULL, '2026-05-25 09:42:07.721510', '2026-05-25 09:42:07.721510', '望花区', '210404', 3, 'wanghuaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (532, NULL, NULL, NULL, '2026-05-25 09:42:07.730510', '2026-05-25 09:42:07.730510', '顺城区', '210411', 3, 'shunchengqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (533, NULL, NULL, NULL, '2026-05-25 09:42:07.738595', '2026-05-25 09:42:07.738595', '抚顺县', '210421', 3, 'fushunxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (534, NULL, NULL, NULL, '2026-05-25 09:42:07.748580', '2026-05-25 09:42:07.748580', '新宾满族自治县', '210422', 3, 'xinbinmanzuzizhixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (535, NULL, NULL, NULL, '2026-05-25 09:42:07.757580', '2026-05-25 09:42:07.757580', '清原满族自治县', '210423', 3, 'qingyuanmanzuzizhixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (536, NULL, NULL, NULL, '2026-05-25 09:42:07.767579', '2026-05-25 09:42:07.767579', '本溪市', '2105', 2, 'benxishi', 'B', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (537, NULL, NULL, NULL, '2026-05-25 09:42:07.776587', '2026-05-25 09:42:07.776587', '平山区', '210502', 3, 'pingshanqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (538, NULL, NULL, NULL, '2026-05-25 09:42:07.785585', '2026-05-25 09:42:07.785585', '溪湖区', '210503', 3, 'xihuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (539, NULL, NULL, NULL, '2026-05-25 09:42:07.792417', '2026-05-25 09:42:07.792417', '明山区', '210504', 3, 'mingshanqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (540, NULL, NULL, NULL, '2026-05-25 09:42:07.798417', '2026-05-25 09:42:07.798417', '南芬区', '210505', 3, 'nanfenqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (541, NULL, NULL, NULL, '2026-05-25 09:42:07.807516', '2026-05-25 09:42:07.807516', '本溪满族自治县', '210521', 3, 'benximanzuzizhixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (542, NULL, NULL, NULL, '2026-05-25 09:42:07.816224', '2026-05-25 09:42:07.816224', '桓仁满族自治县', '210522', 3, 'huanrenmanzuzizhixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (543, NULL, NULL, NULL, '2026-05-25 09:42:07.826231', '2026-05-25 09:42:07.826231', '丹东市', '2106', 2, 'dandongshi', 'D', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (544, NULL, NULL, NULL, '2026-05-25 09:42:07.835231', '2026-05-25 09:42:07.835231', '元宝区', '210602', 3, 'yuanbaoqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (545, NULL, NULL, NULL, '2026-05-25 09:42:07.844229', '2026-05-25 09:42:07.844229', '振兴区', '210603', 3, 'zhenxingqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (546, NULL, NULL, NULL, '2026-05-25 09:42:07.853218', '2026-05-25 09:42:07.853218', '振安区', '210604', 3, 'zhenanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (547, NULL, NULL, NULL, '2026-05-25 09:42:07.860420', '2026-05-25 09:42:07.860420', '宽甸满族自治县', '210624', 3, 'kuandianmanzuzizhixian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (548, NULL, NULL, NULL, '2026-05-25 09:42:07.869421', '2026-05-25 09:42:07.869421', '东港市', '210681', 3, 'donggangshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (549, NULL, NULL, NULL, '2026-05-25 09:42:07.877420', '2026-05-25 09:42:07.877420', '凤城市', '210682', 3, 'fengchengshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (550, NULL, NULL, NULL, '2026-05-25 09:42:07.885878', '2026-05-25 09:42:07.885878', '锦州市', '2107', 2, 'jinzhoushi', 'J', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (551, NULL, NULL, NULL, '2026-05-25 09:42:07.893888', '2026-05-25 09:42:07.893888', '古塔区', '210702', 3, 'gutaqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (552, NULL, NULL, NULL, '2026-05-25 09:42:07.901889', '2026-05-25 09:42:07.901889', '凌河区', '210703', 3, 'linghequ', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (553, NULL, NULL, NULL, '2026-05-25 09:42:07.910888', '2026-05-25 09:42:07.910888', '太和区', '210711', 3, 'taihequ', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (554, NULL, NULL, NULL, '2026-05-25 09:42:07.919058', '2026-05-25 09:42:07.919058', '黑山县', '210726', 3, 'heishanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (555, NULL, NULL, NULL, '2026-05-25 09:42:07.928057', '2026-05-25 09:42:07.928057', '义县', '210727', 3, 'yixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (556, NULL, NULL, NULL, '2026-05-25 09:42:07.939059', '2026-05-25 09:42:07.939059', '凌海市', '210781', 3, 'linghaishi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (557, NULL, NULL, NULL, '2026-05-25 09:42:07.946061', '2026-05-25 09:42:07.946061', '北镇市', '210782', 3, 'beizhenshi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (558, NULL, NULL, NULL, '2026-05-25 09:42:07.955059', '2026-05-25 09:42:07.955059', '营口市', '2108', 2, 'yingkoushi', 'Y', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (559, NULL, NULL, NULL, '2026-05-25 09:42:07.961696', '2026-05-25 09:42:07.961696', '站前区', '210802', 3, 'zhanqianqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (560, NULL, NULL, NULL, '2026-05-25 09:42:07.969706', '2026-05-25 09:42:07.969706', '西市区', '210803', 3, 'xishiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (561, NULL, NULL, NULL, '2026-05-25 09:42:07.978713', '2026-05-25 09:42:07.978713', '鲅鱼圈区', '210804', 3, 'bayuquanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (562, NULL, NULL, NULL, '2026-05-25 09:42:07.985706', '2026-05-25 09:42:07.985706', '老边区', '210811', 3, 'laobianqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (563, NULL, NULL, NULL, '2026-05-25 09:42:07.992700', '2026-05-25 09:42:07.992700', '盖州市', '210881', 3, 'gaizhoushi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (564, NULL, NULL, NULL, '2026-05-25 09:42:08.000700', '2026-05-25 09:42:08.000700', '大石桥市', '210882', 3, 'dashiqiaoshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (565, NULL, NULL, NULL, '2026-05-25 09:42:08.009701', '2026-05-25 09:42:08.009701', '阜新市', '2109', 2, 'fuxinshi', 'F', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (566, NULL, NULL, NULL, '2026-05-25 09:42:08.016706', '2026-05-25 09:42:08.016706', '海州区', '210902', 3, 'haizhouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (567, NULL, NULL, NULL, '2026-05-25 09:42:08.025701', '2026-05-25 09:42:08.025701', '新邱区', '210903', 3, 'xinqiuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (568, NULL, NULL, NULL, '2026-05-25 09:42:08.033198', '2026-05-25 09:42:08.033198', '太平区', '210904', 3, 'taipingqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (569, NULL, NULL, NULL, '2026-05-25 09:42:08.042205', '2026-05-25 09:42:08.042205', '清河门区', '210905', 3, 'qinghemenqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (570, NULL, NULL, NULL, '2026-05-25 09:42:08.049205', '2026-05-25 09:42:08.050205', '细河区', '210911', 3, 'xihequ', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (571, NULL, NULL, NULL, '2026-05-25 09:42:08.059198', '2026-05-25 09:42:08.059198', '阜新蒙古族自治县', '210921', 3, 'fuxinmengguzuzizhixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (572, NULL, NULL, NULL, '2026-05-25 09:42:08.067205', '2026-05-25 09:42:08.067205', '彰武县', '210922', 3, 'zhangwuxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (573, NULL, NULL, NULL, '2026-05-25 09:42:08.075205', '2026-05-25 09:42:08.075205', '辽阳市', '2110', 2, 'liaoyangshi', 'L', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (574, NULL, NULL, NULL, '2026-05-25 09:42:08.082205', '2026-05-25 09:42:08.082205', '白塔区', '211002', 3, 'baitaqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (575, NULL, NULL, NULL, '2026-05-25 09:42:08.090205', '2026-05-25 09:42:08.090205', '文圣区', '211003', 3, 'wenshengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (576, NULL, NULL, NULL, '2026-05-25 09:42:08.098143', '2026-05-25 09:42:08.098143', '宏伟区', '211004', 3, 'hongweiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (577, NULL, NULL, NULL, '2026-05-25 09:42:08.106073', '2026-05-25 09:42:08.106073', '弓长岭区', '211005', 3, 'gongzhanglingqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (578, NULL, NULL, NULL, '2026-05-25 09:42:08.114041', '2026-05-25 09:42:08.114041', '太子河区', '211011', 3, 'taizihequ', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (579, NULL, NULL, NULL, '2026-05-25 09:42:08.122682', '2026-05-25 09:42:08.122682', '辽阳县', '211021', 3, 'liaoyangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (580, NULL, NULL, NULL, '2026-05-25 09:42:08.131806', '2026-05-25 09:42:08.131806', '灯塔市', '211081', 3, 'dengtashi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (581, NULL, NULL, NULL, '2026-05-25 09:42:08.141806', '2026-05-25 09:42:08.141806', '盘锦市', '2111', 2, 'panjinshi', 'P', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (582, NULL, NULL, NULL, '2026-05-25 09:42:08.151434', '2026-05-25 09:42:08.151434', '双台子区', '211102', 3, 'shuangtaiziqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (583, NULL, NULL, NULL, '2026-05-25 09:42:08.160432', '2026-05-25 09:42:08.160432', '兴隆台区', '211103', 3, 'xinglongtaiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (584, NULL, NULL, NULL, '2026-05-25 09:42:08.171131', '2026-05-25 09:42:08.171131', '大洼区', '211104', 3, 'dawaqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (585, NULL, NULL, NULL, '2026-05-25 09:42:08.180178', '2026-05-25 09:42:08.180178', '盘山县', '211122', 3, 'panshanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (586, NULL, NULL, NULL, '2026-05-25 09:42:08.190433', '2026-05-25 09:42:08.190433', '铁岭市', '2112', 2, 'tielingshi', 'T', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (587, NULL, NULL, NULL, '2026-05-25 09:42:08.197141', '2026-05-25 09:42:08.197141', '银州区', '211202', 3, 'yinzhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (588, NULL, NULL, NULL, '2026-05-25 09:42:08.206173', '2026-05-25 09:42:08.206173', '清河区', '211204', 3, 'qinghequ', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (589, NULL, NULL, NULL, '2026-05-25 09:42:08.214181', '2026-05-25 09:42:08.214181', '铁岭县', '211221', 3, 'tielingxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (590, NULL, NULL, NULL, '2026-05-25 09:42:08.222173', '2026-05-25 09:42:08.222173', '西丰县', '211223', 3, 'xifengxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (591, NULL, NULL, NULL, '2026-05-25 09:42:08.232050', '2026-05-25 09:42:08.232050', '昌图县', '211224', 3, 'changtuxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (592, NULL, NULL, NULL, '2026-05-25 09:42:08.242039', '2026-05-25 09:42:08.243040', '调兵山市', '211281', 3, 'diaobingshanshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (593, NULL, NULL, NULL, '2026-05-25 09:42:08.250040', '2026-05-25 09:42:08.250040', '开原市', '211282', 3, 'kaiyuanshi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (594, NULL, NULL, NULL, '2026-05-25 09:42:08.260040', '2026-05-25 09:42:08.260040', '朝阳市', '2113', 2, 'zhaoyangshi', 'Z', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (595, NULL, NULL, NULL, '2026-05-25 09:42:08.272045', '2026-05-25 09:42:08.272045', '双塔区', '211302', 3, 'shuangtaqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (596, NULL, NULL, NULL, '2026-05-25 09:42:08.280046', '2026-05-25 09:42:08.280046', '龙城区', '211303', 3, 'longchengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (597, NULL, NULL, NULL, '2026-05-25 09:42:08.287046', '2026-05-25 09:42:08.287046', '朝阳县', '211321', 3, 'zhaoyangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (598, NULL, NULL, NULL, '2026-05-25 09:42:08.295046', '2026-05-25 09:42:08.295046', '建平县', '211322', 3, 'jianpingxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (599, NULL, NULL, NULL, '2026-05-25 09:42:08.302078', '2026-05-25 09:42:08.302078', '喀喇沁左翼蒙古族自治县', '211324', 3, 'kalaqinzuoyimengguzuzizhixian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (600, NULL, NULL, NULL, '2026-05-25 09:42:08.309087', '2026-05-25 09:42:08.309087', '北票市', '211381', 3, 'beipiaoshi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (601, NULL, NULL, NULL, '2026-05-25 09:42:08.318087', '2026-05-25 09:42:08.318087', '凌源市', '211382', 3, 'lingyuanshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (602, NULL, NULL, NULL, '2026-05-25 09:42:08.328186', '2026-05-25 09:42:08.328186', '葫芦岛市', '2114', 2, 'huludaoshi', 'H', 1, NULL, '120101');
INSERT INTO `dvadmin_system_area` VALUES (603, NULL, NULL, NULL, '2026-05-25 09:42:08.336075', '2026-05-25 09:42:08.336075', '连山区', '211402', 3, 'lianshanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (604, NULL, NULL, NULL, '2026-05-25 09:42:08.348075', '2026-05-25 09:42:08.348075', '龙港区', '211403', 3, 'longgangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (605, NULL, NULL, NULL, '2026-05-25 09:42:08.358069', '2026-05-25 09:42:08.358069', '南票区', '211404', 3, 'nanpiaoqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (606, NULL, NULL, NULL, '2026-05-25 09:42:08.367077', '2026-05-25 09:42:08.368075', '绥中县', '211421', 3, 'suizhongxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (607, NULL, NULL, NULL, '2026-05-25 09:42:08.376076', '2026-05-25 09:42:08.376076', '建昌县', '211422', 3, 'jianchangxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (608, NULL, NULL, NULL, '2026-05-25 09:42:08.385997', '2026-05-25 09:42:08.385997', '兴城市', '211481', 3, 'xingchengshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (609, NULL, NULL, NULL, '2026-05-25 09:42:08.394390', '2026-04-03 10:10:04.985000', '吉林省', '22', 1, 'jilinsheng', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (610, NULL, NULL, NULL, '2026-05-25 09:42:08.403907', '2026-05-25 09:42:08.403907', '长春市', '2201', 2, 'changchunshi', 'C', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (611, NULL, NULL, NULL, '2026-05-25 09:42:08.412265', '2026-05-25 09:42:08.412265', '南关区', '220102', 3, 'nanguanqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (612, NULL, NULL, NULL, '2026-05-25 09:42:08.419433', '2026-05-25 09:42:08.419433', '宽城区', '220103', 3, 'kuanchengqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (613, NULL, NULL, NULL, '2026-05-25 09:42:08.426297', '2026-05-25 09:42:08.426297', '朝阳区', '220104', 3, 'chaoyangqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (614, NULL, NULL, NULL, '2026-05-25 09:42:08.434640', '2026-05-25 09:42:08.434640', '二道区', '220105', 3, 'erdaoqu', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (615, NULL, NULL, NULL, '2026-05-25 09:42:08.442639', '2026-05-25 09:42:08.443639', '绿园区', '220106', 3, 'lvyuanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (616, NULL, NULL, NULL, '2026-05-25 09:42:08.450638', '2026-05-25 09:42:08.450638', '双阳区', '220112', 3, 'shuangyangqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (617, NULL, NULL, NULL, '2026-05-25 09:42:08.459072', '2026-05-25 09:42:08.459072', '九台区', '220113', 3, 'jiutaiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (618, NULL, NULL, NULL, '2026-05-25 09:42:08.467843', '2026-05-25 09:42:08.467843', '农安县', '220122', 3, 'nonganxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (619, NULL, NULL, NULL, '2026-05-25 09:42:08.515273', '2026-05-25 09:42:08.515273', '长春经济技术开发区', '220171', 3, 'changchunjingjijishukaifaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (620, NULL, NULL, NULL, '2026-05-25 09:42:08.523272', '2026-05-25 09:42:08.523272', '长春净月高新技术产业开发区', '220172', 3, 'changchunjingyuegaoxinjishuchanyekaifaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (621, NULL, NULL, NULL, '2026-05-25 09:42:08.529320', '2026-05-25 09:42:08.529320', '长春高新技术产业开发区', '220173', 3, 'changchungaoxinjishuchanyekaifaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (622, NULL, NULL, NULL, '2026-05-25 09:42:08.537994', '2026-05-25 09:42:08.537994', '长春汽车经济技术开发区', '220174', 3, 'changchunqichejingjijishukaifaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (623, NULL, NULL, NULL, '2026-05-25 09:42:08.545994', '2026-05-25 09:42:08.545994', '榆树市', '220182', 3, 'yushushi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (624, NULL, NULL, NULL, '2026-05-25 09:42:08.555995', '2026-05-25 09:42:08.555995', '德惠市', '220183', 3, 'dehuishi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (625, NULL, NULL, NULL, '2026-05-25 09:42:08.564994', '2026-05-25 09:42:08.564994', '公主岭市', '220184', 3, 'gongzhulingshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (626, NULL, NULL, NULL, '2026-05-25 09:42:08.572995', '2026-05-25 09:42:08.572995', '吉林市', '2202', 2, 'jilinshi', 'J', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (627, NULL, NULL, NULL, '2026-05-25 09:42:08.582066', '2026-05-25 09:42:08.582066', '昌邑区', '220202', 3, 'changyiqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (628, NULL, NULL, NULL, '2026-05-25 09:42:08.591056', '2026-05-25 09:42:08.591056', '龙潭区', '220203', 3, 'longtanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (629, NULL, NULL, NULL, '2026-05-25 09:42:08.600063', '2026-05-25 09:42:08.600063', '船营区', '220204', 3, 'chuanyingqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (630, NULL, NULL, NULL, '2026-05-25 09:42:08.609337', '2026-05-25 09:42:08.609337', '丰满区', '220211', 3, 'fengmanqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (631, NULL, NULL, NULL, '2026-05-25 09:42:08.618331', '2026-05-25 09:42:08.618331', '永吉县', '220221', 3, 'yongjixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (632, NULL, NULL, NULL, '2026-05-25 09:42:08.627355', '2026-05-25 09:42:08.627355', '吉林经济开发区', '220271', 3, 'jilinjingjikaifaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (633, NULL, NULL, NULL, '2026-05-25 09:42:08.635298', '2026-05-25 09:42:08.635298', '吉林高新技术产业开发区', '220272', 3, 'jilingaoxinjishuchanyekaifaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (634, NULL, NULL, NULL, '2026-05-25 09:42:08.644287', '2026-05-25 09:42:08.644287', '吉林中国新加坡食品区', '220273', 3, 'jilinzhongguoxinjiaposhipinqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (635, NULL, NULL, NULL, '2026-05-25 09:42:08.652899', '2026-05-25 09:42:08.652899', '蛟河市', '220281', 3, 'jiaoheshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (636, NULL, NULL, NULL, '2026-05-25 09:42:08.661643', '2026-05-25 09:42:08.661643', '桦甸市', '220282', 3, 'huadianshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (637, NULL, NULL, NULL, '2026-05-25 09:42:08.670997', '2026-05-25 09:42:08.670997', '舒兰市', '220283', 3, 'shulanshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (638, NULL, NULL, NULL, '2026-05-25 09:42:08.678036', '2026-05-25 09:42:08.678036', '磐石市', '220284', 3, 'panshishi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (639, NULL, NULL, NULL, '2026-05-25 09:42:08.687036', '2026-05-25 09:42:08.687036', '四平市', '2203', 2, 'sipingshi', 'S', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (640, NULL, NULL, NULL, '2026-05-25 09:42:08.696256', '2026-05-25 09:42:08.696256', '铁西区', '220302', 3, 'tiexiqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (641, NULL, NULL, NULL, '2026-05-25 09:42:08.705428', '2026-05-25 09:42:08.705428', '铁东区', '220303', 3, 'tiedongqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (642, NULL, NULL, NULL, '2026-05-25 09:42:08.712284', '2026-05-25 09:42:08.712284', '梨树县', '220322', 3, 'lishuxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (643, NULL, NULL, NULL, '2026-05-25 09:42:08.723290', '2026-05-25 09:42:08.723290', '伊通满族自治县', '220323', 3, 'yitongmanzuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (644, NULL, NULL, NULL, '2026-05-25 09:42:08.731290', '2026-05-25 09:42:08.731290', '双辽市', '220382', 3, 'shuangliaoshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (645, NULL, NULL, NULL, '2026-05-25 09:42:08.739290', '2026-05-25 09:42:08.739290', '辽源市', '2204', 2, 'liaoyuanshi', 'L', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (646, NULL, NULL, NULL, '2026-05-25 09:42:08.748289', '2026-05-25 09:42:08.748289', '龙山区', '220402', 3, 'longshanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (647, NULL, NULL, NULL, '2026-05-25 09:42:08.757290', '2026-05-25 09:42:08.757290', '西安区', '220403', 3, 'xianqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (648, NULL, NULL, NULL, '2026-05-25 09:42:08.769283', '2026-05-25 09:42:08.769283', '东丰县', '220421', 3, 'dongfengxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (649, NULL, NULL, NULL, '2026-05-25 09:42:08.777283', '2026-05-25 09:42:08.777283', '东辽县', '220422', 3, 'dongliaoxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (650, NULL, NULL, NULL, '2026-05-25 09:42:08.786291', '2026-05-25 09:42:08.786291', '通化市', '2205', 2, 'tonghuashi', 'T', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (651, NULL, NULL, NULL, '2026-05-25 09:42:08.795290', '2026-05-25 09:42:08.795290', '东昌区', '220502', 3, 'dongchangqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (652, NULL, NULL, NULL, '2026-05-25 09:42:08.804291', '2026-05-25 09:42:08.804291', '二道江区', '220503', 3, 'erdaojiangqu', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (653, NULL, NULL, NULL, '2026-05-25 09:42:08.814789', '2026-05-25 09:42:08.814789', '通化县', '220521', 3, 'tonghuaxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (654, NULL, NULL, NULL, '2026-05-25 09:42:08.823804', '2026-05-25 09:42:08.823804', '辉南县', '220523', 3, 'huinanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (655, NULL, NULL, NULL, '2026-05-25 09:42:08.831804', '2026-05-25 09:42:08.831804', '柳河县', '220524', 3, 'liuhexian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (656, NULL, NULL, NULL, '2026-05-25 09:42:08.840804', '2026-05-25 09:42:08.840804', '梅河口市', '220581', 3, 'meihekoushi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (657, NULL, NULL, NULL, '2026-05-25 09:42:08.848804', '2026-05-25 09:42:08.848804', '集安市', '220582', 3, 'jianshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (658, NULL, NULL, NULL, '2026-05-25 09:42:08.856914', '2026-05-25 09:42:08.856914', '白山市', '2206', 2, 'baishanshi', 'B', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (659, NULL, NULL, NULL, '2026-05-25 09:42:08.865914', '2026-05-25 09:42:08.865914', '浑江区', '220602', 3, 'hunjiangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (660, NULL, NULL, NULL, '2026-05-25 09:42:08.879419', '2026-05-25 09:42:08.879419', '江源区', '220605', 3, 'jiangyuanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (661, NULL, NULL, NULL, '2026-05-25 09:42:08.888430', '2026-05-25 09:42:08.888430', '抚松县', '220621', 3, 'fusongxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (662, NULL, NULL, NULL, '2026-05-25 09:42:08.895938', '2026-05-25 09:42:08.895938', '靖宇县', '220622', 3, 'jingyuxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (663, NULL, NULL, NULL, '2026-05-25 09:42:08.904451', '2026-05-25 09:42:08.904451', '长白朝鲜族自治县', '220623', 3, 'zhangbaichaoxianzuzizhixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (664, NULL, NULL, NULL, '2026-05-25 09:42:08.914147', '2026-05-25 09:42:08.914147', '临江市', '220681', 3, 'linjiangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (665, NULL, NULL, NULL, '2026-05-25 09:42:08.924157', '2026-05-25 09:42:08.924157', '松原市', '2207', 2, 'songyuanshi', 'S', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (666, NULL, NULL, NULL, '2026-05-25 09:42:08.932164', '2026-05-25 09:42:08.932164', '宁江区', '220702', 3, 'ningjiangqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (667, NULL, NULL, NULL, '2026-05-25 09:42:08.940690', '2026-05-25 09:42:08.940690', '前郭尔罗斯蒙古族自治县', '220721', 3, 'qianguoerluosimengguzuzizhixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (668, NULL, NULL, NULL, '2026-05-25 09:42:08.949684', '2026-05-25 09:42:08.949684', '长岭县', '220722', 3, 'zhanglingxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (669, NULL, NULL, NULL, '2026-05-25 09:42:08.960215', '2026-05-25 09:42:08.960215', '乾安县', '220723', 3, 'qiananxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (670, NULL, NULL, NULL, '2026-05-25 09:42:08.971215', '2026-05-25 09:42:08.971215', '吉林松原经济开发区', '220771', 3, 'jilinsongyuanjingjikaifaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (671, NULL, NULL, NULL, '2026-05-25 09:42:08.980215', '2026-05-25 09:42:08.980215', '扶余市', '220781', 3, 'fuyushi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (672, NULL, NULL, NULL, '2026-05-25 09:42:08.988214', '2026-05-25 09:42:08.988214', '白城市', '2208', 2, 'baichengshi', 'B', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (673, NULL, NULL, NULL, '2026-05-25 09:42:08.997209', '2026-05-25 09:42:08.997209', '洮北区', '220802', 3, 'taobeiqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (674, NULL, NULL, NULL, '2026-05-25 09:42:09.006219', '2026-05-25 09:42:09.006219', '镇赉县', '220821', 3, 'zhenlaixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (675, NULL, NULL, NULL, '2026-05-25 09:42:09.014210', '2026-05-25 09:42:09.014210', '通榆县', '220822', 3, 'tongyuxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (676, NULL, NULL, NULL, '2026-05-25 09:42:09.023215', '2026-05-25 09:42:09.023215', '吉林白城经济开发区', '220871', 3, 'jilinbaichengjingjikaifaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (677, NULL, NULL, NULL, '2026-05-25 09:42:09.032863', '2026-05-25 09:42:09.032863', '洮南市', '220881', 3, 'taonanshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (678, NULL, NULL, NULL, '2026-05-25 09:42:09.042024', '2026-05-25 09:42:09.042024', '大安市', '220882', 3, 'daanshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (679, NULL, NULL, NULL, '2026-05-25 09:42:09.051029', '2026-05-25 09:42:09.051029', '延边朝鲜族自治州', '2224', 2, 'yanbianchaoxianzuzizhizhou', 'Y', 1, NULL, '120102');
INSERT INTO `dvadmin_system_area` VALUES (680, NULL, NULL, NULL, '2026-05-25 09:42:09.060029', '2026-05-25 09:42:09.060029', '延吉市', '222401', 3, 'yanjishi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (681, NULL, NULL, NULL, '2026-05-25 09:42:09.069030', '2026-05-25 09:42:09.069030', '图们市', '222402', 3, 'tumenshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (682, NULL, NULL, NULL, '2026-05-25 09:42:09.078023', '2026-05-25 09:42:09.078023', '敦化市', '222403', 3, 'dunhuashi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (683, NULL, NULL, NULL, '2026-05-25 09:42:09.086934', '2026-05-25 09:42:09.086934', '珲春市', '222404', 3, 'huichunshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (684, NULL, NULL, NULL, '2026-05-25 09:42:09.095940', '2026-05-25 09:42:09.095940', '龙井市', '222405', 3, 'longjingshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (685, NULL, NULL, NULL, '2026-05-25 09:42:09.103717', '2026-05-25 09:42:09.103717', '和龙市', '222406', 3, 'helongshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (686, NULL, NULL, NULL, '2026-05-25 09:42:09.110717', '2026-05-25 09:42:09.110717', '汪清县', '222424', 3, 'wangqingxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (687, NULL, NULL, NULL, '2026-05-25 09:42:09.118716', '2026-05-25 09:42:09.118716', '安图县', '222426', 3, 'antuxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (688, NULL, NULL, NULL, '2026-05-25 09:42:09.125646', '2026-04-03 10:10:04.988000', '黑龙江省', '23', 1, 'heilongjiangsheng', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (689, NULL, NULL, NULL, '2026-05-25 09:42:09.135079', '2026-05-25 09:42:09.135079', '哈尔滨市', '2301', 2, 'haerbinshi', 'H', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (690, NULL, NULL, NULL, '2026-05-25 09:42:09.143881', '2026-05-25 09:42:09.143881', '道里区', '230102', 3, 'daoliqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (691, NULL, NULL, NULL, '2026-05-25 09:42:09.154553', '2026-05-25 09:42:09.154553', '南岗区', '230103', 3, 'nangangqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (692, NULL, NULL, NULL, '2026-05-25 09:42:09.163436', '2026-05-25 09:42:09.164433', '道外区', '230104', 3, 'daowaiqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (693, NULL, NULL, NULL, '2026-05-25 09:42:09.173433', '2026-05-25 09:42:09.173433', '平房区', '230108', 3, 'pingfangqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (694, NULL, NULL, NULL, '2026-05-25 09:42:09.182435', '2026-05-25 09:42:09.182435', '松北区', '230109', 3, 'songbeiqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (695, NULL, NULL, NULL, '2026-05-25 09:42:09.190964', '2026-05-25 09:42:09.190964', '香坊区', '230110', 3, 'xiangfangqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (696, NULL, NULL, NULL, '2026-05-25 09:42:09.199964', '2026-05-25 09:42:09.199964', '呼兰区', '230111', 3, 'hulanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (697, NULL, NULL, NULL, '2026-05-25 09:42:09.209050', '2026-05-25 09:42:09.209050', '阿城区', '230112', 3, 'achengqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (698, NULL, NULL, NULL, '2026-05-25 09:42:09.218640', '2026-05-25 09:42:09.218640', '双城区', '230113', 3, 'shuangchengqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (699, NULL, NULL, NULL, '2026-05-25 09:42:09.227068', '2026-05-25 09:42:09.227068', '依兰县', '230123', 3, 'yilanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (700, NULL, NULL, NULL, '2026-05-25 09:42:09.235079', '2026-05-25 09:42:09.235079', '方正县', '230124', 3, 'fangzhengxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (701, NULL, NULL, NULL, '2026-05-25 09:42:09.243971', '2026-05-25 09:42:09.243971', '宾县', '230125', 3, 'binxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (702, NULL, NULL, NULL, '2026-05-25 09:42:09.250924', '2026-05-25 09:42:09.250924', '巴彦县', '230126', 3, 'bayanxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (703, NULL, NULL, NULL, '2026-05-25 09:42:09.258933', '2026-05-25 09:42:09.258933', '木兰县', '230127', 3, 'mulanxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (704, NULL, NULL, NULL, '2026-05-25 09:42:09.268019', '2026-05-25 09:42:09.268019', '通河县', '230128', 3, 'tonghexian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (705, NULL, NULL, NULL, '2026-05-25 09:42:09.276082', '2026-05-25 09:42:09.276082', '延寿县', '230129', 3, 'yanshouxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (706, NULL, NULL, NULL, '2026-05-25 09:42:09.284826', '2026-05-25 09:42:09.284826', '尚志市', '230183', 3, 'shangzhishi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (707, NULL, NULL, NULL, '2026-05-25 09:42:09.294140', '2026-05-25 09:42:09.294140', '五常市', '230184', 3, 'wuchangshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (708, NULL, NULL, NULL, '2026-05-25 09:42:09.304178', '2026-05-25 09:42:09.304178', '齐齐哈尔市', '2302', 2, 'qiqihaershi', 'Q', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (709, NULL, NULL, NULL, '2026-05-25 09:42:09.314181', '2026-05-25 09:42:09.314181', '龙沙区', '230202', 3, 'longshaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (710, NULL, NULL, NULL, '2026-05-25 09:42:09.323180', '2026-05-25 09:42:09.323180', '建华区', '230203', 3, 'jianhuaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (711, NULL, NULL, NULL, '2026-05-25 09:42:09.334180', '2026-05-25 09:42:09.334180', '铁锋区', '230204', 3, 'tiefengqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (712, NULL, NULL, NULL, '2026-05-25 09:42:09.344636', '2026-05-25 09:42:09.344636', '昂昂溪区', '230205', 3, 'angangxiqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (713, NULL, NULL, NULL, '2026-05-25 09:42:09.353128', '2026-05-25 09:42:09.353128', '富拉尔基区', '230206', 3, 'fulaerjiqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (714, NULL, NULL, NULL, '2026-05-25 09:42:09.362597', '2026-05-25 09:42:09.362597', '碾子山区', '230207', 3, 'nianzishanqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (715, NULL, NULL, NULL, '2026-05-25 09:42:09.371633', '2026-05-25 09:42:09.371633', '梅里斯达斡尔族区', '230208', 3, 'meilisidawoerzuqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (716, NULL, NULL, NULL, '2026-05-25 09:42:09.380731', '2026-05-25 09:42:09.380731', '龙江县', '230221', 3, 'longjiangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (717, NULL, NULL, NULL, '2026-05-25 09:42:09.390734', '2026-05-25 09:42:09.390734', '依安县', '230223', 3, 'yianxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (718, NULL, NULL, NULL, '2026-05-25 09:42:09.399728', '2026-05-25 09:42:09.399728', '泰来县', '230224', 3, 'tailaixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (719, NULL, NULL, NULL, '2026-05-25 09:42:09.408568', '2026-05-25 09:42:09.408568', '甘南县', '230225', 3, 'gannanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (720, NULL, NULL, NULL, '2026-05-25 09:42:09.415729', '2026-05-25 09:42:09.415729', '富裕县', '230227', 3, 'fuyuxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (721, NULL, NULL, NULL, '2026-05-25 09:42:09.422729', '2026-05-25 09:42:09.422729', '克山县', '230229', 3, 'keshanxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (722, NULL, NULL, NULL, '2026-05-25 09:42:09.430729', '2026-05-25 09:42:09.430729', '克东县', '230230', 3, 'kedongxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (723, NULL, NULL, NULL, '2026-05-25 09:42:09.438744', '2026-05-25 09:42:09.438744', '拜泉县', '230231', 3, 'baiquanxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (724, NULL, NULL, NULL, '2026-05-25 09:42:09.447743', '2026-05-25 09:42:09.447743', '讷河市', '230281', 3, 'neheshi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (725, NULL, NULL, NULL, '2026-05-25 09:42:09.455655', '2026-05-25 09:42:09.455655', '鸡西市', '2303', 2, 'jixishi', 'J', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (726, NULL, NULL, NULL, '2026-05-25 09:42:09.463431', '2026-05-25 09:42:09.463431', '鸡冠区', '230302', 3, 'jiguanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (727, NULL, NULL, NULL, '2026-05-25 09:42:09.470431', '2026-05-25 09:42:09.470431', '恒山区', '230303', 3, 'hengshanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (728, NULL, NULL, NULL, '2026-05-25 09:42:09.478433', '2026-05-25 09:42:09.478433', '滴道区', '230304', 3, 'didaoqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (729, NULL, NULL, NULL, '2026-05-25 09:42:09.500398', '2026-05-25 09:42:09.500398', '梨树区', '230305', 3, 'lishuqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (730, NULL, NULL, NULL, '2026-05-25 09:42:09.516448', '2026-05-25 09:42:09.516448', '城子河区', '230306', 3, 'chengzihequ', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (731, NULL, NULL, NULL, '2026-05-25 09:42:09.526778', '2026-05-25 09:42:09.526778', '麻山区', '230307', 3, 'mashanqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (732, NULL, NULL, NULL, '2026-05-25 09:42:09.537908', '2026-05-25 09:42:09.537908', '鸡东县', '230321', 3, 'jidongxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (733, NULL, NULL, NULL, '2026-05-25 09:42:09.547306', '2026-05-25 09:42:09.547306', '虎林市', '230381', 3, 'hulinshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (734, NULL, NULL, NULL, '2026-05-25 09:42:09.557307', '2026-05-25 09:42:09.557307', '密山市', '230382', 3, 'mishanshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (735, NULL, NULL, NULL, '2026-05-25 09:42:09.567306', '2026-05-25 09:42:09.567306', '鹤岗市', '2304', 2, 'hegangshi', 'H', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (736, NULL, NULL, NULL, '2026-05-25 09:42:09.576369', '2026-05-25 09:42:09.576369', '向阳区', '230402', 3, 'xiangyangqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (737, NULL, NULL, NULL, '2026-05-25 09:42:09.585367', '2026-05-25 09:42:09.585367', '工农区', '230403', 3, 'gongnongqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (738, NULL, NULL, NULL, '2026-05-25 09:42:09.594366', '2026-05-25 09:42:09.594366', '南山区', '230404', 3, 'nanshanqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (739, NULL, NULL, NULL, '2026-05-25 09:42:09.604366', '2026-05-25 09:42:09.604366', '兴安区', '230405', 3, 'xinganqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (740, NULL, NULL, NULL, '2026-05-25 09:42:09.615331', '2026-05-25 09:42:09.615331', '东山区', '230406', 3, 'dongshanqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (741, NULL, NULL, NULL, '2026-05-25 09:42:09.623795', '2026-05-25 09:42:09.623795', '兴山区', '230407', 3, 'xingshanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (742, NULL, NULL, NULL, '2026-05-25 09:42:09.632795', '2026-05-25 09:42:09.632795', '萝北县', '230421', 3, 'luobeixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (743, NULL, NULL, NULL, '2026-05-25 09:42:09.641266', '2026-05-25 09:42:09.641266', '绥滨县', '230422', 3, 'suibinxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (744, NULL, NULL, NULL, '2026-05-25 09:42:09.649739', '2026-05-25 09:42:09.649739', '双鸭山市', '2305', 2, 'shuangyashanshi', 'S', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (745, NULL, NULL, NULL, '2026-05-25 09:42:09.658738', '2026-05-25 09:42:09.658738', '尖山区', '230502', 3, 'jianshanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (746, NULL, NULL, NULL, '2026-05-25 09:42:09.668991', '2026-05-25 09:42:09.668991', '岭东区', '230503', 3, 'lingdongqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (747, NULL, NULL, NULL, '2026-05-25 09:42:09.678028', '2026-05-25 09:42:09.678028', '四方台区', '230505', 3, 'sifangtaiqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (748, NULL, NULL, NULL, '2026-05-25 09:42:09.687012', '2026-05-25 09:42:09.687012', '宝山区', '230506', 3, 'baoshanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (749, NULL, NULL, NULL, '2026-05-25 09:42:09.696050', '2026-05-25 09:42:09.696050', '集贤县', '230521', 3, 'jixianxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (750, NULL, NULL, NULL, '2026-05-25 09:42:09.705149', '2026-05-25 09:42:09.706305', '友谊县', '230522', 3, 'youyixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (751, NULL, NULL, NULL, '2026-05-25 09:42:09.714308', '2026-05-25 09:42:09.714308', '宝清县', '230523', 3, 'baoqingxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (752, NULL, NULL, NULL, '2026-05-25 09:42:09.722996', '2026-05-25 09:42:09.722996', '饶河县', '230524', 3, 'raohexian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (753, NULL, NULL, NULL, '2026-05-25 09:42:09.731265', '2026-05-25 09:42:09.731265', '大庆市', '2306', 2, 'daqingshi', 'D', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (754, NULL, NULL, NULL, '2026-05-25 09:42:09.740690', '2026-05-25 09:42:09.740690', '萨尔图区', '230602', 3, 'saertuqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (755, NULL, NULL, NULL, '2026-05-25 09:42:09.748695', '2026-05-25 09:42:09.748695', '龙凤区', '230603', 3, 'longfengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (756, NULL, NULL, NULL, '2026-05-25 09:42:09.757039', '2026-05-25 09:42:09.757039', '让胡路区', '230604', 3, 'ranghuluqu', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (757, NULL, NULL, NULL, '2026-05-25 09:42:09.765465', '2026-05-25 09:42:09.765465', '红岗区', '230605', 3, 'honggangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (758, NULL, NULL, NULL, '2026-05-25 09:42:09.775466', '2026-05-25 09:42:09.775466', '大同区', '230606', 3, 'datongqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (759, NULL, NULL, NULL, '2026-05-25 09:42:09.782464', '2026-05-25 09:42:09.782464', '肇州县', '230621', 3, 'zhaozhouxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (760, NULL, NULL, NULL, '2026-05-25 09:42:09.791058', '2026-05-25 09:42:09.791058', '肇源县', '230622', 3, 'zhaoyuanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (761, NULL, NULL, NULL, '2026-05-25 09:42:09.799058', '2026-05-25 09:42:09.799058', '林甸县', '230623', 3, 'lindianxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (762, NULL, NULL, NULL, '2026-05-25 09:42:09.809057', '2026-05-25 09:42:09.809057', '杜尔伯特蒙古族自治县', '230624', 3, 'duerbotemengguzuzizhixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (763, NULL, NULL, NULL, '2026-05-25 09:42:09.822334', '2026-05-25 09:42:09.822334', '大庆高新技术产业开发区', '230671', 3, 'daqinggaoxinjishuchanyekaifaqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (764, NULL, NULL, NULL, '2026-05-25 09:42:09.830790', '2026-05-25 09:42:09.830790', '伊春市', '2307', 2, 'yichunshi', 'Y', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (765, NULL, NULL, NULL, '2026-05-25 09:42:09.839784', '2026-05-25 09:42:09.839784', '伊美区', '230717', 3, 'yimeiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (766, NULL, NULL, NULL, '2026-05-25 09:42:09.847859', '2026-05-25 09:42:09.847859', '乌翠区', '230718', 3, 'wucuiqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (767, NULL, NULL, NULL, '2026-05-25 09:42:09.857859', '2026-05-25 09:42:09.857859', '友好区', '230719', 3, 'youhaoqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (768, NULL, NULL, NULL, '2026-05-25 09:42:09.866858', '2026-05-25 09:42:09.866858', '嘉荫县', '230722', 3, 'jiayinxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (769, NULL, NULL, NULL, '2026-05-25 09:42:09.877972', '2026-05-25 09:42:09.877972', '汤旺县', '230723', 3, 'tangwangxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (770, NULL, NULL, NULL, '2026-05-25 09:42:09.886965', '2026-05-25 09:42:09.886965', '丰林县', '230724', 3, 'fenglinxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (771, NULL, NULL, NULL, '2026-05-25 09:42:09.895966', '2026-05-25 09:42:09.895966', '大箐山县', '230725', 3, 'daqingshanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (772, NULL, NULL, NULL, '2026-05-25 09:42:09.903965', '2026-05-25 09:42:09.903965', '南岔县', '230726', 3, 'nanchaxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (773, NULL, NULL, NULL, '2026-05-25 09:42:09.910965', '2026-05-25 09:42:09.910965', '金林区', '230751', 3, 'jinlinqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (774, NULL, NULL, NULL, '2026-05-25 09:42:09.918965', '2026-05-25 09:42:09.918965', '铁力市', '230781', 3, 'tielishi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (775, NULL, NULL, NULL, '2026-05-25 09:42:09.927965', '2026-05-25 09:42:09.927965', '佳木斯市', '2308', 2, 'jiamusishi', 'J', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (776, NULL, NULL, NULL, '2026-05-25 09:42:09.937967', '2026-05-25 09:42:09.937967', '向阳区', '230803', 3, 'xiangyangqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (777, NULL, NULL, NULL, '2026-05-25 09:42:09.947965', '2026-05-25 09:42:09.947965', '前进区', '230804', 3, 'qianjinqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (778, NULL, NULL, NULL, '2026-05-25 09:42:09.956172', '2026-05-25 09:42:09.956172', '东风区', '230805', 3, 'dongfengqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (779, NULL, NULL, NULL, '2026-05-25 09:42:09.965176', '2026-05-25 09:42:09.965176', '郊区', '230811', 3, 'jiaoqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (780, NULL, NULL, NULL, '2026-05-25 09:42:09.973176', '2026-05-25 09:42:09.973176', '桦南县', '230822', 3, 'huananxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (781, NULL, NULL, NULL, '2026-05-25 09:42:09.981177', '2026-05-25 09:42:09.981177', '桦川县', '230826', 3, 'huachuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (782, NULL, NULL, NULL, '2026-05-25 09:42:09.990179', '2026-05-25 09:42:09.990179', '汤原县', '230828', 3, 'tangyuanxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (783, NULL, NULL, NULL, '2026-05-25 09:42:09.999177', '2026-05-25 09:42:09.999177', '同江市', '230881', 3, 'tongjiangshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (784, NULL, NULL, NULL, '2026-05-25 09:42:10.015179', '2026-05-25 09:42:10.015179', '富锦市', '230882', 3, 'fujinshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (785, NULL, NULL, NULL, '2026-05-25 09:42:10.030398', '2026-05-25 09:42:10.030398', '抚远市', '230883', 3, 'fuyuanshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (786, NULL, NULL, NULL, '2026-05-25 09:42:10.042399', '2026-05-25 09:42:10.042399', '七台河市', '2309', 2, 'qitaiheshi', 'Q', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (787, NULL, NULL, NULL, '2026-05-25 09:42:10.052398', '2026-05-25 09:42:10.052398', '新兴区', '230902', 3, 'xinxingqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (788, NULL, NULL, NULL, '2026-05-25 09:42:10.061401', '2026-05-25 09:42:10.061401', '桃山区', '230903', 3, 'taoshanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (789, NULL, NULL, NULL, '2026-05-25 09:42:10.069399', '2026-05-25 09:42:10.069399', '茄子河区', '230904', 3, 'qiezihequ', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (790, NULL, NULL, NULL, '2026-05-25 09:42:10.077398', '2026-05-25 09:42:10.077398', '勃利县', '230921', 3, 'bolixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (791, NULL, NULL, NULL, '2026-05-25 09:42:10.087399', '2026-05-25 09:42:10.087399', '牡丹江市', '2310', 2, 'mudanjiangshi', 'M', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (792, NULL, NULL, NULL, '2026-05-25 09:42:10.095399', '2026-05-25 09:42:10.095399', '东安区', '231002', 3, 'donganqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (793, NULL, NULL, NULL, '2026-05-25 09:42:10.103398', '2026-05-25 09:42:10.103398', '阳明区', '231003', 3, 'yangmingqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (794, NULL, NULL, NULL, '2026-05-25 09:42:10.111491', '2026-05-25 09:42:10.111491', '爱民区', '231004', 3, 'aiminqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (795, NULL, NULL, NULL, '2026-05-25 09:42:10.118496', '2026-05-25 09:42:10.118496', '西安区', '231005', 3, 'xianqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (796, NULL, NULL, NULL, '2026-05-25 09:42:10.126496', '2026-05-25 09:42:10.126496', '林口县', '231025', 3, 'linkouxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (797, NULL, NULL, NULL, '2026-05-25 09:42:10.135496', '2026-05-25 09:42:10.135496', '牡丹江经济技术开发区', '231071', 3, 'mudanjiangjingjijishukaifaqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (798, NULL, NULL, NULL, '2026-05-25 09:42:10.143682', '2026-05-25 09:42:10.144684', '绥芬河市', '231081', 3, 'suifenheshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (799, NULL, NULL, NULL, '2026-05-25 09:42:10.152683', '2026-05-25 09:42:10.152683', '海林市', '231083', 3, 'hailinshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (800, NULL, NULL, NULL, '2026-05-25 09:42:10.160682', '2026-05-25 09:42:10.160682', '宁安市', '231084', 3, 'ninganshi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (801, NULL, NULL, NULL, '2026-05-25 09:42:10.169100', '2026-05-25 09:42:10.169100', '穆棱市', '231085', 3, 'mulengshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (802, NULL, NULL, NULL, '2026-05-25 09:42:10.177147', '2026-05-25 09:42:10.177147', '东宁市', '231086', 3, 'dongningshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (803, NULL, NULL, NULL, '2026-05-25 09:42:10.186148', '2026-05-25 09:42:10.186148', '黑河市', '2311', 2, 'heiheshi', 'H', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (804, NULL, NULL, NULL, '2026-05-25 09:42:10.195148', '2026-05-25 09:42:10.195148', '爱辉区', '231102', 3, 'aihuiqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (805, NULL, NULL, NULL, '2026-05-25 09:42:10.203342', '2026-05-25 09:42:10.203342', '逊克县', '231123', 3, 'xunkexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (806, NULL, NULL, NULL, '2026-05-25 09:42:10.212342', '2026-05-25 09:42:10.212342', '孙吴县', '231124', 3, 'sunwuxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (807, NULL, NULL, NULL, '2026-05-25 09:42:10.220342', '2026-05-25 09:42:10.220342', '北安市', '231181', 3, 'beianshi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (808, NULL, NULL, NULL, '2026-05-25 09:42:10.228136', '2026-05-25 09:42:10.228136', '五大连池市', '231182', 3, 'wudalianchishi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (809, NULL, NULL, NULL, '2026-05-25 09:42:10.236199', '2026-05-25 09:42:10.236199', '嫩江市', '231183', 3, 'nenjiangshi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (810, NULL, NULL, NULL, '2026-05-25 09:42:10.244070', '2026-05-25 09:42:10.244070', '绥化市', '2312', 2, 'suihuashi', 'S', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (811, NULL, NULL, NULL, '2026-05-25 09:42:10.252076', '2026-05-25 09:42:10.252076', '北林区', '231202', 3, 'beilinqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (812, NULL, NULL, NULL, '2026-05-25 09:42:10.260043', '2026-05-25 09:42:10.260043', '望奎县', '231221', 3, 'wangkuixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (813, NULL, NULL, NULL, '2026-05-25 09:42:10.268044', '2026-05-25 09:42:10.268044', '兰西县', '231222', 3, 'lanxixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (814, NULL, NULL, NULL, '2026-05-25 09:42:10.277036', '2026-05-25 09:42:10.277036', '青冈县', '231223', 3, 'qinggangxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (815, NULL, NULL, NULL, '2026-05-25 09:42:10.286182', '2026-05-25 09:42:10.286182', '庆安县', '231224', 3, 'qinganxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (816, NULL, NULL, NULL, '2026-05-25 09:42:10.296284', '2026-05-25 09:42:10.296284', '明水县', '231225', 3, 'mingshuixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (817, NULL, NULL, NULL, '2026-05-25 09:42:10.305772', '2026-05-25 09:42:10.305772', '绥棱县', '231226', 3, 'suilengxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (818, NULL, NULL, NULL, '2026-05-25 09:42:10.314778', '2026-05-25 09:42:10.314778', '安达市', '231281', 3, 'andashi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (819, NULL, NULL, NULL, '2026-05-25 09:42:10.321740', '2026-05-25 09:42:10.321740', '肇东市', '231282', 3, 'zhaodongshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (820, NULL, NULL, NULL, '2026-05-25 09:42:10.328739', '2026-05-25 09:42:10.328739', '海伦市', '231283', 3, 'hailunshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (821, NULL, NULL, NULL, '2026-05-25 09:42:10.337733', '2026-05-25 09:42:10.337733', '大兴安岭地区', '2327', 2, 'daxinganlingdiqu', 'D', 1, NULL, '120103');
INSERT INTO `dvadmin_system_area` VALUES (822, NULL, NULL, NULL, '2026-05-25 09:42:10.346740', '2026-05-25 09:42:10.346740', '漠河市', '232701', 3, 'moheshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (823, NULL, NULL, NULL, '2026-05-25 09:42:10.354732', '2026-05-25 09:42:10.354732', '呼玛县', '232721', 3, 'humaxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (824, NULL, NULL, NULL, '2026-05-25 09:42:10.362734', '2026-05-25 09:42:10.362734', '塔河县', '232722', 3, 'tahexian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (825, NULL, NULL, NULL, '2026-05-25 09:42:10.372740', '2026-05-25 09:42:10.372740', '加格达奇区', '232761', 3, 'jiagedaqiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (826, NULL, NULL, NULL, '2026-05-25 09:42:10.382739', '2026-05-25 09:42:10.382739', '松岭区', '232762', 3, 'songlingqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (827, NULL, NULL, NULL, '2026-05-25 09:42:10.391733', '2026-05-25 09:42:10.391733', '新林区', '232763', 3, 'xinlinqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (828, NULL, NULL, NULL, '2026-05-25 09:42:10.398740', '2026-05-25 09:42:10.398740', '呼中区', '232764', 3, 'huzhongqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (829, NULL, NULL, NULL, '2026-05-25 09:42:10.408179', '2026-04-03 10:10:04.991000', '上海市', '31', 1, 'shanghaishi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (830, NULL, NULL, NULL, '2026-05-25 09:42:10.416237', '2026-05-25 09:42:10.416237', '市辖区', '3101', 2, 'shixiaqu', 'S', 1, NULL, '120114');
INSERT INTO `dvadmin_system_area` VALUES (831, NULL, NULL, NULL, '2026-05-25 09:42:10.425237', '2026-05-25 09:42:10.425237', '黄浦区', '310101', 3, 'huangpuqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (832, NULL, NULL, NULL, '2026-05-25 09:42:10.433237', '2026-05-25 09:42:10.433237', '徐汇区', '310104', 3, 'xuhuiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (833, NULL, NULL, NULL, '2026-05-25 09:42:10.441236', '2026-05-25 09:42:10.441236', '长宁区', '310105', 3, 'zhangningqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (834, NULL, NULL, NULL, '2026-05-25 09:42:10.449299', '2026-05-25 09:42:10.449299', '静安区', '310106', 3, 'jinganqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (835, NULL, NULL, NULL, '2026-05-25 09:42:10.457283', '2026-05-25 09:42:10.457283', '普陀区', '310107', 3, 'putuoqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (836, NULL, NULL, NULL, '2026-05-25 09:42:10.465420', '2026-05-25 09:42:10.465420', '虹口区', '310109', 3, 'hongkouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (837, NULL, NULL, NULL, '2026-05-25 09:42:10.474419', '2026-05-25 09:42:10.474419', '杨浦区', '310110', 3, 'yangpuqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (838, NULL, NULL, NULL, '2026-05-25 09:42:10.483420', '2026-05-25 09:42:10.483420', '闵行区', '310112', 3, 'minxingqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (839, NULL, NULL, NULL, '2026-05-25 09:42:10.495459', '2026-05-25 09:42:10.495459', '宝山区', '310113', 3, 'baoshanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (840, NULL, NULL, NULL, '2026-05-25 09:42:10.518484', '2026-05-25 09:42:10.518484', '嘉定区', '310114', 3, 'jiadingqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (841, NULL, NULL, NULL, '2026-05-25 09:42:10.528827', '2026-05-25 09:42:10.528827', '浦东新区', '310115', 3, 'pudongxinqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (842, NULL, NULL, NULL, '2026-05-25 09:42:10.538568', '2026-05-25 09:42:10.538568', '金山区', '310116', 3, 'jinshanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (843, NULL, NULL, NULL, '2026-05-25 09:42:10.547510', '2026-05-25 09:42:10.547510', '松江区', '310117', 3, 'songjiangqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (844, NULL, NULL, NULL, '2026-05-25 09:42:10.555520', '2026-05-25 09:42:10.555520', '青浦区', '310118', 3, 'qingpuqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (845, NULL, NULL, NULL, '2026-05-25 09:42:10.564630', '2026-05-25 09:42:10.564630', '奉贤区', '310120', 3, 'fengxianqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (846, NULL, NULL, NULL, '2026-05-25 09:42:10.573033', '2026-05-25 09:42:10.573033', '崇明区', '310151', 3, 'chongmingqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (847, NULL, NULL, NULL, '2026-05-25 09:42:10.581065', '2026-04-03 10:10:04.994000', '江苏省', '32', 1, 'jiangsusheng', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (848, NULL, NULL, NULL, '2026-05-25 09:42:10.587784', '2026-05-25 09:42:10.587784', '南京市', '3201', 2, 'nanjingshi', 'N', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (849, NULL, NULL, NULL, '2026-05-25 09:42:10.595955', '2026-05-25 09:42:10.595955', '玄武区', '320102', 3, 'xuanwuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (850, NULL, NULL, NULL, '2026-05-25 09:42:10.604955', '2026-05-25 09:42:10.604955', '秦淮区', '320104', 3, 'qinhuaiqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (851, NULL, NULL, NULL, '2026-05-25 09:42:10.611949', '2026-05-25 09:42:10.611949', '建邺区', '320105', 3, 'jianyequ', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (852, NULL, NULL, NULL, '2026-05-25 09:42:10.620115', '2026-05-25 09:42:10.620115', '鼓楼区', '320106', 3, 'gulouqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (853, NULL, NULL, NULL, '2026-05-25 09:42:10.628396', '2026-05-25 09:42:10.628396', '浦口区', '320111', 3, 'pukouqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (854, NULL, NULL, NULL, '2026-05-25 09:42:10.636984', '2026-05-25 09:42:10.636984', '栖霞区', '320113', 3, 'qixiaqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (855, NULL, NULL, NULL, '2026-05-25 09:42:10.645979', '2026-05-25 09:42:10.645979', '雨花台区', '320114', 3, 'yuhuataiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (856, NULL, NULL, NULL, '2026-05-25 09:42:10.655979', '2026-05-25 09:42:10.655979', '江宁区', '320115', 3, 'jiangningqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (857, NULL, NULL, NULL, '2026-05-25 09:42:10.664978', '2026-05-25 09:42:10.664978', '六合区', '320116', 3, 'liuhequ', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (858, NULL, NULL, NULL, '2026-05-25 09:42:10.672985', '2026-05-25 09:42:10.672985', '溧水区', '320117', 3, 'lishuiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (859, NULL, NULL, NULL, '2026-05-25 09:42:10.681984', '2026-05-25 09:42:10.681984', '高淳区', '320118', 3, 'gaochunqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (860, NULL, NULL, NULL, '2026-05-25 09:42:10.689985', '2026-05-25 09:42:10.689985', '无锡市', '3202', 2, 'wuxishi', 'W', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (861, NULL, NULL, NULL, '2026-05-25 09:42:10.697985', '2026-05-25 09:42:10.697985', '锡山区', '320205', 3, 'xishanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (862, NULL, NULL, NULL, '2026-05-25 09:42:10.705238', '2026-05-25 09:42:10.705238', '惠山区', '320206', 3, 'huishanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (863, NULL, NULL, NULL, '2026-05-25 09:42:10.713235', '2026-05-25 09:42:10.713235', '滨湖区', '320211', 3, 'binhuqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (864, NULL, NULL, NULL, '2026-05-25 09:42:10.722206', '2026-05-25 09:42:10.722206', '梁溪区', '320213', 3, 'liangxiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (865, NULL, NULL, NULL, '2026-05-25 09:42:10.731288', '2026-05-25 09:42:10.731288', '新吴区', '320214', 3, 'xinwuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (866, NULL, NULL, NULL, '2026-05-25 09:42:10.739287', '2026-05-25 09:42:10.739287', '江阴市', '320281', 3, 'jiangyinshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (867, NULL, NULL, NULL, '2026-05-25 09:42:10.746200', '2026-05-25 09:42:10.746200', '宜兴市', '320282', 3, 'yixingshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (868, NULL, NULL, NULL, '2026-05-25 09:42:10.754085', '2026-05-25 09:42:10.754085', '徐州市', '3203', 2, 'xuzhoushi', 'X', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (869, NULL, NULL, NULL, '2026-05-25 09:42:10.762086', '2026-05-25 09:42:10.762086', '鼓楼区', '320302', 3, 'gulouqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (870, NULL, NULL, NULL, '2026-05-25 09:42:10.772082', '2026-05-25 09:42:10.772082', '云龙区', '320303', 3, 'yunlongqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (871, NULL, NULL, NULL, '2026-05-25 09:42:10.780127', '2026-05-25 09:42:10.780127', '贾汪区', '320305', 3, 'jiawangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (872, NULL, NULL, NULL, '2026-05-25 09:42:10.787190', '2026-05-25 09:42:10.787190', '泉山区', '320311', 3, 'quanshanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (873, NULL, NULL, NULL, '2026-05-25 09:42:10.795444', '2026-05-25 09:42:10.795444', '铜山区', '320312', 3, 'tongshanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (874, NULL, NULL, NULL, '2026-05-25 09:42:10.803442', '2026-05-25 09:42:10.803442', '丰县', '320321', 3, 'fengxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (875, NULL, NULL, NULL, '2026-05-25 09:42:10.812119', '2026-05-25 09:42:10.812119', '沛县', '320322', 3, 'peixian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (876, NULL, NULL, NULL, '2026-05-25 09:42:10.820757', '2026-05-25 09:42:10.820757', '睢宁县', '320324', 3, 'suiningxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (877, NULL, NULL, NULL, '2026-05-25 09:42:10.829465', '2026-05-25 09:42:10.829465', '徐州经济技术开发区', '320371', 3, 'xuzhoujingjijishukaifaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (878, NULL, NULL, NULL, '2026-05-25 09:42:10.836790', '2026-05-25 09:42:10.836790', '新沂市', '320381', 3, 'xinyishi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (879, NULL, NULL, NULL, '2026-05-25 09:42:10.845803', '2026-05-25 09:42:10.845803', '邳州市', '320382', 3, 'pizhoushi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (880, NULL, NULL, NULL, '2026-05-25 09:42:10.853865', '2026-05-25 09:42:10.853865', '常州市', '3204', 2, 'changzhoushi', 'C', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (881, NULL, NULL, NULL, '2026-05-25 09:42:10.863740', '2026-05-25 09:42:10.863740', '天宁区', '320402', 3, 'tianningqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (882, NULL, NULL, NULL, '2026-05-25 09:42:10.872739', '2026-05-25 09:42:10.872739', '钟楼区', '320404', 3, 'zhonglouqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (883, NULL, NULL, NULL, '2026-05-25 09:42:10.883740', '2026-05-25 09:42:10.883740', '新北区', '320411', 3, 'xinbeiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (884, NULL, NULL, NULL, '2026-05-25 09:42:10.892740', '2026-05-25 09:42:10.892740', '武进区', '320412', 3, 'wujinqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (885, NULL, NULL, NULL, '2026-05-25 09:42:10.900739', '2026-05-25 09:42:10.900739', '金坛区', '320413', 3, 'jintanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (886, NULL, NULL, NULL, '2026-05-25 09:42:10.910738', '2026-05-25 09:42:10.910738', '溧阳市', '320481', 3, 'liyangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (887, NULL, NULL, NULL, '2026-05-25 09:42:10.920739', '2026-05-25 09:42:10.920739', '苏州市', '3205', 2, 'suzhoushi', 'S', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (888, NULL, NULL, NULL, '2026-05-25 09:42:10.929738', '2026-05-25 09:42:10.929738', '虎丘区', '320505', 3, 'huqiuqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (889, NULL, NULL, NULL, '2026-05-25 09:42:10.938740', '2026-05-25 09:42:10.938740', '吴中区', '320506', 3, 'wuzhongqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (890, NULL, NULL, NULL, '2026-05-25 09:42:10.950748', '2026-05-25 09:42:10.950748', '相城区', '320507', 3, 'xiangchengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (891, NULL, NULL, NULL, '2026-05-25 09:42:10.961739', '2026-05-25 09:42:10.961739', '姑苏区', '320508', 3, 'gusuqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (892, NULL, NULL, NULL, '2026-05-25 09:42:10.969961', '2026-05-25 09:42:10.969961', '吴江区', '320509', 3, 'wujiangqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (893, NULL, NULL, NULL, '2026-05-25 09:42:10.978170', '2026-05-25 09:42:10.978170', '苏州工业园区', '320571', 3, 'suzhougongyeyuanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (894, NULL, NULL, NULL, '2026-05-25 09:42:10.986171', '2026-05-25 09:42:10.986171', '常熟市', '320581', 3, 'changshushi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (895, NULL, NULL, NULL, '2026-05-25 09:42:10.994170', '2026-05-25 09:42:10.994170', '张家港市', '320582', 3, 'zhangjiagangshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (896, NULL, NULL, NULL, '2026-05-25 09:42:11.001421', '2026-05-25 09:42:11.001421', '昆山市', '320583', 3, 'kunshanshi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (897, NULL, NULL, NULL, '2026-05-25 09:42:11.008420', '2026-05-25 09:42:11.008420', '太仓市', '320585', 3, 'taicangshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (898, NULL, NULL, NULL, '2026-05-25 09:42:11.017590', '2026-05-25 09:42:11.017590', '南通市', '3206', 2, 'nantongshi', 'N', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (899, NULL, NULL, NULL, '2026-05-25 09:42:11.025593', '2026-05-25 09:42:11.025593', '崇川区', '320602', 3, 'chongchuanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (900, NULL, NULL, NULL, '2026-05-25 09:42:11.034044', '2026-05-25 09:42:11.034044', '港闸区', '320611', 3, 'gangzhaqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (901, NULL, NULL, NULL, '2026-05-25 09:42:11.043503', '2026-05-25 09:42:11.043503', '通州区', '320612', 3, 'tongzhouqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (902, NULL, NULL, NULL, '2026-05-25 09:42:11.053015', '2026-05-25 09:42:11.053015', '如东县', '320623', 3, 'rudongxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (903, NULL, NULL, NULL, '2026-05-25 09:42:11.061041', '2026-05-25 09:42:11.061041', '南通经济技术开发区', '320671', 3, 'nantongjingjijishukaifaqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (904, NULL, NULL, NULL, '2026-05-25 09:42:11.070045', '2026-05-25 09:42:11.070045', '启东市', '320681', 3, 'qidongshi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (905, NULL, NULL, NULL, '2026-05-25 09:42:11.078509', '2026-05-25 09:42:11.078509', '如皋市', '320682', 3, 'rugaoshi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (906, NULL, NULL, NULL, '2026-05-25 09:42:11.086513', '2026-05-25 09:42:11.086513', '海门市', '320684', 3, 'haimenshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (907, NULL, NULL, NULL, '2026-05-25 09:42:11.095509', '2026-05-25 09:42:11.095509', '海安市', '320685', 3, 'haianshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (908, NULL, NULL, NULL, '2026-05-25 09:42:11.104028', '2026-05-25 09:42:11.104028', '连云港市', '3207', 2, 'lianyungangshi', 'L', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (909, NULL, NULL, NULL, '2026-05-25 09:42:11.113501', '2026-05-25 09:42:11.114509', '连云区', '320703', 3, 'lianyunqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (910, NULL, NULL, NULL, '2026-05-25 09:42:11.121502', '2026-05-25 09:42:11.121502', '海州区', '320706', 3, 'haizhouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (911, NULL, NULL, NULL, '2026-05-25 09:42:11.129583', '2026-05-25 09:42:11.129583', '赣榆区', '320707', 3, 'ganyuqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (912, NULL, NULL, NULL, '2026-05-25 09:42:11.138586', '2026-05-25 09:42:11.138586', '东海县', '320722', 3, 'donghaixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (913, NULL, NULL, NULL, '2026-05-25 09:42:11.146576', '2026-05-25 09:42:11.146576', '灌云县', '320723', 3, 'guanyunxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (914, NULL, NULL, NULL, '2026-05-25 09:42:11.156703', '2026-05-25 09:42:11.156703', '灌南县', '320724', 3, 'guannanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (915, NULL, NULL, NULL, '2026-05-25 09:42:11.164627', '2026-05-25 09:42:11.164627', '连云港经济技术开发区', '320771', 3, 'lianyungangjingjijishukaifaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (916, NULL, NULL, NULL, '2026-05-25 09:42:11.173570', '2026-05-25 09:42:11.173570', '连云港高新技术产业开发区', '320772', 3, 'lianyunganggaoxinjishuchanyekaifaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (917, NULL, NULL, NULL, '2026-05-25 09:42:11.182571', '2026-05-25 09:42:11.182571', '淮安市', '3208', 2, 'huaianshi', 'H', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (918, NULL, NULL, NULL, '2026-05-25 09:42:11.192577', '2026-05-25 09:42:11.192577', '淮安区', '320803', 3, 'huaianqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (919, NULL, NULL, NULL, '2026-05-25 09:42:11.201576', '2026-05-25 09:42:11.201576', '淮阴区', '320804', 3, 'huaiyinqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (920, NULL, NULL, NULL, '2026-05-25 09:42:11.209994', '2026-05-25 09:42:11.209994', '清江浦区', '320812', 3, 'qingjiangpuqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (921, NULL, NULL, NULL, '2026-05-25 09:42:11.217994', '2026-05-25 09:42:11.217994', '洪泽区', '320813', 3, 'hongzequ', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (922, NULL, NULL, NULL, '2026-05-25 09:42:11.226057', '2026-05-25 09:42:11.226057', '涟水县', '320826', 3, 'lianshuixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (923, NULL, NULL, NULL, '2026-05-25 09:42:11.233072', '2026-05-25 09:42:11.233072', '盱眙县', '320830', 3, 'xuyixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (924, NULL, NULL, NULL, '2026-05-25 09:42:11.241252', '2026-05-25 09:42:11.241252', '金湖县', '320831', 3, 'jinhuxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (925, NULL, NULL, NULL, '2026-05-25 09:42:11.250256', '2026-05-25 09:42:11.250256', '淮安经济技术开发区', '320871', 3, 'huaianjingjijishukaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (926, NULL, NULL, NULL, '2026-05-25 09:42:11.258304', '2026-05-25 09:42:11.258304', '盐城市', '3209', 2, 'yanchengshi', 'Y', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (927, NULL, NULL, NULL, '2026-05-25 09:42:11.266913', '2026-05-25 09:42:11.266913', '亭湖区', '320902', 3, 'tinghuqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (928, NULL, NULL, NULL, '2026-05-25 09:42:11.276112', '2026-05-25 09:42:11.277108', '盐都区', '320903', 3, 'yandouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (929, NULL, NULL, NULL, '2026-05-25 09:42:11.286112', '2026-05-25 09:42:11.286112', '大丰区', '320904', 3, 'dafengqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (930, NULL, NULL, NULL, '2026-05-25 09:42:11.295108', '2026-05-25 09:42:11.295108', '响水县', '320921', 3, 'xiangshuixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (931, NULL, NULL, NULL, '2026-05-25 09:42:11.304235', '2026-05-25 09:42:11.304235', '滨海县', '320922', 3, 'binhaixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (932, NULL, NULL, NULL, '2026-05-25 09:42:11.313306', '2026-05-25 09:42:11.313306', '阜宁县', '320923', 3, 'funingxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (933, NULL, NULL, NULL, '2026-05-25 09:42:11.321179', '2026-05-25 09:42:11.321179', '射阳县', '320924', 3, 'sheyangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (934, NULL, NULL, NULL, '2026-05-25 09:42:11.329178', '2026-05-25 09:42:11.329178', '建湖县', '320925', 3, 'jianhuxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (935, NULL, NULL, NULL, '2026-05-25 09:42:11.337985', '2026-05-25 09:42:11.337985', '盐城经济技术开发区', '320971', 3, 'yanchengjingjijishukaifaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (936, NULL, NULL, NULL, '2026-05-25 09:42:11.347156', '2026-05-25 09:42:11.347156', '东台市', '320981', 3, 'dongtaishi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (937, NULL, NULL, NULL, '2026-05-25 09:42:11.357160', '2026-05-25 09:42:11.357160', '扬州市', '3210', 2, 'yangzhoushi', 'Y', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (938, NULL, NULL, NULL, '2026-05-25 09:42:11.366436', '2026-05-25 09:42:11.366436', '广陵区', '321002', 3, 'guanglingqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (939, NULL, NULL, NULL, '2026-05-25 09:42:11.373909', '2026-05-25 09:42:11.373909', '邗江区', '321003', 3, 'hanjiangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (940, NULL, NULL, NULL, '2026-05-25 09:42:11.382191', '2026-05-25 09:42:11.382191', '江都区', '321012', 3, 'jiangduqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (941, NULL, NULL, NULL, '2026-05-25 09:42:11.391286', '2026-05-25 09:42:11.391286', '宝应县', '321023', 3, 'baoyingxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (942, NULL, NULL, NULL, '2026-05-25 09:42:11.399286', '2026-05-25 09:42:11.399286', '扬州经济技术开发区', '321071', 3, 'yangzhoujingjijishukaifaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (943, NULL, NULL, NULL, '2026-05-25 09:42:11.409037', '2026-05-25 09:42:11.409037', '仪征市', '321081', 3, 'yizhengshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (944, NULL, NULL, NULL, '2026-05-25 09:42:11.418044', '2026-05-25 09:42:11.418044', '高邮市', '321084', 3, 'gaoyoushi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (945, NULL, NULL, NULL, '2026-05-25 09:42:11.426044', '2026-05-25 09:42:11.426044', '镇江市', '3211', 2, 'zhenjiangshi', 'Z', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (946, NULL, NULL, NULL, '2026-05-25 09:42:11.436044', '2026-05-25 09:42:11.436044', '京口区', '321102', 3, 'jingkouqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (947, NULL, NULL, NULL, '2026-05-25 09:42:11.443634', '2026-05-25 09:42:11.443634', '润州区', '321111', 3, 'runzhouqu', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (948, NULL, NULL, NULL, '2026-05-25 09:42:11.451639', '2026-05-25 09:42:11.451639', '丹徒区', '321112', 3, 'dantuqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (949, NULL, NULL, NULL, '2026-05-25 09:42:11.459034', '2026-05-25 09:42:11.459034', '镇江新区', '321171', 3, 'zhenjiangxinqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (950, NULL, NULL, NULL, '2026-05-25 09:42:11.469033', '2026-05-25 09:42:11.469033', '丹阳市', '321181', 3, 'danyangshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (951, NULL, NULL, NULL, '2026-05-25 09:42:11.476035', '2026-05-25 09:42:11.476035', '扬中市', '321182', 3, 'yangzhongshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (952, NULL, NULL, NULL, '2026-05-25 09:42:11.484060', '2026-05-25 09:42:11.484060', '句容市', '321183', 3, 'jurongshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (953, NULL, NULL, NULL, '2026-05-25 09:42:11.494060', '2026-05-25 09:42:11.494060', '泰州市', '3212', 2, 'taizhoushi', 'T', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (954, NULL, NULL, NULL, '2026-05-25 09:42:11.508146', '2026-05-25 09:42:11.508146', '海陵区', '321202', 3, 'hailingqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (955, NULL, NULL, NULL, '2026-05-25 09:42:11.527562', '2026-05-25 09:42:11.527562', '高港区', '321203', 3, 'gaogangqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (956, NULL, NULL, NULL, '2026-05-25 09:42:11.536558', '2026-05-25 09:42:11.536558', '姜堰区', '321204', 3, 'jiangyanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (957, NULL, NULL, NULL, '2026-05-25 09:42:11.546552', '2026-05-25 09:42:11.546552', '泰州医药高新技术产业开发区', '321271', 3, 'taizhouyiyaogaoxinjishuchanyekaifaqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (958, NULL, NULL, NULL, '2026-05-25 09:42:11.555022', '2026-05-25 09:42:11.555022', '兴化市', '321281', 3, 'xinghuashi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (959, NULL, NULL, NULL, '2026-05-25 09:42:11.563235', '2026-05-25 09:42:11.563235', '靖江市', '321282', 3, 'jingjiangshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (960, NULL, NULL, NULL, '2026-05-25 09:42:11.572012', '2026-05-25 09:42:11.572012', '泰兴市', '321283', 3, 'taixingshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (961, NULL, NULL, NULL, '2026-05-25 09:42:11.582540', '2026-05-25 09:42:11.582540', '宿迁市', '3213', 2, 'suqianshi', 'S', 1, NULL, '120115');
INSERT INTO `dvadmin_system_area` VALUES (962, NULL, NULL, NULL, '2026-05-25 09:42:11.591546', '2026-05-25 09:42:11.591546', '宿城区', '321302', 3, 'suchengqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (963, NULL, NULL, NULL, '2026-05-25 09:42:11.598814', '2026-05-25 09:42:11.598814', '宿豫区', '321311', 3, 'suyuqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (964, NULL, NULL, NULL, '2026-05-25 09:42:11.607811', '2026-05-25 09:42:11.607811', '沭阳县', '321322', 3, 'shuyangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (965, NULL, NULL, NULL, '2026-05-25 09:42:11.615813', '2026-05-25 09:42:11.615813', '泗阳县', '321323', 3, 'siyangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (966, NULL, NULL, NULL, '2026-05-25 09:42:11.624799', '2026-05-25 09:42:11.624799', '泗洪县', '321324', 3, 'sihongxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (967, NULL, NULL, NULL, '2026-05-25 09:42:11.631806', '2026-05-25 09:42:11.631806', '宿迁经济技术开发区', '321371', 3, 'suqianjingjijishukaifaqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (968, NULL, NULL, NULL, '2026-05-25 09:42:11.640102', '2026-04-03 10:10:04.996000', '浙江省', '33', 1, 'zhejiangsheng', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (969, NULL, NULL, NULL, '2026-05-25 09:42:11.648115', '2026-05-25 09:42:11.648115', '杭州市', '3301', 2, 'hangzhoushi', 'H', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (970, NULL, NULL, NULL, '2026-05-25 09:42:11.656110', '2026-05-25 09:42:11.656110', '上城区', '330102', 3, 'shangchengqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (971, NULL, NULL, NULL, '2026-05-25 09:42:11.664159', '2026-05-25 09:42:11.664159', '下城区', '330103', 3, 'xiachengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (972, NULL, NULL, NULL, '2026-05-25 09:42:11.674299', '2026-05-25 09:42:11.674299', '江干区', '330104', 3, 'jiangganqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (973, NULL, NULL, NULL, '2026-05-25 09:42:11.683581', '2026-05-25 09:42:11.683581', '拱墅区', '330105', 3, 'gongshuqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (974, NULL, NULL, NULL, '2026-05-25 09:42:11.692590', '2026-05-25 09:42:11.692590', '西湖区', '330106', 3, 'xihuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (975, NULL, NULL, NULL, '2026-05-25 09:42:11.702549', '2026-05-25 09:42:11.702549', '滨江区', '330108', 3, 'binjiangqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (976, NULL, NULL, NULL, '2026-05-25 09:42:11.710549', '2026-05-25 09:42:11.710549', '萧山区', '330109', 3, 'xiaoshanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (977, NULL, NULL, NULL, '2026-05-25 09:42:11.722302', '2026-05-25 09:42:11.722302', '余杭区', '330110', 3, 'yuhangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (978, NULL, NULL, NULL, '2026-05-25 09:42:11.730013', '2026-05-25 09:42:11.730013', '富阳区', '330111', 3, 'fuyangqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (979, NULL, NULL, NULL, '2026-05-25 09:42:11.737484', '2026-05-25 09:42:11.737484', '临安区', '330112', 3, 'linanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (980, NULL, NULL, NULL, '2026-05-25 09:42:11.745933', '2026-05-25 09:42:11.745933', '桐庐县', '330122', 3, 'tongluxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (981, NULL, NULL, NULL, '2026-05-25 09:42:11.757922', '2026-05-25 09:42:11.757922', '淳安县', '330127', 3, 'chunanxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (982, NULL, NULL, NULL, '2026-05-25 09:42:11.767931', '2026-05-25 09:42:11.767931', '建德市', '330182', 3, 'jiandeshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (983, NULL, NULL, NULL, '2026-05-25 09:42:11.774928', '2026-05-25 09:42:11.774928', '宁波市', '3302', 2, 'ningboshi', 'N', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (984, NULL, NULL, NULL, '2026-05-25 09:42:11.782967', '2026-05-25 09:42:11.782967', '海曙区', '330203', 3, 'haishuqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (985, NULL, NULL, NULL, '2026-05-25 09:42:11.791008', '2026-05-25 09:42:11.791008', '江北区', '330205', 3, 'jiangbeiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (986, NULL, NULL, NULL, '2026-05-25 09:42:11.800000', '2026-05-25 09:42:11.800000', '北仑区', '330206', 3, 'beilunqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (987, NULL, NULL, NULL, '2026-05-25 09:42:11.808008', '2026-05-25 09:42:11.808008', '镇海区', '330211', 3, 'zhenhaiqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (988, NULL, NULL, NULL, '2026-05-25 09:42:11.816483', '2026-05-25 09:42:11.816483', '鄞州区', '330212', 3, 'yinzhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (989, NULL, NULL, NULL, '2026-05-25 09:42:11.825523', '2026-05-25 09:42:11.825523', '奉化区', '330213', 3, 'fenghuaqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (990, NULL, NULL, NULL, '2026-05-25 09:42:11.832520', '2026-05-25 09:42:11.832520', '象山县', '330225', 3, 'xiangshanxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (991, NULL, NULL, NULL, '2026-05-25 09:42:11.840984', '2026-05-25 09:42:11.840984', '宁海县', '330226', 3, 'ninghaixian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (992, NULL, NULL, NULL, '2026-05-25 09:42:11.849037', '2026-05-25 09:42:11.849037', '余姚市', '330281', 3, 'yuyaoshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (993, NULL, NULL, NULL, '2026-05-25 09:42:11.856998', '2026-05-25 09:42:11.856998', '慈溪市', '330282', 3, 'cixishi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (994, NULL, NULL, NULL, '2026-05-25 09:42:11.866267', '2026-05-25 09:42:11.866267', '温州市', '3303', 2, 'wenzhoushi', 'W', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (995, NULL, NULL, NULL, '2026-05-25 09:42:11.876284', '2026-05-25 09:42:11.876284', '鹿城区', '330302', 3, 'luchengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (996, NULL, NULL, NULL, '2026-05-25 09:42:11.884285', '2026-05-25 09:42:11.884285', '龙湾区', '330303', 3, 'longwanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (997, NULL, NULL, NULL, '2026-05-25 09:42:11.892429', '2026-05-25 09:42:11.892429', '瓯海区', '330304', 3, 'ouhaiqu', 'O', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (998, NULL, NULL, NULL, '2026-05-25 09:42:11.899813', '2026-05-25 09:42:11.899813', '洞头区', '330305', 3, 'dongtouqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (999, NULL, NULL, NULL, '2026-05-25 09:42:11.908813', '2026-05-25 09:42:11.908813', '永嘉县', '330324', 3, 'yongjiaxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1000, NULL, NULL, NULL, '2026-05-25 09:42:11.917807', '2026-05-25 09:42:11.917807', '平阳县', '330326', 3, 'pingyangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1001, NULL, NULL, NULL, '2026-05-25 09:42:11.927997', '2026-05-25 09:42:11.927997', '苍南县', '330327', 3, 'cangnanxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1002, NULL, NULL, NULL, '2026-05-25 09:42:11.937996', '2026-05-25 09:42:11.937996', '文成县', '330328', 3, 'wenchengxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1003, NULL, NULL, NULL, '2026-05-25 09:42:11.945996', '2026-05-25 09:42:11.945996', '泰顺县', '330329', 3, 'taishunxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1004, NULL, NULL, NULL, '2026-05-25 09:42:11.954995', '2026-05-25 09:42:11.954995', '温州经济技术开发区', '330371', 3, 'wenzhoujingjijishukaifaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1005, NULL, NULL, NULL, '2026-05-25 09:42:11.964831', '2026-05-25 09:42:11.964831', '瑞安市', '330381', 3, 'ruianshi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1006, NULL, NULL, NULL, '2026-05-25 09:42:11.974823', '2026-05-25 09:42:11.974823', '乐清市', '330382', 3, 'yueqingshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1007, NULL, NULL, NULL, '2026-05-25 09:42:11.985885', '2026-05-25 09:42:11.985885', '龙港市', '330383', 3, 'longgangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1008, NULL, NULL, NULL, '2026-05-25 09:42:11.993939', '2026-05-25 09:42:11.993939', '嘉兴市', '3304', 2, 'jiaxingshi', 'J', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (1009, NULL, NULL, NULL, '2026-05-25 09:42:12.001943', '2026-05-25 09:42:12.001943', '南湖区', '330402', 3, 'nanhuqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1010, NULL, NULL, NULL, '2026-05-25 09:42:12.009940', '2026-05-25 09:42:12.009940', '秀洲区', '330411', 3, 'xiuzhouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1011, NULL, NULL, NULL, '2026-05-25 09:42:12.021047', '2026-05-25 09:42:12.021047', '嘉善县', '330421', 3, 'jiashanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1012, NULL, NULL, NULL, '2026-05-25 09:42:12.031291', '2026-05-25 09:42:12.031291', '海盐县', '330424', 3, 'haiyanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1013, NULL, NULL, NULL, '2026-05-25 09:42:12.040370', '2026-05-25 09:42:12.040370', '海宁市', '330481', 3, 'hainingshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1014, NULL, NULL, NULL, '2026-05-25 09:42:12.048371', '2026-05-25 09:42:12.048371', '平湖市', '330482', 3, 'pinghushi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1015, NULL, NULL, NULL, '2026-05-25 09:42:12.056714', '2026-05-25 09:42:12.056714', '桐乡市', '330483', 3, 'tongxiangshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1016, NULL, NULL, NULL, '2026-05-25 09:42:12.065765', '2026-05-25 09:42:12.065765', '湖州市', '3305', 2, 'huzhoushi', 'H', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (1017, NULL, NULL, NULL, '2026-05-25 09:42:12.074415', '2026-05-25 09:42:12.074415', '吴兴区', '330502', 3, 'wuxingqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1018, NULL, NULL, NULL, '2026-05-25 09:42:12.082183', '2026-05-25 09:42:12.082183', '南浔区', '330503', 3, 'nanxunqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1019, NULL, NULL, NULL, '2026-05-25 09:42:12.092187', '2026-05-25 09:42:12.092187', '德清县', '330521', 3, 'deqingxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1020, NULL, NULL, NULL, '2026-05-25 09:42:12.101186', '2026-05-25 09:42:12.101186', '长兴县', '330522', 3, 'changxingxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1021, NULL, NULL, NULL, '2026-05-25 09:42:12.109186', '2026-05-25 09:42:12.109186', '安吉县', '330523', 3, 'anjixian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1022, NULL, NULL, NULL, '2026-05-25 09:42:12.118186', '2026-05-25 09:42:12.118186', '绍兴市', '3306', 2, 'shaoxingshi', 'S', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (1023, NULL, NULL, NULL, '2026-05-25 09:42:12.127185', '2026-05-25 09:42:12.127185', '越城区', '330602', 3, 'yuechengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1024, NULL, NULL, NULL, '2026-05-25 09:42:12.136030', '2026-05-25 09:42:12.136030', '柯桥区', '330603', 3, 'keqiaoqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1025, NULL, NULL, NULL, '2026-05-25 09:42:12.146037', '2026-05-25 09:42:12.146037', '上虞区', '330604', 3, 'shangyuqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1026, NULL, NULL, NULL, '2026-05-25 09:42:12.158153', '2026-05-25 09:42:12.158153', '新昌县', '330624', 3, 'xinchangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1027, NULL, NULL, NULL, '2026-05-25 09:42:12.167042', '2026-05-25 09:42:12.167042', '诸暨市', '330681', 3, 'zhujishi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1028, NULL, NULL, NULL, '2026-05-25 09:42:12.175397', '2026-05-25 09:42:12.175397', '嵊州市', '330683', 3, 'shengzhoushi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1029, NULL, NULL, NULL, '2026-05-25 09:42:12.182397', '2026-05-25 09:42:12.182397', '金华市', '3307', 2, 'jinhuashi', 'J', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (1030, NULL, NULL, NULL, '2026-05-25 09:42:12.192076', '2026-05-25 09:42:12.192076', '婺城区', '330702', 3, 'wuchengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1031, NULL, NULL, NULL, '2026-05-25 09:42:12.201187', '2026-05-25 09:42:12.201187', '金东区', '330703', 3, 'jindongqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1032, NULL, NULL, NULL, '2026-05-25 09:42:12.209192', '2026-05-25 09:42:12.209192', '武义县', '330723', 3, 'wuyixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1033, NULL, NULL, NULL, '2026-05-25 09:42:12.218188', '2026-05-25 09:42:12.218188', '浦江县', '330726', 3, 'pujiangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1034, NULL, NULL, NULL, '2026-05-25 09:42:12.226188', '2026-05-25 09:42:12.226188', '磐安县', '330727', 3, 'pananxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1035, NULL, NULL, NULL, '2026-05-25 09:42:12.235180', '2026-05-25 09:42:12.235180', '兰溪市', '330781', 3, 'lanxishi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1036, NULL, NULL, NULL, '2026-05-25 09:42:12.244180', '2026-05-25 09:42:12.244180', '义乌市', '330782', 3, 'yiwushi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1037, NULL, NULL, NULL, '2026-05-25 09:42:12.252188', '2026-05-25 09:42:12.252188', '东阳市', '330783', 3, 'dongyangshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1038, NULL, NULL, NULL, '2026-05-25 09:42:12.260002', '2026-05-25 09:42:12.260002', '永康市', '330784', 3, 'yongkangshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1039, NULL, NULL, NULL, '2026-05-25 09:42:12.268055', '2026-05-25 09:42:12.268055', '衢州市', '3308', 2, 'quzhoushi', 'Q', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (1040, NULL, NULL, NULL, '2026-05-25 09:42:12.275816', '2026-05-25 09:42:12.275816', '柯城区', '330802', 3, 'kechengqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1041, NULL, NULL, NULL, '2026-05-25 09:42:12.283816', '2026-05-25 09:42:12.283816', '衢江区', '330803', 3, 'qujiangqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1042, NULL, NULL, NULL, '2026-05-25 09:42:12.293301', '2026-05-25 09:42:12.293301', '常山县', '330822', 3, 'changshanxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1043, NULL, NULL, NULL, '2026-05-25 09:42:12.303298', '2026-05-25 09:42:12.303298', '开化县', '330824', 3, 'kaihuaxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1044, NULL, NULL, NULL, '2026-05-25 09:42:12.313058', '2026-05-25 09:42:12.313058', '龙游县', '330825', 3, 'longyouxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1045, NULL, NULL, NULL, '2026-05-25 09:42:12.323068', '2026-05-25 09:42:12.323068', '江山市', '330881', 3, 'jiangshanshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1046, NULL, NULL, NULL, '2026-05-25 09:42:12.332124', '2026-05-25 09:42:12.332124', '舟山市', '3309', 2, 'zhoushanshi', 'Z', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (1047, NULL, NULL, NULL, '2026-05-25 09:42:12.340125', '2026-05-25 09:42:12.340125', '定海区', '330902', 3, 'dinghaiqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1048, NULL, NULL, NULL, '2026-05-25 09:42:12.349952', '2026-05-25 09:42:12.349952', '普陀区', '330903', 3, 'putuoqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1049, NULL, NULL, NULL, '2026-05-25 09:42:12.358442', '2026-05-25 09:42:12.358442', '岱山县', '330921', 3, 'daishanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1050, NULL, NULL, NULL, '2026-05-25 09:42:12.367453', '2026-05-25 09:42:12.367453', '嵊泗县', '330922', 3, 'shengsixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1051, NULL, NULL, NULL, '2026-05-25 09:42:12.375348', '2026-05-25 09:42:12.375348', '台州市', '3310', 2, 'taizhoushi', 'T', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (1052, NULL, NULL, NULL, '2026-05-25 09:42:12.383349', '2026-05-25 09:42:12.383349', '椒江区', '331002', 3, 'jiaojiangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1053, NULL, NULL, NULL, '2026-05-25 09:42:12.391091', '2026-05-25 09:42:12.391091', '黄岩区', '331003', 3, 'huangyanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1054, NULL, NULL, NULL, '2026-05-25 09:42:12.399093', '2026-05-25 09:42:12.399093', '路桥区', '331004', 3, 'luqiaoqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1055, NULL, NULL, NULL, '2026-05-25 09:42:12.413838', '2026-05-25 09:42:12.413838', '三门县', '331022', 3, 'sanmenxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1056, NULL, NULL, NULL, '2026-05-25 09:42:12.422312', '2026-05-25 09:42:12.422312', '天台县', '331023', 3, 'tiantaixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1057, NULL, NULL, NULL, '2026-05-25 09:42:12.431510', '2026-05-25 09:42:12.431510', '仙居县', '331024', 3, 'xianjuxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1058, NULL, NULL, NULL, '2026-05-25 09:42:12.439504', '2026-05-25 09:42:12.439504', '温岭市', '331081', 3, 'wenlingshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1059, NULL, NULL, NULL, '2026-05-25 09:42:12.451556', '2026-05-25 09:42:12.451556', '临海市', '331082', 3, 'linhaishi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1060, NULL, NULL, NULL, '2026-05-25 09:42:12.460557', '2026-05-25 09:42:12.460557', '玉环市', '331083', 3, 'yuhuanshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1061, NULL, NULL, NULL, '2026-05-25 09:42:12.470557', '2026-05-25 09:42:12.470557', '丽水市', '3311', 2, 'lishuishi', 'L', 1, NULL, '120116');
INSERT INTO `dvadmin_system_area` VALUES (1062, NULL, NULL, NULL, '2026-05-25 09:42:12.479553', '2026-05-25 09:42:12.479553', '莲都区', '331102', 3, 'liandouqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1063, NULL, NULL, NULL, '2026-05-25 09:42:12.488560', '2026-05-25 09:42:12.488560', '青田县', '331121', 3, 'qingtianxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1064, NULL, NULL, NULL, '2026-05-25 09:42:12.497550', '2026-05-25 09:42:12.497550', '缙云县', '331122', 3, 'jinyunxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1065, NULL, NULL, NULL, '2026-05-25 09:42:12.506550', '2026-05-25 09:42:12.506550', '遂昌县', '331123', 3, 'suichangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1066, NULL, NULL, NULL, '2026-05-25 09:42:12.519510', '2026-05-25 09:42:12.519510', '松阳县', '331124', 3, 'songyangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1067, NULL, NULL, NULL, '2026-05-25 09:42:12.537513', '2026-05-25 09:42:12.537513', '云和县', '331125', 3, 'yunhexian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1068, NULL, NULL, NULL, '2026-05-25 09:42:12.548459', '2026-05-25 09:42:12.548459', '庆元县', '331126', 3, 'qingyuanxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1069, NULL, NULL, NULL, '2026-05-25 09:42:12.560451', '2026-05-25 09:42:12.560451', '景宁畲族自治县', '331127', 3, 'jingningshezuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1070, NULL, NULL, NULL, '2026-05-25 09:42:12.569908', '2026-05-25 09:42:12.569908', '龙泉市', '331181', 3, 'longquanshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1071, NULL, NULL, NULL, '2026-05-25 09:42:12.577801', '2026-04-03 10:10:05.000000', '安徽省', '34', 1, 'anhuisheng', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1072, NULL, NULL, NULL, '2026-05-25 09:42:12.584801', '2026-05-25 09:42:12.584801', '合肥市', '3401', 2, 'hefeishi', 'H', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1073, NULL, NULL, NULL, '2026-05-25 09:42:12.594022', '2026-05-25 09:42:12.594022', '瑶海区', '340102', 3, 'yaohaiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1074, NULL, NULL, NULL, '2026-05-25 09:42:12.603033', '2026-05-25 09:42:12.603033', '庐阳区', '340103', 3, 'luyangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1075, NULL, NULL, NULL, '2026-05-25 09:42:12.610033', '2026-05-25 09:42:12.610033', '蜀山区', '340104', 3, 'shushanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1076, NULL, NULL, NULL, '2026-05-25 09:42:12.620084', '2026-05-25 09:42:12.620084', '包河区', '340111', 3, 'baohequ', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1077, NULL, NULL, NULL, '2026-05-25 09:42:12.629109', '2026-05-25 09:42:12.629109', '长丰县', '340121', 3, 'zhangfengxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1078, NULL, NULL, NULL, '2026-05-25 09:42:12.638075', '2026-05-25 09:42:12.638075', '肥东县', '340122', 3, 'feidongxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1079, NULL, NULL, NULL, '2026-05-25 09:42:12.647041', '2026-05-25 09:42:12.647041', '肥西县', '340123', 3, 'feixixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1080, NULL, NULL, NULL, '2026-05-25 09:42:12.655042', '2026-05-25 09:42:12.655042', '庐江县', '340124', 3, 'lujiangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1081, NULL, NULL, NULL, '2026-05-25 09:42:12.663042', '2026-05-25 09:42:12.663042', '合肥高新技术产业开发区', '340171', 3, 'hefeigaoxinjishuchanyekaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1082, NULL, NULL, NULL, '2026-05-25 09:42:12.671074', '2026-05-25 09:42:12.671074', '合肥经济技术开发区', '340172', 3, 'hefeijingjijishukaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1083, NULL, NULL, NULL, '2026-05-25 09:42:12.679066', '2026-05-25 09:42:12.679066', '合肥新站高新技术产业开发区', '340173', 3, 'hefeixinzhangaoxinjishuchanyekaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1084, NULL, NULL, NULL, '2026-05-25 09:42:12.688072', '2026-05-25 09:42:12.688072', '巢湖市', '340181', 3, 'chaohushi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1085, NULL, NULL, NULL, '2026-05-25 09:42:12.698067', '2026-05-25 09:42:12.698067', '芜湖市', '3402', 2, 'wuhushi', 'W', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1086, NULL, NULL, NULL, '2026-05-25 09:42:12.706114', '2026-05-25 09:42:12.706114', '镜湖区', '340202', 3, 'jinghuqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1087, NULL, NULL, NULL, '2026-05-25 09:42:12.716276', '2026-05-25 09:42:12.716276', '弋江区', '340203', 3, 'yijiangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1088, NULL, NULL, NULL, '2026-05-25 09:42:12.724613', '2026-05-25 09:42:12.724613', '鸠江区', '340207', 3, 'jiujiangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1089, NULL, NULL, NULL, '2026-05-25 09:42:12.732878', '2026-05-25 09:42:12.732878', '三山区', '340208', 3, 'sanshanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1090, NULL, NULL, NULL, '2026-05-25 09:42:12.744877', '2026-05-25 09:42:12.744877', '芜湖县', '340221', 3, 'wuhuxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1091, NULL, NULL, NULL, '2026-05-25 09:42:12.754878', '2026-05-25 09:42:12.754878', '繁昌县', '340222', 3, 'fanchangxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1092, NULL, NULL, NULL, '2026-05-25 09:42:12.763878', '2026-05-25 09:42:12.763878', '南陵县', '340223', 3, 'nanlingxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1093, NULL, NULL, NULL, '2026-05-25 09:42:12.775878', '2026-05-25 09:42:12.775878', '芜湖经济技术开发区', '340271', 3, 'wuhujingjijishukaifaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1094, NULL, NULL, NULL, '2026-05-25 09:42:12.783878', '2026-05-25 09:42:12.783878', '安徽芜湖长江大桥经济开发区', '340272', 3, 'anhuiwuhuchangjiangdaqiaojingjikaifaqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1095, NULL, NULL, NULL, '2026-05-25 09:42:12.794471', '2026-05-25 09:42:12.794471', '无为市', '340281', 3, 'wuweishi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1096, NULL, NULL, NULL, '2026-05-25 09:42:12.803470', '2026-05-25 09:42:12.803470', '蚌埠市', '3403', 2, 'bengbushi', 'B', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1097, NULL, NULL, NULL, '2026-05-25 09:42:12.812510', '2026-05-25 09:42:12.812510', '龙子湖区', '340302', 3, 'longzihuqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1098, NULL, NULL, NULL, '2026-05-25 09:42:12.819736', '2026-05-25 09:42:12.819736', '蚌山区', '340303', 3, 'bangshanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1099, NULL, NULL, NULL, '2026-05-25 09:42:12.828737', '2026-05-25 09:42:12.828737', '禹会区', '340304', 3, 'yuhuiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1100, NULL, NULL, NULL, '2026-05-25 09:42:12.840092', '2026-05-25 09:42:12.840092', '淮上区', '340311', 3, 'huaishangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1101, NULL, NULL, NULL, '2026-05-25 09:42:12.849674', '2026-05-25 09:42:12.849674', '怀远县', '340321', 3, 'huaiyuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1102, NULL, NULL, NULL, '2026-05-25 09:42:12.859086', '2026-05-25 09:42:12.859086', '五河县', '340322', 3, 'wuhexian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1103, NULL, NULL, NULL, '2026-05-25 09:42:12.873049', '2026-05-25 09:42:12.873049', '固镇县', '340323', 3, 'guzhenxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1104, NULL, NULL, NULL, '2026-05-25 09:42:12.883234', '2026-05-25 09:42:12.883234', '蚌埠市高新技术开发区', '340371', 3, 'bengbushigaoxinjishukaifaqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1105, NULL, NULL, NULL, '2026-05-25 09:42:12.893235', '2026-05-25 09:42:12.893235', '蚌埠市经济开发区', '340372', 3, 'bengbushijingjikaifaqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1106, NULL, NULL, NULL, '2026-05-25 09:42:12.902240', '2026-05-25 09:42:12.902240', '淮南市', '3404', 2, 'huainanshi', 'H', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1107, NULL, NULL, NULL, '2026-05-25 09:42:12.912236', '2026-05-25 09:42:12.912236', '大通区', '340402', 3, 'datongqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1108, NULL, NULL, NULL, '2026-05-25 09:42:12.920240', '2026-05-25 09:42:12.920240', '田家庵区', '340403', 3, 'tianjiaanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1109, NULL, NULL, NULL, '2026-05-25 09:42:12.931240', '2026-05-25 09:42:12.931240', '谢家集区', '340404', 3, 'xiejiajiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1110, NULL, NULL, NULL, '2026-05-25 09:42:12.940252', '2026-05-25 09:42:12.940252', '八公山区', '340405', 3, 'bagongshanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1111, NULL, NULL, NULL, '2026-05-25 09:42:12.949268', '2026-05-25 09:42:12.949268', '潘集区', '340406', 3, 'panjiqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1112, NULL, NULL, NULL, '2026-05-25 09:42:12.957267', '2026-05-25 09:42:12.957267', '凤台县', '340421', 3, 'fengtaixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1113, NULL, NULL, NULL, '2026-05-25 09:42:12.964268', '2026-05-25 09:42:12.964268', '寿县', '340422', 3, 'shouxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1114, NULL, NULL, NULL, '2026-05-25 09:42:12.973262', '2026-05-25 09:42:12.973262', '马鞍山市', '3405', 2, 'maanshanshi', 'M', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1115, NULL, NULL, NULL, '2026-05-25 09:42:12.982331', '2026-05-25 09:42:12.982331', '花山区', '340503', 3, 'huashanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1116, NULL, NULL, NULL, '2026-05-25 09:42:12.990331', '2026-05-25 09:42:12.990331', '雨山区', '340504', 3, 'yushanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1117, NULL, NULL, NULL, '2026-05-25 09:42:12.999332', '2026-05-25 09:42:12.999332', '博望区', '340506', 3, 'bowangqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1118, NULL, NULL, NULL, '2026-05-25 09:42:13.008331', '2026-05-25 09:42:13.008331', '当涂县', '340521', 3, 'dangtuxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1119, NULL, NULL, NULL, '2026-05-25 09:42:13.016331', '2026-05-25 09:42:13.016331', '含山县', '340522', 3, 'hanshanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1120, NULL, NULL, NULL, '2026-05-25 09:42:13.029325', '2026-05-25 09:42:13.029325', '和县', '340523', 3, 'hexian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1121, NULL, NULL, NULL, '2026-05-25 09:42:13.038325', '2026-05-25 09:42:13.038325', '淮北市', '3406', 2, 'huaibeishi', 'H', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1122, NULL, NULL, NULL, '2026-05-25 09:42:13.046325', '2026-05-25 09:42:13.046325', '杜集区', '340602', 3, 'dujiqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1123, NULL, NULL, NULL, '2026-05-25 09:42:13.055332', '2026-05-25 09:42:13.055332', '相山区', '340603', 3, 'xiangshanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1124, NULL, NULL, NULL, '2026-05-25 09:42:13.065333', '2026-05-25 09:42:13.065333', '烈山区', '340604', 3, 'lieshanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1125, NULL, NULL, NULL, '2026-05-25 09:42:13.074332', '2026-05-25 09:42:13.074332', '濉溪县', '340621', 3, 'suixixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1126, NULL, NULL, NULL, '2026-05-25 09:42:13.082331', '2026-05-25 09:42:13.082331', '铜陵市', '3407', 2, 'tonglingshi', 'T', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1127, NULL, NULL, NULL, '2026-05-25 09:42:13.090331', '2026-05-25 09:42:13.090331', '铜官区', '340705', 3, 'tongguanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1128, NULL, NULL, NULL, '2026-05-25 09:42:13.100331', '2026-05-25 09:42:13.100331', '义安区', '340706', 3, 'yianqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1129, NULL, NULL, NULL, '2026-05-25 09:42:13.110335', '2026-05-25 09:42:13.110335', '郊区', '340711', 3, 'jiaoqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1130, NULL, NULL, NULL, '2026-05-25 09:42:13.119332', '2026-05-25 09:42:13.119332', '枞阳县', '340722', 3, 'zongyangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1131, NULL, NULL, NULL, '2026-05-25 09:42:13.127337', '2026-05-25 09:42:13.127337', '安庆市', '3408', 2, 'anqingshi', 'A', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1132, NULL, NULL, NULL, '2026-05-25 09:42:13.136331', '2026-05-25 09:42:13.136331', '迎江区', '340802', 3, 'yingjiangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1133, NULL, NULL, NULL, '2026-05-25 09:42:13.146331', '2026-05-25 09:42:13.146331', '大观区', '340803', 3, 'daguanqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1134, NULL, NULL, NULL, '2026-05-25 09:42:13.156325', '2026-05-25 09:42:13.156325', '宜秀区', '340811', 3, 'yixiuqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1135, NULL, NULL, NULL, '2026-05-25 09:42:13.166327', '2026-05-25 09:42:13.166327', '怀宁县', '340822', 3, 'huainingxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1136, NULL, NULL, NULL, '2026-05-25 09:42:13.175417', '2026-05-25 09:42:13.175417', '太湖县', '340825', 3, 'taihuxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1137, NULL, NULL, NULL, '2026-05-25 09:42:13.184412', '2026-05-25 09:42:13.184412', '宿松县', '340826', 3, 'susongxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1138, NULL, NULL, NULL, '2026-05-25 09:42:13.193411', '2026-05-25 09:42:13.193411', '望江县', '340827', 3, 'wangjiangxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1139, NULL, NULL, NULL, '2026-05-25 09:42:13.203417', '2026-05-25 09:42:13.203417', '岳西县', '340828', 3, 'yuexixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1140, NULL, NULL, NULL, '2026-05-25 09:42:13.212411', '2026-05-25 09:42:13.212411', '安徽安庆经济开发区', '340871', 3, 'anhuianqingjingjikaifaqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1141, NULL, NULL, NULL, '2026-05-25 09:42:13.222411', '2026-05-25 09:42:13.222411', '桐城市', '340881', 3, 'tongchengshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1142, NULL, NULL, NULL, '2026-05-25 09:42:13.230411', '2026-05-25 09:42:13.230411', '潜山市', '340882', 3, 'qianshanshi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1143, NULL, NULL, NULL, '2026-05-25 09:42:13.241419', '2026-05-25 09:42:13.241419', '黄山市', '3410', 2, 'huangshanshi', 'H', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1144, NULL, NULL, NULL, '2026-05-25 09:42:13.249417', '2026-05-25 09:42:13.249417', '屯溪区', '341002', 3, 'tunxiqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1145, NULL, NULL, NULL, '2026-05-25 09:42:13.259411', '2026-05-25 09:42:13.259411', '黄山区', '341003', 3, 'huangshanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1146, NULL, NULL, NULL, '2026-05-25 09:42:13.268414', '2026-05-25 09:42:13.268414', '徽州区', '341004', 3, 'huizhouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1147, NULL, NULL, NULL, '2026-05-25 09:42:13.277411', '2026-05-25 09:42:13.277411', '歙县', '341021', 3, 'shexian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1148, NULL, NULL, NULL, '2026-05-25 09:42:13.286411', '2026-05-25 09:42:13.286411', '休宁县', '341022', 3, 'xiuningxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1149, NULL, NULL, NULL, '2026-05-25 09:42:13.294421', '2026-05-25 09:42:13.294421', '黟县', '341023', 3, 'yixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1150, NULL, NULL, NULL, '2026-05-25 09:42:13.303993', '2026-05-25 09:42:13.303993', '祁门县', '341024', 3, 'qimenxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1151, NULL, NULL, NULL, '2026-05-25 09:42:13.311993', '2026-05-25 09:42:13.311993', '滁州市', '3411', 2, 'chuzhoushi', 'C', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1152, NULL, NULL, NULL, '2026-05-25 09:42:13.319993', '2026-05-25 09:42:13.319993', '琅琊区', '341102', 3, 'langyaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1153, NULL, NULL, NULL, '2026-05-25 09:42:13.328988', '2026-05-25 09:42:13.328988', '南谯区', '341103', 3, 'nanqiaoqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1154, NULL, NULL, NULL, '2026-05-25 09:42:13.339037', '2026-05-25 09:42:13.339037', '来安县', '341122', 3, 'laianxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1155, NULL, NULL, NULL, '2026-05-25 09:42:13.346808', '2026-05-25 09:42:13.346808', '全椒县', '341124', 3, 'quanjiaoxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1156, NULL, NULL, NULL, '2026-05-25 09:42:13.355807', '2026-05-25 09:42:13.355807', '定远县', '341125', 3, 'dingyuanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1157, NULL, NULL, NULL, '2026-05-25 09:42:13.365021', '2026-05-25 09:42:13.365021', '凤阳县', '341126', 3, 'fengyangxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1158, NULL, NULL, NULL, '2026-05-25 09:42:13.374091', '2026-05-25 09:42:13.374091', '苏滁现代产业园', '341171', 3, 'suchuxiandaichanyeyuan', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1159, NULL, NULL, NULL, '2026-05-25 09:42:13.385090', '2026-05-25 09:42:13.385090', '滁州经济技术开发区', '341172', 3, 'chuzhoujingjijishukaifaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1160, NULL, NULL, NULL, '2026-05-25 09:42:13.395024', '2026-05-25 09:42:13.395024', '天长市', '341181', 3, 'tianzhangshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1161, NULL, NULL, NULL, '2026-05-25 09:42:13.403376', '2026-05-25 09:42:13.403376', '明光市', '341182', 3, 'mingguangshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1162, NULL, NULL, NULL, '2026-05-25 09:42:13.414375', '2026-05-25 09:42:13.414375', '阜阳市', '3412', 2, 'fuyangshi', 'F', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1163, NULL, NULL, NULL, '2026-05-25 09:42:13.423962', '2026-05-25 09:42:13.423962', '颍州区', '341202', 3, 'yingzhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1164, NULL, NULL, NULL, '2026-05-25 09:42:13.434147', '2026-05-25 09:42:13.434147', '颍东区', '341203', 3, 'yingdongqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1165, NULL, NULL, NULL, '2026-05-25 09:42:13.444148', '2026-05-25 09:42:13.444148', '颍泉区', '341204', 3, 'yingquanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1166, NULL, NULL, NULL, '2026-05-25 09:42:13.454537', '2026-05-25 09:42:13.454537', '临泉县', '341221', 3, 'linquanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1167, NULL, NULL, NULL, '2026-05-25 09:42:13.464540', '2026-05-25 09:42:13.464540', '太和县', '341222', 3, 'taihexian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1168, NULL, NULL, NULL, '2026-05-25 09:42:13.472541', '2026-05-25 09:42:13.472541', '阜南县', '341225', 3, 'funanxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1169, NULL, NULL, NULL, '2026-05-25 09:42:13.483717', '2026-05-25 09:42:13.483717', '颍上县', '341226', 3, 'yingshangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1170, NULL, NULL, NULL, '2026-05-25 09:42:13.494813', '2026-05-25 09:42:13.494813', '阜阳合肥现代产业园区', '341271', 3, 'fuyanghefeixiandaichanyeyuanqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1171, NULL, NULL, NULL, '2026-05-25 09:42:13.503813', '2026-05-25 09:42:13.503813', '阜阳经济技术开发区', '341272', 3, 'fuyangjingjijishukaifaqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1172, NULL, NULL, NULL, '2026-05-25 09:42:13.512813', '2026-05-25 09:42:13.512813', '界首市', '341282', 3, 'jieshoushi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1173, NULL, NULL, NULL, '2026-05-25 09:42:13.520807', '2026-05-25 09:42:13.520807', '宿州市', '3413', 2, 'suzhoushi', 'S', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1174, NULL, NULL, NULL, '2026-05-25 09:42:13.536873', '2026-05-25 09:42:13.536873', '埇桥区', '341302', 3, 'yongqiaoqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1175, NULL, NULL, NULL, '2026-05-25 09:42:13.546867', '2026-05-25 09:42:13.546867', '砀山县', '341321', 3, 'dangshanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1176, NULL, NULL, NULL, '2026-05-25 09:42:13.555368', '2026-05-25 09:42:13.555368', '萧县', '341322', 3, 'xiaoxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1177, NULL, NULL, NULL, '2026-05-25 09:42:13.563369', '2026-05-25 09:42:13.563369', '灵璧县', '341323', 3, 'lingbixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1178, NULL, NULL, NULL, '2026-05-25 09:42:13.571050', '2026-05-25 09:42:13.571050', '泗县', '341324', 3, 'sixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1179, NULL, NULL, NULL, '2026-05-25 09:42:13.578217', '2026-05-25 09:42:13.578217', '宿州马鞍山现代产业园区', '341371', 3, 'suzhoumaanshanxiandaichanyeyuanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1180, NULL, NULL, NULL, '2026-05-25 09:42:13.586037', '2026-05-25 09:42:13.586037', '宿州经济技术开发区', '341372', 3, 'suzhoujingjijishukaifaqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1181, NULL, NULL, NULL, '2026-05-25 09:42:13.595042', '2026-05-25 09:42:13.595042', '六安市', '3415', 2, 'luanshi', 'L', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1182, NULL, NULL, NULL, '2026-05-25 09:42:13.603042', '2026-05-25 09:42:13.603042', '金安区', '341502', 3, 'jinanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1183, NULL, NULL, NULL, '2026-05-25 09:42:13.611036', '2026-05-25 09:42:13.611036', '裕安区', '341503', 3, 'yuanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1184, NULL, NULL, NULL, '2026-05-25 09:42:13.620043', '2026-05-25 09:42:13.620043', '叶集区', '341504', 3, 'yejiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1185, NULL, NULL, NULL, '2026-05-25 09:42:13.629045', '2026-05-25 09:42:13.629045', '霍邱县', '341522', 3, 'huoqiuxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1186, NULL, NULL, NULL, '2026-05-25 09:42:13.638040', '2026-05-25 09:42:13.638040', '舒城县', '341523', 3, 'shuchengxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1187, NULL, NULL, NULL, '2026-05-25 09:42:13.648460', '2026-05-25 09:42:13.648460', '金寨县', '341524', 3, 'jinzhaixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1188, NULL, NULL, NULL, '2026-05-25 09:42:13.658135', '2026-05-25 09:42:13.658135', '霍山县', '341525', 3, 'huoshanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1189, NULL, NULL, NULL, '2026-05-25 09:42:13.666104', '2026-05-25 09:42:13.666104', '亳州市', '3416', 2, 'bozhoushi', 'B', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1190, NULL, NULL, NULL, '2026-05-25 09:42:13.680172', '2026-05-25 09:42:13.680172', '谯城区', '341602', 3, 'qiaochengqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1191, NULL, NULL, NULL, '2026-05-25 09:42:13.688187', '2026-05-25 09:42:13.688187', '涡阳县', '341621', 3, 'woyangxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1192, NULL, NULL, NULL, '2026-05-25 09:42:13.696194', '2026-05-25 09:42:13.696194', '蒙城县', '341622', 3, 'mengchengxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1193, NULL, NULL, NULL, '2026-05-25 09:42:13.705831', '2026-05-25 09:42:13.705831', '利辛县', '341623', 3, 'lixinxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1194, NULL, NULL, NULL, '2026-05-25 09:42:13.713835', '2026-05-25 09:42:13.713835', '池州市', '3417', 2, 'chizhoushi', 'C', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1195, NULL, NULL, NULL, '2026-05-25 09:42:13.723101', '2026-05-25 09:42:13.723101', '贵池区', '341702', 3, 'guichiqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1196, NULL, NULL, NULL, '2026-05-25 09:42:13.732243', '2026-05-25 09:42:13.732243', '东至县', '341721', 3, 'dongzhixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1197, NULL, NULL, NULL, '2026-05-25 09:42:13.741246', '2026-05-25 09:42:13.741246', '石台县', '341722', 3, 'shitaixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1198, NULL, NULL, NULL, '2026-05-25 09:42:13.750721', '2026-05-25 09:42:13.750721', '青阳县', '341723', 3, 'qingyangxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1199, NULL, NULL, NULL, '2026-05-25 09:42:13.759462', '2026-05-25 09:42:13.759462', '宣城市', '3418', 2, 'xuanchengshi', 'X', 1, NULL, '120117');
INSERT INTO `dvadmin_system_area` VALUES (1200, NULL, NULL, NULL, '2026-05-25 09:42:13.768463', '2026-05-25 09:42:13.768463', '宣州区', '341802', 3, 'xuanzhouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1201, NULL, NULL, NULL, '2026-05-25 09:42:13.777464', '2026-05-25 09:42:13.777464', '郎溪县', '341821', 3, 'langxixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1202, NULL, NULL, NULL, '2026-05-25 09:42:13.787466', '2026-05-25 09:42:13.787466', '泾县', '341823', 3, 'jingxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1203, NULL, NULL, NULL, '2026-05-25 09:42:13.802465', '2026-05-25 09:42:13.802465', '绩溪县', '341824', 3, 'jixixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1204, NULL, NULL, NULL, '2026-05-25 09:42:13.810464', '2026-05-25 09:42:13.810464', '旌德县', '341825', 3, 'jingdexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1205, NULL, NULL, NULL, '2026-05-25 09:42:13.819464', '2026-05-25 09:42:13.819464', '宣城市经济开发区', '341871', 3, 'xuanchengshijingjikaifaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1206, NULL, NULL, NULL, '2026-05-25 09:42:13.827464', '2026-05-25 09:42:13.827464', '宁国市', '341881', 3, 'ningguoshi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1207, NULL, NULL, NULL, '2026-05-25 09:42:13.835973', '2026-05-25 09:42:13.835973', '广德市', '341882', 3, 'guangdeshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1208, NULL, NULL, NULL, '2026-05-25 09:42:13.843702', '2026-04-03 10:10:05.005000', '福建省', '35', 1, 'fujiansheng', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1209, NULL, NULL, NULL, '2026-05-25 09:42:13.851252', '2026-05-25 09:42:13.851252', '福州市', '3501', 2, 'fuzhoushi', 'F', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1210, NULL, NULL, NULL, '2026-05-25 09:42:13.859519', '2026-05-25 09:42:13.859519', '鼓楼区', '350102', 3, 'gulouqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1211, NULL, NULL, NULL, '2026-05-25 09:42:13.867518', '2026-05-25 09:42:13.867518', '台江区', '350103', 3, 'taijiangqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1212, NULL, NULL, NULL, '2026-05-25 09:42:13.875531', '2026-05-25 09:42:13.875531', '仓山区', '350104', 3, 'cangshanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1213, NULL, NULL, NULL, '2026-05-25 09:42:13.885517', '2026-05-25 09:42:13.885517', '马尾区', '350105', 3, 'mayiqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1214, NULL, NULL, NULL, '2026-05-25 09:42:13.893520', '2026-05-25 09:42:13.893520', '晋安区', '350111', 3, 'jinanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1215, NULL, NULL, NULL, '2026-05-25 09:42:13.902055', '2026-05-25 09:42:13.902055', '长乐区', '350112', 3, 'changlequ', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1216, NULL, NULL, NULL, '2026-05-25 09:42:13.912819', '2026-05-25 09:42:13.912819', '闽侯县', '350121', 3, 'minhouxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1217, NULL, NULL, NULL, '2026-05-25 09:42:13.922834', '2026-05-25 09:42:13.922834', '连江县', '350122', 3, 'lianjiangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1218, NULL, NULL, NULL, '2026-05-25 09:42:13.936342', '2026-05-25 09:42:13.936342', '罗源县', '350123', 3, 'luoyuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1219, NULL, NULL, NULL, '2026-05-25 09:42:13.948876', '2026-05-25 09:42:13.948876', '闽清县', '350124', 3, 'minqingxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1220, NULL, NULL, NULL, '2026-05-25 09:42:13.960101', '2026-05-25 09:42:13.960101', '永泰县', '350125', 3, 'yongtaixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1221, NULL, NULL, NULL, '2026-05-25 09:42:13.967822', '2026-05-25 09:42:13.967822', '平潭县', '350128', 3, 'pingtanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1222, NULL, NULL, NULL, '2026-05-25 09:42:13.974822', '2026-05-25 09:42:13.974822', '福清市', '350181', 3, 'fuqingshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1223, NULL, NULL, NULL, '2026-05-25 09:42:13.982949', '2026-05-25 09:42:13.982949', '厦门市', '3502', 2, 'xiamenshi', 'X', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1224, NULL, NULL, NULL, '2026-05-25 09:42:13.990142', '2026-05-25 09:42:13.990142', '思明区', '350203', 3, 'simingqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1225, NULL, NULL, NULL, '2026-05-25 09:42:13.999147', '2026-05-25 09:42:13.999147', '海沧区', '350205', 3, 'haicangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1226, NULL, NULL, NULL, '2026-05-25 09:42:14.009147', '2026-05-25 09:42:14.009147', '湖里区', '350206', 3, 'huliqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1227, NULL, NULL, NULL, '2026-05-25 09:42:14.017140', '2026-05-25 09:42:14.017140', '集美区', '350211', 3, 'jimeiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1228, NULL, NULL, NULL, '2026-05-25 09:42:14.025141', '2026-05-25 09:42:14.025141', '同安区', '350212', 3, 'tonganqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1229, NULL, NULL, NULL, '2026-05-25 09:42:14.033146', '2026-05-25 09:42:14.033146', '翔安区', '350213', 3, 'xianganqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1230, NULL, NULL, NULL, '2026-05-25 09:42:14.042146', '2026-05-25 09:42:14.042146', '莆田市', '3503', 2, 'putianshi', 'P', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1231, NULL, NULL, NULL, '2026-05-25 09:42:14.052141', '2026-05-25 09:42:14.052141', '城厢区', '350302', 3, 'chengxiangqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1232, NULL, NULL, NULL, '2026-05-25 09:42:14.062147', '2026-05-25 09:42:14.062147', '涵江区', '350303', 3, 'hanjiangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1233, NULL, NULL, NULL, '2026-05-25 09:42:14.070140', '2026-05-25 09:42:14.070140', '荔城区', '350304', 3, 'lichengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1234, NULL, NULL, NULL, '2026-05-25 09:42:14.078849', '2026-05-25 09:42:14.078849', '秀屿区', '350305', 3, 'xiuyuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1235, NULL, NULL, NULL, '2026-05-25 09:42:14.086879', '2026-05-25 09:42:14.086879', '仙游县', '350322', 3, 'xianyouxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1236, NULL, NULL, NULL, '2026-05-25 09:42:14.097342', '2026-05-25 09:42:14.097342', '三明市', '3504', 2, 'sanmingshi', 'S', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1237, NULL, NULL, NULL, '2026-05-25 09:42:14.106583', '2026-05-25 09:42:14.106583', '梅列区', '350402', 3, 'meiliequ', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1238, NULL, NULL, NULL, '2026-05-25 09:42:14.116079', '2026-05-25 09:42:14.116079', '三元区', '350403', 3, 'sanyuanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1239, NULL, NULL, NULL, '2026-05-25 09:42:14.125436', '2026-05-25 09:42:14.125436', '明溪县', '350421', 3, 'mingxixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1240, NULL, NULL, NULL, '2026-05-25 09:42:14.134388', '2026-05-25 09:42:14.134388', '清流县', '350423', 3, 'qingliuxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1241, NULL, NULL, NULL, '2026-05-25 09:42:14.142840', '2026-05-25 09:42:14.142840', '宁化县', '350424', 3, 'ninghuaxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1242, NULL, NULL, NULL, '2026-05-25 09:42:14.151850', '2026-05-25 09:42:14.151850', '大田县', '350425', 3, 'datianxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1243, NULL, NULL, NULL, '2026-05-25 09:42:14.161081', '2026-05-25 09:42:14.161081', '尤溪县', '350426', 3, 'youxixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1244, NULL, NULL, NULL, '2026-05-25 09:42:14.170648', '2026-05-25 09:42:14.170648', '沙县', '350427', 3, 'shaxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1245, NULL, NULL, NULL, '2026-05-25 09:42:14.178543', '2026-05-25 09:42:14.178543', '将乐县', '350428', 3, 'jianglexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1246, NULL, NULL, NULL, '2026-05-25 09:42:14.187773', '2026-05-25 09:42:14.187773', '泰宁县', '350429', 3, 'tainingxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1247, NULL, NULL, NULL, '2026-05-25 09:42:14.196865', '2026-05-25 09:42:14.196865', '建宁县', '350430', 3, 'jianningxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1248, NULL, NULL, NULL, '2026-05-25 09:42:14.205928', '2026-05-25 09:42:14.205928', '永安市', '350481', 3, 'yonganshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1249, NULL, NULL, NULL, '2026-05-25 09:42:14.214664', '2026-05-25 09:42:14.214664', '泉州市', '3505', 2, 'quanzhoushi', 'Q', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1250, NULL, NULL, NULL, '2026-05-25 09:42:14.222670', '2026-05-25 09:42:14.222670', '鲤城区', '350502', 3, 'lichengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1251, NULL, NULL, NULL, '2026-05-25 09:42:14.231046', '2026-05-25 09:42:14.231046', '丰泽区', '350503', 3, 'fengzequ', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1252, NULL, NULL, NULL, '2026-05-25 09:42:14.241044', '2026-05-25 09:42:14.241044', '洛江区', '350504', 3, 'luojiangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1253, NULL, NULL, NULL, '2026-05-25 09:42:14.250044', '2026-05-25 09:42:14.250044', '泉港区', '350505', 3, 'quangangqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1254, NULL, NULL, NULL, '2026-05-25 09:42:14.258359', '2026-05-25 09:42:14.258359', '惠安县', '350521', 3, 'huianxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1255, NULL, NULL, NULL, '2026-05-25 09:42:14.267576', '2026-05-25 09:42:14.267576', '安溪县', '350524', 3, 'anxixian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1256, NULL, NULL, NULL, '2026-05-25 09:42:14.276582', '2026-05-25 09:42:14.276582', '永春县', '350525', 3, 'yongchunxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1257, NULL, NULL, NULL, '2026-05-25 09:42:14.285022', '2026-05-25 09:42:14.285022', '德化县', '350526', 3, 'dehuaxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1258, NULL, NULL, NULL, '2026-05-25 09:42:14.296054', '2026-05-25 09:42:14.296054', '金门县', '350527', 3, 'jinmenxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1259, NULL, NULL, NULL, '2026-05-25 09:42:14.306053', '2026-05-25 09:42:14.306053', '石狮市', '350581', 3, 'shishishi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1260, NULL, NULL, NULL, '2026-05-25 09:42:14.314049', '2026-05-25 09:42:14.314049', '晋江市', '350582', 3, 'jinjiangshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1261, NULL, NULL, NULL, '2026-05-25 09:42:14.323048', '2026-05-25 09:42:14.323048', '南安市', '350583', 3, 'nananshi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1262, NULL, NULL, NULL, '2026-05-25 09:42:14.333057', '2026-05-25 09:42:14.333057', '漳州市', '3506', 2, 'zhangzhoushi', 'Z', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1263, NULL, NULL, NULL, '2026-05-25 09:42:14.341551', '2026-05-25 09:42:14.341551', '芗城区', '350602', 3, 'xiangchengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1264, NULL, NULL, NULL, '2026-05-25 09:42:14.350557', '2026-05-25 09:42:14.350557', '龙文区', '350603', 3, 'longwenqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1265, NULL, NULL, NULL, '2026-05-25 09:42:14.358560', '2026-05-25 09:42:14.358560', '云霄县', '350622', 3, 'yunxiaoxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1266, NULL, NULL, NULL, '2026-05-25 09:42:14.365557', '2026-05-25 09:42:14.365557', '漳浦县', '350623', 3, 'zhangpuxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1267, NULL, NULL, NULL, '2026-05-25 09:42:14.373550', '2026-05-25 09:42:14.373550', '诏安县', '350624', 3, 'zhaoanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1268, NULL, NULL, NULL, '2026-05-25 09:42:14.381557', '2026-05-25 09:42:14.381557', '长泰县', '350625', 3, 'zhangtaixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1269, NULL, NULL, NULL, '2026-05-25 09:42:14.392951', '2026-05-25 09:42:14.392951', '东山县', '350626', 3, 'dongshanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1270, NULL, NULL, NULL, '2026-05-25 09:42:14.401077', '2026-05-25 09:42:14.401077', '南靖县', '350627', 3, 'nanjingxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1271, NULL, NULL, NULL, '2026-05-25 09:42:14.410411', '2026-05-25 09:42:14.410411', '平和县', '350628', 3, 'pinghexian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1272, NULL, NULL, NULL, '2026-05-25 09:42:14.418388', '2026-05-25 09:42:14.418388', '华安县', '350629', 3, 'huaanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1273, NULL, NULL, NULL, '2026-05-25 09:42:14.429381', '2026-05-25 09:42:14.429381', '龙海市', '350681', 3, 'longhaishi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1274, NULL, NULL, NULL, '2026-05-25 09:42:14.437508', '2026-05-25 09:42:14.437508', '南平市', '3507', 2, 'nanpingshi', 'N', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1275, NULL, NULL, NULL, '2026-05-25 09:42:14.447543', '2026-05-25 09:42:14.447543', '延平区', '350702', 3, 'yanpingqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1276, NULL, NULL, NULL, '2026-05-25 09:42:14.456306', '2026-05-25 09:42:14.456306', '建阳区', '350703', 3, 'jianyangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1277, NULL, NULL, NULL, '2026-05-25 09:42:14.464306', '2026-05-25 09:42:14.464306', '顺昌县', '350721', 3, 'shunchangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1278, NULL, NULL, NULL, '2026-05-25 09:42:14.474306', '2026-05-25 09:42:14.474306', '浦城县', '350722', 3, 'puchengxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1279, NULL, NULL, NULL, '2026-05-25 09:42:14.484308', '2026-05-25 09:42:14.484308', '光泽县', '350723', 3, 'guangzexian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1280, NULL, NULL, NULL, '2026-05-25 09:42:14.495307', '2026-05-25 09:42:14.495307', '松溪县', '350724', 3, 'songxixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1281, NULL, NULL, NULL, '2026-05-25 09:42:14.505308', '2026-05-25 09:42:14.505308', '政和县', '350725', 3, 'zhenghexian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1282, NULL, NULL, NULL, '2026-05-25 09:42:14.513306', '2026-05-25 09:42:14.513306', '邵武市', '350781', 3, 'shaowushi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1283, NULL, NULL, NULL, '2026-05-25 09:42:14.522306', '2026-05-25 09:42:14.522306', '武夷山市', '350782', 3, 'wuyishanshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1284, NULL, NULL, NULL, '2026-05-25 09:42:14.531310', '2026-05-25 09:42:14.531310', '建瓯市', '350783', 3, 'jianoushi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1285, NULL, NULL, NULL, '2026-05-25 09:42:14.549305', '2026-05-25 09:42:14.549305', '龙岩市', '3508', 2, 'longyanshi', 'L', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1286, NULL, NULL, NULL, '2026-05-25 09:42:14.563305', '2026-05-25 09:42:14.563305', '新罗区', '350802', 3, 'xinluoqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1287, NULL, NULL, NULL, '2026-05-25 09:42:14.571305', '2026-05-25 09:42:14.571305', '永定区', '350803', 3, 'yongdingqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1288, NULL, NULL, NULL, '2026-05-25 09:42:14.581304', '2026-05-25 09:42:14.581304', '长汀县', '350821', 3, 'changtingxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1289, NULL, NULL, NULL, '2026-05-25 09:42:14.590305', '2026-05-25 09:42:14.590305', '上杭县', '350823', 3, 'shanghangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1290, NULL, NULL, NULL, '2026-05-25 09:42:14.600510', '2026-05-25 09:42:14.600510', '武平县', '350824', 3, 'wupingxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1291, NULL, NULL, NULL, '2026-05-25 09:42:14.608559', '2026-05-25 09:42:14.608559', '连城县', '350825', 3, 'lianchengxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1292, NULL, NULL, NULL, '2026-05-25 09:42:14.617559', '2026-05-25 09:42:14.617559', '漳平市', '350881', 3, 'zhangpingshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1293, NULL, NULL, NULL, '2026-05-25 09:42:14.626559', '2026-05-25 09:42:14.626559', '宁德市', '3509', 2, 'ningdeshi', 'N', 1, NULL, '120118');
INSERT INTO `dvadmin_system_area` VALUES (1294, NULL, NULL, NULL, '2026-05-25 09:42:14.634398', '2026-05-25 09:42:14.635398', '蕉城区', '350902', 3, 'jiaochengqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1295, NULL, NULL, NULL, '2026-05-25 09:42:14.642399', '2026-05-25 09:42:14.642399', '霞浦县', '350921', 3, 'xiapuxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1296, NULL, NULL, NULL, '2026-05-25 09:42:14.651104', '2026-05-25 09:42:14.651104', '古田县', '350922', 3, 'gutianxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1297, NULL, NULL, NULL, '2026-05-25 09:42:14.659389', '2026-05-25 09:42:14.659389', '屏南县', '350923', 3, 'pingnanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1298, NULL, NULL, NULL, '2026-05-25 09:42:14.665388', '2026-05-25 09:42:14.665388', '寿宁县', '350924', 3, 'shouningxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1299, NULL, NULL, NULL, '2026-05-25 09:42:14.673388', '2026-05-25 09:42:14.673388', '周宁县', '350925', 3, 'zhouningxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1300, NULL, NULL, NULL, '2026-05-25 09:42:14.681475', '2026-05-25 09:42:14.681475', '柘荣县', '350926', 3, 'zherongxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1301, NULL, NULL, NULL, '2026-05-25 09:42:14.690103', '2026-05-25 09:42:14.690103', '福安市', '350981', 3, 'fuanshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1302, NULL, NULL, NULL, '2026-05-25 09:42:14.698071', '2026-05-25 09:42:14.698071', '福鼎市', '350982', 3, 'fudingshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1303, NULL, NULL, NULL, '2026-05-25 09:42:14.704656', '2026-04-03 10:10:05.009000', '江西省', '36', 1, 'jiangxisheng', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1304, NULL, NULL, NULL, '2026-05-25 09:42:14.713259', '2026-05-25 09:42:14.713259', '南昌市', '3601', 2, 'nanchangshi', 'N', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1305, NULL, NULL, NULL, '2026-05-25 09:42:14.721467', '2026-05-25 09:42:14.722467', '东湖区', '360102', 3, 'donghuqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1306, NULL, NULL, NULL, '2026-05-25 09:42:14.729703', '2026-05-25 09:42:14.729703', '西湖区', '360103', 3, 'xihuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1307, NULL, NULL, NULL, '2026-05-25 09:42:14.738439', '2026-05-25 09:42:14.738439', '青云谱区', '360104', 3, 'qingyunpuqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1308, NULL, NULL, NULL, '2026-05-25 09:42:14.746056', '2026-05-25 09:42:14.746056', '青山湖区', '360111', 3, 'qingshanhuqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1309, NULL, NULL, NULL, '2026-05-25 09:42:14.756096', '2026-05-25 09:42:14.756096', '新建区', '360112', 3, 'xinjianqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1310, NULL, NULL, NULL, '2026-05-25 09:42:14.763041', '2026-05-25 09:42:14.763041', '红谷滩区', '360113', 3, 'honggutanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1311, NULL, NULL, NULL, '2026-05-25 09:42:14.772046', '2026-05-25 09:42:14.772046', '南昌县', '360121', 3, 'nanchangxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1312, NULL, NULL, NULL, '2026-05-25 09:42:14.780125', '2026-05-25 09:42:14.780125', '安义县', '360123', 3, 'anyixian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1313, NULL, NULL, NULL, '2026-05-25 09:42:14.788126', '2026-05-25 09:42:14.788126', '进贤县', '360124', 3, 'jinxianxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1314, NULL, NULL, NULL, '2026-05-25 09:42:14.796125', '2026-05-25 09:42:14.796125', '景德镇市', '3602', 2, 'jingdezhenshi', 'J', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1315, NULL, NULL, NULL, '2026-05-25 09:42:14.805157', '2026-05-25 09:42:14.805157', '昌江区', '360202', 3, 'changjiangqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1316, NULL, NULL, NULL, '2026-05-25 09:42:14.816170', '2026-05-25 09:42:14.816170', '珠山区', '360203', 3, 'zhushanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1317, NULL, NULL, NULL, '2026-05-25 09:42:14.825106', '2026-05-25 09:42:14.825106', '浮梁县', '360222', 3, 'fuliangxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1318, NULL, NULL, NULL, '2026-05-25 09:42:14.833112', '2026-05-25 09:42:14.833112', '乐平市', '360281', 3, 'lepingshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1319, NULL, NULL, NULL, '2026-05-25 09:42:14.842112', '2026-05-25 09:42:14.842112', '萍乡市', '3603', 2, 'pingxiangshi', 'P', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1320, NULL, NULL, NULL, '2026-05-25 09:42:14.850112', '2026-05-25 09:42:14.850112', '安源区', '360302', 3, 'anyuanqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1321, NULL, NULL, NULL, '2026-05-25 09:42:14.859190', '2026-05-25 09:42:14.859190', '湘东区', '360313', 3, 'xiangdongqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1322, NULL, NULL, NULL, '2026-05-25 09:42:14.871485', '2026-05-25 09:42:14.871485', '莲花县', '360321', 3, 'lianhuaxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1323, NULL, NULL, NULL, '2026-05-25 09:42:14.882221', '2026-05-25 09:42:14.882221', '上栗县', '360322', 3, 'shanglixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1324, NULL, NULL, NULL, '2026-05-25 09:42:14.893219', '2026-05-25 09:42:14.893219', '芦溪县', '360323', 3, 'luxixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1325, NULL, NULL, NULL, '2026-05-25 09:42:14.904211', '2026-05-25 09:42:14.904211', '九江市', '3604', 2, 'jiujiangshi', 'J', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1326, NULL, NULL, NULL, '2026-05-25 09:42:14.915218', '2026-05-25 09:42:14.915218', '濂溪区', '360402', 3, 'lianxiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1327, NULL, NULL, NULL, '2026-05-25 09:42:14.929218', '2026-05-25 09:42:14.929218', '浔阳区', '360403', 3, 'xunyangqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1328, NULL, NULL, NULL, '2026-05-25 09:42:14.938219', '2026-05-25 09:42:14.938219', '柴桑区', '360404', 3, 'chaisangqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1329, NULL, NULL, NULL, '2026-05-25 09:42:14.946889', '2026-05-25 09:42:14.946889', '武宁县', '360423', 3, 'wuningxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1330, NULL, NULL, NULL, '2026-05-25 09:42:14.955605', '2026-05-25 09:42:14.955605', '修水县', '360424', 3, 'xiushuixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1331, NULL, NULL, NULL, '2026-05-25 09:42:14.964605', '2026-05-25 09:42:14.964605', '永修县', '360425', 3, 'yongxiuxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1332, NULL, NULL, NULL, '2026-05-25 09:42:14.973240', '2026-05-25 09:42:14.973240', '德安县', '360426', 3, 'deanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1333, NULL, NULL, NULL, '2026-05-25 09:42:14.982549', '2026-05-25 09:42:14.982549', '都昌县', '360428', 3, 'douchangxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1334, NULL, NULL, NULL, '2026-05-25 09:42:14.991549', '2026-05-25 09:42:14.991549', '湖口县', '360429', 3, 'hukouxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1335, NULL, NULL, NULL, '2026-05-25 09:42:15.002272', '2026-05-25 09:42:15.002272', '彭泽县', '360430', 3, 'pengzexian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1336, NULL, NULL, NULL, '2026-05-25 09:42:15.010266', '2026-05-25 09:42:15.010266', '瑞昌市', '360481', 3, 'ruichangshi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1337, NULL, NULL, NULL, '2026-05-25 09:42:15.017860', '2026-05-25 09:42:15.017860', '共青城市', '360482', 3, 'gongqingchengshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1338, NULL, NULL, NULL, '2026-05-25 09:42:15.027087', '2026-05-25 09:42:15.027087', '庐山市', '360483', 3, 'lushanshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1339, NULL, NULL, NULL, '2026-05-25 09:42:15.036738', '2026-05-25 09:42:15.036738', '新余市', '3605', 2, 'xinyushi', 'X', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1340, NULL, NULL, NULL, '2026-05-25 09:42:15.045782', '2026-05-25 09:42:15.045782', '渝水区', '360502', 3, 'yushuiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1341, NULL, NULL, NULL, '2026-05-25 09:42:15.053783', '2026-05-25 09:42:15.053783', '分宜县', '360521', 3, 'fenyixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1342, NULL, NULL, NULL, '2026-05-25 09:42:15.063790', '2026-05-25 09:42:15.063790', '鹰潭市', '3606', 2, 'yingtanshi', 'Y', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1343, NULL, NULL, NULL, '2026-05-25 09:42:15.072784', '2026-05-25 09:42:15.072784', '月湖区', '360602', 3, 'yuehuqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1344, NULL, NULL, NULL, '2026-05-25 09:42:15.081794', '2026-05-25 09:42:15.081794', '余江区', '360603', 3, 'yujiangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1345, NULL, NULL, NULL, '2026-05-25 09:42:15.089789', '2026-05-25 09:42:15.089789', '贵溪市', '360681', 3, 'guixishi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1346, NULL, NULL, NULL, '2026-05-25 09:42:15.096790', '2026-05-25 09:42:15.097790', '赣州市', '3607', 2, 'ganzhoushi', 'G', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1347, NULL, NULL, NULL, '2026-05-25 09:42:15.105790', '2026-05-25 09:42:15.105790', '章贡区', '360702', 3, 'zhanggongqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1348, NULL, NULL, NULL, '2026-05-25 09:42:15.113857', '2026-05-25 09:42:15.113857', '南康区', '360703', 3, 'nankangqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1349, NULL, NULL, NULL, '2026-05-25 09:42:15.121860', '2026-05-25 09:42:15.121860', '赣县区', '360704', 3, 'ganxianqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1350, NULL, NULL, NULL, '2026-05-25 09:42:15.130233', '2026-05-25 09:42:15.131229', '信丰县', '360722', 3, 'xinfengxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1351, NULL, NULL, NULL, '2026-05-25 09:42:15.139233', '2026-05-25 09:42:15.139233', '大余县', '360723', 3, 'dayuxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1352, NULL, NULL, NULL, '2026-05-25 09:42:15.149293', '2026-05-25 09:42:15.149293', '上犹县', '360724', 3, 'shangyouxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1353, NULL, NULL, NULL, '2026-05-25 09:42:15.159003', '2026-05-25 09:42:15.159003', '崇义县', '360725', 3, 'chongyixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1354, NULL, NULL, NULL, '2026-05-25 09:42:15.168008', '2026-05-25 09:42:15.168008', '安远县', '360726', 3, 'anyuanxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1355, NULL, NULL, NULL, '2026-05-25 09:42:15.176057', '2026-05-25 09:42:15.176057', '定南县', '360728', 3, 'dingnanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1356, NULL, NULL, NULL, '2026-05-25 09:42:15.185059', '2026-05-25 09:42:15.185059', '全南县', '360729', 3, 'quannanxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1357, NULL, NULL, NULL, '2026-05-25 09:42:15.194057', '2026-05-25 09:42:15.194057', '宁都县', '360730', 3, 'ningdouxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1358, NULL, NULL, NULL, '2026-05-25 09:42:15.202425', '2026-05-25 09:42:15.202425', '于都县', '360731', 3, 'yudouxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1359, NULL, NULL, NULL, '2026-05-25 09:42:15.211223', '2026-05-25 09:42:15.211223', '兴国县', '360732', 3, 'xingguoxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1360, NULL, NULL, NULL, '2026-05-25 09:42:15.220229', '2026-05-25 09:42:15.220229', '会昌县', '360733', 3, 'huichangxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1361, NULL, NULL, NULL, '2026-05-25 09:42:15.228231', '2026-05-25 09:42:15.228231', '寻乌县', '360734', 3, 'xunwuxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1362, NULL, NULL, NULL, '2026-05-25 09:42:15.236230', '2026-05-25 09:42:15.236230', '石城县', '360735', 3, 'shichengxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1363, NULL, NULL, NULL, '2026-05-25 09:42:15.244225', '2026-05-25 09:42:15.244225', '瑞金市', '360781', 3, 'ruijinshi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1364, NULL, NULL, NULL, '2026-05-25 09:42:15.253260', '2026-05-25 09:42:15.253260', '龙南市', '360783', 3, 'longnanshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1365, NULL, NULL, NULL, '2026-05-25 09:42:15.262764', '2026-05-25 09:42:15.262764', '吉安市', '3608', 2, 'jianshi', 'J', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1366, NULL, NULL, NULL, '2026-05-25 09:42:15.270764', '2026-05-25 09:42:15.270764', '吉州区', '360802', 3, 'jizhouqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1367, NULL, NULL, NULL, '2026-05-25 09:42:15.278242', '2026-05-25 09:42:15.278242', '青原区', '360803', 3, 'qingyuanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1368, NULL, NULL, NULL, '2026-05-25 09:42:15.290249', '2026-05-25 09:42:15.290249', '吉安县', '360821', 3, 'jianxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1369, NULL, NULL, NULL, '2026-05-25 09:42:15.298109', '2026-05-25 09:42:15.298109', '吉水县', '360822', 3, 'jishuixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1370, NULL, NULL, NULL, '2026-05-25 09:42:15.307104', '2026-05-25 09:42:15.307104', '峡江县', '360823', 3, 'xiajiangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1371, NULL, NULL, NULL, '2026-05-25 09:42:15.316104', '2026-05-25 09:42:15.316104', '新干县', '360824', 3, 'xinganxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1372, NULL, NULL, NULL, '2026-05-25 09:42:15.325107', '2026-05-25 09:42:15.325107', '永丰县', '360825', 3, 'yongfengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1373, NULL, NULL, NULL, '2026-05-25 09:42:15.334022', '2026-05-25 09:42:15.334022', '泰和县', '360826', 3, 'taihexian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1374, NULL, NULL, NULL, '2026-05-25 09:42:15.344024', '2026-05-25 09:42:15.344024', '遂川县', '360827', 3, 'suichuanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1375, NULL, NULL, NULL, '2026-05-25 09:42:15.354018', '2026-05-25 09:42:15.354018', '万安县', '360828', 3, 'wananxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1376, NULL, NULL, NULL, '2026-05-25 09:42:15.363022', '2026-05-25 09:42:15.363022', '安福县', '360829', 3, 'anfuxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1377, NULL, NULL, NULL, '2026-05-25 09:42:15.372016', '2026-05-25 09:42:15.372016', '永新县', '360830', 3, 'yongxinxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1378, NULL, NULL, NULL, '2026-05-25 09:42:15.381022', '2026-05-25 09:42:15.381022', '井冈山市', '360881', 3, 'jinggangshanshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1379, NULL, NULL, NULL, '2026-05-25 09:42:15.392137', '2026-05-25 09:42:15.392137', '宜春市', '3609', 2, 'yichunshi', 'Y', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1380, NULL, NULL, NULL, '2026-05-25 09:42:15.401463', '2026-05-25 09:42:15.401463', '袁州区', '360902', 3, 'yuanzhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1381, NULL, NULL, NULL, '2026-05-25 09:42:15.409457', '2026-05-25 09:42:15.409457', '奉新县', '360921', 3, 'fengxinxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1382, NULL, NULL, NULL, '2026-05-25 09:42:15.417521', '2026-05-25 09:42:15.417521', '万载县', '360922', 3, 'wanzaixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1383, NULL, NULL, NULL, '2026-05-25 09:42:15.426116', '2026-05-25 09:42:15.426116', '上高县', '360923', 3, 'shanggaoxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1384, NULL, NULL, NULL, '2026-05-25 09:42:15.433998', '2026-05-25 09:42:15.433998', '宜丰县', '360924', 3, 'yifengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1385, NULL, NULL, NULL, '2026-05-25 09:42:15.447036', '2026-05-25 09:42:15.447036', '靖安县', '360925', 3, 'jinganxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1386, NULL, NULL, NULL, '2026-05-25 09:42:15.456036', '2026-05-25 09:42:15.456036', '铜鼓县', '360926', 3, 'tongguxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1387, NULL, NULL, NULL, '2026-05-25 09:42:15.464036', '2026-05-25 09:42:15.464036', '丰城市', '360981', 3, 'fengchengshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1388, NULL, NULL, NULL, '2026-05-25 09:42:15.473136', '2026-05-25 09:42:15.473136', '樟树市', '360982', 3, 'zhangshushi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1389, NULL, NULL, NULL, '2026-05-25 09:42:15.482136', '2026-05-25 09:42:15.482136', '高安市', '360983', 3, 'gaoanshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1390, NULL, NULL, NULL, '2026-05-25 09:42:15.491054', '2026-05-25 09:42:15.491054', '抚州市', '3610', 2, 'fuzhoushi', 'F', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1391, NULL, NULL, NULL, '2026-05-25 09:42:15.501060', '2026-05-25 09:42:15.501060', '临川区', '361002', 3, 'linchuanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1392, NULL, NULL, NULL, '2026-05-25 09:42:15.515063', '2026-05-25 09:42:15.515063', '东乡区', '361003', 3, 'dongxiangqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1393, NULL, NULL, NULL, '2026-05-25 09:42:15.525064', '2026-05-25 09:42:15.525064', '南城县', '361021', 3, 'nanchengxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1394, NULL, NULL, NULL, '2026-05-25 09:42:15.534060', '2026-05-25 09:42:15.534060', '黎川县', '361022', 3, 'lichuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1395, NULL, NULL, NULL, '2026-05-25 09:42:15.542219', '2026-05-25 09:42:15.542219', '南丰县', '361023', 3, 'nanfengxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1396, NULL, NULL, NULL, '2026-05-25 09:42:15.563204', '2026-05-25 09:42:15.563204', '崇仁县', '361024', 3, 'chongrenxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1397, NULL, NULL, NULL, '2026-05-25 09:42:15.574355', '2026-05-25 09:42:15.574355', '乐安县', '361025', 3, 'leanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1398, NULL, NULL, NULL, '2026-05-25 09:42:15.585352', '2026-05-25 09:42:15.585352', '宜黄县', '361026', 3, 'yihuangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1399, NULL, NULL, NULL, '2026-05-25 09:42:15.595352', '2026-05-25 09:42:15.595352', '金溪县', '361027', 3, 'jinxixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1400, NULL, NULL, NULL, '2026-05-25 09:42:15.604563', '2026-05-25 09:42:15.604563', '资溪县', '361028', 3, 'zixixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1401, NULL, NULL, NULL, '2026-05-25 09:42:15.614560', '2026-05-25 09:42:15.614560', '广昌县', '361030', 3, 'guangchangxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1402, NULL, NULL, NULL, '2026-05-25 09:42:15.623554', '2026-05-25 09:42:15.623554', '上饶市', '3611', 2, 'shangraoshi', 'S', 1, NULL, '120119');
INSERT INTO `dvadmin_system_area` VALUES (1403, NULL, NULL, NULL, '2026-05-25 09:42:15.631070', '2026-05-25 09:42:15.631070', '信州区', '361102', 3, 'xinzhouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1404, NULL, NULL, NULL, '2026-05-25 09:42:15.640222', '2026-05-25 09:42:15.640222', '广丰区', '361103', 3, 'guangfengqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1405, NULL, NULL, NULL, '2026-05-25 09:42:15.649223', '2026-05-25 09:42:15.649223', '广信区', '361104', 3, 'guangxinqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1406, NULL, NULL, NULL, '2026-05-25 09:42:15.659221', '2026-05-25 09:42:15.659221', '玉山县', '361123', 3, 'yushanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1407, NULL, NULL, NULL, '2026-05-25 09:42:15.667569', '2026-05-25 09:42:15.667569', '铅山县', '361124', 3, 'yanshanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1408, NULL, NULL, NULL, '2026-05-25 09:42:15.677052', '2026-05-25 09:42:15.677052', '横峰县', '361125', 3, 'hengfengxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1409, NULL, NULL, NULL, '2026-05-25 09:42:15.686053', '2026-05-25 09:42:15.686053', '弋阳县', '361126', 3, 'yiyangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1410, NULL, NULL, NULL, '2026-05-25 09:42:15.694039', '2026-05-25 09:42:15.694039', '余干县', '361127', 3, 'yuganxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1411, NULL, NULL, NULL, '2026-05-25 09:42:15.702781', '2026-05-25 09:42:15.702781', '鄱阳县', '361128', 3, 'poyangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1412, NULL, NULL, NULL, '2026-05-25 09:42:15.711687', '2026-05-25 09:42:15.711687', '万年县', '361129', 3, 'wannianxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1413, NULL, NULL, NULL, '2026-05-25 09:42:15.721328', '2026-05-25 09:42:15.721328', '婺源县', '361130', 3, 'wuyuanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1414, NULL, NULL, NULL, '2026-05-25 09:42:15.730328', '2026-05-25 09:42:15.730328', '德兴市', '361181', 3, 'dexingshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1415, NULL, NULL, NULL, '2026-05-25 09:42:15.740280', '2026-04-03 10:10:05.012000', '山东省', '37', 1, 'shandongsheng', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1416, NULL, NULL, NULL, '2026-05-25 09:42:15.751476', '2026-05-25 09:42:15.751476', '济南市', '3701', 2, 'jinanshi', 'J', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1417, NULL, NULL, NULL, '2026-05-25 09:42:15.758477', '2026-05-25 09:42:15.758477', '历下区', '370102', 3, 'lixiaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1418, NULL, NULL, NULL, '2026-05-25 09:42:15.766475', '2026-05-25 09:42:15.766475', '市中区', '370103', 3, 'shizhongqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1419, NULL, NULL, NULL, '2026-05-25 09:42:15.775067', '2026-05-25 09:42:15.775067', '槐荫区', '370104', 3, 'huaiyinqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1420, NULL, NULL, NULL, '2026-05-25 09:42:15.783598', '2026-05-25 09:42:15.783598', '天桥区', '370105', 3, 'tianqiaoqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1421, NULL, NULL, NULL, '2026-05-25 09:42:15.792426', '2026-05-25 09:42:15.792426', '历城区', '370112', 3, 'lichengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1422, NULL, NULL, NULL, '2026-05-25 09:42:15.800427', '2026-05-25 09:42:15.800427', '长清区', '370113', 3, 'zhangqingqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1423, NULL, NULL, NULL, '2026-05-25 09:42:15.808427', '2026-05-25 09:42:15.808427', '章丘区', '370114', 3, 'zhangqiuqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1424, NULL, NULL, NULL, '2026-05-25 09:42:15.817030', '2026-05-25 09:42:15.817030', '济阳区', '370115', 3, 'jiyangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1425, NULL, NULL, NULL, '2026-05-25 09:42:15.825003', '2026-05-25 09:42:15.825003', '莱芜区', '370116', 3, 'laiwuqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1426, NULL, NULL, NULL, '2026-05-25 09:42:15.833117', '2026-05-25 09:42:15.833117', '钢城区', '370117', 3, 'gangchengqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1427, NULL, NULL, NULL, '2026-05-25 09:42:15.841117', '2026-05-25 09:42:15.841117', '平阴县', '370124', 3, 'pingyinxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1428, NULL, NULL, NULL, '2026-05-25 09:42:15.848151', '2026-05-25 09:42:15.848151', '商河县', '370126', 3, 'shanghexian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1429, NULL, NULL, NULL, '2026-05-25 09:42:15.858038', '2026-05-25 09:42:15.858038', '济南高新技术产业开发区', '370171', 3, 'jinangaoxinjishuchanyekaifaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1430, NULL, NULL, NULL, '2026-05-25 09:42:15.868941', '2026-05-25 09:42:15.868941', '青岛市', '3702', 2, 'qingdaoshi', 'Q', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1431, NULL, NULL, NULL, '2026-05-25 09:42:15.878941', '2026-05-25 09:42:15.878941', '市南区', '370202', 3, 'shinanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1432, NULL, NULL, NULL, '2026-05-25 09:42:15.889763', '2026-05-25 09:42:15.889763', '市北区', '370203', 3, 'shibeiqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1433, NULL, NULL, NULL, '2026-05-25 09:42:15.897323', '2026-05-25 09:42:15.897323', '黄岛区', '370211', 3, 'huangdaoqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1434, NULL, NULL, NULL, '2026-05-25 09:42:15.906323', '2026-05-25 09:42:15.906323', '崂山区', '370212', 3, 'laoshanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1435, NULL, NULL, NULL, '2026-05-25 09:42:15.916323', '2026-05-25 09:42:15.916323', '李沧区', '370213', 3, 'licangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1436, NULL, NULL, NULL, '2026-05-25 09:42:15.926323', '2026-05-25 09:42:15.926323', '城阳区', '370214', 3, 'chengyangqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1437, NULL, NULL, NULL, '2026-05-25 09:42:15.934323', '2026-05-25 09:42:15.934323', '即墨区', '370215', 3, 'jimoqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1438, NULL, NULL, NULL, '2026-05-25 09:42:15.944316', '2026-05-25 09:42:15.944316', '青岛高新技术产业开发区', '370271', 3, 'qingdaogaoxinjishuchanyekaifaqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1439, NULL, NULL, NULL, '2026-05-25 09:42:15.952325', '2026-05-25 09:42:15.952325', '胶州市', '370281', 3, 'jiaozhoushi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1440, NULL, NULL, NULL, '2026-05-25 09:42:15.960604', '2026-05-25 09:42:15.960604', '平度市', '370283', 3, 'pingdushi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1441, NULL, NULL, NULL, '2026-05-25 09:42:15.968604', '2026-05-25 09:42:15.968604', '莱西市', '370285', 3, 'laixishi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1442, NULL, NULL, NULL, '2026-05-25 09:42:15.976604', '2026-05-25 09:42:15.976604', '淄博市', '3703', 2, 'ziboshi', 'Z', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1443, NULL, NULL, NULL, '2026-05-25 09:42:15.985459', '2026-05-25 09:42:15.985459', '淄川区', '370302', 3, 'zichuanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1444, NULL, NULL, NULL, '2026-05-25 09:42:15.992964', '2026-05-25 09:42:15.992964', '张店区', '370303', 3, 'zhangdianqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1445, NULL, NULL, NULL, '2026-05-25 09:42:16.000965', '2026-05-25 09:42:16.000965', '博山区', '370304', 3, 'boshanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1446, NULL, NULL, NULL, '2026-05-25 09:42:16.009450', '2026-05-25 09:42:16.009450', '临淄区', '370305', 3, 'linziqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1447, NULL, NULL, NULL, '2026-05-25 09:42:16.017474', '2026-05-25 09:42:16.018474', '周村区', '370306', 3, 'zhoucunqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1448, NULL, NULL, NULL, '2026-05-25 09:42:16.026480', '2026-05-25 09:42:16.026480', '桓台县', '370321', 3, 'huantaixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1449, NULL, NULL, NULL, '2026-05-25 09:42:16.034662', '2026-05-25 09:42:16.034662', '高青县', '370322', 3, 'gaoqingxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1450, NULL, NULL, NULL, '2026-05-25 09:42:16.044851', '2026-05-25 09:42:16.044851', '沂源县', '370323', 3, 'yiyuanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1451, NULL, NULL, NULL, '2026-05-25 09:42:16.052996', '2026-05-25 09:42:16.052996', '枣庄市', '3704', 2, 'zaozhuangshi', 'Z', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1452, NULL, NULL, NULL, '2026-05-25 09:42:16.060996', '2026-05-25 09:42:16.060996', '市中区', '370402', 3, 'shizhongqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1453, NULL, NULL, NULL, '2026-05-25 09:42:16.069699', '2026-05-25 09:42:16.069699', '薛城区', '370403', 3, 'xuechengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1454, NULL, NULL, NULL, '2026-05-25 09:42:16.077624', '2026-05-25 09:42:16.077624', '峄城区', '370404', 3, 'yichengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1455, NULL, NULL, NULL, '2026-05-25 09:42:16.085625', '2026-05-25 09:42:16.085625', '台儿庄区', '370405', 3, 'taierzhuangqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1456, NULL, NULL, NULL, '2026-05-25 09:42:16.092820', '2026-05-25 09:42:16.092820', '山亭区', '370406', 3, 'shantingqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1457, NULL, NULL, NULL, '2026-05-25 09:42:16.100820', '2026-05-25 09:42:16.100820', '滕州市', '370481', 3, 'tengzhoushi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1458, NULL, NULL, NULL, '2026-05-25 09:42:16.109819', '2026-05-25 09:42:16.109819', '东营市', '3705', 2, 'dongyingshi', 'D', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1459, NULL, NULL, NULL, '2026-05-25 09:42:16.118819', '2026-05-25 09:42:16.118819', '东营区', '370502', 3, 'dongyingqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1460, NULL, NULL, NULL, '2026-05-25 09:42:16.127823', '2026-05-25 09:42:16.127823', '河口区', '370503', 3, 'hekouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1461, NULL, NULL, NULL, '2026-05-25 09:42:16.137954', '2026-05-25 09:42:16.137954', '垦利区', '370505', 3, 'kenliqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1462, NULL, NULL, NULL, '2026-05-25 09:42:16.147955', '2026-05-25 09:42:16.147955', '利津县', '370522', 3, 'lijinxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1463, NULL, NULL, NULL, '2026-05-25 09:42:16.156955', '2026-05-25 09:42:16.156955', '广饶县', '370523', 3, 'guangraoxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1464, NULL, NULL, NULL, '2026-05-25 09:42:16.167443', '2026-05-25 09:42:16.167443', '东营经济技术开发区', '370571', 3, 'dongyingjingjijishukaifaqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1465, NULL, NULL, NULL, '2026-05-25 09:42:16.176138', '2026-05-25 09:42:16.176138', '东营港经济开发区', '370572', 3, 'dongyinggangjingjikaifaqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1466, NULL, NULL, NULL, '2026-05-25 09:42:16.185289', '2026-05-25 09:42:16.185289', '烟台市', '3706', 2, 'yantaishi', 'Y', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1467, NULL, NULL, NULL, '2026-05-25 09:42:16.193289', '2026-05-25 09:42:16.193289', '芝罘区', '370602', 3, 'zhifuqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1468, NULL, NULL, NULL, '2026-05-25 09:42:16.202207', '2026-05-25 09:42:16.202207', '福山区', '370611', 3, 'fushanqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1469, NULL, NULL, NULL, '2026-05-25 09:42:16.211393', '2026-05-25 09:42:16.211393', '牟平区', '370612', 3, 'mupingqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1470, NULL, NULL, NULL, '2026-05-25 09:42:16.220062', '2026-05-25 09:42:16.220062', '莱山区', '370613', 3, 'laishanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1471, NULL, NULL, NULL, '2026-05-25 09:42:16.229995', '2026-05-25 09:42:16.229995', '蓬莱区', '370614', 3, 'penglaiqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1472, NULL, NULL, NULL, '2026-05-25 09:42:16.238847', '2026-05-25 09:42:16.238847', '烟台高新技术产业开发区', '370671', 3, 'yantaigaoxinjishuchanyekaifaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1473, NULL, NULL, NULL, '2026-05-25 09:42:16.248214', '2026-05-25 09:42:16.248214', '烟台经济技术开发区', '370672', 3, 'yantaijingjijishukaifaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1474, NULL, NULL, NULL, '2026-05-25 09:42:16.257707', '2026-05-25 09:42:16.257707', '龙口市', '370681', 3, 'longkoushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1475, NULL, NULL, NULL, '2026-05-25 09:42:16.263126', '2026-05-25 09:42:16.263126', '莱阳市', '370682', 3, 'laiyangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1476, NULL, NULL, NULL, '2026-05-25 09:42:16.271795', '2026-05-25 09:42:16.271795', '莱州市', '370683', 3, 'laizhoushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1477, NULL, NULL, NULL, '2026-05-25 09:42:16.279060', '2026-05-25 09:42:16.279060', '招远市', '370685', 3, 'zhaoyuanshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1478, NULL, NULL, NULL, '2026-05-25 09:42:16.287100', '2026-05-25 09:42:16.287100', '栖霞市', '370686', 3, 'qixiashi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1479, NULL, NULL, NULL, '2026-05-25 09:42:16.297101', '2026-05-25 09:42:16.297101', '海阳市', '370687', 3, 'haiyangshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1480, NULL, NULL, NULL, '2026-05-25 09:42:16.305376', '2026-05-25 09:42:16.305376', '潍坊市', '3707', 2, 'weifangshi', 'W', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1481, NULL, NULL, NULL, '2026-05-25 09:42:16.313680', '2026-05-25 09:42:16.313680', '潍城区', '370702', 3, 'weichengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1482, NULL, NULL, NULL, '2026-05-25 09:42:16.323125', '2026-05-25 09:42:16.323125', '寒亭区', '370703', 3, 'hantingqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1483, NULL, NULL, NULL, '2026-05-25 09:42:16.331138', '2026-05-25 09:42:16.331138', '坊子区', '370704', 3, 'fangziqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1484, NULL, NULL, NULL, '2026-05-25 09:42:16.340395', '2026-05-25 09:42:16.340395', '奎文区', '370705', 3, 'kuiwenqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1485, NULL, NULL, NULL, '2026-05-25 09:42:16.348395', '2026-05-25 09:42:16.348395', '临朐县', '370724', 3, 'linquxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1486, NULL, NULL, NULL, '2026-05-25 09:42:16.356594', '2026-05-25 09:42:16.356594', '昌乐县', '370725', 3, 'changlexian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1487, NULL, NULL, NULL, '2026-05-25 09:42:16.365722', '2026-05-25 09:42:16.365722', '潍坊滨海经济技术开发区', '370772', 3, 'weifangbinhaijingjijishukaifaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1488, NULL, NULL, NULL, '2026-05-25 09:42:16.373767', '2026-05-25 09:42:16.373767', '青州市', '370781', 3, 'qingzhoushi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1489, NULL, NULL, NULL, '2026-05-25 09:42:16.383771', '2026-05-25 09:42:16.383771', '诸城市', '370782', 3, 'zhuchengshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1490, NULL, NULL, NULL, '2026-05-25 09:42:16.391838', '2026-05-25 09:42:16.391838', '寿光市', '370783', 3, 'shouguangshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1491, NULL, NULL, NULL, '2026-05-25 09:42:16.401832', '2026-05-25 09:42:16.401832', '安丘市', '370784', 3, 'anqiushi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1492, NULL, NULL, NULL, '2026-05-25 09:42:16.411844', '2026-05-25 09:42:16.411844', '高密市', '370785', 3, 'gaomishi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1493, NULL, NULL, NULL, '2026-05-25 09:42:16.418839', '2026-05-25 09:42:16.418839', '昌邑市', '370786', 3, 'changyishi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1494, NULL, NULL, NULL, '2026-05-25 09:42:16.430838', '2026-05-25 09:42:16.430838', '济宁市', '3708', 2, 'jiningshi', 'J', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1495, NULL, NULL, NULL, '2026-05-25 09:42:16.437831', '2026-05-25 09:42:16.437831', '任城区', '370811', 3, 'renchengqu', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1496, NULL, NULL, NULL, '2026-05-25 09:42:16.447585', '2026-05-25 09:42:16.447585', '兖州区', '370812', 3, 'yanzhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1497, NULL, NULL, NULL, '2026-05-25 09:42:16.455580', '2026-05-25 09:42:16.455580', '微山县', '370826', 3, 'weishanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1498, NULL, NULL, NULL, '2026-05-25 09:42:16.463586', '2026-05-25 09:42:16.463586', '鱼台县', '370827', 3, 'yutaixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1499, NULL, NULL, NULL, '2026-05-25 09:42:16.471653', '2026-05-25 09:42:16.471653', '金乡县', '370828', 3, 'jinxiangxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1500, NULL, NULL, NULL, '2026-05-25 09:42:16.480044', '2026-05-25 09:42:16.480044', '嘉祥县', '370829', 3, 'jiaxiangxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1501, NULL, NULL, NULL, '2026-05-25 09:42:16.487968', '2026-05-25 09:42:16.487968', '汶上县', '370830', 3, 'wenshangxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1502, NULL, NULL, NULL, '2026-05-25 09:42:16.496042', '2026-05-25 09:42:16.496042', '泗水县', '370831', 3, 'sishuixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1503, NULL, NULL, NULL, '2026-05-25 09:42:16.505567', '2026-05-25 09:42:16.505567', '梁山县', '370832', 3, 'liangshanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1504, NULL, NULL, NULL, '2026-05-25 09:42:16.513606', '2026-05-25 09:42:16.513606', '济宁高新技术产业开发区', '370871', 3, 'jininggaoxinjishuchanyekaifaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1505, NULL, NULL, NULL, '2026-05-25 09:42:16.522606', '2026-05-25 09:42:16.522606', '曲阜市', '370881', 3, 'qufushi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1506, NULL, NULL, NULL, '2026-05-25 09:42:16.530606', '2026-05-25 09:42:16.530606', '邹城市', '370883', 3, 'zouchengshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1507, NULL, NULL, NULL, '2026-05-25 09:42:16.540606', '2026-05-25 09:42:16.540606', '泰安市', '3709', 2, 'taianshi', 'T', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1508, NULL, NULL, NULL, '2026-05-25 09:42:16.548999', '2026-05-25 09:42:16.548999', '泰山区', '370902', 3, 'taishanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1509, NULL, NULL, NULL, '2026-05-25 09:42:16.564834', '2026-05-25 09:42:16.564834', '岱岳区', '370911', 3, 'daiyuequ', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1510, NULL, NULL, NULL, '2026-05-25 09:42:16.573832', '2026-05-25 09:42:16.573832', '宁阳县', '370921', 3, 'ningyangxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1511, NULL, NULL, NULL, '2026-05-25 09:42:16.582828', '2026-05-25 09:42:16.582828', '东平县', '370923', 3, 'dongpingxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1512, NULL, NULL, NULL, '2026-05-25 09:42:16.591872', '2026-05-25 09:42:16.591872', '新泰市', '370982', 3, 'xintaishi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1513, NULL, NULL, NULL, '2026-05-25 09:42:16.600270', '2026-05-25 09:42:16.600270', '肥城市', '370983', 3, 'feichengshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1514, NULL, NULL, NULL, '2026-05-25 09:42:16.607366', '2026-05-25 09:42:16.607366', '威海市', '3710', 2, 'weihaishi', 'W', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1515, NULL, NULL, NULL, '2026-05-25 09:42:16.616572', '2026-05-25 09:42:16.616572', '环翠区', '371002', 3, 'huancuiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1516, NULL, NULL, NULL, '2026-05-25 09:42:16.622616', '2026-05-25 09:42:16.622616', '文登区', '371003', 3, 'wendengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1517, NULL, NULL, NULL, '2026-05-25 09:42:16.630118', '2026-05-25 09:42:16.630118', '威海火炬高技术产业开发区', '371071', 3, 'weihaihuojugaojishuchanyekaifaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1518, NULL, NULL, NULL, '2026-05-25 09:42:16.639117', '2026-05-25 09:42:16.639117', '威海经济技术开发区', '371072', 3, 'weihaijingjijishukaifaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1519, NULL, NULL, NULL, '2026-05-25 09:42:16.646118', '2026-05-25 09:42:16.646118', '威海临港经济技术开发区', '371073', 3, 'weihailingangjingjijishukaifaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1520, NULL, NULL, NULL, '2026-05-25 09:42:16.655128', '2026-05-25 09:42:16.655128', '荣成市', '371082', 3, 'rongchengshi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1521, NULL, NULL, NULL, '2026-05-25 09:42:16.665113', '2026-05-25 09:42:16.665113', '乳山市', '371083', 3, 'rushanshi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1522, NULL, NULL, NULL, '2026-05-25 09:42:16.673558', '2026-05-25 09:42:16.673558', '日照市', '3711', 2, 'rizhaoshi', 'R', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1523, NULL, NULL, NULL, '2026-05-25 09:42:16.681873', '2026-05-25 09:42:16.681873', '东港区', '371102', 3, 'donggangqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1524, NULL, NULL, NULL, '2026-05-25 09:42:16.690101', '2026-05-25 09:42:16.690101', '岚山区', '371103', 3, 'lanshanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1525, NULL, NULL, NULL, '2026-05-25 09:42:16.699051', '2026-05-25 09:42:16.699051', '五莲县', '371121', 3, 'wulianxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1526, NULL, NULL, NULL, '2026-05-25 09:42:16.706943', '2026-05-25 09:42:16.706943', '莒县', '371122', 3, 'juxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1527, NULL, NULL, NULL, '2026-05-25 09:42:16.715943', '2026-05-25 09:42:16.715943', '日照经济技术开发区', '371171', 3, 'rizhaojingjijishukaifaqu', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1528, NULL, NULL, NULL, '2026-05-25 09:42:16.724025', '2026-05-25 09:42:16.724025', '临沂市', '3713', 2, 'linyishi', 'L', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1529, NULL, NULL, NULL, '2026-05-25 09:42:16.733009', '2026-05-25 09:42:16.733009', '兰山区', '371302', 3, 'lanshanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1530, NULL, NULL, NULL, '2026-05-25 09:42:16.740010', '2026-05-25 09:42:16.740010', '罗庄区', '371311', 3, 'luozhuangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1531, NULL, NULL, NULL, '2026-05-25 09:42:16.748095', '2026-05-25 09:42:16.748095', '河东区', '371312', 3, 'hedongqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1532, NULL, NULL, NULL, '2026-05-25 09:42:16.756191', '2026-05-25 09:42:16.756191', '沂南县', '371321', 3, 'yinanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1533, NULL, NULL, NULL, '2026-05-25 09:42:16.763190', '2026-05-25 09:42:16.763190', '郯城县', '371322', 3, 'tanchengxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1534, NULL, NULL, NULL, '2026-05-25 09:42:16.771449', '2026-05-25 09:42:16.771449', '沂水县', '371323', 3, 'yishuixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1535, NULL, NULL, NULL, '2026-05-25 09:42:16.780276', '2026-05-25 09:42:16.780276', '兰陵县', '371324', 3, 'lanlingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1536, NULL, NULL, NULL, '2026-05-25 09:42:16.789285', '2026-05-25 09:42:16.789285', '费县', '371325', 3, 'feixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1537, NULL, NULL, NULL, '2026-05-25 09:42:16.798277', '2026-05-25 09:42:16.798277', '平邑县', '371326', 3, 'pingyixian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1538, NULL, NULL, NULL, '2026-05-25 09:42:16.808105', '2026-05-25 09:42:16.808105', '莒南县', '371327', 3, 'junanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1539, NULL, NULL, NULL, '2026-05-25 09:42:16.816452', '2026-05-25 09:42:16.816452', '蒙阴县', '371328', 3, 'mengyinxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1540, NULL, NULL, NULL, '2026-05-25 09:42:16.825448', '2026-05-25 09:42:16.825448', '临沭县', '371329', 3, 'linshuxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1541, NULL, NULL, NULL, '2026-05-25 09:42:16.837955', '2026-05-25 09:42:16.837955', '临沂高新技术产业开发区', '371371', 3, 'linyigaoxinjishuchanyekaifaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1542, NULL, NULL, NULL, '2026-05-25 09:42:16.847377', '2026-05-25 09:42:16.847377', '德州市', '3714', 2, 'dezhoushi', 'D', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1543, NULL, NULL, NULL, '2026-05-25 09:42:16.856377', '2026-05-25 09:42:16.856377', '德城区', '371402', 3, 'dechengqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1544, NULL, NULL, NULL, '2026-05-25 09:42:16.869427', '2026-05-25 09:42:16.869427', '陵城区', '371403', 3, 'lingchengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1545, NULL, NULL, NULL, '2026-05-25 09:42:16.879433', '2026-05-25 09:42:16.879433', '宁津县', '371422', 3, 'ningjinxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1546, NULL, NULL, NULL, '2026-05-25 09:42:16.890603', '2026-05-25 09:42:16.890603', '庆云县', '371423', 3, 'qingyunxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1547, NULL, NULL, NULL, '2026-05-25 09:42:16.898683', '2026-05-25 09:42:16.898683', '临邑县', '371424', 3, 'linyixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1548, NULL, NULL, NULL, '2026-05-25 09:42:16.907682', '2026-05-25 09:42:16.907682', '齐河县', '371425', 3, 'qihexian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1549, NULL, NULL, NULL, '2026-05-25 09:42:16.915683', '2026-05-25 09:42:16.915683', '平原县', '371426', 3, 'pingyuanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1550, NULL, NULL, NULL, '2026-05-25 09:42:16.924682', '2026-05-25 09:42:16.924682', '夏津县', '371427', 3, 'xiajinxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1551, NULL, NULL, NULL, '2026-05-25 09:42:16.933682', '2026-05-25 09:42:16.933682', '武城县', '371428', 3, 'wuchengxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1552, NULL, NULL, NULL, '2026-05-25 09:42:16.941682', '2026-05-25 09:42:16.941682', '德州经济技术开发区', '371471', 3, 'dezhoujingjijishukaifaqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1553, NULL, NULL, NULL, '2026-05-25 09:42:16.950683', '2026-05-25 09:42:16.950683', '德州运河经济开发区', '371472', 3, 'dezhouyunhejingjikaifaqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1554, NULL, NULL, NULL, '2026-05-25 09:42:16.959994', '2026-05-25 09:42:16.959994', '乐陵市', '371481', 3, 'lelingshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1555, NULL, NULL, NULL, '2026-05-25 09:42:16.969415', '2026-05-25 09:42:16.969415', '禹城市', '371482', 3, 'yuchengshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1556, NULL, NULL, NULL, '2026-05-25 09:42:16.977415', '2026-05-25 09:42:16.977415', '聊城市', '3715', 2, 'liaochengshi', 'L', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1557, NULL, NULL, NULL, '2026-05-25 09:42:16.985723', '2026-05-25 09:42:16.985723', '东昌府区', '371502', 3, 'dongchangfuqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1558, NULL, NULL, NULL, '2026-05-25 09:42:16.995727', '2026-05-25 09:42:16.995727', '茌平区', '371503', 3, 'chipingqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1559, NULL, NULL, NULL, '2026-05-25 09:42:17.002727', '2026-05-25 09:42:17.002727', '阳谷县', '371521', 3, 'yangguxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1560, NULL, NULL, NULL, '2026-05-25 09:42:17.011727', '2026-05-25 09:42:17.011727', '莘县', '371522', 3, 'shenxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1561, NULL, NULL, NULL, '2026-05-25 09:42:17.020728', '2026-05-25 09:42:17.020728', '东阿县', '371524', 3, 'dongexian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1562, NULL, NULL, NULL, '2026-05-25 09:42:17.032267', '2026-05-25 09:42:17.032267', '冠县', '371525', 3, 'guanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1563, NULL, NULL, NULL, '2026-05-25 09:42:17.041259', '2026-05-25 09:42:17.041259', '高唐县', '371526', 3, 'gaotangxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1564, NULL, NULL, NULL, '2026-05-25 09:42:17.050266', '2026-05-25 09:42:17.050266', '临清市', '371581', 3, 'linqingshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1565, NULL, NULL, NULL, '2026-05-25 09:42:17.058459', '2026-05-25 09:42:17.058459', '滨州市', '3716', 2, 'binzhoushi', 'B', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1566, NULL, NULL, NULL, '2026-05-25 09:42:17.066933', '2026-05-25 09:42:17.066933', '滨城区', '371602', 3, 'binchengqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1567, NULL, NULL, NULL, '2026-05-25 09:42:17.074933', '2026-05-25 09:42:17.074933', '沾化区', '371603', 3, 'zhanhuaqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1568, NULL, NULL, NULL, '2026-05-25 09:42:17.083625', '2026-05-25 09:42:17.083625', '惠民县', '371621', 3, 'huiminxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1569, NULL, NULL, NULL, '2026-05-25 09:42:17.092624', '2026-05-25 09:42:17.092624', '阳信县', '371622', 3, 'yangxinxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1570, NULL, NULL, NULL, '2026-05-25 09:42:17.103229', '2026-05-25 09:42:17.103229', '无棣县', '371623', 3, 'wudixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1571, NULL, NULL, NULL, '2026-05-25 09:42:17.112238', '2026-05-25 09:42:17.112238', '博兴县', '371625', 3, 'boxingxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1572, NULL, NULL, NULL, '2026-05-25 09:42:17.122106', '2026-05-25 09:42:17.122106', '邹平市', '371681', 3, 'zoupingshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1573, NULL, NULL, NULL, '2026-05-25 09:42:17.131118', '2026-05-25 09:42:17.131118', '菏泽市', '3717', 2, 'hezeshi', 'H', 1, NULL, '13');
INSERT INTO `dvadmin_system_area` VALUES (1574, NULL, NULL, NULL, '2026-05-25 09:42:17.141138', '2026-05-25 09:42:17.141138', '牡丹区', '371702', 3, 'mudanqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1575, NULL, NULL, NULL, '2026-05-25 09:42:17.150142', '2026-05-25 09:42:17.150142', '定陶区', '371703', 3, 'dingtaoqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1576, NULL, NULL, NULL, '2026-05-25 09:42:17.158356', '2026-05-25 09:42:17.158356', '曹县', '371721', 3, 'caoxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1577, NULL, NULL, NULL, '2026-05-25 09:42:17.167362', '2026-05-25 09:42:17.167362', '单县', '371722', 3, 'danxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1578, NULL, NULL, NULL, '2026-05-25 09:42:17.175363', '2026-05-25 09:42:17.175363', '成武县', '371723', 3, 'chengwuxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1579, NULL, NULL, NULL, '2026-05-25 09:42:17.184355', '2026-05-25 09:42:17.184355', '巨野县', '371724', 3, 'juyexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1580, NULL, NULL, NULL, '2026-05-25 09:42:17.192363', '2026-05-25 09:42:17.192363', '郓城县', '371725', 3, 'yunchengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1581, NULL, NULL, NULL, '2026-05-25 09:42:17.201367', '2026-05-25 09:42:17.201367', '鄄城县', '371726', 3, 'juanchengxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1582, NULL, NULL, NULL, '2026-05-25 09:42:17.212273', '2026-05-25 09:42:17.212273', '东明县', '371728', 3, 'dongmingxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1583, NULL, NULL, NULL, '2026-05-25 09:42:17.221592', '2026-05-25 09:42:17.221592', '菏泽经济技术开发区', '371771', 3, 'hezejingjijishukaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1584, NULL, NULL, NULL, '2026-05-25 09:42:17.230337', '2026-05-25 09:42:17.230337', '菏泽高新技术开发区', '371772', 3, 'hezegaoxinjishukaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1585, NULL, NULL, NULL, '2026-05-25 09:42:17.238336', '2026-04-03 10:10:05.018000', '河南省', '41', 1, 'henansheng', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1586, NULL, NULL, NULL, '2026-05-25 09:42:17.248047', '2026-05-25 09:42:17.248047', '郑州市', '4101', 2, 'zhengzhoushi', 'Z', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1587, NULL, NULL, NULL, '2026-05-25 09:42:17.256074', '2026-05-25 09:42:17.256074', '中原区', '410102', 3, 'zhongyuanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1588, NULL, NULL, NULL, '2026-05-25 09:42:17.266562', '2026-05-25 09:42:17.266562', '二七区', '410103', 3, 'erqiqu', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1589, NULL, NULL, NULL, '2026-05-25 09:42:17.276560', '2026-05-25 09:42:17.276560', '管城回族区', '410104', 3, 'guanchenghuizuqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1590, NULL, NULL, NULL, '2026-05-25 09:42:17.285749', '2026-05-25 09:42:17.285749', '金水区', '410105', 3, 'jinshuiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1591, NULL, NULL, NULL, '2026-05-25 09:42:17.296111', '2026-05-25 09:42:17.296111', '上街区', '410106', 3, 'shangjiequ', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1592, NULL, NULL, NULL, '2026-05-25 09:42:17.307109', '2026-05-25 09:42:17.307109', '惠济区', '410108', 3, 'huijiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1593, NULL, NULL, NULL, '2026-05-25 09:42:17.317175', '2026-05-25 09:42:17.317175', '中牟县', '410122', 3, 'zhongmuxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1594, NULL, NULL, NULL, '2026-05-25 09:42:17.327175', '2026-05-25 09:42:17.327175', '郑州经济技术开发区', '410171', 3, 'zhengzhoujingjijishukaifaqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1595, NULL, NULL, NULL, '2026-05-25 09:42:17.341177', '2026-05-25 09:42:17.341177', '郑州高新技术产业开发区', '410172', 3, 'zhengzhougaoxinjishuchanyekaifaqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1596, NULL, NULL, NULL, '2026-05-25 09:42:17.351173', '2026-05-25 09:42:17.351173', '郑州航空港经济综合实验区', '410173', 3, 'zhengzhouhangkonggangjingjizongheshiyanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1597, NULL, NULL, NULL, '2026-05-25 09:42:17.361174', '2026-05-25 09:42:17.361174', '巩义市', '410181', 3, 'gongyishi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1598, NULL, NULL, NULL, '2026-05-25 09:42:17.370174', '2026-05-25 09:42:17.370174', '荥阳市', '410182', 3, 'xingyangshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1599, NULL, NULL, NULL, '2026-05-25 09:42:17.380173', '2026-05-25 09:42:17.380173', '新密市', '410183', 3, 'xinmishi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1600, NULL, NULL, NULL, '2026-05-25 09:42:17.388173', '2026-05-25 09:42:17.388173', '新郑市', '410184', 3, 'xinzhengshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1601, NULL, NULL, NULL, '2026-05-25 09:42:17.399174', '2026-05-25 09:42:17.399174', '登封市', '410185', 3, 'dengfengshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1602, NULL, NULL, NULL, '2026-05-25 09:42:17.408174', '2026-05-25 09:42:17.408174', '开封市', '4102', 2, 'kaifengshi', 'K', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1603, NULL, NULL, NULL, '2026-05-25 09:42:17.419174', '2026-05-25 09:42:17.419174', '龙亭区', '410202', 3, 'longtingqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1604, NULL, NULL, NULL, '2026-05-25 09:42:17.427174', '2026-05-25 09:42:17.427174', '顺河回族区', '410203', 3, 'shunhehuizuqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1605, NULL, NULL, NULL, '2026-05-25 09:42:17.436174', '2026-05-25 09:42:17.436174', '鼓楼区', '410204', 3, 'gulouqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1606, NULL, NULL, NULL, '2026-05-25 09:42:17.445173', '2026-05-25 09:42:17.445173', '禹王台区', '410205', 3, 'yuwangtaiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1607, NULL, NULL, NULL, '2026-05-25 09:42:17.453174', '2026-05-25 09:42:17.453174', '祥符区', '410212', 3, 'xiangfuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1608, NULL, NULL, NULL, '2026-05-25 09:42:17.462174', '2026-05-25 09:42:17.462174', '杞县', '410221', 3, 'qixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1609, NULL, NULL, NULL, '2026-05-25 09:42:17.471174', '2026-05-25 09:42:17.471174', '通许县', '410222', 3, 'tongxuxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1610, NULL, NULL, NULL, '2026-05-25 09:42:17.482173', '2026-05-25 09:42:17.482173', '尉氏县', '410223', 3, 'weishixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1611, NULL, NULL, NULL, '2026-05-25 09:42:17.492172', '2026-05-25 09:42:17.492172', '兰考县', '410225', 3, 'lankaoxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1612, NULL, NULL, NULL, '2026-05-25 09:42:17.500172', '2026-05-25 09:42:17.500172', '洛阳市', '4103', 2, 'luoyangshi', 'L', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1613, NULL, NULL, NULL, '2026-05-25 09:42:17.511174', '2026-05-25 09:42:17.511174', '老城区', '410302', 3, 'laochengqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1614, NULL, NULL, NULL, '2026-05-25 09:42:17.521174', '2026-05-25 09:42:17.521174', '西工区', '410303', 3, 'xigongqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1615, NULL, NULL, NULL, '2026-05-25 09:42:17.529172', '2026-05-25 09:42:17.529172', '瀍河回族区', '410304', 3, 'chanhehuizuqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1616, NULL, NULL, NULL, '2026-05-25 09:42:17.538174', '2026-05-25 09:42:17.538174', '涧西区', '410305', 3, 'jianxiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1617, NULL, NULL, NULL, '2026-05-25 09:42:17.546174', '2026-05-25 09:42:17.546174', '吉利区', '410306', 3, 'jiliqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1618, NULL, NULL, NULL, '2026-05-25 09:42:17.554173', '2026-05-25 09:42:17.554173', '洛龙区', '410311', 3, 'luolongqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1619, NULL, NULL, NULL, '2026-05-25 09:42:17.565174', '2026-05-25 09:42:17.565174', '孟津县', '410322', 3, 'mengjinxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1620, NULL, NULL, NULL, '2026-05-25 09:42:17.579172', '2026-05-25 09:42:17.579172', '新安县', '410323', 3, 'xinanxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1621, NULL, NULL, NULL, '2026-05-25 09:42:17.588174', '2026-05-25 09:42:17.588174', '栾川县', '410324', 3, 'luanchuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1622, NULL, NULL, NULL, '2026-05-25 09:42:17.597173', '2026-05-25 09:42:17.597173', '嵩县', '410325', 3, 'songxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1623, NULL, NULL, NULL, '2026-05-25 09:42:17.607173', '2026-05-25 09:42:17.607173', '汝阳县', '410326', 3, 'ruyangxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1624, NULL, NULL, NULL, '2026-05-25 09:42:17.616376', '2026-05-25 09:42:17.616376', '宜阳县', '410327', 3, 'yiyangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1625, NULL, NULL, NULL, '2026-05-25 09:42:17.625364', '2026-05-25 09:42:17.625364', '洛宁县', '410328', 3, 'luoningxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1626, NULL, NULL, NULL, '2026-05-25 09:42:17.633026', '2026-05-25 09:42:17.633026', '伊川县', '410329', 3, 'yichuanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1627, NULL, NULL, NULL, '2026-05-25 09:42:17.641368', '2026-05-25 09:42:17.641368', '洛阳高新技术产业开发区', '410371', 3, 'luoyanggaoxinjishuchanyekaifaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1628, NULL, NULL, NULL, '2026-05-25 09:42:17.651364', '2026-05-25 09:42:17.651364', '偃师市', '410381', 3, 'yanshishi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1629, NULL, NULL, NULL, '2026-05-25 09:42:17.660016', '2026-05-25 09:42:17.660016', '平顶山市', '4104', 2, 'pingdingshanshi', 'P', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1630, NULL, NULL, NULL, '2026-05-25 09:42:17.667165', '2026-05-25 09:42:17.667165', '新华区', '410402', 3, 'xinhuaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1631, NULL, NULL, NULL, '2026-05-25 09:42:17.676480', '2026-05-25 09:42:17.676480', '卫东区', '410403', 3, 'weidongqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1632, NULL, NULL, NULL, '2026-05-25 09:42:17.685483', '2026-05-25 09:42:17.685483', '石龙区', '410404', 3, 'shilongqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1633, NULL, NULL, NULL, '2026-05-25 09:42:17.694480', '2026-05-25 09:42:17.694480', '湛河区', '410411', 3, 'zhanhequ', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1634, NULL, NULL, NULL, '2026-05-25 09:42:17.702479', '2026-05-25 09:42:17.702479', '宝丰县', '410421', 3, 'baofengxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1635, NULL, NULL, NULL, '2026-05-25 09:42:17.711285', '2026-05-25 09:42:17.711285', '叶县', '410422', 3, 'yexian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1636, NULL, NULL, NULL, '2026-05-25 09:42:17.719285', '2026-05-25 09:42:17.719285', '鲁山县', '410423', 3, 'lushanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1637, NULL, NULL, NULL, '2026-05-25 09:42:17.727120', '2026-05-25 09:42:17.727120', '郏县', '410425', 3, 'jiaxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1638, NULL, NULL, NULL, '2026-05-25 09:42:17.735119', '2026-05-25 09:42:17.735119', '平顶山高新技术产业开发区', '410471', 3, 'pingdingshangaoxinjishuchanyekaifaqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1639, NULL, NULL, NULL, '2026-05-25 09:42:17.744283', '2026-05-25 09:42:17.744283', '平顶山市城乡一体化示范区', '410472', 3, 'pingdingshanshichengxiangyitihuashifanqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1640, NULL, NULL, NULL, '2026-05-25 09:42:17.752668', '2026-05-25 09:42:17.752668', '舞钢市', '410481', 3, 'wugangshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1641, NULL, NULL, NULL, '2026-05-25 09:42:17.761101', '2026-05-25 09:42:17.761101', '汝州市', '410482', 3, 'ruzhoushi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1642, NULL, NULL, NULL, '2026-05-25 09:42:17.768094', '2026-05-25 09:42:17.768094', '安阳市', '4105', 2, 'anyangshi', 'A', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1643, NULL, NULL, NULL, '2026-05-25 09:42:17.777067', '2026-05-25 09:42:17.777067', '文峰区', '410502', 3, 'wenfengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1644, NULL, NULL, NULL, '2026-05-25 09:42:17.785122', '2026-05-25 09:42:17.785122', '北关区', '410503', 3, 'beiguanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1645, NULL, NULL, NULL, '2026-05-25 09:42:17.794125', '2026-05-25 09:42:17.794125', '殷都区', '410505', 3, 'yindouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1646, NULL, NULL, NULL, '2026-05-25 09:42:17.802488', '2026-05-25 09:42:17.802488', '龙安区', '410506', 3, 'longanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1647, NULL, NULL, NULL, '2026-05-25 09:42:17.809509', '2026-05-25 09:42:17.809509', '安阳县', '410522', 3, 'anyangxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1648, NULL, NULL, NULL, '2026-05-25 09:42:17.818104', '2026-05-25 09:42:17.818104', '汤阴县', '410523', 3, 'tangyinxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1649, NULL, NULL, NULL, '2026-05-25 09:42:17.826417', '2026-05-25 09:42:17.827417', '滑县', '410526', 3, 'huaxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1650, NULL, NULL, NULL, '2026-05-25 09:42:17.835000', '2026-05-25 09:42:17.835000', '内黄县', '410527', 3, 'neihuangxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1651, NULL, NULL, NULL, '2026-05-25 09:42:17.844088', '2026-05-25 09:42:17.844088', '安阳高新技术产业开发区', '410571', 3, 'anyanggaoxinjishuchanyekaifaqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1652, NULL, NULL, NULL, '2026-05-25 09:42:17.853444', '2026-05-25 09:42:17.853444', '林州市', '410581', 3, 'linzhoushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1653, NULL, NULL, NULL, '2026-05-25 09:42:17.860441', '2026-05-25 09:42:17.860441', '鹤壁市', '4106', 2, 'hebishi', 'H', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1654, NULL, NULL, NULL, '2026-05-25 09:42:17.871982', '2026-05-25 09:42:17.871982', '鹤山区', '410602', 3, 'heshanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1655, NULL, NULL, NULL, '2026-05-25 09:42:17.880262', '2026-05-25 09:42:17.880262', '山城区', '410603', 3, 'shanchengqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1656, NULL, NULL, NULL, '2026-05-25 09:42:17.889267', '2026-05-25 09:42:17.889267', '淇滨区', '410611', 3, 'qibinqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1657, NULL, NULL, NULL, '2026-05-25 09:42:17.897883', '2026-05-25 09:42:17.897883', '浚县', '410621', 3, 'junxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1658, NULL, NULL, NULL, '2026-05-25 09:42:17.905707', '2026-05-25 09:42:17.905707', '淇县', '410622', 3, 'qixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1659, NULL, NULL, NULL, '2026-05-25 09:42:17.917430', '2026-05-25 09:42:17.917430', '鹤壁经济技术开发区', '410671', 3, 'hebijingjijishukaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1660, NULL, NULL, NULL, '2026-05-25 09:42:17.925430', '2026-05-25 09:42:17.925430', '新乡市', '4107', 2, 'xinxiangshi', 'X', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1661, NULL, NULL, NULL, '2026-05-25 09:42:17.937137', '2026-05-25 09:42:17.937137', '红旗区', '410702', 3, 'hongqiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1662, NULL, NULL, NULL, '2026-05-25 09:42:17.952499', '2026-05-25 09:42:17.952499', '卫滨区', '410703', 3, 'weibinqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1663, NULL, NULL, NULL, '2026-05-25 09:42:17.963499', '2026-05-25 09:42:17.963499', '凤泉区', '410704', 3, 'fengquanqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1664, NULL, NULL, NULL, '2026-05-25 09:42:17.972501', '2026-05-25 09:42:17.972501', '牧野区', '410711', 3, 'muyequ', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1665, NULL, NULL, NULL, '2026-05-25 09:42:17.981496', '2026-05-25 09:42:17.981496', '新乡县', '410721', 3, 'xinxiangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1666, NULL, NULL, NULL, '2026-05-25 09:42:17.989493', '2026-05-25 09:42:17.989493', '获嘉县', '410724', 3, 'huojiaxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1667, NULL, NULL, NULL, '2026-05-25 09:42:18.000337', '2026-05-25 09:42:18.000337', '原阳县', '410725', 3, 'yuanyangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1668, NULL, NULL, NULL, '2026-05-25 09:42:18.011337', '2026-05-25 09:42:18.011337', '延津县', '410726', 3, 'yanjinxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1669, NULL, NULL, NULL, '2026-05-25 09:42:18.020337', '2026-05-25 09:42:18.020337', '封丘县', '410727', 3, 'fengqiuxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1670, NULL, NULL, NULL, '2026-05-25 09:42:18.028338', '2026-05-25 09:42:18.028338', '新乡高新技术产业开发区', '410771', 3, 'xinxianggaoxinjishuchanyekaifaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1671, NULL, NULL, NULL, '2026-05-25 09:42:18.035997', '2026-05-25 09:42:18.035997', '新乡经济技术开发区', '410772', 3, 'xinxiangjingjijishukaifaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1672, NULL, NULL, NULL, '2026-05-25 09:42:18.045046', '2026-05-25 09:42:18.045046', '新乡市平原城乡一体化示范区', '410773', 3, 'xinxiangshipingyuanchengxiangyitihuashifanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1673, NULL, NULL, NULL, '2026-05-25 09:42:18.053046', '2026-05-25 09:42:18.053046', '卫辉市', '410781', 3, 'weihuishi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1674, NULL, NULL, NULL, '2026-05-25 09:42:18.062047', '2026-05-25 09:42:18.062047', '辉县市', '410782', 3, 'huixianshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1675, NULL, NULL, NULL, '2026-05-25 09:42:18.074208', '2026-05-25 09:42:18.074208', '长垣市', '410783', 3, 'zhangyuanshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1676, NULL, NULL, NULL, '2026-05-25 09:42:18.082209', '2026-05-25 09:42:18.082209', '焦作市', '4108', 2, 'jiaozuoshi', 'J', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1677, NULL, NULL, NULL, '2026-05-25 09:42:18.088350', '2026-05-25 09:42:18.089349', '解放区', '410802', 3, 'jiefangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1678, NULL, NULL, NULL, '2026-05-25 09:42:18.097349', '2026-05-25 09:42:18.097349', '中站区', '410803', 3, 'zhongzhanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1679, NULL, NULL, NULL, '2026-05-25 09:42:18.105380', '2026-05-25 09:42:18.105380', '马村区', '410804', 3, 'macunqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1680, NULL, NULL, NULL, '2026-05-25 09:42:18.112668', '2026-05-25 09:42:18.112668', '山阳区', '410811', 3, 'shanyangqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1681, NULL, NULL, NULL, '2026-05-25 09:42:18.120666', '2026-05-25 09:42:18.120666', '修武县', '410821', 3, 'xiuwuxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1682, NULL, NULL, NULL, '2026-05-25 09:42:18.130692', '2026-05-25 09:42:18.130692', '博爱县', '410822', 3, 'boaixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1683, NULL, NULL, NULL, '2026-05-25 09:42:18.139692', '2026-05-25 09:42:18.139692', '武陟县', '410823', 3, 'wuzhixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1684, NULL, NULL, NULL, '2026-05-25 09:42:18.148334', '2026-05-25 09:42:18.148334', '温县', '410825', 3, 'wenxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1685, NULL, NULL, NULL, '2026-05-25 09:42:18.158334', '2026-05-25 09:42:18.158334', '焦作城乡一体化示范区', '410871', 3, 'jiaozuochengxiangyitihuashifanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1686, NULL, NULL, NULL, '2026-05-25 09:42:18.168009', '2026-05-25 09:42:18.168009', '沁阳市', '410882', 3, 'qinyangshi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1687, NULL, NULL, NULL, '2026-05-25 09:42:18.175161', '2026-05-25 09:42:18.175161', '孟州市', '410883', 3, 'mengzhoushi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1688, NULL, NULL, NULL, '2026-05-25 09:42:18.185182', '2026-05-25 09:42:18.185182', '濮阳市', '4109', 2, 'puyangshi', 'P', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1689, NULL, NULL, NULL, '2026-05-25 09:42:18.194183', '2026-05-25 09:42:18.194183', '华龙区', '410902', 3, 'hualongqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1690, NULL, NULL, NULL, '2026-05-25 09:42:18.204479', '2026-05-25 09:42:18.204479', '清丰县', '410922', 3, 'qingfengxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1691, NULL, NULL, NULL, '2026-05-25 09:42:18.214010', '2026-05-25 09:42:18.214010', '南乐县', '410923', 3, 'nanlexian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1692, NULL, NULL, NULL, '2026-05-25 09:42:18.224009', '2026-05-25 09:42:18.224009', '范县', '410926', 3, 'fanxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1693, NULL, NULL, NULL, '2026-05-25 09:42:18.233265', '2026-05-25 09:42:18.233265', '台前县', '410927', 3, 'taiqianxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1694, NULL, NULL, NULL, '2026-05-25 09:42:18.243851', '2026-05-25 09:42:18.243851', '濮阳县', '410928', 3, 'puyangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1695, NULL, NULL, NULL, '2026-05-25 09:42:18.251851', '2026-05-25 09:42:18.251851', '河南濮阳工业园区', '410971', 3, 'henanpuyanggongyeyuanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1696, NULL, NULL, NULL, '2026-05-25 09:42:18.261857', '2026-05-25 09:42:18.261857', '濮阳经济技术开发区', '410972', 3, 'puyangjingjijishukaifaqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1697, NULL, NULL, NULL, '2026-05-25 09:42:18.271302', '2026-05-25 09:42:18.271302', '许昌市', '4110', 2, 'xuchangshi', 'X', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1698, NULL, NULL, NULL, '2026-05-25 09:42:18.280302', '2026-05-25 09:42:18.280302', '魏都区', '411002', 3, 'weidouqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1699, NULL, NULL, NULL, '2026-05-25 09:42:18.291007', '2026-05-25 09:42:18.291007', '建安区', '411003', 3, 'jiananqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1700, NULL, NULL, NULL, '2026-05-25 09:42:18.299013', '2026-05-25 09:42:18.299013', '鄢陵县', '411024', 3, 'yanlingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1701, NULL, NULL, NULL, '2026-05-25 09:42:18.307972', '2026-05-25 09:42:18.307972', '襄城县', '411025', 3, 'xiangchengxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1702, NULL, NULL, NULL, '2026-05-25 09:42:18.317158', '2026-05-25 09:42:18.317158', '许昌经济技术开发区', '411071', 3, 'xuchangjingjijishukaifaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1703, NULL, NULL, NULL, '2026-05-25 09:42:18.328182', '2026-05-25 09:42:18.328182', '禹州市', '411081', 3, 'yuzhoushi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1704, NULL, NULL, NULL, '2026-05-25 09:42:18.337184', '2026-05-25 09:42:18.337184', '长葛市', '411082', 3, 'zhanggeshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1705, NULL, NULL, NULL, '2026-05-25 09:42:18.345183', '2026-05-25 09:42:18.345183', '漯河市', '4111', 2, 'taheshi', 'T', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1706, NULL, NULL, NULL, '2026-05-25 09:42:18.353184', '2026-05-25 09:42:18.353184', '源汇区', '411102', 3, 'yuanhuiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1707, NULL, NULL, NULL, '2026-05-25 09:42:18.362183', '2026-05-25 09:42:18.362183', '郾城区', '411103', 3, 'yanchengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1708, NULL, NULL, NULL, '2026-05-25 09:42:18.370268', '2026-05-25 09:42:18.370268', '召陵区', '411104', 3, 'zhaolingqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1709, NULL, NULL, NULL, '2026-05-25 09:42:18.379268', '2026-05-25 09:42:18.379268', '舞阳县', '411121', 3, 'wuyangxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1710, NULL, NULL, NULL, '2026-05-25 09:42:18.388268', '2026-05-25 09:42:18.388268', '临颍县', '411122', 3, 'linyingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1711, NULL, NULL, NULL, '2026-05-25 09:42:18.398264', '2026-05-25 09:42:18.398264', '漯河经济技术开发区', '411171', 3, 'tahejingjijishukaifaqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1712, NULL, NULL, NULL, '2026-05-25 09:42:18.406263', '2026-05-25 09:42:18.406263', '三门峡市', '4112', 2, 'sanmenxiashi', 'S', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1713, NULL, NULL, NULL, '2026-05-25 09:42:18.415273', '2026-05-25 09:42:18.415273', '湖滨区', '411202', 3, 'hubinqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1714, NULL, NULL, NULL, '2026-05-25 09:42:18.424067', '2026-05-25 09:42:18.424067', '陕州区', '411203', 3, 'shanzhouqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1715, NULL, NULL, NULL, '2026-05-25 09:42:18.432928', '2026-05-25 09:42:18.432928', '渑池县', '411221', 3, 'mianchixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1716, NULL, NULL, NULL, '2026-05-25 09:42:18.440972', '2026-05-25 09:42:18.440972', '卢氏县', '411224', 3, 'lushixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1717, NULL, NULL, NULL, '2026-05-25 09:42:18.449969', '2026-05-25 09:42:18.449969', '河南三门峡经济开发区', '411271', 3, 'henansanmenxiajingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1718, NULL, NULL, NULL, '2026-05-25 09:42:18.458004', '2026-05-25 09:42:18.458004', '义马市', '411281', 3, 'yimashi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1719, NULL, NULL, NULL, '2026-05-25 09:42:18.468064', '2026-05-25 09:42:18.468064', '灵宝市', '411282', 3, 'lingbaoshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1720, NULL, NULL, NULL, '2026-05-25 09:42:18.476070', '2026-05-25 09:42:18.476070', '南阳市', '4113', 2, 'nanyangshi', 'N', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1721, NULL, NULL, NULL, '2026-05-25 09:42:18.488070', '2026-05-25 09:42:18.488070', '宛城区', '411302', 3, 'wanchengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1722, NULL, NULL, NULL, '2026-05-25 09:42:18.496070', '2026-05-25 09:42:18.496070', '卧龙区', '411303', 3, 'wolongqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1723, NULL, NULL, NULL, '2026-05-25 09:42:18.504071', '2026-05-25 09:42:18.504071', '南召县', '411321', 3, 'nanzhaoxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1724, NULL, NULL, NULL, '2026-05-25 09:42:18.513065', '2026-05-25 09:42:18.513065', '方城县', '411322', 3, 'fangchengxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1725, NULL, NULL, NULL, '2026-05-25 09:42:18.522279', '2026-05-25 09:42:18.522279', '西峡县', '411323', 3, 'xixiaxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1726, NULL, NULL, NULL, '2026-05-25 09:42:18.531270', '2026-05-25 09:42:18.531270', '镇平县', '411324', 3, 'zhenpingxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1727, NULL, NULL, NULL, '2026-05-25 09:42:18.540275', '2026-05-25 09:42:18.540275', '内乡县', '411325', 3, 'neixiangxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1728, NULL, NULL, NULL, '2026-05-25 09:42:18.550269', '2026-05-25 09:42:18.550269', '淅川县', '411326', 3, 'xichuanxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1729, NULL, NULL, NULL, '2026-05-25 09:42:18.557954', '2026-05-25 09:42:18.557954', '社旗县', '411327', 3, 'sheqixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1730, NULL, NULL, NULL, '2026-05-25 09:42:18.569965', '2026-05-25 09:42:18.569965', '唐河县', '411328', 3, 'tanghexian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1731, NULL, NULL, NULL, '2026-05-25 09:42:18.582069', '2026-05-25 09:42:18.582069', '新野县', '411329', 3, 'xinyexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1732, NULL, NULL, NULL, '2026-05-25 09:42:18.590115', '2026-05-25 09:42:18.590115', '桐柏县', '411330', 3, 'tongbaixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1733, NULL, NULL, NULL, '2026-05-25 09:42:18.599116', '2026-05-25 09:42:18.599116', '南阳高新技术产业开发区', '411371', 3, 'nanyanggaoxinjishuchanyekaifaqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1734, NULL, NULL, NULL, '2026-05-25 09:42:18.608129', '2026-05-25 09:42:18.608129', '南阳市城乡一体化示范区', '411372', 3, 'nanyangshichengxiangyitihuashifanqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1735, NULL, NULL, NULL, '2026-05-25 09:42:18.619607', '2026-05-25 09:42:18.619607', '邓州市', '411381', 3, 'dengzhoushi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1736, NULL, NULL, NULL, '2026-05-25 09:42:18.630150', '2026-05-25 09:42:18.630150', '商丘市', '4114', 2, 'shangqiushi', 'S', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1737, NULL, NULL, NULL, '2026-05-25 09:42:18.639150', '2026-05-25 09:42:18.639150', '梁园区', '411402', 3, 'liangyuanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1738, NULL, NULL, NULL, '2026-05-25 09:42:18.648150', '2026-05-25 09:42:18.648150', '睢阳区', '411403', 3, 'suiyangqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1739, NULL, NULL, NULL, '2026-05-25 09:42:18.657149', '2026-05-25 09:42:18.657149', '民权县', '411421', 3, 'minquanxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1740, NULL, NULL, NULL, '2026-05-25 09:42:18.665151', '2026-05-25 09:42:18.665151', '睢县', '411422', 3, 'suixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1741, NULL, NULL, NULL, '2026-05-25 09:42:18.677151', '2026-05-25 09:42:18.677151', '宁陵县', '411423', 3, 'ninglingxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1742, NULL, NULL, NULL, '2026-05-25 09:42:18.686808', '2026-05-25 09:42:18.686808', '柘城县', '411424', 3, 'zhechengxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1743, NULL, NULL, NULL, '2026-05-25 09:42:18.694374', '2026-05-25 09:42:18.694374', '虞城县', '411425', 3, 'yuchengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1744, NULL, NULL, NULL, '2026-05-25 09:42:18.702454', '2026-05-25 09:42:18.702454', '夏邑县', '411426', 3, 'xiayixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1745, NULL, NULL, NULL, '2026-05-25 09:42:18.712120', '2026-05-25 09:42:18.712120', '豫东综合物流产业聚集区', '411471', 3, 'yudongzonghewuliuchanyejujiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1746, NULL, NULL, NULL, '2026-05-25 09:42:18.722226', '2026-05-25 09:42:18.722226', '河南商丘经济开发区', '411472', 3, 'henanshangqiujingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1747, NULL, NULL, NULL, '2026-05-25 09:42:18.731221', '2026-05-25 09:42:18.731221', '永城市', '411481', 3, 'yongchengshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1748, NULL, NULL, NULL, '2026-05-25 09:42:18.739226', '2026-05-25 09:42:18.739226', '信阳市', '4115', 2, 'xinyangshi', 'X', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1749, NULL, NULL, NULL, '2026-05-25 09:42:18.747471', '2026-05-25 09:42:18.747471', '浉河区', '411502', 3, 'shihequ', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1750, NULL, NULL, NULL, '2026-05-25 09:42:18.757471', '2026-05-25 09:42:18.757471', '平桥区', '411503', 3, 'pingqiaoqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1751, NULL, NULL, NULL, '2026-05-25 09:42:18.765471', '2026-05-25 09:42:18.765471', '罗山县', '411521', 3, 'luoshanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1752, NULL, NULL, NULL, '2026-05-25 09:42:18.774471', '2026-05-25 09:42:18.774471', '光山县', '411522', 3, 'guangshanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1753, NULL, NULL, NULL, '2026-05-25 09:42:18.785472', '2026-05-25 09:42:18.785472', '新县', '411523', 3, 'xinxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1754, NULL, NULL, NULL, '2026-05-25 09:42:18.793471', '2026-05-25 09:42:18.793471', '商城县', '411524', 3, 'shangchengxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1755, NULL, NULL, NULL, '2026-05-25 09:42:18.801055', '2026-05-25 09:42:18.801055', '固始县', '411525', 3, 'gushixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1756, NULL, NULL, NULL, '2026-05-25 09:42:18.809055', '2026-05-25 09:42:18.809055', '潢川县', '411526', 3, 'huangchuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1757, NULL, NULL, NULL, '2026-05-25 09:42:18.817055', '2026-05-25 09:42:18.817055', '淮滨县', '411527', 3, 'huaibinxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1758, NULL, NULL, NULL, '2026-05-25 09:42:18.827063', '2026-05-25 09:42:18.827063', '息县', '411528', 3, 'xixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1759, NULL, NULL, NULL, '2026-05-25 09:42:18.836014', '2026-05-25 09:42:18.836014', '信阳高新技术产业开发区', '411571', 3, 'xinyanggaoxinjishuchanyekaifaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1760, NULL, NULL, NULL, '2026-05-25 09:42:18.848059', '2026-05-25 09:42:18.848059', '周口市', '4116', 2, 'zhoukoushi', 'Z', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1761, NULL, NULL, NULL, '2026-05-25 09:42:18.858124', '2026-05-25 09:42:18.858124', '川汇区', '411602', 3, 'chuanhuiqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1762, NULL, NULL, NULL, '2026-05-25 09:42:18.867221', '2026-05-25 09:42:18.868220', '淮阳区', '411603', 3, 'huaiyangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1763, NULL, NULL, NULL, '2026-05-25 09:42:18.880427', '2026-05-25 09:42:18.881422', '扶沟县', '411621', 3, 'fugouxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1764, NULL, NULL, NULL, '2026-05-25 09:42:18.889438', '2026-05-25 09:42:18.889438', '西华县', '411622', 3, 'xihuaxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1765, NULL, NULL, NULL, '2026-05-25 09:42:18.899438', '2026-05-25 09:42:18.899438', '商水县', '411623', 3, 'shangshuixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1766, NULL, NULL, NULL, '2026-05-25 09:42:18.909453', '2026-05-25 09:42:18.909453', '沈丘县', '411624', 3, 'shenqiuxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1767, NULL, NULL, NULL, '2026-05-25 09:42:18.917811', '2026-05-25 09:42:18.917811', '郸城县', '411625', 3, 'danchengxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1768, NULL, NULL, NULL, '2026-05-25 09:42:18.926825', '2026-05-25 09:42:18.926825', '太康县', '411627', 3, 'taikangxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1769, NULL, NULL, NULL, '2026-05-25 09:42:18.936009', '2026-05-25 09:42:18.936009', '鹿邑县', '411628', 3, 'luyixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1770, NULL, NULL, NULL, '2026-05-25 09:42:18.944997', '2026-05-25 09:42:18.944997', '河南周口经济开发区', '411671', 3, 'henanzhoukoujingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1771, NULL, NULL, NULL, '2026-05-25 09:42:18.953004', '2026-05-25 09:42:18.953004', '项城市', '411681', 3, 'xiangchengshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1772, NULL, NULL, NULL, '2026-05-25 09:42:18.962313', '2026-05-25 09:42:18.962313', '驻马店市', '4117', 2, 'zhumadianshi', 'Z', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1773, NULL, NULL, NULL, '2026-05-25 09:42:18.971319', '2026-05-25 09:42:18.971319', '驿城区', '411702', 3, 'yichengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1774, NULL, NULL, NULL, '2026-05-25 09:42:18.979146', '2026-05-25 09:42:18.979146', '西平县', '411721', 3, 'xipingxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1775, NULL, NULL, NULL, '2026-05-25 09:42:18.987350', '2026-05-25 09:42:18.987350', '上蔡县', '411722', 3, 'shangcaixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1776, NULL, NULL, NULL, '2026-05-25 09:42:18.995350', '2026-05-25 09:42:18.995350', '平舆县', '411723', 3, 'pingyuxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1777, NULL, NULL, NULL, '2026-05-25 09:42:19.003349', '2026-05-25 09:42:19.003349', '正阳县', '411724', 3, 'zhengyangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1778, NULL, NULL, NULL, '2026-05-25 09:42:19.012345', '2026-05-25 09:42:19.012345', '确山县', '411725', 3, 'queshanxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1779, NULL, NULL, NULL, '2026-05-25 09:42:19.021343', '2026-05-25 09:42:19.021343', '泌阳县', '411726', 3, 'biyangxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1780, NULL, NULL, NULL, '2026-05-25 09:42:19.029343', '2026-05-25 09:42:19.029343', '汝南县', '411727', 3, 'runanxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1781, NULL, NULL, NULL, '2026-05-25 09:42:19.038479', '2026-05-25 09:42:19.038479', '遂平县', '411728', 3, 'suipingxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1782, NULL, NULL, NULL, '2026-05-25 09:42:19.049717', '2026-05-25 09:42:19.049717', '新蔡县', '411729', 3, 'xincaixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1783, NULL, NULL, NULL, '2026-05-25 09:42:19.057710', '2026-05-25 09:42:19.057710', '河南驻马店经济开发区', '411771', 3, 'henanzhumadianjingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1784, NULL, NULL, NULL, '2026-05-25 09:42:19.066813', '2026-05-25 09:42:19.066813', '省直辖县级行政区划', '4190', 2, 'shengzhixiaxianjixingzhengquhua', 'S', 1, NULL, '130105');
INSERT INTO `dvadmin_system_area` VALUES (1785, NULL, NULL, NULL, '2026-05-25 09:42:19.075820', '2026-05-25 09:42:19.075820', '济源市', '419001', 3, 'jiyuanshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1786, NULL, NULL, NULL, '2026-05-25 09:42:19.084042', '2026-04-03 10:10:05.025000', '湖北省', '42', 1, 'hubeisheng', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1787, NULL, NULL, NULL, '2026-05-25 09:42:19.092440', '2026-05-25 09:42:19.092440', '武汉市', '4201', 2, 'wuhanshi', 'W', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1788, NULL, NULL, NULL, '2026-05-25 09:42:19.099445', '2026-05-25 09:42:19.100445', '江岸区', '420102', 3, 'jianganqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1789, NULL, NULL, NULL, '2026-05-25 09:42:19.109444', '2026-05-25 09:42:19.110440', '江汉区', '420103', 3, 'jianghanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1790, NULL, NULL, NULL, '2026-05-25 09:42:19.119280', '2026-05-25 09:42:19.119280', '硚口区', '420104', 3, 'qiaokouqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1791, NULL, NULL, NULL, '2026-05-25 09:42:19.127279', '2026-05-25 09:42:19.127279', '汉阳区', '420105', 3, 'hanyangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1792, NULL, NULL, NULL, '2026-05-25 09:42:19.134054', '2026-05-25 09:42:19.134054', '武昌区', '420106', 3, 'wuchangqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1793, NULL, NULL, NULL, '2026-05-25 09:42:19.142968', '2026-05-25 09:42:19.142968', '青山区', '420107', 3, 'qingshanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1794, NULL, NULL, NULL, '2026-05-25 09:42:19.151032', '2026-05-25 09:42:19.151032', '洪山区', '420111', 3, 'hongshanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1795, NULL, NULL, NULL, '2026-05-25 09:42:19.160008', '2026-05-25 09:42:19.160008', '东西湖区', '420112', 3, 'dongxihuqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1796, NULL, NULL, NULL, '2026-05-25 09:42:19.168006', '2026-05-25 09:42:19.168006', '汉南区', '420113', 3, 'hannanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1797, NULL, NULL, NULL, '2026-05-25 09:42:19.177006', '2026-05-25 09:42:19.177006', '蔡甸区', '420114', 3, 'caidianqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1798, NULL, NULL, NULL, '2026-05-25 09:42:19.187066', '2026-05-25 09:42:19.187066', '江夏区', '420115', 3, 'jiangxiaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1799, NULL, NULL, NULL, '2026-05-25 09:42:19.195066', '2026-05-25 09:42:19.195066', '黄陂区', '420116', 3, 'huangpiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1800, NULL, NULL, NULL, '2026-05-25 09:42:19.206097', '2026-05-25 09:42:19.206097', '新洲区', '420117', 3, 'xinzhouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1801, NULL, NULL, NULL, '2026-05-25 09:42:19.214102', '2026-05-25 09:42:19.214102', '黄石市', '4202', 2, 'huangshishi', 'H', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1802, NULL, NULL, NULL, '2026-05-25 09:42:19.224102', '2026-05-25 09:42:19.224102', '黄石港区', '420202', 3, 'huangshigangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1803, NULL, NULL, NULL, '2026-05-25 09:42:19.232555', '2026-05-25 09:42:19.232555', '西塞山区', '420203', 3, 'xisaishanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1804, NULL, NULL, NULL, '2026-05-25 09:42:19.240593', '2026-05-25 09:42:19.240593', '下陆区', '420204', 3, 'xialuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1805, NULL, NULL, NULL, '2026-05-25 09:42:19.248807', '2026-05-25 09:42:19.248807', '铁山区', '420205', 3, 'tieshanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1806, NULL, NULL, NULL, '2026-05-25 09:42:19.255810', '2026-05-25 09:42:19.255810', '阳新县', '420222', 3, 'yangxinxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1807, NULL, NULL, NULL, '2026-05-25 09:42:19.263808', '2026-05-25 09:42:19.263808', '大冶市', '420281', 3, 'dayeshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1808, NULL, NULL, NULL, '2026-05-25 09:42:19.272813', '2026-05-25 09:42:19.272813', '十堰市', '4203', 2, 'shiyanshi', 'S', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1809, NULL, NULL, NULL, '2026-05-25 09:42:19.281800', '2026-05-25 09:42:19.281800', '茅箭区', '420302', 3, 'maojianqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1810, NULL, NULL, NULL, '2026-05-25 09:42:19.290811', '2026-05-25 09:42:19.290811', '张湾区', '420303', 3, 'zhangwanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1811, NULL, NULL, NULL, '2026-05-25 09:42:19.299807', '2026-05-25 09:42:19.299807', '郧阳区', '420304', 3, 'yunyangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1812, NULL, NULL, NULL, '2026-05-25 09:42:19.308807', '2026-05-25 09:42:19.308807', '郧西县', '420322', 3, 'yunxixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1813, NULL, NULL, NULL, '2026-05-25 09:42:19.317802', '2026-05-25 09:42:19.317802', '竹山县', '420323', 3, 'zhushanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1814, NULL, NULL, NULL, '2026-05-25 09:42:19.326807', '2026-05-25 09:42:19.326807', '竹溪县', '420324', 3, 'zhuxixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1815, NULL, NULL, NULL, '2026-05-25 09:42:19.336245', '2026-05-25 09:42:19.336245', '房县', '420325', 3, 'fangxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1816, NULL, NULL, NULL, '2026-05-25 09:42:19.345253', '2026-05-25 09:42:19.345253', '丹江口市', '420381', 3, 'danjiangkoushi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1817, NULL, NULL, NULL, '2026-05-25 09:42:19.354321', '2026-05-25 09:42:19.354321', '宜昌市', '4205', 2, 'yichangshi', 'Y', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1818, NULL, NULL, NULL, '2026-05-25 09:42:19.362050', '2026-05-25 09:42:19.362050', '西陵区', '420502', 3, 'xilingqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1819, NULL, NULL, NULL, '2026-05-25 09:42:19.371085', '2026-05-25 09:42:19.371085', '伍家岗区', '420503', 3, 'wujiagangqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1820, NULL, NULL, NULL, '2026-05-25 09:42:19.380084', '2026-05-25 09:42:19.380084', '点军区', '420504', 3, 'dianjunqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1821, NULL, NULL, NULL, '2026-05-25 09:42:19.388084', '2026-05-25 09:42:19.388084', '猇亭区', '420505', 3, 'xiaotingqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1822, NULL, NULL, NULL, '2026-05-25 09:42:19.396338', '2026-05-25 09:42:19.396338', '夷陵区', '420506', 3, 'yilingqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1823, NULL, NULL, NULL, '2026-05-25 09:42:19.404826', '2026-05-25 09:42:19.404826', '远安县', '420525', 3, 'yuananxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1824, NULL, NULL, NULL, '2026-05-25 09:42:19.412820', '2026-05-25 09:42:19.412820', '兴山县', '420526', 3, 'xingshanxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1825, NULL, NULL, NULL, '2026-05-25 09:42:19.421068', '2026-05-25 09:42:19.421068', '秭归县', '420527', 3, 'ziguixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1826, NULL, NULL, NULL, '2026-05-25 09:42:19.429068', '2026-05-25 09:42:19.429068', '长阳土家族自治县', '420528', 3, 'zhangyangtujiazuzizhixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1827, NULL, NULL, NULL, '2026-05-25 09:42:19.439080', '2026-05-25 09:42:19.439080', '五峰土家族自治县', '420529', 3, 'wufengtujiazuzizhixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1828, NULL, NULL, NULL, '2026-05-25 09:42:19.448212', '2026-05-25 09:42:19.448212', '宜都市', '420581', 3, 'yidushi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1829, NULL, NULL, NULL, '2026-05-25 09:42:19.458081', '2026-05-25 09:42:19.458081', '当阳市', '420582', 3, 'dangyangshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1830, NULL, NULL, NULL, '2026-05-25 09:42:19.466818', '2026-05-25 09:42:19.466818', '枝江市', '420583', 3, 'zhijiangshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1831, NULL, NULL, NULL, '2026-05-25 09:42:19.476131', '2026-05-25 09:42:19.476131', '襄阳市', '4206', 2, 'xiangyangshi', 'X', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1832, NULL, NULL, NULL, '2026-05-25 09:42:19.486955', '2026-05-25 09:42:19.486955', '襄城区', '420602', 3, 'xiangchengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1833, NULL, NULL, NULL, '2026-05-25 09:42:19.495959', '2026-05-25 09:42:19.495959', '樊城区', '420606', 3, 'fanchengqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1834, NULL, NULL, NULL, '2026-05-25 09:42:19.503958', '2026-05-25 09:42:19.503958', '襄州区', '420607', 3, 'xiangzhouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1835, NULL, NULL, NULL, '2026-05-25 09:42:19.511965', '2026-05-25 09:42:19.511965', '南漳县', '420624', 3, 'nanzhangxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1836, NULL, NULL, NULL, '2026-05-25 09:42:19.520959', '2026-05-25 09:42:19.520959', '谷城县', '420625', 3, 'guchengxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1837, NULL, NULL, NULL, '2026-05-25 09:42:19.528958', '2026-05-25 09:42:19.528958', '保康县', '420626', 3, 'baokangxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1838, NULL, NULL, NULL, '2026-05-25 09:42:19.537958', '2026-05-25 09:42:19.537958', '老河口市', '420682', 3, 'laohekoushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1839, NULL, NULL, NULL, '2026-05-25 09:42:19.547881', '2026-05-25 09:42:19.547881', '枣阳市', '420683', 3, 'zaoyangshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1840, NULL, NULL, NULL, '2026-05-25 09:42:19.555887', '2026-05-25 09:42:19.555887', '宜城市', '420684', 3, 'yichengshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1841, NULL, NULL, NULL, '2026-05-25 09:42:19.563928', '2026-05-25 09:42:19.563928', '鄂州市', '4207', 2, 'ezhoushi', 'E', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1842, NULL, NULL, NULL, '2026-05-25 09:42:19.570924', '2026-05-25 09:42:19.570924', '梁子湖区', '420702', 3, 'liangzihuqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1843, NULL, NULL, NULL, '2026-05-25 09:42:19.585986', '2026-05-25 09:42:19.585986', '华容区', '420703', 3, 'huarongqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1844, NULL, NULL, NULL, '2026-05-25 09:42:19.594974', '2026-05-25 09:42:19.594974', '鄂城区', '420704', 3, 'echengqu', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1845, NULL, NULL, NULL, '2026-05-25 09:42:19.602979', '2026-05-25 09:42:19.602979', '荆门市', '4208', 2, 'jingmenshi', 'J', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1846, NULL, NULL, NULL, '2026-05-25 09:42:19.610979', '2026-05-25 09:42:19.610979', '东宝区', '420802', 3, 'dongbaoqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1847, NULL, NULL, NULL, '2026-05-25 09:42:19.619358', '2026-05-25 09:42:19.619358', '掇刀区', '420804', 3, 'duodaoqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1848, NULL, NULL, NULL, '2026-05-25 09:42:19.627365', '2026-05-25 09:42:19.627365', '沙洋县', '420822', 3, 'shayangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1849, NULL, NULL, NULL, '2026-05-25 09:42:19.636262', '2026-05-25 09:42:19.636262', '钟祥市', '420881', 3, 'zhongxiangshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1850, NULL, NULL, NULL, '2026-05-25 09:42:19.642259', '2026-05-25 09:42:19.642259', '京山市', '420882', 3, 'jingshanshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1851, NULL, NULL, NULL, '2026-05-25 09:42:19.650262', '2026-05-25 09:42:19.650262', '孝感市', '4209', 2, 'xiaoganshi', 'X', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1852, NULL, NULL, NULL, '2026-05-25 09:42:19.658999', '2026-05-25 09:42:19.658999', '孝南区', '420902', 3, 'xiaonanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1853, NULL, NULL, NULL, '2026-05-25 09:42:19.666999', '2026-05-25 09:42:19.666999', '孝昌县', '420921', 3, 'xiaochangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1854, NULL, NULL, NULL, '2026-05-25 09:42:19.675358', '2026-05-25 09:42:19.675358', '大悟县', '420922', 3, 'dawuxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1855, NULL, NULL, NULL, '2026-05-25 09:42:19.684874', '2026-05-25 09:42:19.684874', '云梦县', '420923', 3, 'yunmengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1856, NULL, NULL, NULL, '2026-05-25 09:42:19.694957', '2026-05-25 09:42:19.694957', '应城市', '420981', 3, 'yingchengshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1857, NULL, NULL, NULL, '2026-05-25 09:42:19.704193', '2026-05-25 09:42:19.704193', '安陆市', '420982', 3, 'anlushi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1858, NULL, NULL, NULL, '2026-05-25 09:42:19.711189', '2026-05-25 09:42:19.711189', '汉川市', '420984', 3, 'hanchuanshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1859, NULL, NULL, NULL, '2026-05-25 09:42:19.720033', '2026-05-25 09:42:19.720033', '荆州市', '4210', 2, 'jingzhoushi', 'J', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1860, NULL, NULL, NULL, '2026-05-25 09:42:19.728032', '2026-05-25 09:42:19.728032', '沙市区', '421002', 3, 'shashiqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1861, NULL, NULL, NULL, '2026-05-25 09:42:19.736033', '2026-05-25 09:42:19.736033', '荆州区', '421003', 3, 'jingzhouqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1862, NULL, NULL, NULL, '2026-05-25 09:42:19.743301', '2026-05-25 09:42:19.743301', '公安县', '421022', 3, 'gonganxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1863, NULL, NULL, NULL, '2026-05-25 09:42:19.752246', '2026-05-25 09:42:19.752246', '监利县', '421023', 3, 'jianlixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1864, NULL, NULL, NULL, '2026-05-25 09:42:19.760245', '2026-05-25 09:42:19.760245', '江陵县', '421024', 3, 'jianglingxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1865, NULL, NULL, NULL, '2026-05-25 09:42:19.768586', '2026-05-25 09:42:19.768586', '荆州经济技术开发区', '421071', 3, 'jingzhoujingjijishukaifaqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1866, NULL, NULL, NULL, '2026-05-25 09:42:19.775600', '2026-05-25 09:42:19.775600', '石首市', '421081', 3, 'shishoushi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1867, NULL, NULL, NULL, '2026-05-25 09:42:19.785559', '2026-05-25 09:42:19.785559', '洪湖市', '421083', 3, 'honghushi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1868, NULL, NULL, NULL, '2026-05-25 09:42:19.794557', '2026-05-25 09:42:19.794557', '松滋市', '421087', 3, 'songzishi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1869, NULL, NULL, NULL, '2026-05-25 09:42:19.803842', '2026-05-25 09:42:19.803842', '黄冈市', '4211', 2, 'huanggangshi', 'H', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1870, NULL, NULL, NULL, '2026-05-25 09:42:19.813854', '2026-05-25 09:42:19.813854', '黄州区', '421102', 3, 'huangzhouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1871, NULL, NULL, NULL, '2026-05-25 09:42:19.822853', '2026-05-25 09:42:19.822853', '团风县', '421121', 3, 'tuanfengxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1872, NULL, NULL, NULL, '2026-05-25 09:42:19.830854', '2026-05-25 09:42:19.830854', '红安县', '421122', 3, 'honganxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1873, NULL, NULL, NULL, '2026-05-25 09:42:19.838853', '2026-05-25 09:42:19.838853', '罗田县', '421123', 3, 'luotianxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1874, NULL, NULL, NULL, '2026-05-25 09:42:19.847853', '2026-05-25 09:42:19.847853', '英山县', '421124', 3, 'yingshanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1875, NULL, NULL, NULL, '2026-05-25 09:42:19.857683', '2026-05-25 09:42:19.857683', '浠水县', '421125', 3, 'xishuixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1876, NULL, NULL, NULL, '2026-05-25 09:42:19.864683', '2026-05-25 09:42:19.864683', '蕲春县', '421126', 3, 'qichunxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1877, NULL, NULL, NULL, '2026-05-25 09:42:19.873691', '2026-05-25 09:42:19.873691', '黄梅县', '421127', 3, 'huangmeixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1878, NULL, NULL, NULL, '2026-05-25 09:42:19.884686', '2026-05-25 09:42:19.884686', '龙感湖管理区', '421171', 3, 'longganhuguanliqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1879, NULL, NULL, NULL, '2026-05-25 09:42:19.893690', '2026-05-25 09:42:19.893690', '麻城市', '421181', 3, 'machengshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1880, NULL, NULL, NULL, '2026-05-25 09:42:19.905689', '2026-05-25 09:42:19.905689', '武穴市', '421182', 3, 'wuxueshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1881, NULL, NULL, NULL, '2026-05-25 09:42:19.915557', '2026-05-25 09:42:19.915557', '咸宁市', '4212', 2, 'xianningshi', 'X', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1882, NULL, NULL, NULL, '2026-05-25 09:42:19.923557', '2026-05-25 09:42:19.923557', '咸安区', '421202', 3, 'xiananqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1883, NULL, NULL, NULL, '2026-05-25 09:42:19.932551', '2026-05-25 09:42:19.932551', '嘉鱼县', '421221', 3, 'jiayuxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1884, NULL, NULL, NULL, '2026-05-25 09:42:19.940557', '2026-05-25 09:42:19.940557', '通城县', '421222', 3, 'tongchengxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1885, NULL, NULL, NULL, '2026-05-25 09:42:19.953557', '2026-05-25 09:42:19.953557', '崇阳县', '421223', 3, 'chongyangxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1886, NULL, NULL, NULL, '2026-05-25 09:42:19.961550', '2026-05-25 09:42:19.961550', '通山县', '421224', 3, 'tongshanxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1887, NULL, NULL, NULL, '2026-05-25 09:42:19.971511', '2026-05-25 09:42:19.971511', '赤壁市', '421281', 3, 'chibishi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1888, NULL, NULL, NULL, '2026-05-25 09:42:19.978509', '2026-05-25 09:42:19.978509', '随州市', '4213', 2, 'suizhoushi', 'S', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1889, NULL, NULL, NULL, '2026-05-25 09:42:19.985509', '2026-05-25 09:42:19.985509', '曾都区', '421303', 3, 'cengdouqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1890, NULL, NULL, NULL, '2026-05-25 09:42:19.992580', '2026-05-25 09:42:19.992580', '随县', '421321', 3, 'suixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1891, NULL, NULL, NULL, '2026-05-25 09:42:20.005086', '2026-05-25 09:42:20.005086', '广水市', '421381', 3, 'guangshuishi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1892, NULL, NULL, NULL, '2026-05-25 09:42:20.013084', '2026-05-25 09:42:20.013084', '恩施土家族苗族自治州', '4228', 2, 'enshitujiazumiaozuzizhizhou', 'E', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1893, NULL, NULL, NULL, '2026-05-25 09:42:20.021258', '2026-05-25 09:42:20.021258', '恩施市', '422801', 3, 'enshishi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1894, NULL, NULL, NULL, '2026-05-25 09:42:20.029028', '2026-05-25 09:42:20.029028', '利川市', '422802', 3, 'lichuanshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1895, NULL, NULL, NULL, '2026-05-25 09:42:20.038651', '2026-05-25 09:42:20.038651', '建始县', '422822', 3, 'jianshixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1896, NULL, NULL, NULL, '2026-05-25 09:42:20.047654', '2026-05-25 09:42:20.047654', '巴东县', '422823', 3, 'badongxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1897, NULL, NULL, NULL, '2026-05-25 09:42:20.058646', '2026-05-25 09:42:20.058646', '宣恩县', '422825', 3, 'xuanenxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1898, NULL, NULL, NULL, '2026-05-25 09:42:20.067645', '2026-05-25 09:42:20.067645', '咸丰县', '422826', 3, 'xianfengxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1899, NULL, NULL, NULL, '2026-05-25 09:42:20.077350', '2026-05-25 09:42:20.077350', '来凤县', '422827', 3, 'laifengxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1900, NULL, NULL, NULL, '2026-05-25 09:42:20.086357', '2026-05-25 09:42:20.086357', '鹤峰县', '422828', 3, 'hefengxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1901, NULL, NULL, NULL, '2026-05-25 09:42:20.095119', '2026-05-25 09:42:20.095119', '省直辖县级行政区划', '4290', 2, 'shengzhixiaxianjixingzhengquhua', 'S', 1, NULL, '130107');
INSERT INTO `dvadmin_system_area` VALUES (1902, NULL, NULL, NULL, '2026-05-25 09:42:20.103130', '2026-05-25 09:42:20.103130', '仙桃市', '429004', 3, 'xiantaoshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1903, NULL, NULL, NULL, '2026-05-25 09:42:20.112051', '2026-05-25 09:42:20.112051', '潜江市', '429005', 3, 'qianjiangshi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1904, NULL, NULL, NULL, '2026-05-25 09:42:20.122167', '2026-05-25 09:42:20.122167', '天门市', '429006', 3, 'tianmenshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1905, NULL, NULL, NULL, '2026-05-25 09:42:20.129167', '2026-05-25 09:42:20.129167', '神农架林区', '429021', 3, 'shennongjialinqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1906, NULL, NULL, NULL, '2026-05-25 09:42:20.137195', '2026-04-03 10:10:05.031000', '湖南省', '43', 1, 'hunansheng', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1907, NULL, NULL, NULL, '2026-05-25 09:42:20.146050', '2026-05-25 09:42:20.146050', '长沙市', '4301', 2, 'changshashi', 'C', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1908, NULL, NULL, NULL, '2026-05-25 09:42:20.155046', '2026-05-25 09:42:20.155046', '芙蓉区', '430102', 3, 'furongqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1909, NULL, NULL, NULL, '2026-05-25 09:42:20.163903', '2026-05-25 09:42:20.163903', '天心区', '430103', 3, 'tianxinqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1910, NULL, NULL, NULL, '2026-05-25 09:42:20.173008', '2026-05-25 09:42:20.173008', '岳麓区', '430104', 3, 'yueluqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1911, NULL, NULL, NULL, '2026-05-25 09:42:20.181008', '2026-05-25 09:42:20.181008', '开福区', '430105', 3, 'kaifuqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1912, NULL, NULL, NULL, '2026-05-25 09:42:20.190069', '2026-05-25 09:42:20.190069', '雨花区', '430111', 3, 'yuhuaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1913, NULL, NULL, NULL, '2026-05-25 09:42:20.201070', '2026-05-25 09:42:20.201070', '望城区', '430112', 3, 'wangchengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1914, NULL, NULL, NULL, '2026-05-25 09:42:20.209070', '2026-05-25 09:42:20.209070', '长沙县', '430121', 3, 'changshaxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1915, NULL, NULL, NULL, '2026-05-25 09:42:20.218070', '2026-05-25 09:42:20.218070', '浏阳市', '430181', 3, 'liuyangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1916, NULL, NULL, NULL, '2026-05-25 09:42:20.226069', '2026-05-25 09:42:20.226069', '宁乡市', '430182', 3, 'ningxiangshi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1917, NULL, NULL, NULL, '2026-05-25 09:42:20.234069', '2026-05-25 09:42:20.234069', '株洲市', '4302', 2, 'zhuzhoushi', 'Z', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1918, NULL, NULL, NULL, '2026-05-25 09:42:20.242179', '2026-05-25 09:42:20.242179', '荷塘区', '430202', 3, 'hetangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1919, NULL, NULL, NULL, '2026-05-25 09:42:20.250179', '2026-05-25 09:42:20.250179', '芦淞区', '430203', 3, 'lusongqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1920, NULL, NULL, NULL, '2026-05-25 09:42:20.258534', '2026-05-25 09:42:20.258534', '石峰区', '430204', 3, 'shifengqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1921, NULL, NULL, NULL, '2026-05-25 09:42:20.269509', '2026-05-25 09:42:20.269509', '天元区', '430211', 3, 'tianyuanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1922, NULL, NULL, NULL, '2026-05-25 09:42:20.280506', '2026-05-25 09:42:20.280506', '渌口区', '430212', 3, 'lukouqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1923, NULL, NULL, NULL, '2026-05-25 09:42:20.288507', '2026-05-25 09:42:20.288507', '攸县', '430223', 3, 'youxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1924, NULL, NULL, NULL, '2026-05-25 09:42:20.296508', '2026-05-25 09:42:20.296508', '茶陵县', '430224', 3, 'chalingxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1925, NULL, NULL, NULL, '2026-05-25 09:42:20.305510', '2026-05-25 09:42:20.305510', '炎陵县', '430225', 3, 'yanlingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1926, NULL, NULL, NULL, '2026-05-25 09:42:20.311506', '2026-05-25 09:42:20.311506', '云龙示范区', '430271', 3, 'yunlongshifanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1927, NULL, NULL, NULL, '2026-05-25 09:42:20.323509', '2026-05-25 09:42:20.323509', '醴陵市', '430281', 3, 'lilingshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1928, NULL, NULL, NULL, '2026-05-25 09:42:20.335509', '2026-05-25 09:42:20.335509', '湘潭市', '4303', 2, 'xiangtanshi', 'X', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1929, NULL, NULL, NULL, '2026-05-25 09:42:20.346510', '2026-05-25 09:42:20.346510', '雨湖区', '430302', 3, 'yuhuqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1930, NULL, NULL, NULL, '2026-05-25 09:42:20.358510', '2026-05-25 09:42:20.358510', '岳塘区', '430304', 3, 'yuetangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1931, NULL, NULL, NULL, '2026-05-25 09:42:20.369509', '2026-05-25 09:42:20.369509', '湘潭县', '430321', 3, 'xiangtanxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1932, NULL, NULL, NULL, '2026-05-25 09:42:20.381508', '2026-05-25 09:42:20.381508', '湖南湘潭高新技术产业园区', '430371', 3, 'hunanxiangtangaoxinjishuchanyeyuanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1933, NULL, NULL, NULL, '2026-05-25 09:42:20.392508', '2026-05-25 09:42:20.392508', '湘潭昭山示范区', '430372', 3, 'xiangtanzhaoshanshifanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1934, NULL, NULL, NULL, '2026-05-25 09:42:20.405508', '2026-05-25 09:42:20.405508', '湘潭九华示范区', '430373', 3, 'xiangtanjiuhuashifanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1935, NULL, NULL, NULL, '2026-05-25 09:42:20.416245', '2026-05-25 09:42:20.416245', '湘乡市', '430381', 3, 'xiangxiangshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1936, NULL, NULL, NULL, '2026-05-25 09:42:20.426230', '2026-05-25 09:42:20.426230', '韶山市', '430382', 3, 'shaoshanshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1937, NULL, NULL, NULL, '2026-05-25 09:42:20.437231', '2026-05-25 09:42:20.437231', '衡阳市', '4304', 2, 'hengyangshi', 'H', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1938, NULL, NULL, NULL, '2026-05-25 09:42:20.447232', '2026-05-25 09:42:20.447232', '珠晖区', '430405', 3, 'zhuhuiqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1939, NULL, NULL, NULL, '2026-05-25 09:42:20.457232', '2026-05-25 09:42:20.457232', '雁峰区', '430406', 3, 'yanfengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1940, NULL, NULL, NULL, '2026-05-25 09:42:20.465239', '2026-05-25 09:42:20.465239', '石鼓区', '430407', 3, 'shiguqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1941, NULL, NULL, NULL, '2026-05-25 09:42:20.474237', '2026-05-25 09:42:20.474237', '蒸湘区', '430408', 3, 'zhengxiangqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1942, NULL, NULL, NULL, '2026-05-25 09:42:20.483230', '2026-05-25 09:42:20.483230', '南岳区', '430412', 3, 'nanyuequ', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1943, NULL, NULL, NULL, '2026-05-25 09:42:20.492237', '2026-05-25 09:42:20.492237', '衡阳县', '430421', 3, 'hengyangxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1944, NULL, NULL, NULL, '2026-05-25 09:42:20.502144', '2026-05-25 09:42:20.502144', '衡南县', '430422', 3, 'hengnanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1945, NULL, NULL, NULL, '2026-05-25 09:42:20.510311', '2026-05-25 09:42:20.510311', '衡山县', '430423', 3, 'hengshanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1946, NULL, NULL, NULL, '2026-05-25 09:42:20.519326', '2026-05-25 09:42:20.519326', '衡东县', '430424', 3, 'hengdongxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1947, NULL, NULL, NULL, '2026-05-25 09:42:20.528320', '2026-05-25 09:42:20.528320', '祁东县', '430426', 3, 'qidongxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1948, NULL, NULL, NULL, '2026-05-25 09:42:20.537320', '2026-05-25 09:42:20.537320', '衡阳综合保税区', '430471', 3, 'hengyangzonghebaoshuiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1949, NULL, NULL, NULL, '2026-05-25 09:42:20.547557', '2026-05-25 09:42:20.547557', '湖南衡阳高新技术产业园区', '430472', 3, 'hunanhengyanggaoxinjishuchanyeyuanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1950, NULL, NULL, NULL, '2026-05-25 09:42:20.555605', '2026-05-25 09:42:20.556605', '湖南衡阳松木经济开发区', '430473', 3, 'hunanhengyangsongmujingjikaifaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1951, NULL, NULL, NULL, '2026-05-25 09:42:20.565016', '2026-05-25 09:42:20.565016', '耒阳市', '430481', 3, 'leiyangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1952, NULL, NULL, NULL, '2026-05-25 09:42:20.574009', '2026-05-25 09:42:20.575009', '常宁市', '430482', 3, 'changningshi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1953, NULL, NULL, NULL, '2026-05-25 09:42:20.582074', '2026-05-25 09:42:20.582074', '邵阳市', '4305', 2, 'shaoyangshi', 'S', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1954, NULL, NULL, NULL, '2026-05-25 09:42:20.593069', '2026-05-25 09:42:20.593069', '双清区', '430502', 3, 'shuangqingqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1955, NULL, NULL, NULL, '2026-05-25 09:42:20.603073', '2026-05-25 09:42:20.603073', '大祥区', '430503', 3, 'daxiangqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1956, NULL, NULL, NULL, '2026-05-25 09:42:20.611074', '2026-05-25 09:42:20.611074', '北塔区', '430511', 3, 'beitaqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1957, NULL, NULL, NULL, '2026-05-25 09:42:20.620073', '2026-05-25 09:42:20.620073', '新邵县', '430522', 3, 'xinshaoxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1958, NULL, NULL, NULL, '2026-05-25 09:42:20.628106', '2026-05-25 09:42:20.628106', '邵阳县', '430523', 3, 'shaoyangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1959, NULL, NULL, NULL, '2026-05-25 09:42:20.636159', '2026-05-25 09:42:20.636159', '隆回县', '430524', 3, 'longhuixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1960, NULL, NULL, NULL, '2026-05-25 09:42:20.644430', '2026-05-25 09:42:20.644430', '洞口县', '430525', 3, 'dongkouxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1961, NULL, NULL, NULL, '2026-05-25 09:42:20.651336', '2026-05-25 09:42:20.651336', '绥宁县', '430527', 3, 'suiningxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1962, NULL, NULL, NULL, '2026-05-25 09:42:20.659340', '2026-05-25 09:42:20.659340', '新宁县', '430528', 3, 'xinningxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1963, NULL, NULL, NULL, '2026-05-25 09:42:20.667340', '2026-05-25 09:42:20.667340', '城步苗族自治县', '430529', 3, 'chengbumiaozuzizhixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1964, NULL, NULL, NULL, '2026-05-25 09:42:20.676340', '2026-05-25 09:42:20.676340', '武冈市', '430581', 3, 'wugangshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1965, NULL, NULL, NULL, '2026-05-25 09:42:20.683340', '2026-05-25 09:42:20.683340', '邵东市', '430582', 3, 'shaodongshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1966, NULL, NULL, NULL, '2026-05-25 09:42:20.692488', '2026-05-25 09:42:20.692488', '岳阳市', '4306', 2, 'yueyangshi', 'Y', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1967, NULL, NULL, NULL, '2026-05-25 09:42:20.700804', '2026-05-25 09:42:20.700804', '岳阳楼区', '430602', 3, 'yueyanglouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1968, NULL, NULL, NULL, '2026-05-25 09:42:20.711095', '2026-05-25 09:42:20.711095', '云溪区', '430603', 3, 'yunxiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1969, NULL, NULL, NULL, '2026-05-25 09:42:20.719741', '2026-05-25 09:42:20.719741', '君山区', '430611', 3, 'junshanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1970, NULL, NULL, NULL, '2026-05-25 09:42:20.727742', '2026-05-25 09:42:20.727742', '岳阳县', '430621', 3, 'yueyangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1971, NULL, NULL, NULL, '2026-05-25 09:42:20.736743', '2026-05-25 09:42:20.736743', '华容县', '430623', 3, 'huarongxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1972, NULL, NULL, NULL, '2026-05-25 09:42:20.746046', '2026-05-25 09:42:20.746046', '湘阴县', '430624', 3, 'xiangyinxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1973, NULL, NULL, NULL, '2026-05-25 09:42:20.755347', '2026-05-25 09:42:20.755347', '平江县', '430626', 3, 'pingjiangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1974, NULL, NULL, NULL, '2026-05-25 09:42:20.765587', '2026-05-25 09:42:20.765587', '岳阳市屈原管理区', '430671', 3, 'yueyangshiquyuanguanliqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1975, NULL, NULL, NULL, '2026-05-25 09:42:20.774597', '2026-05-25 09:42:20.774597', '汨罗市', '430681', 3, 'miluoshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1976, NULL, NULL, NULL, '2026-05-25 09:42:20.783108', '2026-05-25 09:42:20.783108', '临湘市', '430682', 3, 'linxiangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1977, NULL, NULL, NULL, '2026-05-25 09:42:20.791109', '2026-05-25 09:42:20.791109', '常德市', '4307', 2, 'changdeshi', 'C', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1978, NULL, NULL, NULL, '2026-05-25 09:42:20.800898', '2026-05-25 09:42:20.800898', '武陵区', '430702', 3, 'wulingqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1979, NULL, NULL, NULL, '2026-05-25 09:42:20.808933', '2026-05-25 09:42:20.808933', '鼎城区', '430703', 3, 'dingchengqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1980, NULL, NULL, NULL, '2026-05-25 09:42:20.817935', '2026-05-25 09:42:20.817935', '安乡县', '430721', 3, 'anxiangxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1981, NULL, NULL, NULL, '2026-05-25 09:42:20.827332', '2026-05-25 09:42:20.827332', '汉寿县', '430722', 3, 'hanshouxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1982, NULL, NULL, NULL, '2026-05-25 09:42:20.836337', '2026-05-25 09:42:20.836337', '澧县', '430723', 3, 'lixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1983, NULL, NULL, NULL, '2026-05-25 09:42:20.845132', '2026-05-25 09:42:20.845132', '临澧县', '430724', 3, 'linlixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1984, NULL, NULL, NULL, '2026-05-25 09:42:20.855144', '2026-05-25 09:42:20.855144', '桃源县', '430725', 3, 'taoyuanxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1985, NULL, NULL, NULL, '2026-05-25 09:42:20.863139', '2026-05-25 09:42:20.863139', '石门县', '430726', 3, 'shimenxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1986, NULL, NULL, NULL, '2026-05-25 09:42:20.872139', '2026-05-25 09:42:20.872139', '常德市西洞庭管理区', '430771', 3, 'changdeshixidongtingguanliqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1987, NULL, NULL, NULL, '2026-05-25 09:42:20.884139', '2026-05-25 09:42:20.884139', '津市市', '430781', 3, 'jinshishi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1988, NULL, NULL, NULL, '2026-05-25 09:42:20.892140', '2026-05-25 09:42:20.892140', '张家界市', '4308', 2, 'zhangjiajieshi', 'Z', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1989, NULL, NULL, NULL, '2026-05-25 09:42:20.902132', '2026-05-25 09:42:20.902132', '永定区', '430802', 3, 'yongdingqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1990, NULL, NULL, NULL, '2026-05-25 09:42:20.912232', '2026-05-25 09:42:20.912232', '武陵源区', '430811', 3, 'wulingyuanqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1991, NULL, NULL, NULL, '2026-05-25 09:42:20.921992', '2026-05-25 09:42:20.921992', '慈利县', '430821', 3, 'cilixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1992, NULL, NULL, NULL, '2026-05-25 09:42:20.931861', '2026-05-25 09:42:20.931861', '桑植县', '430822', 3, 'sangzhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1993, NULL, NULL, NULL, '2026-05-25 09:42:20.942868', '2026-05-25 09:42:20.942868', '益阳市', '4309', 2, 'yiyangshi', 'Y', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (1994, NULL, NULL, NULL, '2026-05-25 09:42:20.951880', '2026-05-25 09:42:20.951880', '资阳区', '430902', 3, 'ziyangqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1995, NULL, NULL, NULL, '2026-05-25 09:42:20.960875', '2026-05-25 09:42:20.960875', '赫山区', '430903', 3, 'heshanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1996, NULL, NULL, NULL, '2026-05-25 09:42:20.969874', '2026-05-25 09:42:20.969874', '南县', '430921', 3, 'nanxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1997, NULL, NULL, NULL, '2026-05-25 09:42:20.977945', '2026-05-25 09:42:20.977945', '桃江县', '430922', 3, 'taojiangxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1998, NULL, NULL, NULL, '2026-05-25 09:42:20.986001', '2026-05-25 09:42:20.986001', '安化县', '430923', 3, 'anhuaxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (1999, NULL, NULL, NULL, '2026-05-25 09:42:20.995105', '2026-05-25 09:42:20.995105', '益阳市大通湖管理区', '430971', 3, 'yiyangshidatonghuguanliqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2000, NULL, NULL, NULL, '2026-05-25 09:42:21.003097', '2026-05-25 09:42:21.003097', '湖南益阳高新技术产业园区', '430972', 3, 'hunanyiyanggaoxinjishuchanyeyuanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2001, NULL, NULL, NULL, '2026-05-25 09:42:21.011097', '2026-05-25 09:42:21.011097', '沅江市', '430981', 3, 'yuanjiangshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2002, NULL, NULL, NULL, '2026-05-25 09:42:21.020103', '2026-05-25 09:42:21.020103', '郴州市', '4310', 2, 'chenzhoushi', 'C', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (2003, NULL, NULL, NULL, '2026-05-25 09:42:21.029103', '2026-05-25 09:42:21.029103', '北湖区', '431002', 3, 'beihuqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2004, NULL, NULL, NULL, '2026-05-25 09:42:21.036295', '2026-05-25 09:42:21.036295', '苏仙区', '431003', 3, 'suxianqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2005, NULL, NULL, NULL, '2026-05-25 09:42:21.044589', '2026-05-25 09:42:21.044589', '桂阳县', '431021', 3, 'guiyangxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2006, NULL, NULL, NULL, '2026-05-25 09:42:21.052900', '2026-05-25 09:42:21.052900', '宜章县', '431022', 3, 'yizhangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2007, NULL, NULL, NULL, '2026-05-25 09:42:21.062042', '2026-05-25 09:42:21.062042', '永兴县', '431023', 3, 'yongxingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2008, NULL, NULL, NULL, '2026-05-25 09:42:21.072741', '2026-05-25 09:42:21.072741', '嘉禾县', '431024', 3, 'jiahexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2009, NULL, NULL, NULL, '2026-05-25 09:42:21.081256', '2026-05-25 09:42:21.081256', '临武县', '431025', 3, 'linwuxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2010, NULL, NULL, NULL, '2026-05-25 09:42:21.090260', '2026-05-25 09:42:21.090260', '汝城县', '431026', 3, 'ruchengxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2011, NULL, NULL, NULL, '2026-05-25 09:42:21.098261', '2026-05-25 09:42:21.098261', '桂东县', '431027', 3, 'guidongxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2012, NULL, NULL, NULL, '2026-05-25 09:42:21.107260', '2026-05-25 09:42:21.107260', '安仁县', '431028', 3, 'anrenxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2013, NULL, NULL, NULL, '2026-05-25 09:42:21.115256', '2026-05-25 09:42:21.115256', '资兴市', '431081', 3, 'zixingshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2014, NULL, NULL, NULL, '2026-05-25 09:42:21.125255', '2026-05-25 09:42:21.125255', '永州市', '4311', 2, 'yongzhoushi', 'Y', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (2015, NULL, NULL, NULL, '2026-05-25 09:42:21.134715', '2026-05-25 09:42:21.134715', '零陵区', '431102', 3, 'linglingqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2016, NULL, NULL, NULL, '2026-05-25 09:42:21.143324', '2026-05-25 09:42:21.143324', '冷水滩区', '431103', 3, 'lengshuitanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2017, NULL, NULL, NULL, '2026-05-25 09:42:21.151321', '2026-05-25 09:42:21.151321', '祁阳县', '431121', 3, 'qiyangxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2018, NULL, NULL, NULL, '2026-05-25 09:42:21.159314', '2026-05-25 09:42:21.159314', '东安县', '431122', 3, 'donganxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2019, NULL, NULL, NULL, '2026-05-25 09:42:21.167321', '2026-05-25 09:42:21.167321', '双牌县', '431123', 3, 'shuangpaixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2020, NULL, NULL, NULL, '2026-05-25 09:42:21.175314', '2026-05-25 09:42:21.175314', '道县', '431124', 3, 'daoxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2021, NULL, NULL, NULL, '2026-05-25 09:42:21.184318', '2026-05-25 09:42:21.184318', '江永县', '431125', 3, 'jiangyongxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2022, NULL, NULL, NULL, '2026-05-25 09:42:21.192321', '2026-05-25 09:42:21.192321', '宁远县', '431126', 3, 'ningyuanxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2023, NULL, NULL, NULL, '2026-05-25 09:42:21.201321', '2026-05-25 09:42:21.201321', '蓝山县', '431127', 3, 'lanshanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2024, NULL, NULL, NULL, '2026-05-25 09:42:21.209320', '2026-05-25 09:42:21.209320', '新田县', '431128', 3, 'xintianxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2025, NULL, NULL, NULL, '2026-05-25 09:42:21.218317', '2026-05-25 09:42:21.218317', '江华瑶族自治县', '431129', 3, 'jianghuayaozuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2026, NULL, NULL, NULL, '2026-05-25 09:42:21.230279', '2026-05-25 09:42:21.230279', '永州经济技术开发区', '431171', 3, 'yongzhoujingjijishukaifaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2027, NULL, NULL, NULL, '2026-05-25 09:42:21.239286', '2026-05-25 09:42:21.239286', '永州市金洞管理区', '431172', 3, 'yongzhoushijindongguanliqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2028, NULL, NULL, NULL, '2026-05-25 09:42:21.248286', '2026-05-25 09:42:21.248286', '永州市回龙圩管理区', '431173', 3, 'yongzhoushihuilongweiguanliqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2029, NULL, NULL, NULL, '2026-05-25 09:42:21.256502', '2026-05-25 09:42:21.256502', '怀化市', '4312', 2, 'huaihuashi', 'H', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (2030, NULL, NULL, NULL, '2026-05-25 09:42:21.264599', '2026-05-25 09:42:21.264599', '鹤城区', '431202', 3, 'hechengqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2031, NULL, NULL, NULL, '2026-05-25 09:42:21.274714', '2026-05-25 09:42:21.274714', '中方县', '431221', 3, 'zhongfangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2032, NULL, NULL, NULL, '2026-05-25 09:42:21.282728', '2026-05-25 09:42:21.283743', '沅陵县', '431222', 3, 'yuanlingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2033, NULL, NULL, NULL, '2026-05-25 09:42:21.291742', '2026-05-25 09:42:21.291742', '辰溪县', '431223', 3, 'chenxixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2034, NULL, NULL, NULL, '2026-05-25 09:42:21.301198', '2026-05-25 09:42:21.301198', '溆浦县', '431224', 3, 'xupuxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2035, NULL, NULL, NULL, '2026-05-25 09:42:21.310198', '2026-05-25 09:42:21.310198', '会同县', '431225', 3, 'huitongxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2036, NULL, NULL, NULL, '2026-05-25 09:42:21.318198', '2026-05-25 09:42:21.318198', '麻阳苗族自治县', '431226', 3, 'mayangmiaozuzizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2037, NULL, NULL, NULL, '2026-05-25 09:42:21.327148', '2026-05-25 09:42:21.327148', '新晃侗族自治县', '431227', 3, 'xinhuangdongzuzizhixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2038, NULL, NULL, NULL, '2026-05-25 09:42:21.340180', '2026-05-25 09:42:21.340180', '芷江侗族自治县', '431228', 3, 'zhijiangdongzuzizhixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2039, NULL, NULL, NULL, '2026-05-25 09:42:21.349181', '2026-05-25 09:42:21.349181', '靖州苗族侗族自治县', '431229', 3, 'jingzhoumiaozudongzuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2040, NULL, NULL, NULL, '2026-05-25 09:42:21.357206', '2026-05-25 09:42:21.357206', '通道侗族自治县', '431230', 3, 'tongdaodongzuzizhixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2041, NULL, NULL, NULL, '2026-05-25 09:42:21.365206', '2026-05-25 09:42:21.365206', '怀化市洪江管理区', '431271', 3, 'huaihuashihongjiangguanliqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2042, NULL, NULL, NULL, '2026-05-25 09:42:21.373084', '2026-05-25 09:42:21.373084', '洪江市', '431281', 3, 'hongjiangshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2043, NULL, NULL, NULL, '2026-05-25 09:42:21.383106', '2026-05-25 09:42:21.383106', '娄底市', '4313', 2, 'loudishi', 'L', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (2044, NULL, NULL, NULL, '2026-05-25 09:42:21.394097', '2026-05-25 09:42:21.394097', '娄星区', '431302', 3, 'louxingqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2045, NULL, NULL, NULL, '2026-05-25 09:42:21.401103', '2026-05-25 09:42:21.401103', '双峰县', '431321', 3, 'shuangfengxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2046, NULL, NULL, NULL, '2026-05-25 09:42:21.411096', '2026-05-25 09:42:21.411096', '新化县', '431322', 3, 'xinhuaxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2047, NULL, NULL, NULL, '2026-05-25 09:42:21.419102', '2026-05-25 09:42:21.419102', '冷水江市', '431381', 3, 'lengshuijiangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2048, NULL, NULL, NULL, '2026-05-25 09:42:21.427103', '2026-05-25 09:42:21.427103', '涟源市', '431382', 3, 'lianyuanshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2049, NULL, NULL, NULL, '2026-05-25 09:42:21.437112', '2026-05-25 09:42:21.438098', '湘西土家族苗族自治州', '4331', 2, 'xiangxitujiazumiaozuzizhizhou', 'X', 1, NULL, '130108');
INSERT INTO `dvadmin_system_area` VALUES (2050, NULL, NULL, NULL, '2026-05-25 09:42:21.446103', '2026-05-25 09:42:21.446103', '吉首市', '433101', 3, 'jishoushi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2051, NULL, NULL, NULL, '2026-05-25 09:42:21.455339', '2026-05-25 09:42:21.455339', '泸溪县', '433122', 3, 'luxixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2052, NULL, NULL, NULL, '2026-05-25 09:42:21.464258', '2026-05-25 09:42:21.464258', '凤凰县', '433123', 3, 'fenghuangxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2053, NULL, NULL, NULL, '2026-05-25 09:42:21.472280', '2026-05-25 09:42:21.472280', '花垣县', '433124', 3, 'huayuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2054, NULL, NULL, NULL, '2026-05-25 09:42:21.480278', '2026-05-25 09:42:21.480278', '保靖县', '433125', 3, 'baojingxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2055, NULL, NULL, NULL, '2026-05-25 09:42:21.489062', '2026-05-25 09:42:21.489062', '古丈县', '433126', 3, 'guzhangxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2056, NULL, NULL, NULL, '2026-05-25 09:42:21.496375', '2026-05-25 09:42:21.496375', '永顺县', '433127', 3, 'yongshunxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2057, NULL, NULL, NULL, '2026-05-25 09:42:21.505370', '2026-05-25 09:42:21.505370', '龙山县', '433130', 3, 'longshanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2058, NULL, NULL, NULL, '2026-05-25 09:42:21.513124', '2026-04-03 10:10:05.037000', '广东省', '44', 1, 'guangdongsheng', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2059, NULL, NULL, NULL, '2026-05-25 09:42:21.522229', '2026-05-25 09:42:21.522229', '广州市', '4401', 2, 'guangzhoushi', 'G', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2060, NULL, NULL, NULL, '2026-05-25 09:42:21.531444', '2026-05-25 09:42:21.531444', '荔湾区', '440103', 3, 'liwanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2061, NULL, NULL, NULL, '2026-05-25 09:42:21.541441', '2026-05-25 09:42:21.541441', '越秀区', '440104', 3, 'yuexiuqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2062, NULL, NULL, NULL, '2026-05-25 09:42:21.548488', '2026-05-25 09:42:21.548488', '海珠区', '440105', 3, 'haizhuqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2063, NULL, NULL, NULL, '2026-05-25 09:42:21.557018', '2026-05-25 09:42:21.557018', '天河区', '440106', 3, 'tianhequ', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2064, NULL, NULL, NULL, '2026-05-25 09:42:21.565333', '2026-05-25 09:42:21.565333', '白云区', '440111', 3, 'baiyunqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2065, NULL, NULL, NULL, '2026-05-25 09:42:21.573476', '2026-05-25 09:42:21.573476', '黄埔区', '440112', 3, 'huangpuqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2066, NULL, NULL, NULL, '2026-05-25 09:42:21.581187', '2026-05-25 09:42:21.581187', '番禺区', '440113', 3, 'panyuqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2067, NULL, NULL, NULL, '2026-05-25 09:42:21.592055', '2026-05-25 09:42:21.592055', '花都区', '440114', 3, 'huadouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2068, NULL, NULL, NULL, '2026-05-25 09:42:21.601324', '2026-05-25 09:42:21.601324', '南沙区', '440115', 3, 'nanshaqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2069, NULL, NULL, NULL, '2026-05-25 09:42:21.613048', '2026-05-25 09:42:21.613048', '从化区', '440117', 3, 'conghuaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2070, NULL, NULL, NULL, '2026-05-25 09:42:21.622049', '2026-05-25 09:42:21.622049', '增城区', '440118', 3, 'zengchengqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2071, NULL, NULL, NULL, '2026-05-25 09:42:21.633041', '2026-05-25 09:42:21.633041', '韶关市', '4402', 2, 'shaoguanshi', 'S', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2072, NULL, NULL, NULL, '2026-05-25 09:42:21.642041', '2026-05-25 09:42:21.642041', '武江区', '440203', 3, 'wujiangqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2073, NULL, NULL, NULL, '2026-05-25 09:42:21.651041', '2026-05-25 09:42:21.651041', '浈江区', '440204', 3, 'zhenjiangqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2074, NULL, NULL, NULL, '2026-05-25 09:42:21.660796', '2026-05-25 09:42:21.660796', '曲江区', '440205', 3, 'qujiangqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2075, NULL, NULL, NULL, '2026-05-25 09:42:21.671274', '2026-05-25 09:42:21.671274', '始兴县', '440222', 3, 'shixingxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2076, NULL, NULL, NULL, '2026-05-25 09:42:21.679273', '2026-05-25 09:42:21.679273', '仁化县', '440224', 3, 'renhuaxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2077, NULL, NULL, NULL, '2026-05-25 09:42:21.688273', '2026-05-25 09:42:21.688273', '翁源县', '440229', 3, 'wengyuanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2078, NULL, NULL, NULL, '2026-05-25 09:42:21.696274', '2026-05-25 09:42:21.696274', '乳源瑶族自治县', '440232', 3, 'ruyuanyaozuzizhixian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2079, NULL, NULL, NULL, '2026-05-25 09:42:21.712674', '2026-05-25 09:42:21.712674', '新丰县', '440233', 3, 'xinfengxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2080, NULL, NULL, NULL, '2026-05-25 09:42:21.727072', '2026-05-25 09:42:21.727072', '乐昌市', '440281', 3, 'lechangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2081, NULL, NULL, NULL, '2026-05-25 09:42:21.736085', '2026-05-25 09:42:21.736085', '南雄市', '440282', 3, 'nanxiongshi', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2082, NULL, NULL, NULL, '2026-05-25 09:42:21.747079', '2026-05-25 09:42:21.747079', '深圳市', '4403', 2, 'shenzhenshi', 'S', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2083, NULL, NULL, NULL, '2026-05-25 09:42:21.759085', '2026-05-25 09:42:21.759085', '罗湖区', '440303', 3, 'luohuqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2084, NULL, NULL, NULL, '2026-05-25 09:42:21.766085', '2026-05-25 09:42:21.766085', '福田区', '440304', 3, 'futianqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2085, NULL, NULL, NULL, '2026-05-25 09:42:21.774086', '2026-05-25 09:42:21.774086', '南山区', '440305', 3, 'nanshanqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2086, NULL, NULL, NULL, '2026-05-25 09:42:21.783078', '2026-05-25 09:42:21.783078', '宝安区', '440306', 3, 'baoanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2087, NULL, NULL, NULL, '2026-05-25 09:42:21.791085', '2026-05-25 09:42:21.791085', '龙岗区', '440307', 3, 'longgangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2088, NULL, NULL, NULL, '2026-05-25 09:42:21.800085', '2026-05-25 09:42:21.800085', '盐田区', '440308', 3, 'yantianqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2089, NULL, NULL, NULL, '2026-05-25 09:42:21.808684', '2026-05-25 09:42:21.808684', '龙华区', '440309', 3, 'longhuaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2090, NULL, NULL, NULL, '2026-05-25 09:42:21.817008', '2026-05-25 09:42:21.817008', '坪山区', '440310', 3, 'pingshanqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2091, NULL, NULL, NULL, '2026-05-25 09:42:21.828008', '2026-05-25 09:42:21.828008', '光明区', '440311', 3, 'guangmingqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2092, NULL, NULL, NULL, '2026-05-25 09:42:21.836009', '2026-05-25 09:42:21.836009', '珠海市', '4404', 2, 'zhuhaishi', 'Z', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2093, NULL, NULL, NULL, '2026-05-25 09:42:21.845642', '2026-05-25 09:42:21.845642', '香洲区', '440402', 3, 'xiangzhouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2094, NULL, NULL, NULL, '2026-05-25 09:42:21.853229', '2026-05-25 09:42:21.853229', '斗门区', '440403', 3, 'doumenqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2095, NULL, NULL, NULL, '2026-05-25 09:42:21.866014', '2026-05-25 09:42:21.866014', '金湾区', '440404', 3, 'jinwanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2096, NULL, NULL, NULL, '2026-05-25 09:42:21.874033', '2026-05-25 09:42:21.874033', '汕头市', '4405', 2, 'shantoushi', 'S', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2097, NULL, NULL, NULL, '2026-05-25 09:42:21.884031', '2026-05-25 09:42:21.884031', '龙湖区', '440507', 3, 'longhuqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2098, NULL, NULL, NULL, '2026-05-25 09:42:21.893062', '2026-05-25 09:42:21.893062', '金平区', '440511', 3, 'jinpingqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2099, NULL, NULL, NULL, '2026-05-25 09:42:21.903408', '2026-05-25 09:42:21.903408', '濠江区', '440512', 3, 'haojiangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2100, NULL, NULL, NULL, '2026-05-25 09:42:21.916407', '2026-05-25 09:42:21.916407', '潮阳区', '440513', 3, 'chaoyangqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2101, NULL, NULL, NULL, '2026-05-25 09:42:21.924408', '2026-05-25 09:42:21.924408', '潮南区', '440514', 3, 'chaonanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2102, NULL, NULL, NULL, '2026-05-25 09:42:21.932401', '2026-05-25 09:42:21.932401', '澄海区', '440515', 3, 'chenghaiqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2103, NULL, NULL, NULL, '2026-05-25 09:42:21.940160', '2026-05-25 09:42:21.940160', '南澳县', '440523', 3, 'nanaoxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2104, NULL, NULL, NULL, '2026-05-25 09:42:21.955338', '2026-05-25 09:42:21.955338', '佛山市', '4406', 2, 'foshanshi', 'F', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2105, NULL, NULL, NULL, '2026-05-25 09:42:21.964880', '2026-05-25 09:42:21.964880', '禅城区', '440604', 3, 'chanchengqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2106, NULL, NULL, NULL, '2026-05-25 09:42:21.973304', '2026-05-25 09:42:21.973304', '南海区', '440605', 3, 'nanhaiqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2107, NULL, NULL, NULL, '2026-05-25 09:42:21.985305', '2026-05-25 09:42:21.985305', '顺德区', '440606', 3, 'shundequ', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2108, NULL, NULL, NULL, '2026-05-25 09:42:21.996303', '2026-05-25 09:42:21.996303', '三水区', '440607', 3, 'sanshuiqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2109, NULL, NULL, NULL, '2026-05-25 09:42:22.006373', '2026-05-25 09:42:22.006373', '高明区', '440608', 3, 'gaomingqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2110, NULL, NULL, NULL, '2026-05-25 09:42:22.014368', '2026-05-25 09:42:22.014368', '江门市', '4407', 2, 'jiangmenshi', 'J', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2111, NULL, NULL, NULL, '2026-05-25 09:42:22.024441', '2026-05-25 09:42:22.024441', '蓬江区', '440703', 3, 'pengjiangqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2112, NULL, NULL, NULL, '2026-05-25 09:42:22.032441', '2026-05-25 09:42:22.032441', '江海区', '440704', 3, 'jianghaiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2113, NULL, NULL, NULL, '2026-05-25 09:42:22.040457', '2026-05-25 09:42:22.040457', '新会区', '440705', 3, 'xinhuiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2114, NULL, NULL, NULL, '2026-05-25 09:42:22.047451', '2026-05-25 09:42:22.047451', '台山市', '440781', 3, 'taishanshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2115, NULL, NULL, NULL, '2026-05-25 09:42:22.056129', '2026-05-25 09:42:22.056129', '开平市', '440783', 3, 'kaipingshi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2116, NULL, NULL, NULL, '2026-05-25 09:42:22.065129', '2026-05-25 09:42:22.065129', '鹤山市', '440784', 3, 'heshanshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2117, NULL, NULL, NULL, '2026-05-25 09:42:22.072035', '2026-05-25 09:42:22.072035', '恩平市', '440785', 3, 'enpingshi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2118, NULL, NULL, NULL, '2026-05-25 09:42:22.081036', '2026-05-25 09:42:22.081036', '湛江市', '4408', 2, 'zhanjiangshi', 'Z', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2119, NULL, NULL, NULL, '2026-05-25 09:42:22.090098', '2026-05-25 09:42:22.090098', '赤坎区', '440802', 3, 'chikanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2120, NULL, NULL, NULL, '2026-05-25 09:42:22.099085', '2026-05-25 09:42:22.099085', '霞山区', '440803', 3, 'xiashanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2121, NULL, NULL, NULL, '2026-05-25 09:42:22.109505', '2026-05-25 09:42:22.109505', '坡头区', '440804', 3, 'potouqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2122, NULL, NULL, NULL, '2026-05-25 09:42:22.117853', '2026-05-25 09:42:22.117853', '麻章区', '440811', 3, 'mazhangqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2123, NULL, NULL, NULL, '2026-05-25 09:42:22.126858', '2026-05-25 09:42:22.126858', '遂溪县', '440823', 3, 'suixixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2124, NULL, NULL, NULL, '2026-05-25 09:42:22.135858', '2026-05-25 09:42:22.135858', '徐闻县', '440825', 3, 'xuwenxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2125, NULL, NULL, NULL, '2026-05-25 09:42:22.145859', '2026-05-25 09:42:22.145859', '廉江市', '440881', 3, 'lianjiangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2126, NULL, NULL, NULL, '2026-05-25 09:42:22.155859', '2026-05-25 09:42:22.155859', '雷州市', '440882', 3, 'leizhoushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2127, NULL, NULL, NULL, '2026-05-25 09:42:22.164859', '2026-05-25 09:42:22.164859', '吴川市', '440883', 3, 'wuchuanshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2128, NULL, NULL, NULL, '2026-05-25 09:42:22.173368', '2026-05-25 09:42:22.173368', '茂名市', '4409', 2, 'maomingshi', 'M', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2129, NULL, NULL, NULL, '2026-05-25 09:42:22.180369', '2026-05-25 09:42:22.180369', '茂南区', '440902', 3, 'maonanqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2130, NULL, NULL, NULL, '2026-05-25 09:42:22.189368', '2026-05-25 09:42:22.189368', '电白区', '440904', 3, 'dianbaiqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2131, NULL, NULL, NULL, '2026-05-25 09:42:22.196370', '2026-05-25 09:42:22.196370', '高州市', '440981', 3, 'gaozhoushi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2132, NULL, NULL, NULL, '2026-05-25 09:42:22.203369', '2026-05-25 09:42:22.203369', '化州市', '440982', 3, 'huazhoushi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2133, NULL, NULL, NULL, '2026-05-25 09:42:22.212369', '2026-05-25 09:42:22.212369', '信宜市', '440983', 3, 'xinyishi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2134, NULL, NULL, NULL, '2026-05-25 09:42:22.219369', '2026-05-25 09:42:22.219369', '肇庆市', '4412', 2, 'zhaoqingshi', 'Z', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2135, NULL, NULL, NULL, '2026-05-25 09:42:22.227369', '2026-05-25 09:42:22.227369', '端州区', '441202', 3, 'duanzhouqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2136, NULL, NULL, NULL, '2026-05-25 09:42:22.236369', '2026-05-25 09:42:22.236369', '鼎湖区', '441203', 3, 'dinghuqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2137, NULL, NULL, NULL, '2026-05-25 09:42:22.244930', '2026-05-25 09:42:22.244930', '高要区', '441204', 3, 'gaoyaoqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2138, NULL, NULL, NULL, '2026-05-25 09:42:22.252928', '2026-05-25 09:42:22.252928', '广宁县', '441223', 3, 'guangningxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2139, NULL, NULL, NULL, '2026-05-25 09:42:22.260987', '2026-05-25 09:42:22.260987', '怀集县', '441224', 3, 'huaijixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2140, NULL, NULL, NULL, '2026-05-25 09:42:22.267486', '2026-05-25 09:42:22.267486', '封开县', '441225', 3, 'fengkaixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2141, NULL, NULL, NULL, '2026-05-25 09:42:22.275492', '2026-05-25 09:42:22.275492', '德庆县', '441226', 3, 'deqingxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2142, NULL, NULL, NULL, '2026-05-25 09:42:22.281875', '2026-05-25 09:42:22.281875', '四会市', '441284', 3, 'sihuishi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2143, NULL, NULL, NULL, '2026-05-25 09:42:22.290053', '2026-05-25 09:42:22.290053', '惠州市', '4413', 2, 'huizhoushi', 'H', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2144, NULL, NULL, NULL, '2026-05-25 09:42:22.298091', '2026-05-25 09:42:22.298091', '惠城区', '441302', 3, 'huichengqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2145, NULL, NULL, NULL, '2026-05-25 09:42:22.306975', '2026-05-25 09:42:22.306975', '惠阳区', '441303', 3, 'huiyangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2146, NULL, NULL, NULL, '2026-05-25 09:42:22.317182', '2026-05-25 09:42:22.317182', '博罗县', '441322', 3, 'boluoxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2147, NULL, NULL, NULL, '2026-05-25 09:42:22.327182', '2026-05-25 09:42:22.327182', '惠东县', '441323', 3, 'huidongxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2148, NULL, NULL, NULL, '2026-05-25 09:42:22.335182', '2026-05-25 09:42:22.335182', '龙门县', '441324', 3, 'longmenxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2149, NULL, NULL, NULL, '2026-05-25 09:42:22.344182', '2026-05-25 09:42:22.344182', '梅州市', '4414', 2, 'meizhoushi', 'M', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2150, NULL, NULL, NULL, '2026-05-25 09:42:22.353181', '2026-05-25 09:42:22.353181', '梅江区', '441402', 3, 'meijiangqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2151, NULL, NULL, NULL, '2026-05-25 09:42:22.361998', '2026-05-25 09:42:22.361998', '梅县区', '441403', 3, 'meixianqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2152, NULL, NULL, NULL, '2026-05-25 09:42:22.370999', '2026-05-25 09:42:22.371994', '大埔县', '441422', 3, 'dabuxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2153, NULL, NULL, NULL, '2026-05-25 09:42:22.381999', '2026-05-25 09:42:22.381999', '丰顺县', '441423', 3, 'fengshunxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2154, NULL, NULL, NULL, '2026-05-25 09:42:22.389999', '2026-05-25 09:42:22.389999', '五华县', '441424', 3, 'wuhuaxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2155, NULL, NULL, NULL, '2026-05-25 09:42:22.398327', '2026-05-25 09:42:22.398327', '平远县', '441426', 3, 'pingyuanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2156, NULL, NULL, NULL, '2026-05-25 09:42:22.406327', '2026-05-25 09:42:22.406327', '蕉岭县', '441427', 3, 'jiaolingxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2157, NULL, NULL, NULL, '2026-05-25 09:42:22.414997', '2026-05-25 09:42:22.414997', '兴宁市', '441481', 3, 'xingningshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2158, NULL, NULL, NULL, '2026-05-25 09:42:22.422991', '2026-05-25 09:42:22.422991', '汕尾市', '4415', 2, 'shanweishi', 'S', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2159, NULL, NULL, NULL, '2026-05-25 09:42:22.432991', '2026-05-25 09:42:22.432991', '城区', '441502', 3, 'chengqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2160, NULL, NULL, NULL, '2026-05-25 09:42:22.443992', '2026-05-25 09:42:22.443992', '海丰县', '441521', 3, 'haifengxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2161, NULL, NULL, NULL, '2026-05-25 09:42:22.452988', '2026-05-25 09:42:22.452988', '陆河县', '441523', 3, 'luhexian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2162, NULL, NULL, NULL, '2026-05-25 09:42:22.462004', '2026-05-25 09:42:22.462004', '陆丰市', '441581', 3, 'lufengshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2163, NULL, NULL, NULL, '2026-05-25 09:42:22.473011', '2026-05-25 09:42:22.473011', '河源市', '4416', 2, 'heyuanshi', 'H', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2164, NULL, NULL, NULL, '2026-05-25 09:42:22.481010', '2026-05-25 09:42:22.481010', '源城区', '441602', 3, 'yuanchengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2165, NULL, NULL, NULL, '2026-05-25 09:42:22.489011', '2026-05-25 09:42:22.489011', '紫金县', '441621', 3, 'zijinxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2166, NULL, NULL, NULL, '2026-05-25 09:42:22.496423', '2026-05-25 09:42:22.496423', '龙川县', '441622', 3, 'longchuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2167, NULL, NULL, NULL, '2026-05-25 09:42:22.504700', '2026-05-25 09:42:22.504700', '连平县', '441623', 3, 'lianpingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2168, NULL, NULL, NULL, '2026-05-25 09:42:22.512699', '2026-05-25 09:42:22.512699', '和平县', '441624', 3, 'hepingxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2169, NULL, NULL, NULL, '2026-05-25 09:42:22.522071', '2026-05-25 09:42:22.522071', '东源县', '441625', 3, 'dongyuanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2170, NULL, NULL, NULL, '2026-05-25 09:42:22.531395', '2026-05-25 09:42:22.531395', '阳江市', '4417', 2, 'yangjiangshi', 'Y', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2171, NULL, NULL, NULL, '2026-05-25 09:42:22.539394', '2026-05-25 09:42:22.539394', '江城区', '441702', 3, 'jiangchengqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2172, NULL, NULL, NULL, '2026-05-25 09:42:22.550202', '2026-05-25 09:42:22.550202', '阳东区', '441704', 3, 'yangdongqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2173, NULL, NULL, NULL, '2026-05-25 09:42:22.558520', '2026-05-25 09:42:22.558520', '阳西县', '441721', 3, 'yangxixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2174, NULL, NULL, NULL, '2026-05-25 09:42:22.566511', '2026-05-25 09:42:22.566511', '阳春市', '441781', 3, 'yangchunshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2175, NULL, NULL, NULL, '2026-05-25 09:42:22.575080', '2026-05-25 09:42:22.575080', '清远市', '4418', 2, 'qingyuanshi', 'Q', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2176, NULL, NULL, NULL, '2026-05-25 09:42:22.583318', '2026-05-25 09:42:22.583318', '清城区', '441802', 3, 'qingchengqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2177, NULL, NULL, NULL, '2026-05-25 09:42:22.591330', '2026-05-25 09:42:22.591330', '清新区', '441803', 3, 'qingxinqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2178, NULL, NULL, NULL, '2026-05-25 09:42:22.602324', '2026-05-25 09:42:22.602324', '佛冈县', '441821', 3, 'fugangxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2179, NULL, NULL, NULL, '2026-05-25 09:42:22.612840', '2026-05-25 09:42:22.612840', '阳山县', '441823', 3, 'yangshanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2180, NULL, NULL, NULL, '2026-05-25 09:42:22.619883', '2026-05-25 09:42:22.619883', '连山壮族瑶族自治县', '441825', 3, 'lianshanzhuangzuyaozuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2181, NULL, NULL, NULL, '2026-05-25 09:42:22.627152', '2026-05-25 09:42:22.627152', '连南瑶族自治县', '441826', 3, 'liannanyaozuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2182, NULL, NULL, NULL, '2026-05-25 09:42:22.636159', '2026-05-25 09:42:22.636159', '英德市', '441881', 3, 'yingdeshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2183, NULL, NULL, NULL, '2026-05-25 09:42:22.642156', '2026-05-25 09:42:22.642156', '连州市', '441882', 3, 'lianzhoushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2184, NULL, NULL, NULL, '2026-05-25 09:42:22.652163', '2026-05-25 09:42:22.652163', '东莞市', '4419', 2, 'dongguanshi', 'D', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2185, NULL, NULL, NULL, '2026-05-25 09:42:22.659159', '2026-05-25 09:42:22.659159', '东城街道', '441900003', 3, 'dongchengjiedao', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2186, NULL, NULL, NULL, '2026-05-25 09:42:22.668368', '2026-05-25 09:42:22.668368', '南城街道', '441900004', 3, 'nanchengjiedao', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2187, NULL, NULL, NULL, '2026-05-25 09:42:22.677367', '2026-05-25 09:42:22.677367', '万江街道', '441900005', 3, 'wanjiangjiedao', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2188, NULL, NULL, NULL, '2026-05-25 09:42:22.686367', '2026-05-25 09:42:22.686367', '莞城街道', '441900006', 3, 'guanchengjiedao', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2189, NULL, NULL, NULL, '2026-05-25 09:42:22.694360', '2026-05-25 09:42:22.694360', '石碣镇', '441900101', 3, 'shijiezhen', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2190, NULL, NULL, NULL, '2026-05-25 09:42:22.703326', '2026-05-25 09:42:22.703326', '石龙镇', '441900102', 3, 'shilongzhen', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2191, NULL, NULL, NULL, '2026-05-25 09:42:22.710970', '2026-05-25 09:42:22.710970', '茶山镇', '441900103', 3, 'chashanzhen', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2192, NULL, NULL, NULL, '2026-05-25 09:42:22.719956', '2026-05-25 09:42:22.719956', '石排镇', '441900104', 3, 'shipaizhen', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2193, NULL, NULL, NULL, '2026-05-25 09:42:22.729051', '2026-05-25 09:42:22.729051', '企石镇', '441900105', 3, 'qishizhen', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2194, NULL, NULL, NULL, '2026-05-25 09:42:22.738059', '2026-05-25 09:42:22.738059', '横沥镇', '441900106', 3, 'henglizhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2195, NULL, NULL, NULL, '2026-05-25 09:42:22.747059', '2026-05-25 09:42:22.747059', '桥头镇', '441900107', 3, 'qiaotouzhen', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2196, NULL, NULL, NULL, '2026-05-25 09:42:22.755057', '2026-05-25 09:42:22.755057', '谢岗镇', '441900108', 3, 'xiegangzhen', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2197, NULL, NULL, NULL, '2026-05-25 09:42:22.763298', '2026-05-25 09:42:22.763298', '东坑镇', '441900109', 3, 'dongkengzhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2198, NULL, NULL, NULL, '2026-05-25 09:42:22.770297', '2026-05-25 09:42:22.770297', '常平镇', '441900110', 3, 'changpingzhen', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2199, NULL, NULL, NULL, '2026-05-25 09:42:22.778298', '2026-05-25 09:42:22.778298', '寮步镇', '441900111', 3, 'liaobuzhen', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2200, NULL, NULL, NULL, '2026-05-25 09:42:22.785297', '2026-05-25 09:42:22.785297', '樟木头镇', '441900112', 3, 'zhangmutouzhen', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2201, NULL, NULL, NULL, '2026-05-25 09:42:22.794298', '2026-05-25 09:42:22.794298', '大朗镇', '441900113', 3, 'dalangzhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2202, NULL, NULL, NULL, '2026-05-25 09:42:22.803297', '2026-05-25 09:42:22.803297', '黄江镇', '441900114', 3, 'huangjiangzhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2203, NULL, NULL, NULL, '2026-05-25 09:42:22.810375', '2026-05-25 09:42:22.810375', '清溪镇', '441900115', 3, 'qingxizhen', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2204, NULL, NULL, NULL, '2026-05-25 09:42:22.818418', '2026-05-25 09:42:22.818418', '塘厦镇', '441900116', 3, 'tangshazhen', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2205, NULL, NULL, NULL, '2026-05-25 09:42:22.826418', '2026-05-25 09:42:22.826418', '凤岗镇', '441900117', 3, 'fenggangzhen', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2206, NULL, NULL, NULL, '2026-05-25 09:42:22.834508', '2026-05-25 09:42:22.834508', '大岭山镇', '441900118', 3, 'dalingshanzhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2207, NULL, NULL, NULL, '2026-05-25 09:42:22.841521', '2026-05-25 09:42:22.841521', '长安镇', '441900119', 3, 'changanzhen', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2208, NULL, NULL, NULL, '2026-05-25 09:42:22.850521', '2026-05-25 09:42:22.850521', '虎门镇', '441900121', 3, 'humenzhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2209, NULL, NULL, NULL, '2026-05-25 09:42:22.857963', '2026-05-25 09:42:22.857963', '厚街镇', '441900122', 3, 'houjiezhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2210, NULL, NULL, NULL, '2026-05-25 09:42:22.865959', '2026-05-25 09:42:22.865959', '沙田镇', '441900123', 3, 'shatianzhen', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2211, NULL, NULL, NULL, '2026-05-25 09:42:22.875962', '2026-05-25 09:42:22.875962', '道滘镇', '441900124', 3, 'daojiaozhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2212, NULL, NULL, NULL, '2026-05-25 09:42:22.883954', '2026-05-25 09:42:22.883954', '洪梅镇', '441900125', 3, 'hongmeizhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2213, NULL, NULL, NULL, '2026-05-25 09:42:22.895959', '2026-05-25 09:42:22.895959', '麻涌镇', '441900126', 3, 'mayongzhen', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2214, NULL, NULL, NULL, '2026-05-25 09:42:22.904961', '2026-05-25 09:42:22.904961', '望牛墩镇', '441900127', 3, 'wangniudunzhen', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2215, NULL, NULL, NULL, '2026-05-25 09:42:22.914958', '2026-05-25 09:42:22.914958', '中堂镇', '441900128', 3, 'zhongtangzhen', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2216, NULL, NULL, NULL, '2026-05-25 09:42:22.923958', '2026-05-25 09:42:22.923958', '高埗镇', '441900129', 3, 'gaobuzhen', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2217, NULL, NULL, NULL, '2026-05-25 09:42:22.934960', '2026-05-25 09:42:22.934960', '松山湖', '441900401', 3, 'songshanhu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2218, NULL, NULL, NULL, '2026-05-25 09:42:22.947161', '2026-05-25 09:42:22.947161', '东莞港', '441900402', 3, 'dongguangang', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2219, NULL, NULL, NULL, '2026-05-25 09:42:22.957175', '2026-05-25 09:42:22.957175', '东莞生态园', '441900403', 3, 'dongguanshengtaiyuan', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2220, NULL, NULL, NULL, '2026-05-25 09:42:22.967177', '2026-05-25 09:42:22.967177', '中山市', '4420', 2, 'zhongshanshi', 'Z', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2221, NULL, NULL, NULL, '2026-05-25 09:42:22.980175', '2026-05-25 09:42:22.980175', '石岐街道', '442000001', 3, 'shiqijiedao', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2222, NULL, NULL, NULL, '2026-05-25 09:42:22.989171', '2026-05-25 09:42:22.989171', '东区街道', '442000002', 3, 'dongqujiedao', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2223, NULL, NULL, NULL, '2026-05-25 09:42:23.001169', '2026-05-25 09:42:23.001169', '中山港街道', '442000003', 3, 'zhongshangangjiedao', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2224, NULL, NULL, NULL, '2026-05-25 09:42:23.010169', '2026-05-25 09:42:23.010169', '西区街道', '442000004', 3, 'xiqujiedao', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2225, NULL, NULL, NULL, '2026-05-25 09:42:23.019167', '2026-05-25 09:42:23.019167', '南区街道', '442000005', 3, 'nanqujiedao', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2226, NULL, NULL, NULL, '2026-05-25 09:42:23.028174', '2026-05-25 09:42:23.028174', '五桂山街道', '442000006', 3, 'wuguishanjiedao', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2227, NULL, NULL, NULL, '2026-05-25 09:42:23.036174', '2026-05-25 09:42:23.036174', '小榄镇', '442000100', 3, 'xiaolanzhen', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2228, NULL, NULL, NULL, '2026-05-25 09:42:23.045174', '2026-05-25 09:42:23.045174', '黄圃镇', '442000101', 3, 'huangpuzhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2229, NULL, NULL, NULL, '2026-05-25 09:42:23.055169', '2026-05-25 09:42:23.055169', '民众镇', '442000102', 3, 'minzhongzhen', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2230, NULL, NULL, NULL, '2026-05-25 09:42:23.064174', '2026-05-25 09:42:23.064174', '东凤镇', '442000103', 3, 'dongfengzhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2231, NULL, NULL, NULL, '2026-05-25 09:42:23.072174', '2026-05-25 09:42:23.072174', '东升镇', '442000104', 3, 'dongshengzhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2232, NULL, NULL, NULL, '2026-05-25 09:42:23.082174', '2026-05-25 09:42:23.082174', '古镇镇', '442000105', 3, 'guzhenzhen', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2233, NULL, NULL, NULL, '2026-05-25 09:42:23.090174', '2026-05-25 09:42:23.090174', '沙溪镇', '442000106', 3, 'shaxizhen', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2234, NULL, NULL, NULL, '2026-05-25 09:42:23.098179', '2026-05-25 09:42:23.098179', '坦洲镇', '442000107', 3, 'tanzhouzhen', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2235, NULL, NULL, NULL, '2026-05-25 09:42:23.106173', '2026-05-25 09:42:23.106173', '港口镇', '442000108', 3, 'gangkouzhen', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2236, NULL, NULL, NULL, '2026-05-25 09:42:23.114173', '2026-05-25 09:42:23.114173', '三角镇', '442000109', 3, 'sanjiaozhen', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2237, NULL, NULL, NULL, '2026-05-25 09:42:23.122173', '2026-05-25 09:42:23.122173', '横栏镇', '442000110', 3, 'henglanzhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2238, NULL, NULL, NULL, '2026-05-25 09:42:23.130174', '2026-05-25 09:42:23.130174', '南头镇', '442000111', 3, 'nantouzhen', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2239, NULL, NULL, NULL, '2026-05-25 09:42:23.138173', '2026-05-25 09:42:23.139174', '阜沙镇', '442000112', 3, 'fushazhen', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2240, NULL, NULL, NULL, '2026-05-25 09:42:23.148174', '2026-05-25 09:42:23.148174', '南朗镇', '442000113', 3, 'nanlangzhen', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2241, NULL, NULL, NULL, '2026-05-25 09:42:23.156174', '2026-05-25 09:42:23.156174', '三乡镇', '442000114', 3, 'sanxiangzhen', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2242, NULL, NULL, NULL, '2026-05-25 09:42:23.166007', '2026-05-25 09:42:23.166007', '板芙镇', '442000115', 3, 'banfuzhen', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2243, NULL, NULL, NULL, '2026-05-25 09:42:23.176020', '2026-05-25 09:42:23.176020', '大涌镇', '442000116', 3, 'dayongzhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2244, NULL, NULL, NULL, '2026-05-25 09:42:23.185021', '2026-05-25 09:42:23.185021', '神湾镇', '442000117', 3, 'shenwanzhen', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2245, NULL, NULL, NULL, '2026-05-25 09:42:23.194021', '2026-05-25 09:42:23.194021', '潮州市', '4451', 2, 'chaozhoushi', 'C', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2246, NULL, NULL, NULL, '2026-05-25 09:42:23.204021', '2026-05-25 09:42:23.204021', '湘桥区', '445102', 3, 'xiangqiaoqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2247, NULL, NULL, NULL, '2026-05-25 09:42:23.213021', '2026-05-25 09:42:23.213021', '潮安区', '445103', 3, 'chaoanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2248, NULL, NULL, NULL, '2026-05-25 09:42:23.224021', '2026-05-25 09:42:23.224021', '饶平县', '445122', 3, 'raopingxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2249, NULL, NULL, NULL, '2026-05-25 09:42:23.231021', '2026-05-25 09:42:23.231021', '揭阳市', '4452', 2, 'jieyangshi', 'J', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2250, NULL, NULL, NULL, '2026-05-25 09:42:23.241021', '2026-05-25 09:42:23.241021', '榕城区', '445202', 3, 'rongchengqu', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2251, NULL, NULL, NULL, '2026-05-25 09:42:23.250021', '2026-05-25 09:42:23.250021', '揭东区', '445203', 3, 'jiedongqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2252, NULL, NULL, NULL, '2026-05-25 09:42:23.258021', '2026-05-25 09:42:23.258021', '揭西县', '445222', 3, 'jiexixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2253, NULL, NULL, NULL, '2026-05-25 09:42:23.267021', '2026-05-25 09:42:23.267021', '惠来县', '445224', 3, 'huilaixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2254, NULL, NULL, NULL, '2026-05-25 09:42:23.276021', '2026-05-25 09:42:23.276021', '普宁市', '445281', 3, 'puningshi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2255, NULL, NULL, NULL, '2026-05-25 09:42:23.287021', '2026-05-25 09:42:23.287021', '云浮市', '4453', 2, 'yunfushi', 'Y', 1, NULL, '130109');
INSERT INTO `dvadmin_system_area` VALUES (2256, NULL, NULL, NULL, '2026-05-25 09:42:23.298242', '2026-05-25 09:42:23.298242', '云城区', '445302', 3, 'yunchengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2257, NULL, NULL, NULL, '2026-05-25 09:42:23.308243', '2026-05-25 09:42:23.308243', '云安区', '445303', 3, 'yunanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2258, NULL, NULL, NULL, '2026-05-25 09:42:23.316243', '2026-05-25 09:42:23.316243', '新兴县', '445321', 3, 'xinxingxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2259, NULL, NULL, NULL, '2026-05-25 09:42:23.324243', '2026-05-25 09:42:23.324243', '郁南县', '445322', 3, 'yunanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2260, NULL, NULL, NULL, '2026-05-25 09:42:23.333243', '2026-05-25 09:42:23.333243', '罗定市', '445381', 3, 'luodingshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2261, NULL, NULL, NULL, '2026-05-25 09:42:23.341243', '2026-04-03 10:10:05.041000', '广西壮族自治区', '45', 1, 'guangxizhuangzuzizhiqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2262, NULL, NULL, NULL, '2026-05-25 09:42:23.350242', '2026-05-25 09:42:23.350242', '南宁市', '4501', 2, 'nanningshi', 'N', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2263, NULL, NULL, NULL, '2026-05-25 09:42:23.359242', '2026-05-25 09:42:23.359242', '兴宁区', '450102', 3, 'xingningqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2264, NULL, NULL, NULL, '2026-05-25 09:42:23.366242', '2026-05-25 09:42:23.366242', '青秀区', '450103', 3, 'qingxiuqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2265, NULL, NULL, NULL, '2026-05-25 09:42:23.375237', '2026-05-25 09:42:23.375237', '江南区', '450105', 3, 'jiangnanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2266, NULL, NULL, NULL, '2026-05-25 09:42:23.384242', '2026-05-25 09:42:23.384242', '西乡塘区', '450107', 3, 'xixiangtangqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2267, NULL, NULL, NULL, '2026-05-25 09:42:23.396242', '2026-05-25 09:42:23.396242', '良庆区', '450108', 3, 'liangqingqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2268, NULL, NULL, NULL, '2026-05-25 09:42:23.404242', '2026-05-25 09:42:23.404242', '邕宁区', '450109', 3, 'yongningqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2269, NULL, NULL, NULL, '2026-05-25 09:42:23.413242', '2026-05-25 09:42:23.413242', '武鸣区', '450110', 3, 'wumingqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2270, NULL, NULL, NULL, '2026-05-25 09:42:23.421243', '2026-05-25 09:42:23.421243', '隆安县', '450123', 3, 'longanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2271, NULL, NULL, NULL, '2026-05-25 09:42:23.430242', '2026-05-25 09:42:23.430242', '马山县', '450124', 3, 'mashanxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2272, NULL, NULL, NULL, '2026-05-25 09:42:23.440243', '2026-05-25 09:42:23.440243', '上林县', '450125', 3, 'shanglinxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2273, NULL, NULL, NULL, '2026-05-25 09:42:23.447242', '2026-05-25 09:42:23.447242', '宾阳县', '450126', 3, 'binyangxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2274, NULL, NULL, NULL, '2026-05-25 09:42:23.458243', '2026-05-25 09:42:23.458243', '横县', '450127', 3, 'hengxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2275, NULL, NULL, NULL, '2026-05-25 09:42:23.466243', '2026-05-25 09:42:23.466243', '柳州市', '4502', 2, 'liuzhoushi', 'L', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2276, NULL, NULL, NULL, '2026-05-25 09:42:23.474242', '2026-05-25 09:42:23.474242', '城中区', '450202', 3, 'chengzhongqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2277, NULL, NULL, NULL, '2026-05-25 09:42:23.482243', '2026-05-25 09:42:23.482243', '鱼峰区', '450203', 3, 'yufengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2278, NULL, NULL, NULL, '2026-05-25 09:42:23.491242', '2026-05-25 09:42:23.491242', '柳南区', '450204', 3, 'liunanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2279, NULL, NULL, NULL, '2026-05-25 09:42:23.499243', '2026-05-25 09:42:23.499243', '柳北区', '450205', 3, 'liubeiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2280, NULL, NULL, NULL, '2026-05-25 09:42:23.507242', '2026-05-25 09:42:23.507242', '柳江区', '450206', 3, 'liujiangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2281, NULL, NULL, NULL, '2026-05-25 09:42:23.516243', '2026-05-25 09:42:23.516243', '柳城县', '450222', 3, 'liuchengxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2282, NULL, NULL, NULL, '2026-05-25 09:42:23.524242', '2026-05-25 09:42:23.524242', '鹿寨县', '450223', 3, 'luzhaixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2283, NULL, NULL, NULL, '2026-05-25 09:42:23.532242', '2026-05-25 09:42:23.532242', '融安县', '450224', 3, 'ronganxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2284, NULL, NULL, NULL, '2026-05-25 09:42:23.540242', '2026-05-25 09:42:23.540242', '融水苗族自治县', '450225', 3, 'rongshuimiaozuzizhixian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2285, NULL, NULL, NULL, '2026-05-25 09:42:23.549724', '2026-05-25 09:42:23.549724', '三江侗族自治县', '450226', 3, 'sanjiangdongzuzizhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2286, NULL, NULL, NULL, '2026-05-25 09:42:23.558518', '2026-05-25 09:42:23.558518', '桂林市', '4503', 2, 'guilinshi', 'G', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2287, NULL, NULL, NULL, '2026-05-25 09:42:23.566516', '2026-05-25 09:42:23.566516', '秀峰区', '450302', 3, 'xiufengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2288, NULL, NULL, NULL, '2026-05-25 09:42:23.576517', '2026-05-25 09:42:23.576517', '叠彩区', '450303', 3, 'diecaiqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2289, NULL, NULL, NULL, '2026-05-25 09:42:23.585518', '2026-05-25 09:42:23.585518', '象山区', '450304', 3, 'xiangshanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2290, NULL, NULL, NULL, '2026-05-25 09:42:23.594516', '2026-05-25 09:42:23.594516', '七星区', '450305', 3, 'qixingqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2291, NULL, NULL, NULL, '2026-05-25 09:42:23.605180', '2026-05-25 09:42:23.605180', '雁山区', '450311', 3, 'yanshanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2292, NULL, NULL, NULL, '2026-05-25 09:42:23.617140', '2026-05-25 09:42:23.617140', '临桂区', '450312', 3, 'linguiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2293, NULL, NULL, NULL, '2026-05-25 09:42:23.627140', '2026-05-25 09:42:23.627140', '阳朔县', '450321', 3, 'yangshuoxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2294, NULL, NULL, NULL, '2026-05-25 09:42:23.635084', '2026-05-25 09:42:23.635084', '灵川县', '450323', 3, 'lingchuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2295, NULL, NULL, NULL, '2026-05-25 09:42:23.644985', '2026-05-25 09:42:23.644985', '全州县', '450324', 3, 'quanzhouxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2296, NULL, NULL, NULL, '2026-05-25 09:42:23.654465', '2026-05-25 09:42:23.654465', '兴安县', '450325', 3, 'xinganxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2297, NULL, NULL, NULL, '2026-05-25 09:42:23.664029', '2026-05-25 09:42:23.664029', '永福县', '450326', 3, 'yongfuxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2298, NULL, NULL, NULL, '2026-05-25 09:42:23.672220', '2026-05-25 09:42:23.672220', '灌阳县', '450327', 3, 'guanyangxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2299, NULL, NULL, NULL, '2026-05-25 09:42:23.681220', '2026-05-25 09:42:23.681220', '龙胜各族自治县', '450328', 3, 'longshenggezuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2300, NULL, NULL, NULL, '2026-05-25 09:42:23.690219', '2026-05-25 09:42:23.691221', '资源县', '450329', 3, 'ziyuanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2301, NULL, NULL, NULL, '2026-05-25 09:42:23.699937', '2026-05-25 09:42:23.699937', '平乐县', '450330', 3, 'pinglexian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2302, NULL, NULL, NULL, '2026-05-25 09:42:23.709941', '2026-05-25 09:42:23.709941', '恭城瑶族自治县', '450332', 3, 'gongchengyaozuzizhixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2303, NULL, NULL, NULL, '2026-05-25 09:42:23.719785', '2026-05-25 09:42:23.719785', '荔浦市', '450381', 3, 'lipushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2304, NULL, NULL, NULL, '2026-05-25 09:42:23.727785', '2026-05-25 09:42:23.728784', '梧州市', '4504', 2, 'wuzhoushi', 'W', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2305, NULL, NULL, NULL, '2026-05-25 09:42:23.738547', '2026-05-25 09:42:23.738547', '万秀区', '450403', 3, 'wanxiuqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2306, NULL, NULL, NULL, '2026-05-25 09:42:23.746485', '2026-05-25 09:42:23.746485', '长洲区', '450405', 3, 'zhangzhouqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2307, NULL, NULL, NULL, '2026-05-25 09:42:23.754485', '2026-05-25 09:42:23.754485', '龙圩区', '450406', 3, 'longweiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2308, NULL, NULL, NULL, '2026-05-25 09:42:23.762486', '2026-05-25 09:42:23.762486', '苍梧县', '450421', 3, 'cangwuxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2309, NULL, NULL, NULL, '2026-05-25 09:42:23.770520', '2026-05-25 09:42:23.770520', '藤县', '450422', 3, 'tengxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2310, NULL, NULL, NULL, '2026-05-25 09:42:23.779520', '2026-05-25 09:42:23.779520', '蒙山县', '450423', 3, 'mengshanxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2311, NULL, NULL, NULL, '2026-05-25 09:42:23.788520', '2026-05-25 09:42:23.788520', '岑溪市', '450481', 3, 'cenxishi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2312, NULL, NULL, NULL, '2026-05-25 09:42:23.795520', '2026-05-25 09:42:23.795520', '北海市', '4505', 2, 'beihaishi', 'B', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2313, NULL, NULL, NULL, '2026-05-25 09:42:23.804540', '2026-05-25 09:42:23.804540', '海城区', '450502', 3, 'haichengqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2314, NULL, NULL, NULL, '2026-05-25 09:42:23.812541', '2026-05-25 09:42:23.812541', '银海区', '450503', 3, 'yinhaiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2315, NULL, NULL, NULL, '2026-05-25 09:42:23.820541', '2026-05-25 09:42:23.820541', '铁山港区', '450512', 3, 'tieshangangqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2316, NULL, NULL, NULL, '2026-05-25 09:42:23.829534', '2026-05-25 09:42:23.829534', '合浦县', '450521', 3, 'hepuxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2317, NULL, NULL, NULL, '2026-05-25 09:42:23.838540', '2026-05-25 09:42:23.838540', '防城港市', '4506', 2, 'fangchenggangshi', 'F', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2318, NULL, NULL, NULL, '2026-05-25 09:42:23.848540', '2026-05-25 09:42:23.848540', '港口区', '450602', 3, 'gangkouqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2319, NULL, NULL, NULL, '2026-05-25 09:42:23.856543', '2026-05-25 09:42:23.856543', '防城区', '450603', 3, 'fangchengqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2320, NULL, NULL, NULL, '2026-05-25 09:42:23.864542', '2026-05-25 09:42:23.864542', '上思县', '450621', 3, 'shangsixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2321, NULL, NULL, NULL, '2026-05-25 09:42:23.871536', '2026-05-25 09:42:23.871536', '东兴市', '450681', 3, 'dongxingshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2322, NULL, NULL, NULL, '2026-05-25 09:42:23.880541', '2026-05-25 09:42:23.880541', '钦州市', '4507', 2, 'qinzhoushi', 'Q', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2323, NULL, NULL, NULL, '2026-05-25 09:42:23.888553', '2026-05-25 09:42:23.888553', '钦南区', '450702', 3, 'qinnanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2324, NULL, NULL, NULL, '2026-05-25 09:42:23.895554', '2026-05-25 09:42:23.895554', '钦北区', '450703', 3, 'qinbeiqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2325, NULL, NULL, NULL, '2026-05-25 09:42:23.905729', '2026-05-25 09:42:23.905729', '灵山县', '450721', 3, 'lingshanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2326, NULL, NULL, NULL, '2026-05-25 09:42:23.912723', '2026-05-25 09:42:23.912723', '浦北县', '450722', 3, 'pubeixian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2327, NULL, NULL, NULL, '2026-05-25 09:42:23.920737', '2026-05-25 09:42:23.920737', '贵港市', '4508', 2, 'guigangshi', 'G', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2328, NULL, NULL, NULL, '2026-05-25 09:42:23.929737', '2026-05-25 09:42:23.929737', '港北区', '450802', 3, 'gangbeiqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2329, NULL, NULL, NULL, '2026-05-25 09:42:23.937294', '2026-05-25 09:42:23.937294', '港南区', '450803', 3, 'gangnanqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2330, NULL, NULL, NULL, '2026-05-25 09:42:23.946294', '2026-05-25 09:42:23.946294', '覃塘区', '450804', 3, 'tantangqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2331, NULL, NULL, NULL, '2026-05-25 09:42:23.955189', '2026-05-25 09:42:23.955189', '平南县', '450821', 3, 'pingnanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2332, NULL, NULL, NULL, '2026-05-25 09:42:23.962993', '2026-05-25 09:42:23.962993', '桂平市', '450881', 3, 'guipingshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2333, NULL, NULL, NULL, '2026-05-25 09:42:23.971991', '2026-05-25 09:42:23.971991', '玉林市', '4509', 2, 'yulinshi', 'Y', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2334, NULL, NULL, NULL, '2026-05-25 09:42:23.979992', '2026-05-25 09:42:23.979992', '玉州区', '450902', 3, 'yuzhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2335, NULL, NULL, NULL, '2026-05-25 09:42:23.990992', '2026-05-25 09:42:23.990992', '福绵区', '450903', 3, 'fumianqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2336, NULL, NULL, NULL, '2026-05-25 09:42:23.999991', '2026-05-25 09:42:23.999991', '容县', '450921', 3, 'rongxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2337, NULL, NULL, NULL, '2026-05-25 09:42:24.008991', '2026-05-25 09:42:24.008991', '陆川县', '450922', 3, 'luchuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2338, NULL, NULL, NULL, '2026-05-25 09:42:24.017992', '2026-05-25 09:42:24.017992', '博白县', '450923', 3, 'bobaixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2339, NULL, NULL, NULL, '2026-05-25 09:42:24.027093', '2026-05-25 09:42:24.027093', '兴业县', '450924', 3, 'xingyexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2340, NULL, NULL, NULL, '2026-05-25 09:42:24.035095', '2026-05-25 09:42:24.035095', '北流市', '450981', 3, 'beiliushi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2341, NULL, NULL, NULL, '2026-05-25 09:42:24.043347', '2026-05-25 09:42:24.043347', '百色市', '4510', 2, 'baiseshi', 'B', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2342, NULL, NULL, NULL, '2026-05-25 09:42:24.052035', '2026-05-25 09:42:24.052035', '右江区', '451002', 3, 'youjiangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2343, NULL, NULL, NULL, '2026-05-25 09:42:24.061033', '2026-05-25 09:42:24.061033', '田阳区', '451003', 3, 'tianyangqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2344, NULL, NULL, NULL, '2026-05-25 09:42:24.069032', '2026-05-25 09:42:24.069032', '田东县', '451022', 3, 'tiandongxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2345, NULL, NULL, NULL, '2026-05-25 09:42:24.079032', '2026-05-25 09:42:24.079032', '德保县', '451024', 3, 'debaoxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2346, NULL, NULL, NULL, '2026-05-25 09:42:24.087031', '2026-05-25 09:42:24.087031', '那坡县', '451026', 3, 'napoxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2347, NULL, NULL, NULL, '2026-05-25 09:42:24.096033', '2026-05-25 09:42:24.096033', '凌云县', '451027', 3, 'lingyunxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2348, NULL, NULL, NULL, '2026-05-25 09:42:24.104036', '2026-05-25 09:42:24.104036', '乐业县', '451028', 3, 'leyexian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2349, NULL, NULL, NULL, '2026-05-25 09:42:24.114448', '2026-05-25 09:42:24.114448', '田林县', '451029', 3, 'tianlinxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2350, NULL, NULL, NULL, '2026-05-25 09:42:24.122448', '2026-05-25 09:42:24.122448', '西林县', '451030', 3, 'xilinxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2351, NULL, NULL, NULL, '2026-05-25 09:42:24.129205', '2026-05-25 09:42:24.129205', '隆林各族自治县', '451031', 3, 'longlingezuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2352, NULL, NULL, NULL, '2026-05-25 09:42:24.137208', '2026-05-25 09:42:24.137208', '靖西市', '451081', 3, 'jingxishi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2353, NULL, NULL, NULL, '2026-05-25 09:42:24.147206', '2026-05-25 09:42:24.147206', '平果市', '451082', 3, 'pingguoshi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2354, NULL, NULL, NULL, '2026-05-25 09:42:24.155206', '2026-05-25 09:42:24.155206', '贺州市', '4511', 2, 'hezhoushi', 'H', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2355, NULL, NULL, NULL, '2026-05-25 09:42:24.170106', '2026-05-25 09:42:24.170106', '八步区', '451102', 3, 'babuqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2356, NULL, NULL, NULL, '2026-05-25 09:42:24.179107', '2026-05-25 09:42:24.179107', '平桂区', '451103', 3, 'pingguiqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2357, NULL, NULL, NULL, '2026-05-25 09:42:24.187106', '2026-05-25 09:42:24.187106', '昭平县', '451121', 3, 'zhaopingxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2358, NULL, NULL, NULL, '2026-05-25 09:42:24.196107', '2026-05-25 09:42:24.197106', '钟山县', '451122', 3, 'zhongshanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2359, NULL, NULL, NULL, '2026-05-25 09:42:24.206107', '2026-05-25 09:42:24.206107', '富川瑶族自治县', '451123', 3, 'fuchuanyaozuzizhixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2360, NULL, NULL, NULL, '2026-05-25 09:42:24.215047', '2026-05-25 09:42:24.215047', '河池市', '4512', 2, 'hechishi', 'H', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2361, NULL, NULL, NULL, '2026-05-25 09:42:24.224217', '2026-05-25 09:42:24.224217', '金城江区', '451202', 3, 'jinchengjiangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2362, NULL, NULL, NULL, '2026-05-25 09:42:24.232703', '2026-05-25 09:42:24.232703', '宜州区', '451203', 3, 'yizhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2363, NULL, NULL, NULL, '2026-05-25 09:42:24.239737', '2026-05-25 09:42:24.239737', '南丹县', '451221', 3, 'nandanxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2364, NULL, NULL, NULL, '2026-05-25 09:42:24.248155', '2026-05-25 09:42:24.248155', '天峨县', '451222', 3, 'tianexian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2365, NULL, NULL, NULL, '2026-05-25 09:42:24.257182', '2026-05-25 09:42:24.257182', '凤山县', '451223', 3, 'fengshanxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2366, NULL, NULL, NULL, '2026-05-25 09:42:24.265178', '2026-05-25 09:42:24.265178', '东兰县', '451224', 3, 'donglanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2367, NULL, NULL, NULL, '2026-05-25 09:42:24.274197', '2026-05-25 09:42:24.274197', '罗城仫佬族自治县', '451225', 3, 'luochengmulaozuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2368, NULL, NULL, NULL, '2026-05-25 09:42:24.285220', '2026-05-25 09:42:24.285220', '环江毛南族自治县', '451226', 3, 'huanjiangmaonanzuzizhixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2369, NULL, NULL, NULL, '2026-05-25 09:42:24.294610', '2026-05-25 09:42:24.294610', '巴马瑶族自治县', '451227', 3, 'bamayaozuzizhixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2370, NULL, NULL, NULL, '2026-05-25 09:42:24.302164', '2026-05-25 09:42:24.302164', '都安瑶族自治县', '451228', 3, 'douanyaozuzizhixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2371, NULL, NULL, NULL, '2026-05-25 09:42:24.311245', '2026-05-25 09:42:24.311245', '大化瑶族自治县', '451229', 3, 'dahuayaozuzizhixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2372, NULL, NULL, NULL, '2026-05-25 09:42:24.319947', '2026-05-25 09:42:24.319947', '来宾市', '4513', 2, 'laibinshi', 'L', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2373, NULL, NULL, NULL, '2026-05-25 09:42:24.327947', '2026-05-25 09:42:24.327947', '兴宾区', '451302', 3, 'xingbinqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2374, NULL, NULL, NULL, '2026-05-25 09:42:24.335947', '2026-05-25 09:42:24.335947', '忻城县', '451321', 3, 'xinchengxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2375, NULL, NULL, NULL, '2026-05-25 09:42:24.343993', '2026-05-25 09:42:24.343993', '象州县', '451322', 3, 'xiangzhouxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2376, NULL, NULL, NULL, '2026-05-25 09:42:24.354194', '2026-05-25 09:42:24.354194', '武宣县', '451323', 3, 'wuxuanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2377, NULL, NULL, NULL, '2026-05-25 09:42:24.363183', '2026-05-25 09:42:24.363183', '金秀瑶族自治县', '451324', 3, 'jinxiuyaozuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2378, NULL, NULL, NULL, '2026-05-25 09:42:24.372756', '2026-05-25 09:42:24.372756', '合山市', '451381', 3, 'heshanshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2379, NULL, NULL, NULL, '2026-05-25 09:42:24.381221', '2026-05-25 09:42:24.381221', '崇左市', '4514', 2, 'chongzuoshi', 'C', 1, NULL, '130110');
INSERT INTO `dvadmin_system_area` VALUES (2380, NULL, NULL, NULL, '2026-05-25 09:42:24.389221', '2026-05-25 09:42:24.389221', '江州区', '451402', 3, 'jiangzhouqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2381, NULL, NULL, NULL, '2026-05-25 09:42:24.396924', '2026-05-25 09:42:24.396924', '扶绥县', '451421', 3, 'fusuixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2382, NULL, NULL, NULL, '2026-05-25 09:42:24.405963', '2026-05-25 09:42:24.405963', '宁明县', '451422', 3, 'ningmingxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2383, NULL, NULL, NULL, '2026-05-25 09:42:24.414963', '2026-05-25 09:42:24.414963', '龙州县', '451423', 3, 'longzhouxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2384, NULL, NULL, NULL, '2026-05-25 09:42:24.427002', '2026-05-25 09:42:24.427002', '大新县', '451424', 3, 'daxinxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2385, NULL, NULL, NULL, '2026-05-25 09:42:24.436112', '2026-05-25 09:42:24.436112', '天等县', '451425', 3, 'tiandengxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2386, NULL, NULL, NULL, '2026-05-25 09:42:24.445112', '2026-05-25 09:42:24.445112', '凭祥市', '451481', 3, 'pingxiangshi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2387, NULL, NULL, NULL, '2026-05-25 09:42:24.451962', '2026-04-03 10:10:05.048000', '海南省', '46', 1, 'hainansheng', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2388, NULL, NULL, NULL, '2026-05-25 09:42:24.460346', '2026-05-25 09:42:24.460346', '海口市', '4601', 2, 'haikoushi', 'H', 1, NULL, '130111');
INSERT INTO `dvadmin_system_area` VALUES (2389, NULL, NULL, NULL, '2026-05-25 09:42:24.469184', '2026-05-25 09:42:24.469184', '秀英区', '460105', 3, 'xiuyingqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2390, NULL, NULL, NULL, '2026-05-25 09:42:24.477054', '2026-05-25 09:42:24.477054', '龙华区', '460106', 3, 'longhuaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2391, NULL, NULL, NULL, '2026-05-25 09:42:24.486071', '2026-05-25 09:42:24.486071', '琼山区', '460107', 3, 'qiongshanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2392, NULL, NULL, NULL, '2026-05-25 09:42:24.495463', '2026-05-25 09:42:24.495463', '美兰区', '460108', 3, 'meilanqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2393, NULL, NULL, NULL, '2026-05-25 09:42:24.504463', '2026-05-25 09:42:24.504463', '三亚市', '4602', 2, 'sanyashi', 'S', 1, NULL, '130111');
INSERT INTO `dvadmin_system_area` VALUES (2394, NULL, NULL, NULL, '2026-05-25 09:42:24.512921', '2026-05-25 09:42:24.512921', '海棠区', '460202', 3, 'haitangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2395, NULL, NULL, NULL, '2026-05-25 09:42:24.521327', '2026-05-25 09:42:24.521327', '吉阳区', '460203', 3, 'jiyangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2396, NULL, NULL, NULL, '2026-05-25 09:42:24.529328', '2026-05-25 09:42:24.529328', '天涯区', '460204', 3, 'tianyaqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2397, NULL, NULL, NULL, '2026-05-25 09:42:24.538328', '2026-05-25 09:42:24.538328', '崖州区', '460205', 3, 'yazhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2398, NULL, NULL, NULL, '2026-05-25 09:42:24.546000', '2026-05-25 09:42:24.546000', '三沙市', '4603', 2, 'sanshashi', 'S', 1, NULL, '130111');
INSERT INTO `dvadmin_system_area` VALUES (2399, NULL, NULL, NULL, '2026-05-25 09:42:24.554349', '2026-05-25 09:42:24.554349', '西沙群岛', '460321', 3, 'xishaqundao', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2400, NULL, NULL, NULL, '2026-05-25 09:42:24.564348', '2026-05-25 09:42:24.564348', '南沙群岛', '460322', 3, 'nanshaqundao', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2401, NULL, NULL, NULL, '2026-05-25 09:42:24.571981', '2026-05-25 09:42:24.571981', '中沙群岛的岛礁及其海域', '460323', 3, 'zhongshaqundaodedaojiaojiqihaiyu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2402, NULL, NULL, NULL, '2026-05-25 09:42:24.580980', '2026-05-25 09:42:24.580980', '儋州市', '4604', 2, 'danzhoushi', 'D', 1, NULL, '130111');
INSERT INTO `dvadmin_system_area` VALUES (2403, NULL, NULL, NULL, '2026-05-25 09:42:24.588273', '2026-05-25 09:42:24.588273', '那大镇', '460400100', 3, 'nadazhen', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2404, NULL, NULL, NULL, '2026-05-25 09:42:24.596662', '2026-05-25 09:42:24.596662', '和庆镇', '460400101', 3, 'heqingzhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2405, NULL, NULL, NULL, '2026-05-25 09:42:24.606879', '2026-05-25 09:42:24.606879', '南丰镇', '460400102', 3, 'nanfengzhen', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2406, NULL, NULL, NULL, '2026-05-25 09:42:24.618819', '2026-05-25 09:42:24.618819', '大成镇', '460400103', 3, 'dachengzhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2407, NULL, NULL, NULL, '2026-05-25 09:42:24.626818', '2026-05-25 09:42:24.626818', '雅星镇', '460400104', 3, 'yaxingzhen', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2408, NULL, NULL, NULL, '2026-05-25 09:42:24.635818', '2026-05-25 09:42:24.635818', '兰洋镇', '460400105', 3, 'lanyangzhen', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2409, NULL, NULL, NULL, '2026-05-25 09:42:24.643818', '2026-05-25 09:42:24.643818', '光村镇', '460400106', 3, 'guangcunzhen', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2410, NULL, NULL, NULL, '2026-05-25 09:42:24.651820', '2026-05-25 09:42:24.651820', '木棠镇', '460400107', 3, 'mutangzhen', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2411, NULL, NULL, NULL, '2026-05-25 09:42:24.659909', '2026-05-25 09:42:24.659909', '海头镇', '460400108', 3, 'haitouzhen', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2412, NULL, NULL, NULL, '2026-05-25 09:42:24.667777', '2026-05-25 09:42:24.667777', '峨蔓镇', '460400109', 3, 'emanzhen', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2413, NULL, NULL, NULL, '2026-05-25 09:42:24.676777', '2026-05-25 09:42:24.676777', '王五镇', '460400111', 3, 'wangwuzhen', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2414, NULL, NULL, NULL, '2026-05-25 09:42:24.684991', '2026-05-25 09:42:24.684991', '白马井镇', '460400112', 3, 'baimajingzhen', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2415, NULL, NULL, NULL, '2026-05-25 09:42:24.694326', '2026-05-25 09:42:24.694829', '中和镇', '460400113', 3, 'zhonghezhen', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2416, NULL, NULL, NULL, '2026-05-25 09:42:24.704838', '2026-05-25 09:42:24.704838', '排浦镇', '460400114', 3, 'paipuzhen', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2417, NULL, NULL, NULL, '2026-05-25 09:42:24.714630', '2026-05-25 09:42:24.714630', '东成镇', '460400115', 3, 'dongchengzhen', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2418, NULL, NULL, NULL, '2026-05-25 09:42:24.724631', '2026-05-25 09:42:24.724631', '新州镇', '460400116', 3, 'xinzhouzhen', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2419, NULL, NULL, NULL, '2026-05-25 09:42:24.736631', '2026-05-25 09:42:24.736631', '洋浦经济开发区', '460400499', 3, 'yangpujingjikaifaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2420, NULL, NULL, NULL, '2026-05-25 09:42:24.746670', '2026-05-25 09:42:24.746670', '华南热作学院', '460400500', 3, 'huananrezuoxueyuan', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2421, NULL, NULL, NULL, '2026-05-25 09:42:24.756175', '2026-05-25 09:42:24.756175', '省直辖县级行政区划', '4690', 2, 'shengzhixiaxianjixingzhengquhua', 'S', 1, NULL, '130111');
INSERT INTO `dvadmin_system_area` VALUES (2422, NULL, NULL, NULL, '2026-05-25 09:42:24.766182', '2026-05-25 09:42:24.766182', '五指山市', '469001', 3, 'wuzhishanshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2423, NULL, NULL, NULL, '2026-05-25 09:42:24.775029', '2026-05-25 09:42:24.775029', '琼海市', '469002', 3, 'qionghaishi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2424, NULL, NULL, NULL, '2026-05-25 09:42:24.784030', '2026-05-25 09:42:24.784030', '文昌市', '469005', 3, 'wenchangshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2425, NULL, NULL, NULL, '2026-05-25 09:42:24.791721', '2026-05-25 09:42:24.791721', '万宁市', '469006', 3, 'wanningshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2426, NULL, NULL, NULL, '2026-05-25 09:42:24.800763', '2026-05-25 09:42:24.801763', '东方市', '469007', 3, 'dongfangshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2427, NULL, NULL, NULL, '2026-05-25 09:42:24.808762', '2026-05-25 09:42:24.808762', '定安县', '469021', 3, 'dinganxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2428, NULL, NULL, NULL, '2026-05-25 09:42:24.818671', '2026-05-25 09:42:24.818671', '屯昌县', '469022', 3, 'tunchangxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2429, NULL, NULL, NULL, '2026-05-25 09:42:24.829671', '2026-05-25 09:42:24.829671', '澄迈县', '469023', 3, 'chengmaixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2430, NULL, NULL, NULL, '2026-05-25 09:42:24.837718', '2026-05-25 09:42:24.837718', '临高县', '469024', 3, 'lingaoxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2431, NULL, NULL, NULL, '2026-05-25 09:42:24.846712', '2026-05-25 09:42:24.846712', '白沙黎族自治县', '469025', 3, 'baishalizuzizhixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2432, NULL, NULL, NULL, '2026-05-25 09:42:24.856420', '2026-05-25 09:42:24.856420', '昌江黎族自治县', '469026', 3, 'changjianglizuzizhixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2433, NULL, NULL, NULL, '2026-05-25 09:42:24.865776', '2026-05-25 09:42:24.865776', '乐东黎族自治县', '469027', 3, 'ledonglizuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2434, NULL, NULL, NULL, '2026-05-25 09:42:24.878837', '2026-05-25 09:42:24.878837', '陵水黎族自治县', '469028', 3, 'lingshuilizuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2435, NULL, NULL, NULL, '2026-05-25 09:42:24.887836', '2026-05-25 09:42:24.887836', '保亭黎族苗族自治县', '469029', 3, 'baotinglizumiaozuzizhixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2436, NULL, NULL, NULL, '2026-05-25 09:42:24.897835', '2026-05-25 09:42:24.897835', '琼中黎族苗族自治县', '469030', 3, 'qiongzhonglizumiaozuzizhixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2437, NULL, NULL, NULL, '2026-05-25 09:42:24.907835', '2026-04-03 10:10:05.050000', '重庆市', '50', 1, 'chongqingshi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2438, NULL, NULL, NULL, '2026-05-25 09:42:24.916835', '2026-05-25 09:42:24.916835', '市辖区', '5001', 2, 'shixiaqu', 'S', 1, NULL, '130126');
INSERT INTO `dvadmin_system_area` VALUES (2439, NULL, NULL, NULL, '2026-05-25 09:42:24.924834', '2026-05-25 09:42:24.924834', '万州区', '500101', 3, 'wanzhouqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2440, NULL, NULL, NULL, '2026-05-25 09:42:24.934834', '2026-05-25 09:42:24.934834', '涪陵区', '500102', 3, 'fulingqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2441, NULL, NULL, NULL, '2026-05-25 09:42:24.942834', '2026-05-25 09:42:24.942834', '渝中区', '500103', 3, 'yuzhongqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2442, NULL, NULL, NULL, '2026-05-25 09:42:24.950836', '2026-05-25 09:42:24.950836', '大渡口区', '500104', 3, 'dadukouqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2443, NULL, NULL, NULL, '2026-05-25 09:42:24.960658', '2026-05-25 09:42:24.960658', '江北区', '500105', 3, 'jiangbeiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2444, NULL, NULL, NULL, '2026-05-25 09:42:24.969070', '2026-05-25 09:42:24.969070', '沙坪坝区', '500106', 3, 'shapingbaqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2445, NULL, NULL, NULL, '2026-05-25 09:42:24.978107', '2026-05-25 09:42:24.978107', '九龙坡区', '500107', 3, 'jiulongpoqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2446, NULL, NULL, NULL, '2026-05-25 09:42:24.987108', '2026-05-25 09:42:24.987108', '南岸区', '500108', 3, 'nananqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2447, NULL, NULL, NULL, '2026-05-25 09:42:24.995685', '2026-05-25 09:42:24.995685', '北碚区', '500109', 3, 'beibeiqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2448, NULL, NULL, NULL, '2026-05-25 09:42:25.003686', '2026-05-25 09:42:25.003686', '綦江区', '500110', 3, 'qijiangqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2449, NULL, NULL, NULL, '2026-05-25 09:42:25.012684', '2026-05-25 09:42:25.012684', '大足区', '500111', 3, 'dazuqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2450, NULL, NULL, NULL, '2026-05-25 09:42:25.021683', '2026-05-25 09:42:25.021683', '渝北区', '500112', 3, 'yubeiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2451, NULL, NULL, NULL, '2026-05-25 09:42:25.030684', '2026-05-25 09:42:25.031685', '巴南区', '500113', 3, 'bananqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2452, NULL, NULL, NULL, '2026-05-25 09:42:25.040685', '2026-05-25 09:42:25.040685', '黔江区', '500114', 3, 'qianjiangqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2453, NULL, NULL, NULL, '2026-05-25 09:42:25.048729', '2026-05-25 09:42:25.048729', '长寿区', '500115', 3, 'changshouqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2454, NULL, NULL, NULL, '2026-05-25 09:42:25.056783', '2026-05-25 09:42:25.056783', '江津区', '500116', 3, 'jiangjinqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2455, NULL, NULL, NULL, '2026-05-25 09:42:25.066783', '2026-05-25 09:42:25.066783', '合川区', '500117', 3, 'hechuanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2456, NULL, NULL, NULL, '2026-05-25 09:42:25.077212', '2026-05-25 09:42:25.077212', '永川区', '500118', 3, 'yongchuanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2457, NULL, NULL, NULL, '2026-05-25 09:42:25.086107', '2026-05-25 09:42:25.086107', '南川区', '500119', 3, 'nanchuanqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2458, NULL, NULL, NULL, '2026-05-25 09:42:25.094630', '2026-05-25 09:42:25.094630', '璧山区', '500120', 3, 'bishanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2459, NULL, NULL, NULL, '2026-05-25 09:42:25.103926', '2026-05-25 09:42:25.103926', '铜梁区', '500151', 3, 'tongliangqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2460, NULL, NULL, NULL, '2026-05-25 09:42:25.111926', '2026-05-25 09:42:25.111926', '潼南区', '500152', 3, 'tongnanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2461, NULL, NULL, NULL, '2026-05-25 09:42:25.121148', '2026-05-25 09:42:25.121148', '荣昌区', '500153', 3, 'rongchangqu', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2462, NULL, NULL, NULL, '2026-05-25 09:42:25.129253', '2026-05-25 09:42:25.129253', '开州区', '500154', 3, 'kaizhouqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2463, NULL, NULL, NULL, '2026-05-25 09:42:25.138252', '2026-05-25 09:42:25.138252', '梁平区', '500155', 3, 'liangpingqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2464, NULL, NULL, NULL, '2026-05-25 09:42:25.147025', '2026-05-25 09:42:25.147025', '武隆区', '500156', 3, 'wulongqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2465, NULL, NULL, NULL, '2026-05-25 09:42:25.155025', '2026-05-25 09:42:25.155025', '县', '5002', 2, 'xian', 'X', 1, NULL, '130126');
INSERT INTO `dvadmin_system_area` VALUES (2466, NULL, NULL, NULL, '2026-05-25 09:42:25.163703', '2026-05-25 09:42:25.163703', '城口县', '500229', 3, 'chengkouxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2467, NULL, NULL, NULL, '2026-05-25 09:42:25.172405', '2026-05-25 09:42:25.172405', '丰都县', '500230', 3, 'fengdouxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2468, NULL, NULL, NULL, '2026-05-25 09:42:25.180857', '2026-05-25 09:42:25.180857', '垫江县', '500231', 3, 'dianjiangxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2469, NULL, NULL, NULL, '2026-05-25 09:42:25.187204', '2026-05-25 09:42:25.187204', '忠县', '500233', 3, 'zhongxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2470, NULL, NULL, NULL, '2026-05-25 09:42:25.195430', '2026-05-25 09:42:25.195430', '云阳县', '500235', 3, 'yunyangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2471, NULL, NULL, NULL, '2026-05-25 09:42:25.204442', '2026-05-25 09:42:25.204442', '奉节县', '500236', 3, 'fengjiexian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2472, NULL, NULL, NULL, '2026-05-25 09:42:25.211522', '2026-05-25 09:42:25.211522', '巫山县', '500237', 3, 'wushanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2473, NULL, NULL, NULL, '2026-05-25 09:42:25.218450', '2026-05-25 09:42:25.218450', '巫溪县', '500238', 3, 'wuxixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2474, NULL, NULL, NULL, '2026-05-25 09:42:25.226713', '2026-05-25 09:42:25.226713', '石柱土家族自治县', '500240', 3, 'shizhutujiazuzizhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2475, NULL, NULL, NULL, '2026-05-25 09:42:25.236712', '2026-05-25 09:42:25.236712', '秀山土家族苗族自治县', '500241', 3, 'xiushantujiazumiaozuzizhixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2476, NULL, NULL, NULL, '2026-05-25 09:42:25.246712', '2026-05-25 09:42:25.246712', '酉阳土家族苗族自治县', '500242', 3, 'youyangtujiazumiaozuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2477, NULL, NULL, NULL, '2026-05-25 09:42:25.255713', '2026-05-25 09:42:25.255713', '彭水苗族土家族自治县', '500243', 3, 'pengshuimiaozutujiazuzizhixian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2478, NULL, NULL, NULL, '2026-05-25 09:42:25.264713', '2026-04-03 10:10:05.050000', '四川省', '51', 1, 'sichuansheng', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2479, NULL, NULL, NULL, '2026-05-25 09:42:25.273160', '2026-05-25 09:42:25.273160', '成都市', '5101', 2, 'chengdushi', 'C', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2480, NULL, NULL, NULL, '2026-05-25 09:42:25.281774', '2026-05-25 09:42:25.281774', '锦江区', '510104', 3, 'jinjiangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2481, NULL, NULL, NULL, '2026-05-25 09:42:25.289714', '2026-05-25 09:42:25.289714', '青羊区', '510105', 3, 'qingyangqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2482, NULL, NULL, NULL, '2026-05-25 09:42:25.297707', '2026-05-25 09:42:25.297707', '金牛区', '510106', 3, 'jinniuqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2483, NULL, NULL, NULL, '2026-05-25 09:42:25.304709', '2026-05-25 09:42:25.304709', '武侯区', '510107', 3, 'wuhouqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2484, NULL, NULL, NULL, '2026-05-25 09:42:25.312735', '2026-05-25 09:42:25.312735', '成华区', '510108', 3, 'chenghuaqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2485, NULL, NULL, NULL, '2026-05-25 09:42:25.321076', '2026-05-25 09:42:25.321076', '龙泉驿区', '510112', 3, 'longquanyiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2486, NULL, NULL, NULL, '2026-05-25 09:42:25.330010', '2026-05-25 09:42:25.330010', '青白江区', '510113', 3, 'qingbaijiangqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2487, NULL, NULL, NULL, '2026-05-25 09:42:25.338265', '2026-05-25 09:42:25.338265', '新都区', '510114', 3, 'xindouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2488, NULL, NULL, NULL, '2026-05-25 09:42:25.345327', '2026-05-25 09:42:25.345327', '温江区', '510115', 3, 'wenjiangqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2489, NULL, NULL, NULL, '2026-05-25 09:42:25.353325', '2026-05-25 09:42:25.353325', '双流区', '510116', 3, 'shuangliuqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2490, NULL, NULL, NULL, '2026-05-25 09:42:25.361124', '2026-05-25 09:42:25.361124', '郫都区', '510117', 3, 'pidouqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2491, NULL, NULL, NULL, '2026-05-25 09:42:25.370124', '2026-05-25 09:42:25.370124', '新津区', '510118', 3, 'xinjinqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2492, NULL, NULL, NULL, '2026-05-25 09:42:25.377137', '2026-05-25 09:42:25.377137', '金堂县', '510121', 3, 'jintangxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2493, NULL, NULL, NULL, '2026-05-25 09:42:25.386136', '2026-05-25 09:42:25.386136', '大邑县', '510129', 3, 'dayixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2494, NULL, NULL, NULL, '2026-05-25 09:42:25.393076', '2026-05-25 09:42:25.393076', '蒲江县', '510131', 3, 'pujiangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2495, NULL, NULL, NULL, '2026-05-25 09:42:25.402076', '2026-05-25 09:42:25.402076', '都江堰市', '510181', 3, 'dujiangyanshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2496, NULL, NULL, NULL, '2026-05-25 09:42:25.409660', '2026-05-25 09:42:25.409660', '彭州市', '510182', 3, 'pengzhoushi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2497, NULL, NULL, NULL, '2026-05-25 09:42:25.417708', '2026-05-25 09:42:25.417708', '邛崃市', '510183', 3, 'qionglaishi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2498, NULL, NULL, NULL, '2026-05-25 09:42:25.424602', '2026-05-25 09:42:25.424602', '崇州市', '510184', 3, 'chongzhoushi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2499, NULL, NULL, NULL, '2026-05-25 09:42:25.432602', '2026-05-25 09:42:25.432602', '简阳市', '510185', 3, 'jianyangshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2500, NULL, NULL, NULL, '2026-05-25 09:42:25.440622', '2026-05-25 09:42:25.440622', '自贡市', '5103', 2, 'zigongshi', 'Z', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2501, NULL, NULL, NULL, '2026-05-25 09:42:25.448622', '2026-05-25 09:42:25.448622', '自流井区', '510302', 3, 'ziliujingqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2502, NULL, NULL, NULL, '2026-05-25 09:42:25.457641', '2026-05-25 09:42:25.457641', '贡井区', '510303', 3, 'gongjingqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2503, NULL, NULL, NULL, '2026-05-25 09:42:25.466863', '2026-05-25 09:42:25.466863', '大安区', '510304', 3, 'daanqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2504, NULL, NULL, NULL, '2026-05-25 09:42:25.476863', '2026-05-25 09:42:25.476863', '沿滩区', '510311', 3, 'yantanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2505, NULL, NULL, NULL, '2026-05-25 09:42:25.484862', '2026-05-25 09:42:25.484862', '荣县', '510321', 3, 'rongxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2506, NULL, NULL, NULL, '2026-05-25 09:42:25.495200', '2026-05-25 09:42:25.495200', '富顺县', '510322', 3, 'fushunxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2507, NULL, NULL, NULL, '2026-05-25 09:42:25.504441', '2026-05-25 09:42:25.504441', '攀枝花市', '5104', 2, 'panzhihuashi', 'P', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2508, NULL, NULL, NULL, '2026-05-25 09:42:25.511448', '2026-05-25 09:42:25.511448', '东区', '510402', 3, 'dongqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2509, NULL, NULL, NULL, '2026-05-25 09:42:25.519596', '2026-05-25 09:42:25.519596', '西区', '510403', 3, 'xiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2510, NULL, NULL, NULL, '2026-05-25 09:42:25.527600', '2026-05-25 09:42:25.527600', '仁和区', '510411', 3, 'renhequ', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2511, NULL, NULL, NULL, '2026-05-25 09:42:25.535600', '2026-05-25 09:42:25.535600', '米易县', '510421', 3, 'miyixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2512, NULL, NULL, NULL, '2026-05-25 09:42:25.545014', '2026-05-25 09:42:25.545014', '盐边县', '510422', 3, 'yanbianxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2513, NULL, NULL, NULL, '2026-05-25 09:42:25.554019', '2026-05-25 09:42:25.554019', '泸州市', '5105', 2, 'luzhoushi', 'L', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2514, NULL, NULL, NULL, '2026-05-25 09:42:25.563205', '2026-05-25 09:42:25.563205', '江阳区', '510502', 3, 'jiangyangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2515, NULL, NULL, NULL, '2026-05-25 09:42:25.571922', '2026-05-25 09:42:25.571922', '纳溪区', '510503', 3, 'naxiqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2516, NULL, NULL, NULL, '2026-05-25 09:42:25.578921', '2026-05-25 09:42:25.578921', '龙马潭区', '510504', 3, 'longmatanqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2517, NULL, NULL, NULL, '2026-05-25 09:42:25.588940', '2026-05-25 09:42:25.588940', '泸县', '510521', 3, 'luxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2518, NULL, NULL, NULL, '2026-05-25 09:42:25.597347', '2026-05-25 09:42:25.597347', '合江县', '510522', 3, 'hejiangxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2519, NULL, NULL, NULL, '2026-05-25 09:42:25.605656', '2026-05-25 09:42:25.605656', '叙永县', '510524', 3, 'xuyongxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2520, NULL, NULL, NULL, '2026-05-25 09:42:25.613508', '2026-05-25 09:42:25.613508', '古蔺县', '510525', 3, 'gulinxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2521, NULL, NULL, NULL, '2026-05-25 09:42:25.624510', '2026-05-25 09:42:25.624510', '德阳市', '5106', 2, 'deyangshi', 'D', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2522, NULL, NULL, NULL, '2026-05-25 09:42:25.633608', '2026-05-25 09:42:25.633608', '旌阳区', '510603', 3, 'jingyangqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2523, NULL, NULL, NULL, '2026-05-25 09:42:25.640676', '2026-05-25 09:42:25.640676', '罗江区', '510604', 3, 'luojiangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2524, NULL, NULL, NULL, '2026-05-25 09:42:25.648692', '2026-05-25 09:42:25.648692', '中江县', '510623', 3, 'zhongjiangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2525, NULL, NULL, NULL, '2026-05-25 09:42:25.657693', '2026-05-25 09:42:25.657693', '广汉市', '510681', 3, 'guanghanshi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2526, NULL, NULL, NULL, '2026-05-25 09:42:25.669693', '2026-05-25 09:42:25.669693', '什邡市', '510682', 3, 'shenfangshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2527, NULL, NULL, NULL, '2026-05-25 09:42:25.678109', '2026-05-25 09:42:25.678109', '绵竹市', '510683', 3, 'mianzhushi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2528, NULL, NULL, NULL, '2026-05-25 09:42:25.686145', '2026-05-25 09:42:25.686145', '绵阳市', '5107', 2, 'mianyangshi', 'M', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2529, NULL, NULL, NULL, '2026-05-25 09:42:25.695131', '2026-05-25 09:42:25.695131', '涪城区', '510703', 3, 'fuchengqu', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2530, NULL, NULL, NULL, '2026-05-25 09:42:25.702340', '2026-05-25 09:42:25.702340', '游仙区', '510704', 3, 'youxianqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2531, NULL, NULL, NULL, '2026-05-25 09:42:25.714315', '2026-05-25 09:42:25.714315', '安州区', '510705', 3, 'anzhouqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2532, NULL, NULL, NULL, '2026-05-25 09:42:25.723167', '2026-05-25 09:42:25.723167', '三台县', '510722', 3, 'santaixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2533, NULL, NULL, NULL, '2026-05-25 09:42:25.732167', '2026-05-25 09:42:25.732167', '盐亭县', '510723', 3, 'yantingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2534, NULL, NULL, NULL, '2026-05-25 09:42:25.741165', '2026-05-25 09:42:25.741165', '梓潼县', '510725', 3, 'zitongxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2535, NULL, NULL, NULL, '2026-05-25 09:42:25.751672', '2026-05-25 09:42:25.751672', '北川羌族自治县', '510726', 3, 'beichuanqiangzuzizhixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2536, NULL, NULL, NULL, '2026-05-25 09:42:25.760917', '2026-05-25 09:42:25.760917', '平武县', '510727', 3, 'pingwuxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2537, NULL, NULL, NULL, '2026-05-25 09:42:25.769929', '2026-05-25 09:42:25.769929', '江油市', '510781', 3, 'jiangyoushi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2538, NULL, NULL, NULL, '2026-05-25 09:42:25.778929', '2026-05-25 09:42:25.778929', '广元市', '5108', 2, 'guangyuanshi', 'G', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2539, NULL, NULL, NULL, '2026-05-25 09:42:25.786546', '2026-05-25 09:42:25.786546', '利州区', '510802', 3, 'lizhouqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2540, NULL, NULL, NULL, '2026-05-25 09:42:25.795867', '2026-05-25 09:42:25.795867', '昭化区', '510811', 3, 'zhaohuaqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2541, NULL, NULL, NULL, '2026-05-25 09:42:25.805982', '2026-05-25 09:42:25.805982', '朝天区', '510812', 3, 'chaotianqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2542, NULL, NULL, NULL, '2026-05-25 09:42:25.813920', '2026-05-25 09:42:25.813920', '旺苍县', '510821', 3, 'wangcangxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2543, NULL, NULL, NULL, '2026-05-25 09:42:25.821922', '2026-05-25 09:42:25.821922', '青川县', '510822', 3, 'qingchuanxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2544, NULL, NULL, NULL, '2026-05-25 09:42:25.830921', '2026-05-25 09:42:25.830921', '剑阁县', '510823', 3, 'jiangexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2545, NULL, NULL, NULL, '2026-05-25 09:42:25.841922', '2026-05-25 09:42:25.841922', '苍溪县', '510824', 3, 'cangxixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2546, NULL, NULL, NULL, '2026-05-25 09:42:25.850594', '2026-05-25 09:42:25.850594', '遂宁市', '5109', 2, 'suiningshi', 'S', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2547, NULL, NULL, NULL, '2026-05-25 09:42:25.858593', '2026-05-25 09:42:25.858593', '船山区', '510903', 3, 'chuanshanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2548, NULL, NULL, NULL, '2026-05-25 09:42:25.868592', '2026-05-25 09:42:25.868592', '安居区', '510904', 3, 'anjuqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2549, NULL, NULL, NULL, '2026-05-25 09:42:25.877630', '2026-05-25 09:42:25.877630', '蓬溪县', '510921', 3, 'pengxixian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2550, NULL, NULL, NULL, '2026-05-25 09:42:25.887631', '2026-05-25 09:42:25.887631', '大英县', '510923', 3, 'dayingxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2551, NULL, NULL, NULL, '2026-05-25 09:42:25.895631', '2026-05-25 09:42:25.895631', '射洪市', '510981', 3, 'shehongshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2552, NULL, NULL, NULL, '2026-05-25 09:42:25.906633', '2026-05-25 09:42:25.906633', '内江市', '5110', 2, 'neijiangshi', 'N', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2553, NULL, NULL, NULL, '2026-05-25 09:42:25.916633', '2026-05-25 09:42:25.916633', '市中区', '511002', 3, 'shizhongqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2554, NULL, NULL, NULL, '2026-05-25 09:42:25.929632', '2026-05-25 09:42:25.929632', '东兴区', '511011', 3, 'dongxingqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2555, NULL, NULL, NULL, '2026-05-25 09:42:25.939633', '2026-05-25 09:42:25.939633', '威远县', '511024', 3, 'weiyuanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2556, NULL, NULL, NULL, '2026-05-25 09:42:25.949633', '2026-05-25 09:42:25.949633', '资中县', '511025', 3, 'zizhongxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2557, NULL, NULL, NULL, '2026-05-25 09:42:25.961630', '2026-05-25 09:42:25.961630', '内江经济开发区', '511071', 3, 'neijiangjingjikaifaqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2558, NULL, NULL, NULL, '2026-05-25 09:42:25.971631', '2026-05-25 09:42:25.971631', '隆昌市', '511083', 3, 'longchangshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2559, NULL, NULL, NULL, '2026-05-25 09:42:25.978776', '2026-05-25 09:42:25.978776', '乐山市', '5111', 2, 'leshanshi', 'L', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2560, NULL, NULL, NULL, '2026-05-25 09:42:25.988776', '2026-05-25 09:42:25.988776', '市中区', '511102', 3, 'shizhongqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2561, NULL, NULL, NULL, '2026-05-25 09:42:25.997778', '2026-05-25 09:42:25.997778', '沙湾区', '511111', 3, 'shawanqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2562, NULL, NULL, NULL, '2026-05-25 09:42:26.007775', '2026-05-25 09:42:26.007775', '五通桥区', '511112', 3, 'wutongqiaoqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2563, NULL, NULL, NULL, '2026-05-25 09:42:26.015776', '2026-05-25 09:42:26.015776', '金口河区', '511113', 3, 'jinkouhequ', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2564, NULL, NULL, NULL, '2026-05-25 09:42:26.024777', '2026-05-25 09:42:26.024777', '犍为县', '511123', 3, 'qianweixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2565, NULL, NULL, NULL, '2026-05-25 09:42:26.032777', '2026-05-25 09:42:26.032777', '井研县', '511124', 3, 'jingyanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2566, NULL, NULL, NULL, '2026-05-25 09:42:26.041777', '2026-05-25 09:42:26.041777', '夹江县', '511126', 3, 'jiajiangxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2567, NULL, NULL, NULL, '2026-05-25 09:42:26.049776', '2026-05-25 09:42:26.049776', '沐川县', '511129', 3, 'muchuanxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2568, NULL, NULL, NULL, '2026-05-25 09:42:26.059777', '2026-05-25 09:42:26.059777', '峨边彝族自治县', '511132', 3, 'ebianyizuzizhixian', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2569, NULL, NULL, NULL, '2026-05-25 09:42:26.068778', '2026-05-25 09:42:26.068778', '马边彝族自治县', '511133', 3, 'mabianyizuzizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2570, NULL, NULL, NULL, '2026-05-25 09:42:26.078832', '2026-05-25 09:42:26.078832', '峨眉山市', '511181', 3, 'emeishanshi', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2571, NULL, NULL, NULL, '2026-05-25 09:42:26.087830', '2026-05-25 09:42:26.087830', '南充市', '5113', 2, 'nanchongshi', 'N', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2572, NULL, NULL, NULL, '2026-05-25 09:42:26.096830', '2026-05-25 09:42:26.096830', '顺庆区', '511302', 3, 'shunqingqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2573, NULL, NULL, NULL, '2026-05-25 09:42:26.105829', '2026-05-25 09:42:26.106829', '高坪区', '511303', 3, 'gaopingqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2574, NULL, NULL, NULL, '2026-05-25 09:42:26.113829', '2026-05-25 09:42:26.113829', '嘉陵区', '511304', 3, 'jialingqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2575, NULL, NULL, NULL, '2026-05-25 09:42:26.122830', '2026-05-25 09:42:26.122830', '南部县', '511321', 3, 'nanbuxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2576, NULL, NULL, NULL, '2026-05-25 09:42:26.130829', '2026-05-25 09:42:26.130829', '营山县', '511322', 3, 'yingshanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2577, NULL, NULL, NULL, '2026-05-25 09:42:26.140869', '2026-05-25 09:42:26.140869', '蓬安县', '511323', 3, 'penganxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2578, NULL, NULL, NULL, '2026-05-25 09:42:26.148868', '2026-05-25 09:42:26.148868', '仪陇县', '511324', 3, 'yilongxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2579, NULL, NULL, NULL, '2026-05-25 09:42:26.157868', '2026-05-25 09:42:26.157868', '西充县', '511325', 3, 'xichongxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2580, NULL, NULL, NULL, '2026-05-25 09:42:26.164778', '2026-05-25 09:42:26.164778', '阆中市', '511381', 3, 'langzhongshi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2581, NULL, NULL, NULL, '2026-05-25 09:42:26.172779', '2026-05-25 09:42:26.172779', '眉山市', '5114', 2, 'meishanshi', 'M', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2582, NULL, NULL, NULL, '2026-05-25 09:42:26.181779', '2026-05-25 09:42:26.181779', '东坡区', '511402', 3, 'dongpoqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2583, NULL, NULL, NULL, '2026-05-25 09:42:26.190779', '2026-05-25 09:42:26.190779', '彭山区', '511403', 3, 'pengshanqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2584, NULL, NULL, NULL, '2026-05-25 09:42:26.199782', '2026-05-25 09:42:26.199782', '仁寿县', '511421', 3, 'renshouxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2585, NULL, NULL, NULL, '2026-05-25 09:42:26.209779', '2026-05-25 09:42:26.209779', '洪雅县', '511423', 3, 'hongyaxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2586, NULL, NULL, NULL, '2026-05-25 09:42:26.220779', '2026-05-25 09:42:26.220779', '丹棱县', '511424', 3, 'danlengxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2587, NULL, NULL, NULL, '2026-05-25 09:42:26.229778', '2026-05-25 09:42:26.229778', '青神县', '511425', 3, 'qingshenxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2588, NULL, NULL, NULL, '2026-05-25 09:42:26.237677', '2026-05-25 09:42:26.237677', '宜宾市', '5115', 2, 'yibinshi', 'Y', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2589, NULL, NULL, NULL, '2026-05-25 09:42:26.246683', '2026-05-25 09:42:26.246683', '翠屏区', '511502', 3, 'cuipingqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2590, NULL, NULL, NULL, '2026-05-25 09:42:26.254468', '2026-05-25 09:42:26.254468', '南溪区', '511503', 3, 'nanxiqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2591, NULL, NULL, NULL, '2026-05-25 09:42:26.263992', '2026-05-25 09:42:26.263992', '叙州区', '511504', 3, 'xuzhouqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2592, NULL, NULL, NULL, '2026-05-25 09:42:26.272066', '2026-05-25 09:42:26.272066', '江安县', '511523', 3, 'jianganxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2593, NULL, NULL, NULL, '2026-05-25 09:42:26.282079', '2026-05-25 09:42:26.282079', '长宁县', '511524', 3, 'zhangningxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2594, NULL, NULL, NULL, '2026-05-25 09:42:26.291576', '2026-05-25 09:42:26.291576', '高县', '511525', 3, 'gaoxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2595, NULL, NULL, NULL, '2026-05-25 09:42:26.298576', '2026-05-25 09:42:26.299576', '珙县', '511526', 3, 'gongxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2596, NULL, NULL, NULL, '2026-05-25 09:42:26.308575', '2026-05-25 09:42:26.308575', '筠连县', '511527', 3, 'yunlianxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2597, NULL, NULL, NULL, '2026-05-25 09:42:26.316653', '2026-05-25 09:42:26.316653', '兴文县', '511528', 3, 'xingwenxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2598, NULL, NULL, NULL, '2026-05-25 09:42:26.325834', '2026-05-25 09:42:26.325834', '屏山县', '511529', 3, 'pingshanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2599, NULL, NULL, NULL, '2026-05-25 09:42:26.334834', '2026-05-25 09:42:26.334834', '广安市', '5116', 2, 'guanganshi', 'G', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2600, NULL, NULL, NULL, '2026-05-25 09:42:26.344833', '2026-05-25 09:42:26.344833', '广安区', '511602', 3, 'guanganqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2601, NULL, NULL, NULL, '2026-05-25 09:42:26.353397', '2026-05-25 09:42:26.353397', '前锋区', '511603', 3, 'qianfengqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2602, NULL, NULL, NULL, '2026-05-25 09:42:26.362397', '2026-05-25 09:42:26.362397', '岳池县', '511621', 3, 'yuechixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2603, NULL, NULL, NULL, '2026-05-25 09:42:26.371396', '2026-05-25 09:42:26.371396', '武胜县', '511622', 3, 'wushengxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2604, NULL, NULL, NULL, '2026-05-25 09:42:26.380396', '2026-05-25 09:42:26.380396', '邻水县', '511623', 3, 'linshuixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2605, NULL, NULL, NULL, '2026-05-25 09:42:26.388397', '2026-05-25 09:42:26.388397', '华蓥市', '511681', 3, 'huayingshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2606, NULL, NULL, NULL, '2026-05-25 09:42:26.397597', '2026-05-25 09:42:26.397597', '达州市', '5117', 2, 'dazhoushi', 'D', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2607, NULL, NULL, NULL, '2026-05-25 09:42:26.408448', '2026-05-25 09:42:26.408448', '通川区', '511702', 3, 'tongchuanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2608, NULL, NULL, NULL, '2026-05-25 09:42:26.416971', '2026-05-25 09:42:26.416971', '达川区', '511703', 3, 'dachuanqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2609, NULL, NULL, NULL, '2026-05-25 09:42:26.425970', '2026-05-25 09:42:26.425970', '宣汉县', '511722', 3, 'xuanhanxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2610, NULL, NULL, NULL, '2026-05-25 09:42:26.434443', '2026-05-25 09:42:26.434443', '开江县', '511723', 3, 'kaijiangxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2611, NULL, NULL, NULL, '2026-05-25 09:42:26.443444', '2026-05-25 09:42:26.443444', '大竹县', '511724', 3, 'dazhuxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2612, NULL, NULL, NULL, '2026-05-25 09:42:26.453678', '2026-05-25 09:42:26.453678', '渠县', '511725', 3, 'quxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2613, NULL, NULL, NULL, '2026-05-25 09:42:26.463678', '2026-05-25 09:42:26.463678', '达州经济开发区', '511771', 3, 'dazhoujingjikaifaqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2614, NULL, NULL, NULL, '2026-05-25 09:42:26.473786', '2026-05-25 09:42:26.473786', '万源市', '511781', 3, 'wanyuanshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2615, NULL, NULL, NULL, '2026-05-25 09:42:26.482236', '2026-05-25 09:42:26.482236', '雅安市', '5118', 2, 'yaanshi', 'Y', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2616, NULL, NULL, NULL, '2026-05-25 09:42:26.497072', '2026-05-25 09:42:26.497072', '雨城区', '511802', 3, 'yuchengqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2617, NULL, NULL, NULL, '2026-05-25 09:42:26.508731', '2026-05-25 09:42:26.508731', '名山区', '511803', 3, 'mingshanqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2618, NULL, NULL, NULL, '2026-05-25 09:42:26.516501', '2026-05-25 09:42:26.516501', '荥经县', '511822', 3, 'xingjingxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2619, NULL, NULL, NULL, '2026-05-25 09:42:26.524008', '2026-05-25 09:42:26.524008', '汉源县', '511823', 3, 'hanyuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2620, NULL, NULL, NULL, '2026-05-25 09:42:26.532008', '2026-05-25 09:42:26.532008', '石棉县', '511824', 3, 'shimianxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2621, NULL, NULL, NULL, '2026-05-25 09:42:26.538008', '2026-05-25 09:42:26.538008', '天全县', '511825', 3, 'tianquanxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2622, NULL, NULL, NULL, '2026-05-25 09:42:26.547381', '2026-05-25 09:42:26.547381', '芦山县', '511826', 3, 'lushanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2623, NULL, NULL, NULL, '2026-05-25 09:42:26.555449', '2026-05-25 09:42:26.555449', '宝兴县', '511827', 3, 'baoxingxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2624, NULL, NULL, NULL, '2026-05-25 09:42:26.563515', '2026-05-25 09:42:26.563515', '巴中市', '5119', 2, 'bazhongshi', 'B', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2625, NULL, NULL, NULL, '2026-05-25 09:42:26.571484', '2026-05-25 09:42:26.571484', '巴州区', '511902', 3, 'bazhouqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2626, NULL, NULL, NULL, '2026-05-25 09:42:26.580483', '2026-05-25 09:42:26.580483', '恩阳区', '511903', 3, 'enyangqu', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2627, NULL, NULL, NULL, '2026-05-25 09:42:26.587483', '2026-05-25 09:42:26.587483', '通江县', '511921', 3, 'tongjiangxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2628, NULL, NULL, NULL, '2026-05-25 09:42:26.596483', '2026-05-25 09:42:26.596483', '南江县', '511922', 3, 'nanjiangxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2629, NULL, NULL, NULL, '2026-05-25 09:42:26.606532', '2026-05-25 09:42:26.606532', '平昌县', '511923', 3, 'pingchangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2630, NULL, NULL, NULL, '2026-05-25 09:42:26.613761', '2026-05-25 09:42:26.613761', '巴中经济开发区', '511971', 3, 'bazhongjingjikaifaqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2631, NULL, NULL, NULL, '2026-05-25 09:42:26.623762', '2026-05-25 09:42:26.623762', '资阳市', '5120', 2, 'ziyangshi', 'Z', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2632, NULL, NULL, NULL, '2026-05-25 09:42:26.634761', '2026-05-25 09:42:26.634761', '雁江区', '512002', 3, 'yanjiangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2633, NULL, NULL, NULL, '2026-05-25 09:42:26.642762', '2026-05-25 09:42:26.642762', '安岳县', '512021', 3, 'anyuexian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2634, NULL, NULL, NULL, '2026-05-25 09:42:26.649335', '2026-05-25 09:42:26.649335', '乐至县', '512022', 3, 'lezhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2635, NULL, NULL, NULL, '2026-05-25 09:42:26.657407', '2026-05-25 09:42:26.657407', '阿坝藏族羌族自治州', '5132', 2, 'abazangzuqiangzuzizhizhou', 'A', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2636, NULL, NULL, NULL, '2026-05-25 09:42:26.664352', '2026-05-25 09:42:26.664352', '马尔康市', '513201', 3, 'maerkangshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2637, NULL, NULL, NULL, '2026-05-25 09:42:26.673451', '2026-05-25 09:42:26.673451', '汶川县', '513221', 3, 'wenchuanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2638, NULL, NULL, NULL, '2026-05-25 09:42:26.682451', '2026-05-25 09:42:26.682451', '理县', '513222', 3, 'lixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2639, NULL, NULL, NULL, '2026-05-25 09:42:26.692686', '2026-05-25 09:42:26.692686', '茂县', '513223', 3, 'maoxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2640, NULL, NULL, NULL, '2026-05-25 09:42:26.704763', '2026-05-25 09:42:26.704763', '松潘县', '513224', 3, 'songpanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2641, NULL, NULL, NULL, '2026-05-25 09:42:26.713203', '2026-05-25 09:42:26.713203', '九寨沟县', '513225', 3, 'jiuzhaigouxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2642, NULL, NULL, NULL, '2026-05-25 09:42:26.721265', '2026-05-25 09:42:26.721265', '金川县', '513226', 3, 'jinchuanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2643, NULL, NULL, NULL, '2026-05-25 09:42:26.729298', '2026-05-25 09:42:26.729298', '小金县', '513227', 3, 'xiaojinxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2644, NULL, NULL, NULL, '2026-05-25 09:42:26.737704', '2026-05-25 09:42:26.737704', '黑水县', '513228', 3, 'heishuixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2645, NULL, NULL, NULL, '2026-05-25 09:42:26.745970', '2026-05-25 09:42:26.745970', '壤塘县', '513230', 3, 'rangtangxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2646, NULL, NULL, NULL, '2026-05-25 09:42:26.753735', '2026-05-25 09:42:26.753735', '阿坝县', '513231', 3, 'abaxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2647, NULL, NULL, NULL, '2026-05-25 09:42:26.761850', '2026-05-25 09:42:26.761850', '若尔盖县', '513232', 3, 'ruoergaixian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2648, NULL, NULL, NULL, '2026-05-25 09:42:26.768849', '2026-05-25 09:42:26.768849', '红原县', '513233', 3, 'hongyuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2649, NULL, NULL, NULL, '2026-05-25 09:42:26.775887', '2026-05-25 09:42:26.775887', '甘孜藏族自治州', '5133', 2, 'ganzizangzuzizhizhou', 'G', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2650, NULL, NULL, NULL, '2026-05-25 09:42:26.783886', '2026-05-25 09:42:26.783886', '康定市', '513301', 3, 'kangdingshi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2651, NULL, NULL, NULL, '2026-05-25 09:42:26.791880', '2026-05-25 09:42:26.791880', '泸定县', '513322', 3, 'ludingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2652, NULL, NULL, NULL, '2026-05-25 09:42:26.800886', '2026-05-25 09:42:26.800886', '丹巴县', '513323', 3, 'danbaxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2653, NULL, NULL, NULL, '2026-05-25 09:42:26.812885', '2026-05-25 09:42:26.812885', '九龙县', '513324', 3, 'jiulongxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2654, NULL, NULL, NULL, '2026-05-25 09:42:26.821845', '2026-05-25 09:42:26.821845', '雅江县', '513325', 3, 'yajiangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2655, NULL, NULL, NULL, '2026-05-25 09:42:26.831845', '2026-05-25 09:42:26.831845', '道孚县', '513326', 3, 'daofuxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2656, NULL, NULL, NULL, '2026-05-25 09:42:26.840841', '2026-05-25 09:42:26.840841', '炉霍县', '513327', 3, 'luhuoxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2657, NULL, NULL, NULL, '2026-05-25 09:42:26.852840', '2026-05-25 09:42:26.852840', '甘孜县', '513328', 3, 'ganzixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2658, NULL, NULL, NULL, '2026-05-25 09:42:26.860845', '2026-05-25 09:42:26.860845', '新龙县', '513329', 3, 'xinlongxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2659, NULL, NULL, NULL, '2026-05-25 09:42:26.868844', '2026-05-25 09:42:26.868844', '德格县', '513330', 3, 'degexian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2660, NULL, NULL, NULL, '2026-05-25 09:42:26.877858', '2026-05-25 09:42:26.877858', '白玉县', '513331', 3, 'baiyuxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2661, NULL, NULL, NULL, '2026-05-25 09:42:26.886858', '2026-05-25 09:42:26.886858', '石渠县', '513332', 3, 'shiquxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2662, NULL, NULL, NULL, '2026-05-25 09:42:26.894126', '2026-05-25 09:42:26.894126', '色达县', '513333', 3, 'sedaxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2663, NULL, NULL, NULL, '2026-05-25 09:42:26.903126', '2026-05-25 09:42:26.903126', '理塘县', '513334', 3, 'litangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2664, NULL, NULL, NULL, '2026-05-25 09:42:26.914656', '2026-05-25 09:42:26.914656', '巴塘县', '513335', 3, 'batangxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2665, NULL, NULL, NULL, '2026-05-25 09:42:26.925655', '2026-05-25 09:42:26.925655', '乡城县', '513336', 3, 'xiangchengxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2666, NULL, NULL, NULL, '2026-05-25 09:42:26.933654', '2026-05-25 09:42:26.934654', '稻城县', '513337', 3, 'daochengxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2667, NULL, NULL, NULL, '2026-05-25 09:42:26.942655', '2026-05-25 09:42:26.942655', '得荣县', '513338', 3, 'derongxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2668, NULL, NULL, NULL, '2026-05-25 09:42:26.952655', '2026-05-25 09:42:26.952655', '凉山彝族自治州', '5134', 2, 'liangshanyizuzizhizhou', 'L', 1, NULL, '130127');
INSERT INTO `dvadmin_system_area` VALUES (2669, NULL, NULL, NULL, '2026-05-25 09:42:26.961677', '2026-05-25 09:42:26.961677', '西昌市', '513401', 3, 'xichangshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2670, NULL, NULL, NULL, '2026-05-25 09:42:26.970974', '2026-05-25 09:42:26.970974', '木里藏族自治县', '513422', 3, 'mulizangzuzizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2671, NULL, NULL, NULL, '2026-05-25 09:42:26.980353', '2026-05-25 09:42:26.980353', '盐源县', '513423', 3, 'yanyuanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2672, NULL, NULL, NULL, '2026-05-25 09:42:26.988352', '2026-05-25 09:42:26.988352', '德昌县', '513424', 3, 'dechangxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2673, NULL, NULL, NULL, '2026-05-25 09:42:26.997353', '2026-05-25 09:42:26.997353', '会理县', '513425', 3, 'huilixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2674, NULL, NULL, NULL, '2026-05-25 09:42:27.011355', '2026-05-25 09:42:27.011355', '会东县', '513426', 3, 'huidongxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2675, NULL, NULL, NULL, '2026-05-25 09:42:27.020350', '2026-05-25 09:42:27.020350', '宁南县', '513427', 3, 'ningnanxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2676, NULL, NULL, NULL, '2026-05-25 09:42:27.029350', '2026-05-25 09:42:27.029350', '普格县', '513428', 3, 'pugexian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2677, NULL, NULL, NULL, '2026-05-25 09:42:27.037352', '2026-05-25 09:42:27.037352', '布拖县', '513429', 3, 'butuoxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2678, NULL, NULL, NULL, '2026-05-25 09:42:27.045352', '2026-05-25 09:42:27.045352', '金阳县', '513430', 3, 'jinyangxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2679, NULL, NULL, NULL, '2026-05-25 09:42:27.053352', '2026-05-25 09:42:27.053352', '昭觉县', '513431', 3, 'zhaojuexian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2680, NULL, NULL, NULL, '2026-05-25 09:42:27.061368', '2026-05-25 09:42:27.061368', '喜德县', '513432', 3, 'xidexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2681, NULL, NULL, NULL, '2026-05-25 09:42:27.068705', '2026-05-25 09:42:27.068705', '冕宁县', '513433', 3, 'mianningxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2682, NULL, NULL, NULL, '2026-05-25 09:42:27.076705', '2026-05-25 09:42:27.076705', '越西县', '513434', 3, 'yuexixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2683, NULL, NULL, NULL, '2026-05-25 09:42:27.083699', '2026-05-25 09:42:27.083699', '甘洛县', '513435', 3, 'ganluoxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2684, NULL, NULL, NULL, '2026-05-25 09:42:27.093202', '2026-05-25 09:42:27.093202', '美姑县', '513436', 3, 'meiguxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2685, NULL, NULL, NULL, '2026-05-25 09:42:27.102704', '2026-05-25 09:42:27.102704', '雷波县', '513437', 3, 'leiboxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2686, NULL, NULL, NULL, '2026-05-25 09:42:27.110705', '2026-04-03 10:10:05.057000', '贵州省', '52', 1, 'guizhousheng', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2687, NULL, NULL, NULL, '2026-05-25 09:42:27.118698', '2026-05-25 09:42:27.118698', '贵阳市', '5201', 2, 'guiyangshi', 'G', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2688, NULL, NULL, NULL, '2026-05-25 09:42:27.127704', '2026-05-25 09:42:27.127704', '南明区', '520102', 3, 'nanmingqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2689, NULL, NULL, NULL, '2026-05-25 09:42:27.134704', '2026-05-25 09:42:27.134704', '云岩区', '520103', 3, 'yunyanqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2690, NULL, NULL, NULL, '2026-05-25 09:42:27.143701', '2026-05-25 09:42:27.143701', '花溪区', '520111', 3, 'huaxiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2691, NULL, NULL, NULL, '2026-05-25 09:42:27.151704', '2026-05-25 09:42:27.151704', '乌当区', '520112', 3, 'wudangqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2692, NULL, NULL, NULL, '2026-05-25 09:42:27.161807', '2026-05-25 09:42:27.161807', '白云区', '520113', 3, 'baiyunqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2693, NULL, NULL, NULL, '2026-05-25 09:42:27.171848', '2026-05-25 09:42:27.171848', '观山湖区', '520115', 3, 'guanshanhuqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2694, NULL, NULL, NULL, '2026-05-25 09:42:27.180745', '2026-05-25 09:42:27.180745', '开阳县', '520121', 3, 'kaiyangxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2695, NULL, NULL, NULL, '2026-05-25 09:42:27.189114', '2026-05-25 09:42:27.189114', '息烽县', '520122', 3, 'xifengxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2696, NULL, NULL, NULL, '2026-05-25 09:42:27.197113', '2026-05-25 09:42:27.197113', '修文县', '520123', 3, 'xiuwenxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2697, NULL, NULL, NULL, '2026-05-25 09:42:27.206154', '2026-05-25 09:42:27.206154', '清镇市', '520181', 3, 'qingzhenshi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2698, NULL, NULL, NULL, '2026-05-25 09:42:27.214696', '2026-05-25 09:42:27.214696', '六盘水市', '5202', 2, 'liupanshuishi', 'L', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2699, NULL, NULL, NULL, '2026-05-25 09:42:27.224710', '2026-05-25 09:42:27.224710', '钟山区', '520201', 3, 'zhongshanqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2700, NULL, NULL, NULL, '2026-05-25 09:42:27.234715', '2026-05-25 09:42:27.234715', '六枝特区', '520203', 3, 'liuzhitequ', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2701, NULL, NULL, NULL, '2026-05-25 09:42:27.244716', '2026-05-25 09:42:27.244716', '水城县', '520221', 3, 'shuichengxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2702, NULL, NULL, NULL, '2026-05-25 09:42:27.253716', '2026-05-25 09:42:27.253716', '盘州市', '520281', 3, 'panzhoushi', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2703, NULL, NULL, NULL, '2026-05-25 09:42:27.262715', '2026-05-25 09:42:27.262715', '遵义市', '5203', 2, 'zunyishi', 'Z', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2704, NULL, NULL, NULL, '2026-05-25 09:42:27.271766', '2026-05-25 09:42:27.271766', '红花岗区', '520302', 3, 'honghuagangqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2705, NULL, NULL, NULL, '2026-05-25 09:42:27.280765', '2026-05-25 09:42:27.280765', '汇川区', '520303', 3, 'huichuanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2706, NULL, NULL, NULL, '2026-05-25 09:42:27.292613', '2026-05-25 09:42:27.292613', '播州区', '520304', 3, 'bozhouqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2707, NULL, NULL, NULL, '2026-05-25 09:42:27.301968', '2026-05-25 09:42:27.301968', '桐梓县', '520322', 3, 'tongzixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2708, NULL, NULL, NULL, '2026-05-25 09:42:27.312028', '2026-05-25 09:42:27.312028', '绥阳县', '520323', 3, 'suiyangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2709, NULL, NULL, NULL, '2026-05-25 09:42:27.319067', '2026-05-25 09:42:27.319067', '正安县', '520324', 3, 'zhenganxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2710, NULL, NULL, NULL, '2026-05-25 09:42:27.327071', '2026-05-25 09:42:27.327071', '道真仡佬族苗族自治县', '520325', 3, 'daozhengelaozumiaozuzizhixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2711, NULL, NULL, NULL, '2026-05-25 09:42:27.337191', '2026-05-25 09:42:27.337191', '务川仡佬族苗族自治县', '520326', 3, 'wuchuangelaozumiaozuzizhixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2712, NULL, NULL, NULL, '2026-05-25 09:42:27.349192', '2026-05-25 09:42:27.349192', '凤冈县', '520327', 3, 'fenggangxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2713, NULL, NULL, NULL, '2026-05-25 09:42:27.359197', '2026-05-25 09:42:27.359197', '湄潭县', '520328', 3, 'meitanxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2714, NULL, NULL, NULL, '2026-05-25 09:42:27.367197', '2026-05-25 09:42:27.367197', '余庆县', '520329', 3, 'yuqingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2715, NULL, NULL, NULL, '2026-05-25 09:42:27.376197', '2026-05-25 09:42:27.376197', '习水县', '520330', 3, 'xishuixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2716, NULL, NULL, NULL, '2026-05-25 09:42:27.384203', '2026-05-25 09:42:27.384203', '赤水市', '520381', 3, 'chishuishi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2717, NULL, NULL, NULL, '2026-05-25 09:42:27.392586', '2026-05-25 09:42:27.392586', '仁怀市', '520382', 3, 'renhuaishi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2718, NULL, NULL, NULL, '2026-05-25 09:42:27.400586', '2026-05-25 09:42:27.400586', '安顺市', '5204', 2, 'anshunshi', 'A', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2719, NULL, NULL, NULL, '2026-05-25 09:42:27.409586', '2026-05-25 09:42:27.409586', '西秀区', '520402', 3, 'xixiuqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2720, NULL, NULL, NULL, '2026-05-25 09:42:27.417586', '2026-05-25 09:42:27.417586', '平坝区', '520403', 3, 'pingbaqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2721, NULL, NULL, NULL, '2026-05-25 09:42:27.427583', '2026-05-25 09:42:27.427583', '普定县', '520422', 3, 'pudingxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2722, NULL, NULL, NULL, '2026-05-25 09:42:27.435909', '2026-05-25 09:42:27.435909', '镇宁布依族苗族自治县', '520423', 3, 'zhenningbuyizumiaozuzizhixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2723, NULL, NULL, NULL, '2026-05-25 09:42:27.443664', '2026-05-25 09:42:27.443664', '关岭布依族苗族自治县', '520424', 3, 'guanlingbuyizumiaozuzizhixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2724, NULL, NULL, NULL, '2026-05-25 09:42:27.453664', '2026-05-25 09:42:27.453664', '紫云苗族布依族自治县', '520425', 3, 'ziyunmiaozubuyizuzizhixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2725, NULL, NULL, NULL, '2026-05-25 09:42:27.460663', '2026-05-25 09:42:27.460663', '毕节市', '5205', 2, 'bijieshi', 'B', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2726, NULL, NULL, NULL, '2026-05-25 09:42:27.469213', '2026-05-25 09:42:27.469213', '七星关区', '520502', 3, 'qixingguanqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2727, NULL, NULL, NULL, '2026-05-25 09:42:27.479216', '2026-05-25 09:42:27.479216', '大方县', '520521', 3, 'dafangxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2728, NULL, NULL, NULL, '2026-05-25 09:42:27.488213', '2026-05-25 09:42:27.488213', '黔西县', '520522', 3, 'qianxixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2729, NULL, NULL, NULL, '2026-05-25 09:42:27.496539', '2026-05-25 09:42:27.496539', '金沙县', '520523', 3, 'jinshaxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2730, NULL, NULL, NULL, '2026-05-25 09:42:27.504554', '2026-05-25 09:42:27.504554', '织金县', '520524', 3, 'zhijinxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2731, NULL, NULL, NULL, '2026-05-25 09:42:27.511554', '2026-05-25 09:42:27.511554', '纳雍县', '520525', 3, 'nayongxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2732, NULL, NULL, NULL, '2026-05-25 09:42:27.519734', '2026-05-25 09:42:27.519734', '威宁彝族回族苗族自治县', '520526', 3, 'weiningyizuhuizumiaozuzizhixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2733, NULL, NULL, NULL, '2026-05-25 09:42:27.527852', '2026-05-25 09:42:27.527852', '赫章县', '520527', 3, 'hezhangxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2734, NULL, NULL, NULL, '2026-05-25 09:42:27.537854', '2026-05-25 09:42:27.537854', '铜仁市', '5206', 2, 'tongrenshi', 'T', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2735, NULL, NULL, NULL, '2026-05-25 09:42:27.547852', '2026-05-25 09:42:27.547852', '碧江区', '520602', 3, 'bijiangqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2736, NULL, NULL, NULL, '2026-05-25 09:42:27.557925', '2026-05-25 09:42:27.557925', '万山区', '520603', 3, 'wanshanqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2737, NULL, NULL, NULL, '2026-05-25 09:42:27.566925', '2026-05-25 09:42:27.566925', '江口县', '520621', 3, 'jiangkouxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2738, NULL, NULL, NULL, '2026-05-25 09:42:27.575924', '2026-05-25 09:42:27.575924', '玉屏侗族自治县', '520622', 3, 'yupingdongzuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2739, NULL, NULL, NULL, '2026-05-25 09:42:27.587949', '2026-05-25 09:42:27.587949', '石阡县', '520623', 3, 'shiqianxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2740, NULL, NULL, NULL, '2026-05-25 09:42:27.596950', '2026-05-25 09:42:27.596950', '思南县', '520624', 3, 'sinanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2741, NULL, NULL, NULL, '2026-05-25 09:42:27.606949', '2026-05-25 09:42:27.606949', '印江土家族苗族自治县', '520625', 3, 'yinjiangtujiazumiaozuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2742, NULL, NULL, NULL, '2026-05-25 09:42:27.614949', '2026-05-25 09:42:27.614949', '德江县', '520626', 3, 'dejiangxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2743, NULL, NULL, NULL, '2026-05-25 09:42:27.625950', '2026-05-25 09:42:27.625950', '沿河土家族自治县', '520627', 3, 'yanhetujiazuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2744, NULL, NULL, NULL, '2026-05-25 09:42:27.635949', '2026-05-25 09:42:27.635949', '松桃苗族自治县', '520628', 3, 'songtaomiaozuzizhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2745, NULL, NULL, NULL, '2026-05-25 09:42:27.649949', '2026-05-25 09:42:27.649949', '黔西南布依族苗族自治州', '5223', 2, 'qianxinanbuyizumiaozuzizhizhou', 'Q', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2746, NULL, NULL, NULL, '2026-05-25 09:42:27.658949', '2026-05-25 09:42:27.658949', '兴义市', '522301', 3, 'xingyishi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2747, NULL, NULL, NULL, '2026-05-25 09:42:27.667949', '2026-05-25 09:42:27.667949', '兴仁市', '522302', 3, 'xingrenshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2748, NULL, NULL, NULL, '2026-05-25 09:42:27.676949', '2026-05-25 09:42:27.676949', '普安县', '522323', 3, 'puanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2749, NULL, NULL, NULL, '2026-05-25 09:42:27.688949', '2026-05-25 09:42:27.688949', '晴隆县', '522324', 3, 'qinglongxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2750, NULL, NULL, NULL, '2026-05-25 09:42:27.697770', '2026-05-25 09:42:27.697770', '贞丰县', '522325', 3, 'zhenfengxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2751, NULL, NULL, NULL, '2026-05-25 09:42:27.706767', '2026-05-25 09:42:27.706767', '望谟县', '522326', 3, 'wangmoxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2752, NULL, NULL, NULL, '2026-05-25 09:42:27.715788', '2026-05-25 09:42:27.715788', '册亨县', '522327', 3, 'cehengxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2753, NULL, NULL, NULL, '2026-05-25 09:42:27.723788', '2026-05-25 09:42:27.723788', '安龙县', '522328', 3, 'anlongxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2754, NULL, NULL, NULL, '2026-05-25 09:42:27.734383', '2026-05-25 09:42:27.734383', '黔东南苗族侗族自治州', '5226', 2, 'qiandongnanmiaozudongzuzizhizhou', 'Q', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2755, NULL, NULL, NULL, '2026-05-25 09:42:27.744379', '2026-05-25 09:42:27.744379', '凯里市', '522601', 3, 'kailishi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2756, NULL, NULL, NULL, '2026-05-25 09:42:27.752383', '2026-05-25 09:42:27.752383', '黄平县', '522622', 3, 'huangpingxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2757, NULL, NULL, NULL, '2026-05-25 09:42:27.767269', '2026-05-25 09:42:27.767269', '施秉县', '522623', 3, 'shibingxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2758, NULL, NULL, NULL, '2026-05-25 09:42:27.776159', '2026-05-25 09:42:27.776159', '三穗县', '522624', 3, 'sansuixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2759, NULL, NULL, NULL, '2026-05-25 09:42:27.784556', '2026-05-25 09:42:27.784556', '镇远县', '522625', 3, 'zhenyuanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2760, NULL, NULL, NULL, '2026-05-25 09:42:27.792563', '2026-05-25 09:42:27.792563', '岑巩县', '522626', 3, 'cengongxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2761, NULL, NULL, NULL, '2026-05-25 09:42:27.801578', '2026-05-25 09:42:27.801578', '天柱县', '522627', 3, 'tianzhuxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2762, NULL, NULL, NULL, '2026-05-25 09:42:27.811789', '2026-05-25 09:42:27.811789', '锦屏县', '522628', 3, 'jinpingxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2763, NULL, NULL, NULL, '2026-05-25 09:42:27.819953', '2026-05-25 09:42:27.819953', '剑河县', '522629', 3, 'jianhexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2764, NULL, NULL, NULL, '2026-05-25 09:42:27.826952', '2026-05-25 09:42:27.826952', '台江县', '522630', 3, 'taijiangxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2765, NULL, NULL, NULL, '2026-05-25 09:42:27.836039', '2026-05-25 09:42:27.836039', '黎平县', '522631', 3, 'lipingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2766, NULL, NULL, NULL, '2026-05-25 09:42:27.844039', '2026-05-25 09:42:27.844039', '榕江县', '522632', 3, 'rongjiangxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2767, NULL, NULL, NULL, '2026-05-25 09:42:27.851883', '2026-05-25 09:42:27.851883', '从江县', '522633', 3, 'congjiangxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2768, NULL, NULL, NULL, '2026-05-25 09:42:27.858924', '2026-05-25 09:42:27.858924', '雷山县', '522634', 3, 'leishanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2769, NULL, NULL, NULL, '2026-05-25 09:42:27.866621', '2026-05-25 09:42:27.866621', '麻江县', '522635', 3, 'majiangxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2770, NULL, NULL, NULL, '2026-05-25 09:42:27.876619', '2026-05-25 09:42:27.876619', '丹寨县', '522636', 3, 'danzhaixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2771, NULL, NULL, NULL, '2026-05-25 09:42:27.885619', '2026-05-25 09:42:27.885619', '黔南布依族苗族自治州', '5227', 2, 'qiannanbuyizumiaozuzizhizhou', 'Q', 1, NULL, '130128');
INSERT INTO `dvadmin_system_area` VALUES (2772, NULL, NULL, NULL, '2026-05-25 09:42:27.893618', '2026-05-25 09:42:27.893618', '都匀市', '522701', 3, 'douyunshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2773, NULL, NULL, NULL, '2026-05-25 09:42:27.900618', '2026-05-25 09:42:27.900618', '福泉市', '522702', 3, 'fuquanshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2774, NULL, NULL, NULL, '2026-05-25 09:42:27.909125', '2026-05-25 09:42:27.909125', '荔波县', '522722', 3, 'liboxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2775, NULL, NULL, NULL, '2026-05-25 09:42:27.922125', '2026-05-25 09:42:27.922125', '贵定县', '522723', 3, 'guidingxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2776, NULL, NULL, NULL, '2026-05-25 09:42:27.931127', '2026-05-25 09:42:27.931127', '瓮安县', '522725', 3, 'wenganxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2777, NULL, NULL, NULL, '2026-05-25 09:42:27.939124', '2026-05-25 09:42:27.939124', '独山县', '522726', 3, 'dushanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2778, NULL, NULL, NULL, '2026-05-25 09:42:27.946469', '2026-05-25 09:42:27.946469', '平塘县', '522727', 3, 'pingtangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2779, NULL, NULL, NULL, '2026-05-25 09:42:27.954475', '2026-05-25 09:42:27.954475', '罗甸县', '522728', 3, 'luodianxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2780, NULL, NULL, NULL, '2026-05-25 09:42:27.964474', '2026-05-25 09:42:27.964474', '长顺县', '522729', 3, 'zhangshunxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2781, NULL, NULL, NULL, '2026-05-25 09:42:27.972940', '2026-05-25 09:42:27.972940', '龙里县', '522730', 3, 'longlixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2782, NULL, NULL, NULL, '2026-05-25 09:42:27.982171', '2026-05-25 09:42:27.982171', '惠水县', '522731', 3, 'huishuixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2783, NULL, NULL, NULL, '2026-05-25 09:42:27.993796', '2026-05-25 09:42:27.993796', '三都水族自治县', '522732', 3, 'sandoushuizuzizhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2784, NULL, NULL, NULL, '2026-05-25 09:42:28.002795', '2026-04-03 10:10:05.062000', '云南省', '53', 1, 'yunnansheng', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2785, NULL, NULL, NULL, '2026-05-25 09:42:28.011150', '2026-05-25 09:42:28.011150', '昆明市', '5301', 2, 'kunmingshi', 'K', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2786, NULL, NULL, NULL, '2026-05-25 09:42:28.020446', '2026-05-25 09:42:28.020446', '五华区', '530102', 3, 'wuhuaqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2787, NULL, NULL, NULL, '2026-05-25 09:42:28.028454', '2026-05-25 09:42:28.028454', '盘龙区', '530103', 3, 'panlongqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2788, NULL, NULL, NULL, '2026-05-25 09:42:28.037525', '2026-05-25 09:42:28.037525', '官渡区', '530111', 3, 'guanduqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2789, NULL, NULL, NULL, '2026-05-25 09:42:28.045853', '2026-05-25 09:42:28.045853', '西山区', '530112', 3, 'xishanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2790, NULL, NULL, NULL, '2026-05-25 09:42:28.052914', '2026-05-25 09:42:28.052914', '东川区', '530113', 3, 'dongchuanqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2791, NULL, NULL, NULL, '2026-05-25 09:42:28.061910', '2026-05-25 09:42:28.061910', '呈贡区', '530114', 3, 'chenggongqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2792, NULL, NULL, NULL, '2026-05-25 09:42:28.071910', '2026-05-25 09:42:28.071910', '晋宁区', '530115', 3, 'jinningqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2793, NULL, NULL, NULL, '2026-05-25 09:42:28.080910', '2026-05-25 09:42:28.080910', '富民县', '530124', 3, 'fuminxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2794, NULL, NULL, NULL, '2026-05-25 09:42:28.090401', '2026-05-25 09:42:28.090401', '宜良县', '530125', 3, 'yiliangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2795, NULL, NULL, NULL, '2026-05-25 09:42:28.098406', '2026-05-25 09:42:28.098406', '石林彝族自治县', '530126', 3, 'shilinyizuzizhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2796, NULL, NULL, NULL, '2026-05-25 09:42:28.107406', '2026-05-25 09:42:28.107406', '嵩明县', '530127', 3, 'songmingxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2797, NULL, NULL, NULL, '2026-05-25 09:42:28.117399', '2026-05-25 09:42:28.117399', '禄劝彝族苗族自治县', '530128', 3, 'luquanyizumiaozuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2798, NULL, NULL, NULL, '2026-05-25 09:42:28.125678', '2026-05-25 09:42:28.125678', '寻甸回族彝族自治县', '530129', 3, 'xundianhuizuyizuzizhixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2799, NULL, NULL, NULL, '2026-05-25 09:42:28.139875', '2026-05-25 09:42:28.139875', '安宁市', '530181', 3, 'anningshi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2800, NULL, NULL, NULL, '2026-05-25 09:42:28.148446', '2026-05-25 09:42:28.148446', '曲靖市', '5303', 2, 'qujingshi', 'Q', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2801, NULL, NULL, NULL, '2026-05-25 09:42:28.156489', '2026-05-25 09:42:28.156489', '麒麟区', '530302', 3, 'qilinqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2802, NULL, NULL, NULL, '2026-05-25 09:42:28.163484', '2026-05-25 09:42:28.163484', '沾益区', '530303', 3, 'zhanyiqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2803, NULL, NULL, NULL, '2026-05-25 09:42:28.172489', '2026-05-25 09:42:28.172489', '马龙区', '530304', 3, 'malongqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2804, NULL, NULL, NULL, '2026-05-25 09:42:28.180490', '2026-05-25 09:42:28.180490', '陆良县', '530322', 3, 'luliangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2805, NULL, NULL, NULL, '2026-05-25 09:42:28.189491', '2026-05-25 09:42:28.189491', '师宗县', '530323', 3, 'shizongxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2806, NULL, NULL, NULL, '2026-05-25 09:42:28.198489', '2026-05-25 09:42:28.198489', '罗平县', '530324', 3, 'luopingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2807, NULL, NULL, NULL, '2026-05-25 09:42:28.207489', '2026-05-25 09:42:28.207489', '富源县', '530325', 3, 'fuyuanxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2808, NULL, NULL, NULL, '2026-05-25 09:42:28.218594', '2026-05-25 09:42:28.218594', '会泽县', '530326', 3, 'huizexian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2809, NULL, NULL, NULL, '2026-05-25 09:42:28.225366', '2026-05-25 09:42:28.225366', '宣威市', '530381', 3, 'xuanweishi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2810, NULL, NULL, NULL, '2026-05-25 09:42:28.235843', '2026-05-25 09:42:28.235843', '玉溪市', '5304', 2, 'yuxishi', 'Y', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2811, NULL, NULL, NULL, '2026-05-25 09:42:28.245725', '2026-05-25 09:42:28.245725', '红塔区', '530402', 3, 'hongtaqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2812, NULL, NULL, NULL, '2026-05-25 09:42:28.254721', '2026-05-25 09:42:28.254721', '江川区', '530403', 3, 'jiangchuanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2813, NULL, NULL, NULL, '2026-05-25 09:42:28.266723', '2026-05-25 09:42:28.266723', '通海县', '530423', 3, 'tonghaixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2814, NULL, NULL, NULL, '2026-05-25 09:42:28.275722', '2026-05-25 09:42:28.275722', '华宁县', '530424', 3, 'huaningxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2815, NULL, NULL, NULL, '2026-05-25 09:42:28.286862', '2026-05-25 09:42:28.286862', '易门县', '530425', 3, 'yimenxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2816, NULL, NULL, NULL, '2026-05-25 09:42:28.297651', '2026-05-25 09:42:28.297651', '峨山彝族自治县', '530426', 3, 'eshanyizuzizhixian', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2817, NULL, NULL, NULL, '2026-05-25 09:42:28.307776', '2026-05-25 09:42:28.307776', '新平彝族傣族自治县', '530427', 3, 'xinpingyizudaizuzizhixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2818, NULL, NULL, NULL, '2026-05-25 09:42:28.316776', '2026-05-25 09:42:28.316776', '元江哈尼族彝族傣族自治县', '530428', 3, 'yuanjianghanizuyizudaizuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2819, NULL, NULL, NULL, '2026-05-25 09:42:28.325779', '2026-05-25 09:42:28.325779', '澄江市', '530481', 3, 'chengjiangshi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2820, NULL, NULL, NULL, '2026-05-25 09:42:28.334695', '2026-05-25 09:42:28.334695', '保山市', '5305', 2, 'baoshanshi', 'B', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2821, NULL, NULL, NULL, '2026-05-25 09:42:28.344751', '2026-05-25 09:42:28.344751', '隆阳区', '530502', 3, 'longyangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2822, NULL, NULL, NULL, '2026-05-25 09:42:28.354426', '2026-05-25 09:42:28.354426', '施甸县', '530521', 3, 'shidianxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2823, NULL, NULL, NULL, '2026-05-25 09:42:28.366425', '2026-05-25 09:42:28.366425', '龙陵县', '530523', 3, 'longlingxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2824, NULL, NULL, NULL, '2026-05-25 09:42:28.376420', '2026-05-25 09:42:28.376420', '昌宁县', '530524', 3, 'changningxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2825, NULL, NULL, NULL, '2026-05-25 09:42:28.385031', '2026-05-25 09:42:28.385031', '腾冲市', '530581', 3, 'tengchongshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2826, NULL, NULL, NULL, '2026-05-25 09:42:28.394151', '2026-05-25 09:42:28.394151', '昭通市', '5306', 2, 'zhaotongshi', 'Z', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2827, NULL, NULL, NULL, '2026-05-25 09:42:28.405150', '2026-05-25 09:42:28.405150', '昭阳区', '530602', 3, 'zhaoyangqu', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2828, NULL, NULL, NULL, '2026-05-25 09:42:28.414150', '2026-05-25 09:42:28.414150', '鲁甸县', '530621', 3, 'ludianxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2829, NULL, NULL, NULL, '2026-05-25 09:42:28.422157', '2026-05-25 09:42:28.422157', '巧家县', '530622', 3, 'qiaojiaxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2830, NULL, NULL, NULL, '2026-05-25 09:42:28.430887', '2026-05-25 09:42:28.430887', '盐津县', '530623', 3, 'yanjinxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2831, NULL, NULL, NULL, '2026-05-25 09:42:28.438887', '2026-05-25 09:42:28.438887', '大关县', '530624', 3, 'daguanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2832, NULL, NULL, NULL, '2026-05-25 09:42:28.448938', '2026-05-25 09:42:28.448938', '永善县', '530625', 3, 'yongshanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2833, NULL, NULL, NULL, '2026-05-25 09:42:28.457976', '2026-05-25 09:42:28.457976', '绥江县', '530626', 3, 'suijiangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2834, NULL, NULL, NULL, '2026-05-25 09:42:28.465976', '2026-05-25 09:42:28.465976', '镇雄县', '530627', 3, 'zhenxiongxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2835, NULL, NULL, NULL, '2026-05-25 09:42:28.474975', '2026-05-25 09:42:28.474975', '彝良县', '530628', 3, 'yiliangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2836, NULL, NULL, NULL, '2026-05-25 09:42:28.484515', '2026-05-25 09:42:28.484515', '威信县', '530629', 3, 'weixinxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2837, NULL, NULL, NULL, '2026-05-25 09:42:28.493509', '2026-05-25 09:42:28.493509', '水富市', '530681', 3, 'shuifushi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2838, NULL, NULL, NULL, '2026-05-25 09:42:28.504558', '2026-05-25 09:42:28.504558', '丽江市', '5307', 2, 'lijiangshi', 'L', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2839, NULL, NULL, NULL, '2026-05-25 09:42:28.513559', '2026-05-25 09:42:28.513559', '古城区', '530702', 3, 'guchengqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2840, NULL, NULL, NULL, '2026-05-25 09:42:28.523559', '2026-05-25 09:42:28.523559', '玉龙纳西族自治县', '530721', 3, 'yulongnaxizuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2841, NULL, NULL, NULL, '2026-05-25 09:42:28.532566', '2026-05-25 09:42:28.532566', '永胜县', '530722', 3, 'yongshengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2842, NULL, NULL, NULL, '2026-05-25 09:42:28.543559', '2026-05-25 09:42:28.543559', '华坪县', '530723', 3, 'huapingxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2843, NULL, NULL, NULL, '2026-05-25 09:42:28.553559', '2026-05-25 09:42:28.553559', '宁蒗彝族自治县', '530724', 3, 'ninglangyizuzizhixian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2844, NULL, NULL, NULL, '2026-05-25 09:42:28.563559', '2026-05-25 09:42:28.563559', '普洱市', '5308', 2, 'puershi', 'P', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2845, NULL, NULL, NULL, '2026-05-25 09:42:28.571558', '2026-05-25 09:42:28.571558', '思茅区', '530802', 3, 'simaoqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2846, NULL, NULL, NULL, '2026-05-25 09:42:28.580558', '2026-05-25 09:42:28.580558', '宁洱哈尼族彝族自治县', '530821', 3, 'ningerhanizuyizuzizhixian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2847, NULL, NULL, NULL, '2026-05-25 09:42:28.592563', '2026-05-25 09:42:28.592563', '墨江哈尼族自治县', '530822', 3, 'mojianghanizuzizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2848, NULL, NULL, NULL, '2026-05-25 09:42:28.608558', '2026-05-25 09:42:28.608558', '景东彝族自治县', '530823', 3, 'jingdongyizuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2849, NULL, NULL, NULL, '2026-05-25 09:42:28.618559', '2026-05-25 09:42:28.618559', '景谷傣族彝族自治县', '530824', 3, 'jinggudaizuyizuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2850, NULL, NULL, NULL, '2026-05-25 09:42:28.629564', '2026-05-25 09:42:28.629564', '镇沅彝族哈尼族拉祜族自治县', '530825', 3, 'zhenyuanyizuhanizulahuzuzizhixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2851, NULL, NULL, NULL, '2026-05-25 09:42:28.640565', '2026-05-25 09:42:28.640565', '江城哈尼族彝族自治县', '530826', 3, 'jiangchenghanizuyizuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2852, NULL, NULL, NULL, '2026-05-25 09:42:28.652557', '2026-05-25 09:42:28.652557', '孟连傣族拉祜族佤族自治县', '530827', 3, 'mengliandaizulahuzuwazuzizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2853, NULL, NULL, NULL, '2026-05-25 09:42:28.669557', '2026-05-25 09:42:28.669557', '澜沧拉祜族自治县', '530828', 3, 'lancanglahuzuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2854, NULL, NULL, NULL, '2026-05-25 09:42:28.680559', '2026-05-25 09:42:28.680559', '西盟佤族自治县', '530829', 3, 'ximengwazuzizhixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2855, NULL, NULL, NULL, '2026-05-25 09:42:28.690558', '2026-05-25 09:42:28.690558', '临沧市', '5309', 2, 'lincangshi', 'L', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2856, NULL, NULL, NULL, '2026-05-25 09:42:28.700558', '2026-05-25 09:42:28.700558', '临翔区', '530902', 3, 'linxiangqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2857, NULL, NULL, NULL, '2026-05-25 09:42:28.710207', '2026-05-25 09:42:28.710207', '凤庆县', '530921', 3, 'fengqingxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2858, NULL, NULL, NULL, '2026-05-25 09:42:28.720406', '2026-05-25 09:42:28.720406', '云县', '530922', 3, 'yunxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2859, NULL, NULL, NULL, '2026-05-25 09:42:28.729504', '2026-05-25 09:42:28.729504', '永德县', '530923', 3, 'yongdexian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2860, NULL, NULL, NULL, '2026-05-25 09:42:28.739411', '2026-05-25 09:42:28.739411', '镇康县', '530924', 3, 'zhenkangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2861, NULL, NULL, NULL, '2026-05-25 09:42:28.747411', '2026-05-25 09:42:28.747411', '双江拉祜族佤族布朗族傣族自治县', '530925', 3, 'shuangjianglahuzuwazubulangzudaizuzizhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2862, NULL, NULL, NULL, '2026-05-25 09:42:28.755411', '2026-05-25 09:42:28.755411', '耿马傣族佤族自治县', '530926', 3, 'gengmadaizuwazuzizhixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2863, NULL, NULL, NULL, '2026-05-25 09:42:28.763411', '2026-05-25 09:42:28.763411', '沧源佤族自治县', '530927', 3, 'cangyuanwazuzizhixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2864, NULL, NULL, NULL, '2026-05-25 09:42:28.771521', '2026-05-25 09:42:28.771521', '楚雄彝族自治州', '5323', 2, 'chuxiongyizuzizhizhou', 'C', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2865, NULL, NULL, NULL, '2026-05-25 09:42:28.778521', '2026-05-25 09:42:28.778521', '楚雄市', '532301', 3, 'chuxiongshi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2866, NULL, NULL, NULL, '2026-05-25 09:42:28.787104', '2026-05-25 09:42:28.787104', '双柏县', '532322', 3, 'shuangbaixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2867, NULL, NULL, NULL, '2026-05-25 09:42:28.796179', '2026-05-25 09:42:28.796179', '牟定县', '532323', 3, 'moudingxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2868, NULL, NULL, NULL, '2026-05-25 09:42:28.804660', '2026-05-25 09:42:28.804660', '南华县', '532324', 3, 'nanhuaxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2869, NULL, NULL, NULL, '2026-05-25 09:42:28.812660', '2026-05-25 09:42:28.812660', '姚安县', '532325', 3, 'yaoanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2870, NULL, NULL, NULL, '2026-05-25 09:42:28.824002', '2026-05-25 09:42:28.824002', '大姚县', '532326', 3, 'dayaoxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2871, NULL, NULL, NULL, '2026-05-25 09:42:28.832836', '2026-05-25 09:42:28.832836', '永仁县', '532327', 3, 'yongrenxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2872, NULL, NULL, NULL, '2026-05-25 09:42:28.840837', '2026-05-25 09:42:28.840837', '元谋县', '532328', 3, 'yuanmouxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2873, NULL, NULL, NULL, '2026-05-25 09:42:28.848888', '2026-05-25 09:42:28.848888', '武定县', '532329', 3, 'wudingxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2874, NULL, NULL, NULL, '2026-05-25 09:42:28.856936', '2026-05-25 09:42:28.856936', '禄丰县', '532331', 3, 'lufengxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2875, NULL, NULL, NULL, '2026-05-25 09:42:28.864936', '2026-05-25 09:42:28.864936', '红河哈尼族彝族自治州', '5325', 2, 'honghehanizuyizuzizhizhou', 'H', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2876, NULL, NULL, NULL, '2026-05-25 09:42:28.873937', '2026-05-25 09:42:28.873937', '个旧市', '532501', 3, 'gejiushi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2877, NULL, NULL, NULL, '2026-05-25 09:42:28.885949', '2026-05-25 09:42:28.885949', '开远市', '532502', 3, 'kaiyuanshi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2878, NULL, NULL, NULL, '2026-05-25 09:42:28.893943', '2026-05-25 09:42:28.893943', '蒙自市', '532503', 3, 'mengzishi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2879, NULL, NULL, NULL, '2026-05-25 09:42:28.905218', '2026-05-25 09:42:28.905218', '弥勒市', '532504', 3, 'mileshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2880, NULL, NULL, NULL, '2026-05-25 09:42:28.914962', '2026-05-25 09:42:28.914962', '屏边苗族自治县', '532523', 3, 'pingbianmiaozuzizhixian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2881, NULL, NULL, NULL, '2026-05-25 09:42:28.925975', '2026-05-25 09:42:28.925975', '建水县', '532524', 3, 'jianshuixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2882, NULL, NULL, NULL, '2026-05-25 09:42:28.935479', '2026-05-25 09:42:28.935479', '石屏县', '532525', 3, 'shipingxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2883, NULL, NULL, NULL, '2026-05-25 09:42:28.944485', '2026-05-25 09:42:28.944485', '泸西县', '532527', 3, 'luxixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2884, NULL, NULL, NULL, '2026-05-25 09:42:28.954028', '2026-05-25 09:42:28.954028', '元阳县', '532528', 3, 'yuanyangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2885, NULL, NULL, NULL, '2026-05-25 09:42:28.968872', '2026-05-25 09:42:28.968872', '红河县', '532529', 3, 'honghexian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2886, NULL, NULL, NULL, '2026-05-25 09:42:28.977610', '2026-05-25 09:42:28.977610', '金平苗族瑶族傣族自治县', '532530', 3, 'jinpingmiaozuyaozudaizuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2887, NULL, NULL, NULL, '2026-05-25 09:42:28.986923', '2026-05-25 09:42:28.986923', '绿春县', '532531', 3, 'lvchunxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2888, NULL, NULL, NULL, '2026-05-25 09:42:28.995166', '2026-05-25 09:42:28.995166', '河口瑶族自治县', '532532', 3, 'hekouyaozuzizhixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2889, NULL, NULL, NULL, '2026-05-25 09:42:29.001814', '2026-05-25 09:42:29.001814', '文山壮族苗族自治州', '5326', 2, 'wenshanzhuangzumiaozuzizhizhou', 'W', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2890, NULL, NULL, NULL, '2026-05-25 09:42:29.009815', '2026-05-25 09:42:29.009815', '文山市', '532601', 3, 'wenshanshi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2891, NULL, NULL, NULL, '2026-05-25 09:42:29.018814', '2026-05-25 09:42:29.018814', '砚山县', '532622', 3, 'yanshanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2892, NULL, NULL, NULL, '2026-05-25 09:42:29.026815', '2026-05-25 09:42:29.026815', '西畴县', '532623', 3, 'xichouxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2893, NULL, NULL, NULL, '2026-05-25 09:42:29.035843', '2026-05-25 09:42:29.035843', '麻栗坡县', '532624', 3, 'malipoxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2894, NULL, NULL, NULL, '2026-05-25 09:42:29.043889', '2026-05-25 09:42:29.043889', '马关县', '532625', 3, 'maguanxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2895, NULL, NULL, NULL, '2026-05-25 09:42:29.052904', '2026-05-25 09:42:29.052904', '丘北县', '532626', 3, 'qiubeixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2896, NULL, NULL, NULL, '2026-05-25 09:42:29.061904', '2026-05-25 09:42:29.061904', '广南县', '532627', 3, 'guangnanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2897, NULL, NULL, NULL, '2026-05-25 09:42:29.073806', '2026-05-25 09:42:29.073806', '富宁县', '532628', 3, 'funingxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2898, NULL, NULL, NULL, '2026-05-25 09:42:29.081806', '2026-05-25 09:42:29.081806', '西双版纳傣族自治州', '5328', 2, 'xishuangbannadaizuzizhizhou', 'X', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2899, NULL, NULL, NULL, '2026-05-25 09:42:29.090808', '2026-05-25 09:42:29.090808', '景洪市', '532801', 3, 'jinghongshi', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2900, NULL, NULL, NULL, '2026-05-25 09:42:29.101110', '2026-05-25 09:42:29.101110', '勐海县', '532822', 3, 'menghaixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2901, NULL, NULL, NULL, '2026-05-25 09:42:29.108635', '2026-05-25 09:42:29.108635', '勐腊县', '532823', 3, 'menglaxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2902, NULL, NULL, NULL, '2026-05-25 09:42:29.119454', '2026-05-25 09:42:29.119454', '大理白族自治州', '5329', 2, 'dalibaizuzizhizhou', 'D', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2903, NULL, NULL, NULL, '2026-05-25 09:42:29.127729', '2026-05-25 09:42:29.127729', '大理市', '532901', 3, 'dalishi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2904, NULL, NULL, NULL, '2026-05-25 09:42:29.135735', '2026-05-25 09:42:29.135735', '漾濞彝族自治县', '532922', 3, 'yangbiyizuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2905, NULL, NULL, NULL, '2026-05-25 09:42:29.143737', '2026-05-25 09:42:29.143737', '祥云县', '532923', 3, 'xiangyunxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2906, NULL, NULL, NULL, '2026-05-25 09:42:29.151736', '2026-05-25 09:42:29.151736', '宾川县', '532924', 3, 'binchuanxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2907, NULL, NULL, NULL, '2026-05-25 09:42:29.159684', '2026-05-25 09:42:29.159684', '弥渡县', '532925', 3, 'miduxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2908, NULL, NULL, NULL, '2026-05-25 09:42:29.170682', '2026-05-25 09:42:29.170682', '南涧彝族自治县', '532926', 3, 'nanjianyizuzizhixian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2909, NULL, NULL, NULL, '2026-05-25 09:42:29.181196', '2026-05-25 09:42:29.181196', '巍山彝族回族自治县', '532927', 3, 'weishanyizuhuizuzizhixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2910, NULL, NULL, NULL, '2026-05-25 09:42:29.190195', '2026-05-25 09:42:29.190195', '永平县', '532928', 3, 'yongpingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2911, NULL, NULL, NULL, '2026-05-25 09:42:29.198140', '2026-05-25 09:42:29.198140', '云龙县', '532929', 3, 'yunlongxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2912, NULL, NULL, NULL, '2026-05-25 09:42:29.207141', '2026-05-25 09:42:29.207141', '洱源县', '532930', 3, 'eryuanxian', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2913, NULL, NULL, NULL, '2026-05-25 09:42:29.215141', '2026-05-25 09:42:29.215141', '剑川县', '532931', 3, 'jianchuanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2914, NULL, NULL, NULL, '2026-05-25 09:42:29.223141', '2026-05-25 09:42:29.223141', '鹤庆县', '532932', 3, 'heqingxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2915, NULL, NULL, NULL, '2026-05-25 09:42:29.231140', '2026-05-25 09:42:29.231140', '德宏傣族景颇族自治州', '5331', 2, 'dehongdaizujingpozuzizhizhou', 'D', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2916, NULL, NULL, NULL, '2026-05-25 09:42:29.243141', '2026-05-25 09:42:29.243141', '瑞丽市', '533102', 3, 'ruilishi', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2917, NULL, NULL, NULL, '2026-05-25 09:42:29.251141', '2026-05-25 09:42:29.251141', '芒市', '533103', 3, 'mangshi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2918, NULL, NULL, NULL, '2026-05-25 09:42:29.263140', '2026-05-25 09:42:29.263140', '梁河县', '533122', 3, 'lianghexian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2919, NULL, NULL, NULL, '2026-05-25 09:42:29.270293', '2026-05-25 09:42:29.270293', '盈江县', '533123', 3, 'yingjiangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2920, NULL, NULL, NULL, '2026-05-25 09:42:29.278491', '2026-05-25 09:42:29.278491', '陇川县', '533124', 3, 'longchuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2921, NULL, NULL, NULL, '2026-05-25 09:42:29.283485', '2026-05-25 09:42:29.283485', '怒江傈僳族自治州', '5333', 2, 'nujianglisuzuzizhizhou', 'N', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2922, NULL, NULL, NULL, '2026-05-25 09:42:29.292491', '2026-05-25 09:42:29.292491', '泸水市', '533301', 3, 'lushuishi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2923, NULL, NULL, NULL, '2026-05-25 09:42:29.300898', '2026-05-25 09:42:29.300898', '福贡县', '533323', 3, 'fugongxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2924, NULL, NULL, NULL, '2026-05-25 09:42:29.311179', '2026-05-25 09:42:29.311179', '贡山独龙族怒族自治县', '533324', 3, 'gongshandulongzunuzuzizhixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2925, NULL, NULL, NULL, '2026-05-25 09:42:29.320455', '2026-05-25 09:42:29.320455', '兰坪白族普米族自治县', '533325', 3, 'lanpingbaizupumizuzizhixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2926, NULL, NULL, NULL, '2026-05-25 09:42:29.327242', '2026-05-25 09:42:29.327242', '迪庆藏族自治州', '5334', 2, 'diqingzangzuzizhizhou', 'D', 1, NULL, '130129');
INSERT INTO `dvadmin_system_area` VALUES (2927, NULL, NULL, NULL, '2026-05-25 09:42:29.336745', '2026-05-25 09:42:29.336745', '香格里拉市', '533401', 3, 'xianggelilashi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2928, NULL, NULL, NULL, '2026-05-25 09:42:29.344869', '2026-05-25 09:42:29.344869', '德钦县', '533422', 3, 'deqinxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2929, NULL, NULL, NULL, '2026-05-25 09:42:29.352870', '2026-05-25 09:42:29.352870', '维西傈僳族自治县', '533423', 3, 'weixilisuzuzizhixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2930, NULL, NULL, NULL, '2026-05-25 09:42:29.358899', '2026-04-03 10:10:05.066000', '西藏自治区', '54', 1, 'xizangzizhiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2931, NULL, NULL, NULL, '2026-05-25 09:42:29.365957', '2026-05-25 09:42:29.365957', '拉萨市', '5401', 2, 'lasashi', 'L', 1, NULL, '130130');
INSERT INTO `dvadmin_system_area` VALUES (2932, NULL, NULL, NULL, '2026-05-25 09:42:29.373113', '2026-05-25 09:42:29.373113', '城关区', '540102', 3, 'chengguanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2933, NULL, NULL, NULL, '2026-05-25 09:42:29.380113', '2026-05-25 09:42:29.380113', '堆龙德庆区', '540103', 3, 'duilongdeqingqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2934, NULL, NULL, NULL, '2026-05-25 09:42:29.387112', '2026-05-25 09:42:29.387112', '达孜区', '540104', 3, 'daziqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2935, NULL, NULL, NULL, '2026-05-25 09:42:29.394109', '2026-05-25 09:42:29.394109', '林周县', '540121', 3, 'linzhouxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2936, NULL, NULL, NULL, '2026-05-25 09:42:29.402112', '2026-05-25 09:42:29.402112', '当雄县', '540122', 3, 'dangxiongxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2937, NULL, NULL, NULL, '2026-05-25 09:42:29.411112', '2026-05-25 09:42:29.411112', '尼木县', '540123', 3, 'nimuxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2938, NULL, NULL, NULL, '2026-05-25 09:42:29.419112', '2026-05-25 09:42:29.419112', '曲水县', '540124', 3, 'qushuixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2939, NULL, NULL, NULL, '2026-05-25 09:42:29.428177', '2026-05-25 09:42:29.428177', '墨竹工卡县', '540127', 3, 'mozhugongkaxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2940, NULL, NULL, NULL, '2026-05-25 09:42:29.435177', '2026-05-25 09:42:29.435177', '格尔木藏青工业园区', '540171', 3, 'geermuzangqinggongyeyuanqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2941, NULL, NULL, NULL, '2026-05-25 09:42:29.444877', '2026-05-25 09:42:29.444877', '拉萨经济技术开发区', '540172', 3, 'lasajingjijishukaifaqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2942, NULL, NULL, NULL, '2026-05-25 09:42:29.453406', '2026-05-25 09:42:29.453406', '西藏文化旅游创意园区', '540173', 3, 'xizangwenhualvyouchuangyiyuanqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2943, NULL, NULL, NULL, '2026-05-25 09:42:29.463994', '2026-05-25 09:42:29.463994', '达孜工业园区', '540174', 3, 'dazigongyeyuanqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2944, NULL, NULL, NULL, '2026-05-25 09:42:29.473987', '2026-05-25 09:42:29.473987', '日喀则市', '5402', 2, 'rikazeshi', 'R', 1, NULL, '130130');
INSERT INTO `dvadmin_system_area` VALUES (2945, NULL, NULL, NULL, '2026-05-25 09:42:29.481987', '2026-05-25 09:42:29.481987', '桑珠孜区', '540202', 3, 'sangzhuziqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2946, NULL, NULL, NULL, '2026-05-25 09:42:29.488993', '2026-05-25 09:42:29.488993', '南木林县', '540221', 3, 'nanmulinxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2947, NULL, NULL, NULL, '2026-05-25 09:42:29.495987', '2026-05-25 09:42:29.495987', '江孜县', '540222', 3, 'jiangzixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2948, NULL, NULL, NULL, '2026-05-25 09:42:29.500990', '2026-05-25 09:42:29.500990', '定日县', '540223', 3, 'dingrixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2949, NULL, NULL, NULL, '2026-05-25 09:42:29.507458', '2026-05-25 09:42:29.507458', '萨迦县', '540224', 3, 'sajiaxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2950, NULL, NULL, NULL, '2026-05-25 09:42:29.513462', '2026-05-25 09:42:29.513462', '拉孜县', '540225', 3, 'lazixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2951, NULL, NULL, NULL, '2026-05-25 09:42:29.519462', '2026-05-25 09:42:29.519462', '昂仁县', '540226', 3, 'angrenxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2952, NULL, NULL, NULL, '2026-05-25 09:42:29.525465', '2026-05-25 09:42:29.525465', '谢通门县', '540227', 3, 'xietongmenxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2953, NULL, NULL, NULL, '2026-05-25 09:42:29.530463', '2026-05-25 09:42:29.530463', '白朗县', '540228', 3, 'bailangxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2954, NULL, NULL, NULL, '2026-05-25 09:42:29.539468', '2026-05-25 09:42:29.539468', '仁布县', '540229', 3, 'renbuxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2955, NULL, NULL, NULL, '2026-05-25 09:42:29.548471', '2026-05-25 09:42:29.548471', '康马县', '540230', 3, 'kangmaxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2956, NULL, NULL, NULL, '2026-05-25 09:42:29.557468', '2026-05-25 09:42:29.557468', '定结县', '540231', 3, 'dingjiexian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2957, NULL, NULL, NULL, '2026-05-25 09:42:29.565469', '2026-05-25 09:42:29.566468', '仲巴县', '540232', 3, 'zhongbaxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2958, NULL, NULL, NULL, '2026-05-25 09:42:29.574469', '2026-05-25 09:42:29.574469', '亚东县', '540233', 3, 'yadongxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2959, NULL, NULL, NULL, '2026-05-25 09:42:29.581469', '2026-05-25 09:42:29.581469', '吉隆县', '540234', 3, 'jilongxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2960, NULL, NULL, NULL, '2026-05-25 09:42:29.589464', '2026-05-25 09:42:29.589464', '聂拉木县', '540235', 3, 'nielamuxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2961, NULL, NULL, NULL, '2026-05-25 09:42:29.596475', '2026-05-25 09:42:29.596475', '萨嘎县', '540236', 3, 'sagaxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2962, NULL, NULL, NULL, '2026-05-25 09:42:29.604472', '2026-05-25 09:42:29.604472', '岗巴县', '540237', 3, 'gangbaxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2963, NULL, NULL, NULL, '2026-05-25 09:42:29.615464', '2026-05-25 09:42:29.615464', '昌都市', '5403', 2, 'changdushi', 'C', 1, NULL, '130130');
INSERT INTO `dvadmin_system_area` VALUES (2964, NULL, NULL, NULL, '2026-05-25 09:42:29.624463', '2026-05-25 09:42:29.624463', '卡若区', '540302', 3, 'karuoqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2965, NULL, NULL, NULL, '2026-05-25 09:42:29.635468', '2026-05-25 09:42:29.635468', '江达县', '540321', 3, 'jiangdaxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2966, NULL, NULL, NULL, '2026-05-25 09:42:29.643468', '2026-05-25 09:42:29.643468', '贡觉县', '540322', 3, 'gongjuexian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2967, NULL, NULL, NULL, '2026-05-25 09:42:29.651473', '2026-05-25 09:42:29.651473', '类乌齐县', '540323', 3, 'leiwuqixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2968, NULL, NULL, NULL, '2026-05-25 09:42:29.658464', '2026-05-25 09:42:29.658464', '丁青县', '540324', 3, 'dingqingxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2969, NULL, NULL, NULL, '2026-05-25 09:42:29.671468', '2026-05-25 09:42:29.671468', '察雅县', '540325', 3, 'chayaxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2970, NULL, NULL, NULL, '2026-05-25 09:42:29.681966', '2026-05-25 09:42:29.681966', '八宿县', '540326', 3, 'basuxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2971, NULL, NULL, NULL, '2026-05-25 09:42:29.688966', '2026-05-25 09:42:29.688966', '左贡县', '540327', 3, 'zuogongxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2972, NULL, NULL, NULL, '2026-05-25 09:42:29.698966', '2026-05-25 09:42:29.698966', '芒康县', '540328', 3, 'mangkangxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2973, NULL, NULL, NULL, '2026-05-25 09:42:29.706839', '2026-05-25 09:42:29.706839', '洛隆县', '540329', 3, 'luolongxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2974, NULL, NULL, NULL, '2026-05-25 09:42:29.714908', '2026-05-25 09:42:29.714908', '边坝县', '540330', 3, 'bianbaxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2975, NULL, NULL, NULL, '2026-05-25 09:42:29.722053', '2026-05-25 09:42:29.722053', '林芝市', '5404', 2, 'linzhishi', 'L', 1, NULL, '130130');
INSERT INTO `dvadmin_system_area` VALUES (2976, NULL, NULL, NULL, '2026-05-25 09:42:29.728101', '2026-05-25 09:42:29.728101', '巴宜区', '540402', 3, 'bayiqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2977, NULL, NULL, NULL, '2026-05-25 09:42:29.734770', '2026-05-25 09:42:29.734770', '工布江达县', '540421', 3, 'gongbujiangdaxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2978, NULL, NULL, NULL, '2026-05-25 09:42:29.743764', '2026-05-25 09:42:29.743764', '米林县', '540422', 3, 'milinxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2979, NULL, NULL, NULL, '2026-05-25 09:42:29.753770', '2026-05-25 09:42:29.753770', '墨脱县', '540423', 3, 'motuoxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2980, NULL, NULL, NULL, '2026-05-25 09:42:29.761769', '2026-05-25 09:42:29.761769', '波密县', '540424', 3, 'bomixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2981, NULL, NULL, NULL, '2026-05-25 09:42:29.770772', '2026-05-25 09:42:29.770772', '察隅县', '540425', 3, 'chayuxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2982, NULL, NULL, NULL, '2026-05-25 09:42:29.779769', '2026-05-25 09:42:29.779769', '朗县', '540426', 3, 'langxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2983, NULL, NULL, NULL, '2026-05-25 09:42:29.786982', '2026-05-25 09:42:29.786982', '山南市', '5405', 2, 'shannanshi', 'S', 1, NULL, '130130');
INSERT INTO `dvadmin_system_area` VALUES (2984, NULL, NULL, NULL, '2026-05-25 09:42:29.794024', '2026-05-25 09:42:29.794024', '乃东区', '540502', 3, 'naidongqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2985, NULL, NULL, NULL, '2026-05-25 09:42:29.800024', '2026-05-25 09:42:29.800024', '扎囊县', '540521', 3, 'zhanangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2986, NULL, NULL, NULL, '2026-05-25 09:42:29.807024', '2026-05-25 09:42:29.808024', '贡嘎县', '540522', 3, 'gonggaxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2987, NULL, NULL, NULL, '2026-05-25 09:42:29.816026', '2026-05-25 09:42:29.816026', '桑日县', '540523', 3, 'sangrixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2988, NULL, NULL, NULL, '2026-05-25 09:42:29.825025', '2026-05-25 09:42:29.825025', '琼结县', '540524', 3, 'qiongjiexian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2989, NULL, NULL, NULL, '2026-05-25 09:42:29.831238', '2026-05-25 09:42:29.831238', '曲松县', '540525', 3, 'qusongxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2990, NULL, NULL, NULL, '2026-05-25 09:42:29.839240', '2026-05-25 09:42:29.839240', '措美县', '540526', 3, 'cuomeixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2991, NULL, NULL, NULL, '2026-05-25 09:42:29.845967', '2026-05-25 09:42:29.845967', '洛扎县', '540527', 3, 'luozhaxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2992, NULL, NULL, NULL, '2026-05-25 09:42:29.854967', '2026-05-25 09:42:29.854967', '加查县', '540528', 3, 'jiachaxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2993, NULL, NULL, NULL, '2026-05-25 09:42:29.863011', '2026-05-25 09:42:29.863011', '隆子县', '540529', 3, 'longzixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2994, NULL, NULL, NULL, '2026-05-25 09:42:29.877065', '2026-05-25 09:42:29.877065', '错那县', '540530', 3, 'cuonaxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2995, NULL, NULL, NULL, '2026-05-25 09:42:29.886062', '2026-05-25 09:42:29.886062', '浪卡子县', '540531', 3, 'langqiazixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2996, NULL, NULL, NULL, '2026-05-25 09:42:29.899060', '2026-05-25 09:42:29.899060', '那曲市', '5406', 2, 'naqushi', 'N', 1, NULL, '130130');
INSERT INTO `dvadmin_system_area` VALUES (2997, NULL, NULL, NULL, '2026-05-25 09:42:29.909060', '2026-05-25 09:42:29.909060', '色尼区', '540602', 3, 'seniqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2998, NULL, NULL, NULL, '2026-05-25 09:42:29.918060', '2026-05-25 09:42:29.918060', '嘉黎县', '540621', 3, 'jialixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (2999, NULL, NULL, NULL, '2026-05-25 09:42:29.925061', '2026-05-25 09:42:29.925061', '比如县', '540622', 3, 'biruxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3000, NULL, NULL, NULL, '2026-05-25 09:42:29.933060', '2026-05-25 09:42:29.933060', '聂荣县', '540623', 3, 'nierongxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3001, NULL, NULL, NULL, '2026-05-25 09:42:29.942060', '2026-05-25 09:42:29.942060', '安多县', '540624', 3, 'anduoxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3002, NULL, NULL, NULL, '2026-05-25 09:42:29.950053', '2026-05-25 09:42:29.950053', '申扎县', '540625', 3, 'shenzhaxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3003, NULL, NULL, NULL, '2026-05-25 09:42:29.958053', '2026-05-25 09:42:29.958053', '索县', '540626', 3, 'suoxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3004, NULL, NULL, NULL, '2026-05-25 09:42:29.966060', '2026-05-25 09:42:29.966060', '班戈县', '540627', 3, 'bangexian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3005, NULL, NULL, NULL, '2026-05-25 09:42:29.975056', '2026-05-25 09:42:29.975056', '巴青县', '540628', 3, 'baqingxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3006, NULL, NULL, NULL, '2026-05-25 09:42:29.982060', '2026-05-25 09:42:29.982060', '尼玛县', '540629', 3, 'nimaxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3007, NULL, NULL, NULL, '2026-05-25 09:42:29.990054', '2026-05-25 09:42:29.990054', '双湖县', '540630', 3, 'shuanghuxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3008, NULL, NULL, NULL, '2026-05-25 09:42:29.998769', '2026-05-25 09:42:29.998769', '阿里地区', '5425', 2, 'alidiqu', 'A', 1, NULL, '130130');
INSERT INTO `dvadmin_system_area` VALUES (3009, NULL, NULL, NULL, '2026-05-25 09:42:30.007620', '2026-05-25 09:42:30.007620', '普兰县', '542521', 3, 'pulanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3010, NULL, NULL, NULL, '2026-05-25 09:42:30.014883', '2026-05-25 09:42:30.014883', '札达县', '542522', 3, 'zhadaxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3011, NULL, NULL, NULL, '2026-05-25 09:42:30.021887', '2026-05-25 09:42:30.021887', '噶尔县', '542523', 3, 'gaerxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3012, NULL, NULL, NULL, '2026-05-25 09:42:30.030929', '2026-05-25 09:42:30.030929', '日土县', '542524', 3, 'rituxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3013, NULL, NULL, NULL, '2026-05-25 09:42:30.036218', '2026-05-25 09:42:30.036218', '革吉县', '542525', 3, 'gejixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3014, NULL, NULL, NULL, '2026-05-25 09:42:30.044214', '2026-05-25 09:42:30.044214', '改则县', '542526', 3, 'gaizexian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3015, NULL, NULL, NULL, '2026-05-25 09:42:30.052208', '2026-05-25 09:42:30.052208', '措勤县', '542527', 3, 'cuoqinxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3016, NULL, NULL, NULL, '2026-05-25 09:42:30.059631', '2026-04-03 10:10:05.069000', '陕西省', '61', 1, 'shanxisheng', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3017, NULL, NULL, NULL, '2026-05-25 09:42:30.069133', '2026-05-25 09:42:30.069133', '西安市', '6101', 2, 'xianshi', 'X', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3018, NULL, NULL, NULL, '2026-05-25 09:42:30.078176', '2026-05-25 09:42:30.078176', '新城区', '610102', 3, 'xinchengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3019, NULL, NULL, NULL, '2026-05-25 09:42:30.086084', '2026-05-25 09:42:30.086084', '碑林区', '610103', 3, 'beilinqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3020, NULL, NULL, NULL, '2026-05-25 09:42:30.095438', '2026-05-25 09:42:30.095438', '莲湖区', '610104', 3, 'lianhuqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3021, NULL, NULL, NULL, '2026-05-25 09:42:30.102928', '2026-05-25 09:42:30.102928', '灞桥区', '610111', 3, 'baqiaoqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3022, NULL, NULL, NULL, '2026-05-25 09:42:30.109133', '2026-05-25 09:42:30.109133', '未央区', '610112', 3, 'weiyangqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3023, NULL, NULL, NULL, '2026-05-25 09:42:30.119829', '2026-05-25 09:42:30.119829', '雁塔区', '610113', 3, 'yantaqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3024, NULL, NULL, NULL, '2026-05-25 09:42:30.132207', '2026-05-25 09:42:30.132207', '阎良区', '610114', 3, 'yanliangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3025, NULL, NULL, NULL, '2026-05-25 09:42:30.138978', '2026-05-25 09:42:30.138978', '临潼区', '610115', 3, 'lintongqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3026, NULL, NULL, NULL, '2026-05-25 09:42:30.145474', '2026-05-25 09:42:30.145474', '长安区', '610116', 3, 'changanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3027, NULL, NULL, NULL, '2026-05-25 09:42:30.154489', '2026-05-25 09:42:30.154489', '高陵区', '610117', 3, 'gaolingqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3028, NULL, NULL, NULL, '2026-05-25 09:42:30.162481', '2026-05-25 09:42:30.162481', '鄠邑区', '610118', 3, 'huyiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3029, NULL, NULL, NULL, '2026-05-25 09:42:30.170488', '2026-05-25 09:42:30.170488', '蓝田县', '610122', 3, 'lantianxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3030, NULL, NULL, NULL, '2026-05-25 09:42:30.178475', '2026-05-25 09:42:30.178475', '周至县', '610124', 3, 'zhouzhixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3031, NULL, NULL, NULL, '2026-05-25 09:42:30.186507', '2026-05-25 09:42:30.186507', '铜川市', '6102', 2, 'tongchuanshi', 'T', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3032, NULL, NULL, NULL, '2026-05-25 09:42:30.193506', '2026-05-25 09:42:30.193506', '王益区', '610202', 3, 'wangyiqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3033, NULL, NULL, NULL, '2026-05-25 09:42:30.202508', '2026-05-25 09:42:30.202508', '印台区', '610203', 3, 'yintaiqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3034, NULL, NULL, NULL, '2026-05-25 09:42:30.209506', '2026-05-25 09:42:30.209506', '耀州区', '610204', 3, 'yaozhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3035, NULL, NULL, NULL, '2026-05-25 09:42:30.218507', '2026-05-25 09:42:30.218507', '宜君县', '610222', 3, 'yijunxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3036, NULL, NULL, NULL, '2026-05-25 09:42:30.227508', '2026-05-25 09:42:30.227508', '宝鸡市', '6103', 2, 'baojishi', 'B', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3037, NULL, NULL, NULL, '2026-05-25 09:42:30.236506', '2026-05-25 09:42:30.236506', '渭滨区', '610302', 3, 'weibinqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3038, NULL, NULL, NULL, '2026-05-25 09:42:30.244507', '2026-05-25 09:42:30.244507', '金台区', '610303', 3, 'jintaiqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3039, NULL, NULL, NULL, '2026-05-25 09:42:30.252508', '2026-05-25 09:42:30.252508', '陈仓区', '610304', 3, 'chencangqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3040, NULL, NULL, NULL, '2026-05-25 09:42:30.262507', '2026-05-25 09:42:30.262507', '凤翔县', '610322', 3, 'fengxiangxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3041, NULL, NULL, NULL, '2026-05-25 09:42:30.272508', '2026-05-25 09:42:30.272508', '岐山县', '610323', 3, 'qishanxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3042, NULL, NULL, NULL, '2026-05-25 09:42:30.280508', '2026-05-25 09:42:30.280508', '扶风县', '610324', 3, 'fufengxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3043, NULL, NULL, NULL, '2026-05-25 09:42:30.290509', '2026-05-25 09:42:30.290509', '眉县', '610326', 3, 'meixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3044, NULL, NULL, NULL, '2026-05-25 09:42:30.298508', '2026-05-25 09:42:30.298508', '陇县', '610327', 3, 'longxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3045, NULL, NULL, NULL, '2026-05-25 09:42:30.309510', '2026-05-25 09:42:30.309510', '千阳县', '610328', 3, 'qianyangxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3046, NULL, NULL, NULL, '2026-05-25 09:42:30.320508', '2026-05-25 09:42:30.320508', '麟游县', '610329', 3, 'linyouxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3047, NULL, NULL, NULL, '2026-05-25 09:42:30.329507', '2026-05-25 09:42:30.329507', '凤县', '610330', 3, 'fengxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3048, NULL, NULL, NULL, '2026-05-25 09:42:30.338507', '2026-05-25 09:42:30.338507', '太白县', '610331', 3, 'taibaixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3049, NULL, NULL, NULL, '2026-05-25 09:42:30.349508', '2026-05-25 09:42:30.349508', '咸阳市', '6104', 2, 'xianyangshi', 'X', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3050, NULL, NULL, NULL, '2026-05-25 09:42:30.357508', '2026-05-25 09:42:30.357508', '秦都区', '610402', 3, 'qindouqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3051, NULL, NULL, NULL, '2026-05-25 09:42:30.365508', '2026-05-25 09:42:30.365508', '杨陵区', '610403', 3, 'yanglingqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3052, NULL, NULL, NULL, '2026-05-25 09:42:30.375895', '2026-05-25 09:42:30.376422', '渭城区', '610404', 3, 'weichengqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3053, NULL, NULL, NULL, '2026-05-25 09:42:30.388179', '2026-05-25 09:42:30.388179', '三原县', '610422', 3, 'sanyuanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3054, NULL, NULL, NULL, '2026-05-25 09:42:30.397179', '2026-05-25 09:42:30.397179', '泾阳县', '610423', 3, 'jingyangxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3055, NULL, NULL, NULL, '2026-05-25 09:42:30.408691', '2026-05-25 09:42:30.408691', '乾县', '610424', 3, 'qianxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3056, NULL, NULL, NULL, '2026-05-25 09:42:30.417696', '2026-05-25 09:42:30.417696', '礼泉县', '610425', 3, 'liquanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3057, NULL, NULL, NULL, '2026-05-25 09:42:30.429697', '2026-05-25 09:42:30.429697', '永寿县', '610426', 3, 'yongshouxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3058, NULL, NULL, NULL, '2026-05-25 09:42:30.441144', '2026-05-25 09:42:30.441144', '长武县', '610428', 3, 'zhangwuxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3059, NULL, NULL, NULL, '2026-05-25 09:42:30.451181', '2026-05-25 09:42:30.451181', '旬邑县', '610429', 3, 'xunyixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3060, NULL, NULL, NULL, '2026-05-25 09:42:30.460179', '2026-05-25 09:42:30.460179', '淳化县', '610430', 3, 'chunhuaxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3061, NULL, NULL, NULL, '2026-05-25 09:42:30.468181', '2026-05-25 09:42:30.468181', '武功县', '610431', 3, 'wugongxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3062, NULL, NULL, NULL, '2026-05-25 09:42:30.476186', '2026-05-25 09:42:30.476186', '兴平市', '610481', 3, 'xingpingshi', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3063, NULL, NULL, NULL, '2026-05-25 09:42:30.484179', '2026-05-25 09:42:30.484179', '彬州市', '610482', 3, 'binzhoushi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3064, NULL, NULL, NULL, '2026-05-25 09:42:30.494179', '2026-05-25 09:42:30.494179', '渭南市', '6105', 2, 'weinanshi', 'W', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3065, NULL, NULL, NULL, '2026-05-25 09:42:30.502180', '2026-05-25 09:42:30.502180', '临渭区', '610502', 3, 'linweiqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3066, NULL, NULL, NULL, '2026-05-25 09:42:30.511181', '2026-05-25 09:42:30.511181', '华州区', '610503', 3, 'huazhouqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3067, NULL, NULL, NULL, '2026-05-25 09:42:30.520181', '2026-05-25 09:42:30.520181', '潼关县', '610522', 3, 'tongguanxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3068, NULL, NULL, NULL, '2026-05-25 09:42:30.528451', '2026-05-25 09:42:30.528451', '大荔县', '610523', 3, 'dalixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3069, NULL, NULL, NULL, '2026-05-25 09:42:30.536851', '2026-05-25 09:42:30.536851', '合阳县', '610524', 3, 'heyangxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3070, NULL, NULL, NULL, '2026-05-25 09:42:30.546024', '2026-05-25 09:42:30.546024', '澄城县', '610525', 3, 'chengchengxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3071, NULL, NULL, NULL, '2026-05-25 09:42:30.553019', '2026-05-25 09:42:30.553019', '蒲城县', '610526', 3, 'puchengxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3072, NULL, NULL, NULL, '2026-05-25 09:42:30.559997', '2026-05-25 09:42:30.559997', '白水县', '610527', 3, 'baishuixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3073, NULL, NULL, NULL, '2026-05-25 09:42:30.568996', '2026-05-25 09:42:30.568996', '富平县', '610528', 3, 'fupingxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3074, NULL, NULL, NULL, '2026-05-25 09:42:30.577512', '2026-05-25 09:42:30.577512', '韩城市', '610581', 3, 'hanchengshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3075, NULL, NULL, NULL, '2026-05-25 09:42:30.585007', '2026-05-25 09:42:30.585007', '华阴市', '610582', 3, 'huayinshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3076, NULL, NULL, NULL, '2026-05-25 09:42:30.594011', '2026-05-25 09:42:30.594011', '延安市', '6106', 2, 'yananshi', 'Y', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3077, NULL, NULL, NULL, '2026-05-25 09:42:30.602187', '2026-05-25 09:42:30.602187', '宝塔区', '610602', 3, 'baotaqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3078, NULL, NULL, NULL, '2026-05-25 09:42:30.611222', '2026-05-25 09:42:30.611222', '安塞区', '610603', 3, 'ansaiqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3079, NULL, NULL, NULL, '2026-05-25 09:42:30.621353', '2026-05-25 09:42:30.621353', '延长县', '610621', 3, 'yanchangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3080, NULL, NULL, NULL, '2026-05-25 09:42:30.632352', '2026-05-25 09:42:30.632352', '延川县', '610622', 3, 'yanchuanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3081, NULL, NULL, NULL, '2026-05-25 09:42:30.640352', '2026-05-25 09:42:30.640352', '志丹县', '610625', 3, 'zhidanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3082, NULL, NULL, NULL, '2026-05-25 09:42:30.648353', '2026-05-25 09:42:30.648353', '吴起县', '610626', 3, 'wuqixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3083, NULL, NULL, NULL, '2026-05-25 09:42:30.656683', '2026-05-25 09:42:30.656683', '甘泉县', '610627', 3, 'ganquanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3084, NULL, NULL, NULL, '2026-05-25 09:42:30.665292', '2026-05-25 09:42:30.665292', '富县', '610628', 3, 'fuxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3085, NULL, NULL, NULL, '2026-05-25 09:42:30.674295', '2026-05-25 09:42:30.674295', '洛川县', '610629', 3, 'luochuanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3086, NULL, NULL, NULL, '2026-05-25 09:42:30.689296', '2026-05-25 09:42:30.689296', '宜川县', '610630', 3, 'yichuanxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3087, NULL, NULL, NULL, '2026-05-25 09:42:30.698295', '2026-05-25 09:42:30.698295', '黄龙县', '610631', 3, 'huanglongxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3088, NULL, NULL, NULL, '2026-05-25 09:42:30.706059', '2026-05-25 09:42:30.706059', '黄陵县', '610632', 3, 'huanglingxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3089, NULL, NULL, NULL, '2026-05-25 09:42:30.714052', '2026-05-25 09:42:30.714052', '子长市', '610681', 3, 'zizhangshi', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3090, NULL, NULL, NULL, '2026-05-25 09:42:30.721701', '2026-05-25 09:42:30.721701', '汉中市', '6107', 2, 'hanzhongshi', 'H', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3091, NULL, NULL, NULL, '2026-05-25 09:42:30.729701', '2026-05-25 09:42:30.729701', '汉台区', '610702', 3, 'hantaiqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3092, NULL, NULL, NULL, '2026-05-25 09:42:30.740923', '2026-05-25 09:42:30.740923', '南郑区', '610703', 3, 'nanzhengqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3093, NULL, NULL, NULL, '2026-05-25 09:42:30.748923', '2026-05-25 09:42:30.748923', '城固县', '610722', 3, 'chengguxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3094, NULL, NULL, NULL, '2026-05-25 09:42:30.756922', '2026-05-25 09:42:30.756922', '洋县', '610723', 3, 'yangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3095, NULL, NULL, NULL, '2026-05-25 09:42:30.766923', '2026-05-25 09:42:30.766923', '西乡县', '610724', 3, 'xixiangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3096, NULL, NULL, NULL, '2026-05-25 09:42:30.775933', '2026-05-25 09:42:30.775933', '勉县', '610725', 3, 'mianxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3097, NULL, NULL, NULL, '2026-05-25 09:42:30.786474', '2026-05-25 09:42:30.786474', '宁强县', '610726', 3, 'ningqiangxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3098, NULL, NULL, NULL, '2026-05-25 09:42:30.795627', '2026-05-25 09:42:30.795627', '略阳县', '610727', 3, 'lveyangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3099, NULL, NULL, NULL, '2026-05-25 09:42:30.804766', '2026-05-25 09:42:30.804766', '镇巴县', '610728', 3, 'zhenbaxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3100, NULL, NULL, NULL, '2026-05-25 09:42:30.812784', '2026-05-25 09:42:30.812784', '留坝县', '610729', 3, 'liubaxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3101, NULL, NULL, NULL, '2026-05-25 09:42:30.820777', '2026-05-25 09:42:30.820777', '佛坪县', '610730', 3, 'fupingxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3102, NULL, NULL, NULL, '2026-05-25 09:42:30.830778', '2026-05-25 09:42:30.830778', '榆林市', '6108', 2, 'yulinshi', 'Y', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3103, NULL, NULL, NULL, '2026-05-25 09:42:30.838772', '2026-05-25 09:42:30.838772', '榆阳区', '610802', 3, 'yuyangqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3104, NULL, NULL, NULL, '2026-05-25 09:42:30.846780', '2026-05-25 09:42:30.846780', '横山区', '610803', 3, 'hengshanqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3105, NULL, NULL, NULL, '2026-05-25 09:42:30.855777', '2026-05-25 09:42:30.855777', '府谷县', '610822', 3, 'fuguxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3106, NULL, NULL, NULL, '2026-05-25 09:42:30.862690', '2026-05-25 09:42:30.862690', '靖边县', '610824', 3, 'jingbianxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3107, NULL, NULL, NULL, '2026-05-25 09:42:30.872686', '2026-05-25 09:42:30.872686', '定边县', '610825', 3, 'dingbianxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3108, NULL, NULL, NULL, '2026-05-25 09:42:30.882689', '2026-05-25 09:42:30.882689', '绥德县', '610826', 3, 'suidexian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3109, NULL, NULL, NULL, '2026-05-25 09:42:30.894115', '2026-05-25 09:42:30.894115', '米脂县', '610827', 3, 'mizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3110, NULL, NULL, NULL, '2026-05-25 09:42:30.904125', '2026-05-25 09:42:30.904125', '佳县', '610828', 3, 'jiaxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3111, NULL, NULL, NULL, '2026-05-25 09:42:30.913123', '2026-05-25 09:42:30.913123', '吴堡县', '610829', 3, 'wubuxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3112, NULL, NULL, NULL, '2026-05-25 09:42:30.922121', '2026-05-25 09:42:30.922121', '清涧县', '610830', 3, 'qingjianxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3113, NULL, NULL, NULL, '2026-05-25 09:42:30.929124', '2026-05-25 09:42:30.929124', '子洲县', '610831', 3, 'zizhouxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3114, NULL, NULL, NULL, '2026-05-25 09:42:30.938122', '2026-05-25 09:42:30.938122', '神木市', '610881', 3, 'shenmushi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3115, NULL, NULL, NULL, '2026-05-25 09:42:30.948126', '2026-05-25 09:42:30.948126', '安康市', '6109', 2, 'ankangshi', 'A', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3116, NULL, NULL, NULL, '2026-05-25 09:42:30.960120', '2026-05-25 09:42:30.960120', '汉滨区', '610902', 3, 'hanbinqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3117, NULL, NULL, NULL, '2026-05-25 09:42:30.968123', '2026-05-25 09:42:30.968123', '汉阴县', '610921', 3, 'hanyinxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3118, NULL, NULL, NULL, '2026-05-25 09:42:30.977124', '2026-05-25 09:42:30.977124', '石泉县', '610922', 3, 'shiquanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3119, NULL, NULL, NULL, '2026-05-25 09:42:30.986115', '2026-05-25 09:42:30.986115', '宁陕县', '610923', 3, 'ningshanxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3120, NULL, NULL, NULL, '2026-05-25 09:42:30.994124', '2026-05-25 09:42:30.994124', '紫阳县', '610924', 3, 'ziyangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3121, NULL, NULL, NULL, '2026-05-25 09:42:31.003280', '2026-05-25 09:42:31.003280', '岚皋县', '610925', 3, 'langaoxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3122, NULL, NULL, NULL, '2026-05-25 09:42:31.012289', '2026-05-25 09:42:31.012289', '平利县', '610926', 3, 'pinglixian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3123, NULL, NULL, NULL, '2026-05-25 09:42:31.024282', '2026-05-25 09:42:31.024282', '镇坪县', '610927', 3, 'zhenpingxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3124, NULL, NULL, NULL, '2026-05-25 09:42:31.033288', '2026-05-25 09:42:31.033288', '旬阳县', '610928', 3, 'xunyangxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3125, NULL, NULL, NULL, '2026-05-25 09:42:31.044290', '2026-05-25 09:42:31.044290', '白河县', '610929', 3, 'baihexian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3126, NULL, NULL, NULL, '2026-05-25 09:42:31.054289', '2026-05-25 09:42:31.054289', '商洛市', '6110', 2, 'shangluoshi', 'S', 1, NULL, '130183');
INSERT INTO `dvadmin_system_area` VALUES (3127, NULL, NULL, NULL, '2026-05-25 09:42:31.062290', '2026-05-25 09:42:31.062290', '商州区', '611002', 3, 'shangzhouqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3128, NULL, NULL, NULL, '2026-05-25 09:42:31.071288', '2026-05-25 09:42:31.071288', '洛南县', '611021', 3, 'luonanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3129, NULL, NULL, NULL, '2026-05-25 09:42:31.079282', '2026-05-25 09:42:31.079282', '丹凤县', '611022', 3, 'danfengxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3130, NULL, NULL, NULL, '2026-05-25 09:42:31.088289', '2026-05-25 09:42:31.088289', '商南县', '611023', 3, 'shangnanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3131, NULL, NULL, NULL, '2026-05-25 09:42:31.097287', '2026-05-25 09:42:31.097287', '山阳县', '611024', 3, 'shanyangxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3132, NULL, NULL, NULL, '2026-05-25 09:42:31.106289', '2026-05-25 09:42:31.106289', '镇安县', '611025', 3, 'zhenanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3133, NULL, NULL, NULL, '2026-05-25 09:42:31.115288', '2026-05-25 09:42:31.115288', '柞水县', '611026', 3, 'zhashuixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3134, NULL, NULL, NULL, '2026-05-25 09:42:31.123288', '2026-04-03 10:10:05.075000', '甘肃省', '62', 1, 'gansusheng', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3135, NULL, NULL, NULL, '2026-05-25 09:42:31.133293', '2026-05-25 09:42:31.133293', '兰州市', '6201', 2, 'lanzhoushi', 'L', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3136, NULL, NULL, NULL, '2026-05-25 09:42:31.142280', '2026-05-25 09:42:31.142280', '城关区', '620102', 3, 'chengguanqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3137, NULL, NULL, NULL, '2026-05-25 09:42:31.151290', '2026-05-25 09:42:31.151290', '七里河区', '620103', 3, 'qilihequ', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3138, NULL, NULL, NULL, '2026-05-25 09:42:31.158282', '2026-05-25 09:42:31.158282', '西固区', '620104', 3, 'xiguqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3139, NULL, NULL, NULL, '2026-05-25 09:42:31.167289', '2026-05-25 09:42:31.167289', '安宁区', '620105', 3, 'anningqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3140, NULL, NULL, NULL, '2026-05-25 09:42:31.176290', '2026-05-25 09:42:31.176290', '红古区', '620111', 3, 'hongguqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3141, NULL, NULL, NULL, '2026-05-25 09:42:31.185282', '2026-05-25 09:42:31.185282', '永登县', '620121', 3, 'yongdengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3142, NULL, NULL, NULL, '2026-05-25 09:42:31.192290', '2026-05-25 09:42:31.192290', '皋兰县', '620122', 3, 'gaolanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3143, NULL, NULL, NULL, '2026-05-25 09:42:31.200282', '2026-05-25 09:42:31.200282', '榆中县', '620123', 3, 'yuzhongxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3144, NULL, NULL, NULL, '2026-05-25 09:42:31.208281', '2026-05-25 09:42:31.208281', '兰州新区', '620171', 3, 'lanzhouxinqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3145, NULL, NULL, NULL, '2026-05-25 09:42:31.216282', '2026-05-25 09:42:31.216282', '嘉峪关市', '6202', 2, 'jiayuguanshi', 'J', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3146, NULL, NULL, NULL, '2026-05-25 09:42:31.225281', '2026-05-25 09:42:31.225281', '雄关街道', '620201001', 3, 'xiongguanjiedao', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3147, NULL, NULL, NULL, '2026-05-25 09:42:31.233289', '2026-05-25 09:42:31.233289', '钢城街道', '620201002', 3, 'gangchengjiedao', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3148, NULL, NULL, NULL, '2026-05-25 09:42:31.244282', '2026-05-25 09:42:31.244282', '新城镇', '620201100', 3, 'xinchengzhen', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3149, NULL, NULL, NULL, '2026-05-25 09:42:31.253282', '2026-05-25 09:42:31.253282', '峪泉镇', '620201101', 3, 'yuquanzhen', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3150, NULL, NULL, NULL, '2026-05-25 09:42:31.261288', '2026-05-25 09:42:31.261288', '文殊镇', '620201102', 3, 'wenshuzhen', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3151, NULL, NULL, NULL, '2026-05-25 09:42:31.270296', '2026-05-25 09:42:31.270296', '金昌市', '6203', 2, 'jinchangshi', 'J', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3152, NULL, NULL, NULL, '2026-05-25 09:42:31.280292', '2026-05-25 09:42:31.280292', '金川区', '620302', 3, 'jinchuanqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3153, NULL, NULL, NULL, '2026-05-25 09:42:31.289281', '2026-05-25 09:42:31.289281', '永昌县', '620321', 3, 'yongchangxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3154, NULL, NULL, NULL, '2026-05-25 09:42:31.297288', '2026-05-25 09:42:31.297288', '白银市', '6204', 2, 'baiyinshi', 'B', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3155, NULL, NULL, NULL, '2026-05-25 09:42:31.307282', '2026-05-25 09:42:31.307282', '白银区', '620402', 3, 'baiyinqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3156, NULL, NULL, NULL, '2026-05-25 09:42:31.317282', '2026-05-25 09:42:31.317282', '平川区', '620403', 3, 'pingchuanqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3157, NULL, NULL, NULL, '2026-05-25 09:42:31.335284', '2026-05-25 09:42:31.335284', '靖远县', '620421', 3, 'jingyuanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3158, NULL, NULL, NULL, '2026-05-25 09:42:31.347284', '2026-05-25 09:42:31.347284', '会宁县', '620422', 3, 'huiningxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3159, NULL, NULL, NULL, '2026-05-25 09:42:31.356281', '2026-05-25 09:42:31.356281', '景泰县', '620423', 3, 'jingtaixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3160, NULL, NULL, NULL, '2026-05-25 09:42:31.367283', '2026-05-25 09:42:31.367283', '天水市', '6205', 2, 'tianshuishi', 'T', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3161, NULL, NULL, NULL, '2026-05-25 09:42:31.376475', '2026-05-25 09:42:31.376475', '秦州区', '620502', 3, 'qinzhouqu', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3162, NULL, NULL, NULL, '2026-05-25 09:42:31.385480', '2026-05-25 09:42:31.385480', '麦积区', '620503', 3, 'maijiqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3163, NULL, NULL, NULL, '2026-05-25 09:42:31.396486', '2026-05-25 09:42:31.396486', '清水县', '620521', 3, 'qingshuixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3164, NULL, NULL, NULL, '2026-05-25 09:42:31.404486', '2026-05-25 09:42:31.404486', '秦安县', '620522', 3, 'qinanxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3165, NULL, NULL, NULL, '2026-05-25 09:42:31.413478', '2026-05-25 09:42:31.413478', '甘谷县', '620523', 3, 'ganguxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3166, NULL, NULL, NULL, '2026-05-25 09:42:31.423490', '2026-05-25 09:42:31.423490', '武山县', '620524', 3, 'wushanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3167, NULL, NULL, NULL, '2026-05-25 09:42:31.432488', '2026-05-25 09:42:31.432488', '张家川回族自治县', '620525', 3, 'zhangjiachuanhuizuzizhixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3168, NULL, NULL, NULL, '2026-05-25 09:42:31.440982', '2026-05-25 09:42:31.440982', '武威市', '6206', 2, 'wuweishi', 'W', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3169, NULL, NULL, NULL, '2026-05-25 09:42:31.448979', '2026-05-25 09:42:31.448979', '凉州区', '620602', 3, 'liangzhouqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3170, NULL, NULL, NULL, '2026-05-25 09:42:31.456977', '2026-05-25 09:42:31.456977', '民勤县', '620621', 3, 'minqinxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3171, NULL, NULL, NULL, '2026-05-25 09:42:31.467347', '2026-05-25 09:42:31.467347', '古浪县', '620622', 3, 'gulangxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3172, NULL, NULL, NULL, '2026-05-25 09:42:31.475348', '2026-05-25 09:42:31.475348', '天祝藏族自治县', '620623', 3, 'tianzhuzangzuzizhixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3173, NULL, NULL, NULL, '2026-05-25 09:42:31.484355', '2026-05-25 09:42:31.484355', '张掖市', '6207', 2, 'zhangyeshi', 'Z', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3174, NULL, NULL, NULL, '2026-05-25 09:42:31.494346', '2026-05-25 09:42:31.494346', '甘州区', '620702', 3, 'ganzhouqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3175, NULL, NULL, NULL, '2026-05-25 09:42:31.503356', '2026-05-25 09:42:31.503356', '肃南裕固族自治县', '620721', 3, 'sunanyuguzuzizhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3176, NULL, NULL, NULL, '2026-05-25 09:42:31.512354', '2026-05-25 09:42:31.512354', '民乐县', '620722', 3, 'minyuexian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3177, NULL, NULL, NULL, '2026-05-25 09:42:31.521356', '2026-05-25 09:42:31.521356', '临泽县', '620723', 3, 'linzexian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3178, NULL, NULL, NULL, '2026-05-25 09:42:31.532352', '2026-05-25 09:42:31.532352', '高台县', '620724', 3, 'gaotaixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3179, NULL, NULL, NULL, '2026-05-25 09:42:31.542352', '2026-05-25 09:42:31.542352', '山丹县', '620725', 3, 'shandanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3180, NULL, NULL, NULL, '2026-05-25 09:42:31.551356', '2026-05-25 09:42:31.551356', '平凉市', '6208', 2, 'pingliangshi', 'P', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3181, NULL, NULL, NULL, '2026-05-25 09:42:31.560348', '2026-05-25 09:42:31.560348', '崆峒区', '620802', 3, 'kongdongqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3182, NULL, NULL, NULL, '2026-05-25 09:42:31.570356', '2026-05-25 09:42:31.570356', '泾川县', '620821', 3, 'jingchuanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3183, NULL, NULL, NULL, '2026-05-25 09:42:31.579355', '2026-05-25 09:42:31.579355', '灵台县', '620822', 3, 'lingtaixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3184, NULL, NULL, NULL, '2026-05-25 09:42:31.591352', '2026-05-25 09:42:31.591352', '崇信县', '620823', 3, 'chongxinxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3185, NULL, NULL, NULL, '2026-05-25 09:42:31.605356', '2026-05-25 09:42:31.605356', '庄浪县', '620825', 3, 'zhuanglangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3186, NULL, NULL, NULL, '2026-05-25 09:42:31.614354', '2026-05-25 09:42:31.614354', '静宁县', '620826', 3, 'jingningxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3187, NULL, NULL, NULL, '2026-05-25 09:42:31.625346', '2026-05-25 09:42:31.625346', '华亭市', '620881', 3, 'huatingshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3188, NULL, NULL, NULL, '2026-05-25 09:42:31.633356', '2026-05-25 09:42:31.633356', '酒泉市', '6209', 2, 'jiuquanshi', 'J', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3189, NULL, NULL, NULL, '2026-05-25 09:42:31.642355', '2026-05-25 09:42:31.642355', '肃州区', '620902', 3, 'suzhouqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3190, NULL, NULL, NULL, '2026-05-25 09:42:31.650353', '2026-05-25 09:42:31.650353', '金塔县', '620921', 3, 'jintaxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3191, NULL, NULL, NULL, '2026-05-25 09:42:31.657346', '2026-05-25 09:42:31.657346', '瓜州县', '620922', 3, 'guazhouxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3192, NULL, NULL, NULL, '2026-05-25 09:42:31.666346', '2026-05-25 09:42:31.666346', '肃北蒙古族自治县', '620923', 3, 'subeimengguzuzizhixian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3193, NULL, NULL, NULL, '2026-05-25 09:42:31.674354', '2026-05-25 09:42:31.674354', '阿克塞哈萨克族自治县', '620924', 3, 'akesaihasakezuzizhixian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3194, NULL, NULL, NULL, '2026-05-25 09:42:31.687357', '2026-05-25 09:42:31.687357', '玉门市', '620981', 3, 'yumenshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3195, NULL, NULL, NULL, '2026-05-25 09:42:31.699352', '2026-05-25 09:42:31.699352', '敦煌市', '620982', 3, 'dunhuangshi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3196, NULL, NULL, NULL, '2026-05-25 09:42:31.709238', '2026-05-25 09:42:31.709238', '庆阳市', '6210', 2, 'qingyangshi', 'Q', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3197, NULL, NULL, NULL, '2026-05-25 09:42:31.721192', '2026-05-25 09:42:31.721192', '西峰区', '621002', 3, 'xifengqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3198, NULL, NULL, NULL, '2026-05-25 09:42:31.728188', '2026-05-25 09:42:31.728188', '庆城县', '621021', 3, 'qingchengxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3199, NULL, NULL, NULL, '2026-05-25 09:42:31.737131', '2026-05-25 09:42:31.737131', '环县', '621022', 3, 'huanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3200, NULL, NULL, NULL, '2026-05-25 09:42:31.746137', '2026-05-25 09:42:31.746137', '华池县', '621023', 3, 'huachixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3201, NULL, NULL, NULL, '2026-05-25 09:42:31.753131', '2026-05-25 09:42:31.753131', '合水县', '621024', 3, 'heshuixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3202, NULL, NULL, NULL, '2026-05-25 09:42:31.761868', '2026-05-25 09:42:31.761868', '正宁县', '621025', 3, 'zhengningxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3203, NULL, NULL, NULL, '2026-05-25 09:42:31.770855', '2026-05-25 09:42:31.770855', '宁县', '621026', 3, 'ningxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3204, NULL, NULL, NULL, '2026-05-25 09:42:31.778854', '2026-05-25 09:42:31.778854', '镇原县', '621027', 3, 'zhenyuanxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3205, NULL, NULL, NULL, '2026-05-25 09:42:31.784854', '2026-05-25 09:42:31.784854', '定西市', '6211', 2, 'dingxishi', 'D', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3206, NULL, NULL, NULL, '2026-05-25 09:42:31.792920', '2026-05-25 09:42:31.792920', '安定区', '621102', 3, 'andingqu', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3207, NULL, NULL, NULL, '2026-05-25 09:42:31.803208', '2026-05-25 09:42:31.803208', '通渭县', '621121', 3, 'tongweixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3208, NULL, NULL, NULL, '2026-05-25 09:42:31.812220', '2026-05-25 09:42:31.812220', '陇西县', '621122', 3, 'longxixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3209, NULL, NULL, NULL, '2026-05-25 09:42:31.819753', '2026-05-25 09:42:31.819753', '渭源县', '621123', 3, 'weiyuanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3210, NULL, NULL, NULL, '2026-05-25 09:42:31.827135', '2026-05-25 09:42:31.827135', '临洮县', '621124', 3, 'lintaoxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3211, NULL, NULL, NULL, '2026-05-25 09:42:31.834140', '2026-05-25 09:42:31.834140', '漳县', '621125', 3, 'zhangxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3212, NULL, NULL, NULL, '2026-05-25 09:42:31.842048', '2026-05-25 09:42:31.842048', '岷县', '621126', 3, 'minxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3213, NULL, NULL, NULL, '2026-05-25 09:42:31.848728', '2026-05-25 09:42:31.848728', '陇南市', '6212', 2, 'longnanshi', 'L', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3214, NULL, NULL, NULL, '2026-05-25 09:42:31.858229', '2026-05-25 09:42:31.858229', '武都区', '621202', 3, 'wudouqu', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3215, NULL, NULL, NULL, '2026-05-25 09:42:31.865231', '2026-05-25 09:42:31.865231', '成县', '621221', 3, 'chengxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3216, NULL, NULL, NULL, '2026-05-25 09:42:31.873230', '2026-05-25 09:42:31.873230', '文县', '621222', 3, 'wenxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3217, NULL, NULL, NULL, '2026-05-25 09:42:31.883235', '2026-05-25 09:42:31.883235', '宕昌县', '621223', 3, 'dangchangxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3218, NULL, NULL, NULL, '2026-05-25 09:42:31.893100', '2026-05-25 09:42:31.893100', '康县', '621224', 3, 'kangxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3219, NULL, NULL, NULL, '2026-05-25 09:42:31.900625', '2026-05-25 09:42:31.900625', '西和县', '621225', 3, 'xihexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3220, NULL, NULL, NULL, '2026-05-25 09:42:31.909624', '2026-05-25 09:42:31.909624', '礼县', '621226', 3, 'lixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3221, NULL, NULL, NULL, '2026-05-25 09:42:31.916623', '2026-05-25 09:42:31.916623', '徽县', '621227', 3, 'huixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3222, NULL, NULL, NULL, '2026-05-25 09:42:31.924624', '2026-05-25 09:42:31.924624', '两当县', '621228', 3, 'liangdangxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3223, NULL, NULL, NULL, '2026-05-25 09:42:31.932626', '2026-05-25 09:42:31.932626', '临夏回族自治州', '6229', 2, 'linxiahuizuzizhizhou', 'L', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3224, NULL, NULL, NULL, '2026-05-25 09:42:31.942033', '2026-05-25 09:42:31.942033', '临夏市', '622901', 3, 'linxiashi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3225, NULL, NULL, NULL, '2026-05-25 09:42:31.950043', '2026-05-25 09:42:31.950043', '临夏县', '622921', 3, 'linxiaxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3226, NULL, NULL, NULL, '2026-05-25 09:42:31.958539', '2026-05-25 09:42:31.958539', '康乐县', '622922', 3, 'kanglexian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3227, NULL, NULL, NULL, '2026-05-25 09:42:31.966854', '2026-05-25 09:42:31.966854', '永靖县', '622923', 3, 'yongjingxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3228, NULL, NULL, NULL, '2026-05-25 09:42:31.974905', '2026-05-25 09:42:31.974905', '广河县', '622924', 3, 'guanghexian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3229, NULL, NULL, NULL, '2026-05-25 09:42:31.982081', '2026-05-25 09:42:31.982081', '和政县', '622925', 3, 'hezhengxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3230, NULL, NULL, NULL, '2026-05-25 09:42:31.989377', '2026-05-25 09:42:31.989377', '东乡族自治县', '622926', 3, 'dongxiangzuzizhixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3231, NULL, NULL, NULL, '2026-05-25 09:42:31.997021', '2026-05-25 09:42:31.997021', '积石山保安族东乡族撒拉族自治县', '622927', 3, 'jishishanbaoanzudongxiangzusalazuzizhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3232, NULL, NULL, NULL, '2026-05-25 09:42:32.006358', '2026-05-25 09:42:32.006358', '甘南藏族自治州', '6230', 2, 'gannanzangzuzizhizhou', 'G', 1, NULL, '130184');
INSERT INTO `dvadmin_system_area` VALUES (3233, NULL, NULL, NULL, '2026-05-25 09:42:32.015356', '2026-05-25 09:42:32.015356', '合作市', '623001', 3, 'hezuoshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3234, NULL, NULL, NULL, '2026-05-25 09:42:32.022955', '2026-05-25 09:42:32.022955', '临潭县', '623021', 3, 'lintanxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3235, NULL, NULL, NULL, '2026-05-25 09:42:32.029143', '2026-05-25 09:42:32.029143', '卓尼县', '623022', 3, 'zhuonixian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3236, NULL, NULL, NULL, '2026-05-25 09:42:32.035147', '2026-05-25 09:42:32.035147', '舟曲县', '623023', 3, 'zhouquxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3237, NULL, NULL, NULL, '2026-05-25 09:42:32.043294', '2026-05-25 09:42:32.043294', '迭部县', '623024', 3, 'diebuxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3238, NULL, NULL, NULL, '2026-05-25 09:42:32.052288', '2026-05-25 09:42:32.052288', '玛曲县', '623025', 3, 'maquxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3239, NULL, NULL, NULL, '2026-05-25 09:42:32.060514', '2026-05-25 09:42:32.060514', '碌曲县', '623026', 3, 'luquxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3240, NULL, NULL, NULL, '2026-05-25 09:42:32.069519', '2026-05-25 09:42:32.069519', '夏河县', '623027', 3, 'xiahexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3241, NULL, NULL, NULL, '2026-05-25 09:42:32.078452', '2026-04-03 10:10:05.077000', '青海省', '63', 1, 'qinghaisheng', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3242, NULL, NULL, NULL, '2026-05-25 09:42:32.085725', '2026-05-25 09:42:32.085725', '西宁市', '6301', 2, 'xiningshi', 'X', 1, NULL, '1302');
INSERT INTO `dvadmin_system_area` VALUES (3243, NULL, NULL, NULL, '2026-05-25 09:42:32.093725', '2026-05-25 09:42:32.093725', '城东区', '630102', 3, 'chengdongqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3244, NULL, NULL, NULL, '2026-05-25 09:42:32.100725', '2026-05-25 09:42:32.100725', '城中区', '630103', 3, 'chengzhongqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3245, NULL, NULL, NULL, '2026-05-25 09:42:32.108725', '2026-05-25 09:42:32.108725', '城西区', '630104', 3, 'chengxiqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3246, NULL, NULL, NULL, '2026-05-25 09:42:32.116738', '2026-05-25 09:42:32.116738', '城北区', '630105', 3, 'chengbeiqu', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3247, NULL, NULL, NULL, '2026-05-25 09:42:32.124738', '2026-05-25 09:42:32.124738', '湟中区', '630106', 3, 'huangzhongqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3248, NULL, NULL, NULL, '2026-05-25 09:42:32.131740', '2026-05-25 09:42:32.131740', '大通回族土族自治县', '630121', 3, 'datonghuizutuzuzizhixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3249, NULL, NULL, NULL, '2026-05-25 09:42:32.140770', '2026-05-25 09:42:32.140770', '湟源县', '630123', 3, 'huangyuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3250, NULL, NULL, NULL, '2026-05-25 09:42:32.147739', '2026-05-25 09:42:32.147739', '海东市', '6302', 2, 'haidongshi', 'H', 1, NULL, '1302');
INSERT INTO `dvadmin_system_area` VALUES (3251, NULL, NULL, NULL, '2026-05-25 09:42:32.156008', '2026-05-25 09:42:32.156008', '乐都区', '630202', 3, 'ledouqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3252, NULL, NULL, NULL, '2026-05-25 09:42:32.162007', '2026-05-25 09:42:32.162007', '平安区', '630203', 3, 'pinganqu', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3253, NULL, NULL, NULL, '2026-05-25 09:42:32.170787', '2026-05-25 09:42:32.170787', '民和回族土族自治县', '630222', 3, 'minhehuizutuzuzizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3254, NULL, NULL, NULL, '2026-05-25 09:42:32.179013', '2026-05-25 09:42:32.179013', '互助土族自治县', '630223', 3, 'huzhutuzuzizhixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3255, NULL, NULL, NULL, '2026-05-25 09:42:32.186781', '2026-05-25 09:42:32.186781', '化隆回族自治县', '630224', 3, 'hualonghuizuzizhixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3256, NULL, NULL, NULL, '2026-05-25 09:42:32.193720', '2026-05-25 09:42:32.193720', '循化撒拉族自治县', '630225', 3, 'xunhuasalazuzizhixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3257, NULL, NULL, NULL, '2026-05-25 09:42:32.202203', '2026-05-25 09:42:32.202203', '海北藏族自治州', '6322', 2, 'haibeizangzuzizhizhou', 'H', 1, NULL, '1302');
INSERT INTO `dvadmin_system_area` VALUES (3258, NULL, NULL, NULL, '2026-05-25 09:42:32.209202', '2026-05-25 09:42:32.209202', '门源回族自治县', '632221', 3, 'menyuanhuizuzizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3259, NULL, NULL, NULL, '2026-05-25 09:42:32.216546', '2026-05-25 09:42:32.216546', '祁连县', '632222', 3, 'qilianxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3260, NULL, NULL, NULL, '2026-05-25 09:42:32.225015', '2026-05-25 09:42:32.225015', '海晏县', '632223', 3, 'haiyanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3261, NULL, NULL, NULL, '2026-05-25 09:42:32.233015', '2026-05-25 09:42:32.233015', '刚察县', '632224', 3, 'gangchaxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3262, NULL, NULL, NULL, '2026-05-25 09:42:32.240015', '2026-05-25 09:42:32.240015', '黄南藏族自治州', '6323', 2, 'huangnanzangzuzizhizhou', 'H', 1, NULL, '1302');
INSERT INTO `dvadmin_system_area` VALUES (3263, NULL, NULL, NULL, '2026-05-25 09:42:32.249014', '2026-05-25 09:42:32.249014', '同仁县', '632321', 3, 'tongrenxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3264, NULL, NULL, NULL, '2026-05-25 09:42:32.256788', '2026-05-25 09:42:32.256788', '尖扎县', '632322', 3, 'jianzhaxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3265, NULL, NULL, NULL, '2026-05-25 09:42:32.264788', '2026-05-25 09:42:32.264788', '泽库县', '632323', 3, 'zekuxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3266, NULL, NULL, NULL, '2026-05-25 09:42:32.272843', '2026-05-25 09:42:32.272843', '河南蒙古族自治县', '632324', 3, 'henanmengguzuzizhixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3267, NULL, NULL, NULL, '2026-05-25 09:42:32.280844', '2026-05-25 09:42:32.280844', '海南藏族自治州', '6325', 2, 'hainanzangzuzizhizhou', 'H', 1, NULL, '1302');
INSERT INTO `dvadmin_system_area` VALUES (3268, NULL, NULL, NULL, '2026-05-25 09:42:32.289897', '2026-05-25 09:42:32.289897', '共和县', '632521', 3, 'gonghexian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3269, NULL, NULL, NULL, '2026-05-25 09:42:32.297896', '2026-05-25 09:42:32.297896', '同德县', '632522', 3, 'tongdexian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3270, NULL, NULL, NULL, '2026-05-25 09:42:32.304897', '2026-05-25 09:42:32.304897', '贵德县', '632523', 3, 'guidexian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3271, NULL, NULL, NULL, '2026-05-25 09:42:32.312897', '2026-05-25 09:42:32.312897', '兴海县', '632524', 3, 'xinghaixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3272, NULL, NULL, NULL, '2026-05-25 09:42:32.320898', '2026-05-25 09:42:32.320898', '贵南县', '632525', 3, 'guinanxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3273, NULL, NULL, NULL, '2026-05-25 09:42:32.335897', '2026-05-25 09:42:32.335897', '果洛藏族自治州', '6326', 2, 'guoluozangzuzizhizhou', 'G', 1, NULL, '1302');
INSERT INTO `dvadmin_system_area` VALUES (3274, NULL, NULL, NULL, '2026-05-25 09:42:32.342897', '2026-05-25 09:42:32.342897', '玛沁县', '632621', 3, 'maqinxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3275, NULL, NULL, NULL, '2026-05-25 09:42:32.352526', '2026-05-25 09:42:32.352526', '班玛县', '632622', 3, 'banmaxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3276, NULL, NULL, NULL, '2026-05-25 09:42:32.360526', '2026-05-25 09:42:32.360526', '甘德县', '632623', 3, 'gandexian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3277, NULL, NULL, NULL, '2026-05-25 09:42:32.367726', '2026-05-25 09:42:32.367726', '达日县', '632624', 3, 'darixian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3278, NULL, NULL, NULL, '2026-05-25 09:42:32.376595', '2026-05-25 09:42:32.376595', '久治县', '632625', 3, 'jiuzhixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3279, NULL, NULL, NULL, '2026-05-25 09:42:32.384596', '2026-05-25 09:42:32.384596', '玛多县', '632626', 3, 'maduoxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3280, NULL, NULL, NULL, '2026-05-25 09:42:32.393148', '2026-05-25 09:42:32.393148', '玉树藏族自治州', '6327', 2, 'yushuzangzuzizhizhou', 'Y', 1, NULL, '1302');
INSERT INTO `dvadmin_system_area` VALUES (3281, NULL, NULL, NULL, '2026-05-25 09:42:32.402401', '2026-05-25 09:42:32.402401', '玉树市', '632701', 3, 'yushushi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3282, NULL, NULL, NULL, '2026-05-25 09:42:32.408827', '2026-05-25 09:42:32.408827', '杂多县', '632722', 3, 'zaduoxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3283, NULL, NULL, NULL, '2026-05-25 09:42:32.417827', '2026-05-25 09:42:32.417827', '称多县', '632723', 3, 'chengduoxian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3284, NULL, NULL, NULL, '2026-05-25 09:42:32.425827', '2026-05-25 09:42:32.425827', '治多县', '632724', 3, 'zhiduoxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3285, NULL, NULL, NULL, '2026-05-25 09:42:32.434992', '2026-05-25 09:42:32.434992', '囊谦县', '632725', 3, 'nangqianxian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3286, NULL, NULL, NULL, '2026-05-25 09:42:32.443421', '2026-05-25 09:42:32.443421', '曲麻莱县', '632726', 3, 'qumalaixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3287, NULL, NULL, NULL, '2026-05-25 09:42:32.452414', '2026-05-25 09:42:32.452414', '海西蒙古族藏族自治州', '6328', 2, 'haiximengguzuzangzuzizhizhou', 'H', 1, NULL, '1302');
INSERT INTO `dvadmin_system_area` VALUES (3288, NULL, NULL, NULL, '2026-05-25 09:42:32.459421', '2026-05-25 09:42:32.459421', '格尔木市', '632801', 3, 'geermushi', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3289, NULL, NULL, NULL, '2026-05-25 09:42:32.467421', '2026-05-25 09:42:32.467421', '德令哈市', '632802', 3, 'delinghashi', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3290, NULL, NULL, NULL, '2026-05-25 09:42:32.473491', '2026-05-25 09:42:32.473491', '茫崖市', '632803', 3, 'mangyashi', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3291, NULL, NULL, NULL, '2026-05-25 09:42:32.482146', '2026-05-25 09:42:32.482146', '乌兰县', '632821', 3, 'wulanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3292, NULL, NULL, NULL, '2026-05-25 09:42:32.490144', '2026-05-25 09:42:32.490144', '都兰县', '632822', 3, 'doulanxian', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3293, NULL, NULL, NULL, '2026-05-25 09:42:32.498207', '2026-05-25 09:42:32.498207', '天峻县', '632823', 3, 'tianjunxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3294, NULL, NULL, NULL, '2026-05-25 09:42:32.507144', '2026-05-25 09:42:32.507144', '大柴旦行政委员会', '632857', 3, 'dachaidanxingzhengweiyuanhui', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3295, NULL, NULL, NULL, '2026-05-25 09:42:32.514144', '2026-04-03 10:10:05.081000', '宁夏回族自治区', '64', 1, 'ningxiahuizuzizhiqu', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3296, NULL, NULL, NULL, '2026-05-25 09:42:32.521685', '2026-05-25 09:42:32.521685', '银川市', '6401', 2, 'yinchuanshi', 'Y', 1, NULL, '130202');
INSERT INTO `dvadmin_system_area` VALUES (3297, NULL, NULL, NULL, '2026-05-25 09:42:32.529734', '2026-05-25 09:42:32.529734', '兴庆区', '640104', 3, 'xingqingqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3298, NULL, NULL, NULL, '2026-05-25 09:42:32.537781', '2026-05-25 09:42:32.537781', '西夏区', '640105', 3, 'xixiaqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3299, NULL, NULL, NULL, '2026-05-25 09:42:32.545830', '2026-05-25 09:42:32.545830', '金凤区', '640106', 3, 'jinfengqu', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3300, NULL, NULL, NULL, '2026-05-25 09:42:32.552829', '2026-05-25 09:42:32.552829', '永宁县', '640121', 3, 'yongningxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3301, NULL, NULL, NULL, '2026-05-25 09:42:32.560830', '2026-05-25 09:42:32.560830', '贺兰县', '640122', 3, 'helanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3302, NULL, NULL, NULL, '2026-05-25 09:42:32.568828', '2026-05-25 09:42:32.568828', '灵武市', '640181', 3, 'lingwushi', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3303, NULL, NULL, NULL, '2026-05-25 09:42:32.577828', '2026-05-25 09:42:32.577828', '石嘴山市', '6402', 2, 'shizuishanshi', 'S', 1, NULL, '130202');
INSERT INTO `dvadmin_system_area` VALUES (3304, NULL, NULL, NULL, '2026-05-25 09:42:32.586829', '2026-05-25 09:42:32.586829', '大武口区', '640202', 3, 'dawukouqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3305, NULL, NULL, NULL, '2026-05-25 09:42:32.597829', '2026-05-25 09:42:32.597829', '惠农区', '640205', 3, 'huinongqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3306, NULL, NULL, NULL, '2026-05-25 09:42:32.605438', '2026-05-25 09:42:32.605438', '平罗县', '640221', 3, 'pingluoxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3307, NULL, NULL, NULL, '2026-05-25 09:42:32.613434', '2026-05-25 09:42:32.613434', '吴忠市', '6403', 2, 'wuzhongshi', 'W', 1, NULL, '130202');
INSERT INTO `dvadmin_system_area` VALUES (3308, NULL, NULL, NULL, '2026-05-25 09:42:32.620434', '2026-05-25 09:42:32.620434', '利通区', '640302', 3, 'litongqu', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3309, NULL, NULL, NULL, '2026-05-25 09:42:32.627428', '2026-05-25 09:42:32.627428', '红寺堡区', '640303', 3, 'hongsibaoqu', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3310, NULL, NULL, NULL, '2026-05-25 09:42:32.635779', '2026-05-25 09:42:32.635779', '盐池县', '640323', 3, 'yanchixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3311, NULL, NULL, NULL, '2026-05-25 09:42:32.642540', '2026-05-25 09:42:32.642540', '同心县', '640324', 3, 'tongxinxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3312, NULL, NULL, NULL, '2026-05-25 09:42:32.649540', '2026-05-25 09:42:32.649540', '青铜峡市', '640381', 3, 'qingtongxiashi', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3313, NULL, NULL, NULL, '2026-05-25 09:42:32.656541', '2026-05-25 09:42:32.657540', '固原市', '6404', 2, 'guyuanshi', 'G', 1, NULL, '130202');
INSERT INTO `dvadmin_system_area` VALUES (3314, NULL, NULL, NULL, '2026-05-25 09:42:32.663869', '2026-05-25 09:42:32.663869', '原州区', '640402', 3, 'yuanzhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3315, NULL, NULL, NULL, '2026-05-25 09:42:32.671101', '2026-05-25 09:42:32.671101', '西吉县', '640422', 3, 'xijixian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3316, NULL, NULL, NULL, '2026-05-25 09:42:32.678104', '2026-05-25 09:42:32.678104', '隆德县', '640423', 3, 'longdexian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3317, NULL, NULL, NULL, '2026-05-25 09:42:32.686102', '2026-05-25 09:42:32.686102', '泾源县', '640424', 3, 'jingyuanxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3318, NULL, NULL, NULL, '2026-05-25 09:42:32.699967', '2026-05-25 09:42:32.699967', '彭阳县', '640425', 3, 'pengyangxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3319, NULL, NULL, NULL, '2026-05-25 09:42:32.707110', '2026-05-25 09:42:32.707110', '中卫市', '6405', 2, 'zhongweishi', 'Z', 1, NULL, '130202');
INSERT INTO `dvadmin_system_area` VALUES (3320, NULL, NULL, NULL, '2026-05-25 09:42:32.715001', '2026-05-25 09:42:32.715001', '沙坡头区', '640502', 3, 'shapotouqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3321, NULL, NULL, NULL, '2026-05-25 09:42:32.723007', '2026-05-25 09:42:32.723007', '中宁县', '640521', 3, 'zhongningxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3322, NULL, NULL, NULL, '2026-05-25 09:42:32.730043', '2026-05-25 09:42:32.730043', '海原县', '640522', 3, 'haiyuanxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3323, NULL, NULL, NULL, '2026-05-25 09:42:32.737043', '2026-04-03 10:10:05.081000', '新疆维吾尔自治区', '65', 1, 'xinjiangweiwuerzizhiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3324, NULL, NULL, NULL, '2026-05-25 09:42:32.746532', '2026-05-25 09:42:32.746532', '乌鲁木齐市', '6501', 2, 'wulumuqishi', 'W', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3325, NULL, NULL, NULL, '2026-05-25 09:42:32.754964', '2026-05-25 09:42:32.754964', '天山区', '650102', 3, 'tianshanqu', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3326, NULL, NULL, NULL, '2026-05-25 09:42:32.761671', '2026-05-25 09:42:32.761671', '沙依巴克区', '650103', 3, 'shayibakequ', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3327, NULL, NULL, NULL, '2026-05-25 09:42:32.769746', '2026-05-25 09:42:32.769746', '新市区', '650104', 3, 'xinshiqu', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3328, NULL, NULL, NULL, '2026-05-25 09:42:32.776805', '2026-05-25 09:42:32.776805', '水磨沟区', '650105', 3, 'shuimogouqu', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3329, NULL, NULL, NULL, '2026-05-25 09:42:32.783812', '2026-05-25 09:42:32.783812', '头屯河区', '650106', 3, 'toutunhequ', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3330, NULL, NULL, NULL, '2026-05-25 09:42:32.789868', '2026-05-25 09:42:32.789868', '达坂城区', '650107', 3, 'dabanchengqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3331, NULL, NULL, NULL, '2026-05-25 09:42:32.796866', '2026-05-25 09:42:32.796866', '米东区', '650109', 3, 'midongqu', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3332, NULL, NULL, NULL, '2026-05-25 09:42:32.803867', '2026-05-25 09:42:32.803867', '乌鲁木齐县', '650121', 3, 'wulumuqixian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3333, NULL, NULL, NULL, '2026-05-25 09:42:32.814685', '2026-05-25 09:42:32.814685', '克拉玛依市', '6502', 2, 'kelamayishi', 'K', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3334, NULL, NULL, NULL, '2026-05-25 09:42:32.821413', '2026-05-25 09:42:32.821413', '独山子区', '650202', 3, 'dushanziqu', 'D', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3335, NULL, NULL, NULL, '2026-05-25 09:42:32.831421', '2026-05-25 09:42:32.831421', '克拉玛依区', '650203', 3, 'kelamayiqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3336, NULL, NULL, NULL, '2026-05-25 09:42:32.840420', '2026-05-25 09:42:32.840420', '白碱滩区', '650204', 3, 'baijiantanqu', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3337, NULL, NULL, NULL, '2026-05-25 09:42:32.847420', '2026-05-25 09:42:32.847420', '乌尔禾区', '650205', 3, 'wuerhequ', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3338, NULL, NULL, NULL, '2026-05-25 09:42:32.855425', '2026-05-25 09:42:32.855425', '吐鲁番市', '6504', 2, 'tulufanshi', 'T', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3339, NULL, NULL, NULL, '2026-05-25 09:42:32.864419', '2026-05-25 09:42:32.864419', '高昌区', '650402', 3, 'gaochangqu', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3340, NULL, NULL, NULL, '2026-05-25 09:42:32.873424', '2026-05-25 09:42:32.873424', '鄯善县', '650421', 3, 'shanshanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3341, NULL, NULL, NULL, '2026-05-25 09:42:32.882426', '2026-05-25 09:42:32.882426', '托克逊县', '650422', 3, 'tuokexunxian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3342, NULL, NULL, NULL, '2026-05-25 09:42:32.891421', '2026-05-25 09:42:32.891421', '哈密市', '6505', 2, 'hamishi', 'H', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3343, NULL, NULL, NULL, '2026-05-25 09:42:32.900428', '2026-05-25 09:42:32.900428', '伊州区', '650502', 3, 'yizhouqu', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3344, NULL, NULL, NULL, '2026-05-25 09:42:32.907424', '2026-05-25 09:42:32.907424', '巴里坤哈萨克自治县', '650521', 3, 'balikunhasakezizhixian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3345, NULL, NULL, NULL, '2026-05-25 09:42:32.914425', '2026-05-25 09:42:32.914425', '伊吾县', '650522', 3, 'yiwuxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3346, NULL, NULL, NULL, '2026-05-25 09:42:32.922424', '2026-05-25 09:42:32.922424', '昌吉回族自治州', '6523', 2, 'changjihuizuzizhizhou', 'C', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3347, NULL, NULL, NULL, '2026-05-25 09:42:32.934419', '2026-05-25 09:42:32.934419', '昌吉市', '652301', 3, 'changjishi', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3348, NULL, NULL, NULL, '2026-05-25 09:42:32.944417', '2026-05-25 09:42:32.944417', '阜康市', '652302', 3, 'fukangshi', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3349, NULL, NULL, NULL, '2026-05-25 09:42:32.953425', '2026-05-25 09:42:32.953425', '呼图壁县', '652323', 3, 'hutubixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3350, NULL, NULL, NULL, '2026-05-25 09:42:32.962569', '2026-05-25 09:42:32.962569', '玛纳斯县', '652324', 3, 'manasixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3351, NULL, NULL, NULL, '2026-05-25 09:42:32.969823', '2026-05-25 09:42:32.969823', '奇台县', '652325', 3, 'qitaixian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3352, NULL, NULL, NULL, '2026-05-25 09:42:32.976567', '2026-05-25 09:42:32.976567', '吉木萨尔县', '652327', 3, 'jimusaerxian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3353, NULL, NULL, NULL, '2026-05-25 09:42:32.983566', '2026-05-25 09:42:32.983566', '木垒哈萨克自治县', '652328', 3, 'muleihasakezizhixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3354, NULL, NULL, NULL, '2026-05-25 09:42:32.990872', '2026-05-25 09:42:32.990872', '博尔塔拉蒙古自治州', '6527', 2, 'boertalamengguzizhizhou', 'B', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3355, NULL, NULL, NULL, '2026-05-25 09:42:32.997874', '2026-05-25 09:42:32.997874', '博乐市', '652701', 3, 'boleshi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3356, NULL, NULL, NULL, '2026-05-25 09:42:33.005873', '2026-05-25 09:42:33.005873', '阿拉山口市', '652702', 3, 'alashankoushi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3357, NULL, NULL, NULL, '2026-05-25 09:42:33.014872', '2026-05-25 09:42:33.014872', '精河县', '652722', 3, 'jinghexian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3358, NULL, NULL, NULL, '2026-05-25 09:42:33.023010', '2026-05-25 09:42:33.023010', '温泉县', '652723', 3, 'wenquanxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3359, NULL, NULL, NULL, '2026-05-25 09:42:33.031144', '2026-05-25 09:42:33.031144', '巴音郭楞蒙古自治州', '6528', 2, 'bayinguolengmengguzizhizhou', 'B', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3360, NULL, NULL, NULL, '2026-05-25 09:42:33.039164', '2026-05-25 09:42:33.039164', '库尔勒市', '652801', 3, 'kuerleishi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3361, NULL, NULL, NULL, '2026-05-25 09:42:33.048156', '2026-05-25 09:42:33.048156', '轮台县', '652822', 3, 'luntaixian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3362, NULL, NULL, NULL, '2026-05-25 09:42:33.056155', '2026-05-25 09:42:33.056155', '尉犁县', '652823', 3, 'yulixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3363, NULL, NULL, NULL, '2026-05-25 09:42:33.065244', '2026-05-25 09:42:33.065244', '若羌县', '652824', 3, 'ruoqiangxian', 'R', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3364, NULL, NULL, NULL, '2026-05-25 09:42:33.073249', '2026-05-25 09:42:33.073249', '且末县', '652825', 3, 'qiemoxian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3365, NULL, NULL, NULL, '2026-05-25 09:42:33.082249', '2026-05-25 09:42:33.082249', '焉耆回族自治县', '652826', 3, 'yanqihuizuzizhixian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3366, NULL, NULL, NULL, '2026-05-25 09:42:33.091242', '2026-05-25 09:42:33.091242', '和静县', '652827', 3, 'hejingxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3367, NULL, NULL, NULL, '2026-05-25 09:42:33.099249', '2026-05-25 09:42:33.099249', '和硕县', '652828', 3, 'heshuoxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3368, NULL, NULL, NULL, '2026-05-25 09:42:33.108249', '2026-05-25 09:42:33.108249', '博湖县', '652829', 3, 'bohuxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3369, NULL, NULL, NULL, '2026-05-25 09:42:33.116020', '2026-05-25 09:42:33.116020', '库尔勒经济技术开发区', '652871', 3, 'kuerleijingjijishukaifaqu', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3370, NULL, NULL, NULL, '2026-05-25 09:42:33.126028', '2026-05-25 09:42:33.126028', '阿克苏地区', '6529', 2, 'akesudiqu', 'A', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3371, NULL, NULL, NULL, '2026-05-25 09:42:33.134103', '2026-05-25 09:42:33.134103', '阿克苏市', '652901', 3, 'akesushi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3372, NULL, NULL, NULL, '2026-05-25 09:42:33.141103', '2026-05-25 09:42:33.141103', '库车市', '652902', 3, 'kucheshi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3373, NULL, NULL, NULL, '2026-05-25 09:42:33.149103', '2026-05-25 09:42:33.149103', '温宿县', '652922', 3, 'wensuxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3374, NULL, NULL, NULL, '2026-05-25 09:42:33.156103', '2026-05-25 09:42:33.156103', '沙雅县', '652924', 3, 'shayaxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3375, NULL, NULL, NULL, '2026-05-25 09:42:33.163097', '2026-05-25 09:42:33.163097', '新和县', '652925', 3, 'xinhexian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3376, NULL, NULL, NULL, '2026-05-25 09:42:33.171091', '2026-05-25 09:42:33.171091', '拜城县', '652926', 3, 'baichengxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3377, NULL, NULL, NULL, '2026-05-25 09:42:33.179099', '2026-05-25 09:42:33.179099', '乌什县', '652927', 3, 'wushenxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3378, NULL, NULL, NULL, '2026-05-25 09:42:33.188078', '2026-05-25 09:42:33.188078', '阿瓦提县', '652928', 3, 'awatixian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3379, NULL, NULL, NULL, '2026-05-25 09:42:33.196556', '2026-05-25 09:42:33.196556', '柯坪县', '652929', 3, 'kepingxian', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3380, NULL, NULL, NULL, '2026-05-25 09:42:33.206938', '2026-05-25 09:42:33.206938', '克孜勒苏柯尔克孜自治州', '6530', 2, 'kezileisukeerkezizizhizhou', 'K', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3381, NULL, NULL, NULL, '2026-05-25 09:42:33.215933', '2026-05-25 09:42:33.215933', '阿图什市', '653001', 3, 'atushenshi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3382, NULL, NULL, NULL, '2026-05-25 09:42:33.224167', '2026-05-25 09:42:33.224167', '阿克陶县', '653022', 3, 'aketaoxian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3383, NULL, NULL, NULL, '2026-05-25 09:42:33.232169', '2026-05-25 09:42:33.232169', '阿合奇县', '653023', 3, 'aheqixian', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3384, NULL, NULL, NULL, '2026-05-25 09:42:33.239506', '2026-05-25 09:42:33.239506', '乌恰县', '653024', 3, 'wuqiaxian', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3385, NULL, NULL, NULL, '2026-05-25 09:42:33.248210', '2026-05-25 09:42:33.248210', '喀什地区', '6531', 2, 'kashidiqu', 'K', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3386, NULL, NULL, NULL, '2026-05-25 09:42:33.255210', '2026-05-25 09:42:33.255210', '喀什市', '653101', 3, 'kashishi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3387, NULL, NULL, NULL, '2026-05-25 09:42:33.263210', '2026-05-25 09:42:33.263210', '疏附县', '653121', 3, 'shufuxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3388, NULL, NULL, NULL, '2026-05-25 09:42:33.270296', '2026-05-25 09:42:33.270296', '疏勒县', '653122', 3, 'shulexian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3389, NULL, NULL, NULL, '2026-05-25 09:42:33.278303', '2026-05-25 09:42:33.278303', '英吉沙县', '653123', 3, 'yingjishaxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3390, NULL, NULL, NULL, '2026-05-25 09:42:33.285729', '2026-05-25 09:42:33.285729', '泽普县', '653124', 3, 'zepuxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3391, NULL, NULL, NULL, '2026-05-25 09:42:33.293768', '2026-05-25 09:42:33.293768', '莎车县', '653125', 3, 'shachexian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3392, NULL, NULL, NULL, '2026-05-25 09:42:33.303774', '2026-05-25 09:42:33.303774', '叶城县', '653126', 3, 'yechengxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3393, NULL, NULL, NULL, '2026-05-25 09:42:33.311835', '2026-05-25 09:42:33.311835', '麦盖提县', '653127', 3, 'maigaitixian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3394, NULL, NULL, NULL, '2026-05-25 09:42:33.319275', '2026-05-25 09:42:33.319275', '岳普湖县', '653128', 3, 'yuepuhuxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3395, NULL, NULL, NULL, '2026-05-25 09:42:33.326447', '2026-05-25 09:42:33.326447', '伽师县', '653129', 3, 'gashixian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3396, NULL, NULL, NULL, '2026-05-25 09:42:33.333487', '2026-05-25 09:42:33.333487', '巴楚县', '653130', 3, 'bachuxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3397, NULL, NULL, NULL, '2026-05-25 09:42:33.341610', '2026-05-25 09:42:33.341610', '塔什库尔干塔吉克自治县', '653131', 3, 'tashenkuergantajikezizhixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3398, NULL, NULL, NULL, '2026-05-25 09:42:33.349608', '2026-05-25 09:42:33.349608', '和田地区', '6532', 2, 'hetiandiqu', 'H', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3399, NULL, NULL, NULL, '2026-05-25 09:42:33.359609', '2026-05-25 09:42:33.359609', '和田市', '653201', 3, 'hetianshi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3400, NULL, NULL, NULL, '2026-05-25 09:42:33.367607', '2026-05-25 09:42:33.367607', '和田县', '653221', 3, 'hetianxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3401, NULL, NULL, NULL, '2026-05-25 09:42:33.376606', '2026-05-25 09:42:33.376606', '墨玉县', '653222', 3, 'moyuxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3402, NULL, NULL, NULL, '2026-05-25 09:42:33.384605', '2026-05-25 09:42:33.384605', '皮山县', '653223', 3, 'pishanxian', 'P', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3403, NULL, NULL, NULL, '2026-05-25 09:42:33.392611', '2026-05-25 09:42:33.392611', '洛浦县', '653224', 3, 'luopuxian', 'L', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3404, NULL, NULL, NULL, '2026-05-25 09:42:33.401804', '2026-05-25 09:42:33.401804', '策勒县', '653225', 3, 'celeixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3405, NULL, NULL, NULL, '2026-05-25 09:42:33.409803', '2026-05-25 09:42:33.409803', '于田县', '653226', 3, 'yutianxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3406, NULL, NULL, NULL, '2026-05-25 09:42:33.418803', '2026-05-25 09:42:33.418803', '民丰县', '653227', 3, 'minfengxian', 'M', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3407, NULL, NULL, NULL, '2026-05-25 09:42:33.428803', '2026-05-25 09:42:33.428803', '伊犁哈萨克自治州', '6540', 2, 'yilihasakezizhizhou', 'Y', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3408, NULL, NULL, NULL, '2026-05-25 09:42:33.435828', '2026-05-25 09:42:33.435828', '伊宁市', '654002', 3, 'yiningshi', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3409, NULL, NULL, NULL, '2026-05-25 09:42:33.443747', '2026-05-25 09:42:33.443747', '奎屯市', '654003', 3, 'kuitunshi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3410, NULL, NULL, NULL, '2026-05-25 09:42:33.450747', '2026-05-25 09:42:33.450747', '霍尔果斯市', '654004', 3, 'huoerguosishi', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3411, NULL, NULL, NULL, '2026-05-25 09:42:33.457982', '2026-05-25 09:42:33.457982', '伊宁县', '654021', 3, 'yiningxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3412, NULL, NULL, NULL, '2026-05-25 09:42:33.464984', '2026-05-25 09:42:33.465983', '察布查尔锡伯自治县', '654022', 3, 'chabuchaerxibozizhixian', 'C', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3413, NULL, NULL, NULL, '2026-05-25 09:42:33.474185', '2026-05-25 09:42:33.474185', '霍城县', '654023', 3, 'huochengxian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3414, NULL, NULL, NULL, '2026-05-25 09:42:33.482218', '2026-05-25 09:42:33.482218', '巩留县', '654024', 3, 'gongliuxian', 'G', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3415, NULL, NULL, NULL, '2026-05-25 09:42:33.490222', '2026-05-25 09:42:33.490222', '新源县', '654025', 3, 'xinyuanxian', 'X', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3416, NULL, NULL, NULL, '2026-05-25 09:42:33.499246', '2026-05-25 09:42:33.499246', '昭苏县', '654026', 3, 'zhaosuxian', 'Z', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3417, NULL, NULL, NULL, '2026-05-25 09:42:33.506707', '2026-05-25 09:42:33.506707', '特克斯县', '654027', 3, 'tekesixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3418, NULL, NULL, NULL, '2026-05-25 09:42:33.514787', '2026-05-25 09:42:33.514787', '尼勒克县', '654028', 3, 'nileikexian', 'N', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3419, NULL, NULL, NULL, '2026-05-25 09:42:33.521787', '2026-05-25 09:42:33.521787', '塔城地区', '6542', 2, 'tachengdiqu', 'T', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3420, NULL, NULL, NULL, '2026-05-25 09:42:33.529786', '2026-05-25 09:42:33.529786', '塔城市', '654201', 3, 'tachengshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3421, NULL, NULL, NULL, '2026-05-25 09:42:33.536798', '2026-05-25 09:42:33.536798', '乌苏市', '654202', 3, 'wusushi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3422, NULL, NULL, NULL, '2026-05-25 09:42:33.543776', '2026-05-25 09:42:33.543776', '额敏县', '654221', 3, 'eminxian', 'E', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3423, NULL, NULL, NULL, '2026-05-25 09:42:33.552787', '2026-05-25 09:42:33.552787', '沙湾县', '654223', 3, 'shawanxian', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3424, NULL, NULL, NULL, '2026-05-25 09:42:33.559060', '2026-05-25 09:42:33.559060', '托里县', '654224', 3, 'tuolixian', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3425, NULL, NULL, NULL, '2026-05-25 09:42:33.567081', '2026-05-25 09:42:33.567081', '裕民县', '654225', 3, 'yuminxian', 'Y', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3426, NULL, NULL, NULL, '2026-05-25 09:42:33.575103', '2026-05-25 09:42:33.575103', '和布克赛尔蒙古自治县', '654226', 3, 'hebukesaiermengguzizhixian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3427, NULL, NULL, NULL, '2026-05-25 09:42:33.583110', '2026-05-25 09:42:33.583110', '阿勒泰地区', '6543', 2, 'aleitaidiqu', 'A', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3428, NULL, NULL, NULL, '2026-05-25 09:42:33.592109', '2026-05-25 09:42:33.592109', '阿勒泰市', '654301', 3, 'aleitaishi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3429, NULL, NULL, NULL, '2026-05-25 09:42:33.600111', '2026-05-25 09:42:33.600111', '布尔津县', '654321', 3, 'buerjinxian', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3430, NULL, NULL, NULL, '2026-05-25 09:42:33.610109', '2026-05-25 09:42:33.610109', '富蕴县', '654322', 3, 'fuyunxian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3431, NULL, NULL, NULL, '2026-05-25 09:42:33.618109', '2026-05-25 09:42:33.618109', '福海县', '654323', 3, 'fuhaixian', 'F', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3432, NULL, NULL, NULL, '2026-05-25 09:42:33.626112', '2026-05-25 09:42:33.626112', '哈巴河县', '654324', 3, 'habahexian', 'H', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3433, NULL, NULL, NULL, '2026-05-25 09:42:33.635109', '2026-05-25 09:42:33.635109', '青河县', '654325', 3, 'qinghexian', 'Q', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3434, NULL, NULL, NULL, '2026-05-25 09:42:33.642715', '2026-05-25 09:42:33.642715', '吉木乃县', '654326', 3, 'jimunaixian', 'J', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3435, NULL, NULL, NULL, '2026-05-25 09:42:33.649716', '2026-05-25 09:42:33.649716', '自治区直辖县级行政区划', '6590', 2, 'zizhiquzhixiaxianjixingzhengquhua', 'Z', 1, NULL, '130203');
INSERT INTO `dvadmin_system_area` VALUES (3436, NULL, NULL, NULL, '2026-05-25 09:42:33.658044', '2026-05-25 09:42:33.658044', '石河子市', '659001', 3, 'shihezishi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3437, NULL, NULL, NULL, '2026-05-25 09:42:33.665947', '2026-05-25 09:42:33.665947', '阿拉尔市', '659002', 3, 'alaershi', 'A', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3438, NULL, NULL, NULL, '2026-05-25 09:42:33.673457', '2026-05-25 09:42:33.673457', '图木舒克市', '659003', 3, 'tumushukeshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3439, NULL, NULL, NULL, '2026-05-25 09:42:33.682459', '2026-05-25 09:42:33.682459', '五家渠市', '659004', 3, 'wujiaqushi', 'W', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3440, NULL, NULL, NULL, '2026-05-25 09:42:33.688456', '2026-05-25 09:42:33.688456', '北屯市', '659005', 3, 'beitunshi', 'B', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3441, NULL, NULL, NULL, '2026-05-25 09:42:33.697457', '2026-05-25 09:42:33.697457', '铁门关市', '659006', 3, 'tiemenguanshi', 'T', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3442, NULL, NULL, NULL, '2026-05-25 09:42:33.708653', '2026-05-25 09:42:33.708653', '双河市', '659007', 3, 'shuangheshi', 'S', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3443, NULL, NULL, NULL, '2026-05-25 09:42:33.715521', '2026-05-25 09:42:33.715521', '可克达拉市', '659008', 3, 'kekedalashi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3444, NULL, NULL, NULL, '2026-05-25 09:42:33.722520', '2026-05-25 09:42:33.722520', '昆玉市', '659009', 3, 'kunyushi', 'K', 1, NULL, NULL);
INSERT INTO `dvadmin_system_area` VALUES (3445, NULL, NULL, NULL, '2026-05-25 09:42:33.729569', '2026-05-25 09:42:33.729569', '胡杨河市', '659010', 3, 'huyangheshi', 'H', 1, NULL, NULL);

-- ----------------------------
-- Table structure for dvadmin_system_config
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_config`;
CREATE TABLE `dvadmin_system_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '键',
  `value` json NULL COMMENT '值',
  `sort` int NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '启用状态',
  `data_options` json NULL COMMENT '数据options',
  `form_item_type` int NOT NULL COMMENT '表单类型',
  `rule` json NULL COMMENT '校验规则',
  `placeholder` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提示信息',
  `setting` json NULL COMMENT '配置',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父级',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_system_config_key_parent_id_f8627867_uniq`(`key` ASC, `parent_id` ASC) USING BTREE,
  INDEX `dvadmin_system_config_key_473a4f8d`(`key` ASC) USING BTREE,
  INDEX `dvadmin_system_config_creator_id_ba7fd60a`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_config_parent_id_1ff841b5`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_config
-- ----------------------------
INSERT INTO `dvadmin_system_config` VALUES (1, NULL, '1', NULL, '2026-05-25 09:42:36.837988', '2026-04-02 11:54:46.274000', '基础配置', 'base', NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_config` VALUES (2, NULL, NULL, NULL, '2026-05-25 09:42:36.849627', '2026-05-25 09:42:36.849627', '网页标题', 'web_title', '\"DVAdmin\"', 1, 1, NULL, 0, '[]', '请输入网站标题', NULL, NULL, 1);
INSERT INTO `dvadmin_system_config` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:42:36.858640', '2026-05-25 09:42:36.858640', '网站小图标', 'web_favicon', '\"\"', 1, 1, NULL, 0, '[]', '请输入网站小图标', NULL, NULL, 1);
INSERT INTO `dvadmin_system_config` VALUES (5, NULL, NULL, NULL, '2026-05-25 09:42:36.869635', '2026-05-25 09:42:36.869635', '创建用户默认密码', 'default_password', '\"admin123456\"', 2, 1, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": true}]', '请输入默认密码', NULL, NULL, 1);
INSERT INTO `dvadmin_system_config` VALUES (6, NULL, '1', NULL, '2026-05-25 09:42:36.877673', '2026-04-02 11:54:46.354000', '登录页配置', 'login', NULL, 1, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_config` VALUES (7, NULL, NULL, NULL, '2026-05-25 09:42:36.889718', '2026-05-25 09:42:36.889718', '网站标题', 'site_title', '\"Dvadmin\"', 1, 1, NULL, 0, '[]', '请输入网站标题', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:36.899719', '2026-05-25 09:42:36.899719', '网站名称', 'site_name', '\"企业级后台管理系统\"', 1, 1, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": true}]', '请输入网站名称', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (9, NULL, NULL, NULL, '2026-05-25 09:42:36.912237', '2026-05-25 09:42:36.912237', '登录网站logo', 'site_logo', NULL, 2, 1, NULL, 7, '[]', '请上传网站logo', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (10, NULL, NULL, NULL, '2026-05-25 09:42:36.920247', '2026-05-25 09:42:36.921237', '登录页背景图', 'login_background', NULL, 3, 1, NULL, 7, '[]', '请上传登录背景页', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (11, NULL, NULL, NULL, '2026-05-25 09:42:36.932237', '2026-05-25 09:42:36.932237', '版权信息', 'copyright', '\"2021-2024 django-vue-admin.com 版权所有\"', 4, 1, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": true}]', '请输入版权信息', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (12, NULL, NULL, NULL, '2026-05-25 09:42:36.945237', '2026-05-25 09:42:36.945237', '备案信息', 'keep_record', '\"晋ICP备18005113号-3\"', 5, 1, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": true}]', '请输入备案信息', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (13, NULL, NULL, NULL, '2026-05-25 09:42:36.953238', '2026-05-25 09:42:36.953238', '帮助链接', 'help_url', '\"https://django-vue-admin.com\"', 6, 1, NULL, 0, '\"\"', '请输入帮助信息', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (14, NULL, NULL, NULL, '2026-05-25 09:42:36.963238', '2026-05-25 09:42:36.963238', '隐私链接', 'privacy_url', '\"/api/system/clause/privacy.html\"', 7, 1, NULL, 0, '[]', '请填写隐私链接', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (15, NULL, NULL, NULL, '2026-05-25 09:42:36.972801', '2026-05-25 09:42:36.972801', '条款链接', 'clause_url', '\"/api/system/clause/terms_service.html\"', 8, 1, NULL, 0, '[]', '请输入条款链接', NULL, NULL, 6);
INSERT INTO `dvadmin_system_config` VALUES (16, NULL, '1', NULL, '2026-05-25 09:42:36.981201', '2026-04-02 11:54:46.539000', '文件存储配置', 'file_storage', NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_config` VALUES (17, NULL, NULL, NULL, '2026-05-25 09:42:36.988203', '2026-05-25 09:42:36.988203', '存储引擎', 'file_engine', '\"local\"', 1, 1, NULL, 4, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请选择存储引擎', '\"file_engine\"', NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (18, NULL, NULL, NULL, '2026-05-25 09:42:36.999201', '2026-05-25 09:42:36.999201', '文件是否备份', 'file_backup', 'false', 2, 1, NULL, 9, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '启用云存储时,文件是否备份到本地', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (19, NULL, NULL, NULL, '2026-05-25 09:42:37.008202', '2026-05-25 09:42:37.008202', '阿里云-AccessKey', 'aliyun_access_key', NULL, 3, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入AccessKey', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (20, NULL, NULL, NULL, '2026-05-25 09:42:37.018203', '2026-05-25 09:42:37.018203', '阿里云-Secret', 'aliyun_access_secret', NULL, 4, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入Secret', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (21, NULL, NULL, NULL, '2026-05-25 09:42:37.027633', '2026-05-25 09:42:37.027633', '阿里云-Endpoint', 'aliyun_endpoint', NULL, 5, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入Endpoint', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (22, NULL, NULL, NULL, '2026-05-25 09:42:37.037659', '2026-05-25 09:42:37.037659', '阿里云-上传路径', 'aliyun_path', '\"/media/\"', 5, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入上传路径', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (23, NULL, NULL, NULL, '2026-05-25 09:42:37.046028', '2026-05-25 09:42:37.046028', '阿里云-Bucket', 'aliyun_bucket', NULL, 7, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入Bucket', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (24, NULL, NULL, NULL, '2026-05-25 09:42:37.057027', '2026-05-25 09:42:37.057027', '阿里云-cdn地址', 'aliyun_cdn_url', NULL, 7, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入cdn地址', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (25, NULL, NULL, NULL, '2026-05-25 09:42:37.068284', '2026-05-25 09:42:37.068284', '腾讯云-SecretId', 'tencent_secret_id', NULL, 8, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入SecretId', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (26, NULL, NULL, NULL, '2026-05-25 09:42:37.076695', '2026-05-25 09:42:37.076695', '腾讯云-SecretKey', 'tencent_secret_key', NULL, 9, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入SecretKey', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (27, NULL, NULL, NULL, '2026-05-25 09:42:37.085870', '2026-05-25 09:42:37.085870', '腾讯云-Region', 'tencent_region', NULL, 10, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入Region', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (28, NULL, NULL, NULL, '2026-05-25 09:42:37.093759', '2026-05-25 09:42:37.093759', '腾讯云-Bucket', 'tencent_bucket', NULL, 11, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入Bucket', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (29, NULL, NULL, NULL, '2026-05-25 09:42:37.101827', '2026-05-25 09:42:37.101827', '腾讯云-上传路径', 'tencent_path', '\"/media/\"', 12, 0, NULL, 0, '[{\"message\": \"必填项不能为空\", \"required\": false}]', '请输入上传路径', NULL, NULL, 16);
INSERT INTO `dvadmin_system_config` VALUES (30, '是否开启验证码', NULL, NULL, '2026-05-25 09:42:37.108827', '2026-04-02 12:01:04.520000', '验证码状态', 'captcha_state', '\"\"', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_config` VALUES (31, NULL, NULL, '1', '2026-05-25 09:42:37.117826', '2026-05-25 09:42:37.117826', '开启验证码', 'captcha_state', '\"True\"', 1, 1, NULL, 9, '[{\"message\": \"必填项不能为空\", \"required\": true}]', '请选择', NULL, NULL, 1);

-- ----------------------------
-- Table structure for dvadmin_system_dept
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_dept`;
CREATE TABLE `dvadmin_system_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联字符',
  `sort` int NOT NULL COMMENT '显示排序',
  `owner` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '部门状态',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上级部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key` ASC) USING BTREE,
  INDEX `dvadmin_system_dept_creator_id_e69fd1ae`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_dept_parent_id_0f9eb419`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_dept
-- ----------------------------
INSERT INTO `dvadmin_system_dept` VALUES (1, NULL, '1', NULL, '2026-05-25 09:42:02.835650', '2026-04-02 11:54:41.479000', 'DVAdmin团队', 'dvadmin', 1, '', '', '', 1, NULL, NULL);
INSERT INTO `dvadmin_system_dept` VALUES (2, NULL, NULL, NULL, '2026-05-25 09:42:02.845649', '2026-05-25 09:42:02.845649', '运营部', '', 2, '', '', '', 1, NULL, 1);
INSERT INTO `dvadmin_system_dept` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:42:02.854533', '2026-05-25 09:42:02.854533', '技术部', 'technology', 1, '', '', '', 1, NULL, 1);

-- ----------------------------
-- Table structure for dvadmin_system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_dictionary`;
CREATE TABLE `dvadmin_system_dictionary`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典名称',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典编号/实际值',
  `type` int NOT NULL COMMENT '数据值类型',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '颜色',
  `is_value` tinyint(1) NOT NULL COMMENT '是否为value值,用来做具体值存放',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `sort` int NULL DEFAULT NULL COMMENT '显示排序',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_system_dictionary_creator_id_d1b44b9d`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_dictionary_parent_id_4cceb110`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_dictionary
-- ----------------------------
INSERT INTO `dvadmin_system_dictionary` VALUES (1, NULL, '1', NULL, '2026-05-25 09:42:33.736562', '2026-04-02 11:54:45.127000', '启用/禁用-布尔值', 'button_status_bool', 0, NULL, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (2, NULL, NULL, NULL, '2026-05-25 09:42:33.750564', '2026-05-25 09:42:33.750564', '启用', 'true', 6, 'success', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `dvadmin_system_dictionary` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:42:33.765098', '2026-05-25 09:42:33.765098', '禁用', 'false', 6, 'danger', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `dvadmin_system_dictionary` VALUES (4, NULL, '1', NULL, '2026-05-25 09:42:33.780875', '2026-04-02 11:54:45.196000', '系统按钮', 'system_button', 0, NULL, 0, 1, 2, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (5, NULL, NULL, NULL, '2026-05-25 09:42:33.796896', '2026-05-25 09:42:33.796896', '新增', 'Create', 0, 'success', 1, 1, 1, NULL, NULL, 4);
INSERT INTO `dvadmin_system_dictionary` VALUES (6, NULL, NULL, NULL, '2026-05-25 09:42:33.810911', '2026-05-25 09:42:33.810911', '编辑', 'Update', 0, 'primary', 1, 1, 2, NULL, NULL, 4);
INSERT INTO `dvadmin_system_dictionary` VALUES (7, NULL, NULL, NULL, '2026-05-25 09:42:33.825921', '2026-05-25 09:42:33.825921', '删除', 'Delete', 0, 'danger', 1, 1, 3, NULL, NULL, 4);
INSERT INTO `dvadmin_system_dictionary` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:33.840087', '2026-05-25 09:42:33.840087', '详情', 'Retrieve', 0, 'info', 1, 1, 4, NULL, NULL, 4);
INSERT INTO `dvadmin_system_dictionary` VALUES (9, NULL, NULL, NULL, '2026-05-25 09:42:33.854816', '2026-05-25 09:42:33.854816', '查询', 'Search', 0, 'warning', 1, 1, 5, NULL, NULL, 4);
INSERT INTO `dvadmin_system_dictionary` VALUES (10, NULL, NULL, NULL, '2026-05-25 09:42:33.868815', '2026-05-25 09:42:33.868815', '保存', 'Save', 0, 'success', 1, 1, 6, NULL, NULL, 4);
INSERT INTO `dvadmin_system_dictionary` VALUES (11, NULL, NULL, NULL, '2026-05-25 09:42:33.882816', '2026-05-25 09:42:33.882816', '导入', 'Import', 0, 'primary', 1, 1, 7, NULL, NULL, 4);
INSERT INTO `dvadmin_system_dictionary` VALUES (12, NULL, NULL, NULL, '2026-05-25 09:42:33.897822', '2026-05-25 09:42:33.897822', '导出', 'Export', 0, 'warning', 1, 1, 8, NULL, NULL, 4);
INSERT INTO `dvadmin_system_dictionary` VALUES (13, NULL, '1', NULL, '2026-05-25 09:42:33.913013', '2026-04-02 11:54:45.342000', '启用/禁用-数字值', 'button_status_number', 0, NULL, 0, 1, 3, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (14, NULL, NULL, NULL, '2026-05-25 09:42:33.926025', '2026-05-25 09:42:33.926025', '启用', '1', 1, 'success', 1, 1, 1, NULL, NULL, 13);
INSERT INTO `dvadmin_system_dictionary` VALUES (15, NULL, NULL, NULL, '2026-05-25 09:42:33.939555', '2026-05-25 09:42:33.939555', '禁用', '0', 1, 'danger', 1, 1, 2, NULL, NULL, 13);
INSERT INTO `dvadmin_system_dictionary` VALUES (16, NULL, '1', NULL, '2026-05-25 09:42:33.955087', '2026-04-02 11:54:45.405000', '是/否-布尔值', 'button_whether_bool', 0, NULL, 0, 1, 4, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (17, NULL, NULL, NULL, '2026-05-25 09:42:33.970108', '2026-05-25 09:42:33.970108', '是', 'true', 6, 'success', 1, 1, 1, NULL, NULL, 16);
INSERT INTO `dvadmin_system_dictionary` VALUES (18, NULL, NULL, NULL, '2026-05-25 09:42:33.983029', '2026-05-25 09:42:33.983029', '否', 'false', 6, 'danger', 1, 1, 2, NULL, NULL, 16);
INSERT INTO `dvadmin_system_dictionary` VALUES (19, NULL, '1', NULL, '2026-05-25 09:42:33.996029', '2026-04-02 11:54:45.468000', '是/否-数字值', 'button_whether_number', 0, NULL, 0, 1, 5, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (20, NULL, NULL, NULL, '2026-05-25 09:42:34.011659', '2026-05-25 09:42:34.011659', '是', '1', 1, 'success', 1, 1, 1, NULL, NULL, 19);
INSERT INTO `dvadmin_system_dictionary` VALUES (21, NULL, NULL, NULL, '2026-05-25 09:42:34.025662', '2026-05-25 09:42:34.025662', '否', '2', 1, 'danger', 1, 1, 2, NULL, NULL, 19);
INSERT INTO `dvadmin_system_dictionary` VALUES (22, NULL, '1', NULL, '2026-05-25 09:42:34.037525', '2026-04-02 11:54:45.556000', '用户类型', 'user_type', 0, NULL, 0, 1, 6, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (23, NULL, NULL, NULL, '2026-05-25 09:42:34.051461', '2026-05-25 09:42:34.051461', '后台用户', '0', 1, NULL, 1, 1, 1, NULL, NULL, 22);
INSERT INTO `dvadmin_system_dictionary` VALUES (24, NULL, NULL, NULL, '2026-05-25 09:42:34.065043', '2026-05-25 09:42:34.065043', '前台用户', '1', 1, NULL, 1, 1, 2, NULL, NULL, 22);
INSERT INTO `dvadmin_system_dictionary` VALUES (25, NULL, '1', NULL, '2026-05-25 09:42:34.080041', '2026-04-02 11:54:45.622000', '表单类型', 'config_form_type', 0, NULL, 0, 1, 7, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (26, NULL, NULL, NULL, '2026-05-25 09:42:34.094072', '2026-05-25 09:42:34.094072', 'text', '0', 1, NULL, 1, 1, 0, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (27, NULL, NULL, NULL, '2026-05-25 09:42:34.107079', '2026-05-25 09:42:34.107079', 'textarea', '3', 1, '', 1, 1, 0, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (28, NULL, NULL, NULL, '2026-05-25 09:42:34.122176', '2026-05-25 09:42:34.122176', 'number', '10', 1, '', 1, 1, 0, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (29, NULL, NULL, NULL, '2026-05-25 09:42:34.139220', '2026-05-25 09:42:34.139220', 'datetime', '1', 1, NULL, 1, 1, 1, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (30, NULL, NULL, NULL, '2026-05-25 09:42:34.153219', '2026-05-25 09:42:34.153219', 'date', '2', 1, NULL, 1, 1, 2, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (31, NULL, NULL, NULL, '2026-05-25 09:42:34.170221', '2026-05-25 09:42:34.170221', 'time', '15', 1, '', 1, 1, 3, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (32, NULL, NULL, NULL, '2026-05-25 09:42:34.187155', '2026-05-25 09:42:34.187155', 'select', '4', 1, NULL, 1, 1, 4, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (33, NULL, NULL, NULL, '2026-05-25 09:42:34.202162', '2026-05-25 09:42:34.202162', 'checkbox', '5', 1, NULL, 1, 1, 5, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (34, NULL, NULL, NULL, '2026-05-25 09:42:34.217598', '2026-05-25 09:42:34.217598', 'radio', '6', 1, NULL, 1, 1, 6, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (35, NULL, NULL, NULL, '2026-05-25 09:42:34.234110', '2026-05-25 09:42:34.234110', 'switch', '9', 1, '', 1, 1, 6, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (36, NULL, NULL, NULL, '2026-05-25 09:42:34.246825', '2026-05-25 09:42:34.246825', '文件附件', '8', 1, '', 1, 1, 7, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (37, NULL, NULL, NULL, '2026-05-25 09:42:34.261812', '2026-05-25 09:42:34.261812', '图片(单张)', '7', 1, '', 1, 1, 8, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (38, NULL, NULL, NULL, '2026-05-25 09:42:34.273858', '2026-05-25 09:42:34.273858', '图片(多张)', '12', 1, '', 1, 1, 9, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (39, NULL, NULL, NULL, '2026-05-25 09:42:34.288085', '2026-05-25 09:42:34.288085', '数组', '11', 1, '', 1, 1, 11, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (40, NULL, NULL, NULL, '2026-05-25 09:42:34.302080', '2026-05-25 09:42:34.302080', '关联表', '13', 1, '', 1, 1, 13, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (41, NULL, NULL, NULL, '2026-05-25 09:42:34.316085', '2026-05-25 09:42:34.316085', '关联表(多选)', '14', 1, '', 1, 1, 14, NULL, NULL, 25);
INSERT INTO `dvadmin_system_dictionary` VALUES (42, NULL, '1', NULL, '2026-05-25 09:42:34.331078', '2026-04-02 11:54:46.018000', '性别', 'gender', 0, NULL, 0, 1, 8, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (43, NULL, NULL, NULL, '2026-05-25 09:42:34.343084', '2026-05-25 09:42:34.343084', '未知', '0', 1, NULL, 1, 1, 0, NULL, NULL, 42);
INSERT INTO `dvadmin_system_dictionary` VALUES (44, NULL, NULL, NULL, '2026-05-25 09:42:34.357085', '2026-05-25 09:42:34.357085', '男', '1', 1, NULL, 1, 1, 1, NULL, NULL, 42);
INSERT INTO `dvadmin_system_dictionary` VALUES (45, NULL, NULL, NULL, '2026-05-25 09:42:34.372085', '2026-05-25 09:42:34.372085', '女', '2', 1, NULL, 1, 1, 2, NULL, NULL, 42);
INSERT INTO `dvadmin_system_dictionary` VALUES (46, NULL, '1', NULL, '2026-05-25 09:42:34.385079', '2026-04-02 11:54:46.142000', '文件存储引擎', 'file_engine', 0, NULL, 0, 1, 9, NULL, NULL, NULL);
INSERT INTO `dvadmin_system_dictionary` VALUES (47, NULL, NULL, NULL, '2026-05-25 09:42:34.398078', '2026-05-25 09:42:34.398078', '本地', 'local', 0, 'primary', 1, 1, 1, NULL, NULL, 46);
INSERT INTO `dvadmin_system_dictionary` VALUES (48, NULL, NULL, NULL, '2026-05-25 09:42:34.412333', '2026-05-25 09:42:34.412333', '阿里云oss', 'oss', 0, 'success', 1, 1, 2, NULL, NULL, 46);
INSERT INTO `dvadmin_system_dictionary` VALUES (49, NULL, NULL, NULL, '2026-05-25 09:42:34.427333', '2026-05-25 09:42:34.427333', '腾讯cos', 'cos', 0, 'warning', 1, 1, 3, NULL, NULL, 46);

-- ----------------------------
-- Table structure for dvadmin_system_field_permission
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_field_permission`;
CREATE TABLE `dvadmin_system_field_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `is_query` tinyint(1) NOT NULL,
  `is_create` tinyint(1) NOT NULL,
  `is_update` tinyint(1) NOT NULL,
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `field_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_system_field_permission_creator_id_44eb775e`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_field_permission_field_id_73711ad8`(`field_id` ASC) USING BTREE,
  INDEX `dvadmin_system_field_permission_role_id_ef32fd10`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字段权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_field_permission
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_system_file_list
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_file_list`;
CREATE TABLE `dvadmin_system_file_list`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件地址',
  `engine` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '引擎',
  `mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mime类型',
  `size` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件大小',
  `md5sum` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件md5',
  `upload_method` smallint NULL DEFAULT NULL COMMENT '上传方式',
  `file_type` smallint NULL DEFAULT NULL COMMENT '文件类型',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_system_file_list_creator_id_dec6acb5`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_file_list
-- ----------------------------
INSERT INTO `dvadmin_system_file_list` VALUES (1, NULL, '1', '1', '2026-05-25 09:42:36.565075', '2026-05-25 09:42:36.565075', 'qrcode_for_gh_496bd099e3e3_258.jpg', 'files/1/9/1962316295d86a1c0625c5389e859752.jpg', 'media/files\\1\\9\\1962316295d86a1c0625c5389e859752.jpg', 'local', 'image/jpeg', '17810', '1962316295d86a1c0625c5389e859752', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (2, NULL, '1', '1', '2026-05-25 09:42:36.575077', '2026-05-25 09:42:36.575077', '编组 4@2x.png', 'files/2/0/20895b5078d1f0d7ca9e280c17b119fc.png', 'media/files\\2\\0\\20895b5078d1f0d7ca9e280c17b119fc.png', 'local', 'image/png', '5524', '20895b5078d1f0d7ca9e280c17b119fc', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (3, NULL, '1', '1', '2026-05-25 09:42:36.582580', '2026-05-25 09:42:36.582580', '编组 4@2x.png', 'files/2/0/20895b5078d1f0d7ca9e280c17b119fc_p7eY3wm.png', 'media/files\\2\\0\\20895b5078d1f0d7ca9e280c17b119fc.png', 'local', 'image/png', '5524', '20895b5078d1f0d7ca9e280c17b119fc', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (4, NULL, '1', '1', '2026-05-25 09:42:36.590543', '2026-05-25 09:42:36.590543', '编组 12@2x.png', 'files/4/7/4736aa6513124974478d022934ff9b29.png', 'media/files\\4\\7\\4736aa6513124974478d022934ff9b29.png', 'local', 'image/png', '5981', '4736aa6513124974478d022934ff9b29', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (5, NULL, '1', '1', '2026-05-25 09:42:36.599536', '2026-05-25 09:42:36.599536', '文档-docx_doc@2x.png', 'files/1/0/1037b885061c6e7cab3b70dd65c43bef.png', 'media/files\\1\\0\\1037b885061c6e7cab3b70dd65c43bef.png', 'local', 'image/png', '1143', '1037b885061c6e7cab3b70dd65c43bef', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (6, NULL, '1', '1', '2026-05-25 09:42:36.606567', '2026-05-25 09:42:36.606567', 'pdf (1)@2x.png', 'files/4/4/44906f8e9eeeac1450ae8945e2c575a9.png', 'media/files\\4\\4\\44906f8e9eeeac1450ae8945e2c575a9.png', 'local', 'image/png', '1274', '44906f8e9eeeac1450ae8945e2c575a9', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (7, NULL, '1', '1', '2026-05-25 09:42:36.613567', '2026-05-25 09:42:36.613567', '表格-xlxs_xls@2x.png', 'files/8/f/8fa84ae0a6178bd4d1fe09f34958bc9e.png', 'media/files\\8\\f\\8fa84ae0a6178bd4d1fe09f34958bc9e.png', 'local', 'image/png', '1229', '8fa84ae0a6178bd4d1fe09f34958bc9e', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (8, NULL, '1', '1', '2026-05-25 09:42:36.623567', '2026-05-25 09:42:36.623567', '图片-jpg_png@2x.png', 'files/1/a/1a14b3fb3592113b5378f7d93c621b40.png', 'media/files\\1\\a\\1a14b3fb3592113b5378f7d93c621b40.png', 'local', 'image/png', '1091', '1a14b3fb3592113b5378f7d93c621b40', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (9, NULL, '1', '1', '2026-05-25 09:42:36.631567', '2026-05-25 09:42:36.631567', '文档-docx_doc@2x.png', 'files/1/0/1037b885061c6e7cab3b70dd65c43bef_ndol9c3.png', 'media/files\\1\\0\\1037b885061c6e7cab3b70dd65c43bef.png', 'local', 'image/png', '1143', '1037b885061c6e7cab3b70dd65c43bef', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (10, NULL, '1', '1', '2026-05-25 09:42:36.639565', '2026-05-25 09:42:36.639565', 'image.png', 'files/c/b/cb200596432d5eaa5ac176efff85eaa8.png', 'media/files\\c\\b\\cb200596432d5eaa5ac176efff85eaa8.png', 'local', 'image/png', '112654', 'cb200596432d5eaa5ac176efff85eaa8', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (11, NULL, '1', '1', '2026-05-25 09:42:36.648947', '2026-05-25 09:42:36.648947', 'be86b951-e1f9-400c-b8e8-55353da47903.png', 'files/7/1/7146e5b28002ed38e66cedee6f16a9c2.png', 'media/files\\7\\1\\7146e5b28002ed38e66cedee6f16a9c2.png', 'local', 'image/png', '180280', '7146e5b28002ed38e66cedee6f16a9c2', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (12, NULL, '1', '1', '2026-05-25 09:42:36.655963', '2026-05-25 09:42:36.655963', '微信图片_20260403175219_346_126.png', 'files/f/c/fccc937183d555f28c17708eb2b8a7ec.png', 'media/files\\f\\c\\fccc937183d555f28c17708eb2b8a7ec.png', 'local', 'image/png', '298281', 'fccc937183d555f28c17708eb2b8a7ec', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (13, NULL, '1', '1', '2026-05-25 09:42:36.664966', '2026-05-25 09:42:36.664966', 'pdf (1)@2x.png', 'files/4/4/44906f8e9eeeac1450ae8945e2c575a9_9nl2t71.png', 'media/files\\4\\4\\44906f8e9eeeac1450ae8945e2c575a9.png', 'local', 'image/png', '1274', '44906f8e9eeeac1450ae8945e2c575a9', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (14, NULL, '1', '1', '2026-05-25 09:42:36.671960', '2026-05-25 09:42:36.671960', '表格-xlxs_xls@2x.png', 'files/8/f/8fa84ae0a6178bd4d1fe09f34958bc9e_NhMjJSn.png', 'media/files\\8\\f\\8fa84ae0a6178bd4d1fe09f34958bc9e.png', 'local', 'image/png', '1229', '8fa84ae0a6178bd4d1fe09f34958bc9e', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (15, NULL, '1', '1', '2026-05-25 09:42:36.679978', '2026-05-25 09:42:36.679978', 'pdf (1)@2x.png', 'files/4/4/44906f8e9eeeac1450ae8945e2c575a9_JBmWtw8.png', 'media/files\\4\\4\\44906f8e9eeeac1450ae8945e2c575a9.png', 'local', 'image/png', '1274', '44906f8e9eeeac1450ae8945e2c575a9', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (16, NULL, '1', '1', '2026-05-25 09:42:36.686984', '2026-05-25 09:42:36.686984', '表格-xlxs_xls@2x.png', 'files/8/f/8fa84ae0a6178bd4d1fe09f34958bc9e_bdpdM17.png', 'media/files\\8\\f\\8fa84ae0a6178bd4d1fe09f34958bc9e.png', 'local', 'image/png', '1229', '8fa84ae0a6178bd4d1fe09f34958bc9e', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (17, NULL, '1', '1', '2026-05-25 09:42:36.693984', '2026-05-25 09:42:36.693984', '图片-jpg_png@2x.png', 'files/1/a/1a14b3fb3592113b5378f7d93c621b40_8RDlBUc.png', 'media/files\\1\\a\\1a14b3fb3592113b5378f7d93c621b40.png', 'local', 'image/png', '1091', '1a14b3fb3592113b5378f7d93c621b40', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (18, NULL, '1', '1', '2026-05-25 09:42:36.700835', '2026-05-25 09:42:36.700835', '文档-docx_doc@2x.png', 'files/1/0/1037b885061c6e7cab3b70dd65c43bef_6JfzVqu.png', 'media/files\\1\\0\\1037b885061c6e7cab3b70dd65c43bef.png', 'local', 'image/png', '1143', '1037b885061c6e7cab3b70dd65c43bef', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (19, NULL, '1', '1', '2026-05-25 09:42:36.707830', '2026-05-25 09:42:36.707830', 'pdf (1)@2x.png', 'files/4/4/44906f8e9eeeac1450ae8945e2c575a9_7HP3Z7K.png', 'media/files\\4\\4\\44906f8e9eeeac1450ae8945e2c575a9.png', 'local', 'image/png', '1274', '44906f8e9eeeac1450ae8945e2c575a9', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (20, NULL, '1', '1', '2026-05-25 09:42:36.716367', '2026-05-25 09:42:36.716367', '表格-xlxs_xls@2x.png', 'files/8/f/8fa84ae0a6178bd4d1fe09f34958bc9e_5ESqC9q.png', 'media/files\\8\\f\\8fa84ae0a6178bd4d1fe09f34958bc9e.png', 'local', 'image/png', '1229', '8fa84ae0a6178bd4d1fe09f34958bc9e', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (21, NULL, '1', '1', '2026-05-25 09:42:36.724514', '2026-05-25 09:42:36.724514', '33686aa5-6102-432a-ac72-8d3d9bcd24b1.png', 'files/6/6/66d93a2c6c647a250b6687c0a5c59da6.png', 'media/files\\6\\6\\66d93a2c6c647a250b6687c0a5c59da6.png', 'local', 'image/png', '84332', '66d93a2c6c647a250b6687c0a5c59da6', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (22, NULL, '1', '1', '2026-05-25 09:42:36.734768', '2026-05-25 09:42:36.734768', '王者荣耀.png', 'files/2/5/2555f1a6d7c4918f4ed721b1b0a9dcc6.png', 'media/files\\2\\5\\2555f1a6d7c4918f4ed721b1b0a9dcc6.png', 'local', 'image/png', '553796', '2555f1a6d7c4918f4ed721b1b0a9dcc6', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (23, NULL, '1', '1', '2026-05-25 09:42:36.748321', '2026-05-25 09:42:36.748321', 'ead0b6c8-f642-4b84-8a1a-167f43f6209c.png', 'files/6/f/6f9dcda52c129dcd994c844bda1420bf.png', 'media/files\\6\\f\\6f9dcda52c129dcd994c844bda1420bf.png', 'local', 'image/png', '126301', '6f9dcda52c129dcd994c844bda1420bf', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (24, NULL, '1', '1', '2026-05-25 09:42:36.757725', '2026-05-25 09:42:36.757725', '33686aa5-6102-432a-ac72-8d3d9bcd24b1.png', 'files/6/6/66d93a2c6c647a250b6687c0a5c59da6_MwHNbAa.png', 'media/files\\6\\6\\66d93a2c6c647a250b6687c0a5c59da6.png', 'local', 'image/png', '84332', '66d93a2c6c647a250b6687c0a5c59da6', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (25, NULL, '1', '1', '2026-05-25 09:42:36.765735', '2026-05-25 09:42:36.765735', '33686aa5-6102-432a-ac72-8d3d9bcd24b1.png', 'files/6/6/66d93a2c6c647a250b6687c0a5c59da6_bfC7sh1.png', 'media/files\\6\\6\\66d93a2c6c647a250b6687c0a5c59da6.png', 'local', 'image/png', '84332', '66d93a2c6c647a250b6687c0a5c59da6', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (26, NULL, '1', '1', '2026-05-25 09:42:36.776518', '2026-05-25 09:42:36.776518', '33686aa5-6102-432a-ac72-8d3d9bcd24b1.png', 'files/6/6/66d93a2c6c647a250b6687c0a5c59da6_DaeBJ7n.png', 'media/files\\6\\6\\66d93a2c6c647a250b6687c0a5c59da6.png', 'local', 'image/png', '84332', '66d93a2c6c647a250b6687c0a5c59da6', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (27, NULL, '1', '1', '2026-05-25 09:42:36.783518', '2026-05-25 09:42:36.783518', '33686aa5-6102-432a-ac72-8d3d9bcd24b1.png', 'files/6/6/66d93a2c6c647a250b6687c0a5c59da6_VwMDXqC.png', 'media/files\\6\\6\\66d93a2c6c647a250b6687c0a5c59da6.png', 'local', 'image/png', '84332', '66d93a2c6c647a250b6687c0a5c59da6', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (28, NULL, '1', '1', '2026-05-25 09:42:36.791602', '2026-05-25 09:42:36.791602', '33686aa5-6102-432a-ac72-8d3d9bcd24b1.png', 'files/6/6/66d93a2c6c647a250b6687c0a5c59da6_oTk3aOH.png', 'media/files\\6\\6\\66d93a2c6c647a250b6687c0a5c59da6.png', 'local', 'image/png', '84332', '66d93a2c6c647a250b6687c0a5c59da6', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (29, NULL, '1', '1', '2026-05-25 09:42:36.797930', '2026-05-25 09:42:36.797930', 'image.png', 'files/0/1/0107e50daf080c3045ef0704981e841d.png', 'media/files\\0\\1\\0107e50daf080c3045ef0704981e841d.png', 'local', 'image/png', '136626', '0107e50daf080c3045ef0704981e841d', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (30, NULL, '1', '1', '2026-05-25 09:42:36.805930', '2026-05-25 09:42:36.805930', '33686aa5-6102-432a-ac72-8d3d9bcd24b1.png', 'files/6/6/66d93a2c6c647a250b6687c0a5c59da6_wabFw6n.png', 'media/files\\6\\6\\66d93a2c6c647a250b6687c0a5c59da6.png', 'local', 'image/png', '84332', '66d93a2c6c647a250b6687c0a5c59da6', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (31, NULL, '1', '1', '2026-05-25 09:42:36.812931', '2026-05-25 09:42:36.812931', '新老客户占比装饰环.png', 'files/b/2/b2aef140789763ccb50dde7ae5b87096.png', 'media/files\\b\\2\\b2aef140789763ccb50dde7ae5b87096.png', 'local', 'image/png', '30526', 'b2aef140789763ccb50dde7ae5b87096', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (32, NULL, '1', '1', '2026-05-25 09:42:36.820199', '2026-05-25 09:42:36.820199', '机械臂@2x - 副本.png', 'files/8/e/8eb55a02681f5a401e449cf527a42305.png', 'media/files\\8\\e\\8eb55a02681f5a401e449cf527a42305.png', 'local', 'image/png', '2261', '8eb55a02681f5a401e449cf527a42305', 0, 0, NULL);
INSERT INTO `dvadmin_system_file_list` VALUES (33, NULL, '1', NULL, '2026-05-25 10:01:53.741242', '2026-05-25 10:01:53.742243', '星际怪兽lo.png', 'files/a/4/a4436432ad8274c24866f9791a77053c.png', 'media/files\\a\\4\\a4436432ad8274c24866f9791a77053c.png', 'local', 'image/png', '214123', 'a4436432ad8274c24866f9791a77053c', 0, 0, 1);
INSERT INTO `dvadmin_system_file_list` VALUES (34, NULL, '1', NULL, '2026-05-25 10:03:07.799437', '2026-05-25 10:03:07.799437', '星际怪兽lo.png', 'files/a/4/a4436432ad8274c24866f9791a77053c_10vM49g.png', 'media/files\\a\\4\\a4436432ad8274c24866f9791a77053c.png', 'local', 'image/png', '214123', 'a4436432ad8274c24866f9791a77053c', 0, 0, 1);

-- ----------------------------
-- Table structure for dvadmin_system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_login_log`;
CREATE TABLE `dvadmin_system_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录ip',
  `agent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'agent信息',
  `browser` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器名',
  `os` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作系统',
  `continent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '州',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '城市',
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '县区',
  `isp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营商',
  `area_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '区域代码',
  `country_english` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '英文全称',
  `country_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简称',
  `longitude` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '纬度',
  `login_type` int NOT NULL COMMENT '登录类型',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_system_login_log_creator_id_5f6dc165`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_login_log
-- ----------------------------
INSERT INTO `dvadmin_system_login_log` VALUES (1, NULL, NULL, NULL, '2026-05-25 09:59:51.550763', '2026-05-25 09:59:51.550763', 'superadmin', '127.0.0.1', 'PC / Windows 10 / Chrome 148.0.0', 'Chrome 148.0.0', 'Windows 10', '', '保留', '', '', '', '', '', '', '', '', '', 1, 1);

-- ----------------------------
-- Table structure for dvadmin_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_menu`;
CREATE TABLE `dvadmin_system_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `sort` int NULL DEFAULT NULL COMMENT '显示排序',
  `is_link` tinyint(1) NOT NULL COMMENT '是否外链',
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '链接地址',
  `is_catalog` tinyint(1) NOT NULL COMMENT '是否目录',
  `web_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件地址',
  `component_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件名称',
  `status` tinyint(1) NOT NULL COMMENT '菜单状态',
  `cache` tinyint(1) NOT NULL COMMENT '是否页面缓存',
  `visible` tinyint(1) NOT NULL COMMENT '侧边栏中是否显示',
  `is_iframe` tinyint(1) NOT NULL COMMENT '框架外显示',
  `is_affix` tinyint(1) NOT NULL COMMENT '是否固定',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上级菜单',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_system_menu_creator_id_430cdc1c`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_menu_parent_id_bc6f21bc`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_menu
-- ----------------------------
INSERT INTO `dvadmin_system_menu` VALUES (1, NULL, '1', NULL, '2026-05-25 09:42:34.463544', '2026-04-02 11:54:41.627000', 'iconfont icon-xitongshezhi', '系统管理', 1, 0, NULL, 1, '/system', '', '', 1, 0, 1, 0, 0, NULL, NULL);
INSERT INTO `dvadmin_system_menu` VALUES (2, NULL, NULL, NULL, '2026-05-25 09:42:34.474953', '2026-05-25 09:42:34.474953', 'iconfont icon-icon-', '用户管理', 1, 0, NULL, 0, '/user', 'system/user/index', 'user', 1, 0, 1, 0, 0, NULL, 1);
INSERT INTO `dvadmin_system_menu` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:42:34.482951', '2026-05-25 09:42:34.482951', 'iconfont icon-caidan', '菜单管理', 2, 0, NULL, 0, '/menu', 'system/menu/index', 'menu', 1, 0, 1, 0, 0, NULL, 1);
INSERT INTO `dvadmin_system_menu` VALUES (4, NULL, NULL, NULL, '2026-05-25 09:42:34.493461', '2026-05-25 09:42:34.493461', 'ele-OfficeBuilding', '部门管理', 3, 0, NULL, 0, '/dept', 'system/dept/index', 'dept', 1, 0, 1, 0, 0, NULL, 1);
INSERT INTO `dvadmin_system_menu` VALUES (5, NULL, NULL, NULL, '2026-05-25 09:42:34.501464', '2026-05-25 09:42:34.501464', 'ele-ColdDrink', '角色管理', 4, 0, NULL, 0, '/role', 'system/role/index', 'role', 1, 0, 1, 0, 0, NULL, 1);
INSERT INTO `dvadmin_system_menu` VALUES (6, NULL, NULL, NULL, '2026-05-25 09:42:34.508209', '2026-05-25 09:42:34.508209', 'iconfont icon-xiaoxizhongxin', '消息中心', 7, 0, NULL, 0, '/messageCenter', 'system/messageCenter/index', 'messageCenter', 1, 0, 1, 0, 0, NULL, 1);
INSERT INTO `dvadmin_system_menu` VALUES (7, NULL, NULL, NULL, '2026-05-25 09:42:34.517209', '2026-05-25 09:42:34.517209', 'ele-SetUp', '接口白名单', 8, 0, NULL, 0, '/apiWhiteList', 'system/whiteList/index', 'whiteList', 1, 0, 1, 0, 0, NULL, 1);
INSERT INTO `dvadmin_system_menu` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:34.526231', '2026-05-25 09:42:34.526231', 'ele-Download', '下载中心', 9, 0, NULL, 0, '/downloadCenter', 'system/downloadCenter/index', 'downloadCenter', 1, 0, 1, 0, 0, NULL, 1);
INSERT INTO `dvadmin_system_menu` VALUES (9, NULL, '1', NULL, '2026-05-25 09:42:34.534231', '2026-04-02 11:54:43.020000', 'iconfont icon-configure', '常规配置', 2, 0, NULL, 1, '/generalConfig', '', '', 1, 0, 1, 0, 0, NULL, NULL);
INSERT INTO `dvadmin_system_menu` VALUES (10, NULL, NULL, NULL, '2026-05-25 09:42:34.545230', '2026-05-25 09:42:34.545230', 'iconfont icon-system', '系统配置', 0, 0, NULL, 0, '/config', 'system/config/index', 'config', 1, 0, 1, 0, 0, NULL, 9);
INSERT INTO `dvadmin_system_menu` VALUES (11, NULL, NULL, NULL, '2026-05-25 09:42:34.555230', '2026-05-25 09:42:34.555230', 'iconfont icon-dict', '字典管理', 1, 0, NULL, 0, '/dictionary', 'system/dictionary/index', 'dictionary', 1, 0, 1, 0, 0, NULL, 9);
INSERT INTO `dvadmin_system_menu` VALUES (12, NULL, NULL, NULL, '2026-05-25 09:42:34.566230', '2026-05-25 09:42:34.566230', 'iconfont icon-Area', '地区管理', 2, 0, NULL, 0, '/areas', 'system/areas/index', 'areas', 1, 0, 1, 0, 0, NULL, 9);
INSERT INTO `dvadmin_system_menu` VALUES (13, NULL, NULL, NULL, '2026-05-25 09:42:34.574230', '2026-05-25 09:42:34.574230', 'iconfont icon-file', '附件管理', 3, 0, NULL, 0, '/file', 'system/fileList/index', 'file', 1, 0, 1, 0, 0, NULL, 9);
INSERT INTO `dvadmin_system_menu` VALUES (14, NULL, '1', NULL, '2026-05-25 09:42:34.584231', '2026-04-02 11:54:44.126000', 'iconfont icon-rizhi', '日志管理', 3, 0, NULL, 1, '/log', '', '', 1, 0, 1, 0, 0, NULL, NULL);
INSERT INTO `dvadmin_system_menu` VALUES (15, NULL, NULL, NULL, '2026-05-25 09:42:34.593230', '2026-05-25 09:42:34.593230', 'iconfont icon-guanlidenglurizhi', '登录日志', 1, 0, NULL, 0, '/loginLog', 'system/log/loginLog/index', 'loginLog', 1, 0, 1, 0, 0, NULL, 14);
INSERT INTO `dvadmin_system_menu` VALUES (16, NULL, NULL, NULL, '2026-05-25 09:42:34.601230', '2026-05-25 09:42:34.601230', 'iconfont icon-caozuorizhi', '操作日志', 2, 0, NULL, 0, '/operationLog', 'system/log/operationLog/index', 'operationLog', 1, 0, 1, 0, 0, NULL, 14);
INSERT INTO `dvadmin_system_menu` VALUES (17, NULL, '1', '1', '2026-05-25 09:42:34.611230', '2026-05-25 09:42:34.611230', 'iconfont icon-caijian', '定时任务', 6, 0, NULL, 1, '/celeryManage', '', '', 1, 1, 1, 0, 0, NULL, NULL);
INSERT INTO `dvadmin_system_menu` VALUES (18, NULL, NULL, '1', '2026-05-25 09:42:34.621230', '2026-05-25 09:42:34.621230', 'iconfont icon-caijian', '任务管理', 1, 0, NULL, 0, '/taskManage', 'plugins/dvadmin3-celery-web/src/taskManage/index', 'taskManage', 1, 1, 1, 0, 0, NULL, 17);
INSERT INTO `dvadmin_system_menu` VALUES (19, NULL, NULL, '1', '2026-05-25 09:42:34.631234', '2026-05-25 09:42:34.631234', 'iconfont icon--chaifenhang', '任务日志', 2, 0, NULL, 0, '/taskLog', 'plugins/dvadmin3-celery-web/src/taskManage/component/taskLog/index', 'taskLog', 1, 1, 1, 0, 0, NULL, 17);
INSERT INTO `dvadmin_system_menu` VALUES (20, NULL, NULL, NULL, '2026-05-25 09:42:34.642230', '2026-05-25 09:42:34.642230', 'ele-Ship', '护航管理', 100, 0, NULL, 1, '/escort', 'layout/routerView/parent', NULL, 1, 0, 1, 0, 0, NULL, NULL);
INSERT INTO `dvadmin_system_menu` VALUES (21, NULL, NULL, NULL, '2026-05-25 09:42:34.651230', '2026-05-25 09:42:34.651230', 'ele-User', '小程序用户管理', 1, 0, NULL, 0, '/escort/user', 'escort/user/index', NULL, 1, 0, 1, 0, 0, NULL, 20);
INSERT INTO `dvadmin_system_menu` VALUES (22, '', '1', NULL, '2026-05-25 09:42:34.662231', '2026-05-25 09:42:34.662231', 'ele-Folder', '服务游戏分类', 2, 0, NULL, 0, '/escort/service_category', 'escort/service_category/index', 'game', 1, 0, 1, 0, 0, NULL, 20);
INSERT INTO `dvadmin_system_menu` VALUES (23, '', '1', NULL, '2026-05-25 09:42:34.673230', '2026-05-25 09:42:34.673230', 'ele-ShoppingCart', '游戏商品管理', 3, 0, NULL, 0, '/escort/service', 'escort/service/index', 'shangping', 1, 0, 1, 0, 0, NULL, 20);
INSERT INTO `dvadmin_system_menu` VALUES (24, NULL, NULL, NULL, '2026-05-25 09:42:34.684231', '2026-05-25 09:42:34.684231', 'ele-Document', '订单管理', 4, 0, NULL, 0, '/escort/order', 'escort/order/index', NULL, 1, 0, 1, 0, 0, NULL, 20);
INSERT INTO `dvadmin_system_menu` VALUES (25, NULL, NULL, NULL, '2026-05-25 09:42:34.694230', '2026-05-25 09:42:34.694230', 'ele-Money', '提现审核', 5, 0, NULL, 0, '/escort/withdrawal', 'escort/withdrawal/index', NULL, 1, 0, 1, 0, 0, NULL, 20);
INSERT INTO `dvadmin_system_menu` VALUES (26, NULL, NULL, NULL, '2026-05-25 09:42:34.705263', '2026-05-25 09:42:34.705263', 'ele-Connection', '搭子管理', 6, 0, NULL, 0, '/escort/buddy', 'escort/buddy/index', NULL, 1, 0, 1, 0, 0, NULL, 20);
INSERT INTO `dvadmin_system_menu` VALUES (27, NULL, NULL, NULL, '2026-05-25 09:42:34.721179', '2026-05-25 09:42:34.721179', 'ele-Star', '评价管理', 7, 0, NULL, 0, '/escort/review', 'escort/review/index', NULL, 1, 0, 1, 0, 0, NULL, 20);
INSERT INTO `dvadmin_system_menu` VALUES (30, '', '1', '1', '2026-05-25 09:42:34.729789', '2026-05-25 09:42:34.729789', 'fa fa-gitlab', '打手管理', 8, 0, '', 0, '/escort/hunter', 'escort/hunter/index', '打手管理', 1, 1, 1, 0, 0, NULL, 20);
INSERT INTO `dvadmin_system_menu` VALUES (34, '', '1', '1', '2026-05-25 09:42:34.737791', '2026-05-25 09:42:34.737791', 'ele-Bicycle', '退款管理', 9, 0, '', 0, '/escort/refund', 'escort/refund/index', 'escortRefund', 1, 1, 1, 0, 0, NULL, 20);

-- ----------------------------
-- Table structure for dvadmin_system_menu_button
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_menu_button`;
CREATE TABLE `dvadmin_system_menu_button`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限值',
  `api` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口地址',
  `method` int NULL DEFAULT NULL COMMENT '接口请求方法',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `menu_id` bigint NOT NULL COMMENT '关联菜单',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `value`(`value` ASC) USING BTREE,
  INDEX `dvadmin_system_menu_button_creator_id_3df058f7`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_menu_button_menu_id_f6aafcd8`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_menu_button
-- ----------------------------
INSERT INTO `dvadmin_system_menu_button` VALUES (1, NULL, NULL, NULL, '2026-05-25 09:42:35.833376', '2026-05-25 09:42:35.833376', '查询', 'user:Search', '/api/system/user/', 0, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (2, NULL, NULL, NULL, '2026-05-25 09:42:35.842597', '2026-05-25 09:42:35.842597', '新增', 'user:Create', '/api/system/user/', 1, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:42:35.851953', '2026-05-25 09:42:35.851953', '编辑', 'user:Update', '/api/system/user/{id}/', 2, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (4, NULL, NULL, NULL, '2026-05-25 09:42:35.860764', '2026-05-25 09:42:35.860764', '删除', 'user:Delete', '/api/system/user/{id}/', 3, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (5, NULL, NULL, NULL, '2026-05-25 09:42:35.869767', '2026-05-25 09:42:35.869767', '导出', 'user:Export', '/api/system/user/export/', 1, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (6, NULL, NULL, NULL, '2026-05-25 09:42:35.879765', '2026-05-25 09:42:35.879765', '导入', 'user:Import', '/api/system/user/import/', 1, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (7, NULL, NULL, NULL, '2026-05-25 09:42:35.889011', '2026-05-25 09:42:35.889011', '获取导入模板', 'user:ImportTemplate', '/api/system/user/import/', 0, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:35.898017', '2026-05-25 09:42:35.898017', '批量更新模板', 'user:BatchUpdateTemplate', '/api/system/user/update_template/', 0, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (9, NULL, NULL, NULL, '2026-05-25 09:42:35.906230', '2026-05-25 09:42:35.906230', '重设密码', 'user:ResetPassword', '/api/system/user/{id}/reset_password/', 2, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (10, NULL, NULL, NULL, '2026-05-25 09:42:35.915230', '2026-05-25 09:42:35.915230', '重置密码', 'user:ResetDefaultPassword', '/api/system/user/{id}/reset_to_default_password/', 2, NULL, 2);
INSERT INTO `dvadmin_system_menu_button` VALUES (11, NULL, NULL, NULL, '2026-05-25 09:42:35.923230', '2026-05-25 09:42:35.923230', '查询', 'menu:Search', '/api/system/menu/', 0, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (12, NULL, NULL, NULL, '2026-05-25 09:42:35.931224', '2026-05-25 09:42:35.931224', '单例', 'menu:Retrieve', '/api/system/menu/{id}/', 0, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (13, NULL, NULL, NULL, '2026-05-25 09:42:35.939224', '2026-05-25 09:42:35.939224', '新增', 'menu:Create', '/api/system/menu/', 1, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (14, NULL, NULL, NULL, '2026-05-25 09:42:35.949225', '2026-05-25 09:42:35.949225', '编辑', 'menu:Update', '/api/system/menu/{id}/', 2, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (15, NULL, NULL, NULL, '2026-05-25 09:42:35.958231', '2026-05-25 09:42:35.958231', '删除', 'menu:Delete', '/api/system/menu/{id}/', 3, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (16, NULL, NULL, NULL, '2026-05-25 09:42:35.967224', '2026-05-25 09:42:35.967224', '查询所有', 'menu:SearchAll', '/api/system/menu/get_all_menu/', 0, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (17, NULL, NULL, NULL, '2026-05-25 09:42:35.976231', '2026-05-25 09:42:35.976231', '路由', 'menu:router', '/api/system/menu/web_router/', 0, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (18, NULL, NULL, NULL, '2026-05-25 09:42:35.985230', '2026-05-25 09:42:35.985230', '查询按钮', 'menu:SearchButton', '/api/system/menu_button/', 0, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (19, NULL, NULL, NULL, '2026-05-25 09:42:35.994416', '2026-05-25 09:42:35.994416', '新增按钮', 'menu:CreateButton', '/api/system/menu_button/', 1, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (20, NULL, NULL, NULL, '2026-05-25 09:42:36.002415', '2026-05-25 09:42:36.002415', '编辑按钮', 'menu:UpdateButton', '/api/system/menu_button/{id}/', 2, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (21, NULL, NULL, NULL, '2026-05-25 09:42:36.012409', '2026-05-25 09:42:36.012409', '删除按钮', 'menu:DeleteButton', '/api/system/menu_button/{id}/', 3, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (22, NULL, NULL, NULL, '2026-05-25 09:42:36.020414', '2026-05-25 09:42:36.020414', '上移', 'menu:MoveUp', '/api/system/menu/mode_up/', 1, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (23, NULL, NULL, NULL, '2026-05-25 09:42:36.027956', '2026-05-25 09:42:36.027956', '下移', 'menu:MoveDown', '/api/system/menu/mode_down/', 1, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (24, NULL, NULL, NULL, '2026-05-25 09:42:36.035648', '2026-05-25 09:42:36.035648', '查询列权限', 'column:Search', '/api/system/column/', 0, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (25, NULL, NULL, NULL, '2026-05-25 09:42:36.044648', '2026-05-25 09:42:36.044648', '新增列权限', 'column:Create', '/api/system/column/', 1, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (26, NULL, NULL, NULL, '2026-05-25 09:42:36.055334', '2026-05-25 09:42:36.055848', '编辑列权限', 'column:Update', '/api/system/column/{id}/', 2, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (27, NULL, NULL, NULL, '2026-05-25 09:42:36.062834', '2026-05-25 09:42:36.062834', '删除列权限', 'column:Delete', '/api/system/column/{id}/', 3, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (28, NULL, NULL, NULL, '2026-05-25 09:42:36.070032', '2026-05-25 09:42:36.070032', '自动匹配列权限', 'column:Match', '/api/system/column/auto_match_fields/', 1, NULL, 3);
INSERT INTO `dvadmin_system_menu_button` VALUES (29, NULL, NULL, NULL, '2026-05-25 09:42:36.077663', '2026-05-25 09:42:36.077663', '查询', 'dept:Search', '/api/system/dept/', 0, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (30, NULL, NULL, NULL, '2026-05-25 09:42:36.084645', '2026-05-25 09:42:36.084645', '详情', 'dept:Retrieve', '/api/system/dept/{id}/', 0, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (31, NULL, NULL, NULL, '2026-05-25 09:42:36.094685', '2026-05-25 09:42:36.094685', '获取所有部门', 'dept:SearchAll', '/api/system/dept/all_dept/', 0, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (32, NULL, NULL, NULL, '2026-05-25 09:42:36.102684', '2026-05-25 09:42:36.102684', '部门顶部信息', 'dept:HeaderInfo', '/api/system/dept/dept_info/', 0, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (33, NULL, NULL, NULL, '2026-05-25 09:42:36.110796', '2026-05-25 09:42:36.110796', '新增', 'dept:Create', '/api/system/dept/', 1, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (34, NULL, NULL, NULL, '2026-05-25 09:42:36.118797', '2026-05-25 09:42:36.118797', '上移', 'dept:MoveUp', '/api/system/dept/mode_up/', 1, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (35, NULL, NULL, NULL, '2026-05-25 09:42:36.126823', '2026-05-25 09:42:36.126823', '下移', 'dept:MoveDown', '/api/system/dept/mode_down/', 1, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (36, NULL, NULL, NULL, '2026-05-25 09:42:36.133403', '2026-05-25 09:42:36.133403', '编辑', 'dept:Update', '/api/system/dept/{id}/', 2, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (37, NULL, NULL, NULL, '2026-05-25 09:42:36.142112', '2026-05-25 09:42:36.142112', '删除', 'dept:Delete', '/api/system/dept/{id}/', 3, NULL, 4);
INSERT INTO `dvadmin_system_menu_button` VALUES (38, NULL, NULL, NULL, '2026-05-25 09:42:36.149378', '2026-05-25 09:42:36.149378', '查询', 'role:Search', '/api/system/role/', 0, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (39, NULL, NULL, NULL, '2026-05-25 09:42:36.156383', '2026-05-25 09:42:36.156383', '单例', 'role:Retrieve', '/api/system/role/{id}/', 0, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (40, NULL, NULL, NULL, '2026-05-25 09:42:36.165468', '2026-05-25 09:42:36.165468', '新增', 'role:Create', '/api/system/role/', 1, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (41, NULL, NULL, NULL, '2026-05-25 09:42:36.172468', '2026-05-25 09:42:36.172468', '编辑', 'role:Update', '/api/system/role/{id}/', 2, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (42, NULL, NULL, NULL, '2026-05-25 09:42:36.182468', '2026-05-25 09:42:36.182468', '删除', 'role:Delete', '/api/system/role/{id}/', 3, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (43, NULL, NULL, NULL, '2026-05-25 09:42:36.189468', '2026-05-25 09:42:36.189468', '获取所有可授权数据范围的部门', 'role:AllDataRangeDept', '/api/system/role_menu_button_permision/role_to_dept_all/', 0, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (44, NULL, NULL, NULL, '2026-05-25 09:42:36.197468', '2026-05-25 09:42:36.197468', '获取所有可授权菜单', 'role:AllCanMenu', '/api/system/role_menu_button_permision/get_role_menu/', 0, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (45, NULL, NULL, NULL, '2026-05-25 09:42:36.205469', '2026-05-25 09:42:36.205469', '获取所有已授权用户', 'role:AllAuthorizedUser', '/api/system/role/get_role_users/', 0, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (46, NULL, NULL, NULL, '2026-05-25 09:42:36.214468', '2026-05-25 09:42:36.214468', '获取菜单所有可授权按钮', 'role:AllMenuButton', '/api/system/role_menu_button_permision/get_role_menu_btn_field/', 0, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (47, NULL, NULL, NULL, '2026-05-25 09:42:36.223468', '2026-05-25 09:42:36.223468', '授权菜单', 'role:SetMenu', '/api/system/role_menu_button_permision/set_role_menu/', 2, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (48, NULL, NULL, NULL, '2026-05-25 09:42:36.231470', '2026-05-25 09:42:36.231470', '授权菜单按钮', 'role:SetMenuButton', '/api/system/role_menu_button_permision/set_role_menu_btn/', 2, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (49, NULL, NULL, NULL, '2026-05-25 09:42:36.239468', '2026-05-25 09:42:36.239468', '授权数据范围', 'role:SetDataRange', '/api/system/role_menu_button_permision/set_role_menu_btn_data_range/', 2, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (50, NULL, NULL, NULL, '2026-05-25 09:42:36.247468', '2026-05-25 09:42:36.247468', '获取所有用户', 'role:AllUser', '/api/system/user/', 0, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (51, NULL, NULL, NULL, '2026-05-25 09:42:36.256468', '2026-05-25 09:42:36.256468', '授权用户予角色', 'role:SetUserRole', '/api/system/role/{id}/set_role_users/', 2, NULL, 5);
INSERT INTO `dvadmin_system_menu_button` VALUES (52, NULL, NULL, NULL, '2026-05-25 09:42:36.264468', '2026-05-25 09:42:36.264468', '查询', 'messageCenter:Search', '/api/system/message_center/', 0, NULL, 6);
INSERT INTO `dvadmin_system_menu_button` VALUES (53, NULL, NULL, NULL, '2026-05-25 09:42:36.273468', '2026-05-25 09:42:36.273468', '详情', 'messageCenter:Retrieve', '/api/system/message_center/{id}/', 0, NULL, 6);
INSERT INTO `dvadmin_system_menu_button` VALUES (54, NULL, NULL, NULL, '2026-05-25 09:42:36.282468', '2026-05-25 09:42:36.282468', '新增', 'messageCenter:Create', '/api/system/message_center/', 1, NULL, 6);
INSERT INTO `dvadmin_system_menu_button` VALUES (55, NULL, NULL, NULL, '2026-05-25 09:42:36.290468', '2026-05-25 09:42:36.290468', '编辑', 'messageCenter:Update', '/api/system/message_center/{id}/', 2, NULL, 6);
INSERT INTO `dvadmin_system_menu_button` VALUES (56, NULL, NULL, NULL, '2026-05-25 09:42:36.297469', '2026-05-25 09:42:36.297469', '删除', 'messageCenter:Delete', '/api/system/menu/{id}/', 3, NULL, 6);
INSERT INTO `dvadmin_system_menu_button` VALUES (57, NULL, NULL, NULL, '2026-05-25 09:42:36.303467', '2026-05-25 09:42:36.303467', '查询', 'api_white_list:Search', '/api/system/api_white_list/', 0, NULL, 7);
INSERT INTO `dvadmin_system_menu_button` VALUES (58, NULL, NULL, NULL, '2026-05-25 09:42:36.312468', '2026-05-25 09:42:36.312468', '详情', 'api_white_list:Retrieve', '/api/system/api_white_list/{id}/', 0, NULL, 7);
INSERT INTO `dvadmin_system_menu_button` VALUES (59, NULL, NULL, NULL, '2026-05-25 09:42:36.320468', '2026-05-25 09:42:36.320468', '新增', 'api_white_list:Create', '/api/system/api_white_list/', 1, NULL, 7);
INSERT INTO `dvadmin_system_menu_button` VALUES (60, NULL, NULL, NULL, '2026-05-25 09:42:36.328469', '2026-05-25 09:42:36.328469', '编辑', 'api_white_list:Update', '/api/system/api_white_list/{id}/', 2, NULL, 7);
INSERT INTO `dvadmin_system_menu_button` VALUES (61, NULL, NULL, NULL, '2026-05-25 09:42:36.335468', '2026-05-25 09:42:36.335468', '删除', 'api_white_list:Delete', '/api/system/api_white_list/{id}/', 3, NULL, 7);
INSERT INTO `dvadmin_system_menu_button` VALUES (62, NULL, NULL, NULL, '2026-05-25 09:42:36.343468', '2026-05-25 09:42:36.343468', '查询', 'downloadCenter:Search', '/api/system/download_center/', 0, NULL, 8);
INSERT INTO `dvadmin_system_menu_button` VALUES (63, NULL, NULL, NULL, '2026-05-25 09:42:36.350468', '2026-05-25 09:42:36.350468', '查询', 'system_config:Search', '/api/system/system_config/', 0, NULL, 10);
INSERT INTO `dvadmin_system_menu_button` VALUES (64, NULL, NULL, NULL, '2026-05-25 09:42:36.358468', '2026-05-25 09:42:36.358468', '详情', 'system_config:Retrieve', '/api/system/system_config/{id}/', 0, NULL, 10);
INSERT INTO `dvadmin_system_menu_button` VALUES (65, NULL, NULL, NULL, '2026-05-25 09:42:36.367472', '2026-05-25 09:42:36.367472', '新增', 'system_config:Create', '/api/system/system_config/', 1, NULL, 10);
INSERT INTO `dvadmin_system_menu_button` VALUES (66, NULL, NULL, NULL, '2026-05-25 09:42:36.375468', '2026-05-25 09:42:36.375468', '编辑', 'system_config:Update', '/api/system/system_config/{id}/', 2, NULL, 10);
INSERT INTO `dvadmin_system_menu_button` VALUES (67, NULL, NULL, NULL, '2026-05-25 09:42:36.382468', '2026-05-25 09:42:36.382468', '删除', 'system_config:Delete', '/api/system/system_config/{id}/', 3, NULL, 10);
INSERT INTO `dvadmin_system_menu_button` VALUES (68, NULL, NULL, NULL, '2026-05-25 09:42:36.391914', '2026-05-25 09:42:36.391914', '查询', 'dictionary:Search', '/api/system/dictionary/', 0, NULL, 11);
INSERT INTO `dvadmin_system_menu_button` VALUES (69, NULL, NULL, NULL, '2026-05-25 09:42:36.400914', '2026-05-25 09:42:36.400914', '详情', 'dictionary:Retrieve', '/api/system/dictionary/{id}/', 0, NULL, 11);
INSERT INTO `dvadmin_system_menu_button` VALUES (70, NULL, NULL, NULL, '2026-05-25 09:42:36.409913', '2026-05-25 09:42:36.409913', '新增', 'dictionary:Create', '/api/system/dictionary/', 1, NULL, 11);
INSERT INTO `dvadmin_system_menu_button` VALUES (71, NULL, NULL, NULL, '2026-05-25 09:42:36.422459', '2026-05-25 09:42:36.422459', '编辑', 'dictionary:Update', '/api/system/dictionary/{id}/', 2, NULL, 11);
INSERT INTO `dvadmin_system_menu_button` VALUES (72, NULL, NULL, NULL, '2026-05-25 09:42:36.430913', '2026-05-25 09:42:36.430913', '删除', 'dictionary:Delete', '/api/system/dictionary/{id}/', 3, NULL, 11);
INSERT INTO `dvadmin_system_menu_button` VALUES (73, NULL, NULL, NULL, '2026-05-25 09:42:36.438075', '2026-05-25 09:42:36.438075', '查询', 'area:Search', '/api/system/area/', 0, NULL, 12);
INSERT INTO `dvadmin_system_menu_button` VALUES (74, NULL, NULL, NULL, '2026-05-25 09:42:36.444706', '2026-05-25 09:42:36.444706', '详情', 'area:Retrieve', '/api/system/area/{id}/', 0, NULL, 12);
INSERT INTO `dvadmin_system_menu_button` VALUES (75, NULL, NULL, NULL, '2026-05-25 09:42:36.453706', '2026-05-25 09:42:36.453706', '新增', 'area:Create', '/api/system/area/', 1, NULL, 12);
INSERT INTO `dvadmin_system_menu_button` VALUES (76, NULL, NULL, NULL, '2026-05-25 09:42:36.461706', '2026-05-25 09:42:36.461706', '编辑', 'area:Update', '/api/system/area/{id}/', 2, NULL, 12);
INSERT INTO `dvadmin_system_menu_button` VALUES (77, NULL, NULL, NULL, '2026-05-25 09:42:36.469706', '2026-05-25 09:42:36.469706', '删除', 'area:Delete', '/api/system/area/{id}/', 3, NULL, 12);
INSERT INTO `dvadmin_system_menu_button` VALUES (78, NULL, NULL, NULL, '2026-05-25 09:42:36.478741', '2026-05-25 09:42:36.478741', '详情', 'file:Retrieve', '/api/system/file/{id}/', 0, NULL, 13);
INSERT INTO `dvadmin_system_menu_button` VALUES (79, NULL, NULL, NULL, '2026-05-25 09:42:36.486740', '2026-05-25 09:42:36.486740', '查询', 'file:Search', '/api/system/file/', 0, NULL, 13);
INSERT INTO `dvadmin_system_menu_button` VALUES (80, NULL, NULL, NULL, '2026-05-25 09:42:36.495200', '2026-05-25 09:42:36.495200', '编辑', 'file:Update', '/api/system/file/{id}/', 1, NULL, 13);
INSERT INTO `dvadmin_system_menu_button` VALUES (81, NULL, NULL, NULL, '2026-05-25 09:42:36.503200', '2026-05-25 09:42:36.503200', '删除', 'file:Delete', '/api/system/file/{id}/', 3, NULL, 13);
INSERT INTO `dvadmin_system_menu_button` VALUES (82, NULL, NULL, NULL, '2026-05-25 09:42:36.511668', '2026-05-25 09:42:36.511668', '查询', 'login_log:Search', '/api/system/login_log/', 0, NULL, 15);
INSERT INTO `dvadmin_system_menu_button` VALUES (83, NULL, NULL, NULL, '2026-05-25 09:42:36.520075', '2026-05-25 09:42:36.520075', '详情', 'login_log:Retrieve', '/api/system/login_log/{id}/', 0, NULL, 15);
INSERT INTO `dvadmin_system_menu_button` VALUES (84, NULL, NULL, NULL, '2026-05-25 09:42:36.527076', '2026-05-25 09:42:36.527076', '详情', 'operation_log:Retrieve', '/api/system/operation_log/{id}/', 0, NULL, 16);
INSERT INTO `dvadmin_system_menu_button` VALUES (85, NULL, NULL, NULL, '2026-05-25 09:42:36.535076', '2026-05-25 09:42:36.535076', '查询', 'operation_log:Search', '/api/system/operation_log/', 0, NULL, 16);

-- ----------------------------
-- Table structure for dvadmin_system_menu_field
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_menu_field`;
CREATE TABLE `dvadmin_system_menu_field`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_system_menu_field_creator_id_084838f6`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_menu_field_menu_id_ebf37091`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_menu_field
-- ----------------------------
INSERT INTO `dvadmin_system_menu_field` VALUES (1, NULL, NULL, NULL, '2026-05-25 09:42:34.746835', '2026-05-25 09:42:34.746835', 'Users', 'avatar', '头像', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (2, NULL, NULL, NULL, '2026-05-25 09:42:34.755825', '2026-05-25 09:42:34.755825', 'Users', 'create_datetime', '创建时间', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:42:34.767029', '2026-05-25 09:42:34.767029', 'Users', 'creator', '创建人', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (4, NULL, NULL, NULL, '2026-05-25 09:42:34.775039', '2026-05-25 09:42:34.775039', 'Users', 'dept', '所属部门', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (5, NULL, NULL, NULL, '2026-05-25 09:42:34.781044', '2026-05-25 09:42:34.781044', 'Users', 'dept_belong_id', '数据归属部门', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (6, NULL, NULL, NULL, '2026-05-25 09:42:34.791040', '2026-05-25 09:42:34.791040', 'Users', 'description', '描述', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (7, NULL, NULL, NULL, '2026-05-25 09:42:34.800040', '2026-05-25 09:42:34.800040', 'Users', 'email', '邮箱', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (8, NULL, NULL, NULL, '2026-05-25 09:42:34.809038', '2026-05-25 09:42:34.809038', 'Users', 'gender', '性别', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (9, NULL, NULL, NULL, '2026-05-25 09:42:34.821122', '2026-05-25 09:42:34.821122', 'Users', 'id', 'Id', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (10, NULL, NULL, NULL, '2026-05-25 09:42:34.831152', '2026-05-25 09:42:34.831152', 'Users', 'mobile', '电话', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (11, NULL, NULL, NULL, '2026-05-25 09:42:34.837151', '2026-05-25 09:42:34.837151', 'Users', 'modifier', '修改人', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (12, NULL, NULL, NULL, '2026-05-25 09:42:34.845151', '2026-05-25 09:42:34.845151', 'Users', 'name', '姓名', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (13, NULL, NULL, NULL, '2026-05-25 09:42:34.855707', '2026-05-25 09:42:34.855707', 'Users', 'update_datetime', '修改时间', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (14, NULL, NULL, NULL, '2026-05-25 09:42:34.863709', '2026-05-25 09:42:34.863709', 'Users', 'username', '用户账号', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (15, NULL, NULL, NULL, '2026-05-25 09:42:34.872710', '2026-05-25 09:42:34.872710', 'Users', 'user_type', '用户类型', NULL, 2);
INSERT INTO `dvadmin_system_menu_field` VALUES (16, NULL, NULL, NULL, '2026-05-25 09:42:34.883709', '2026-05-25 09:42:34.883709', 'Role', 'create_datetime', '创建时间', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (17, NULL, NULL, NULL, '2026-05-25 09:42:34.893712', '2026-05-25 09:42:34.893712', 'Role', 'creator', '创建人', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (18, NULL, NULL, NULL, '2026-05-25 09:42:34.903708', '2026-05-25 09:42:34.903708', 'Role', 'dept_belong_id', '数据归属部门', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (19, NULL, NULL, NULL, '2026-05-25 09:42:34.911745', '2026-05-25 09:42:34.911745', 'Role', 'description', '描述', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (20, NULL, NULL, NULL, '2026-05-25 09:42:34.920707', '2026-05-25 09:42:34.920707', 'Role', 'id', 'Id', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (21, NULL, NULL, NULL, '2026-05-25 09:42:34.927709', '2026-05-25 09:42:34.927709', 'Role', 'key', '权限字符', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (22, NULL, NULL, NULL, '2026-05-25 09:42:34.936706', '2026-05-25 09:42:34.936706', 'Role', 'modifier', '修改人', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (23, NULL, NULL, NULL, '2026-05-25 09:42:34.945711', '2026-05-25 09:42:34.945711', 'Role', 'name', '角色名称', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (24, NULL, NULL, NULL, '2026-05-25 09:42:34.954710', '2026-05-25 09:42:34.954710', 'Role', 'sort', '角色顺序', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (25, NULL, NULL, NULL, '2026-05-25 09:42:34.963708', '2026-05-25 09:42:34.963708', 'Role', 'status', '角色状态', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (26, NULL, NULL, NULL, '2026-05-25 09:42:34.971535', '2026-05-25 09:42:34.971535', 'Role', 'update_datetime', '修改时间', NULL, 5);
INSERT INTO `dvadmin_system_menu_field` VALUES (27, NULL, NULL, NULL, '2026-05-25 09:42:34.979920', '2026-05-25 09:42:34.979920', 'MessageCenter', 'content', '内容', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (28, NULL, NULL, NULL, '2026-05-25 09:42:34.986919', '2026-05-25 09:42:34.986919', 'MessageCenter', 'create_datetime', '创建时间', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (29, NULL, NULL, NULL, '2026-05-25 09:42:34.995919', '2026-05-25 09:42:34.995919', 'MessageCenter', 'creator', '创建人', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (30, NULL, NULL, NULL, '2026-05-25 09:42:35.005031', '2026-05-25 09:42:35.005031', 'MessageCenter', 'dept_belong_id', '数据归属部门', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (31, NULL, NULL, NULL, '2026-05-25 09:42:35.012779', '2026-05-25 09:42:35.012779', 'MessageCenter', 'description', '描述', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (32, NULL, NULL, NULL, '2026-05-25 09:42:35.021778', '2026-05-25 09:42:35.021778', 'MessageCenter', 'id', 'Id', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (33, NULL, NULL, NULL, '2026-05-25 09:42:35.028863', '2026-05-25 09:42:35.028863', 'MessageCenter', 'modifier', '修改人', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (34, NULL, NULL, NULL, '2026-05-25 09:42:35.036818', '2026-05-25 09:42:35.036818', 'MessageCenter', 'target_type', '目标类型', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (35, NULL, NULL, NULL, '2026-05-25 09:42:35.044886', '2026-05-25 09:42:35.044886', 'MessageCenter', 'title', '标题', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (36, NULL, NULL, NULL, '2026-05-25 09:42:35.056147', '2026-05-25 09:42:35.056147', 'MessageCenter', 'update_datetime', '修改时间', NULL, 6);
INSERT INTO `dvadmin_system_menu_field` VALUES (37, NULL, NULL, NULL, '2026-05-25 09:42:35.064149', '2026-05-25 09:42:35.064149', 'ApiWhiteList', 'create_datetime', '创建时间', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (38, NULL, NULL, NULL, '2026-05-25 09:42:35.075968', '2026-05-25 09:42:35.075968', 'ApiWhiteList', 'creator', '创建人', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (39, NULL, NULL, NULL, '2026-05-25 09:42:35.083963', '2026-05-25 09:42:35.083963', 'ApiWhiteList', 'dept_belong_id', '数据归属部门', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (40, NULL, NULL, NULL, '2026-05-25 09:42:35.092963', '2026-05-25 09:42:35.092963', 'ApiWhiteList', 'description', '描述', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (41, NULL, NULL, NULL, '2026-05-25 09:42:35.103989', '2026-05-25 09:42:35.103989', 'ApiWhiteList', 'enable_datasource', '激活数据权限', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (42, NULL, NULL, NULL, '2026-05-25 09:42:35.114990', '2026-05-25 09:42:35.114990', 'ApiWhiteList', 'id', 'Id', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (43, NULL, NULL, NULL, '2026-05-25 09:42:35.123859', '2026-05-25 09:42:35.123859', 'ApiWhiteList', 'method', '接口请求方法', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (44, NULL, NULL, NULL, '2026-05-25 09:42:35.132278', '2026-05-25 09:42:35.132278', 'ApiWhiteList', 'modifier', '修改人', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (45, NULL, NULL, NULL, '2026-05-25 09:42:35.138904', '2026-05-25 09:42:35.138904', 'ApiWhiteList', 'update_datetime', '修改时间', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (46, NULL, NULL, NULL, '2026-05-25 09:42:35.145657', '2026-05-25 09:42:35.145657', 'ApiWhiteList', 'url', 'url', NULL, 7);
INSERT INTO `dvadmin_system_menu_field` VALUES (47, NULL, NULL, NULL, '2026-05-25 09:42:35.153971', '2026-05-25 09:42:35.153971', 'Dictionary', 'color', '颜色', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (48, NULL, NULL, NULL, '2026-05-25 09:42:35.161840', '2026-05-25 09:42:35.161840', 'Dictionary', 'create_datetime', '创建时间', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (49, NULL, NULL, NULL, '2026-05-25 09:42:35.169966', '2026-05-25 09:42:35.169966', 'Dictionary', 'creator', '创建人', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (50, NULL, NULL, NULL, '2026-05-25 09:42:35.176966', '2026-05-25 09:42:35.176966', 'Dictionary', 'dept_belong_id', '数据归属部门', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (51, NULL, NULL, NULL, '2026-05-25 09:42:35.184966', '2026-05-25 09:42:35.184966', 'Dictionary', 'description', '描述', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (52, NULL, NULL, NULL, '2026-05-25 09:42:35.193318', '2026-05-25 09:42:35.193318', 'Dictionary', 'id', 'Id', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (53, NULL, NULL, NULL, '2026-05-25 09:42:35.201320', '2026-05-25 09:42:35.201320', 'Dictionary', 'is_value', '是否为value值', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (54, NULL, NULL, NULL, '2026-05-25 09:42:35.209313', '2026-05-25 09:42:35.209313', 'Dictionary', 'label', '字典名称', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (55, NULL, NULL, NULL, '2026-05-25 09:42:35.217311', '2026-05-25 09:42:35.217311', 'Dictionary', 'modifier', '修改人', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (56, NULL, NULL, NULL, '2026-05-25 09:42:35.225320', '2026-05-25 09:42:35.225320', 'Dictionary', 'parent', '父级', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (57, NULL, NULL, NULL, '2026-05-25 09:42:35.232795', '2026-05-25 09:42:35.232795', 'Dictionary', 'remark', '备注', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (58, NULL, NULL, NULL, '2026-05-25 09:42:35.239960', '2026-05-25 09:42:35.239960', 'Dictionary', 'sort', '显示排序', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (59, NULL, NULL, NULL, '2026-05-25 09:42:35.247960', '2026-05-25 09:42:35.247960', 'Dictionary', 'status', '状态', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (60, NULL, NULL, NULL, '2026-05-25 09:42:35.254960', '2026-05-25 09:42:35.254960', 'Dictionary', 'type', '数据值类型', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (61, NULL, NULL, NULL, '2026-05-25 09:42:35.263201', '2026-05-25 09:42:35.263201', 'Dictionary', 'update_datetime', '修改时间', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (62, NULL, NULL, NULL, '2026-05-25 09:42:35.270455', '2026-05-25 09:42:35.270455', 'Dictionary', 'value', '字典编号', NULL, 11);
INSERT INTO `dvadmin_system_menu_field` VALUES (63, NULL, NULL, NULL, '2026-05-25 09:42:35.278313', '2026-05-25 09:42:35.278313', 'Area', 'code', '地区编码', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (64, NULL, NULL, NULL, '2026-05-25 09:42:35.286732', '2026-05-25 09:42:35.286732', 'Area', 'create_datetime', '创建时间', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (65, NULL, NULL, NULL, '2026-05-25 09:42:35.293742', '2026-05-25 09:42:35.293742', 'Area', 'creator', '创建人', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (66, NULL, NULL, NULL, '2026-05-25 09:42:35.302138', '2026-05-25 09:42:35.302138', 'Area', 'dept_belong_id', '数据归属部门', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (67, NULL, NULL, NULL, '2026-05-25 09:42:35.311522', '2026-05-25 09:42:35.311522', 'Area', 'description', '描述', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (68, NULL, NULL, NULL, '2026-05-25 09:42:35.320215', '2026-05-25 09:42:35.320215', 'Area', 'enable', '是否启用', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (69, NULL, NULL, NULL, '2026-05-25 09:42:35.329216', '2026-05-25 09:42:35.329216', 'Area', 'id', 'Id', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (70, NULL, NULL, NULL, '2026-05-25 09:42:35.335216', '2026-05-25 09:42:35.335216', 'Area', 'initials', '首字母', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (71, NULL, NULL, NULL, '2026-05-25 09:42:35.342269', '2026-05-25 09:42:35.342269', 'Area', 'level', '地区层级(1省份 2城市 3区县 4乡级)', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (72, NULL, NULL, NULL, '2026-05-25 09:42:35.351736', '2026-05-25 09:42:35.351736', 'Area', 'modifier', '修改人', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (73, NULL, NULL, NULL, '2026-05-25 09:42:35.359482', '2026-05-25 09:42:35.359482', 'Area', 'name', '名称', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (74, NULL, NULL, NULL, '2026-05-25 09:42:35.367211', '2026-05-25 09:42:35.367211', 'Area', 'pcode', '父地区编码', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (75, NULL, NULL, NULL, '2026-05-25 09:42:35.375207', '2026-05-25 09:42:35.375207', 'Area', 'pinyin', '拼音', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (76, NULL, NULL, NULL, '2026-05-25 09:42:35.382254', '2026-05-25 09:42:35.382254', 'Area', 'update_datetime', '修改时间', NULL, 12);
INSERT INTO `dvadmin_system_menu_field` VALUES (77, NULL, NULL, NULL, '2026-05-25 09:42:35.391261', '2026-05-25 09:42:35.391261', 'FileList', 'create_datetime', '创建时间', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (78, NULL, NULL, NULL, '2026-05-25 09:42:35.399403', '2026-05-25 09:42:35.399403', 'FileList', 'creator', '创建人', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (79, NULL, NULL, NULL, '2026-05-25 09:42:35.406284', '2026-05-25 09:42:35.406284', 'FileList', 'dept_belong_id', '数据归属部门', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (80, NULL, NULL, NULL, '2026-05-25 09:42:35.413284', '2026-05-25 09:42:35.413284', 'FileList', 'description', '描述', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (81, NULL, NULL, NULL, '2026-05-25 09:42:35.422101', '2026-05-25 09:42:35.422101', 'FileList', 'engine', '引擎', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (82, NULL, NULL, NULL, '2026-05-25 09:42:35.431176', '2026-05-25 09:42:35.431176', 'FileList', 'file_url', '文件地址', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (83, NULL, NULL, NULL, '2026-05-25 09:42:35.438695', '2026-05-25 09:42:35.438695', 'FileList', 'id', 'Id', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (84, NULL, NULL, NULL, '2026-05-25 09:42:35.446692', '2026-05-25 09:42:35.446692', 'FileList', 'md5sum', '文件md5', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (85, NULL, NULL, NULL, '2026-05-25 09:42:35.454693', '2026-05-25 09:42:35.454693', 'FileList', 'mime_type', 'Mime类型', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (86, NULL, NULL, NULL, '2026-05-25 09:42:35.462693', '2026-05-25 09:42:35.462693', 'FileList', 'modifier', '修改人', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (87, NULL, NULL, NULL, '2026-05-25 09:42:35.470692', '2026-05-25 09:42:35.470692', 'FileList', 'name', '名称', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (88, NULL, NULL, NULL, '2026-05-25 09:42:35.477692', '2026-05-25 09:42:35.477692', 'FileList', 'size', '文件大小', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (89, NULL, NULL, NULL, '2026-05-25 09:42:35.484693', '2026-05-25 09:42:35.484693', 'FileList', 'update_datetime', '修改时间', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (90, NULL, NULL, NULL, '2026-05-25 09:42:35.492694', '2026-05-25 09:42:35.492694', 'FileList', 'url', 'url', NULL, 13);
INSERT INTO `dvadmin_system_menu_field` VALUES (91, NULL, NULL, NULL, '2026-05-25 09:42:35.500693', '2026-05-25 09:42:35.500693', 'LoginLog', 'agent', 'agent信息', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (92, NULL, NULL, NULL, '2026-05-25 09:42:35.509693', '2026-05-25 09:42:35.509693', 'LoginLog', 'area_code', '区域代码', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (93, NULL, NULL, NULL, '2026-05-25 09:42:35.518694', '2026-05-25 09:42:35.518694', 'LoginLog', 'browser', '浏览器名', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (94, NULL, NULL, NULL, '2026-05-25 09:42:35.524881', '2026-05-25 09:42:35.524881', 'LoginLog', 'city', '城市', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (95, NULL, NULL, NULL, '2026-05-25 09:42:35.532896', '2026-05-25 09:42:35.532896', 'LoginLog', 'continent', '州', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (96, NULL, NULL, NULL, '2026-05-25 09:42:35.540468', '2026-05-25 09:42:35.540468', 'LoginLog', 'country', '国家', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (97, NULL, NULL, NULL, '2026-05-25 09:42:35.548469', '2026-05-25 09:42:35.548469', 'LoginLog', 'country_code', '简称', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (98, NULL, NULL, NULL, '2026-05-25 09:42:35.555468', '2026-05-25 09:42:35.555468', 'LoginLog', 'country_english', '英文全称', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (99, NULL, NULL, NULL, '2026-05-25 09:42:35.562625', '2026-05-25 09:42:35.562625', 'LoginLog', 'create_datetime', '创建时间', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (100, NULL, NULL, NULL, '2026-05-25 09:42:35.571701', '2026-05-25 09:42:35.571701', 'LoginLog', 'creator', '创建人', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (101, NULL, NULL, NULL, '2026-05-25 09:42:35.579164', '2026-05-25 09:42:35.579164', 'LoginLog', 'dept_belong_id', '数据归属部门', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (102, NULL, NULL, NULL, '2026-05-25 09:42:35.586170', '2026-05-25 09:42:35.586170', 'LoginLog', 'description', '描述', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (103, NULL, NULL, NULL, '2026-05-25 09:42:35.592460', '2026-05-25 09:42:35.592460', 'LoginLog', 'district', '县区', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (104, NULL, NULL, NULL, '2026-05-25 09:42:35.599460', '2026-05-25 09:42:35.599460', 'LoginLog', 'id', 'Id', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (105, NULL, NULL, NULL, '2026-05-25 09:42:35.609544', '2026-05-25 09:42:35.609544', 'LoginLog', 'ip', '登录ip', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (106, NULL, NULL, NULL, '2026-05-25 09:42:35.617537', '2026-05-25 09:42:35.617537', 'LoginLog', 'isp', '运营商', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (107, NULL, NULL, NULL, '2026-05-25 09:42:35.625545', '2026-05-25 09:42:35.625545', 'LoginLog', 'latitude', '纬度', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (108, NULL, NULL, NULL, '2026-05-25 09:42:35.632544', '2026-05-25 09:42:35.632544', 'LoginLog', 'login_type', '登录类型', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (109, NULL, NULL, NULL, '2026-05-25 09:42:35.642681', '2026-05-25 09:42:35.642681', 'LoginLog', 'longitude', '经度', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (110, NULL, NULL, NULL, '2026-05-25 09:42:35.648696', '2026-05-25 09:42:35.648696', 'LoginLog', 'modifier', '修改人', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (111, NULL, NULL, NULL, '2026-05-25 09:42:35.655701', '2026-05-25 09:42:35.655701', 'LoginLog', 'os', '操作系统', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (112, NULL, NULL, NULL, '2026-05-25 09:42:35.664701', '2026-05-25 09:42:35.664701', 'LoginLog', 'province', '省份', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (113, NULL, NULL, NULL, '2026-05-25 09:42:35.673784', '2026-05-25 09:42:35.673784', 'LoginLog', 'update_datetime', '修改时间', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (114, NULL, NULL, NULL, '2026-05-25 09:42:35.682126', '2026-05-25 09:42:35.682126', 'LoginLog', 'username', '登录用户名', NULL, 15);
INSERT INTO `dvadmin_system_menu_field` VALUES (115, NULL, NULL, NULL, '2026-05-25 09:42:35.690125', '2026-05-25 09:42:35.690125', 'OperationLog', 'create_datetime', '创建时间', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (116, NULL, NULL, NULL, '2026-05-25 09:42:35.696679', '2026-05-25 09:42:35.696679', 'OperationLog', 'creator', '创建人', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (117, NULL, NULL, NULL, '2026-05-25 09:42:35.705490', '2026-05-25 09:42:35.705490', 'OperationLog', 'dept_belong_id', '数据归属部门', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (118, NULL, NULL, NULL, '2026-05-25 09:42:35.713426', '2026-05-25 09:42:35.713426', 'OperationLog', 'description', '描述', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (119, NULL, NULL, NULL, '2026-05-25 09:42:35.723433', '2026-05-25 09:42:35.723433', 'OperationLog', 'id', 'Id', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (120, NULL, NULL, NULL, '2026-05-25 09:42:35.733431', '2026-05-25 09:42:35.733431', 'OperationLog', 'json_result', '返回信息', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (121, NULL, NULL, NULL, '2026-05-25 09:42:35.740699', '2026-05-25 09:42:35.740699', 'OperationLog', 'modifier', '修改人', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (122, NULL, NULL, NULL, '2026-05-25 09:42:35.748717', '2026-05-25 09:42:35.748717', 'OperationLog', 'request_body', '请求参数', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (123, NULL, NULL, NULL, '2026-05-25 09:42:35.756722', '2026-05-25 09:42:35.756722', 'OperationLog', 'request_browser', '请求浏览器', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (124, NULL, NULL, NULL, '2026-05-25 09:42:35.765751', '2026-05-25 09:42:35.765751', 'OperationLog', 'request_ip', '请求ip地址', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (125, NULL, NULL, NULL, '2026-05-25 09:42:35.773768', '2026-05-25 09:42:35.773768', 'OperationLog', 'request_method', '请求方式', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (126, NULL, NULL, NULL, '2026-05-25 09:42:35.780970', '2026-05-25 09:42:35.780970', 'OperationLog', 'request_modular', '请求模块', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (127, NULL, NULL, NULL, '2026-05-25 09:42:35.788566', '2026-05-25 09:42:35.788566', 'OperationLog', 'request_msg', '操作说明', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (128, NULL, NULL, NULL, '2026-05-25 09:42:35.795283', '2026-05-25 09:42:35.795283', 'OperationLog', 'request_os', '操作系统', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (129, NULL, NULL, NULL, '2026-05-25 09:42:35.802283', '2026-05-25 09:42:35.802283', 'OperationLog', 'request_path', '请求地址', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (130, NULL, NULL, NULL, '2026-05-25 09:42:35.809477', '2026-05-25 09:42:35.809477', 'OperationLog', 'response_code', '响应状态码', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (131, NULL, NULL, NULL, '2026-05-25 09:42:35.817376', '2026-05-25 09:42:35.817376', 'OperationLog', 'status', '响应状态', NULL, 16);
INSERT INTO `dvadmin_system_menu_field` VALUES (132, NULL, NULL, NULL, '2026-05-25 09:42:35.825369', '2026-05-25 09:42:35.825369', 'OperationLog', 'update_datetime', '修改时间', NULL, 16);

-- ----------------------------
-- Table structure for dvadmin_system_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_operation_log`;
CREATE TABLE `dvadmin_system_operation_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `request_modular` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求模块',
  `request_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求地址',
  `request_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求参数',
  `request_method` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方式',
  `request_msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '操作说明',
  `request_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求ip地址',
  `request_browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求浏览器',
  `response_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '响应状态码',
  `request_os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作系统',
  `json_result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '返回信息',
  `status` tinyint(1) NOT NULL COMMENT '响应状态',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_system_operation_log_creator_id_0914479c`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_operation_log
-- ----------------------------
INSERT INTO `dvadmin_system_operation_log` VALUES (1, NULL, NULL, NULL, '2026-05-25 09:45:01.528965', '2026-05-25 09:45:01.507965', '登录模块', '/api/login/', '{\'username\': \'superadmin\', \'password\': \'***********\', \'captcha\': \'1234\', \'captchaKey\': \'0\', \'captchaImgBase\': \'\'}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '4000', 'Windows 10', '{\'code\': 4000, \'msg\': \'您登录的账号不存在\'}', 0, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (2, NULL, NULL, NULL, '2026-05-25 09:53:11.554279', '2026-05-25 09:53:11.530269', '登录模块', '/api/login/', '{\'username\': \'superadmin\', \'password\': \'***********\', \'captcha\': \'1234\', \'captchaKey\': \'0\', \'captchaImgBase\': \'\'}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '4000', 'Windows 10', '{\'code\': 4000, \'msg\': \'您登录的账号不存在\'}', 0, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (3, NULL, NULL, NULL, '2026-05-25 09:59:51.585343', '2026-05-25 09:59:50.799659', '登录模块', '/api/login/', '{\'username\': \'superadmin\', \'password\': \'***********\', \'captcha\': \'1234\', \'captchaKey\': \'0\', \'captchaImgBase\': \'\'}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'请求成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (4, NULL, NULL, NULL, '2026-05-25 10:00:03.307963', '2026-05-25 10:00:03.050052', '用户表', '/api/system/user/login_change_password/', '{\'username\': \'superadmin\', \'password\': \'********************************\', \'password_regain\': \'a66abb5684c45962d887564f08346e8d\'}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'修改成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (5, NULL, NULL, NULL, '2026-05-25 10:01:54.115427', '2026-05-25 10:01:53.725243', '文件管理', '/api/system/file/', '{}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'新增成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (6, NULL, NULL, NULL, '2026-05-25 10:02:34.300182', '2026-05-25 10:02:34.268643', '陪玩服务', '/api/escort/web/service/', '{\'service_type\': 1, \'required_hunters\': 1, \'sort\': 0, \'is_active\': True, \'description\': \'<p>使用mysql8.0数据库新增的跑刀测试单</p>\', \'name\': \'跑刀\', \'category\': 10, \'price\': 0.6, \'duration\': 240, \'images\': [\'media/files/a/4/a4436432ad8274c24866f9791a77053c.png\']}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'新增成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (7, NULL, NULL, NULL, '2026-05-25 10:02:34.367177', '2026-05-25 10:02:34.343177', '陪玩服务', '/api/escort/web/service/16/save_images/', '{\'images\': [\'media/files/a/4/a4436432ad8274c24866f9791a77053c.png\']}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'图片保存成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (8, NULL, NULL, NULL, '2026-05-25 10:03:07.813358', '2026-05-25 10:03:07.783440', '文件管理', '/api/system/file/', '{}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'新增成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (9, NULL, NULL, NULL, '2026-05-25 10:03:25.633818', '2026-05-25 10:03:25.605812', '陪玩服务', '/api/escort/web/service/', '{\'service_type\': 2, \'required_hunters\': 2, \'sort\': 0, \'is_active\': True, \'name\': \'护航【手游】\', \'category\': 10, \'price\': 0.88, \'duration\': 60, \'images\': [\'media/files/a/4/a4436432ad8274c24866f9791a77053c.png\'], \'description\': \'<p>测试mysql本地护航单</p>\'}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'新增成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (10, NULL, NULL, NULL, '2026-05-25 10:03:25.686813', '2026-05-25 10:03:25.661812', '陪玩服务', '/api/escort/web/service/17/save_images/', '{\'images\': [\'media/files/a/4/a4436432ad8274c24866f9791a77053c.png\']}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'图片保存成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (11, NULL, NULL, NULL, '2026-05-25 10:04:28.439553', '2026-05-25 10:04:28.402561', '陪玩订单', '/api/escort/app/order/', '{\'service\': \'16\', \'total_amount\': \'0.60\', \'game_account\': \'测试账号\', \'game_server\': \'端游steam\', \'game_mode\': \'跑刀\', \'special_requirements\': \'4格以上大红留着\'}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', NULL, 'iOS 15.0', '{\'code\': None, \'msg\': \'订单创建成功\'}', 0, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (12, NULL, NULL, NULL, '2026-05-25 10:04:29.756015', '2026-05-25 10:04:29.334163', '陪玩订单', '/api/escort/app/order/wx_pay/', '{\'order_no\': \'EP16E2BA1DF3E9\'}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'success\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (13, NULL, NULL, NULL, '2026-05-25 10:05:51.399032', '2026-05-25 10:05:51.363996', '陪玩订单', '/api/escort/app/order/21/accept/', '{}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'接单成功，订单已开始服务\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (14, NULL, NULL, NULL, '2026-05-25 10:05:58.792454', '2026-05-25 10:05:58.770949', '陪玩订单', '/api/escort/app/order/21/hunter_complete/', '{}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '400', 'iOS 15.0', '{\'code\': 400, \'msg\': \'当前状态无法开始服务\'}', 0, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (15, NULL, NULL, NULL, '2026-05-25 10:06:13.426814', '2026-05-25 10:06:13.401303', '陪玩订单', '/api/escort/app/order/21/confirm_service_done/', '{}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'已确认服务完成，等待您最终确认并完成支付结算\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (16, NULL, NULL, NULL, '2026-05-25 10:06:16.989815', '2026-05-25 10:06:16.957808', '陪玩订单', '/api/escort/app/order/21/confirm_complete/', '{}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'订单已完成，收益已打入打手账户\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (17, NULL, NULL, NULL, '2026-05-25 10:07:48.846841', '2026-05-25 10:07:48.818411', '陪玩订单', '/api/escort/app/order/', '{\'service\': \'17\', \'total_amount\': \'0.88\', \'game_account\': \'测试333\', \'game_server\': \'wegame端游\', \'game_mode\': \'猛攻\', \'special_requirements\': \'必须欧美\'}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', NULL, 'iOS 15.0', '{\'code\': None, \'msg\': \'订单创建成功\'}', 0, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (18, NULL, NULL, NULL, '2026-05-25 10:07:50.235354', '2026-05-25 10:07:49.760302', '陪玩订单', '/api/escort/app/order/wx_pay/', '{\'order_no\': \'EP449BB147E61B\'}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'success\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (19, NULL, NULL, NULL, '2026-05-25 10:08:38.640662', '2026-05-25 10:08:38.596658', '陪玩订单', '/api/escort/app/order/22/accept/', '{}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'接单成功，您是抢单人，请邀请搭子加入\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (20, NULL, NULL, NULL, '2026-05-25 10:08:45.911624', '2026-05-25 10:08:45.854629', '陪玩订单', '/api/escort/app/order/22/invite_buddy/', '{\'buddy_id\': 6}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'搭子已加入，人数已满，服务开始！\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (21, NULL, NULL, NULL, '2026-05-25 10:13:00.775814', '2026-05-25 10:13:00.749721', '陪玩订单', '/api/escort/app/order/22/confirm_service_done/', '{}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'已确认服务完成，等待您最终确认并完成支付结算\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (22, NULL, NULL, NULL, '2026-05-25 10:13:04.077742', '2026-05-25 10:13:04.024168', '陪玩订单', '/api/escort/app/order/22/confirm_complete/', '{}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'订单已完成，收益已打入打手账户\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (23, NULL, NULL, NULL, '2026-05-25 10:16:42.756319', '2026-05-25 10:16:42.722339', '退款申请', '/api/escort/app/refund/apply/', '{\'order_id\': \'18\', \'reason_type\': \'user_cancel\', \'reason_detail\': \'时间太长了没人接单\'}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'退款申请已提交，请等待审核\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (24, NULL, NULL, NULL, '2026-05-25 10:17:05.549761', '2026-05-25 10:17:04.457534', '退款申请', '/api/escort/web/refund/1/approve/', '{\'review_notes\': \'通过\'}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'退款成功\'}', 1, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (25, NULL, NULL, NULL, '2026-05-25 10:17:05.613208', '2026-05-25 10:17:05.593760', '退款申请', '/api/escort/web/refund/1/execute_refund/', '{}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '400', 'Windows 10', '{\'code\': 400, \'msg\': \'只能对退款失败的单子执行重试\'}', 0, 1);
INSERT INTO `dvadmin_system_operation_log` VALUES (26, NULL, NULL, NULL, '2026-05-25 10:22:22.159668', '2026-05-25 10:22:22.133570', '陪玩订单', '/api/escort/app/order/', '{\'service\': \'14\', \'total_amount\': \'0.10\', \'game_account\': \'312\', \'game_server\': \'123\', \'game_mode\': \'321\', \'special_requirements\': \'\'}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', NULL, 'iOS 15.0', '{\'code\': None, \'msg\': \'订单创建成功\'}', 0, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (27, NULL, NULL, NULL, '2026-05-25 10:22:23.550367', '2026-05-25 10:22:23.108469', '陪玩订单', '/api/escort/app/order/wx_pay/', '{\'order_no\': \'EPC9527D6C902E\'}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'success\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (28, NULL, NULL, NULL, '2026-05-25 10:22:53.626811', '2026-05-25 10:22:53.594811', '退款申请', '/api/escort/app/refund/apply/', '{\'order_id\': \'23\', \'reason_type\': \'user_cancel\', \'reason_detail\': \'下错了订单\'}', 'POST', NULL, '127.0.0.1', 'Mobile Safari 15.0', '2000', 'iOS 15.0', '{\'code\': 2000, \'msg\': \'退款申请已提交，请等待审核\'}', 1, NULL);
INSERT INTO `dvadmin_system_operation_log` VALUES (29, NULL, NULL, NULL, '2026-05-25 10:23:09.439848', '2026-05-25 10:23:08.430836', '退款申请', '/api/escort/web/refund/2/approve/', '{\'review_notes\': \'通过\'}', 'POST', NULL, '127.0.0.1', 'Chrome 148.0.0', '2000', 'Windows 10', '{\'code\': 2000, \'msg\': \'退款成功\'}', 1, 1);

-- ----------------------------
-- Table structure for dvadmin_system_post
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_post`;
CREATE TABLE `dvadmin_system_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `sort` int NOT NULL COMMENT '岗位顺序',
  `status` int NOT NULL COMMENT '岗位状态',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dvadmin_system_post_creator_id_b5ef9351`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_post
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_system_role
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_role`;
CREATE TABLE `dvadmin_system_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限字符',
  `sort` int NOT NULL COMMENT '角色顺序',
  `status` tinyint(1) NOT NULL COMMENT '角色状态',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key` ASC) USING BTREE,
  INDEX `dvadmin_system_role_creator_id_a89a9bc7`(`creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_role
-- ----------------------------
INSERT INTO `dvadmin_system_role` VALUES (1, NULL, '1', NULL, '2026-05-25 09:42:34.442352', '2026-04-02 11:54:41.512000', '管理员', 'admin', 1, 1, NULL);
INSERT INTO `dvadmin_system_role` VALUES (2, NULL, '1', NULL, '2026-05-25 09:42:34.448348', '2026-04-02 11:54:41.525000', '用户', 'public', 2, 1, NULL);

-- ----------------------------
-- Table structure for dvadmin_system_users
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_users`;
CREATE TABLE `dvadmin_system_users`  (
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL COMMENT 'Designates that this user has all permissions without explicitly assigning them.',
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL COMMENT 'Designates whether the user can log into this admin site.',
  `is_active` tinyint(1) NOT NULL COMMENT 'Designates whether this user should be treated as active. Unselect this instead of deleting accounts.',
  `date_joined` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `gender` int NULL DEFAULT NULL COMMENT '性别',
  `user_type` int NULL DEFAULT NULL COMMENT '用户类型',
  `login_error_count` int NOT NULL COMMENT '登录错误次数',
  `pwd_change_count` int NOT NULL COMMENT '密码修改次数',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `current_role_id` bigint NULL DEFAULT NULL COMMENT '当前登录角色',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '关联部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `dvadmin_system_users_creator_id_28556713`(`creator_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_current_role_id_56ce41ce`(`current_role_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_dept_id_b56f71f6`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_users
-- ----------------------------
INSERT INTO `dvadmin_system_users` VALUES ('pbkdf2_sha256$600000$FcJulaT8ceAIUMUiD4asmg$KlaREUBpKkUV3A01UKOxuOhi3IqZoYRqo+3oQ9E66pA=', NULL, 1, '', '', 1, 1, '2026-05-25 09:59:30.630967', 1, NULL, NULL, NULL, '2026-05-25 10:00:03.296959', '2026-05-25 09:59:30.630967', 'superadmin', '974614985@qq.com', '18296642121', NULL, '超级管理员', 0, 0, 0, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dvadmin_system_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_users_groups`;
CREATE TABLE `dvadmin_system_users_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_system_users_groups_users_id_group_id_7460f482_uniq`(`users_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_groups_group_id_42e8a6dc_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_system_users_groups_group_id_42e8a6dc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dvadmin_system_users_users_id_f20fa5bc_fk_dvadmin_s` FOREIGN KEY (`users_id`) REFERENCES `dvadmin_system_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_users_groups
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_system_users_manage_dept
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_users_manage_dept`;
CREATE TABLE `dvadmin_system_users_manage_dept`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `dept_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_system_users_manage_dept_users_id_dept_id_17a55f94_uniq`(`users_id` ASC, `dept_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_manage_dept_users_id_ae9842ec`(`users_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_manage_dept_dept_id_7c352d4a`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_users_manage_dept
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_system_users_post
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_users_post`;
CREATE TABLE `dvadmin_system_users_post`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_system_users_post_users_id_post_id_41f83b22_uniq`(`users_id` ASC, `post_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_post_users_id_8ab2e760`(`users_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_post_post_id_50054985`(`post_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_users_post
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_system_users_role
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_users_role`;
CREATE TABLE `dvadmin_system_users_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_system_users_role_users_id_role_id_02908e92_uniq`(`users_id` ASC, `role_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_role_users_id_a25207bc`(`users_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_role_role_id_e37d9591`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_users_role
-- ----------------------------

-- ----------------------------
-- Table structure for dvadmin_system_users_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `dvadmin_system_users_user_permissions`;
CREATE TABLE `dvadmin_system_users_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dvadmin_system_users_use_users_id_permission_id_24cd72ef_uniq`(`users_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `dvadmin_system_users_permission_id_c8ec58dc_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `dvadmin_system_users_permission_id_c8ec58dc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dvadmin_system_users_users_id_fd3b0217_fk_dvadmin_s` FOREIGN KEY (`users_id`) REFERENCES `dvadmin_system_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dvadmin_system_users_user_permissions
-- ----------------------------
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (1, 1, 1);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (2, 1, 2);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (3, 1, 3);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (4, 1, 4);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (5, 1, 5);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (6, 1, 6);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (7, 1, 7);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (8, 1, 8);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (9, 1, 9);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (10, 1, 10);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (11, 1, 11);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (12, 1, 12);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (13, 1, 13);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (14, 1, 14);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (15, 1, 15);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (16, 1, 16);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (17, 1, 17);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (18, 1, 18);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (19, 1, 19);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (20, 1, 20);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (21, 1, 21);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (22, 1, 22);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (23, 1, 23);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (24, 1, 24);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (25, 1, 25);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (26, 1, 26);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (27, 1, 27);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (28, 1, 28);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (29, 1, 29);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (30, 1, 30);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (31, 1, 31);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (32, 1, 32);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (33, 1, 33);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (34, 1, 34);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (35, 1, 35);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (36, 1, 36);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (37, 1, 37);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (38, 1, 38);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (39, 1, 39);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (40, 1, 40);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (41, 1, 41);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (42, 1, 42);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (43, 1, 43);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (44, 1, 44);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (45, 1, 45);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (46, 1, 46);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (47, 1, 47);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (48, 1, 48);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (49, 1, 49);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (50, 1, 50);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (51, 1, 51);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (52, 1, 52);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (53, 1, 53);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (54, 1, 54);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (55, 1, 55);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (56, 1, 56);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (57, 1, 57);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (58, 1, 58);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (59, 1, 59);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (60, 1, 60);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (61, 1, 61);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (62, 1, 62);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (63, 1, 63);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (64, 1, 64);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (65, 1, 65);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (66, 1, 66);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (67, 1, 67);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (68, 1, 68);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (69, 1, 69);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (70, 1, 70);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (71, 1, 71);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (72, 1, 72);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (73, 1, 73);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (74, 1, 74);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (75, 1, 75);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (76, 1, 76);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (77, 1, 77);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (78, 1, 78);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (79, 1, 79);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (80, 1, 80);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (81, 1, 81);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (82, 1, 82);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (83, 1, 83);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (84, 1, 84);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (85, 1, 85);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (86, 1, 86);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (87, 1, 87);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (88, 1, 88);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (89, 1, 89);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (90, 1, 90);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (91, 1, 91);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (92, 1, 92);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (93, 1, 93);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (94, 1, 94);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (95, 1, 95);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (96, 1, 96);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (97, 1, 97);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (98, 1, 98);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (99, 1, 99);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (100, 1, 100);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (101, 1, 101);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (102, 1, 102);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (103, 1, 103);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (104, 1, 104);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (105, 1, 105);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (106, 1, 106);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (107, 1, 107);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (108, 1, 108);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (109, 1, 109);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (110, 1, 110);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (111, 1, 111);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (112, 1, 112);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (113, 1, 113);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (114, 1, 114);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (115, 1, 115);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (116, 1, 116);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (117, 1, 117);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (118, 1, 118);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (119, 1, 119);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (120, 1, 120);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (121, 1, 121);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (122, 1, 122);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (123, 1, 123);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (124, 1, 124);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (125, 1, 125);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (126, 1, 126);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (127, 1, 127);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (128, 1, 128);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (129, 1, 129);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (130, 1, 130);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (131, 1, 131);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (132, 1, 132);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (133, 1, 133);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (134, 1, 134);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (135, 1, 135);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (136, 1, 136);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (137, 1, 137);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (138, 1, 138);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (139, 1, 139);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (140, 1, 140);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (141, 1, 141);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (142, 1, 142);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (143, 1, 143);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (144, 1, 144);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (145, 1, 145);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (146, 1, 146);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (147, 1, 147);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (148, 1, 148);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (149, 1, 149);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (150, 1, 150);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (151, 1, 151);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (152, 1, 152);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (153, 1, 153);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (154, 1, 154);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (155, 1, 155);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (156, 1, 156);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (157, 1, 157);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (158, 1, 158);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (159, 1, 159);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (160, 1, 160);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (161, 1, 161);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (162, 1, 162);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (163, 1, 163);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (164, 1, 164);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (165, 1, 165);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (166, 1, 166);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (167, 1, 167);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (168, 1, 168);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (169, 1, 169);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (170, 1, 170);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (171, 1, 171);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (172, 1, 172);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (173, 1, 173);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (174, 1, 174);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (175, 1, 175);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (176, 1, 176);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (177, 1, 177);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (178, 1, 178);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (179, 1, 179);
INSERT INTO `dvadmin_system_users_user_permissions` VALUES (180, 1, 180);

SET FOREIGN_KEY_CHECKS = 1;
