/*
Navicat MySQL Data Transfer

Source Server         : ATOM
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : xdlcm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-25 01:36:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_info
-- ----------------------------
DROP TABLE IF EXISTS `auth_info`;
CREATE TABLE `auth_info` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_class` varchar(50) DEFAULT NULL,
  `auth_cn` varchar(50) DEFAULT NULL,
  `server_path` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_info
-- ----------------------------
INSERT INTO `auth_info` VALUES ('100', '菜单管理', '查询', '/menu/queryMenuTreeAll.action');
INSERT INTO `auth_info` VALUES ('101', '菜单管理', '修改', '/menu/updateMenu.action');
INSERT INTO `auth_info` VALUES ('102', '菜单管理', '添加', '/menu/addMenu.action');
INSERT INTO `auth_info` VALUES ('103', '菜单管理', '删除', '/menu/removeMenu.action');
INSERT INTO `auth_info` VALUES ('110', '参数配置管理', '查询', '/param/findParam.action');
INSERT INTO `auth_info` VALUES ('111', '参数配置管理', '查询', '/param/findParamById.action');
INSERT INTO `auth_info` VALUES ('112', '参数配置管理', '添加', '/param/addParam.action');
INSERT INTO `auth_info` VALUES ('113', '参数配置管理', '修改', '/param/updateParam.action');
INSERT INTO `auth_info` VALUES ('114', '参数配置管理', '删除', '/param/removeParam.action');
INSERT INTO `auth_info` VALUES ('115', '参数配置管理', '删除', '/param/removeParams.action');
INSERT INTO `auth_info` VALUES ('120', '机构管理', '查询所有机构信息', '/org/queryApprovedOrgInfos.action');
INSERT INTO `auth_info` VALUES ('121', '机构管理', '添加机构信息', '/org/addOrgInfo.action');
INSERT INTO `auth_info` VALUES ('122', '机构管理', '修改机构信息', '/org/updateOrgInfo.action');
INSERT INTO `auth_info` VALUES ('123', '机构管理', '删除机构信息', '/org/removeOrgInfo.action');
INSERT INTO `auth_info` VALUES ('124', '机构管理', '查询单个机构信息', '/org/queryOrgInfo.action');
INSERT INTO `auth_info` VALUES ('125', '机构管理', '查询机构是否可以删除', '/org/checkIsRemoveOrg.action');
INSERT INTO `auth_info` VALUES ('126', '机构管理', '根据父节点查询机构信息', '/org/queryOrgInfoByParentId.action');
INSERT INTO `auth_info` VALUES ('130', '权限管理', '查询', '/role/findByCondition.action');
INSERT INTO `auth_info` VALUES ('131', '权限管理', '查询', '/role/beforeUpdateRole.action');
INSERT INTO `auth_info` VALUES ('132', '权限管理', '查询', '/role/checkCanRemoveRole.action');
INSERT INTO `auth_info` VALUES ('133', '权限管理', '查询', '/role/beforeUpdateRole.action');
INSERT INTO `auth_info` VALUES ('134', '权限管理', '查询', '/role/loadAuthorityCheckTree.action');
INSERT INTO `auth_info` VALUES ('135', '权限管理', '添加', '/role/addRole.action');
INSERT INTO `auth_info` VALUES ('136', '权限管理', '修改', '/role/updateRole.action');
INSERT INTO `auth_info` VALUES ('137', '权限管理', '修改', '/role/updateRoleEditFlag.action');
INSERT INTO `auth_info` VALUES ('138', '权限管理', '删除', '/role/delRole.action');
INSERT INTO `auth_info` VALUES ('140', '人员管理', '查询', '/user/findByCondition.action');
INSERT INTO `auth_info` VALUES ('141', '人员管理', '查询', '/user/findById.action');
INSERT INTO `auth_info` VALUES ('142', '人员管理', '添加', '/user/addUser.action');
INSERT INTO `auth_info` VALUES ('143', '人员管理', '修改', '/user/updateUser.action');
INSERT INTO `auth_info` VALUES ('144', '人员管理', '删除', '/user/delUser.action');
INSERT INTO `auth_info` VALUES ('145', '人员管理', '查询', '/role/isExitRoleByCreator.action');
INSERT INTO `auth_info` VALUES ('146', '人员管理', '查询', '/user/resetPassword.action');
INSERT INTO `auth_info` VALUES ('147', '人员管理', '查询', '/role/queryRoleInfo.action');
INSERT INTO `auth_info` VALUES ('148', '人员管理', '查询', '/org/queryOrgInfoByParentId.action');
INSERT INTO `auth_info` VALUES ('150', '贷款申请与查询', '贷款申请提交', '/loan/addLoan.action');
INSERT INTO `auth_info` VALUES ('151', '贷款申请与查询', '查询流水信息', '/loan/findByCondition.action');
INSERT INTO `auth_info` VALUES ('152', '贷款申请与查询', '查询单个申请信息', '/loan/findById.action');
INSERT INTO `auth_info` VALUES ('153', '贷款申请与查询', '贷款信息修改', '/loan/updateLoan.action');
INSERT INTO `auth_info` VALUES ('160', '贷款进件处理', '查询流水信息', '/loan/findByCondition.action');
INSERT INTO `auth_info` VALUES ('161', '贷款进件处理', '查询人员', '/user/findByCondition.action');
INSERT INTO `auth_info` VALUES ('162', '贷款进件处理', '查询审核人员下拉列表', '/user/queryReviewUserOptions.action');
INSERT INTO `auth_info` VALUES ('163', '贷款进件处理', '分配审核申请', '/loan/updateLoanJournalDistribution.action');
INSERT INTO `auth_info` VALUES ('170', '贷款审查处理', '查询流水信息', '/loan/findByCondition.action');
INSERT INTO `auth_info` VALUES ('171', '贷款审查处理', '查询贷款信息', '/loan/findById.action');
INSERT INTO `auth_info` VALUES ('172', '贷款审查处理', '拒绝', '/loan/updateLoanJournalRefuse.action');
INSERT INTO `auth_info` VALUES ('173', '贷款审查处理', '补件', '/loan/updateLoanJournalResubmit.action');
INSERT INTO `auth_info` VALUES ('174', '贷款审查处理', '提交审查', '/loan/updateLoanJournalReview.action');
INSERT INTO `auth_info` VALUES ('180', '贷款申请管理', '查询申请流水信息', '/loan/findByCondition.action');
INSERT INTO `auth_info` VALUES ('181', '贷款申请管理', '查询申请信息', '/loan/findById.action');
INSERT INTO `auth_info` VALUES ('182', '贷款申请管理', '不同意', '/loan/updateLoanJournalRefuse.action');
INSERT INTO `auth_info` VALUES ('183', '贷款申请管理', '再议', '/loan/updateLoanJournalResubmit.action');
INSERT INTO `auth_info` VALUES ('184', '贷款申请管理', '同意', '/loan/updateLoanJournal2Review.action');

-- ----------------------------
-- Table structure for bms_param
-- ----------------------------
DROP TABLE IF EXISTS `bms_param`;
CREATE TABLE `bms_param` (
  `param_name` varchar(32) NOT NULL,
  `param_value` varchar(1024) DEFAULT NULL,
  `param_desc` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bms_param
-- ----------------------------
INSERT INTO `bms_param` VALUES ('fileSavePath', 'D:\\fileSavePath', '文件保存路径');
INSERT INTO `bms_param` VALUES ('productImageCountLimit', '10', '产品图片限制数量');
INSERT INTO `bms_param` VALUES ('productVideoCountLimit', '2', '产品视频限制数量');

-- ----------------------------
-- Table structure for loan_application
-- ----------------------------
DROP TABLE IF EXISTS `loan_application`;
CREATE TABLE `loan_application` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `init_time` varchar(20) DEFAULT NULL,
  `process_stat` varchar(30) DEFAULT NULL,
  `cur_process_handler` varchar(30) DEFAULT NULL,
  `cur_process_update_time` varchar(20) DEFAULT NULL,
  `customer_manager` varchar(30) DEFAULT NULL,
  `submite_handler` varchar(30) DEFAULT NULL,
  `examine_handler` varchar(30) DEFAULT NULL,
  `approval_handler` varchar(90) DEFAULT NULL,
  `cur_process_feedback` text,
  `detail` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loan_application
-- ----------------------------
INSERT INTO `loan_application` VALUES ('1', '1', '2018-03-24', '审批成功', null, '2018-03-24', 'test', '-', null, '-', '啊是', '{\"borrowerName\":\"流氓\",\"spouseName\":\"混混\",\"sex\":\"男\",\"credentialNo\":\"530124198611160019\",\"businessTypes\":\"1\",\"amount\":\"10000\",\"term\":\"24\",\"guaranteeMethod\":\"1\",\"isRenew\":\"2\",\"marketer\":\"张三\",\"marketerPost\":\"8\",\"operator\":\"李四\",\"operatorPost\":\"3\",\"syfRemark1\":\"1\",\"syfRemark2\":\"未名城\",\"jydkRemark1\":null,\"jydkRemark2\":null,\"nhxexydkRemark\":null,\"esfajRemark\":null,\"xfdkRemark\":null}');
INSERT INTO `loan_application` VALUES ('2', '1', '2018-03-24', '审批成功', 'spr', '2018-03-24', 'khjl', 'jjr', 'scr', 'spr', '', '{\"borrowerName\":\"阿飞\",\"spouseName\":\"上地啊\",\"sex\":\"男\",\"credentialNo\":\"530124198611160019\",\"businessTypes\":\"2\",\"amount\":\"11222\",\"term\":\"23\",\"guaranteeMethod\":\"2\",\"isRenew\":\"2\",\"marketer\":\"地球人\",\"marketerPost\":\"7\",\"operator\":\"阿达\",\"operatorPost\":\"6\",\"syfRemark1\":null,\"syfRemark2\":null,\"jydkRemark1\":null,\"jydkRemark2\":null,\"nhxexydkRemark\":null,\"esfajRemark\":null,\"xfdkRemark\":\"1\"}');
INSERT INTO `loan_application` VALUES ('3', '1', '2018-03-24', '审批失败，退件', 'spr', '2018-03-25', 'khjl', 'jjr', 'scr', '-', '说是整不成', '{\"borrowerName\":\"爸爸吧\",\"spouseName\":\"麻麻\",\"sex\":\"女\",\"credentialNo\":\"530124198611160019\",\"businessTypes\":\"2\",\"amount\":\"12\",\"term\":\"2\",\"guaranteeMethod\":\"2\",\"isRenew\":\"2\",\"marketer\":\"阿斯顿\",\"marketerPost\":\"10\",\"operator\":\"全额\",\"operatorPost\":\"7\",\"syfRemark1\":null,\"syfRemark2\":null,\"jydkRemark1\":null,\"jydkRemark2\":null,\"nhxexydkRemark\":null,\"esfajRemark\":null,\"xfdkRemark\":\"1\"}');

-- ----------------------------
-- Table structure for loan_journal
-- ----------------------------
DROP TABLE IF EXISTS `loan_journal`;
CREATE TABLE `loan_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `init_time` varchar(20) DEFAULT NULL,
  `process_stat` varchar(30) DEFAULT NULL,
  `cur_process_handler` varchar(30) DEFAULT NULL,
  `cur_process_update_time` varchar(20) DEFAULT NULL,
  `customer_manager` varchar(30) DEFAULT NULL,
  `submite_handler` varchar(30) DEFAULT NULL,
  `examine_handler` varchar(30) DEFAULT NULL,
  `approval_handler` varchar(90) DEFAULT NULL,
  `cur_process_feedback` text,
  `detail` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loan_journal
-- ----------------------------

-- ----------------------------
-- Table structure for loan_online
-- ----------------------------
DROP TABLE IF EXISTS `loan_online`;
CREATE TABLE `loan_online` (
  `online_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) DEFAULT NULL,
  `cur_process_name` varchar(32) DEFAULT NULL,
  `cur_process_status` varchar(2) DEFAULT NULL,
  `cur_process_user` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`online_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loan_online
-- ----------------------------

-- ----------------------------
-- Table structure for loan_user
-- ----------------------------
DROP TABLE IF EXISTS `loan_user`;
CREATE TABLE `loan_user` (
  `user_name` varchar(32) NOT NULL,
  `loan_id` int(11) NOT NULL,
  PRIMARY KEY (`user_name`,`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loan_user
-- ----------------------------

-- ----------------------------
-- Table structure for menu_auth
-- ----------------------------
DROP TABLE IF EXISTS `menu_auth`;
CREATE TABLE `menu_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `auth_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_auth
-- ----------------------------
INSERT INTO `menu_auth` VALUES ('1', '3', '100');
INSERT INTO `menu_auth` VALUES ('2', '3', '101');
INSERT INTO `menu_auth` VALUES ('3', '3', '102');
INSERT INTO `menu_auth` VALUES ('4', '3', '103');
INSERT INTO `menu_auth` VALUES ('5', '4', '110');
INSERT INTO `menu_auth` VALUES ('6', '4', '111');
INSERT INTO `menu_auth` VALUES ('7', '4', '112');
INSERT INTO `menu_auth` VALUES ('8', '4', '113');
INSERT INTO `menu_auth` VALUES ('9', '4', '114');
INSERT INTO `menu_auth` VALUES ('10', '4', '115');
INSERT INTO `menu_auth` VALUES ('11', '6', '120');
INSERT INTO `menu_auth` VALUES ('12', '6', '121');
INSERT INTO `menu_auth` VALUES ('13', '6', '122');
INSERT INTO `menu_auth` VALUES ('14', '6', '123');
INSERT INTO `menu_auth` VALUES ('15', '6', '124');
INSERT INTO `menu_auth` VALUES ('16', '6', '125');
INSERT INTO `menu_auth` VALUES ('17', '6', '126');
INSERT INTO `menu_auth` VALUES ('18', '7', '130');
INSERT INTO `menu_auth` VALUES ('19', '7', '131');
INSERT INTO `menu_auth` VALUES ('20', '7', '132');
INSERT INTO `menu_auth` VALUES ('21', '7', '133');
INSERT INTO `menu_auth` VALUES ('22', '7', '134');
INSERT INTO `menu_auth` VALUES ('23', '7', '135');
INSERT INTO `menu_auth` VALUES ('24', '7', '136');
INSERT INTO `menu_auth` VALUES ('25', '7', '137');
INSERT INTO `menu_auth` VALUES ('26', '7', '138');
INSERT INTO `menu_auth` VALUES ('27', '8', '140');
INSERT INTO `menu_auth` VALUES ('28', '8', '141');
INSERT INTO `menu_auth` VALUES ('29', '8', '142');
INSERT INTO `menu_auth` VALUES ('30', '8', '143');
INSERT INTO `menu_auth` VALUES ('31', '8', '144');
INSERT INTO `menu_auth` VALUES ('32', '8', '145');
INSERT INTO `menu_auth` VALUES ('33', '8', '146');
INSERT INTO `menu_auth` VALUES ('34', '8', '147');
INSERT INTO `menu_auth` VALUES ('35', '8', '148');
INSERT INTO `menu_auth` VALUES ('36', '10', '150');
INSERT INTO `menu_auth` VALUES ('37', '10', '151');
INSERT INTO `menu_auth` VALUES ('38', '10', '152');
INSERT INTO `menu_auth` VALUES ('39', '11', '160');
INSERT INTO `menu_auth` VALUES ('40', '11', '161');
INSERT INTO `menu_auth` VALUES ('41', '11', '162');
INSERT INTO `menu_auth` VALUES ('42', '11', '163');
INSERT INTO `menu_auth` VALUES ('43', '12', '170');
INSERT INTO `menu_auth` VALUES ('44', '12', '171');
INSERT INTO `menu_auth` VALUES ('45', '12', '172');
INSERT INTO `menu_auth` VALUES ('46', '12', '173');
INSERT INTO `menu_auth` VALUES ('47', '12', '174');
INSERT INTO `menu_auth` VALUES ('48', '13', '180');
INSERT INTO `menu_auth` VALUES ('49', '13', '181');
INSERT INTO `menu_auth` VALUES ('50', '13', '182');
INSERT INTO `menu_auth` VALUES ('51', '13', '183');
INSERT INTO `menu_auth` VALUES ('52', '13', '184');
INSERT INTO `menu_auth` VALUES ('53', '10', '153');

-- ----------------------------
-- Table structure for menu_tree
-- ----------------------------
DROP TABLE IF EXISTS `menu_tree`;
CREATE TABLE `menu_tree` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `menu_text` varchar(60) DEFAULT NULL,
  `icon_text` varchar(20) DEFAULT NULL,
  `node_type` int(11) DEFAULT NULL,
  `url_text` varchar(256) DEFAULT NULL,
  `order_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_tree
-- ----------------------------
INSERT INTO `menu_tree` VALUES ('1', null, '监控', 'r', '0', null, null);
INSERT INTO `menu_tree` VALUES ('2', '1', '开发维护', 'fa-tasks', '0', null, null);
INSERT INTO `menu_tree` VALUES ('3', '2', '菜单管理', '', '1', '/nfcm/menu/menu.html', null);
INSERT INTO `menu_tree` VALUES ('4', '2', '参数配置管理', '', '1', '/nfcm/param/param.html', null);
INSERT INTO `menu_tree` VALUES ('5', '1', '基础管理', 'icon-group', '0', null, null);
INSERT INTO `menu_tree` VALUES ('6', '5', '机构管理', '', '1', '/nfcm/org/org.html', null);
INSERT INTO `menu_tree` VALUES ('7', '5', '权限管理', '', '1', '/nfcm/role/role.html', null);
INSERT INTO `menu_tree` VALUES ('8', '5', '人员管理', '', '1', '/nfcm/user/user.html', null);
INSERT INTO `menu_tree` VALUES ('9', '1', '贷款申请管理', 'icon-file-text', '0', '', null);
INSERT INTO `menu_tree` VALUES ('10', '9', '贷款申请与查询', '', '1', '/nfcm/loanAppCommit/loanAppCommit.html', null);
INSERT INTO `menu_tree` VALUES ('11', '9', '贷款进件处理', '', '1', '/nfcm/loanAppDistribute/loanAppDistribute.html', null);
INSERT INTO `menu_tree` VALUES ('12', '9', '贷款审查处理', '', '1', '/nfcm/loanAppExamine/loanAppExamine.html', null);
INSERT INTO `menu_tree` VALUES ('13', '9', '贷款审批处理', '', '1', '/nfcm/loanApp2Examine/loanApp2Examine.html', null);

-- ----------------------------
-- Table structure for org_info
-- ----------------------------
DROP TABLE IF EXISTS `org_info`;
CREATE TABLE `org_info` (
  `org_id` int(32) NOT NULL AUTO_INCREMENT,
  `parent_id` int(32) DEFAULT NULL,
  `org_code` varchar(30) NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `org_addr` varchar(100) DEFAULT NULL,
  `org_manager` varchar(30) DEFAULT NULL,
  `org_telephone` varchar(20) DEFAULT NULL,
  `org_path` varchar(50) DEFAULT NULL,
  `editor` varchar(30) DEFAULT NULL,
  `approver` varchar(30) DEFAULT NULL,
  `approval_time` varchar(20) DEFAULT NULL,
  `last_edit_time` varchar(20) DEFAULT NULL,
  `edit_flag` varchar(1) DEFAULT NULL,
  `area_code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_info
-- ----------------------------
INSERT INTO `org_info` VALUES ('1', null, '000000000', '总部', null, null, null, '00001', '', '', '', '', '0', null);

-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `auth_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_auth
-- ----------------------------
INSERT INTO `role_auth` VALUES ('1', '1', '100');
INSERT INTO `role_auth` VALUES ('2', '1', '101');
INSERT INTO `role_auth` VALUES ('3', '1', '102');
INSERT INTO `role_auth` VALUES ('4', '1', '103');
INSERT INTO `role_auth` VALUES ('5', '1', '110');
INSERT INTO `role_auth` VALUES ('6', '1', '111');
INSERT INTO `role_auth` VALUES ('7', '1', '112');
INSERT INTO `role_auth` VALUES ('8', '1', '113');
INSERT INTO `role_auth` VALUES ('9', '1', '114');
INSERT INTO `role_auth` VALUES ('10', '1', '115');
INSERT INTO `role_auth` VALUES ('11', '999', '120');
INSERT INTO `role_auth` VALUES ('12', '999', '121');
INSERT INTO `role_auth` VALUES ('13', '999', '122');
INSERT INTO `role_auth` VALUES ('14', '999', '123');
INSERT INTO `role_auth` VALUES ('15', '999', '124');
INSERT INTO `role_auth` VALUES ('16', '999', '125');
INSERT INTO `role_auth` VALUES ('17', '999', '126');
INSERT INTO `role_auth` VALUES ('18', '999', '130');
INSERT INTO `role_auth` VALUES ('19', '999', '131');
INSERT INTO `role_auth` VALUES ('20', '999', '132');
INSERT INTO `role_auth` VALUES ('21', '999', '133');
INSERT INTO `role_auth` VALUES ('22', '999', '134');
INSERT INTO `role_auth` VALUES ('23', '999', '135');
INSERT INTO `role_auth` VALUES ('24', '999', '136');
INSERT INTO `role_auth` VALUES ('25', '999', '137');
INSERT INTO `role_auth` VALUES ('26', '999', '138');
INSERT INTO `role_auth` VALUES ('27', '999', '140');
INSERT INTO `role_auth` VALUES ('28', '999', '141');
INSERT INTO `role_auth` VALUES ('29', '999', '142');
INSERT INTO `role_auth` VALUES ('30', '999', '143');
INSERT INTO `role_auth` VALUES ('31', '999', '144');
INSERT INTO `role_auth` VALUES ('32', '999', '145');
INSERT INTO `role_auth` VALUES ('33', '999', '146');
INSERT INTO `role_auth` VALUES ('34', '999', '147');
INSERT INTO `role_auth` VALUES ('35', '999', '148');
INSERT INTO `role_auth` VALUES ('36', '1000', '120');
INSERT INTO `role_auth` VALUES ('37', '1000', '121');
INSERT INTO `role_auth` VALUES ('38', '1000', '122');
INSERT INTO `role_auth` VALUES ('39', '1000', '123');
INSERT INTO `role_auth` VALUES ('40', '1000', '124');
INSERT INTO `role_auth` VALUES ('41', '1000', '125');
INSERT INTO `role_auth` VALUES ('42', '1000', '126');
INSERT INTO `role_auth` VALUES ('43', '1000', '130');
INSERT INTO `role_auth` VALUES ('44', '1000', '131');
INSERT INTO `role_auth` VALUES ('45', '1000', '132');
INSERT INTO `role_auth` VALUES ('46', '1000', '133');
INSERT INTO `role_auth` VALUES ('47', '1000', '134');
INSERT INTO `role_auth` VALUES ('48', '1000', '135');
INSERT INTO `role_auth` VALUES ('49', '1000', '136');
INSERT INTO `role_auth` VALUES ('50', '1000', '137');
INSERT INTO `role_auth` VALUES ('51', '1000', '138');
INSERT INTO `role_auth` VALUES ('52', '1000', '140');
INSERT INTO `role_auth` VALUES ('53', '1000', '141');
INSERT INTO `role_auth` VALUES ('54', '1000', '142');
INSERT INTO `role_auth` VALUES ('55', '1000', '143');
INSERT INTO `role_auth` VALUES ('56', '1000', '144');
INSERT INTO `role_auth` VALUES ('57', '1000', '145');
INSERT INTO `role_auth` VALUES ('58', '1000', '146');
INSERT INTO `role_auth` VALUES ('59', '1000', '147');
INSERT INTO `role_auth` VALUES ('60', '1000', '148');
INSERT INTO `role_auth` VALUES ('61', '1000', '150');
INSERT INTO `role_auth` VALUES ('62', '1000', '151');
INSERT INTO `role_auth` VALUES ('63', '1000', '152');
INSERT INTO `role_auth` VALUES ('64', '1000', '153');
INSERT INTO `role_auth` VALUES ('65', '1000', '160');
INSERT INTO `role_auth` VALUES ('66', '1000', '161');
INSERT INTO `role_auth` VALUES ('67', '1000', '162');
INSERT INTO `role_auth` VALUES ('68', '1000', '163');
INSERT INTO `role_auth` VALUES ('69', '1000', '170');
INSERT INTO `role_auth` VALUES ('70', '1000', '171');
INSERT INTO `role_auth` VALUES ('71', '1000', '172');
INSERT INTO `role_auth` VALUES ('72', '1000', '173');
INSERT INTO `role_auth` VALUES ('73', '1000', '174');
INSERT INTO `role_auth` VALUES ('74', '1000', '180');
INSERT INTO `role_auth` VALUES ('75', '1000', '181');
INSERT INTO `role_auth` VALUES ('76', '1000', '182');
INSERT INTO `role_auth` VALUES ('77', '1000', '183');
INSERT INTO `role_auth` VALUES ('78', '1000', '184');
INSERT INTO `role_auth` VALUES ('84', '1002', '150');
INSERT INTO `role_auth` VALUES ('85', '1002', '151');
INSERT INTO `role_auth` VALUES ('86', '1002', '152');
INSERT INTO `role_auth` VALUES ('87', '1002', '153');
INSERT INTO `role_auth` VALUES ('88', '1003', '151');
INSERT INTO `role_auth` VALUES ('89', '1003', '152');
INSERT INTO `role_auth` VALUES ('90', '1003', '160');
INSERT INTO `role_auth` VALUES ('91', '1003', '161');
INSERT INTO `role_auth` VALUES ('92', '1003', '162');
INSERT INTO `role_auth` VALUES ('93', '1003', '163');
INSERT INTO `role_auth` VALUES ('94', '1004', '151');
INSERT INTO `role_auth` VALUES ('95', '1004', '152');
INSERT INTO `role_auth` VALUES ('96', '1004', '180');
INSERT INTO `role_auth` VALUES ('97', '1004', '181');
INSERT INTO `role_auth` VALUES ('98', '1004', '182');
INSERT INTO `role_auth` VALUES ('99', '1004', '183');
INSERT INTO `role_auth` VALUES ('100', '1004', '184');
INSERT INTO `role_auth` VALUES ('103', '1005', '151');
INSERT INTO `role_auth` VALUES ('104', '1005', '152');
INSERT INTO `role_auth` VALUES ('105', '1005', '170');
INSERT INTO `role_auth` VALUES ('106', '1005', '171');
INSERT INTO `role_auth` VALUES ('107', '1005', '172');
INSERT INTO `role_auth` VALUES ('108', '1005', '173');
INSERT INTO `role_auth` VALUES ('109', '1005', '174');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_desc` varchar(128) DEFAULT NULL,
  `role_creator` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '开发者', '菜单管理参数管理', null);
INSERT INTO `role_info` VALUES ('999', '权限管理员', '用户权限管理', null);
INSERT INTO `role_info` VALUES ('1000', '测试用', '测试用的', 'admin');
INSERT INTO `role_info` VALUES ('1002', '客户经理', '客户经理', 'test');
INSERT INTO `role_info` VALUES ('1003', '进件处理人员', '进件处理人员', 'test');
INSERT INTO `role_info` VALUES ('1004', '审批人员', '审批人员', 'test');
INSERT INTO `role_info` VALUES ('1005', '审查人员', '审查人员', 'test');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1', '3');
INSERT INTO `role_menu` VALUES ('2', '1', '2');
INSERT INTO `role_menu` VALUES ('3', '1', '4');
INSERT INTO `role_menu` VALUES ('4', '999', '5');
INSERT INTO `role_menu` VALUES ('5', '999', '6');
INSERT INTO `role_menu` VALUES ('6', '999', '7');
INSERT INTO `role_menu` VALUES ('7', '999', '8');
INSERT INTO `role_menu` VALUES ('8', '1000', '6');
INSERT INTO `role_menu` VALUES ('9', '1000', '7');
INSERT INTO `role_menu` VALUES ('10', '1000', '8');
INSERT INTO `role_menu` VALUES ('11', '1000', '10');
INSERT INTO `role_menu` VALUES ('12', '1000', '11');
INSERT INTO `role_menu` VALUES ('13', '1000', '12');
INSERT INTO `role_menu` VALUES ('14', '1000', '13');
INSERT INTO `role_menu` VALUES ('15', '1000', '5');
INSERT INTO `role_menu` VALUES ('16', '1000', '9');
INSERT INTO `role_menu` VALUES ('21', '1002', '10');
INSERT INTO `role_menu` VALUES ('22', '1002', '9');
INSERT INTO `role_menu` VALUES ('23', '1003', '10');
INSERT INTO `role_menu` VALUES ('24', '1003', '11');
INSERT INTO `role_menu` VALUES ('25', '1003', '9');
INSERT INTO `role_menu` VALUES ('29', '1004', '10');
INSERT INTO `role_menu` VALUES ('30', '1004', '13');
INSERT INTO `role_menu` VALUES ('31', '1004', '9');
INSERT INTO `role_menu` VALUES ('35', '1005', '10');
INSERT INTO `role_menu` VALUES ('36', '1005', '12');
INSERT INTO `role_menu` VALUES ('37', '1005', '9');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_name` varchar(32) NOT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `mobile_phone` varchar(20) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `register_time` varchar(19) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `org_path` varchar(50) DEFAULT NULL,
  `user_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('admin', '管理员', '72axtmmITGvJO0kkRZmlVg==', null, null, null, null, null, '1', '00001', null);
INSERT INTO `user_info` VALUES ('developer', '开发者', 'RmHwWuxImWE1UQwwECFNkQ==', null, null, null, null, null, '1', '00001', null);
INSERT INTO `user_info` VALUES ('jjr', '进件处理人', 'Zi0WiavblE/lvvoj2hpO2Q==', '13888815271', 'ljx260403530@qq.com', '男', null, '2018-03-24 23:18:31', '1', '00001', '2');
INSERT INTO `user_info` VALUES ('khjl', '客户经理', 'JDVqVoUPJXpsfRo3iM6aRQ==', '13888815271', 'wanghong@nantian.com.cn', '男', null, '2018-03-24 23:17:32', '1', '00001', '1');
INSERT INTO `user_info` VALUES ('scr', '审查人员', 'unmjSOrA1/uEDeYJPd9g6w==', '13888815271', 'ljx260403530@qq.com', '男', null, '2018-03-24 23:21:33', '1', '00001', '3');
INSERT INTO `user_info` VALUES ('scr1', '打酱油的', 'DFDin7IS6aXru/7vtdiBjA==', '13888815271', 'ljx260403530@qq.com', '男', null, '2018-03-25 00:49:05', '1', '00001', '3');
INSERT INTO `user_info` VALUES ('spr', '审批人员', '4bel4lgon1hroB0ahPJHxQ==', '13888815271', 'ljx260403530@qq.com', '男', null, '2018-03-24 23:19:07', '1', '00001', '4');
INSERT INTO `user_info` VALUES ('test', '李飞', '0KC1LVCoSf1Nacqky50J/g==', '13888815271', 'ljx260403530@qq.com', '男', null, '2018-03-24 20:18:53', '1', '00001', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', 'developer');
INSERT INTO `user_role` VALUES ('2', '999', 'admin');
INSERT INTO `user_role` VALUES ('3', '1000', 'test');
INSERT INTO `user_role` VALUES ('5', '1002', 'khjl');
INSERT INTO `user_role` VALUES ('6', '1003', 'jjr');
INSERT INTO `user_role` VALUES ('7', '1004', 'spr');
INSERT INTO `user_role` VALUES ('8', '1005', 'scr');
INSERT INTO `user_role` VALUES ('9', '1005', 'scr1');
