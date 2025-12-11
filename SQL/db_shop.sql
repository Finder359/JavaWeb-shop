/*
 Navicat Premium Data Transfer

 Source Server         : Ubuntu-Mysql
 Source Server Type    : MySQL
 Source Server Version : 80044
 Source Host           : 127.0.0.1:3306
 Source Schema         : db_shop

 Target Server Type    : MySQL
 Target Server Version : 80044
 File Encoding         : 65001

 Date: 11/12/2025 17:13:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pwd` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES (1, 'admin', '123456');
INSERT INTO `admin_info` VALUES (2, 'ccc', '123456');
INSERT INTO `admin_info` VALUES (3, 'ddd', '123456');
INSERT INTO `admin_info` VALUES (4, 'eee', '123456');
INSERT INTO `admin_info` VALUES (5, 'fff', '123456');
INSERT INTO `admin_info` VALUES (6, '烦烦烦啊233', '123456');
INSERT INTO `admin_info` VALUES (7, 'hhhh', '123456');
INSERT INTO `admin_info` VALUES (9, 'thy', '123456');
INSERT INTO `admin_info` VALUES (10, 'lyh', '123456');
INSERT INTO `admin_info` VALUES (15, 'Finder', '123456');
INSERT INTO `admin_info` VALUES (16, '测试用户1', '123');
INSERT INTO `admin_info` VALUES (17, '玻璃拌蜂蜜', '123');
INSERT INTO `admin_info` VALUES (23, '@C_ZE_HHH', '111');
INSERT INTO `admin_info` VALUES (28, 'test', '1');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `o_id` int NOT NULL,
  `p_id` int NOT NULL,
  `num` int NULL DEFAULT NULL,
  PRIMARY KEY (`o_id`, `p_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (5, 10, 1);
INSERT INTO `order_detail` VALUES (6, 7, 1);
INSERT INTO `order_detail` VALUES (7, 10, 1);
INSERT INTO `order_detail` VALUES (8, 13, 1);
INSERT INTO `order_detail` VALUES (9, 12, 1);
INSERT INTO `order_detail` VALUES (10, 14, 1);

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `status` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ordertime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (5, 3, '已完成', '2025-12-08 20:20:20');
INSERT INTO `order_info` VALUES (6, 3, '已发货', '2025-12-08 21:40:02');
INSERT INTO `order_info` VALUES (7, 3, '已提交', '2025-12-09 17:36:45');
INSERT INTO `order_info` VALUES (8, 3, '已提交', '2025-12-09 17:40:48');
INSERT INTO `order_info` VALUES (9, 3, '已提交', '2025-12-09 20:42:38');
INSERT INTO `order_info` VALUES (10, 4, '已提交', '2025-12-09 20:48:11');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `brand` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `num` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '商品数量',
  `price` decimal(10, 0) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '商品单价',
  `sale` decimal(10, 0) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '促销减价',
  `intro` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '商品介绍',
  `status` int NULL DEFAULT 1 COMMENT '商品状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (6, 'A20001', '雷朋 Ray-Ban 飞行员经典太阳镜 RB3025', '太阳镜', 'Ray-Ban', '/front/images/pic1.jpg', 00000000150, 0000001299, 0000000100, '<p>经典金框飞行员设计，百搭必备。</p>', 1);
INSERT INTO `product_info` VALUES (7, 'A20002', '雷朋 Ray-Ban 小方框太阳镜 RB3447', '太阳镜', 'Ray-Ban', '/front/images/pic2.jpg', 00000000120, 0000001180, 0000000080, '<p>轻薄金属框架，复古圆形镜片。</p>', 1);
INSERT INTO `product_info` VALUES (8, 'A20003', 'Oakley 奥克利 运动偏光太阳镜 OO9208', '太阳镜', 'Oakley', '/front/images/pic3.jpg', 00000000090, 0000001590, 0000000100, '<p>适合户外运动，高强度抗冲击镜片。</p>', 1);
INSERT INTO `product_info` VALUES (9, 'A20004', 'Oakley 奥克利 Frogskins 休闲偏光镜', '太阳镜', 'Oakley', '/front/images/pic4.jpg', 00000000110, 0000000880, 0000000050, '<p>轻量镜框，潮流配色，日常穿搭神器。</p>', 1);
INSERT INTO `product_info` VALUES (10, 'A20005', '暴龙 Bolon 时尚猫眼女款太阳镜 BJ7201', '太阳镜', 'Bolon', '/front/images/pic5.jpg', 00000000200, 0000000768, 0000000080, '<p>优雅猫眼造型，女性魅力提升。</p>', 1);
INSERT INTO `product_info` VALUES (11, 'A20006', '暴龙 Bolon 运动男款偏光太阳镜 BL3105', '太阳镜', 'Bolon', '/front/images/pic6.jpg', 00000000170, 0000000899, 0000000060, '<p>偏光镜片有效阻隔眩光，驾车利器。</p>', 1);
INSERT INTO `product_info` VALUES (12, 'A20007', 'JINS 轻量 TR90 圆框防蓝光眼镜 JN102', '防蓝光', 'JINS', '/front/images/pic7.jpg', 00000000300, 0000000399, 0000000030, '<p>长时间电脑办公保护眼睛。</p>', 1);
INSERT INTO `product_info` VALUES (13, 'A20008', 'JINS 多边形金属框时尚眼镜 JN205', '光学镜架', 'JINS', '/front/images/pic8.jpg', 00000000260, 0000000480, 0000000050, '<p>新潮多边形造型，适配多种脸型。</p>', 1);
INSERT INTO `product_info` VALUES (14, 'A20009', '古驰 Gucci GG0061S 大框女士太阳镜', '太阳镜', 'Gucci', '/front/images/pic1.jpg', 00000000050, 0000002499, 0000000150, '<p>奢侈品高端镜架，彰显个性魅力。</p>', 1);
INSERT INTO `product_info` VALUES (15, 'A20010', '古驰 Gucci GG0214S 男士方框太阳镜', '太阳镜', 'Gucci', '/front/images/pic2.jpg', 00000000060, 0000002699, 0000000200, '<p>沉稳大气风格，商务休闲皆宜。</p>', 1);
INSERT INTO `product_info` VALUES (16, 'A20011', 'Gentle Monster TAMBURIN 复古墨镜', '太阳镜', 'Gentle Monster', '/front/images/pic3.jpg', 00000000080, 0000001599, 0000000100, '<p>潮流品牌高街风格，明星同款。</p>', 1);
INSERT INTO `product_info` VALUES (17, 'A20012', 'Gentle Monster ROCOCO 透明框太阳镜', '太阳镜', 'Gentle Monster', '/front/images/pic4.jpg', 00000000070, 0000001699, 0000000120, '<p>清新透明配色，街拍神器。</p>', 1);
INSERT INTO `product_info` VALUES (18, 'A20013', 'MOLSION 陌森 时尚偏光墨镜 MS7006', '太阳镜', 'MOLSION', '/front/images/pic5.jpg', 00000000200, 0000000599, 0000000050, '<p>偏光镜片减少道路反光，驾驶必备。</p>', 1);
INSERT INTO `product_info` VALUES (19, 'A20014', 'MOLSION 陌森 潮流大框女款太阳镜 MS8021', '太阳镜', 'MOLSION', '/front/images/pic6.jpg', 00000000180, 0000000659, 0000000060, '<p>大框显脸小设计，都市潮流风。</p>', 1);
INSERT INTO `product_info` VALUES (20, 'A20015', '雷朋 Ray-Ban Wayfarer 经典太阳镜 RB2140', '太阳镜', 'Ray-Ban', '/front/images/pic7.jpg', 00000000140, 0000001290, 0000000100, '<p>Wayfarer 经典造型，永不过时。</p>', 1);
INSERT INTO `product_info` VALUES (21, 'A20016', 'Oakley 奥克利 Holbrook 偏光太阳镜 OO9102', '太阳镜', 'Oakley', '/front/images/pic8.jpg', 00000000100, 0000001280, 0000000080, '<p>结合复古风与运动风的热门款式。</p>', 1);
INSERT INTO `product_info` VALUES (22, 'A20017', '暴龙 Bolon 多边形轻奢女士太阳镜 BL708', '太阳镜', 'Bolon', '/front/images/pic.jpg', 00000000150, 0000000860, 0000000070, '<p>轻奢材质，突显女性优雅格调。</p>', 1);
INSERT INTO `product_info` VALUES (23, 'A20018', 'JINS Airframe 超轻眼镜架 JN330', '光学镜架', 'JINS', '/front/images/pic2.jpg', 00000000350, 0000000299, 0000000020, '<p>超轻重量，几乎无佩戴感。</p>', 1);
INSERT INTO `product_info` VALUES (24, 'A20019', '雷朋 Ray-Ban CLUBMASTER 经典半框 RB3016', '太阳镜', 'Ray-Ban', '/front/images/pic3.jpg', 00000000120, 0000001450, 0000000090, '<p>复古半框设计，是潮流人士首选。</p>', 1);
INSERT INTO `product_info` VALUES (25, 'A20020', 'Gentle Monster LANG 透明风格太阳镜', '太阳镜', 'Gentle Monster', '/front/images/pic4.jpg', 00000000080, 0000001499, 0000000100, '<p>极简透明设计，韩系风格代表款。</p>', 1);

-- ----------------------------
-- Table structure for product_info_copy1
-- ----------------------------
DROP TABLE IF EXISTS `product_info_copy1`;
CREATE TABLE `product_info_copy1`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `brand` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `num` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '商品数量',
  `price` decimal(10, 0) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '商品单价',
  `sale` decimal(10, 0) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '促销减价',
  `intro` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '商品介绍',
  `status` int NULL DEFAULT 1 COMMENT '商品状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info_copy1
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `realName` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `question` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `answer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `favorate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `score` int UNSIGNED NULL DEFAULT 0,
  `regDate` date NULL DEFAULT NULL,
  `status` int NULL DEFAULT 1,
  `vip` int NULL DEFAULT 0 COMMENT 'VIP标识: 0=普通用户, 1=VIP用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (3, 'lyh', '123456', '路', '男', '招远市', '您的出生地是？', '招远市', '13853516630', '185男大', 0, '2025-12-06', 1, 1);
INSERT INTO `user_info` VALUES (4, 'thy', '123456', '田', '男', '33333', '您的出生地是？', '1111', '13853516630', '123', 0, '2025-12-06', 1, 1);
INSERT INTO `user_info` VALUES (5, 'tom', '123456', '王小二', '男', '江苏省苏州市吴中区', NULL, NULL, '13922222222', '111111', 0, '2025-12-09', 1, 0);
INSERT INTO `user_info` VALUES (6, 'test1', '123', '无脸男', '男', '33333', NULL, NULL, '13922222222', '123', 0, '2025-12-09', 1, 0);
INSERT INTO `user_info` VALUES (7, 'test', '123456', '测试用户', '男', '江苏省苏州市吴中区', NULL, NULL, '13922222222', '', 0, '2025-12-09', 1, 0);

-- ----------------------------
-- Procedure structure for sp_sale
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sale`;
delimiter ;;
CREATE PROCEDURE `sp_sale`(IN `n` int)
BEGIN
select p.id as id,p.name ,sum(od.num) as total,sum(od.num) * price as money 
FROM order_detail od,product_info p 
where p.id = od.p_id 
GROUP BY p.id,p.name,price ORDER BY total DESC ;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
